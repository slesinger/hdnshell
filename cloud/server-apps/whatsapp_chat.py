"""
Server-side WhatsApp chat console (default console slot 9) for HDN Server.

A PETSCII WhatsApp client rendered into a 40x25 C64 screen-code back-buffer.
Features: pairing-code login, chat list, message view & compose, contacts
list, help screen. Reached from the C64 with CBM+9.

Architecture mirrors ``telegram_chat.py`` almost 1:1 (GH issue #20):

  * ``_WhatsmeowWorker`` plays the role of ``_TelethonWorker`` — a dedicated
    daemon thread, driven through a blocking ``call(method, **kw)`` job-queue
    API, with ``get_pending_updates()`` for real-time events. It wraps the
    *neonize* library (whatsmeow bindings); neonize runs its own connection
    thread and delivers events via registered callbacks.
  * ``WhatsAppChatConsole`` reuses the same mode machine (CHATS / CHAT_VIEW /
    CONTACTS / HELP), rendering, scroll and input-cursor code.

Two deliberate differences from the Telegram console:

  * **Login is simpler** — WhatsApp has no API id/hash, no SMS code and no 2FA.
    The user enters *nothing* on the C64: the phone number is configured once
    in the **HDN UI Settings page** (``WHATSAPP_PHONE``); the console requests
    an 8-character pairing code and the user types it into WhatsApp on their
    real phone (Settings > Linked Devices > Link with phone number).
  * **No in-console Settings mode.** The one required setting lives in the web
    UI; the F8 help screen points there.

Because *neonize* ships a compiled shared library and is an optional install,
every neonize call is made lazily inside the worker thread and degrades
gracefully to a status string ("no_library") so the console never crashes when
the dependency is missing — it shows an install hint instead.
"""

import logging
import queue
import threading
import time
from dataclasses import dataclass
from datetime import timezone, timedelta
from typing import List, Optional

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

# Screen appearance — WhatsApp's brand green as the accent.
COL_TITLE_FG = COL_WHITE
COL_STATUS_FG = COL_LIGHT_GREY
COL_TEXT_FG = COL_LIGHT_GREEN
COL_INPUT_FG = COL_LIGHT_GREEN
COL_HELP_FG = COL_LIGHT_GREY
COL_SELECTED_FG = COL_YELLOW
COL_SENDER_FG = COL_CYAN
COL_OUTGOING_FG = COL_LIGHT_GREEN
COL_INCOMING_FG = COL_WHITE
COL_UNREAD_FG = COL_YELLOW
COL_ERROR_FG = COL_RED
COL_LABEL_FG = COL_LIGHT_GREY
COL_GROUP_FG = COL_GREEN
COL_CODE_FG = COL_YELLOW

# Special screen codes
SC_SPACE = 0x20
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
KEY_SHIFT_COMA = 0x3C   # <  — page up when held with C=
KEY_SHIFT_PERIOD = 0x3E  # >  — page down when held with C=
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C

# Modifier flags
MOD_COMMODORE = 0x04

# Input area limits
MAX_INPUT_LINES = 10
MAX_INPUT_LEN = 800
MAX_MESSAGES = 50
MAX_DIALOGS = 100

# ── WhatsApp chat modes ─────────────────────────────────────────────
MODE_LOGIN = 0
MODE_CHATS = 1
MODE_CHAT_VIEW = 2
MODE_CONTACTS = 3
MODE_HELP = 5

# ── Login sub-states ────────────────────────────────────────────────
LOGIN_NEED_PHONE = 0   # WHATSAPP_PHONE not configured in the UI yet
LOGIN_PAIRING = 1      # showing the 8-char pairing code, waiting for link
LOGIN_NO_LIBRARY = 2   # the neonize dependency is not installed on the server
LOGIN_ERROR = 3        # a connection/pairing error to display

# ── Layout ───────────────────────────────────────────────────────────
TITLE_ROW = 0
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1  # 23
STATUS_ROW = 24

# ── Help screen content ─────────────────────────────────────────────
HELP_LINES = [
    "=== WHATSAPP CHAT HELP   F8=close ===",
    "",
    " CHAT LIST",
    " UP/DOWN     Select chat",
    " C=+< / C=+> Page up/down",
    " RETURN      Open chat",
    " F3          Contacts",
    " F8          This help",
    " HOME        Refresh",
    "",
    " CHAT VIEW",
    " UP/DOWN     Scroll messages",
    " C=+< / C=+> Page up/down",
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
    " F8          Help",
    "",
    " CONFIGURATION",
    " WhatsApp settings live in the HDN",
    " web UI, not on the C64. Open the",
    " HDN UI in a browser, go to the",
    " Settings page and set your",
    " WhatsApp phone number under the",
    " WhatsApp section, then Save.",
    "",
    " LINKING YOUR PHONE",
    " WhatsApp has no api-id/hash. The",
    " server links as a companion device",
    " using an 8-character pairing code:",
    " 1. Set your phone number in the",
    "    HDN UI Settings (with country",
    "    code, e.g. +1234567890).",
    " 2. This console shows an 8-char",
    "    pairing code.",
    " 3. On your phone open WhatsApp,",
    "    Settings > Linked Devices >",
    "    Link a device > Link with",
    "    phone number instead.",
    " 4. Enter the 8-char code shown",
    "    here. The console connects",
    "    automatically once linked.",
    "",
    " NOTE ON ACCOUNT SAFETY",
    " This uses an unofficial multi-",
    " device client library. WhatsApp",
    " may flag or ban accounts that use",
    " unofficial clients. Consider using",
    " a spare number. Use at own risk.",
    "",
    " press F8 or STOP to close help",
]


# =====================================================================
#  Data classes
# =====================================================================


@dataclass
class ChatEntry:
    """A chat/conversation in the list. ``id`` is a WhatsApp JID string."""

    id: str = ""
    name: str = ""
    last_message: str = ""
    unread_count: int = 0
    is_group: bool = False
    timestamp: str = ""
    epoch: float = 0.0  # unix seconds of last activity (for tz-correct display)


@dataclass
class MessageEntry:
    """A single message in a chat."""

    id: str = ""
    sender_name: str = ""
    text: str = ""
    timestamp: str = ""
    is_outgoing: bool = False
    epoch: float = 0.0  # unix seconds (formatted to HH:MM at query time)


@dataclass
class ContactEntry:
    """A WhatsApp contact. ``id`` is a JID string."""

    id: str = ""
    name: str = ""
    phone: str = ""
    username: str = ""


# =====================================================================
#  _WhatsmeowWorker — daemon thread that owns the neonize client
# =====================================================================


class _WhatsmeowWorker:
    """Runs all neonize/whatsmeow operations in a dedicated daemon thread.

    Callers submit jobs via a thread-safe queue and block until the result is
    ready — the same pattern as ``_TelethonWorker`` in telegram_chat.py.

    All neonize access is lazy and defensive: if the ``neonize`` package is not
    installed, or its API differs from what we call, the worker returns a status
    string instead of raising, so the console can render a helpful message.
    """

    _SENTINEL = object()

    def __init__(self):
        self._job_queue: "queue.Queue" = queue.Queue()
        self._client = None  # neonize NewClient
        self._connected = False
        self._logged_in = False
        self._pairing_code: str = ""
        self._no_library = False
        self._update_queue: "queue.Queue" = queue.Queue()
        # In-memory chat/message store. whatsmeow has no "query history" API —
        # the chat list and per-chat messages are accumulated from live events
        # (MessageEv) and history sync (HistorySyncEv), keyed by chat JID.
        self._store_lock = threading.Lock()
        self._chats_by_jid: "dict[str, ChatEntry]" = {}
        self._messages_by_chat: "dict[str, list]" = {}
        self._contacts: "dict[str, str]" = {}  # canonical jid -> display name
        self._lid_to_pn: "dict[str, str]" = {}  # LID user -> phone user (store map)
        self._own_jid: str = ""
        self._seen_ids: set = set()  # message ids already stored (dedupe)
        self._diag_seen: set = set()  # one-shot diagnostic guards (WA-DIAG)
        # Disk cache so the chat list + messages survive a server restart and
        # are shown instantly (no wait for a fresh history sync). Loaded here,
        # before any events arrive; flushed by a debounced background thread.
        self._cache_conn = None
        self._cache_lock = threading.Lock()
        self._cache_dirty = False
        self._stop_flush = threading.Event()
        self._init_cache()
        self._thread = threading.Thread(
            target=self._run, name="whatsmeow-worker", daemon=True
        )
        self._thread.start()
        self._flush_thread = threading.Thread(
            target=self._cache_flush_loop, name="whatsmeow-cache", daemon=True
        )
        self._flush_thread.start()

    _MSG_CAP_PER_CHAT = 200  # keep the newest N messages per chat in memory

    # ------------------------------------------------------------------
    #  Public API (called from any thread, blocks until result ready)
    # ------------------------------------------------------------------

    def call(self, method: str, **kwargs) -> object:
        """Submit a job and wait for the result."""
        result_q: "queue.Queue" = queue.Queue()
        self._job_queue.put((method, kwargs, result_q))
        result = result_q.get()
        if isinstance(result, Exception):
            raise result
        return result

    @property
    def connected(self) -> bool:
        return self._connected and self._logged_in

    @property
    def no_library(self) -> bool:
        return self._no_library

    def shutdown(self):
        self._stop_flush.set()
        try:
            self._flush_cache()  # persist the latest state before exit
        except Exception:
            pass
        self._job_queue.put(self._SENTINEL)

    def get_pending_updates(self) -> list:
        """Drain all queued real-time events (non-blocking)."""
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
        while True:
            try:
                job = self._job_queue.get(timeout=0.25)
            except queue.Empty:
                continue
            if job is self._SENTINEL:
                self._do_cleanup()
                break
            method_name, kwargs, result_q = job
            try:
                method = getattr(self, f"_do_{method_name}", None)
                if method is None:
                    result_q.put(ValueError(f"Unknown method: {method_name}"))
                else:
                    result_q.put(method(**kwargs))
            except Exception as exc:  # never let the worker thread die
                logger.error("Whatsmeow worker error (%s): %s", method_name, exc)
                result_q.put(exc)

    # ------------------------------------------------------------------
    #  neonize helpers
    # ------------------------------------------------------------------

    def _ensure_client(self) -> bool:
        """Create the neonize client if not yet created. Returns success."""
        if self._client is not None:
            return True
        try:
            from neonize.client import NewClient  # type: ignore
        except Exception:
            self._no_library = True
            logger.warning(
                "neonize not installed — WhatsApp console will show an install hint"
            )
            return False
        try:
            self._client = NewClient(self._get_session_path())
            self._register_event_handlers()
            return True
        except Exception as e:
            logger.error("Failed to create neonize client: %s", e)
            return False

    def _register_event_handlers(self):
        """Register neonize event handlers that feed the update queue.

        Wrapped defensively: neonize's event names evolve between releases, so a
        missing symbol must not break login. Incoming events are normalised into
        the same dict shape the Telegram console's background loop expects.
        """
        if self._client is None:
            return
        try:
            from neonize import events as _wa_events

            ConnectedEv = _wa_events.ConnectedEv
            MessageEv = _wa_events.MessageEv
            PairStatusEv = _wa_events.PairStatusEv
            HistorySyncEv = getattr(_wa_events, "HistorySyncEv", None)

            @self._client.event(ConnectedEv)  # type: ignore
            def _on_connected(client, event):
                self._connected = True
                self._logged_in = True
                self._capture_own_jid()
                self._refresh_contact_store()
                # whatsmeow only pushes full history once (at link). On a plain
                # reconnect we get nothing, so seed the group chats live — this
                # is the one chat class we CAN enumerate without a history sync.
                self._seed_groups()
                try:
                    self._update_queue.put_nowait({"type": "history_synced"})
                except queue.Full:
                    pass

            @self._client.event(PairStatusEv)  # type: ignore
            def _on_pair(client, event):
                # Successfully linked as a companion device.
                self._logged_in = True
                self._connected = True
                self._capture_own_jid()

            @self._client.event(MessageEv)  # type: ignore
            def _on_message(client, event):
                try:
                    self._diag_once("message_ev", event)
                    entry, chat_jid = self._message_entry_from_event(event)
                    if chat_jid:
                        self._ingest_message(chat_jid, entry, bump_unread=not entry.is_outgoing)
                        self._update_queue.put_nowait(
                            {
                                "type": "new_message",
                                "chat_id": chat_jid,
                                "is_from_me": entry.is_outgoing,
                            }
                        )
                except queue.Full:
                    logger.debug("WhatsApp update queue full, dropping message")
                except Exception as e:
                    logger.debug("WhatsApp message event parse failed: %s", e)

            if HistorySyncEv is not None:
                @self._client.event(HistorySyncEv)  # type: ignore
                def _on_history(client, event):
                    try:
                        self._diag_once("history_ev", event)
                        self._ingest_history_sync(event)
                        self._update_queue.put_nowait({"type": "history_synced"})
                    except queue.Full:
                        pass
                    except Exception as e:
                        logger.debug("WhatsApp history sync parse failed: %s", e)
        except Exception as e:
            logger.warning("Could not register WhatsApp event handlers: %s", e)

    # ------------------------------------------------------------------
    #  Event parsing / in-memory store
    # ------------------------------------------------------------------

    def _diag_once(self, tag: str, obj) -> None:
        """Log the shape of a neonize object exactly once per *tag* (WA-DIAG).

        This is how we finalise the exact protobuf field layout against the
        installed neonize version without a hardware round-trip per guess.
        """
        if tag in self._diag_seen:
            return
        self._diag_seen.add(tag)
        try:
            fields = [a for a in dir(obj) if not a.startswith("_")]
            logger.info("WA-DIAG %s type=%s fields=%s", tag, type(obj).__name__, fields)
            logger.info("WA-DIAG %s repr=%s", tag, repr(obj)[:1500])
        except Exception as e:
            logger.info("WA-DIAG %s introspection failed: %s", tag, e)

    def _capture_own_jid(self):
        try:
            device = self._client.get_me()  # -> Device(JID, LID, PushName, ...)
            self._own_jid = _jid_str(getattr(device, "JID", None))
        except Exception as e:
            logger.debug("capture_own_jid failed: %s", e)

    def _refresh_contact_store(self):
        """Load contact names + the LID<->phone map from the whatsmeow store.

        whatsmeow persists both to the SQLite store (``whatsmeow_contacts`` and
        ``whatsmeow_lid_map``); there is no Go query API for them, so we read the
        tables directly (safe, no Go client, no nil-pointer risk).
        """
        self._load_store_maps()

    def _load_store_maps(self):
        import os
        import sqlite3

        path = self._get_session_path()
        if not os.path.exists(path):
            return
        contacts: "dict[str, str]" = {}
        lid_to_pn: "dict[str, str]" = {}
        try:
            con = sqlite3.connect(f"file:{path}?mode=ro", uri=True, timeout=2.0)
            try:
                try:
                    for lid, pn in con.execute("SELECT lid, pn FROM whatsmeow_lid_map"):
                        if lid and pn:
                            lid_to_pn[str(lid).split(":", 1)[0]] = str(pn).split(":", 1)[0]
                except sqlite3.Error:
                    pass
                try:
                    rows = con.execute(
                        "SELECT their_jid, full_name, push_name, first_name, "
                        "business_name FROM whatsmeow_contacts"
                    )
                    for their_jid, full, push, first, biz in rows:
                        name = full or push or first or biz
                        if their_jid and name:
                            contacts[_bare_jid(their_jid)] = str(name)
                except sqlite3.Error:
                    pass
            finally:
                con.close()
        except sqlite3.Error as e:
            logger.debug("load_store_maps failed: %s", e)
            return
        with self._store_lock:
            self._lid_to_pn.update(lid_to_pn)
            # Keep any names already learned from live push names; store wins on
            # conflict because it carries the user's real address-book name.
            self._contacts.update(contacts)
        logger.info(
            "WA store maps: %d contacts, %d lid mappings",
            len(contacts), len(lid_to_pn),
        )

    def _seed_groups(self):
        """Populate group chats from ``get_joined_groups`` (live client).

        Groups are the only conversation class whatsmeow lets us enumerate on a
        reconnect; 1:1 chats still depend on history sync / live messages /
        cache. Existing chats keep their newer data; we only add missing groups
        and fill in blank names.
        """
        try:
            groups = self._client.get_joined_groups()
        except Exception as e:
            logger.debug("get_joined_groups failed: %s", e)
            return
        added = 0
        with self._store_lock:
            for g in groups or []:
                jid = self._canon_jid(_jid_str(getattr(g, "JID", None)))
                if not jid or "@" not in jid:
                    continue
                gn = getattr(g, "GroupName", None)
                name = getattr(gn, "Name", "") if gn is not None else ""
                chat = self._chats_by_jid.get(jid)
                if chat is None:
                    self._chats_by_jid[jid] = ChatEntry(
                        id=jid,
                        name=transliterate(name)[:36] if name else "",
                        is_group=True,
                    )
                    added += 1
                elif name and not chat.name:
                    chat.name = transliterate(name)[:36]
        if added:
            self._mark_cache_dirty()
        logger.info("WA seeded %d group chats", added)

    def _canon_jid(self, jid_str: str) -> str:
        """Canonicalise a JID to a stable key: strip the device suffix and map
        ``@lid`` addresses to their phone (``@s.whatsapp.net``) form so history
        sync and live events land on the same chat."""
        if not jid_str or "@" not in jid_str:
            return jid_str
        user, server = jid_str.split("@", 1)
        user = user.split(":", 1)[0].split(".", 1)[0]  # drop :device / .agent
        if server == "lid":
            pn = self._lid_to_pn.get(user)
            if pn:
                return f"{pn}@s.whatsapp.net"
            return f"{user}@lid"
        return f"{user}@{server}"

    def _contact_name(self, jid: str) -> str:
        return self._contacts.get(jid) or _jid_user(jid)

    def _message_entry_from_event(self, event):
        """Build a (MessageEntry, chat_jid) tuple from a neonize MessageEv."""
        info = getattr(event, "Info", None)
        chat_jid = ""
        sender_jid = ""
        is_from_me = False
        epoch = time.time()
        msg_id = ""
        pushname = ""
        if info is not None:
            source = getattr(info, "MessageSource", None) or info
            chat_jid = self._canon_jid(_jid_str(getattr(source, "Chat", None)))
            sender_jid = self._canon_jid(_jid_str(getattr(source, "Sender", None)))
            is_from_me = bool(getattr(source, "IsFromMe", False))
            msg_id = str(getattr(info, "ID", "") or "")
            pushname = getattr(info, "Pushname", "") or getattr(info, "PushName", "") or ""
            ts = getattr(info, "Timestamp", None)
            epoch = _to_epoch(ts, epoch)
        text = _extract_message_text(getattr(event, "Message", None))
        # Learn the sender's push name so Contacts / chat names fill in over time.
        if pushname and sender_jid and not is_from_me:
            with self._store_lock:
                self._contacts.setdefault(sender_jid, pushname)
        sender_name = "" if is_from_me else (pushname or self._contact_name(sender_jid))
        entry = MessageEntry(
            id=msg_id,
            sender_name=transliterate(sender_name)[:20],
            text=transliterate(text)[:500],
            timestamp="",
            is_outgoing=is_from_me,
            epoch=epoch,
        )
        return entry, chat_jid

    def _ingest_message(self, chat_jid: str, entry: "MessageEntry", bump_unread: bool):
        """Append a message to the in-memory store and update the chat summary."""
        if not chat_jid:
            return
        with self._store_lock:
            # Dedupe by message id — whatsmeow re-delivers our own sent messages
            # via MessageEv (matching SendResponse.ID) and history can overlap.
            if entry.id:
                if entry.id in self._seen_ids:
                    return
                self._seen_ids.add(entry.id)
            msgs = self._messages_by_chat.setdefault(chat_jid, [])
            msgs.append(entry)
            if len(msgs) > self._MSG_CAP_PER_CHAT:
                del msgs[: len(msgs) - self._MSG_CAP_PER_CHAT]
            chat = self._chats_by_jid.get(chat_jid)
            if chat is None:
                # Name is resolved fresh at render time (get_dialogs) so it fills
                # in as contacts load; leave it empty here for 1:1 chats.
                chat = ChatEntry(id=chat_jid, name="", is_group=chat_jid.endswith("@g.us"))
                self._chats_by_jid[chat_jid] = chat
            # Keep the newest message as the preview / sort key (history can be
            # ingested out of order).
            if entry.epoch >= (chat.epoch or 0):
                chat.last_message = entry.text[:60]
                chat.epoch = entry.epoch
            if bump_unread:
                chat.unread_count += 1
        self._mark_cache_dirty()

    def _ingest_history_sync(self, event):
        """Extract conversations/messages from a HistorySyncEv into the store.

        The exact protobuf layout is version-specific; parsed defensively and
        logged once via WA-DIAG so it can be finalised precisely. Best-effort:
        any structural mismatch simply yields no history (live events still work).
        """
        # whatsmeow writes contacts + LID mappings to its store during history
        # sync; reload them first so JIDs canonicalise correctly this batch.
        self._load_store_maps()
        data = getattr(event, "Data", None) or event
        # Push names → contact display names (WAWebProtobufsHistorySync.Pushname).
        for pn in getattr(data, "pushnames", []) or []:
            jid = self._canon_jid(_jid_str(getattr(pn, "ID", "") or getattr(pn, "id", "")))
            name = getattr(pn, "pushname", "") or getattr(pn, "Pushname", "")
            if jid and name:
                with self._store_lock:
                    self._contacts.setdefault(jid, name)

        conversations = getattr(data, "conversations", None)
        if not conversations:
            return
        count = 0
        for conv in conversations:
            chat_jid = self._canon_jid(
                _jid_str(getattr(conv, "ID", "") or getattr(conv, "id", ""))
            )
            if not chat_jid or "@" not in chat_jid:
                continue
            conv_name = getattr(conv, "name", "") or getattr(conv, "displayName", "")
            unread = int(getattr(conv, "unreadCount", 0) or 0)
            for hm in getattr(conv, "messages", []) or []:
                webmsg = getattr(hm, "message", None)
                try:
                    entry, _ = self._message_entry_from_webmessage(webmsg, chat_jid)
                    if entry is not None:
                        self._ingest_message(chat_jid, entry, bump_unread=False)
                        count += 1
                except Exception:
                    continue
            # Finalise this chat: sort oldest-first, apply name + unread badge.
            with self._store_lock:
                self._messages_by_chat.get(chat_jid, []).sort(key=lambda m: m.epoch)
                chat = self._chats_by_jid.get(chat_jid)
                if chat is not None:
                    if conv_name:
                        chat.name = transliterate(conv_name)[:36]
                    chat.unread_count = unread
        self._mark_cache_dirty()
        logger.info(
            "WA history ingested %d messages across %d conversations",
            count, len(conversations),
        )

    def _message_entry_from_webmessage(self, webmsg, chat_jid: str):
        """Parse a history-sync WebMessageInfo-like object into a MessageEntry."""
        if webmsg is None:
            return None, chat_jid
        key = getattr(webmsg, "key", None) or getattr(webmsg, "Key", None)
        is_from_me = bool(getattr(key, "fromMe", False) or getattr(key, "FromMe", False))
        msg_id = str(getattr(key, "id", "") or getattr(key, "ID", "") or "")
        ts = getattr(webmsg, "messageTimestamp", None) or getattr(
            webmsg, "MessageTimestamp", None
        )
        epoch = _to_epoch(ts, 0.0)
        text = _extract_message_text(
            getattr(webmsg, "message", None) or getattr(webmsg, "Message", None)
        )
        if not text:
            return None, chat_jid
        pushname = getattr(webmsg, "pushName", "") or getattr(webmsg, "PushName", "") or ""
        sender_name = "" if is_from_me else (pushname or self._contact_name(chat_jid))
        return (
            MessageEntry(
                id=msg_id,
                sender_name=transliterate(sender_name)[:20],
                text=transliterate(text)[:500],
                is_outgoing=is_from_me,
                epoch=epoch,
            ),
            chat_jid,
        )

    # ------------------------------------------------------------------
    #  Job implementations
    # ------------------------------------------------------------------

    def _do_connect(self) -> str:
        """Connect using any stored session. Returns a status string."""
        if not self._ensure_client():
            return "no_library" if self._no_library else "error:Cannot init client"
        try:
            if self._is_logged_in_store():
                # Load names + LID map now (SQLite only) so the cached chat list
                # renders with real names before the socket even connects.
                self._load_store_maps()
                self._start_background_connect()
                self._logged_in = True
                self._connected = True
                return "authorized"
            return "need_login"
        except Exception as e:
            return f"error:{e}"

    def _do_start_login(self, phone: str = "") -> str:
        """Begin phone-pairing login. Returns 'code:XXXXXXXX' or an error.

        neonize/whatsmeow exposes ``PairPhone`` which returns an 8-character
        linking code the user types into WhatsApp on their phone. The exact
        method name/signature must be finalised against the installed neonize
        version during the Phase-0 hardware spike (GH #20); we probe a couple of
        known spellings and fall back to a clear error.
        """
        if not phone:
            return "error:No phone number configured"
        if not self._ensure_client():
            return "no_library" if self._no_library else "error:Cannot init client"
        try:
            self._start_background_connect()
            # whatsmeow fires its "connected" event only *after* the device is
            # linked, so we must not gate on it here — just give the unauth
            # socket a brief moment to come up, then request the pairing code.
            time.sleep(1.5)
            code = self._request_pair_code(phone)
            if not code:
                return "error:Pairing not supported by client"
            self._pairing_code = code
            return f"code:{code}"
        except Exception as e:
            return f"error:{e}"

    def _do_poll_status(self) -> str:
        """Return 'authorized' once linked, else 'waiting'."""
        if self._logged_in:
            return "authorized"
        return "waiting"

    def _do_get_dialogs(
        self, limit: int = MAX_DIALOGS, tz_offset_minutes: int = 0
    ) -> List[ChatEntry]:
        """Fetch the conversation list.

        whatsmeow has no single "get dialogs" call like Telethon: the chat list
        is derived from the contact store plus recent message history. neonize
        surfaces this differently across versions, so this is wrapped
        defensively and returns [] (empty list, "No chats yet") on any mismatch.
        """
        if not self.connected or self._client is None:
            return []
        try:
            tz = timezone(timedelta(minutes=tz_offset_minutes))
            with self._store_lock:
                chats = list(self._chats_by_jid.values())
            # Sort by most-recent message first (newest at the top).
            chats.sort(key=lambda c: c.epoch or 0, reverse=True)
            chats = chats[:limit]
            for c in chats:
                c.timestamp = _fmt_chat_time(c.epoch, tz)
                # Resolve the display name fresh so it fills in as the contact
                # store loads. Groups keep their history-provided title.
                if c.is_group:
                    c.name = transliterate(c.name or _jid_user(c.id))[:36]
                else:
                    c.name = transliterate(self._contact_name(c.id))[:36]
            return chats
        except Exception as e:
            logger.error("WhatsApp get_dialogs error: %s", e)
            return []

    def _do_get_messages(
        self, chat_id: str = "", limit: int = MAX_MESSAGES, tz_offset_minutes: int = 0
    ) -> List[MessageEntry]:
        """Return messages for a chat from the in-memory store (newest last)."""
        if not self.connected or not chat_id or self._client is None:
            return []
        try:
            tz = timezone(timedelta(minutes=tz_offset_minutes))
            with self._store_lock:
                msgs = list(self._messages_by_chat.get(chat_id, []))[-limit:]
            for m in msgs:
                m.timestamp = _fmt_hm(m.epoch, tz)
            return msgs
        except Exception as e:
            logger.error("WhatsApp get_messages error: %s", e)
            return []

    def _do_send_message(self, chat_id: str = "", text: str = "") -> str:
        if not self.connected or not chat_id or not text or self._client is None:
            return "error:Not connected or empty message"
        try:
            jid = self._build_jid(chat_id)
            resp = self._client.send_message(jid, text)  # -> SendResponse
            # Echo into the local store so the sent line shows immediately. Tag
            # it with the returned ID so the IsFromMe MessageEv round-trip is
            # deduped rather than shown twice.
            sent_id = str(getattr(resp, "ID", "") or "")
            self._ingest_message(
                chat_id,
                MessageEntry(
                    id=sent_id,
                    text=transliterate(text)[:500],
                    is_outgoing=True,
                    epoch=_to_epoch(getattr(resp, "Timestamp", None), time.time()),
                ),
                bump_unread=False,
            )
            return "ok"
        except Exception as e:
            return f"error:{e}"

    def _do_send_typing(self, chat_id: str = "") -> str:
        return self._set_presence(chat_id, composing=True)

    def _do_cancel_typing(self, chat_id: str = "") -> str:
        return self._set_presence(chat_id, composing=False)

    def _do_mark_read(self, chat_id: str = "", max_id: str = "") -> str:
        if not self.connected or not chat_id or self._client is None:
            return "error:Not connected"
        # Clear the local unread badge regardless of the server round-trip.
        with self._store_lock:
            chat = self._chats_by_jid.get(chat_id)
            if chat is not None:
                chat.unread_count = 0
        self._mark_cache_dirty()
        try:
            from neonize.utils.enum import ReceiptType

            if max_id:
                jid = self._build_jid(chat_id)
                # 1:1 chat: sender == chat. (Group read-receipts need the real
                # per-message sender; deferred — group unread still clears locally.)
                self._client.mark_read(
                    max_id, chat=jid, sender=jid, receipt=ReceiptType.READ
                )
            return "ok"
        except Exception as e:
            logger.debug("mark_read failed: %s", e)
            return "ok"  # best-effort; local unread already cleared

    def _do_get_contacts(self) -> List[ContactEntry]:
        if not self.connected or self._client is None:
            return []
        try:
            if not self._contacts:
                self._refresh_contact_store()
            with self._store_lock:
                items = list(self._contacts.items())
            result = [
                ContactEntry(
                    id=jid,
                    name=transliterate(name)[:30],
                    phone=_jid_user(jid),
                    username="",
                )
                for jid, name in items
                if jid.endswith("@s.whatsapp.net")  # people, not groups
            ]
            result.sort(key=lambda c: c.name.lower())
            return result
        except Exception as e:
            logger.error("WhatsApp get_contacts error: %s", e)
            return []

    def _do_logout(self) -> str:
        try:
            if self._client is not None:
                logout = getattr(self._client, "logout", None)
                if logout is not None:
                    try:
                        logout()
                    except Exception:
                        pass
            self._connected = False
            self._logged_in = False
            self._pairing_code = ""
            # Remove the neonize session store so the next login re-pairs.
            self._remove_session_store()
            self._client = None
            self._connect_thread = None  # allow a fresh connect on re-login
            return "ok"
        except Exception as e:
            self._connected = False
            self._logged_in = False
            return f"error:{e}"

    def _do_cleanup(self):
        try:
            if self._client is not None:
                disconnect = getattr(self._client, "disconnect", None)
                if disconnect is not None:
                    disconnect()
        except Exception:
            pass
        self._connected = False
        self._client = None

    # ------------------------------------------------------------------
    #  neonize thin wrappers (isolated so version drift is easy to patch)
    # ------------------------------------------------------------------

    def _start_background_connect(self):
        """Start neonize's blocking connect loop in its own thread (idempotent)."""
        if getattr(self, "_connect_thread", None) is not None:
            return
        connect = getattr(self._client, "connect", None)
        if connect is None:
            return

        def _runner():
            try:
                connect()
            except Exception as e:
                logger.error("neonize connect loop ended: %s", e)
                self._connected = False

        self._connect_thread = threading.Thread(
            target=_runner, name="whatsmeow-connect", daemon=True
        )
        self._connect_thread.start()

    def _request_pair_code(self, phone: str) -> str:
        """Try known neonize spellings for the phone-pairing call."""
        digits = phone.lstrip("+").strip()
        for attr in ("pair_phone", "PairPhone"):
            fn = getattr(self._client, attr, None)
            if fn is None:
                continue
            try:
                code = fn(digits, True)
            except TypeError:
                code = fn(digits)
            if code:
                return str(code)
        return ""

    def _set_presence(self, chat_id: str, composing: bool) -> str:
        if not self.connected or not chat_id or self._client is None:
            return "error:Not connected"
        try:
            from neonize.utils.enum import ChatPresence, ChatPresenceMedia

            state = (
                ChatPresence.CHAT_PRESENCE_COMPOSING
                if composing
                else ChatPresence.CHAT_PRESENCE_PAUSED
            )
            self._client.send_chat_presence(
                self._build_jid(chat_id), state, ChatPresenceMedia.CHAT_PRESENCE_MEDIA_TEXT
            )
            return "ok"
        except Exception as e:
            logger.debug("send_chat_presence failed: %s", e)
            return "ok"  # presence is best-effort, never surface as an error

    def _build_jid(self, chat_id: str):
        """Turn a stored JID string into whatever neonize's send API expects."""
        try:
            from neonize.utils import build_jid  # type: ignore

            if "@" in chat_id:
                user, server = chat_id.split("@", 1)
                return build_jid(user, server)
            return build_jid(chat_id)
        except Exception:
            return chat_id

    def _safe_get_all_contacts(self) -> dict:
        """Return {jid_str: contact_info} from whatsmeow's contact store.

        neonize spells this differently across versions, so probe several paths
        and normalise the result to a plain dict. The first successful call is
        logged once (WA-DIAG) with its type so the layout can be pinned down.
        """
        candidates = [
            lambda c: c.get_all_contacts(),
            lambda c: c.contact.get_all_contacts(),
            lambda c: c.store.contacts.get_all_contacts(),
            lambda c: c.get_contacts(),
        ]
        for getter in candidates:
            try:
                data = getter(self._client)
            except Exception:
                continue
            if data is None:
                continue
            self._diag_once("contacts_raw", data)
            norm = _normalise_contacts(data)
            if norm:
                return norm
        return {}

    def _is_logged_in_store(self) -> bool:
        """Return True if the neonize store already holds a linked device.

        Reads the whatsmeow SQLite store **directly** (the ``whatsmeow_device``
        table gets one row per linked device). We must NOT use ``get_me()`` /
        ``is_logged_in`` here: those call into the Go layer, whose per-client
        object is only created once ``connect()`` runs. Calling ``GetMe`` on an
        unconnected client dereferences a nil pointer and crashes the whole
        process (``SIGSEGV main.GetMe``). Querying SQLite is safe pre-connect.
        """
        import os
        import sqlite3

        path = self._get_session_path()
        if not os.path.exists(path):
            return False
        try:
            con = sqlite3.connect(f"file:{path}?mode=ro", uri=True, timeout=2.0)
            try:
                row = con.execute(
                    "SELECT COUNT(*) FROM whatsmeow_device "
                    "WHERE jid IS NOT NULL AND jid <> ''"
                ).fetchone()
            finally:
                con.close()
            return bool(row and row[0] > 0)
        except sqlite3.Error:
            # Missing table / fresh DB / lock: treat as not linked (need login).
            return False

    # ------------------------------------------------------------------
    #  Session store on disk
    # ------------------------------------------------------------------

    @staticmethod
    def _get_session_path() -> str:
        import os

        from workspace_init import WORKSPACE_DIR

        config_dir = os.path.join(WORKSPACE_DIR, ".config")
        os.makedirs(config_dir, exist_ok=True)
        # whatsmeow persists device state in a SQLite DB (not a single file).
        return os.path.join(config_dir, "whatsapp.sqlite3")

    def _remove_session_store(self):
        import os

        base = self._get_session_path()
        for suffix in ("", "-wal", "-shm"):
            path = base + suffix
            try:
                if os.path.exists(path):
                    os.remove(path)
            except OSError:
                pass

    # ------------------------------------------------------------------
    #  Chat/message disk cache (survives server restart)
    # ------------------------------------------------------------------

    def _get_cache_path(self) -> str:
        import os

        return os.path.join(
            os.path.dirname(self._get_session_path()), "whatsapp_cache.sqlite3"
        )

    def _init_cache(self):
        """Open the cache DB, create schema, and load it into memory."""
        import sqlite3

        try:
            conn = sqlite3.connect(
                self._get_cache_path(), check_same_thread=False, timeout=5.0
            )
            conn.execute(
                "CREATE TABLE IF NOT EXISTS wa_chats("
                "jid TEXT PRIMARY KEY, name TEXT, is_group INTEGER, "
                "last_message TEXT, unread INTEGER, epoch REAL)"
            )
            conn.execute(
                "CREATE TABLE IF NOT EXISTS wa_messages("
                "chat_jid TEXT, msg_id TEXT, sender_name TEXT, text TEXT, "
                "is_outgoing INTEGER, epoch REAL, PRIMARY KEY(chat_jid, msg_id))"
            )
            conn.commit()
            self._cache_conn = conn
            self._load_cache()
        except Exception as e:
            logger.warning("WhatsApp cache init failed: %s", e)
            self._cache_conn = None

    def _load_cache(self):
        conn = self._cache_conn
        if conn is None:
            return
        try:
            with self._cache_lock:
                chat_rows = conn.execute(
                    "SELECT jid, name, is_group, last_message, unread, epoch "
                    "FROM wa_chats"
                ).fetchall()
                msg_rows = conn.execute(
                    "SELECT chat_jid, msg_id, sender_name, text, is_outgoing, epoch "
                    "FROM wa_messages ORDER BY epoch"
                ).fetchall()
        except Exception as e:
            logger.debug("WhatsApp cache load failed: %s", e)
            return
        with self._store_lock:
            for jid, name, is_group, last_msg, unread, epoch in chat_rows:
                self._chats_by_jid[jid] = ChatEntry(
                    id=jid,
                    name=name or "",
                    is_group=bool(is_group),
                    last_message=last_msg or "",
                    unread_count=int(unread or 0),
                    epoch=float(epoch or 0.0),
                )
            for chat_jid, msg_id, sender, text, outgoing, epoch in msg_rows:
                self._messages_by_chat.setdefault(chat_jid, []).append(
                    MessageEntry(
                        id=msg_id or "",
                        sender_name=sender or "",
                        text=text or "",
                        is_outgoing=bool(outgoing),
                        epoch=float(epoch or 0.0),
                    )
                )
                if msg_id:
                    self._seen_ids.add(msg_id)
            for jid, msgs in self._messages_by_chat.items():
                if len(msgs) > self._MSG_CAP_PER_CHAT:
                    del msgs[: len(msgs) - self._MSG_CAP_PER_CHAT]
        logger.info(
            "WhatsApp cache loaded: %d chats, %d messages",
            len(chat_rows), len(msg_rows),
        )

    def _mark_cache_dirty(self):
        self._cache_dirty = True

    def _cache_flush_loop(self):
        """Debounced background writer: snapshot the store every few seconds."""
        while not self._stop_flush.is_set():
            self._stop_flush.wait(3.0)
            try:
                self._flush_cache()
            except Exception as e:
                logger.debug("WhatsApp cache flush error: %s", e)

    def _flush_cache(self):
        if self._cache_conn is None:
            return
        with self._store_lock:
            if not self._cache_dirty:
                return
            self._cache_dirty = False
            chats = [
                (c.id, c.name, int(c.is_group), c.last_message,
                 int(c.unread_count), float(c.epoch or 0.0))
                for c in self._chats_by_jid.values()
            ]
            msgs = [
                (jid, m.id, m.sender_name, m.text, int(m.is_outgoing),
                 float(m.epoch or 0.0))
                for jid, ms in self._messages_by_chat.items()
                for m in ms
            ]
        try:
            with self._cache_lock:
                conn = self._cache_conn
                conn.execute("BEGIN")
                conn.execute("DELETE FROM wa_chats")
                conn.execute("DELETE FROM wa_messages")
                conn.executemany(
                    "INSERT INTO wa_chats VALUES (?, ?, ?, ?, ?, ?)", chats
                )
                conn.executemany(
                    "INSERT OR IGNORE INTO wa_messages VALUES (?, ?, ?, ?, ?, ?)", msgs
                )
                conn.commit()
        except Exception as e:
            logger.debug("WhatsApp cache write failed: %s", e)
            try:
                self._cache_conn.rollback()
            except Exception:
                pass


# ── Module-level helpers ────────────────────────────────────────────


def _jid_str(jid) -> str:
    """Normalise a neonize JID object (or string) to 'user@server'."""
    if jid is None:
        return ""
    if isinstance(jid, str):
        return jid
    user = getattr(jid, "User", "") or ""
    server = getattr(jid, "Server", "") or ""
    if user and server:
        return f"{user}@{server}"
    return str(jid)


def _jid_user(jid) -> str:
    s = _jid_str(jid)
    return s.split("@", 1)[0] if "@" in s else s


def _bare_jid(jid) -> str:
    """'user@server' with any ':device'/'.agent' suffix stripped from the user."""
    s = _jid_str(jid)
    if "@" not in s:
        return s
    user, server = s.split("@", 1)
    user = user.split(":", 1)[0].split(".", 1)[0]
    return f"{user}@{server}"


_NAME_KEYS = ("FullName", "PushName", "BusinessName", "FirstName",
              "full_name", "push_name", "business_name", "first_name")


def _contact_display_name(info) -> str:
    """Pull a human name out of a neonize contact info object/dict."""
    if info is None:
        return ""
    if isinstance(info, str):
        return info
    if isinstance(info, dict):
        for key in _NAME_KEYS:
            val = info.get(key)
            if val:
                return str(val)
        return ""
    for attr in _NAME_KEYS:
        val = getattr(info, attr, "")
        if val:
            return str(val)
    return ""


def _normalise_contacts(data) -> dict:
    """Coerce a neonize contact-store result into {jid_str: info}."""
    out: dict = {}
    # dict/map: {JID-or-str: info}
    if isinstance(data, dict):
        for jid, info in data.items():
            js = _jid_str(jid)
            if js:
                out[js] = info
        return out
    # protobuf wrapper with a repeated/map field (e.g. .Contact / .contacts)
    for field in ("Contact", "contacts", "Contacts"):
        rel = getattr(data, field, None)
        if rel is None:
            continue
        try:
            if hasattr(rel, "items"):  # protobuf map
                for jid, info in rel.items():
                    js = _jid_str(jid)
                    if js:
                        out[js] = info
                return out
            for item in rel:  # repeated: each item carries its own JID
                js = _jid_str(
                    getattr(item, "JID", None) or getattr(item, "jid", None)
                )
                if js:
                    out[js] = item
            if out:
                return out
        except Exception:
            continue
    # plain iterable of contact objects
    try:
        for item in data:
            js = _jid_str(getattr(item, "JID", None) or getattr(item, "jid", None))
            if js:
                out[js] = item
    except Exception:
        pass
    return out


def _extract_message_text(msg) -> str:
    """Extract display text from a whatsmeow/neonize Message proto."""
    if msg is None:
        return ""
    # Plain text
    for attr in ("conversation", "Conversation"):
        val = getattr(msg, attr, None)
        if val:
            return str(val)
    # Extended text (links, replies, formatting)
    for attr in ("extendedTextMessage", "ExtendedTextMessage"):
        ext = getattr(msg, attr, None)
        if ext is not None:
            txt = getattr(ext, "text", None) or getattr(ext, "Text", None)
            if txt:
                return str(txt)
    # Media captions / placeholders
    media = (
        ("imageMessage", "ImageMessage", "[Photo]"),
        ("videoMessage", "VideoMessage", "[Video]"),
        ("audioMessage", "AudioMessage", "[Audio]"),
        ("documentMessage", "DocumentMessage", "[Document]"),
        ("stickerMessage", "StickerMessage", "[Sticker]"),
        ("contactMessage", "ContactMessage", "[Contact]"),
        ("locationMessage", "LocationMessage", "[Location]"),
    )
    for lower, upper, placeholder in media:
        name = lower if _proto_has(msg, lower) else (upper if _proto_has(msg, upper) else None)
        if name is None:
            continue
        m = getattr(msg, name, None)
        caption = getattr(m, "caption", None) or getattr(m, "Caption", None)
        return str(caption) if caption else placeholder
    return ""


def _proto_has(msg, field: str) -> bool:
    """True if *field* is set on a protobuf message (or truthy on a plain obj).

    Protobuf singular sub-message fields are never None when unset, so we must
    use HasField; non-protobuf objects fall back to attribute truthiness.
    """
    has = getattr(msg, "HasField", None)
    if callable(has):
        try:
            return bool(has(field))
        except Exception:
            return False
    return bool(getattr(msg, field, None))


def _to_epoch(ts, default: float) -> float:
    """Coerce a neonize timestamp (datetime | int | proto) to unix seconds."""
    if ts is None:
        return default
    try:
        import datetime as _dt

        if isinstance(ts, (int, float)):
            return float(ts)
        if isinstance(ts, _dt.datetime):
            return ts.timestamp()
        # protobuf Timestamp with .seconds, or object with .timestamp()
        secs = getattr(ts, "seconds", None)
        if secs is not None:
            return float(secs)
        if hasattr(ts, "timestamp"):
            return float(ts.timestamp())
    except Exception:
        pass
    return default


def _fmt_hm(epoch: float, tz) -> str:
    """Format unix seconds as HH:MM in *tz*; '' if unknown."""
    if not epoch:
        return ""
    try:
        import datetime as _dt

        return _dt.datetime.fromtimestamp(epoch, tz).strftime("%H:%M")
    except Exception:
        return ""


def _fmt_chat_time(epoch: float, tz) -> str:
    """Chat-list timestamp: HH:MM if today, else a date (no time).

    Same day  -> "%H:%M"   (e.g. 21:36)
    This year -> "%d %b"   (e.g. 27 Jul)
    Older     -> "%d/%m/%y" (e.g. 27/07/25)
    """
    if not epoch:
        return ""
    try:
        import datetime as _dt

        dt = _dt.datetime.fromtimestamp(epoch, tz)
        now = _dt.datetime.now(tz)
        if dt.date() == now.date():
            return dt.strftime("%H:%M")
        if dt.year == now.year:
            return dt.strftime("%d %b")
        return dt.strftime("%d/%m/%y")
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
    """PETSCII WhatsApp chat client (default console slot 9, CBM+9)."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.worker = _get_worker()

        # Mode state
        self.mode: int = MODE_CHATS
        self.prev_mode: int = MODE_CHATS

        # Login state
        self.login_state: int = LOGIN_NEED_PHONE
        self.login_code: str = ""
        self.login_error: str = ""
        self.login_status: str = ""

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
        self._last_typing_sent: float = 0.0
        self._typing_send_interval_sec: float = 3.0

        # Contacts state
        self.contacts: List[ContactEntry] = []
        self.contact_sel: int = 0
        self.contact_scroll: int = 0
        # Type-ahead search: letters typed in the contact list jump to a match.
        self.contact_search: str = ""
        self.contact_search_ts: float = 0.0

        # Help scroll
        self.help_scroll: int = 0

        # Transient status shown in the chat-list status bar.
        self._chat_status: str = ""

        # Read-state dedupe: last acknowledged message id per chat.
        self._last_read_by_chat: dict = {}

        # Aggregate unread for the launcher badge.
        self._last_unread_total: int = 0

        # Lock guarding concurrent renders from bg threads + main thread.
        self._render_lock = threading.Lock()
        self._is_active = False

        # Background event pump (incoming messages / link completion).
        self._event_stop = threading.Event()
        self._event_thread = threading.Thread(
            target=self._bg_event_loop, name="wa-events", daemon=True
        )
        self._event_thread.start()

        # Try to connect on creation.
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

    def _get_phone(self) -> str:
        return self._read_config().get("WHATSAPP_PHONE", "").strip()

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

    # =================================================================
    #  AUTO-CONNECT / LOGIN
    # =================================================================

    def _try_auto_connect(self):
        """Connect with a stored session, or move into the pairing flow."""
        try:
            result = self.worker.call("connect")
        except Exception as e:
            self.mode = MODE_LOGIN
            self.login_state = LOGIN_ERROR
            self.login_error = str(e)[:38]
            return

        if result == "authorized":
            self.mode = MODE_CHATS
            self._refresh_chats()
        elif result == "no_library":
            self.mode = MODE_LOGIN
            self.login_state = LOGIN_NO_LIBRARY
        elif result == "need_login":
            self._begin_pairing()
        else:
            self.mode = MODE_LOGIN
            self.login_state = LOGIN_ERROR
            self.login_error = str(result).replace("error:", "")[:38]

    def _begin_pairing(self):
        """Request a pairing code, or prompt for phone config if unset."""
        self.mode = MODE_LOGIN
        phone = self._get_phone()
        if not phone:
            self.login_state = LOGIN_NEED_PHONE
            return
        self.login_state = LOGIN_PAIRING
        self.login_status = "Requesting pairing code..."
        self.login_code = ""
        self.login_error = ""
        self._full_render()
        self._push_screen()
        try:
            result = self.worker.call("start_login", phone=phone)
        except Exception as e:
            self.login_state = LOGIN_ERROR
            self.login_error = str(e)[:38]
            return
        if isinstance(result, str) and result.startswith("code:"):
            self.login_code = result[len("code:"):]
            self.login_status = ""
        elif result == "no_library":
            self.login_state = LOGIN_NO_LIBRARY
        else:
            self.login_state = LOGIN_ERROR
            self.login_error = str(result).replace("error:", "")[:38]
        # The pairing code / error only becomes known after the blocking
        # start_login call above; the earlier push (line ~1606) only showed
        # "Requesting...". Re-render and, if this console is on-screen, push so
        # the code appears immediately instead of waiting for the user's next
        # keypress to trigger a repaint. When called during __init__ (before
        # activation) _is_active is False and on_activate does the first push.
        self._full_render()
        if self._is_active:
            self._push_screen()

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        self._is_active = True
        self._send_vic_colors(COL_LIGHT_GREEN, COL_BLACK)
        with self._render_lock:
            if self.worker.connected:
                if self.mode == MODE_LOGIN:
                    self.mode = MODE_CHATS
                if self.mode == MODE_CHATS:
                    self._refresh_chats()
                elif self.mode == MODE_CHAT_VIEW and self.current_chat_id:
                    self._refresh_messages(self.current_chat_id)
            self._full_render()
            self._push_screen()

    def on_deactivate(self):
        self._is_active = False

    def get_badge(self) -> Optional[str]:
        total = self._last_unread_total
        if total <= 0:
            return None
        return "99+" if total > 99 else str(total)

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        with self._render_lock:
            handlers = {
                MODE_LOGIN: self._key_login,
                MODE_CHATS: self._key_chats,
                MODE_CHAT_VIEW: self._key_chat_view,
                MODE_CONTACTS: self._key_contacts,
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
        if key == KEY_F8:
            self.prev_mode = MODE_LOGIN
            self.help_scroll = 0
            self.mode = MODE_HELP
        elif key in (KEY_RETURN, KEY_HOME):
            # Re-read config (the user may have set the phone in the UI) and
            # retry the pairing flow.
            self._try_auto_connect()

    # ── CHATS mode ───────────────────────────────────────────────────

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

        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.chat_sel = min(len(self.chats) - 1, self.chat_sel + CONTENT_ROWS)
            self.chat_scroll = max(0, self.chat_sel - CONTENT_ROWS + 1)

        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.chat_sel = max(0, self.chat_sel - CONTENT_ROWS)
            self.chat_scroll = min(self.chat_scroll, self.chat_sel)

        elif key == KEY_F3:
            self.mode = MODE_CONTACTS
            self._refresh_contacts()

        elif key == KEY_RETURN:
            if self.chats:
                chat = self.chats[self.chat_sel]
                self._open_chat(chat.id, chat.name)

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

        elif key == KEY_SHIFT_PERIOD and cbm:
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            self.msg_scroll = min(max_scroll, self.msg_scroll + self._msg_display_rows())

        elif key == KEY_SHIFT_COMA and cbm:
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
            elif self.msg_cursor > 0:
                self.msg_cursor -= 1
            self._clamp_input_scroll()

        elif key == KEY_CRSR_RT:
            if cbm:
                self.msg_cursor = self._word_jump_right(self.msg_input, self.msg_cursor)
            elif self.msg_cursor < len(self.msg_input):
                self.msg_cursor += 1
            self._clamp_input_scroll()

        elif key == KEY_HOME:
            self._chat_status = "Refreshing..."
            self._full_render()
            self._push_screen()
            self._chat_status = ""
            self._refresh_messages(self.current_chat_id)

        elif key in (KEY_RUNSTOP, KEY_LEFT_ARROW, KEY_F1):
            self._back_to_chats()

        elif key == KEY_F8:
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

    def _back_to_chats(self):
        self.mode = MODE_CHATS
        self.msg_input = ""
        self.msg_cursor = 0
        self.msg_input_scroll = 0
        self._refresh_chats()

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

        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.contact_sel = min(
                len(self.contacts) - 1, self.contact_sel + CONTENT_ROWS
            )
            self.contact_scroll = max(0, self.contact_sel - CONTENT_ROWS + 1)

        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.contact_sel = max(0, self.contact_sel - CONTENT_ROWS)
            self.contact_scroll = min(self.contact_scroll, self.contact_sel)

        elif key == KEY_RETURN:
            if self.contacts:
                contact = self.contacts[self.contact_sel]
                self._open_chat(contact.id, contact.name)

        elif key == KEY_F1:
            self.mode = MODE_CHATS
            self._refresh_chats()

        elif key == KEY_F8:
            self.prev_mode = MODE_CONTACTS
            self.help_scroll = 0
            self.mode = MODE_HELP

        elif key == KEY_RUNSTOP:
            self.mode = MODE_CHATS
            self._refresh_chats()

        elif key == KEY_DEL:
            # Trim the type-ahead query one character.
            if self.contact_search:
                self.contact_search = self.contact_search[:-1]
                self.contact_search_ts = time.time()
                if self.contact_search:
                    self._contact_search_jump(self.contact_search, 0)

        else:
            ch = self._petscii_to_printable(key)
            if ch:
                self._contact_typeahead(ch)

    def _contact_typeahead(self, ch: str):
        """Incremental type-ahead: build a query and jump to a matching contact.

        Typing letters narrows from the top; the buffer resets after a short
        pause. Repeating a single letter cycles through contacts starting with
        it, which is the familiar list-box behaviour.
        """
        now = time.time()
        ch = ch.lower()
        if now - self.contact_search_ts > 1.2:
            self.contact_search = ""
        self.contact_search_ts = now

        if self.contact_search and all(c == ch for c in self.contact_search):
            # Same letter again -> next match after the current selection.
            self.contact_search = ch
            self._contact_search_jump(ch, self.contact_sel + 1)
        else:
            self.contact_search += ch
            self._contact_search_jump(self.contact_search, 0)

    def _contact_search_jump(self, query: str, start: int):
        """Select the next contact matching *query* (prefix, then substring),
        scanning from *start* and wrapping around."""
        if not self.contacts or not query:
            return
        n = len(self.contacts)
        start = max(0, start) % n
        order = list(range(start, n)) + list(range(0, start))
        for match_fn in (str.startswith, str.__contains__):
            for i in order:
                if match_fn(self.contacts[i].name.lower(), query):
                    self.contact_sel = i
                    self._clamp_contact_scroll()
                    return

    def _clamp_contact_scroll(self):
        if self.contact_sel < self.contact_scroll:
            self.contact_scroll = self.contact_sel
        elif self.contact_sel >= self.contact_scroll + CONTENT_ROWS:
            self.contact_scroll = self.contact_sel - CONTENT_ROWS + 1

    # ── HELP mode (F8) ──────────────────────────────────────────────

    def _key_help(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.help_scroll > 0:
                self.help_scroll -= 1
        elif key == KEY_CRSR_DN:
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            if self.help_scroll < max_scroll:
                self.help_scroll += 1
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.help_scroll = max(0, self.help_scroll - CONTENT_ROWS)
        elif key in (KEY_F8, KEY_RUNSTOP):
            self.mode = self.prev_mode if self.prev_mode != MODE_HELP else MODE_CHATS

    # =================================================================
    #  WHATSAPP API WRAPPERS
    # =================================================================

    def _refresh_chats(self):
        try:
            tz_minutes = self._get_tz_offset_minutes()
            self.chats = self.worker.call("get_dialogs", tz_offset_minutes=tz_minutes)
            if self.chat_sel >= len(self.chats):
                self.chat_sel = max(0, len(self.chats) - 1)
            self._last_unread_total = sum(c.unread_count for c in self.chats)
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
            self.contact_search = ""  # start each visit with a fresh query
        except Exception as e:
            logger.error("refresh_contacts: %s", e)

    def _open_chat(self, chat_id: str, chat_name: str):
        self.current_chat_id = chat_id
        self.current_chat_name = chat_name
        self.msg_input = ""
        self.msg_cursor = 0
        self.msg_input_scroll = 0
        self._refresh_messages(chat_id)
        self._mark_chat_read_if_needed(chat_id)
        self.mode = MODE_CHAT_VIEW

    def _do_send_message(self):
        text = self.msg_input.strip()
        if not text:
            return
        try:
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

    def _send_typing_if_needed(self):
        chat_id = self.current_chat_id
        if not chat_id or not self.worker.connected:
            return
        now = time.monotonic()
        if now - self._last_typing_sent < self._typing_send_interval_sec:
            return
        self._last_typing_sent = now
        try:
            self.worker.call("send_typing", chat_id=chat_id)
        except Exception as e:
            logger.debug("send_typing failed: %s", e)

    def _mark_chat_read_if_needed(self, chat_id: str):
        if not chat_id or not self.messages:
            return
        newest = self.messages[-1].id if self.messages else ""
        if not newest or self._last_read_by_chat.get(chat_id) == newest:
            return
        try:
            result = self.worker.call("mark_read", chat_id=chat_id, max_id=newest)
            if result == "ok":
                self._last_read_by_chat[chat_id] = newest
        except Exception as e:
            logger.debug("mark_read failed: %s", e)

    # =================================================================
    #  REAL-TIME EVENTS
    # =================================================================

    def _bg_event_loop(self):
        """Daemon thread: consume worker events (incoming msgs, link done)."""
        while not self._event_stop.wait(timeout=0.5):
            try:
                # If we are still on the login screen, poll for link completion.
                if self.mode == MODE_LOGIN and self.login_state == LOGIN_PAIRING:
                    try:
                        if self.worker.call("poll_status") == "authorized":
                            with self._render_lock:
                                self.mode = MODE_CHATS
                                self._refresh_chats()
                                self._full_render()
                                if self._is_active:
                                    self._push_screen()
                    except Exception:
                        pass

                updates = self.worker.get_pending_updates()
                for update in updates:
                    self._process_event(update)
            except Exception as e:
                logger.debug("wa bg_event_loop error: %s", e)

    def _process_event(self, event: dict):
        if not event:
            return
        event_type = event.get("type")
        event_chat_id = event.get("chat_id")
        is_from_me = event.get("is_from_me", False)

        with self._render_lock:
            from sdk.console_manager import ConsoleManager

            mgr = ConsoleManager.instance()
            is_active = mgr._active.get(self.session_id) == self.console_id

            if event_type == "new_message":
                viewing_this = (
                    is_active
                    and self.mode == MODE_CHAT_VIEW
                    and event_chat_id == self.current_chat_id
                )
                if viewing_this:
                    self._refresh_messages(event_chat_id)
                    self._mark_chat_read_if_needed(event_chat_id)
                else:
                    # Store already updated by the worker; pull the fresh chat
                    # list (reads memory) so unread badges + previews are current.
                    self._refresh_chats()
                    if not is_from_me:
                        self._show_new_message_toast(mgr, event)

            elif event_type == "history_synced":
                # Backlog arrived from WhatsApp; refresh whatever is on screen.
                if self.mode == MODE_CHATS:
                    self._refresh_chats()
                elif self.mode == MODE_CHAT_VIEW and self.current_chat_id:
                    self._refresh_messages(self.current_chat_id)

            self._full_render()
            if is_active:
                try:
                    self._push_screen()
                except Exception:
                    logger.debug("wa event push failed", exc_info=True)

    def _show_new_message_toast(self, mgr, event: dict):
        try:
            chat_id = event.get("chat_id", "")
            name = self._chat_name_by_id(chat_id) or "WhatsApp"
            preview = self._chat_preview_by_id(chat_id)
            label = transliterate(name)[:18]
            if preview:
                avail = SCREEN_COLS - len(label) - 2
                text = f"{label}: {transliterate(preview)[:max(0, avail)]}"
            else:
                text = label
            mgr.show_session_toast(
                self.session_id,
                text[:SCREEN_COLS],
                duration_sec=3.0,
                color=COL_LIGHT_GREEN,
            )
        except Exception:
            logger.debug("wa toast failed", exc_info=True)

    def _chat_name_by_id(self, chat_id: str) -> str:
        for chat in self.chats:
            if chat.id == chat_id:
                return chat.name
        return ""

    def _chat_preview_by_id(self, chat_id: str) -> str:
        for chat in self.chats:
            if chat.id == chat_id:
                return chat.last_message
        return ""

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
        p, n = pos, len(text)
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
                for line in self._word_wrap(msg.text, SCREEN_COLS):
                    self._rendered_lines.append((line, fg))
            self._rendered_lines.append(("", COL_TEXT_FG))

    @staticmethod
    def _word_wrap(text: str, width: int) -> List[str]:
        lines: List[str] = []
        for paragraph in text.split("\n"):
            if not paragraph.strip():
                lines.append("")
                continue
            current = ""
            for word in paragraph.split(" "):
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

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
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
        elif self.mode == MODE_HELP:
            self._render_help()

    # ── Login screen ─────────────────────────────────────────────────

    def _render_login(self):
        self._render_title_bar("WHATSAPP  -  F8:HELP")

        if self.login_state == LOGIN_NO_LIBRARY:
            self._put_text(3, 1, "WhatsApp library not installed", COL_ERROR_FG)
            self._put_text(5, 1, "The server is missing 'neonize'.", COL_WHITE)
            self._put_text(6, 1, "Admin: pip install neonize", COL_LABEL_FG)
            self._put_text(8, 1, "See F8 help for details.", COL_HELP_FG)
            self._put_text(20, 1, "F8=Help", COL_HELP_FG)
            self._render_status_bar("F8=Help")
            return

        if self.login_state == LOGIN_NEED_PHONE:
            self._put_text(3, 1, "No phone number configured.", COL_ERROR_FG)
            self._put_text(5, 1, "Set your WhatsApp phone number", COL_WHITE)
            self._put_text(6, 1, "in the HDN UI Settings page", COL_WHITE)
            self._put_text(7, 1, "(WhatsApp section), then press", COL_WHITE)
            self._put_text(8, 1, "RETURN here.", COL_WHITE)
            self._put_text(11, 1, "Open the HDN web UI in a browser", COL_LABEL_FG)
            self._put_text(12, 1, "-> Settings -> WhatsApp -> Phone", COL_LABEL_FG)
            self._put_text(20, 1, "RETURN=Retry   F8=Help", COL_HELP_FG)
            self._render_status_bar("RETURN=Retry  F8=Help")
            return

        if self.login_state == LOGIN_ERROR:
            self._put_text(3, 1, "Connection error:", COL_ERROR_FG)
            self._put_text(4, 1, self.login_error[:38], COL_ERROR_FG)
            self._put_text(20, 1, "RETURN=Retry   F8=Help", COL_HELP_FG)
            self._render_status_bar("RETURN=Retry  F8=Help")
            return

        # LOGIN_PAIRING
        self._put_text(3, 1, "Link this server to WhatsApp", COL_WHITE)
        if self.login_code:
            self._put_text(5, 1, "Your pairing code:", COL_WHITE)
            code = self._format_code(self.login_code)
            col = max(1, (SCREEN_COLS - len(code)) // 2)
            self._put_text(7, col, code, COL_CODE_FG, reverse=True)
            self._put_text(10, 1, "On your phone open WhatsApp:", COL_LABEL_FG)
            self._put_text(11, 1, " Settings > Linked Devices", COL_HELP_FG)
            self._put_text(12, 1, " > Link a device", COL_HELP_FG)
            self._put_text(13, 1, " > Link with phone number", COL_HELP_FG)
            self._put_text(14, 1, " Enter the code above.", COL_HELP_FG)
            self._put_text(17, 1, "Waiting for link...", COL_YELLOW)
        elif self.login_status:
            self._put_text(6, 1, self.login_status[:38], COL_YELLOW)
        self._put_text(20, 1, "F8=Help", COL_HELP_FG)
        self._render_status_bar("Waiting for link...  F8=Help")

    @staticmethod
    def _format_code(code: str) -> str:
        """Group an 8-char code as 'ABCD-EFGH' for readability."""
        code = code.strip()
        if len(code) == 8:
            return f"{code[:4]}-{code[4:]}"
        return code

    # ── Chat list ────────────────────────────────────────────────────

    def _render_chats(self):
        self._render_title_bar("F1:Chats F3:Contacts F8:Help")

        if not self.chats:
            if self.worker.connected:
                self._put_text(3, 1, "No chats yet.", COL_LABEL_FG)
                self._put_text(4, 1, "Press F3 for contacts.", COL_HELP_FG)
            else:
                self._put_text(3, 1, "Not linked.", COL_ERROR_FG)
                self._put_text(4, 1, "See F8 help to link a phone.", COL_HELP_FG)
            self._render_status_bar("HOME=Refresh  F8=Help")
            return

        for vi in range(CONTENT_ROWS):
            idx = self.chat_scroll + vi
            if idx >= len(self.chats):
                break
            chat = self.chats[idx]
            row = CONTENT_TOP + vi
            is_selected = idx == self.chat_sel

            name = ("#" + chat.name) if chat.is_group else chat.name
            badge = f"({chat.unread_count})" if chat.unread_count > 0 else ""
            time_str = chat.timestamp
            right_width = len(time_str) + len(badge) + (1 if badge else 0)
            name_width = SCREEN_COLS - right_width - 1
            display_name = name[:name_width]

            if is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if badge:
                    self._put_text(
                        row, SCREEN_COLS - right_width, badge, COL_SELECTED_FG, True
                    )
                if time_str:
                    self._put_text(
                        row, SCREEN_COLS - len(time_str), time_str, COL_SELECTED_FG, True
                    )
            else:
                name_fg = COL_GROUP_FG if chat.is_group else COL_WHITE
                self._put_text(row, 0, display_name, name_fg)
                if badge:
                    self._put_text(row, SCREEN_COLS - right_width, badge, COL_UNREAD_FG)
                if time_str:
                    self._put_text(row, SCREEN_COLS - len(time_str), time_str, COL_GREY)

        pos = self.chat_sel + 1
        status_text = (
            self._chat_status
            if self._chat_status
            else f"{pos}/{len(self.chats)} RET=Open HOME=Refresh"
        )
        self._render_status_bar(status_text)

    # ── Chat view ────────────────────────────────────────────────────

    def _render_chat_view(self):
        self._render_title_bar(self.current_chat_name[:32])

        input_lines = self._input_line_count()
        sep_row = SCREEN_ROWS - 1 - input_lines
        msg_end_row = sep_row - 1
        msg_display_rows = msg_end_row - CONTENT_TOP + 1

        for vi in range(msg_display_rows):
            li = self.msg_scroll + vi
            if li >= len(self._rendered_lines):
                break
            text, fg = self._rendered_lines[li]
            self._put_text(CONTENT_TOP + vi, 0, text[:SCREEN_COLS], fg)

        for c in range(SCREEN_COLS):
            self.screen[sep_row * SCREEN_COLS + c] = SC_HLINE
            self.color[sep_row * SCREEN_COLS + c] = COL_DARK_GREY

        prompt = "> "
        input_width = SCREEN_COLS - len(prompt)
        wrapped_input = (
            self._word_wrap(self.msg_input or "", input_width) if self.msg_input else [""]
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
            self._put_text(row, 0, prompt if li == 0 else "  ", COL_CYAN)
            self._put_text(row, len(prompt), line_text[:input_width], COL_INPUT_FG)

        cursor_vis_line = cursor_wrapped_line - visible_start
        if 0 <= cursor_vis_line < input_lines:
            cursor_row = sep_row + 1 + cursor_vis_line
            cursor_screen_col = len(prompt) + cursor_col_in_line
            if cursor_row < SCREEN_ROWS and cursor_screen_col < SCREEN_COLS:
                p = cursor_row * SCREEN_COLS + cursor_screen_col
                self.screen[p] = SC_SPACE | SC_REVERSE_BIT
                self.color[p] = COL_INPUT_FG

    # ── Contacts ─────────────────────────────────────────────────────

    def _render_contacts(self):
        self._render_title_bar("F1:Chats F3:Contacts F8:Help")

        if not self.contacts:
            if self.worker.connected:
                self._put_text(3, 1, "No contacts found.", COL_LABEL_FG)
            else:
                self._put_text(3, 1, "Not linked.", COL_ERROR_FG)
                self._put_text(4, 1, "See F8 help to link a phone.", COL_HELP_FG)
            self._render_status_bar("F1=Chats  F8=Help")
            return

        for vi in range(CONTENT_ROWS):
            idx = self.contact_scroll + vi
            if idx >= len(self.contacts):
                break
            contact = self.contacts[idx]
            row = CONTENT_TOP + vi
            is_selected = idx == self.contact_sel

            info = f"@{contact.username}" if contact.username else contact.phone
            name_width = SCREEN_COLS - len(info) - 1 if info else SCREEN_COLS
            display_name = contact.name[:name_width]

            if is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if info:
                    self._put_text(
                        row, SCREEN_COLS - len(info), info, COL_SELECTED_FG, True
                    )
            else:
                self._put_text(row, 0, display_name, COL_WHITE)
                if info:
                    self._put_text(row, SCREEN_COLS - len(info), info, COL_GREY)

        pos = self.contact_sel + 1
        searching = (
            self.contact_search and (time.time() - self.contact_search_ts) <= 1.2
        )
        if searching:
            status = f"Find: {self.contact_search}"
        else:
            status = f"{pos}/{len(self.contacts)} RET=Chat  STOP=Back  A-Z=Find"
        self._render_status_bar(status)

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
                    p = row * SCREEN_COLS + c
                    self.screen[p] = SC_SPACE | SC_REVERSE_BIT
                    self.color[p] = COL_YELLOW
            elif text and not text.startswith(" "):
                self._put_text(row, 0, text[:SCREEN_COLS], COL_CYAN)
            else:
                stripped = text.lstrip()
                indent = len(text) - len(stripped)
                if stripped and "  " in stripped:
                    parts = stripped.split("  ", 1)
                    if len(parts) == 2 and parts[0].strip():
                        key_part = text[: indent + len(parts[0])]
                        self._put_text(row, 0, key_part[:SCREEN_COLS], COL_WHITE)
                        desc_start = indent + len(parts[0])
                        self._put_text(
                            row,
                            desc_start,
                            ("  " + parts[1])[: SCREEN_COLS - desc_start],
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

    def _put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
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
            send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception:
            logger.debug("wa push_screen failed (no C64 connected?)", exc_info=True)

    def _send_vic_colors(self, border: int, background: int):
        try:
            from sdk.network_helper import send_vic_colors

            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.debug("Could not send VIC colours: %s", e)

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None
