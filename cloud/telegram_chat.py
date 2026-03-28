"""
Server-side Telegram chat console (console 5) for C64 HDN Cloud Server.

A PETSCII Telegram client rendered into a 40x25 C64 screen-code back-buffer.
Features: login with phone/code/2FA, chat list, message view & compose,
contacts list, settings page, help screen.

Uses Telethon (MTProto) on the server for user-account Telegram access.
All input arrives as PETSCII key-presses from the C64 client.
Invoked from C64 by pressing CBM+5.
"""

import asyncio
import logging
import os
import queue
import threading
import time
from dataclasses import dataclass
from datetime import timezone, timedelta
from typing import List, Optional

from network_helper import send_screen_data
from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii

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

# ── Telegram chat modes ─────────────────────────────────────────────
MODE_LOGIN = 0
MODE_CHATS = 1
MODE_CHAT_VIEW = 2
MODE_CONTACTS = 3
MODE_SETTINGS = 4
MODE_HELP = 5

# ── Login sub-states ────────────────────────────────────────────────
LOGIN_PHONE = 0
LOGIN_CODE = 1
LOGIN_2FA = 2

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
    "=== TELEGRAM CHAT HELP   F8=close ===",
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
    " Phone       Telegram phone (+XXX)",
    " API ID      From my.telegram.org",
    " API Hash    From my.telegram.org",
    " Login       Start login process",
    " Logout      Disconnect session",
    "",
    " LOGIN",
    " Enter phone number with country",
    " code (e.g. +1234567890).",
    " After submitting, enter the code",
    " Telegram sends to your phone.",
    " If 2FA is enabled, enter your",
    " cloud password when prompted.",
    "",
    " CONSOLE SWITCHING",
    " C=+1       Local shell",
    " C=+2       File editor",
    " C=+3       Coding agent",
    " C=+4       Web browser",
    " C=+5       This Telegram chat",
    " C=+6       RSS reader (this)",
    "",
    " press F8 or STOP to close help",
]


# =====================================================================
#  Data classes
# =====================================================================

@dataclass
class ChatEntry:
    """A chat/dialog in the list."""
    id: int = 0
    name: str = ""
    last_message: str = ""
    unread_count: int = 0
    is_group: bool = False
    timestamp: str = ""


@dataclass
class MessageEntry:
    """A single message in a chat."""
    id: int = 0
    sender_name: str = ""
    text: str = ""
    timestamp: str = ""
    is_outgoing: bool = False


@dataclass
class ContactEntry:
    """A Telegram contact."""
    id: int = 0
    name: str = ""
    phone: str = ""
    username: str = ""


# =====================================================================
#  _TelethonWorker — async thread that owns the Telethon client
# =====================================================================

class _TelethonWorker:
    """Runs all Telethon operations in a dedicated daemon thread with
    its own asyncio event loop.

    The pattern is identical to _PlaywrightWorker in web_browser.py:
    callers submit jobs via a thread-safe queue and block until the
    result is ready.
    """

    _SENTINEL = object()

    def __init__(self):
        self._job_queue: queue.Queue = queue.Queue()
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._client = None  # TelegramClient
        self._phone_code_hash: Optional[str] = None
        self._connected = False
        self._thread = threading.Thread(
            target=self._run, name="telethon-worker", daemon=True
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
        return self._connected

    def shutdown(self):
        self._job_queue.put(self._SENTINEL)

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
            # Non-blocking poll with short sleep to keep the loop responsive
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
                logger.error("Telethon worker error (%s): %s", method_name, exc, exc_info=True)
                result_q.put(exc)

    async def _cleanup(self):
        if self._client:
            try:
                await self._client.disconnect()
            except Exception:
                pass
            self._client = None
        self._connected = False

    # ------------------------------------------------------------------
    #  Async job implementations
    # ------------------------------------------------------------------

    async def _ensure_client(self, api_id: str, api_hash: str) -> bool:
        """Create the TelegramClient if not yet created."""
        if self._client is not None:
            return True
        if not api_id or not api_hash:
            return False
        try:
            int_api_id = int(api_id)
        except (ValueError, TypeError):
            return False

        from telethon import TelegramClient
        session_path = self._get_session_path()
        self._client = TelegramClient(session_path, int_api_id, api_hash)
        return True

    async def _do_connect(self, api_id: str = "", api_hash: str = "") -> str:
        """Connect to Telegram. Returns 'ok' or error string."""
        if not await self._ensure_client(api_id, api_hash):
            return "error:Missing API ID or API Hash"
        try:
            await self._client.connect()
            if await self._client.is_user_authorized():
                self._connected = True
                return "authorized"
            return "need_login"
        except Exception as e:
            return f"error:{e}"

    async def _do_send_code(self, phone: str = "", api_id: str = "", api_hash: str = "") -> str:
        """Send login code to phone. Returns 'ok' or error string."""
        if not await self._ensure_client(api_id, api_hash):
            return "error:Missing API ID or API Hash"
        if not self._client.is_connected():
            await self._client.connect()
        try:
            result = await self._client.send_code_request(phone)
            self._phone_code_hash = result.phone_code_hash
            return "ok"
        except Exception as e:
            return f"error:{e}"

    async def _do_sign_in(self, phone: str = "", code: str = "") -> str:
        """Sign in with phone + code. Returns 'ok', 'need_2fa', or error."""
        try:
            await self._client.sign_in(
                phone=phone, code=code, phone_code_hash=self._phone_code_hash
            )
            self._connected = True
            return "ok"
        except Exception as e:
            err_str = str(e).lower()
            if "two-steps verification" in err_str or "2fa" in err_str or "password" in err_str:
                return "need_2fa"
            return f"error:{e}"

    async def _do_sign_in_2fa(self, password: str = "") -> str:
        """Complete 2FA login. Returns 'ok' or error string."""
        try:
            await self._client.sign_in(password=password)
            self._connected = True
            return "ok"
        except Exception as e:
            return f"error:{e}"

    async def _do_get_dialogs(self, limit: int = MAX_DIALOGS, tz_offset_minutes: int = 0) -> List[ChatEntry]:
        """Fetch recent dialogs/chats."""
        if not self._connected:
            return []
        try:
            from telethon.tl.types import User
            dialogs = await self._client.get_dialogs(limit=limit)
            result = []
            tz = timezone(timedelta(minutes=tz_offset_minutes))
            for d in dialogs:
                name = d.name or "Unknown"
                is_group = not isinstance(d.entity, User) if d.entity else False
                last_msg = ""
                ts = ""
                if d.message:
                    last_msg = d.message.message or ""
                    if d.message.media and not last_msg:
                        last_msg = _media_placeholder(d.message)
                    if d.message.date:
                        ts = d.message.date.astimezone(tz).strftime("%H:%M")
                result.append(ChatEntry(
                    id=d.id,
                    name=name[:36],
                    last_message=last_msg[:60],
                    unread_count=d.unread_count or 0,
                    is_group=is_group,
                    timestamp=ts,
                ))
            return result
        except Exception as e:
            logger.error("get_dialogs error: %s", e)
            return []

    async def _do_get_messages(self, chat_id: int = 0, limit: int = MAX_MESSAGES, tz_offset_minutes: int = 0) -> List[MessageEntry]:
        """Fetch messages from a chat."""
        if not self._connected or not chat_id:
            return []
        try:
            messages = await self._client.get_messages(chat_id, limit=limit)
            result = []
            tz = timezone(timedelta(minutes=tz_offset_minutes))
            for m in messages:
                sender_name = ""
                if m.sender:
                    if hasattr(m.sender, "first_name"):
                        sender_name = (m.sender.first_name or "") + (" " + (m.sender.last_name or "")).rstrip()
                    elif hasattr(m.sender, "title"):
                        sender_name = m.sender.title or ""
                    else:
                        sender_name = str(m.sender_id or "")
                text = m.message or ""
                if m.media and not text:
                    text = _media_placeholder(m)
                ts = ""
                if m.date:
                    ts = m.date.astimezone(tz).strftime("%H:%M")
                result.append(MessageEntry(
                    id=m.id,
                    sender_name=sender_name[:20],
                    text=text[:500],
                    timestamp=ts,
                    is_outgoing=m.out or False,
                ))
            # Reverse so oldest is first
            result.reverse()
            return result
        except Exception as e:
            logger.error("get_messages error: %s", e)
            return []

    async def _do_send_message(self, chat_id: int = 0, text: str = "") -> str:
        """Send a message to a chat. Returns 'ok' or error string."""
        if not self._connected or not chat_id or not text:
            return "error:Not connected or empty message"
        try:
            await self._client.send_message(chat_id, text)
            return "ok"
        except Exception as e:
            return f"error:{e}"

    async def _do_get_contacts(self) -> List[ContactEntry]:
        """Fetch the user's contact list."""
        if not self._connected:
            return []
        try:
            from telethon.tl.functions.contacts import GetContactsRequest
            result = await self._client(GetContactsRequest(hash=0))
            contacts = []
            for u in result.users:
                name = (getattr(u, "first_name", "") or "") + (" " + (getattr(u, "last_name", "") or "")).rstrip()
                contacts.append(ContactEntry(
                    id=u.id,
                    name=name[:30],
                    phone=getattr(u, "phone", "") or "",
                    username=getattr(u, "username", "") or "",
                ))
            contacts.sort(key=lambda c: c.name.lower())
            return contacts
        except Exception as e:
            logger.error("get_contacts error: %s", e)
            return []

    async def _do_logout(self) -> str:
        """Log out and destroy the session."""
        try:
            if self._client:
                await self._client.log_out()
                await self._client.disconnect()
                self._client = None
            self._connected = False
            # Remove session file
            session_path = self._get_session_path()
            for ext in ("", ".session"):
                p = session_path + ext if not session_path.endswith(".session") else session_path
                if os.path.exists(p):
                    os.remove(p)
            return "ok"
        except Exception as e:
            self._connected = False
            return f"error:{e}"

    async def _do_is_connected(self) -> bool:
        """Check current connection status."""
        return self._connected

    @staticmethod
    def _get_session_path() -> str:
        """Return path for the Telethon session file."""
        from workspace_init import WORKSPACE_DIR
        config_dir = os.path.join(WORKSPACE_DIR, ".config")
        os.makedirs(config_dir, exist_ok=True)
        return os.path.join(config_dir, "telegram")


# Module-level shared worker instance (lazy init)
_worker: Optional[_TelethonWorker] = None
_worker_lock = threading.Lock()


def _get_worker() -> _TelethonWorker:
    """Return the shared TelethonWorker (created on first call)."""
    global _worker
    if _worker is None:
        with _worker_lock:
            if _worker is None:
                _worker = _TelethonWorker()
    return _worker


def _media_placeholder(msg) -> str:
    """Return a placeholder string for non-text media messages."""
    if hasattr(msg, "media") and msg.media:
        cls_name = type(msg.media).__name__
        if "Photo" in cls_name:
            return "[Photo]"
        if "Document" in cls_name:
            return "[Document]"
        if "Sticker" in cls_name or "sticker" in str(getattr(msg.media, "document", "")):
            return "[Sticker]"
        if "Video" in cls_name:
            return "[Video]"
        if "Audio" in cls_name or "Voice" in cls_name:
            return "[Audio]"
        if "Geo" in cls_name or "Venue" in cls_name:
            return "[Location]"
        if "Contact" in cls_name:
            return "[Contact]"
        if "Poll" in cls_name:
            return "[Poll]"
        return "[Media]"
    return ""


# =====================================================================
#  TelegramChatConsole — main console class
# =====================================================================

class TelegramChatConsole(ServerConsole):
    """Console 5 — PETSCII Telegram Chat Client."""

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

        # Chat list state
        self.chats: List[ChatEntry] = []
        self.chat_sel: int = 0
        self.chat_scroll: int = 0

        # Chat view state
        self.current_chat_id: int = 0
        self.current_chat_name: str = ""
        self.messages: List[MessageEntry] = []
        self.msg_scroll: int = 0
        self.msg_input: str = ""
        self.msg_cursor: int = 0  # cursor position within msg_input
        self.msg_input_scroll: int = 0  # vertical scroll for input (line offset)
        self._rendered_lines: List[tuple] = []  # (text, color) pre-wrapped

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

        # Transient status shown in the chat-list status bar (e.g. "Refreshing...")
        self._chat_status: str = ""

        # Background polling state
        self._is_active: bool = False
        self._last_unread_total: int = 0
        self._last_poll_time: float = 0.0
        self._poll_stop = threading.Event()
        # Lock to prevent the BG thread and main thread from calling
        # _full_render() concurrently on the shared screen/color buffers.
        self._render_lock = threading.Lock()
        self._poll_thread = threading.Thread(
            target=self._bg_poll_loop, name="tg-poller", daemon=True
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
        from config_manager import read_config
        return read_config()

    @staticmethod
    def _write_config(data: dict):
        from config_manager import write_config
        write_config(data)

    def _get_api_credentials(self) -> tuple:
        """Return (api_id, api_hash, phone) from config."""
        cfg = self._read_config()
        return (
            cfg.get("TELEGRAM_API_ID", ""),
            cfg.get("TELEGRAM_API_HASH", ""),
            cfg.get("TELEGRAM_PHONE", ""),
        )

    # =================================================================
    #  AUTO-CONNECT
    # =================================================================

    def _try_auto_connect(self):
        """Try to connect using existing session and config credentials."""
        api_id, api_hash, phone = self._get_api_credentials()
        if not api_id or not api_hash:
            self.mode = MODE_SETTINGS
            self.settings_status = "Configure API ID & Hash first"
            return
        try:
            result = self.worker.call("connect", api_id=api_id, api_hash=api_hash)
            if result == "authorized":
                self.mode = MODE_CHATS
                self._refresh_chats()
            elif result == "need_login":
                self.mode = MODE_LOGIN
                self.login_state = LOGIN_PHONE
                if phone:
                    self.login_input = phone
            else:
                self.mode = MODE_SETTINGS
                self.settings_status = result.replace("error:", "")
        except Exception as e:
            self.mode = MODE_SETTINGS
            self.settings_status = str(e)[:36]

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        """Re-render and refresh data when switching to this console."""
        self._is_active = True
        self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
        with self._render_lock:
            if self.worker.connected and self.mode == MODE_CHATS:
                self._refresh_chats()
            self._full_render()
            self._push_screen()

    def on_deactivate(self):
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
        if key == KEY_RETURN:
            self._submit_login()
        elif key == KEY_DEL:
            if self.login_input:
                self.login_input = self.login_input[:-1]
        elif key == KEY_RUNSTOP:
            # Cancel → go to settings
            self.mode = MODE_SETTINGS
        elif key == KEY_F8:
            self.prev_mode = MODE_LOGIN
            self.help_scroll = 0
            self.mode = MODE_HELP
        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.login_input) < 40:
                self.login_input += ch

    def _submit_login(self):
        api_id, api_hash, _ = self._get_api_credentials()

        if self.login_state == LOGIN_PHONE:
            phone = self.login_input.strip()
            if not phone:
                self.login_error = "Enter phone number"
                return
            self.login_phone = phone
            self.login_status = "Sending code..."
            self._full_render()  # show status before blocking call
            result = self.worker.call("send_code", phone=phone, api_id=api_id, api_hash=api_hash)
            if result == "ok":
                # Save phone to config
                cfg = self._read_config()
                cfg["TELEGRAM_PHONE"] = phone
                self._write_config(cfg)
                self.login_state = LOGIN_CODE
                self.login_input = ""
                self.login_error = ""
                self.login_status = "Code sent to your phone"
            else:
                self.login_error = result.replace("error:", "")[:36]
                self.login_status = ""

        elif self.login_state == LOGIN_CODE:
            code = self.login_input.strip()
            if not code:
                self.login_error = "Enter verification code"
                return
            self.login_status = "Verifying..."
            self._full_render()
            result = self.worker.call("sign_in", phone=self.login_phone, code=code)
            if result == "ok":
                self.mode = MODE_CHATS
                self.login_input = ""
                self.login_error = ""
                self._refresh_chats()
            elif result == "need_2fa":
                self.login_state = LOGIN_2FA
                self.login_input = ""
                self.login_error = ""
                self.login_status = "Enter 2FA password"
            else:
                self.login_error = result.replace("error:", "")[:36]
                self.login_status = ""

        elif self.login_state == LOGIN_2FA:
            password = self.login_input.strip()
            if not password:
                self.login_error = "Enter 2FA password"
                return
            self.login_status = "Verifying 2FA..."
            self._full_render()
            result = self.worker.call("sign_in_2fa", password=password)
            if result == "ok":
                self.mode = MODE_CHATS
                self.login_input = ""
                self.login_error = ""
                self._refresh_chats()
            else:
                self.login_error = result.replace("error:", "")[:36]
                self.login_status = ""

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
            # Page down
            self.chat_sel = min(len(self.chats) - 1, self.chat_sel + CONTENT_ROWS)
            self.chat_scroll = max(0, self.chat_sel - CONTENT_ROWS + 1)

        elif key == KEY_F3:
            # Switch to contacts
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
            # Scroll messages up
            if self.msg_scroll > 0:
                self.msg_scroll -= 1

        elif key == KEY_CRSR_DN and not cbm:
            # Scroll messages down
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            if self.msg_scroll < max_scroll:
                self.msg_scroll += 1

        elif key == KEY_F5:
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            self.msg_scroll = min(max_scroll, self.msg_scroll + self._msg_display_rows())

        elif key == KEY_F3:
            self.msg_scroll = max(0, self.msg_scroll - self._msg_display_rows())

        elif key == KEY_RETURN:
            if self.msg_input.strip():
                self._do_send_message()

        elif key == KEY_DEL:
            # Backspace at cursor
            if self.msg_input and self.msg_cursor > 0:
                self.msg_input = (
                    self.msg_input[: self.msg_cursor - 1]
                    + self.msg_input[self.msg_cursor :]
                )
                self.msg_cursor -= 1
                self._clamp_input_scroll()

        elif key == KEY_CRSR_LT:
            if cbm:
                # Word jump left
                self.msg_cursor = self._word_jump_left(self.msg_input, self.msg_cursor)
            else:
                if self.msg_cursor > 0:
                    self.msg_cursor -= 1
            self._clamp_input_scroll()

        elif key == KEY_CRSR_RT:
            if cbm:
                # Word jump right
                self.msg_cursor = self._word_jump_right(self.msg_input, self.msg_cursor)
            else:
                if self.msg_cursor < len(self.msg_input):
                    self.msg_cursor += 1
            self._clamp_input_scroll()

        elif key == KEY_HOME:
            # Refresh messages — show feedback immediately before blocking call
            self._chat_status = "Refreshing..."
            self._full_render()
            self._push_screen()
            self._chat_status = ""
            self._refresh_messages(self.current_chat_id)

        elif key == KEY_RUNSTOP or key == KEY_LEFT_ARROW:
            # Back to chat list
            self.mode = MODE_CHATS
            self.msg_input = ""
            self.msg_cursor = 0
            self.msg_input_scroll = 0
            self._refresh_chats()

        elif key == KEY_F1:
            self.mode = MODE_CHATS
            self.msg_input = ""
            self.msg_cursor = 0
            self.msg_input_scroll = 0
            self._refresh_chats()

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
            self.contact_sel = min(len(self.contacts) - 1, self.contact_sel + CONTENT_ROWS)
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

    # Settings fields: 0=Phone, 1=API ID, 2=API Hash, 3=Timezone, 4=Login, 5=Logout
    _SETTINGS_FIELDS = ["Phone Number", "API ID", "API Hash", "Timezone", "Login", "Logout"]
    _SETTINGS_KEYS = ["TELEGRAM_PHONE", "TELEGRAM_API_ID", "TELEGRAM_API_HASH", "TIMEZONE", None, None]
    _SETTINGS_COUNT = 6

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
            if self.settings_sel == 4:
                # Login action
                self._start_login_from_settings()
            elif self.settings_sel == 5:
                # Logout action
                self._do_logout()
            else:
                # Edit the selected field
                cfg_key = self._SETTINGS_KEYS[self.settings_sel]
                if cfg_key:
                    cfg = self._read_config()
                    self.settings_input = cfg.get(cfg_key, "")
                    self.settings_cursor = len(self.settings_input)
                    self.settings_editing = True

        elif key == KEY_RUNSTOP:
            self.mode = self.prev_mode if self.prev_mode != MODE_SETTINGS else MODE_CHATS

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
        """Handle keypress while editing a settings field."""
        if key == KEY_RETURN:
            # Save the field
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
                    + self.settings_input[self.settings_cursor:]
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
                    + self.settings_input[self.settings_cursor:]
                )
                self.settings_cursor += 1

    def _start_login_from_settings(self):
        """Initiate login from settings with current config values."""
        api_id, api_hash, phone = self._get_api_credentials()
        if not api_id or not api_hash:
            self.settings_status = "Set API ID & Hash first"
            return
        try:
            result = self.worker.call("connect", api_id=api_id, api_hash=api_hash)
            if result == "authorized":
                self.settings_status = "Already logged in"
                self.mode = MODE_CHATS
                self._refresh_chats()
            elif result == "need_login":
                self.mode = MODE_LOGIN
                self.login_state = LOGIN_PHONE
                self.login_input = phone
                self.login_error = ""
                self.login_status = ""
            else:
                self.settings_status = result.replace("error:", "")[:36]
        except Exception as e:
            self.settings_status = str(e)[:36]

    def _do_logout(self):
        """Log out and return to settings."""
        try:
            result = self.worker.call("logout")
            if result == "ok":
                self.settings_status = "Logged out"
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
    #  TELEGRAM API WRAPPERS
    # =================================================================

    def _get_tz_offset_minutes(self) -> int:
        """Return UTC offset in minutes from the configured timezone string."""
        cfg = self._read_config()
        tz_name = cfg.get("TIMEZONE", "UTC").strip()
        try:
            import zoneinfo
            zi = zoneinfo.ZoneInfo(tz_name)
            import datetime
            now = datetime.datetime.now(datetime.timezone.utc)
            offset = zi.utcoffset(now)
            return int(offset.total_seconds() // 60) if offset is not None else 0
        except Exception:
            return 0

    def _refresh_chats(self):
        """Fetch dialog list from Telegram."""
        try:
            tz_minutes = self._get_tz_offset_minutes()
            self.chats = self.worker.call("get_dialogs", tz_offset_minutes=tz_minutes)
            if self.chat_sel >= len(self.chats):
                self.chat_sel = max(0, len(self.chats) - 1)
        except Exception as e:
            logger.error("refresh_chats: %s", e)

    def _refresh_messages(self, chat_id: int):
        """Fetch messages for a chat."""
        try:
            tz_minutes = self._get_tz_offset_minutes()
            self.messages = self.worker.call("get_messages", chat_id=chat_id, tz_offset_minutes=tz_minutes)
            self._build_rendered_lines()
            # Auto-scroll to bottom
            max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
            self.msg_scroll = max_scroll
        except Exception as e:
            logger.error("refresh_messages: %s", e)

    def _refresh_contacts(self):
        """Fetch contact list from Telegram."""
        try:
            self.contacts = self.worker.call("get_contacts")
            if self.contact_sel >= len(self.contacts):
                self.contact_sel = max(0, len(self.contacts) - 1)
        except Exception as e:
            logger.error("refresh_contacts: %s", e)

    def _open_chat(self, chat_id: int, chat_name: str):
        """Open a chat for viewing/messaging."""
        self.current_chat_id = chat_id
        self.current_chat_name = chat_name
        self.msg_input = ""
        self.msg_cursor = 0
        self.msg_input_scroll = 0
        self._refresh_messages(chat_id)
        self.mode = MODE_CHAT_VIEW

    def _do_send_message(self):
        """Send the composed message."""
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

    # =================================================================
    #  INPUT HELPERS
    # =================================================================

    def _msg_display_rows(self) -> int:
        """Number of rows available for messages given current input height."""
        # SCREEN_ROWS(25) - title(1) - separator(1) - input_lines = 23 - input_lines
        return SCREEN_ROWS - 2 - self._input_line_count()

    def _input_line_count(self) -> int:
        """How many rows the input box currently occupies (1-MAX_INPUT_LINES)."""
        if not self.msg_input:
            return 1
        wrapped = self._word_wrap(self.msg_input, SCREEN_COLS - 2)  # 2 for "> "
        return min(MAX_INPUT_LINES, max(1, len(wrapped)))

    def _clamp_input_scroll(self):
        """Ensure msg_input_scroll keeps the cursor line visible."""
        input_width = SCREEN_COLS - 2  # width for "> " prefix
        cursor_line, _ = self._cursor_wrapped_pos(self.msg_input, self.msg_cursor, input_width)

        if self.msg_input_scroll > cursor_line:
            self.msg_input_scroll = cursor_line
        if self.msg_input_scroll + MAX_INPUT_LINES - 1 < cursor_line:
            self.msg_input_scroll = cursor_line - MAX_INPUT_LINES + 1
        # Also keep message display scroll valid for new display row count
        max_scroll = max(0, len(self._rendered_lines) - self._msg_display_rows())
        if self.msg_scroll > max_scroll:
            self.msg_scroll = max_scroll

    @staticmethod
    def _word_jump_left(text: str, pos: int) -> int:
        """Return new cursor position one word to the left."""
        p = pos
        # Skip spaces
        while p > 0 and text[p - 1] == " ":
            p -= 1
        # Skip non-space
        while p > 0 and text[p - 1] != " ":
            p -= 1
        return p

    @staticmethod
    def _word_jump_right(text: str, pos: int) -> int:
        """Return new cursor position one word to the right."""
        p = pos
        n = len(text)
        # Skip non-space
        while p < n and text[p] != " ":
            p += 1
        # Skip spaces
        while p < n and text[p] == " ":
            p += 1
        return p

    # =================================================================
    #  MESSAGE LINE BUILDING
    # =================================================================

    def _build_rendered_lines(self):
        """Pre-wrap all messages into (text, color) lines for rendering."""
        self._rendered_lines = []
        for msg in self.messages:
            fg = COL_OUTGOING_FG if msg.is_outgoing else COL_INCOMING_FG
            # Sender header line for group/incoming
            if not msg.is_outgoing and msg.sender_name:
                header = f"{msg.sender_name} {msg.timestamp}"
                self._rendered_lines.append((header[:SCREEN_COLS], COL_SENDER_FG))
            elif msg.is_outgoing:
                header = f"You {msg.timestamp}"
                self._rendered_lines.append((header[:SCREEN_COLS], COL_CYAN))
            # Word-wrap the message text
            if msg.text:
                wrapped = self._word_wrap(msg.text, SCREEN_COLS)
                for line in wrapped:
                    self._rendered_lines.append((line, fg))
            # Blank line separator
            self._rendered_lines.append(("", COL_TEXT_FG))

    @staticmethod
    def _word_wrap(text: str, width: int) -> List[str]:
        """Simple word-wrap for message text."""
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
                # Handle very long words
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
        """Re-render the entire 40x25 screen."""
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
        # Title bar
        self._render_title_bar("TELEGRAM LOGIN")

        if self.login_state == LOGIN_PHONE:
            self._put_text(3, 1, "Enter phone number:", COL_WHITE)
            self._put_text(4, 1, "Include country code (+1...)", COL_LABEL_FG)
            self._render_input_field(6, self.login_input)
        elif self.login_state == LOGIN_CODE:
            self._put_text(3, 1, "Verification code sent to:", COL_WHITE)
            self._put_text(4, 1, self.login_phone[:38], COL_LABEL_FG)
            self._put_text(6, 1, "Enter code:", COL_WHITE)
            self._render_input_field(7, self.login_input)
        elif self.login_state == LOGIN_2FA:
            self._put_text(3, 1, "Two-factor authentication", COL_WHITE)
            self._put_text(5, 1, "Enter cloud password:", COL_WHITE)
            # Mask password input
            masked = "*" * len(self.login_input)
            self._render_input_field(6, masked)

        if self.login_error:
            self._put_text(10, 1, self.login_error[:38], COL_ERROR_FG)

        if self.login_status:
            self._put_text(12, 1, self.login_status[:38], COL_YELLOW)

        # Hints
        self._put_text(16, 1, "RETURN  Submit", COL_HELP_FG)
        self._put_text(17, 1, "STOP    Cancel / Settings", COL_HELP_FG)
        self._put_text(18, 1, "F8      Help", COL_HELP_FG)

        # Status bar
        self._render_status_bar("RETURN=Submit  STOP=Cancel")

    # ── Chat list ────────────────────────────────────────────────────

    def _render_chats(self):
        # Title bar with function key hints
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

        # Chat list rows
        for vi in range(CONTENT_ROWS):
            idx = self.chat_scroll + vi
            if idx >= len(self.chats):
                break
            chat = self.chats[idx]
            row = CONTENT_TOP + vi
            is_selected = idx == self.chat_sel

            # Build display string
            name = chat.name
            if chat.is_group:
                name = "#" + name

            # Unread badge
            badge = ""
            if chat.unread_count > 0:
                badge = f"({chat.unread_count})"

            # Time
            time_str = chat.timestamp

            # Calculate widths
            time_width = len(time_str)
            badge_width = len(badge)
            right_width = time_width + badge_width + (1 if badge_width else 0)
            name_width = SCREEN_COLS - right_width - 1
            display_name = name[:name_width]

            if is_selected:
                # Full reverse row
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if badge:
                    self._put_text(row, SCREEN_COLS - right_width, badge, COL_SELECTED_FG, reverse=True)
                if time_str:
                    self._put_text(row, SCREEN_COLS - time_width, time_str, COL_SELECTED_FG, reverse=True)
            else:
                name_fg = COL_GROUP_FG if chat.is_group else COL_WHITE
                self._put_text(row, 0, display_name, name_fg)
                if badge:
                    self._put_text(row, SCREEN_COLS - right_width, badge, COL_UNREAD_FG)
                if time_str:
                    self._put_text(row, SCREEN_COLS - time_width, time_str, COL_GREY)

        # Status bar
        total = len(self.chats)
        pos = self.chat_sel + 1
        status_text = self._chat_status if self._chat_status else f"{pos}/{total} RET=Open HOME=Refresh"
        self._render_status_bar(status_text)

    # ── Chat view ────────────────────────────────────────────────────

    def _render_chat_view(self):
        # Title bar with chat name
        title = self.current_chat_name[:32]
        self._render_title_bar(title)

        # Calculate how many lines the input occupies (1..MAX_INPUT_LINES)
        input_lines = self._input_line_count()
        # Layout: title(row0) | messages | sep_row | input_rows | status(row24)
        # sep_row = 24 - input_lines - 1 ... but status IS row 24 and is the input area here
        # We reuse rows from the bottom: row24 is last input line, rows above it for more input
        # Messages area: rows 1 .. (24 - input_lines - 1)
        sep_row = SCREEN_ROWS - 1 - input_lines  # separator between messages and input
        msg_end_row = sep_row - 1  # last row of message display
        msg_display_rows = msg_end_row - CONTENT_TOP + 1

        # Messages area
        for vi in range(msg_display_rows):
            li = self.msg_scroll + vi
            if li >= len(self._rendered_lines):
                break
            text, fg = self._rendered_lines[li]
            row = CONTENT_TOP + vi
            self._put_text(row, 0, text[:SCREEN_COLS], fg)

        # Separator line
        for c in range(SCREEN_COLS):
            self.screen[sep_row * SCREEN_COLS + c] = SC_HLINE
            self.color[sep_row * SCREEN_COLS + c] = COL_DARK_GREY

        # Input area: word-wrap msg_input into up to MAX_INPUT_LINES lines
        prompt = "> "
        input_width = SCREEN_COLS - len(prompt)
        wrapped_input = self._word_wrap(self.msg_input or "", input_width) if self.msg_input else [""]
        total_input_lines = len(wrapped_input)

        # Determine which wrapped line the cursor is on and its column
        cursor_wrapped_line, cursor_col_in_line = self._cursor_wrapped_pos(
            self.msg_input, self.msg_cursor, input_width
        )

        # Scroll so cursor line is visible
        visible_start = self.msg_input_scroll
        if cursor_wrapped_line < visible_start:
            visible_start = cursor_wrapped_line
            self.msg_input_scroll = visible_start
        if cursor_wrapped_line >= visible_start + input_lines:
            visible_start = cursor_wrapped_line - input_lines + 1
            self.msg_input_scroll = visible_start

        # Render input rows
        for li in range(input_lines):
            row = sep_row + 1 + li
            if row >= SCREEN_ROWS:
                break
            wrapped_idx = visible_start + li
            line_text = wrapped_input[wrapped_idx] if wrapped_idx < total_input_lines else ""
            # First visible line gets the "> " prompt
            if li == 0:
                self._put_text(row, 0, prompt, COL_CYAN)
                self._put_text(row, len(prompt), line_text[:input_width], COL_INPUT_FG)
            else:
                self._put_text(row, 0, "  ", COL_CYAN)  # indent continuation lines
                self._put_text(row, len(prompt), line_text[:input_width], COL_INPUT_FG)

        # Draw cursor
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
        """Return (line_index, col_in_line) for the given cursor pos after word-wrap."""
        if not text:
            return 0, 0
        wrapped = TelegramChatConsole._word_wrap(text, width)
        # Walk wrapped lines to find which one contains cursor position
        pos = 0
        for li, line in enumerate(wrapped):
            line_end = pos + len(line)
            if cursor <= line_end or li == len(wrapped) - 1:
                return li, cursor - pos
            pos = line_end + 1  # +1 for the space separator consumed by wrap
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

            # Name + username/phone
            info = ""
            if contact.username:
                info = f"@{contact.username}"
            elif contact.phone:
                info = contact.phone

            name_width = SCREEN_COLS - len(info) - 1 if info else SCREEN_COLS
            display_name = contact.name[:name_width]

            if is_selected:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put_text(row, 0, display_name, COL_SELECTED_FG, reverse=True)
                if info:
                    self._put_text(row, SCREEN_COLS - len(info), info, COL_SELECTED_FG, reverse=True)
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

        # Status line
        status = "Connected" if connected else "Disconnected"
        status_color = COL_GREEN if connected else COL_RED
        self._put_text(2, 1, f"Status: {status}", status_color)

        # Fields
        fields = [
            ("Phone:", cfg.get("TELEGRAM_PHONE", "")),
            ("API ID:", self._mask_value(cfg.get("TELEGRAM_API_ID", ""))),
            ("API Hash:", self._mask_value(cfg.get("TELEGRAM_API_HASH", ""))),
            ("Timezone:", cfg.get("TIMEZONE", "UTC")),
            ("[Login]", ""),
            ("[Logout]", ""),
        ]

        for i, (label, value) in enumerate(fields):
            row = 4 + i * 2
            is_selected = i == self.settings_sel

            if self.settings_editing and is_selected:
                # Show editable field with cursor
                self._put_text(row, 1, f"{label} ", COL_LABEL_FG)
                input_col = 2 + len(label)
                visible_width = SCREEN_COLS - input_col - 1
                # Show field value being edited
                vis_start = 0
                if self.settings_cursor > visible_width:
                    vis_start = self.settings_cursor - visible_width
                visible = self.settings_input[vis_start: vis_start + visible_width]
                self._put_text(row, input_col, visible, COL_FIELD_FG)
                # Cursor
                cursor_screen = input_col + (self.settings_cursor - vis_start)
                if 0 <= cursor_screen < SCREEN_COLS:
                    pos = row * SCREEN_COLS + cursor_screen
                    self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                    self.color[pos] = COL_FIELD_FG
            elif is_selected:
                # Highlight row
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                if value:
                    self._put_text(row, 1, f"{label} {value}", COL_SELECTED_FG, reverse=True)
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

        # Status message
        if self.settings_status:
            self._put_text(18, 1, self.settings_status[:38], COL_YELLOW)

        # Hints
        self._put_text(20, 1, "RET=Edit/Action  STOP=Back", COL_HELP_FG)
        self._put_text(21, 1, "UP/DN=Select field", COL_HELP_FG)

        self._render_status_bar("F1=Chats F3=Contacts F8=Help")

    # ── Help ─────────────────────────────────────────────────────────

    def _render_help(self):
        # Header
        self._render_title_bar("TELEGRAM HELP")

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
                        self._put_text(row, desc_start, desc_part[: SCREEN_COLS - desc_start], COL_LIGHT_GREY)
                    else:
                        self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)
                else:
                    self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)

        self._render_status_bar("F8/STOP=Close  UP/DN=Scroll")

    # =================================================================
    #  RENDER HELPERS
    # =================================================================

    def _render_title_bar(self, text: str):
        """Render a full-width reverse title bar on row 0."""
        for c in range(SCREEN_COLS):
            self.screen[TITLE_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[TITLE_ROW * SCREEN_COLS + c] = COL_TITLE_FG
        self._put_text(TITLE_ROW, 0, text[:SCREEN_COLS], COL_TITLE_FG, reverse=True)

    def _render_status_bar(self, text: str):
        """Render a full-width reverse status bar on row 24."""
        for c in range(SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG
        self._put_text(STATUS_ROW, 0, text[:SCREEN_COLS], COL_STATUS_FG, reverse=True)

    def _render_input_field(self, row: int, text: str):
        """Render a text input field with cursor."""
        visible_width = SCREEN_COLS - 2
        cursor_pos = len(text)
        vis_start = 0
        if cursor_pos > visible_width:
            vis_start = cursor_pos - visible_width
        visible = text[vis_start: vis_start + visible_width]
        self._put_text(row, 1, visible, COL_INPUT_FG)
        # Cursor
        cursor_screen = 1 + (cursor_pos - vis_start)
        if cursor_screen < SCREEN_COLS:
            pos = row * SCREEN_COLS + cursor_screen
            self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
            self.color[pos] = COL_INPUT_FG

    def _put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
        """Write ASCII text to screen buffer at (row, col) with colour."""
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                continue
            if row < 0 or row >= SCREEN_ROWS:
                return
            pos = row * SCREEN_COLS + c
            sc = ascii_to_screencode(ord(ch))
            if reverse:
                sc |= SC_REVERSE_BIT
            self.screen[pos] = sc
            self.color[pos] = fg

    def _push_screen(self):
        """DMA-push the current screen/color buffers to the C64."""
        try:
            send_screen_data(bytes(self.screen), bytes(self.color))
        except Exception:
            logger.debug("Screen push failed (no C64 connected?)", exc_info=True)

    def _send_vic_colors(self, border: int, background: int):
        """DMA-write border ($D020) and background ($D021) colours to C64."""
        try:
            from network_helper import send_vic_colors
            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.warning("Could not send VIC colours: %s", e)

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        """Convert PETSCII code to a printable ASCII character."""
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    @staticmethod
    def _mask_value(value: str) -> str:
        """Mask a secret value for display."""
        if not value or len(value) <= 4:
            return "*" * len(value) if value else ""
        return "*" * (len(value) - 4) + value[-4:]

    # =================================================================
    #  BACKGROUND POLLING
    # =================================================================

    def _bg_poll_loop(self):
        """Daemon thread: periodically poll Telegram for new messages.

        Polling interval:
          - MODE_CHAT_VIEW : 5 seconds  (user is in an active conversation)
          - MODE_CHATS     : 60 seconds (user is browsing the chat list)
          - anything else  : skip (login / settings / help / not connected)
        """
        while not self._poll_stop.wait(timeout=1.0):
            if not self.worker.connected:
                continue
            if self.mode == MODE_CHAT_VIEW:
                interval = 5
            elif self.mode == MODE_CHATS:
                interval = 60
            else:
                continue
            now = time.monotonic()
            if now - self._last_poll_time < interval:
                continue
            self._last_poll_time = now
            self._poll_once()

    def _poll_once(self):
        """Fetch fresh data from Telegram and push updates to the C64.

        All rendering and screen-pushing uses the single canonical
        self.screen / self.color buffer under _render_lock, so there
        is never a second buffer or a stale copy.
        """
        try:
            old_unread = self._last_unread_total

            # ── Slow network calls OUTSIDE the lock ──────────────────────
            try:
                tz_minutes = self._get_tz_offset_minutes()
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

            new_unread = sum(c.unread_count for c in (new_chats or []))

            # ── Apply data + render + push UNDER the lock ────────────────
            from console_manager import ConsoleManager
            mgr = ConsoleManager.instance()
            active_console_id = mgr._active.get(self.session_id)

            if active_console_id == self.console_id:
                # Telegram IS the active console — update the single
                # screen buffer and push it to the C64.
                with self._render_lock:
                    if new_chats:
                        self.chats = new_chats
                        if self.chat_sel >= len(self.chats):
                            self.chat_sel = max(0, len(self.chats) - 1)

                    if new_messages is not None:
                        self.messages = new_messages
                        self._build_rendered_lines()
                        max_scroll = max(
                            0,
                            len(self._rendered_lines)
                            - self._msg_display_rows(),
                        )
                        self.msg_scroll = max_scroll

                    self._full_render()
                    self._push_screen()

            elif new_unread > old_unread:
                # Telegram is in the background — overlay a toaster on
                # whichever console is currently shown.
                delta = new_unread - old_unread
                msg = f"TELEGRAM: {delta} new message{'s' if delta > 1 else ''}"
                key = (self.session_id, active_console_id)
                other = mgr._consoles.get(key)
                if other is not None:
                    other.show_toaster(msg, duration_sec=10.0, color=7)
                    try:
                        send_screen_data(
                            other.get_screen_data(), other.get_color_data()
                        )
                    except Exception:
                        logger.debug("Toaster push failed", exc_info=True)

            self._last_unread_total = new_unread

        except Exception:
            logger.warning("Telegram background poll error", exc_info=True)
