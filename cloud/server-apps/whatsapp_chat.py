"""
Server-side WhatsApp chat console (console 8) for HDN Server.

A PETSCII WhatsApp client rendered into a 40x25 C64 screen-code back-buffer.
Features: phone-pairing-code login, chat list, message view & compose,
contacts list, settings page, help screen.

Uses neonize (Python bindings for the whatsmeow Go library) on the server
for unofficial WhatsApp multi-device access. All input arrives as PETSCII
key-presses from the C64 client. Invoked from C64 by pressing CBM+CTRL+8.

IMPORTANT -- read before using: neonize/whatsmeow is an UNOFFICIAL client.
WhatsApp does not provide a personal-account API, so this console talks to
WhatsApp's servers the same way WhatsApp Web does, without WhatsApp's
blessing. That carries a real risk that WhatsApp may flag or ban the linked
account -- test with a throwaway/secondary number first, not your primary
phone number. See docs/user_manual/whatsapp-chat.md for details.
"""

import asyncio
import logging
import os
import queue
import threading
import time
from dataclasses import dataclass
from datetime import timezone, timedelta
from typing import Dict, List, Optional

from sdk.network_helper import send_screen_data
from sdk.server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    char_to_screencode,
    transliterate,
)
from sdk.generate_pet_asc_table import Petscii

logger = logging.getLogger(__name__)

# ── C64 colour constants ────────────────────────────────────────────
COL_BLACK = 0
COL_WHITE = 1
COL_RED = 2
COL_CYAN = 3
COL_PURPLE = 4
COL_GREEN = 5
COL_BLUE = 6
COL_YELLOW = 7
COL_ORANGE = 8
COL_BROWN = 9
COL_LIGHT_RED = 10
COL_DARK_GREY = 11
COL_GREY = 12
COL_LIGHT_GREEN = 13
COL_LIGHT_BLUE = 14
COL_LIGHT_GREY = 15

# Screen appearance
COL_TITLE_FG = COL_WHITE
COL_STATUS_FG = COL_LIGHT_GREY
COL_TEXT_FG = COL_LIGHT_BLUE
COL_INPUT_FG = COL_LIGHT_GREEN
COL_HELP_FG = COL_LIGHT_GREY
COL_SELECTED_FG = COL_YELLOW
COL_SENDER_FG = COL_CYAN
COL_OUTGOING_FG = COL_LIGHT_BLUE
COL_INCOMING_FG = COL_WHITE
COL_UNREAD_FG = COL_YELLOW
COL_ERROR_FG = COL_RED
COL_LABEL_FG = COL_LIGHT_GREY
COL_GROUP_FG = COL_GREEN
COL_FIELD_FG = COL_WHITE

# Special screen codes
SC_SPACE = 0x20
SC_LBRACKET = 0x1B  # [
SC_RBRACKET = 0x1D  # ]
SC_REVERSE_BIT = 0x80
SC_HLINE = 0x63

# ── PETSCII key constants ───────────────────────────────────────────
KEY_RETURN = 0x0D
KEY_DEL = 0x14
KEY_SPACE = 0x20
KEY_RUNSTOP = 0x03
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_CRSR_RT = 0x1D
KEY_CRSR_LT = 0x9D
KEY_LEFT_ARROW = 0x5F
KEY_HOME = 0x13
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F4 = 0x8A
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C

# Modifier flags
MOD_COMMODORE = 0x04

# Input area limits
MAX_INPUT_LINES = 10

# ── WhatsApp chat modes ──────────────────────────────────────────────
MODE_LOGIN = 0
MODE_CHATS = 1
MODE_CHAT_VIEW = 2
MODE_CONTACTS = 3
MODE_SETTINGS = 4
MODE_HELP = 5

# ── Login sub-states ─────────────────────────────────────────────────
# WhatsApp's phone-pairing-code login has no code-you-type / 2FA step:
# we ask WhatsApp for an 8-char code and the user types THAT into their
# phone, so there are only two states (fewer than Telegram's three).
LOGIN_PHONE = 0
LOGIN_PAIRING = 1

# ── Layout ───────────────────────────────────────────────────────────
TITLE_ROW = 0
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1  # 23
STATUS_ROW = 24
INPUT_ROW = 24
MAX_INPUT_LEN = 200
MAX_MESSAGES = 50
MAX_DIALOGS = 100

# ── Help screen content ─────────────────────────────────────────────
HELP_LINES = [
    "=== WHATSAPP CHAT HELP   F8=close ===",
    "",
    " ACCOUNT BAN RISK -- PLEASE READ",
    " This uses an UNOFFICIAL WhatsApp",
    " client (neonize/whatsmeow), not a",
    " WhatsApp-blessed API. WhatsApp may",
    " flag or ban a linked account for",
    " this kind of access. Test with a",
    " spare/secondary number first, not",
    " your primary phone number.",
    "",
    " CHAT LIST (F1)",
    " UP/DOWN     Select chat",
    " F5/F3       Page down/up",
    " RETURN      Open chat",
    " F2          Settings",
    " F3          Contacts",
    " F8          This help",
    "",
    " CHAT VIEW",
    " UP/DOWN     Scroll messages",
    " F5/F3       Page down/up",
    " Type text   Compose message",
    " LT/RT       Move input cursor",
    " CBM+LT/RT   Jump word left/right",
    " RETURN      Send message",
    " DEL         Backspace at cursor",
    " STOP        Back to chat list",
    " LEFT ARROW  Back to chat list",
    "",
    " CONTACTS (F3)",
    " UP/DOWN     Select contact",
    " RETURN      Open/start chat",
    " F1          Chat list",
    " F2          Settings",
    " F8          Help",
    "",
    " SETTINGS (F2)",
    " UP/DOWN     Select field",
    " RETURN      Edit field / action",
    " DEL         Backspace (editing)",
    " STOP        Save & back",
    " Type        Enter value",
    "",
    " SETTINGS FIELDS",
    " Phone       WhatsApp phone (+XXX)",
    " Timezone    For message timestamps",
    " Login       Start login process",
    " Logout      Unlink this device",
    "",
    " LOGIN FLOW (phone pairing code)",
    " 1. Enter phone with country code",
    "    (e.g. 1234567890, no +). RETURN.",
    " 2. An 8-char code appears here.",
    " 3. On your PHONE: WhatsApp >",
    "    Settings > Linked Devices >",
    "    Link a Device > 'Link with",
    "    phone number instead' and type",
    "    the code shown on this screen.",
    " 4. This screen moves to the chat",
    "    list automatically once your",
    "    phone confirms the link.",
    "",
    " No QR code is needed or shown --",
    " the pairing code replaces it so",
    " login works from the C64 keyboard.",
    "",
    " press F8 or STOP to close help",
]


# =====================================================================
#  Data classes
# =====================================================================


@dataclass
class ChatEntry:
    """A chat in the list. id is a WhatsApp JID string, e.g. '123@s.whatsapp.net'."""

    id: str = ""
    name: str = ""
    last_message: str = ""
    unread_count: int = 0
    is_group: bool = False
    timestamp: str = ""


@dataclass
class MessageEntry:
    """A single message in a chat."""

    id: str = ""
    sender_name: str = ""
    text: str = ""
    timestamp: str = ""
    is_outgoing: bool = False


@dataclass
class ContactEntry:
    """A WhatsApp contact."""

    id: str = ""
    name: str = ""
    phone: str = ""
    username: str = ""  # repurposed: "[Business]" tag, or blank


def _media_placeholder(msg) -> str:
    """Return a placeholder string for a non-text WhatsApp message."""
    try:
        if msg.imageMessage.ListFields():
            return "[Photo]"
        if msg.videoMessage.ListFields():
            return "[Video]"
        if msg.audioMessage.ListFields():
            return "[Voice]" if msg.audioMessage.PTT else "[Audio]"
        if msg.documentMessage.ListFields():
            return "[Document]"
        if msg.stickerMessage.ListFields():
            return "[Sticker]"
        if msg.contactMessage.ListFields() or msg.contactsArrayMessage.ListFields():
            return "[Contact]"
        if msg.locationMessage.ListFields() or msg.liveLocationMessage.ListFields():
            return "[Location]"
        if msg.reactionMessage.ListFields():
            return "[Reaction]"
    except Exception:
        pass
    return ""


def _extract_message_text(msg) -> str:
    """Extract displayable text from a WhatsApp E2E message, with a
    bracketed placeholder for media-only messages."""
    try:
        from neonize.utils.message import extract_text

        text = extract_text(msg) or ""
    except Exception:
        text = ""
    if text:
        return transliterate(text)
    return _media_placeholder(msg)


# =====================================================================
#  _WhatsmeowWorker — async thread that owns the neonize client
# =====================================================================


class _WhatsmeowWorker:
    """Runs all neonize (whatsmeow) operations in a dedicated daemon thread
    with its own asyncio event loop.

    Unlike Telegram, WhatsApp/whatsmeow has no "get dialogs" / "get messages"
    pull API -- the chat list and message history are built up locally from
    an initial history-sync push plus the live event stream, and kept in
    the _chat_meta / _messages dicts below. Callers submit jobs via a
    thread-safe queue and block until the result is ready, same pattern as
    _PlaywrightWorker / _TelethonWorker.
    """

    _SENTINEL = object()

    def __init__(self):
        self._job_queue: queue.Queue = queue.Queue()
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._client = None  # neonize NewAClient
        self._connect_started = False
        self._connected = False
        self._logged_in = False

        # Local chat/message store, populated from history-sync + live events.
        self._chat_meta: Dict[str, dict] = {}
        self._messages: Dict[str, List[dict]] = {}
        self._last_incoming_sender: Dict[str, str] = {}
        self._last_incoming_ids: Dict[str, List[str]] = {}

        # Event queue for real-time updates (new messages, typing, etc).
        self._update_queue: queue.Queue = queue.Queue()

        self._thread = threading.Thread(
            target=self._run, name="whatsmeow-worker", daemon=True
        )
        self._thread.start()

    # ------------------------------------------------------------------
    #  Public API (called from any thread, blocks until result ready)
    # ------------------------------------------------------------------

    def call(self, method: str, **kwargs) -> object:
        """Submit a job and wait for the result.

        *method* is the name of an async method on this worker
        (e.g. 'connect', 'get_dialogs').
        """
        result_q: queue.Queue = queue.Queue()
        self._job_queue.put((method, kwargs, result_q))
        result = result_q.get()
        if isinstance(result, Exception):
            raise result
        return result

    @property
    def connected(self) -> bool:
        return self._connected and self._logged_in

    def shutdown(self):
        self._job_queue.put(self._SENTINEL)

    def get_pending_updates(self) -> list:
        """Get all pending WhatsApp updates from queue (non-blocking)."""
        updates = []
        try:
            while True:
                updates.append(self._update_queue.get_nowait())
        except queue.Empty:
            pass
        return updates

    # ------------------------------------------------------------------
    #  Worker thread body
    # ------------------------------------------------------------------

    def _run(self):
        """Main loop inside the dedicated worker thread."""
        self._loop = asyncio.new_event_loop()
        asyncio.set_event_loop(self._loop)
        self._loop.run_until_complete(self._process_jobs())

    async def _process_jobs(self):
        """Process job queue forever."""
        while True:
            try:
                job = self._job_queue.get_nowait()
            except queue.Empty:
                await asyncio.sleep(0.05)
                continue

            if job is self._SENTINEL:
                await self._cleanup()
                break

            method_name, kwargs, result_q = job
            try:
                method = getattr(self, f"_do_{method_name}", None)
                if method is None:
                    result_q.put(ValueError(f"Unknown method: {method_name}"))
                else:
                    result = await method(**kwargs)
                    result_q.put(result)
            except Exception as exc:
                logger.error(
                    "Whatsmeow worker error (%s): %s", method_name, exc, exc_info=True
                )
                result_q.put(exc)

    async def _cleanup(self):
        if self._client:
            try:
                await self._client.disconnect()
            except Exception:
                pass
            self._client = None
        self._connected = False
        self._logged_in = False

    # ------------------------------------------------------------------
    #  Client / connection setup
    # ------------------------------------------------------------------

    async def _ensure_client(self) -> bool:
        """Create the neonize client if not yet created."""
        if self._client is not None:
            return True
        try:
            from neonize.aioze.client import NewAClient
        except Exception as e:
            logger.error("neonize not available: %s", e)
            return False

        session_path = self._get_session_path()
        self._client = NewAClient(session_path)
        self._register_event_handlers(self._client)
        return True

    async def _do_connect(self) -> str:
        """Connect to WhatsApp. Returns 'authorized', 'need_login', or error string."""
        if not await self._ensure_client():
            return "error:Failed to initialise WhatsApp client"
        try:
            if not self._connect_started:
                await self._client.connect()
                self._connect_started = True
            # Give whatsmeow a chance to auto-restore an existing linked
            # session before reporting back (a fresh/unlinked device will
            # never flip is_logged_in, so this just waits out one short window).
            for _ in range(20):  # ~5s
                if self._client.is_logged_in:
                    self._connected = True
                    self._logged_in = True
                    return "authorized"
                await asyncio.sleep(0.25)
            self._connected = True
            return "need_login"
        except Exception as e:
            return f"error:{e}"

    async def _do_request_pair_code(self, phone: str = "") -> str:
        """Ask WhatsApp for an 8-char phone-pairing code. Returns the code or an error string."""
        if not await self._ensure_client():
            return "error:Failed to initialise WhatsApp client"
        try:
            if not self._connect_started:
                await self._client.connect()
                self._connect_started = True
                await asyncio.sleep(1.0)  # let the websocket settle
            code = await self._client.PairPhone(phone, show_push_notification=True)
            return code
        except Exception as e:
            return f"error:{e}"

    async def _do_is_logged_in(self) -> bool:
        if not self._client:
            return False
        try:
            logged_in = bool(self._client.is_logged_in)
        except Exception:
            logged_in = False
        if logged_in:
            self._logged_in = True
            self._connected = True
        return logged_in

    async def _do_logout(self) -> str:
        """Unlink the device and drop the local session."""
        try:
            if self._client:
                try:
                    await self._client.logout()
                except Exception:
                    pass
                try:
                    await self._client.disconnect()
                except Exception:
                    pass
                self._client = None
            self._connected = False
            self._logged_in = False
            self._connect_started = False
            self._chat_meta.clear()
            self._messages.clear()
            session_path = self._get_session_path()
            if os.path.exists(session_path):
                os.remove(session_path)
            return "ok"
        except Exception as e:
            return f"error:{e}"

    # ------------------------------------------------------------------
    #  Chat list / messages / contacts (served from the local store)
    # ------------------------------------------------------------------

    async def _do_get_dialogs(
        self, limit: int = MAX_DIALOGS, tz_offset_minutes: int = 0
    ) -> List[ChatEntry]:
        tz = timezone(timedelta(minutes=tz_offset_minutes))
        entries = []
        for chat_id, meta in self._chat_meta.items():
            ts_str = _format_epoch(meta.get("last_ts", 0), tz)
            entries.append(
                ChatEntry(
                    id=chat_id,
                    name=(meta.get("name") or chat_id.split("@")[0])[:36],
                    last_message=(meta.get("last_message") or "")[:60],
                    unread_count=meta.get("unread", 0),
                    is_group=meta.get("is_group", False),
                    timestamp=ts_str,
                )
            )
        entries.sort(key=lambda c: self._chat_meta[c.id].get("last_ts", 0), reverse=True)
        return entries[:limit]

    async def _do_get_messages(
        self, chat_id: str = "", limit: int = MAX_MESSAGES, tz_offset_minutes: int = 0
    ) -> List[MessageEntry]:
        if not chat_id:
            return []
        tz = timezone(timedelta(minutes=tz_offset_minutes))
        raw = self._messages.get(chat_id, [])[-limit:]
        result = []
        for m in raw:
            result.append(
                MessageEntry(
                    id=m.get("id", ""),
                    sender_name=(m.get("sender_name") or "")[:20],
                    text=(m.get("text") or "")[:500],
                    timestamp=_format_epoch(m.get("ts", 0), tz),
                    is_outgoing=bool(m.get("is_outgoing")),
                )
            )
        return result

    async def _do_get_contacts(self) -> List[ContactEntry]:
        if not self._client:
            return []
        try:
            from neonize.utils.jid import Jid2String

            contacts = self._client.contact.get_all_contacts()
            result = []
            for c in contacts:
                info = c.Info
                name = info.FullName or info.PushName or info.FirstName or ""
                phone = c.JID.User
                tag = "[Business]" if info.BusinessName else ""
                result.append(
                    ContactEntry(
                        id=Jid2String(c.JID),
                        name=transliterate(name or phone)[:30],
                        phone=phone,
                        username=tag,
                    )
                )
            result.sort(key=lambda c: c.name.lower())
            return result
        except Exception as e:
            logger.error("get_contacts error: %s", e)
            return []

    async def _do_send_message(self, chat_id: str = "", text: str = "") -> str:
        if not self._client or not chat_id or not text:
            return "error:Not connected or empty message"
        try:
            jid = self._parse_jid(chat_id)
            response = await self._client.send_message(jid, text)
            self._apply_message(
                chat_id=chat_id,
                is_group=chat_id.endswith("@g.us"),
                sender_jid="",
                sender_name="",
                text=text,
                ts_epoch=int(response.Timestamp) if response.Timestamp else int(time.time()),
                is_outgoing=True,
                msg_id=response.ID,
            )
            return "ok"
        except Exception as e:
            return f"error:{e}"

    async def _do_send_typing(self, chat_id: str = "") -> str:
        return await self._set_presence(chat_id, composing=True)

    async def _do_cancel_typing(self, chat_id: str = "") -> str:
        return await self._set_presence(chat_id, composing=False)

    async def _set_presence(self, chat_id: str, composing: bool) -> str:
        if not self._client or not chat_id:
            return "error:Not connected or missing chat"
        try:
            from neonize.utils import ChatPresence, ChatPresenceMedia

            state = (
                ChatPresence.CHAT_PRESENCE_COMPOSING
                if composing
                else ChatPresence.CHAT_PRESENCE_PAUSED
            )
            jid = self._parse_jid(chat_id)
            await self._client.send_chat_presence(
                jid, state, ChatPresenceMedia.CHAT_PRESENCE_MEDIA_TEXT
            )
            return "ok"
        except Exception as e:
            return f"error:{e}"

    async def _do_mark_read(self, chat_id: str = "") -> str:
        """Mark queued unread messages in a chat as read on WhatsApp."""
        if not self._client or not chat_id:
            return "error:Not connected or missing chat_id"
        ids = self._last_incoming_ids.get(chat_id) or []
        if chat_id in self._chat_meta:
            self._chat_meta[chat_id]["unread"] = 0
        if not ids:
            return "ok"
        sender_str = self._last_incoming_sender.get(chat_id, chat_id)
        try:
            from neonize.utils import ReceiptType

            chat_jid = self._parse_jid(chat_id)
            sender_jid = self._parse_jid(sender_str)
            await self._client.mark_read(
                *ids, chat=chat_jid, sender=sender_jid, receipt=ReceiptType.READ
            )
            self._last_incoming_ids[chat_id] = []
            return "ok"
        except Exception as e:
            logger.debug("mark_read error for chat %s: %s", chat_id, e)
            return f"error:{e}"

    # ------------------------------------------------------------------
    #  JID helpers
    # ------------------------------------------------------------------

    @staticmethod
    def _parse_jid(chat_id: str):
        from neonize.utils.jid import build_jid

        if "@" in chat_id:
            user, server = chat_id.split("@", 1)
        else:
            user, server = chat_id, "s.whatsapp.net"
        return build_jid(user, server)

    # ------------------------------------------------------------------
    #  Local store updates
    # ------------------------------------------------------------------

    def _apply_message(
        self,
        chat_id: str,
        is_group: bool,
        sender_jid: str,
        sender_name: str,
        text: str,
        ts_epoch: int,
        is_outgoing: bool,
        msg_id: str,
        display_name_hint: str = "",
    ):
        """Insert/update a message in the local store and refresh chat metadata."""
        msgs = self._messages.setdefault(chat_id, [])
        if msg_id and any(m.get("id") == msg_id for m in msgs):
            return  # already recorded (e.g. echo of our own outgoing send)
        msgs.append(
            {
                "id": msg_id,
                "sender_name": sender_name,
                "text": text,
                "ts": ts_epoch,
                "is_outgoing": is_outgoing,
            }
        )
        if len(msgs) > MAX_MESSAGES:
            del msgs[: len(msgs) - MAX_MESSAGES]

        meta = self._chat_meta.setdefault(
            chat_id,
            {"name": "", "is_group": is_group, "last_message": "", "last_ts": 0, "unread": 0},
        )
        meta["is_group"] = is_group
        if not meta.get("name") and display_name_hint:
            meta["name"] = display_name_hint
        if not meta.get("name"):
            meta["name"] = sender_name if (not is_group and sender_name) else chat_id.split("@")[0]
        if ts_epoch >= meta.get("last_ts", 0):
            meta["last_ts"] = ts_epoch
            meta["last_message"] = text[:60]
        if not is_outgoing:
            meta["unread"] = meta.get("unread", 0) + 1
            if sender_jid:
                self._last_incoming_sender[chat_id] = sender_jid
            if msg_id:
                self._last_incoming_ids.setdefault(chat_id, []).append(msg_id)

    def _apply_history_sync(self, historysync) -> None:
        try:
            data = historysync.Data
            for conv in data.conversations:
                chat_id = conv.ID
                if not chat_id:
                    continue
                is_group = chat_id.endswith("@g.us")
                meta = self._chat_meta.setdefault(
                    chat_id,
                    {
                        "name": "",
                        "is_group": is_group,
                        "last_message": "",
                        "last_ts": 0,
                        "unread": 0,
                    },
                )
                if conv.name:
                    meta["name"] = transliterate(conv.name)
                if conv.unreadCount:
                    meta["unread"] = conv.unreadCount
                if conv.conversationTimestamp:
                    meta["last_ts"] = max(meta["last_ts"], conv.conversationTimestamp)

                msgs = self._messages.setdefault(chat_id, [])
                existing_ids = {m.get("id") for m in msgs}
                for hm in conv.messages:
                    wmi = hm.message
                    if not wmi.message.ListFields():
                        continue
                    mid = wmi.key.ID
                    if mid and mid in existing_ids:
                        continue
                    text = _extract_message_text(wmi.message)
                    sender_name = transliterate(wmi.pushName or meta.get("name") or "")
                    msgs.append(
                        {
                            "id": mid,
                            "sender_name": sender_name,
                            "text": text,
                            "ts": wmi.messageTimestamp,
                            "is_outgoing": wmi.key.fromMe,
                        }
                    )
                    if wmi.messageTimestamp and wmi.messageTimestamp > meta["last_ts"]:
                        meta["last_ts"] = wmi.messageTimestamp
                        if text:
                            meta["last_message"] = text[:60]
                msgs.sort(key=lambda m: m.get("ts", 0))
                if len(msgs) > MAX_MESSAGES:
                    del msgs[: len(msgs) - MAX_MESSAGES]
                if not meta.get("name"):
                    meta["name"] = chat_id.split("@")[0]
        except Exception as e:
            logger.debug("history sync apply failed: %s", e)
        self._update_queue.put_nowait({"type": "history_sync"})

    # ------------------------------------------------------------------
    #  Event handlers (registered once, before connect())
    # ------------------------------------------------------------------

    def _register_event_handlers(self, client) -> None:
        try:
            from neonize.aioze.events import (
                ConnectedEv,
                DisconnectedEv,
                LoggedOutEv,
                MessageEv,
                ChatPresenceEv,
                HistorySyncEv,
            )
            from neonize.utils.jid import Jid2String
            from neonize.proto.Neonize_pb2 import ChatPresence as ChatPresenceProto

            worker = self

            @client.event(ConnectedEv)
            async def on_connected(_client, _ev):
                worker._connected = True
                worker._logged_in = True
                worker._update_queue.put_nowait({"type": "connected"})

            @client.event(DisconnectedEv)
            async def on_disconnected(_client, _ev):
                worker._connected = False

            @client.event(LoggedOutEv)
            async def on_logged_out(_client, _ev):
                worker._connected = False
                worker._logged_in = False
                worker._update_queue.put_nowait({"type": "logged_out"})

            @client.event(HistorySyncEv)
            async def on_history_sync(_client, ev):
                worker._apply_history_sync(ev)

            @client.event(MessageEv)
            async def on_message(_client, ev):
                try:
                    src = ev.Info.MessageSource
                    chat_id = Jid2String(src.Chat)
                    sender_jid = Jid2String(src.Sender) if src.Sender else ""
                    is_group = bool(src.IsGroup)
                    is_outgoing = bool(src.IsFromMe)
                    sender_name = transliterate(ev.Info.Pushname or "")
                    text = _extract_message_text(ev.Message)
                    ts_epoch = int(ev.Info.Timestamp) if ev.Info.Timestamp else int(time.time())
                    worker._apply_message(
                        chat_id=chat_id,
                        is_group=is_group,
                        sender_jid=sender_jid,
                        sender_name=sender_name,
                        text=text,
                        ts_epoch=ts_epoch,
                        is_outgoing=is_outgoing,
                        msg_id=ev.Info.ID,
                    )
                    worker._update_queue.put_nowait(
                        {
                            "type": "new_message",
                            "chat_id": chat_id,
                            "sender_name": sender_name,
                            "text": text,
                            "is_outgoing": is_outgoing,
                        }
                    )
                except Exception as e:
                    logger.debug("on_message handler failed: %s", e)

            @client.event(ChatPresenceEv)
            async def on_chat_presence(_client, ev):
                try:
                    src = ev.MessageSource
                    chat_id = Jid2String(src.Chat)
                    composing = ev.State == ChatPresenceProto.COMPOSING
                    worker._update_queue.put_nowait(
                        {
                            "type": "typing",
                            "chat_id": chat_id,
                            "composing": composing,
                        }
                    )
                except Exception as e:
                    logger.debug("on_chat_presence handler failed: %s", e)

            logger.debug("Whatsmeow event handlers registered")
        except Exception as e:
            logger.warning("Failed to register whatsmeow event handlers: %s", e)

    @staticmethod
    def _get_session_path() -> str:
        """Return the path for the neonize/whatsmeow session sqlite file."""
        from workspace_init import WORKSPACE_DIR

        config_dir = os.path.join(WORKSPACE_DIR, ".config")
        os.makedirs(config_dir, exist_ok=True)
        return os.path.join(config_dir, "whatsapp.db")


def _format_epoch(epoch: int, tz: timezone) -> str:
    """Format a unix-epoch-seconds timestamp as 'HH:MM' in the given timezone."""
    if not epoch:
        return ""
    try:
        import datetime

        dt = datetime.datetime.fromtimestamp(int(epoch), tz=datetime.timezone.utc)
        return dt.astimezone(tz).strftime("%H:%M")
    except Exception:
        return ""


# Module-level shared worker instance (lazy init)
_worker: Optional[_WhatsmeowWorker] = None
_worker_lock = threading.Lock()


def _get_worker() -> _WhatsmeowWorker:
    """Return the shared WhatsmeowWorker (created on first call)."""
    global _worker
    if _worker is None:
        with _worker_lock:
            if _worker is None:
                _worker = _WhatsmeowWorker()
    return _worker


# =====================================================================
#  WhatsAppChatConsole — main console class
# =====================================================================


class WhatsAppChatConsole(ServerConsole):
    """Console 8 — PETSCII WhatsApp Chat Client."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.worker = _get_worker()

        # Mode state
        self.mode: int = MODE_CHATS
        self.prev_mode: int = MODE_CHATS

        # Login state
        self.login_state: int = LOGIN_PHONE
        self.login_phone: str = ""
        self.login_input: str = ""
        self.login_error: str = ""
        self.login_status: str = ""
        self.login_pairing_code: str = ""
        self._login_poll_last: float = 0.0

        # Chat list state
        self.chats: List[ChatEntry] = []
        self.chat_sel: int = 0
        self.chat_scroll: int = 0

        # Chat view state
        self.current_chat_id: str = ""
        self.current_chat_name: str = ""
        self.messages: List[MessageEntry] = []
        self.msg_scroll: int = 0
        self.msg_input: str = ""
        self.msg_cursor: int = 0
        self.msg_input_scroll: int = 0
        self._rendered_lines: List[tuple] = []
        self._typing_until_by_chat: dict = {}
        self._typing_ttl_sec: float = 5.0
        self._typing_anim_frame: int = 0
        self._last_typing_sent_by_chat: dict = {}
        self._typing_send_interval_sec: float = 3.0
        self._outgoing_typing_chat_id: str = ""
        self._outgoing_typing_last_sent: float = 0.0
        self._outgoing_typing_interval_sec: float = 3.0

        # Contacts state
        self.contacts: List[ContactEntry] = []
        self.contact_sel: int = 0
        self.contact_scroll: int = 0

        # Settings state
        self.settings_sel: int = 0
        self.settings_editing: bool = False
        self.settings_input: str = ""
        self.settings_cursor: int = 0
        self.settings_status: str = ""

        # Help scroll
        self.help_scroll: int = 0

        # Transient status shown in the chat-list status bar
        self._chat_status: str = ""

        # Event-driven updates — background thread processes WhatsApp events
        self._event_stop = threading.Event()
        self._event_thread = threading.Thread(
            target=self._bg_event_loop, name="wa-events", daemon=True
        )
        self._event_thread.start()

        # Background polling state
        self._is_active: bool = False
        self._last_poll_time: float = 0.0
        self._poll_stop = threading.Event()
        self._render_lock = threading.Lock()
        self._poll_thread = threading.Thread(
            target=self._bg_poll_loop, name="wa-poller", daemon=True
        )
        self._poll_thread.start()

        # Try to connect on creation
        self._try_auto_connect()

        # Initial render
        self._full_render()

    # =================================================================
    #  CONFIG HELPERS
    # =================================================================

    @staticmethod
    def _read_config() -> dict:
        from sdk.config_manager import read_config

        return read_config()

    @staticmethod
    def _write_config(data: dict):
        from sdk.config_manager import write_config

        write_config(data)

    def _get_phone(self) -> str:
        cfg = self._read_config()
        return cfg.get("WHATSAPP_PHONE", "")

    # =================================================================
    #  AUTO-CONNECT
    # =================================================================

    def _try_auto_connect(self):
        """Try to reconnect using an existing linked WhatsApp session."""
        phone = self._get_phone()
        try:
            result = self.worker.call("connect")
            if result == "authorized":
                self.mode = MODE_CHATS
                self._refresh_chats()
            elif result == "need_login":
                self.mode = MODE_LOGIN
                self.login_state = LOGIN_PHONE
                if phone:
                    self.login_input = phone
            else:
                self.mode = MODE_LOGIN
                self.login_state = LOGIN_PHONE
                self.login_error = result.replace("error:", "")[:36]
                if phone:
                    self.login_input = phone
        except Exception as e:
            self.mode = MODE_LOGIN
            self.login_state = LOGIN_PHONE
            self.login_error = str(e)[:36]

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        """Re-render and refresh data when switching to this console."""
        self._is_active = True
        self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
        with self._render_lock:
            if self.worker.connected:
                if self.mode == MODE_CHATS:
                    self._refresh_chats()
                elif self.mode == MODE_CHAT_VIEW and self.current_chat_id:
                    self._refresh_messages(self.current_chat_id)
            self._full_render()
            self._push_screen()

    def on_deactivate(self):
        self._stop_outgoing_typing(self.current_chat_id)
        self._is_active = False

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        """Route keypress based on current mode."""
        with self._render_lock:
            handlers = {
                MODE_LOGIN: self._key_login,
                MODE_CHATS: self._key_chats,
                MODE_CHAT_VIEW: self._key_chat_view,
                MODE_CONTACTS: self._key_contacts,
                MODE_SETTINGS: self._key_settings,
                MODE_HELP: self._key_help,
            }
            handler = handlers.get(self.mode, self._key_chats)
            handler(petscii_code, modifiers)
            self._full_render()
            self._push_screen()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    # =================================================================
    #  KEY HANDLERS
    # =================================================================

    # ── LOGIN mode ───────────────────────────────────────────────────

    def _key_login(self, key: int, mod: int):
        if self.login_state == LOGIN_PAIRING:
            # View-only wait screen: STOP cancels back to phone entry.
            if key in (KEY_RUNSTOP, KEY_LEFT_ARROW):
                self.login_state = LOGIN_PHONE
                self.login_pairing_code = ""
                self.login_status = ""
                self.login_error = ""
            elif key == KEY_F8:
                self.prev_mode = MODE_LOGIN
                self.help_scroll = 0
                self.mode = MODE_HELP
            return

        if key == KEY_RETURN:
            self._submit_login()
        elif key == KEY_DEL:
            if self.login_input:
                self.login_input = self.login_input[:-1]
        elif key == KEY_RUNSTOP:
            self.mode = MODE_SETTINGS
        elif key == KEY_F8:
            self.prev_mode = MODE_LOGIN
            self.help_scroll = 0
            self.mode = MODE_HELP
        else:
            ch = self._petscii_to_printable(key)
            if ch and ch.isdigit() and len(self.login_input) < 20:
                self.login_input += ch

    def _submit_login(self):
        phone = self.login_input.strip()
        if not phone:
            self.login_error = "Enter phone number"
            return
        self.login_phone = phone
        self.login_status = "Requesting pairing code..."
        self.login_error = ""
        self._full_render()  # show status before blocking call
        result = self.worker.call("request_pair_code", phone=phone)
        if result.startswith("error:"):
            self.login_error = result.replace("error:", "")[:36]
            self.login_status = ""
            return
        cfg = self._read_config()
        cfg["WHATSAPP_PHONE"] = phone
        self._write_config(cfg)
        self.login_pairing_code = result
        self.login_state = LOGIN_PAIRING
        self.login_status = ""
        self.login_error = ""

    # ── CHATS mode (F1) ─────────────────────────────────────────────

    def _key_chats(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.chat_sel > 0:
                self.chat_sel -= 1
                if self.chat_sel < self.chat_scroll:
                    self.chat_scroll = self.chat_sel

        elif key == KEY_CRSR_DN:
            if self.chat_sel < len(self.chats) - 1:
                self.chat_sel += 1
                if self.chat_sel >= self.chat_scroll + CONTENT_ROWS:
                    self.chat_scroll = self.chat_sel - CONTENT_ROWS + 1

        elif key == KEY_F5:
            self.chat_sel = min(len(self.chats) - 1, self.chat_sel + CONTENT_ROWS)
            self.chat_scroll = max(0, self.chat_sel - CONTENT_ROWS + 1)

        elif key == KEY_F3:
            self.mode = MODE_CONTACTS
            self._refresh_contacts()

        elif key == KEY_RETURN:
            if self.chats:
                chat = self.chats[self.chat_sel]
                self._open_chat(chat.id, chat.name)

        elif key == KEY_F2:
            self.prev_mode = MODE_CHATS
            self.mode = MODE_SETTINGS
            self.settings_status = ""

        elif key == KEY_F8:
            self.prev_mode = MODE_CHATS
            self.help_scroll = 0
            self.mode = MODE_HELP

        elif key == KEY_HOME:
            self._chat_status = "Refreshing..."
            self._full_render()
            self._push_screen()
            self._chat_status = ""
            self._refresh_chats()

    # ── CHAT VIEW mode ───────────────────────────────────────────────

    def _key_chat_view(self, key: int, mod: int):
        cbm = bool(mod & MOD_COMMODORE)

        if key == KEY_CRSR_UP and not cbm:
            if self.msg_scroll > 0:
                self.msg_scroll -= 1

        elif key == KEY_CRSR_DN and not cbm:
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            if self.msg_scroll < max_scroll:
                self.msg_scroll += 1

        elif key == KEY_F5:
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            self.msg_scroll = min(
                max_scroll, self.msg_scroll + self._msg_display_rows()
            )

        elif key == KEY_F3:
            self.msg_scroll = max(0, self.msg_scroll - self._msg_display_rows())

        elif key == KEY_RETURN:
            if self.msg_input.strip():
                self._do_send_message()

        elif key == KEY_DEL:
            if self.msg_input and self.msg_cursor > 0:
                self.msg_input = (
                    self.msg_input[: self.msg_cursor - 1]
                    + self.msg_input[self.msg_cursor :]
                )
                self.msg_cursor -= 1
                self._clamp_input_scroll()
                self._send_typing_if_needed()

        elif key == KEY_CRSR_LT:
            if cbm:
                self.msg_cursor = self._word_jump_left(self.msg_input, self.msg_cursor)
            else:
                if self.msg_cursor > 0:
                    self.msg_cursor -= 1
            self._clamp_input_scroll()

        elif key == KEY_CRSR_RT:
            if cbm:
                self.msg_cursor = self._word_jump_right(self.msg_input, self.msg_cursor)
            else:
                if self.msg_cursor < len(self.msg_input):
                    self.msg_cursor += 1
            self._clamp_input_scroll()

        elif key == KEY_HOME:
            self._chat_status = "Refreshing..."
            self._full_render()
            self._push_screen()
            self._chat_status = ""
            self._refresh_messages(self.current_chat_id)

        elif key == KEY_RUNSTOP or key == KEY_LEFT_ARROW:
            self._stop_outgoing_typing(self.current_chat_id)
            self._clear_typing_active(self.current_chat_id)
            self.mode = MODE_CHATS
            self.msg_input = ""
            self.msg_cursor = 0
            self.msg_input_scroll = 0
            self._refresh_chats()

        elif key == KEY_F1:
            self._stop_outgoing_typing(self.current_chat_id)
            self._clear_typing_active(self.current_chat_id)
            self.mode = MODE_CHATS
            self.msg_input = ""
            self.msg_cursor = 0
            self.msg_input_scroll = 0
            self._refresh_chats()

        elif key == KEY_F8:
            self._stop_outgoing_typing(self.current_chat_id)
            self.prev_mode = MODE_CHAT_VIEW
            self.help_scroll = 0
            self.mode = MODE_HELP

        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.msg_input) < MAX_INPUT_LEN:
                self.msg_input = (
                    self.msg_input[: self.msg_cursor]
                    + ch
                    + self.msg_input[self.msg_cursor :]
                )
                self.msg_cursor += 1
                self._clamp_input_scroll()
                self._send_typing_if_needed()

    # ── CONTACTS mode (F3) ───────────────────────────────────────────

    def _key_contacts(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.contact_sel > 0:
                self.contact_sel -= 1
                if self.contact_sel < self.contact_scroll:
                    self.contact_scroll = self.contact_sel

        elif key == KEY_CRSR_DN:
            if self.contact_sel < len(self.contacts) - 1:
                self.contact_sel += 1
                if self.contact_sel >= self.contact_scroll + CONTENT_ROWS:
                    self.contact_scroll = self.contact_sel - CONTENT_ROWS + 1

        elif key == KEY_F5:
            self.contact_sel = min(
                len(self.contacts) - 1, self.contact_sel + CONTENT_ROWS
            )
            self.contact_scroll = max(0, self.contact_sel - CONTENT_ROWS + 1)

        elif key == KEY_RETURN:
            if self.contacts:
                contact = self.contacts[self.contact_sel]
                self._open_chat(contact.id, contact.name)

        elif key == KEY_F1:
            self.mode = MODE_CHATS
            self._refresh_chats()

        elif key == KEY_F2:
            self.prev_mode = MODE_CONTACTS
            self.mode = MODE_SETTINGS
            self.settings_status = ""

        elif key == KEY_F8:
            self.prev_mode = MODE_CONTACTS
            self.help_scroll = 0
            self.mode = MODE_HELP

        elif key == KEY_RUNSTOP:
            self.mode = MODE_CHATS

    # ── SETTINGS mode (F2) ───────────────────────────────────────────

    # Settings fields: 0=Phone, 1=Timezone, 2=Login, 3=Logout
    _SETTINGS_FIELDS = [
        "Phone Number",
        "Timezone",
        "Login",
        "Logout",
    ]
    _SETTINGS_KEYS = [
        "WHATSAPP_PHONE",
        "TIMEZONE",
        None,
        None,
    ]
    _SETTINGS_COUNT = 4

    def _key_settings(self, key: int, mod: int):
        if self.settings_editing:
            self._key_settings_edit(key, mod)
            return

        if key == KEY_CRSR_UP:
            if self.settings_sel > 0:
                self.settings_sel -= 1

        elif key == KEY_CRSR_DN:
            if self.settings_sel < self._SETTINGS_COUNT - 1:
                self.settings_sel += 1

        elif key == KEY_RETURN:
            if self.settings_sel == 2:
                self._start_login_from_settings()
            elif self.settings_sel == 3:
                self._do_logout()
            else:
                cfg_key = self._SETTINGS_KEYS[self.settings_sel]
                if cfg_key:
                    cfg = self._read_config()
                    self.settings_input = cfg.get(cfg_key, "")
                    self.settings_cursor = len(self.settings_input)
                    self.settings_editing = True

        elif key == KEY_RUNSTOP:
            self.mode = (
                self.prev_mode if self.prev_mode != MODE_SETTINGS else MODE_CHATS
            )

        elif key == KEY_F1:
            self.mode = MODE_CHATS
            self._refresh_chats()

        elif key == KEY_F3:
            self.mode = MODE_CONTACTS
            self._refresh_contacts()

        elif key == KEY_F8:
            self.prev_mode = MODE_SETTINGS
            self.help_scroll = 0
            self.mode = MODE_HELP

    def _key_settings_edit(self, key: int, mod: int):
        if key == KEY_RETURN:
            cfg_key = self._SETTINGS_KEYS[self.settings_sel]
            if cfg_key:
                cfg = self._read_config()
                cfg[cfg_key] = self.settings_input.strip()
                self._write_config(cfg)
                self.settings_status = "Saved"
            self.settings_editing = False
        elif key == KEY_RUNSTOP:
            self.settings_editing = False
        elif key == KEY_DEL:
            if self.settings_input and self.settings_cursor > 0:
                self.settings_input = (
                    self.settings_input[: self.settings_cursor - 1]
                    + self.settings_input[self.settings_cursor :]
                )
                self.settings_cursor -= 1
        elif key == KEY_CRSR_LT:
            if self.settings_cursor > 0:
                self.settings_cursor -= 1
        elif key == KEY_CRSR_RT:
            if self.settings_cursor < len(self.settings_input):
                self.settings_cursor += 1
        elif key == KEY_HOME:
            self.settings_cursor = 0
        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.settings_input) < 60:
                self.settings_input = (
                    self.settings_input[: self.settings_cursor]
                    + ch
                    + self.settings_input[self.settings_cursor :]
                )
                self.settings_cursor += 1

    def _start_login_from_settings(self):
        phone = self._get_phone()
        try:
            result = self.worker.call("connect")
            if result == "authorized":
                self.settings_status = "Already logged in"
                self.mode = MODE_CHATS
                self._refresh_chats()
            else:
                self.mode = MODE_LOGIN
                self.login_state = LOGIN_PHONE
                self.login_input = phone
                self.login_error = ""
                self.login_status = ""
        except Exception as e:
            self.settings_status = str(e)[:36]

    def _do_logout(self):
        try:
            result = self.worker.call("logout")
            if result == "ok":
                self.settings_status = "Logged out"
                self.chats = []
                self.messages = []
            else:
                self.settings_status = result.replace("error:", "")[:36]
        except Exception as e:
            self.settings_status = str(e)[:36]

    # ── HELP mode (F8) ──────────────────────────────────────────────

    def _key_help(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.help_scroll > 0:
                self.help_scroll -= 1
        elif key == KEY_CRSR_DN:
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            if self.help_scroll < max_scroll:
                self.help_scroll += 1
        elif key == KEY_F5:
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
        elif key in (KEY_F8, KEY_RUNSTOP):
            self.mode = self.prev_mode if self.prev_mode != MODE_HELP else MODE_CHATS

    # =================================================================
    #  WHATSAPP API WRAPPERS
    # =================================================================

    def _get_tz_offset_minutes(self) -> int:
        cfg = self._read_config()
        tz_name = cfg.get("TIMEZONE", "UTC").strip()
        try:
            import zoneinfo
            import datetime

            zi = zoneinfo.ZoneInfo(tz_name)
            now = datetime.datetime.now(datetime.timezone.utc)
            offset = zi.utcoffset(now)
            return int(offset.total_seconds() // 60) if offset is not None else 0
        except Exception:
            return 0

    def _refresh_chats(self):
        try:
            tz_minutes = self._get_tz_offset_minutes()
            self.chats = self.worker.call("get_dialogs", tz_offset_minutes=tz_minutes)
            if self.chat_sel >= len(self.chats):
                self.chat_sel = max(0, len(self.chats) - 1)
        except Exception as e:
            logger.error("refresh_chats: %s", e)

    def _refresh_messages(self, chat_id: str):
        try:
            tz_minutes = self._get_tz_offset_minutes()
            self.messages = self.worker.call(
                "get_messages", chat_id=chat_id, tz_offset_minutes=tz_minutes
            )
            self._build_rendered_lines()
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            self.msg_scroll = max_scroll
        except Exception as e:
            logger.error("refresh_messages: %s", e)

    def _refresh_contacts(self):
        try:
            self.contacts = self.worker.call("get_contacts")
            if self.contact_sel >= len(self.contacts):
                self.contact_sel = max(0, len(self.contacts) - 1)
        except Exception as e:
            logger.error("refresh_contacts: %s", e)

    def _open_chat(self, chat_id: str, chat_name: str):
        self._stop_outgoing_typing(self._outgoing_typing_chat_id)
        self.current_chat_id = chat_id
        self.current_chat_name = chat_name
        self.msg_input = ""
        self.msg_cursor = 0
        self.msg_input_scroll = 0
        self._refresh_messages(chat_id)
        try:
            self.worker.call("mark_read", chat_id=chat_id)
        except Exception as e:
            logger.debug("mark_read exception for chat %s: %s", chat_id, e)
        self.mode = MODE_CHAT_VIEW

    def _set_typing_active(self, chat_id: str):
        if chat_id:
            self._typing_until_by_chat[chat_id] = (
                time.monotonic() + self._typing_ttl_sec
            )

    def _clear_typing_active(self, chat_id: str):
        if chat_id:
            self._typing_until_by_chat.pop(chat_id, None)

    def _send_typing_if_needed(self):
        chat_id = self.current_chat_id
        if not chat_id or not self.worker.connected:
            return
        now = time.monotonic()
        last_sent = self._last_typing_sent_by_chat.get(chat_id, 0.0)
        if now - last_sent < self._typing_send_interval_sec:
            return
        self._last_typing_sent_by_chat[chat_id] = now
        try:
            result = self.worker.call("send_typing", chat_id=chat_id)
            if result != "ok":
                logger.debug("send_typing failed for chat %s: %s", chat_id, result)
        except Exception as e:
            logger.debug("send_typing exception for chat %s: %s", chat_id, e)

    def _is_typing_active(self, chat_id: str) -> bool:
        if not chat_id:
            return False
        until = self._typing_until_by_chat.get(chat_id, 0.0)
        if until <= time.monotonic():
            self._typing_until_by_chat.pop(chat_id, None)
            return False
        return True

    def _do_send_message(self):
        text = self.msg_input.strip()
        if not text:
            return
        try:
            self._stop_outgoing_typing(self.current_chat_id)
            result = self.worker.call(
                "send_message", chat_id=self.current_chat_id, text=text
            )
            if result == "ok":
                self.msg_input = ""
                self.msg_cursor = 0
                self.msg_input_scroll = 0
                self._refresh_messages(self.current_chat_id)
        except Exception as e:
            logger.error("send_message: %s", e)

    def _sync_outgoing_typing(self):
        chat_id = self.current_chat_id
        if not chat_id:
            return
        if not self.msg_input.strip():
            self._stop_outgoing_typing(chat_id)
            return
        now = time.monotonic()
        chat_changed = self._outgoing_typing_chat_id != chat_id
        if not chat_changed and (
            now - self._outgoing_typing_last_sent
        ) < self._outgoing_typing_interval_sec:
            return
        if chat_changed and self._outgoing_typing_chat_id:
            self._stop_outgoing_typing(self._outgoing_typing_chat_id)
        try:
            result = self.worker.call("send_typing", chat_id=chat_id)
            if result == "ok":
                self._outgoing_typing_chat_id = chat_id
                self._outgoing_typing_last_sent = now
        except Exception as e:
            logger.debug("send_typing exception for chat %s: %s", chat_id, e)

    def _stop_outgoing_typing(self, chat_id: str = ""):
        target_chat_id = chat_id or self._outgoing_typing_chat_id
        if target_chat_id:
            try:
                result = self.worker.call("cancel_typing", chat_id=target_chat_id)
                if result != "ok":
                    logger.debug(
                        "cancel_typing failed for chat %s: %s", target_chat_id, result
                    )
            except Exception as e:
                logger.debug(
                    "cancel_typing exception for chat %s: %s", target_chat_id, e
                )
        if self._outgoing_typing_chat_id == target_chat_id:
            self._outgoing_typing_chat_id = ""
            self._outgoing_typing_last_sent = 0.0

    # =================================================================
    #  EVENT-DRIVEN UPDATES
    # =================================================================

    def _bg_event_loop(self):
        """Daemon thread: consume WhatsApp events and push updates to C64."""
        while not self._event_stop.wait(timeout=0.5):
            try:
                updates = self.worker.get_pending_updates()
                if not updates:
                    continue
                for update in updates:
                    self._process_whatsapp_event(update)
            except Exception as e:
                logger.debug("Event loop error: %s", e)

    def _process_whatsapp_event(self, event: dict):
        if not event:
            return
        event_type = event.get("type")
        event_chat_id = event.get("chat_id")

        with self._render_lock:
            from sdk.console_manager import ConsoleManager

            mgr = ConsoleManager.instance()
            active_console_id = mgr._active.get(self.session_id)
            is_active = active_console_id == self.console_id

            if event_type == "new_message":
                viewing_this_chat = (
                    is_active
                    and self.mode == MODE_CHAT_VIEW
                    and event_chat_id == self.current_chat_id
                )
                if viewing_this_chat:
                    self._refresh_messages(event_chat_id)
                    try:
                        self.worker.call("mark_read", chat_id=event_chat_id)
                    except Exception:
                        pass
                    self._clear_typing_active(event_chat_id)
                else:
                    if not event.get("is_outgoing"):
                        self._show_new_message_toast(mgr, event)
                    if is_active and self.mode == MODE_CHATS:
                        self._refresh_chats()

            elif event_type == "typing":
                if event.get("composing"):
                    self._set_typing_active(event_chat_id)
                else:
                    self._clear_typing_active(event_chat_id)

            elif event_type == "history_sync":
                if is_active and self.mode == MODE_CHATS:
                    self._refresh_chats()

            elif event_type == "logged_out":
                if is_active:
                    self.mode = MODE_LOGIN
                    self.login_state = LOGIN_PHONE
                    self.login_error = "Logged out from phone"

            self._full_render()
            if is_active:
                try:
                    self._push_screen()
                except Exception:
                    logger.debug("Event: screen push failed", exc_info=True)

    def _show_new_message_toast(self, mgr, event: dict) -> None:
        try:
            chat_id = event.get("chat_id", "")
            sender_name = event.get("sender_name") or self._chat_name_by_id(chat_id)
            preview = (event.get("text") or "").replace("\n", " ").replace("\r", "").strip()
            label = sender_name[:18]
            if preview:
                available = SCREEN_COLS - len(label) - 2
                if available > 0:
                    toast_text = f"{label}: {preview[:available]}"
                else:
                    toast_text = label[:SCREEN_COLS]
            else:
                toast_text = label[:SCREEN_COLS]
            mgr.show_session_toast(
                self.session_id,
                toast_text,
                duration_sec=3.0,
                color=7,
            )
        except Exception:
            logger.debug("_show_new_message_toast: failed", exc_info=True)

    def _chat_name_by_id(self, chat_id: str) -> str:
        for chat in self.chats:
            if chat.id == chat_id:
                return chat.name
        return "WhatsApp"

    # =================================================================
    #  INPUT HELPERS
    # =================================================================

    def _msg_display_rows(self) -> int:
        return SCREEN_ROWS - 2 - self._input_line_count()

    def _input_line_count(self) -> int:
        if not self.msg_input:
            return 1
        wrapped = self._word_wrap(self.msg_input, SCREEN_COLS - 2)
        return min(MAX_INPUT_LINES, max(1, len(wrapped)))

    def _clamp_input_scroll(self):
        input_width = SCREEN_COLS - 2
        cursor_line, _ = self._cursor_wrapped_pos(
            self.msg_input, self.msg_cursor, input_width
        )
        if self.msg_input_scroll > cursor_line:
            self.msg_input_scroll = cursor_line
        if self.msg_input_scroll + MAX_INPUT_LINES - 1 < cursor_line:
            self.msg_input_scroll = cursor_line - MAX_INPUT_LINES + 1
        max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
        if self.msg_scroll > max_scroll:
            self.msg_scroll = max_scroll

    @staticmethod
    def _word_jump_left(text: str, pos: int) -> int:
        p = pos
        while p > 0 and text[p - 1] == " ":
            p -= 1
        while p > 0 and text[p - 1] != " ":
            p -= 1
        return p

    @staticmethod
    def _word_jump_right(text: str, pos: int) -> int:
        p = pos
        n = len(text)
        while p < n and text[p] != " ":
            p += 1
        while p < n and text[p] == " ":
            p += 1
        return p

    # =================================================================
    #  MESSAGE LINE BUILDING
    # =================================================================

    def _build_rendered_lines(self):
        self._rendered_lines = []
        for msg in self.messages:
            fg = COL_OUTGOING_FG if msg.is_outgoing else COL_INCOMING_FG
            if not msg.is_outgoing and msg.sender_name:
                header = f"{msg.sender_name} {msg.timestamp}"
                self._rendered_lines.append((header[:SCREEN_COLS], COL_SENDER_FG))
            elif msg.is_outgoing:
                header = f"You {msg.timestamp}"
                self._rendered_lines.append((header[:SCREEN_COLS], COL_CYAN))
            if msg.text:
                wrapped = self._word_wrap(msg.text, SCREEN_COLS)
                for line in wrapped:
                    self._rendered_lines.append((line, fg))
            self._rendered_lines.append(("", COL_TEXT_FG))

    @staticmethod
    def _word_wrap(text: str, width: int) -> List[str]:
        lines = []
        for paragraph in text.split("\n"):
            if not paragraph.strip():
                lines.append("")
                continue
            words = paragraph.split(" ")
            current = ""
            for word in words:
                if not word:
                    continue
                if current and len(current) + 1 + len(word) > width:
                    lines.append(current)
                    current = word[:width]
                elif current:
                    current += " " + word
                else:
                    current = word[:width]
                while len(current) > width:
                    lines.append(current[:width])
                    current = current[width:]
            if current:
                lines.append(current)
        return lines if lines else [""]

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        self._typing_anim_frame = (self._typing_anim_frame + 1) % 30
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = COL_TEXT_FG

        if self.mode == MODE_LOGIN:
            self._render_login()
        elif self.mode == MODE_CHATS:
            self._render_chats()
        elif self.mode == MODE_CHAT_VIEW:
            self._render_chat_view()
        elif self.mode == MODE_CONTACTS:
            self._render_contacts()
        elif self.mode == MODE_SETTINGS:
            self._render_settings()
        elif self.mode == MODE_HELP:
            self._render_help()

    # ── Login screen ─────────────────────────────────────────────────

    def _render_login(self):
        self._render_title_bar("WHATSAPP LOGIN")

        if self.login_state == LOGIN_PHONE:
            self._put_text(3, 1, "Enter phone number:", COL_WHITE)
            self._put_text(4, 1, "Country code, digits only", COL_LABEL_FG)
            self._put_text(5, 1, "(e.g. 1234567890, no +)", COL_LABEL_FG)
            self._render_input_field(7, self.login_input)

            if self.login_error:
                self._put_text(10, 1, self.login_error[:38], COL_ERROR_FG)
            if self.login_status:
                self._put_text(12, 1, self.login_status[:38], COL_YELLOW)

            self._put_text(16, 1, "RETURN  Request pairing code", COL_HELP_FG)
            self._put_text(17, 1, "STOP    Cancel / Settings", COL_HELP_FG)
            self._put_text(18, 1, "F8      Help (ban-risk note)", COL_HELP_FG)
            self._render_status_bar("RETURN=Submit  STOP=Cancel")
        else:
            self._put_text(3, 1, "Pairing code (enter on phone):", COL_WHITE)
            code = self.login_pairing_code
            self._put_text(5, 4, code[:32], COL_YELLOW, reverse=True)
            self._put_text(8, 1, "On your phone:", COL_WHITE)
            self._put_text(9, 1, "WhatsApp Settings >", COL_LABEL_FG)
            self._put_text(10, 1, "Linked Devices > Link a", COL_LABEL_FG)
            self._put_text(11, 1, "Device > 'Link with phone", COL_LABEL_FG)
            self._put_text(12, 1, "number instead' > type code", COL_LABEL_FG)
            self._put_text(15, 1, "Waiting for confirmation...", COL_CYAN)
            self._put_text(18, 1, "STOP    Cancel", COL_HELP_FG)
            self._put_text(19, 1, "F8      Help (ban-risk note)", COL_HELP_FG)
            self._render_status_bar("Waiting...  STOP=Cancel")

    # ── Chat list ────────────────────────────────────────────────────

    def _render_chats(self):
        self._render_title_bar("F1:Chats F2:Set F3:Cont F8:Help")

        if not self.chats:
            if self.worker.connected:
                self._put_text(3, 1, "No chats yet.", COL_LABEL_FG)
                self._put_text(4, 1, "Press F3 for contacts.", COL_HELP_FG)
            else:
                self._put_text(3, 1, "Not connected.", COL_ERROR_FG)
                self._put_text(4, 1, "Press F2 for settings.", COL_HELP_FG)
            self._render_status_bar("HOME=Refresh")
            return

        for vi in range(CONTENT_ROWS):
            idx = self.chat_scroll + vi
            if idx >= len(self.chats):
                break
            chat = self.chats[idx]
            row = CONTENT_TOP + vi
            is_selected = idx == self.chat_sel

            name = chat.name
            if chat.is_group:
                name = "#" + name

            badge = ""
            if chat.unread_count > 0:
                badge = f"({chat.unread_count})"

            time_str = chat.timestamp
            time_width = len(time_str)
            badge_width = len(badge)
            right_width = time_width + badge_width + (1 if badge_width else 0)
            name_width = SCREEN_COLS - right_width - 1
            display_name = name[:name_width]

            if is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if badge:
                    self._put_text(
                        row,
                        SCREEN_COLS - right_width,
                        badge,
                        COL_SELECTED_FG,
                        reverse=True,
                    )
                if time_str:
                    self._put_text(
                        row,
                        SCREEN_COLS - time_width,
                        time_str,
                        COL_SELECTED_FG,
                        reverse=True,
                    )
            else:
                name_fg = COL_GROUP_FG if chat.is_group else COL_WHITE
                self._put_text(row, 0, display_name, name_fg)
                if badge:
                    self._put_text(row, SCREEN_COLS - right_width, badge, COL_UNREAD_FG)
                if time_str:
                    self._put_text(row, SCREEN_COLS - time_width, time_str, COL_GREY)

        total = len(self.chats)
        pos = self.chat_sel + 1
        status_text = (
            self._chat_status
            if self._chat_status
            else f"{pos}/{total} RET=Open HOME=Refresh"
        )
        self._render_status_bar(status_text)

    # ── Chat view ────────────────────────────────────────────────────

    def _render_chat_view(self):
        title = self.current_chat_name[:32]
        self._render_title_bar(title)

        input_lines = self._input_line_count()
        sep_row = SCREEN_ROWS - 1 - input_lines
        msg_end_row = sep_row - 1
        msg_display_rows = msg_end_row - CONTENT_TOP + 1

        for vi in range(msg_display_rows):
            li = self.msg_scroll + vi
            if li >= len(self._rendered_lines):
                break
            text, fg = self._rendered_lines[li]
            row = CONTENT_TOP + vi
            self._put_text(row, 0, text[:SCREEN_COLS], fg)

        for c in range(SCREEN_COLS):
            self.screen[sep_row * SCREEN_COLS + c] = SC_HLINE
            self.color[sep_row * SCREEN_COLS + c] = COL_DARK_GREY

        if self._is_typing_active(self.current_chat_id):
            _TYPING_CHARS = ".+*"
            glyph = _TYPING_CHARS[(self._typing_anim_frame // 10) % 3]
            label = f"typing {glyph}"
            self._put_text(sep_row, SCREEN_COLS - len(label), label, COL_YELLOW)

        prompt = "> "
        input_width = SCREEN_COLS - len(prompt)
        wrapped_input = (
            self._word_wrap(self.msg_input or "", input_width)
            if self.msg_input
            else [""]
        )
        total_input_lines = len(wrapped_input)

        cursor_wrapped_line, cursor_col_in_line = self._cursor_wrapped_pos(
            self.msg_input, self.msg_cursor, input_width
        )

        visible_start = self.msg_input_scroll
        if cursor_wrapped_line < visible_start:
            visible_start = cursor_wrapped_line
            self.msg_input_scroll = visible_start
        if cursor_wrapped_line >= visible_start + input_lines:
            visible_start = cursor_wrapped_line - input_lines + 1
            self.msg_input_scroll = visible_start

        for li in range(input_lines):
            row = sep_row + 1 + li
            if row >= SCREEN_ROWS:
                break
            wrapped_idx = visible_start + li
            line_text = (
                wrapped_input[wrapped_idx] if wrapped_idx < total_input_lines else ""
            )
            if li == 0:
                self._put_text(row, 0, prompt, COL_CYAN)
                self._put_text(row, len(prompt), line_text[:input_width], COL_INPUT_FG)
            else:
                self._put_text(row, 0, "  ", COL_CYAN)
                self._put_text(row, len(prompt), line_text[:input_width], COL_INPUT_FG)

        cursor_vis_line = cursor_wrapped_line - visible_start
        if 0 <= cursor_vis_line < input_lines:
            cursor_row = sep_row + 1 + cursor_vis_line
            cursor_screen_col = len(prompt) + cursor_col_in_line
            if cursor_row < SCREEN_ROWS and cursor_screen_col < SCREEN_COLS:
                pos = cursor_row * SCREEN_COLS + cursor_screen_col
                self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                self.color[pos] = COL_INPUT_FG

    @staticmethod
    def _cursor_wrapped_pos(text: str, cursor: int, width: int):
        if not text:
            return 0, 0
        wrapped = WhatsAppChatConsole._word_wrap(text, width)
        pos = 0
        for li, line in enumerate(wrapped):
            line_end = pos + len(line)
            if cursor <= line_end or li == len(wrapped) - 1:
                return li, cursor - pos
            pos = line_end + 1
        return len(wrapped) - 1, len(wrapped[-1])

    # ── Contacts ─────────────────────────────────────────────────────

    def _render_contacts(self):
        self._render_title_bar("F1:Chats F2:Set F3:Cont F8:Help")

        if not self.contacts:
            if self.worker.connected:
                self._put_text(3, 1, "No contacts found.", COL_LABEL_FG)
            else:
                self._put_text(3, 1, "Not connected.", COL_ERROR_FG)
                self._put_text(4, 1, "Press F2 for settings.", COL_HELP_FG)
            self._render_status_bar("F1=Chats")
            return

        for vi in range(CONTENT_ROWS):
            idx = self.contact_scroll + vi
            if idx >= len(self.contacts):
                break
            contact = self.contacts[idx]
            row = CONTENT_TOP + vi
            is_selected = idx == self.contact_sel

            info = contact.username or contact.phone
            name_width = SCREEN_COLS - len(info) - 1 if info else SCREEN_COLS
            display_name = contact.name[:name_width]

            if is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if info:
                    self._put_text(
                        row,
                        SCREEN_COLS - len(info),
                        info,
                        COL_SELECTED_FG,
                        reverse=True,
                    )
            else:
                self._put_text(row, 0, display_name, COL_WHITE)
                if info:
                    self._put_text(row, SCREEN_COLS - len(info), info, COL_GREY)

        total = len(self.contacts)
        pos = self.contact_sel + 1
        self._render_status_bar(f"{pos}/{total} RET=Chat  STOP=Back")

    # ── Settings ─────────────────────────────────────────────────────

    def _render_settings(self):
        self._render_title_bar("SETTINGS")

        cfg = self._read_config()
        connected = self.worker.connected

        status = "Connected" if connected else "Disconnected"
        status_color = COL_GREEN if connected else COL_RED
        self._put_text(2, 1, f"Status: {status}", status_color)
        self._put_text(
            3,
            1,
            "Unofficial client -- ban risk",
            COL_ERROR_FG,
        )

        fields = [
            ("Phone:", cfg.get("WHATSAPP_PHONE", "")),
            ("Timezone:", cfg.get("TIMEZONE", "UTC")),
            ("[Login]", ""),
            ("[Logout]", ""),
        ]

        for i, (label, value) in enumerate(fields):
            row = 5 + i * 2
            is_selected = i == self.settings_sel

            if self.settings_editing and is_selected:
                self._put_text(row, 1, f"{label} ", COL_LABEL_FG)
                input_col = 2 + len(label)
                visible_width = SCREEN_COLS - input_col - 1
                vis_start = 0
                if self.settings_cursor > visible_width:
                    vis_start = self.settings_cursor - visible_width
                visible = self.settings_input[vis_start : vis_start + visible_width]
                self._put_text(row, input_col, visible, COL_FIELD_FG)
                cursor_screen = input_col + (self.settings_cursor - vis_start)
                if 0 <= cursor_screen < SCREEN_COLS:
                    pos = row * SCREEN_COLS + cursor_screen
                    self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                    self.color[pos] = COL_FIELD_FG
            elif is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                if value:
                    self._put_text(
                        row, 1, f"{label} {value}", COL_SELECTED_FG, reverse=True
                    )
                else:
                    self._put_text(row, 1, label, COL_SELECTED_FG, reverse=True)
            else:
                fg = COL_LABEL_FG
                if label.startswith("["):
                    fg = COL_CYAN
                if value:
                    self._put_text(row, 1, f"{label} {value}", fg)
                else:
                    self._put_text(row, 1, label, fg)

        if self.settings_status:
            self._put_text(18, 1, self.settings_status[:38], COL_YELLOW)

        self._put_text(20, 1, "RET=Edit/Action  STOP=Back", COL_HELP_FG)
        self._put_text(21, 1, "UP/DN=Select field", COL_HELP_FG)

        self._render_status_bar("F1=Chats F3=Contacts F8=Help")

    # ── Help ─────────────────────────────────────────────────────────

    def _render_help(self):
        self._render_title_bar("WHATSAPP HELP")

        for vi in range(CONTENT_ROWS):
            li = self.help_scroll + vi
            if li >= len(HELP_LINES):
                break
            row = CONTENT_TOP + vi
            text = HELP_LINES[li]

            if text.startswith("==="):
                self._put_text(row, 0, text[:SCREEN_COLS], COL_YELLOW, reverse=True)
                for c in range(len(text), SCREEN_COLS):
                    pos = row * SCREEN_COLS + c
                    self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                    self.color[pos] = COL_YELLOW
            elif text and not text.startswith(" "):
                self._put_text(row, 0, text[:SCREEN_COLS], COL_CYAN)
            else:
                stripped = text.lstrip()
                indent = len(text) - len(stripped)
                if stripped and "  " in stripped:
                    parts = stripped.split("  ", 1)
                    if len(parts) == 2 and parts[0].strip():
                        key_part = text[: indent + len(parts[0])]
                        desc_part = "  " + parts[1]
                        self._put_text(row, 0, key_part[:SCREEN_COLS], COL_WHITE)
                        desc_start = indent + len(parts[0])
                        self._put_text(
                            row,
                            desc_start,
                            desc_part[: SCREEN_COLS - desc_start],
                            COL_LIGHT_GREY,
                        )
                    else:
                        self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)
                else:
                    self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)

        self._render_status_bar("F8/STOP=Close  UP/DN=Scroll")

    # =================================================================
    #  RENDER HELPERS
    # =================================================================

    def _render_title_bar(self, text: str):
        for c in range(SCREEN_COLS):
            self.screen[TITLE_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[TITLE_ROW * SCREEN_COLS + c] = COL_TITLE_FG
        self._put_text(TITLE_ROW, 0, text[:SCREEN_COLS], COL_TITLE_FG, reverse=True)

    def _render_status_bar(self, text: str):
        for c in range(SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG
        self._put_text(STATUS_ROW, 0, text[:SCREEN_COLS], COL_STATUS_FG, reverse=True)

    def _render_input_field(self, row: int, text: str):
        visible_width = SCREEN_COLS - 2
        cursor_pos = len(text)
        vis_start = 0
        if cursor_pos > visible_width:
            vis_start = cursor_pos - visible_width
        visible = text[vis_start : vis_start + visible_width]
        self._put_text(row, 1, visible, COL_INPUT_FG)
        cursor_screen = 1 + (cursor_pos - vis_start)
        if cursor_screen < SCREEN_COLS:
            pos = row * SCREEN_COLS + cursor_screen
            self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
            self.color[pos] = COL_INPUT_FG

    def _put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
        """Write text to screen buffer at (row, col) with colour.

        WhatsApp-sourced strings are transliterated to ASCII at ingestion
        (see the worker's message/history-sync handling); char_to_screencode
        here is a safety net that gracefully degrades any residual
        non-ASCII character to its base glyph instead of a blank.
        """
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                continue
            if row < 0 or row >= SCREEN_ROWS:
                return
            pos = row * SCREEN_COLS + c
            sc = char_to_screencode(ch)
            if reverse:
                sc |= SC_REVERSE_BIT
            self.screen[pos] = sc
            self.color[pos] = fg

    def _push_screen(self):
        try:
            send_screen_data(
                self.get_screen_data(),
                self.get_color_data(),
                session_id=self.session_id,
            )
        except Exception:
            logger.debug("Screen push failed (no C64 connected?)", exc_info=True)

    def _send_vic_colors(self, border: int, background: int):
        try:
            from sdk.network_helper import send_vic_colors

            send_vic_colors(
                border & 0x0F,
                background & 0x0F,
                session_id=self.session_id,
            )
        except Exception as e:
            logger.warning("Could not send VIC colours: %s", e)

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    # =================================================================
    #  BACKGROUND POLLING
    # =================================================================

    def _bg_poll_loop(self):
        """Daemon thread: drive the login-pairing wait screen and act as a
        long-interval fallback refresh (the event stream is the primary
        source of truth once connected).
        """
        while not self._poll_stop.wait(timeout=1.0):
            now = time.monotonic()

            if self.mode == MODE_LOGIN and self.login_state == LOGIN_PAIRING:
                if now - self._login_poll_last < 2.0:
                    continue
                self._login_poll_last = now
                self._poll_login_status()
                continue

            if not self.worker.connected:
                continue
            if self.mode == MODE_CHAT_VIEW:
                interval = 300
            elif self.mode == MODE_CHATS:
                interval = 600
            else:
                continue
            if now - self._last_poll_time < interval:
                continue
            self._last_poll_time = now
            self._poll_once()

    def _poll_login_status(self):
        try:
            logged_in = self.worker.call("is_logged_in")
        except Exception:
            logged_in = False
        if not logged_in:
            return
        from sdk.console_manager import ConsoleManager

        mgr = ConsoleManager.instance()
        active_console_id = mgr._active.get(self.session_id)
        is_active = active_console_id == self.console_id
        with self._render_lock:
            self.mode = MODE_CHATS
            self.login_state = LOGIN_PHONE
            self.login_pairing_code = ""
            self._refresh_chats()
            self._full_render()
            if is_active:
                try:
                    self._push_screen()
                except Exception:
                    logger.debug("Login poll: screen push failed", exc_info=True)

    def _poll_once(self):
        try:
            tz_minutes = self._get_tz_offset_minutes()
            try:
                new_chats = self.worker.call(
                    "get_dialogs", tz_offset_minutes=tz_minutes
                )
            except Exception as e:
                logger.error("poll get_dialogs: %s", e)
                return

            new_messages: Optional[List[MessageEntry]] = None
            if self.mode == MODE_CHAT_VIEW and self.current_chat_id:
                try:
                    new_messages = self.worker.call(
                        "get_messages",
                        chat_id=self.current_chat_id,
                        tz_offset_minutes=tz_minutes,
                    )
                except Exception as e:
                    logger.error("poll get_messages: %s", e)

            from sdk.console_manager import ConsoleManager

            mgr = ConsoleManager.instance()
            active_console_id = mgr._active.get(self.session_id)
            allow_bg_push = (
                active_console_id == self.console_id and self.mode == MODE_CHAT_VIEW
            )

            with self._render_lock:
                if new_chats:
                    self.chats = new_chats
                    if self.chat_sel >= len(self.chats):
                        self.chat_sel = max(0, len(self.chats) - 1)

                if new_messages is not None:
                    self.messages = new_messages
                    self._build_rendered_lines()
                    max_scroll = max(
                        0, len(self._rendered_lines) - self._msg_display_rows()
                    )
                    self.msg_scroll = max_scroll

                self._full_render()
                if allow_bg_push:
                    try:
                        self._push_screen()
                    except Exception:
                        logger.debug("Background push failed", exc_info=True)
        except Exception:
            logger.warning("WhatsApp background poll error", exc_info=True)
