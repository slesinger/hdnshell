"""
Server-side Mail (IMAP/SMTP) console (console 8) for HDN Server.

A PETSCII email client rendered into a 40x25 C64 screen-code back-buffer,
in the same family as the Telegram Chat console (console 5). All state lives
on the server; the C64 only exchanges screen data and keystrokes.

Protocols: IMAP (read) + SMTP (send) via stdlib imaplib/smtplib/email — no new
dependency. HTML mail is stripped to plain text. A background IMAP IDLE thread
raises a session toast on new mail.

Account credentials are configured in the web UI Settings page (an "Email"
card), NOT on the C64. The F8 help screen points the user there.

Invoked from C64 by pressing C=+CTRL+8.
"""

import email
import email.utils
import html as html_module
import imaplib
import logging
import os
import queue
import re
import smtplib
import threading
import time
from dataclasses import dataclass, field
from datetime import datetime, timezone, timedelta
from email.header import decode_header, make_header
from email.message import EmailMessage
from typing import Dict, List, Optional, Tuple

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
COL_UNREAD_FG = COL_YELLOW
COL_READ_FG = COL_LIGHT_BLUE
COL_FLAG_FG = COL_RED
COL_ERROR_FG = COL_RED
COL_LABEL_FG = COL_LIGHT_GREY
COL_ATTACH_FG = COL_GREEN
COL_QUOTE_FG = COL_DARK_GREY
COL_FIELD_FG = COL_WHITE

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
KEY_TAB = 0x09
KEY_SHIFT_COMA = 0x3C   # <  — page up when held with C=
KEY_SHIFT_PERIOD = 0x3E  # >  — page down when held with C=
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F4 = 0x8A
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C

# Modifier flags
MOD_COMMODORE = 0x04
MOD_SHIFT = 0x01

# ── Mail modes ──────────────────────────────────────────────────────
MODE_LIST = 0
MODE_VIEW = 1
MODE_COMPOSE = 2
MODE_FOLDERS = 3
MODE_HELP = 4

# ── Layout ──────────────────────────────────────────────────────────
TITLE_ROW = 0
CONTENT_TOP = 1
STATUS_ROW = 24
CONTENT_ROWS = STATUS_ROW - CONTENT_TOP  # rows 1..23 = 23 content rows

# Windowed header fetch
PAGE_SIZE = 40
MAX_INPUT_LEN = 200

# Compose fields
FIELD_TO = 0
FIELD_CC = 1
FIELD_SUB = 2
FIELD_BODY = 3

# ── Help screen content ─────────────────────────────────────────────
HELP_LINES = [
    "=== HDN MAIL HELP        F8=close ===",
    "",
    " ACCOUNT SETUP",
    " Configure your IMAP/SMTP account in",
    " the HDN web UI Settings page, under",
    " the 'Email' card. There is no on-C64",
    " credential editor. Set host, port,",
    " user, password, from-name and TLS.",
    " Gmail/Fastmail: use an app-password.",
    "",
    " MESSAGE LIST",
    " UP/DOWN     Select message",
    " C=+< / C=+> Page up / down",
    " RETURN      Open message",
    " HOME/F5     Refresh",
    " F2          Folders",
    " /           Search subject+from",
    " C=+/        (in search) full-text",
    " D           Delete (to Trash)",
    " U           Toggle unread/read",
    " S           Toggle flag (star)",
    " #           Archive",
    " N           New message (compose)",
    " F8          This help",
    "",
    " ROW MARKERS",
    " *  unread     !  flagged",
    " A  attachment R  replied",
    "",
    " MESSAGE VIEW",
    " UP/DOWN     Scroll",
    " C=+< / C=+> Page up / down",
    " SPACE       Highlight next link",
    " RETURN      Open highlighted link",
    "             (switches to Web Browser)",
    " F3          Reply",
    " F4          Reply all",
    " F7          Forward",
    " N / P       Next / previous",
    " D           Delete (to Trash)",
    " A           Attachments (save)",
    " LEFT ARROW  Back to list",
    " STOP        Back to list",
    "",
    " COMPOSE",
    " TAB         Next field",
    " C=+TAB      Previous field",
    " C=+LT/RT    Jump word left/right",
    " F7          Send",
    " STOP        Save draft & back",
    "",
    " FOLDERS OVERLAY (F2)",
    " UP/DOWN     Select folder",
    " RETURN      Open folder",
    " STOP        Cancel",
    "",
    " press F8 or STOP to close help",
]


# =====================================================================
#  Data classes
# =====================================================================


@dataclass
class FolderEntry:
    name: str = ""      # raw IMAP mailbox name
    display: str = ""   # human-friendly label
    unread: int = 0
    total: int = 0


@dataclass
class MailHeader:
    uid: str = ""
    from_name: str = ""
    from_addr: str = ""
    subject: str = ""
    date_str: str = ""   # short display (HH:MM / weekday / date)
    ts: float = 0.0      # unix timestamp for sorting
    seen: bool = False
    flagged: bool = False
    answered: bool = False
    has_attach: bool = False


@dataclass
class Attachment:
    idx: int = 0
    filename: str = ""
    mime: str = ""
    size: int = 0


@dataclass
class MailBody:
    uid: str = ""
    headers: Dict[str, str] = field(default_factory=dict)  # from/to/cc/date/subject
    text_lines: List[Tuple[str, int]] = field(default_factory=list)  # (text, color)
    attachments: List[Attachment] = field(default_factory=list)


@dataclass
class MailLink:
    """A URL found in a message body, positioned in ``MailBody.text_lines``."""

    url: str = ""
    line: int = 0        # index into text_lines
    col_start: int = 0   # start column within the (untruncated) line text
    col_end: int = 0     # exclusive end column


# =====================================================================
#  Pure helpers (unit-testable)
# =====================================================================


def _decode_mime(raw: Optional[str]) -> str:
    """Decode a possibly MIME-encoded header value (=?utf-8?...?=) to text."""
    if not raw:
        return ""
    try:
        return str(make_header(decode_header(raw)))
    except Exception:
        try:
            return str(raw)
        except Exception:
            return ""


def _parse_address(raw: Optional[str]) -> Tuple[str, str]:
    """Return (display_name, email_address) parsed from a header value."""
    if not raw:
        return ("", "")
    name, addr = email.utils.parseaddr(raw)
    name = _decode_mime(name)
    if not name:
        name = addr.split("@")[0] if addr else ""
    return (name, addr)


_TAG_RE = re.compile(r"<[^>]+>")
_A_HREF_RE = re.compile(r'<a\s+[^>]*href=["\']?([^"\'>\s]+)', re.IGNORECASE)
_WS_RE = re.compile(r"[ \t]+")
_URL_RE = re.compile(r'https?://[^\s<>"\']+')
_URL_TRAILING_PUNCT = ".,;:!?)]}>\"'"


def _extract_links(text_lines: List[Tuple[str, int]]) -> List["MailLink"]:
    """Find every http(s) URL in *text_lines*, in reading order.

    Catches both the ``[n] https://...`` footnotes ``_html_to_text`` appends
    for HTML mail and bare URLs typed inline in plain-text mail.
    """
    links: List[MailLink] = []
    for i, (text, _color) in enumerate(text_lines):
        for m in _URL_RE.finditer(text):
            url = m.group(0)
            end = m.end()
            while url and url[-1] in _URL_TRAILING_PUNCT:
                url = url[:-1]
                end -= 1
            if url:
                links.append(MailLink(url=url, line=i,
                                      col_start=m.start(), col_end=end))
    return links


def _html_to_text(html: str) -> str:
    """Dependency-free HTML → plain text.

    Links become trailing ``[n]`` footnotes, block tags become newlines,
    entities are unescaped and residual tags removed.
    """
    if not html:
        return ""
    links: List[str] = []

    def _a_repl(m):
        links.append(m.group(1))
        return f"[{len(links)}] "

    text = html
    # Drop script/style bodies entirely.
    text = re.sub(r"(?is)<(script|style)[^>]*>.*?</\1>", " ", text)
    # Capture link targets before stripping tags.
    text = _A_HREF_RE.sub(_a_repl, text)
    # Block-level tags → newlines; list items → "- ".
    text = re.sub(r"(?i)<\s*br\s*/?>", "\n", text)
    text = re.sub(r"(?i)</\s*(p|div|tr|h[1-6]|ul|ol|table)\s*>", "\n", text)
    text = re.sub(r"(?i)<\s*li[^>]*>", "\n- ", text)
    # Remove any remaining tags.
    text = _TAG_RE.sub("", text)
    text = html_module.unescape(text)
    # Collapse whitespace.
    lines = []
    for line in text.split("\n"):
        line = _WS_RE.sub(" ", line).strip()
        lines.append(line)
    out = "\n".join(lines)
    out = re.sub(r"\n{3,}", "\n\n", out).strip()
    if links:
        out += "\n\n"
        for i, url in enumerate(links, 1):
            out += f"[{i}] {url}\n"
    return out


def _iter_fetch_items(data):
    """Yield (meta_bytes, literal_bytes) pairs from an imaplib FETCH response.

    imaplib returns a flat list where message parts are 2-tuples
    ``(b'<n> (UID .. {len}', b'<literal>')`` interleaved with b')' separators.
    """
    for item in data or []:
        if isinstance(item, tuple) and len(item) >= 2:
            meta = item[0] if isinstance(item[0], (bytes, bytearray)) else b""
            literal = item[1] if isinstance(item[1], (bytes, bytearray)) else b""
            yield bytes(meta), bytes(literal)


_UID_RE = re.compile(rb"UID\s+(\d+)")
_FLAGS_RE = re.compile(rb"FLAGS\s+\(([^)]*)\)")


def _parse_meta_flags(meta: bytes) -> Tuple[str, set, bool]:
    """Return (uid, flag_set, has_attach) from FETCH metadata bytes."""
    uid = ""
    m = _UID_RE.search(meta)
    if m:
        uid = m.group(1).decode("ascii", "ignore")
    flags = set()
    fm = _FLAGS_RE.search(meta)
    if fm:
        for f in fm.group(1).split():
            flags.add(f.decode("ascii", "ignore"))
    low = meta.lower()
    has_attach = b'"attachment"' in low or b"filename" in low or b'"name"' in low
    return uid, flags, has_attach


def _format_date(dt: Optional[datetime], tz: timezone) -> Tuple[str, float]:
    """Return (short_display, unix_ts) for a message datetime."""
    if dt is None:
        return ("", 0.0)
    try:
        if dt.tzinfo is None:
            dt = dt.replace(tzinfo=timezone.utc)
        local = dt.astimezone(tz)
        ts = dt.timestamp()
        now = datetime.now(tz)
        if local.date() == now.date():
            return (local.strftime("%H:%M"), ts)
        delta = (now.date() - local.date()).days
        if 0 < delta < 7:
            return (local.strftime("%a"), ts)
        return (local.strftime("%d/%m"), ts)
    except Exception:
        return ("", 0.0)


# =====================================================================
#  _MailWorker — dedicated thread owning the IMAP/SMTP connections
# =====================================================================


class _MailWorker:
    """Runs all IMAP/SMTP operations in a dedicated daemon thread.

    Callers submit jobs via a thread-safe queue and block until the result is
    ready (same pattern as _TelethonWorker in telegram_chat.py). A separate
    lightweight IDLE thread holds its own authenticated IMAP connection and
    pushes new-mail events onto ``_update_queue``.
    """

    _SENTINEL = object()

    def __init__(self):
        self._job_queue: queue.Queue = queue.Queue()
        self._update_queue: queue.Queue = queue.Queue()
        self._imap: Optional[imaplib.IMAP4] = None
        self._cfg: dict = {}
        self._connected = False
        self._selected: Optional[str] = None
        # Special-use folder resolution (Trash / Sent / Archive).
        self._special: Dict[str, str] = {}
        # IDLE thread state
        self._idle_stop = threading.Event()
        self._idle_thread: Optional[threading.Thread] = None
        self._thread = threading.Thread(
            target=self._run, name="mail-worker", daemon=True
        )
        self._thread.start()

    # ------------------------------------------------------------------
    #  Public API
    # ------------------------------------------------------------------

    def call(self, method: str, **kwargs):
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
        self._idle_stop.set()
        self._job_queue.put(self._SENTINEL)

    def get_pending_updates(self) -> list:
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
            job = self._job_queue.get()
            if job is self._SENTINEL:
                self._cleanup()
                break
            method_name, kwargs, result_q = job
            try:
                method = getattr(self, f"_do_{method_name}", None)
                if method is None:
                    result_q.put(ValueError(f"Unknown method: {method_name}"))
                else:
                    result_q.put(method(**kwargs))
            except Exception as exc:
                logger.error("Mail worker error (%s): %s", method_name, exc,
                             exc_info=True)
                result_q.put(exc)

    def _cleanup(self):
        for conn in (self._imap,):
            if conn is not None:
                try:
                    conn.logout()
                except Exception:
                    pass
        self._imap = None
        self._connected = False

    # ------------------------------------------------------------------
    #  Connection helpers
    # ------------------------------------------------------------------

    def _open_imap(self, cfg: dict) -> imaplib.IMAP4:
        host = (cfg.get("MAIL_IMAP_HOST") or "").strip()
        port = int((cfg.get("MAIL_IMAP_PORT") or "993").strip() or "993")
        tls = (cfg.get("MAIL_TLS") or "ssl").strip().lower()
        if tls == "ssl":
            conn = imaplib.IMAP4_SSL(host, port)
        else:
            conn = imaplib.IMAP4(host, port)
            try:
                conn.starttls()
            except Exception:
                pass
        conn.login((cfg.get("MAIL_USER") or "").strip(),
                   cfg.get("MAIL_PASS") or "")
        return conn

    def _ensure(self):
        """Re-select nothing but ensure the IMAP connection is alive."""
        if self._imap is None:
            raise RuntimeError("not connected")
        try:
            self._imap.noop()
        except Exception:
            # Reconnect transparently.
            self._imap = self._open_imap(self._cfg)
            self._selected = None
            self._connected = True

    def _select(self, folder: str, readonly: bool = False):
        self._ensure()
        if self._selected != folder or readonly:
            typ, _ = self._imap.select(_quote(folder), readonly=readonly)
            if typ != "OK":
                raise RuntimeError(f"cannot select {folder}")
            self._selected = None if readonly else folder

    # ------------------------------------------------------------------
    #  Job implementations
    # ------------------------------------------------------------------

    def _do_connect(self, cfg: dict = None) -> str:
        cfg = cfg or {}
        self._cfg = dict(cfg)
        if not (cfg.get("MAIL_IMAP_HOST") and cfg.get("MAIL_USER")
                and cfg.get("MAIL_PASS")):
            self._connected = False
            return "need_config"
        try:
            if self._imap is not None:
                try:
                    self._imap.logout()
                except Exception:
                    pass
            self._imap = self._open_imap(cfg)
            self._connected = True
            self._selected = None
            self._resolve_special()
            self._start_idle()
            return "authorized"
        except Exception as e:
            self._connected = False
            return f"error:{e}"

    def _resolve_special(self):
        """Map Trash/Sent/Archive to real mailbox names via SPECIAL-USE or names."""
        self._special = {}
        try:
            typ, boxes = self._imap.list()
            if typ != "OK":
                return
            names = []
            for raw in boxes or []:
                if not raw:
                    continue
                line = raw.decode("utf-8", "ignore") if isinstance(raw, bytes) else str(raw)
                name = _parse_list_mailbox(line)
                names.append((line, name))
                low = line.lower()
                if "\\trash" in low:
                    self._special["Trash"] = name
                if "\\sent" in low:
                    self._special["Sent"] = name
                if "\\archive" in low:
                    self._special["Archive"] = name
            # Fallbacks by common naming.
            fallbacks = {
                "Trash": ["Trash", "Deleted", "Deleted Items", "Deleted Messages",
                          "[Gmail]/Trash", "INBOX.Trash"],
                "Sent": ["Sent", "Sent Items", "Sent Messages",
                         "[Gmail]/Sent Mail", "INBOX.Sent"],
                "Archive": ["Archive", "Archives", "All Mail",
                            "[Gmail]/All Mail", "INBOX.Archive"],
            }
            plain = {n for _, n in names}
            for key, cands in fallbacks.items():
                if key in self._special:
                    continue
                for c in cands:
                    if c in plain:
                        self._special[key] = c
                        break
        except Exception as e:
            logger.debug("resolve_special failed: %s", e)

    def _do_list_folders(self) -> List[FolderEntry]:
        self._ensure()
        result: List[FolderEntry] = []
        try:
            typ, boxes = self._imap.list()
            if typ != "OK":
                return result
            for raw in boxes or []:
                if not raw:
                    continue
                line = raw.decode("utf-8", "ignore") if isinstance(raw, bytes) else str(raw)
                if "\\noselect" in line.lower():
                    continue
                name = _parse_list_mailbox(line)
                if not name:
                    continue
                unread, total = self._folder_counts(name)
                result.append(FolderEntry(name=name, display=_folder_display(name),
                                          unread=unread, total=total))
            # INBOX first, then alpha.
            result.sort(key=lambda f: (0 if f.name.upper() == "INBOX" else 1,
                                       f.display.lower()))
        except Exception as e:
            logger.error("list_folders: %s", e)
        return result

    def _folder_counts(self, folder: str) -> Tuple[int, int]:
        try:
            typ, data = self._imap.status(_quote(folder), "(MESSAGES UNSEEN)")
            if typ == "OK" and data and data[0]:
                s = data[0].decode("utf-8", "ignore")
                total = _status_num(s, "MESSAGES")
                unread = _status_num(s, "UNSEEN")
                return unread, total
        except Exception:
            pass
        return 0, 0

    def _do_select_folder(self, name: str = "INBOX") -> Tuple[int, int]:
        self._select(name)
        return self._folder_counts(name)

    def _do_fetch_headers(self, folder: str = "INBOX", offset: int = 0,
                          limit: int = PAGE_SIZE,
                          tz_offset_minutes: int = 0) -> Tuple[List[MailHeader], int]:
        """Windowed, newest-first header fetch. Returns (headers, total)."""
        self._select(folder)
        tz = timezone(timedelta(minutes=tz_offset_minutes))
        typ, data = self._imap.uid("SEARCH", None, "ALL")
        if typ != "OK" or not data:
            return [], 0
        all_uids = data[0].split() if data[0] else []
        total = len(all_uids)
        if total == 0:
            return [], 0
        newest_first = list(reversed(all_uids))
        window = newest_first[offset:offset + limit]
        if not window:
            return [], total
        uid_set = b",".join(window)
        typ, fdata = self._imap.uid(
            "FETCH", uid_set,
            "(UID FLAGS BODYSTRUCTURE BODY.PEEK[HEADER.FIELDS (FROM SUBJECT DATE)])",
        )
        headers_by_uid: Dict[str, MailHeader] = {}
        if typ == "OK":
            for meta, literal in _iter_fetch_items(fdata):
                uid, flags, has_attach = _parse_meta_flags(meta)
                if not uid:
                    continue
                msg = email.message_from_bytes(literal)
                from_name, from_addr = _parse_address(msg.get("From"))
                subject = _decode_mime(msg.get("Subject"))
                dt = None
                try:
                    dt = email.utils.parsedate_to_datetime(msg.get("Date"))
                except Exception:
                    dt = None
                date_str, ts = _format_date(dt, tz)
                headers_by_uid[uid] = MailHeader(
                    uid=uid,
                    from_name=transliterate(from_name)[:24],
                    from_addr=from_addr,
                    subject=transliterate(subject)[:60],
                    date_str=date_str,
                    ts=ts,
                    seen="\\Seen" in flags,
                    flagged="\\Flagged" in flags,
                    answered="\\Answered" in flags,
                    has_attach=has_attach,
                )
        # Preserve newest-first order of the window.
        ordered = [headers_by_uid[u.decode("ascii", "ignore")]
                   for u in window
                   if u.decode("ascii", "ignore") in headers_by_uid]
        return ordered, total

    def _do_fetch_body(self, folder: str = "INBOX", uid: str = "",
                       tz_offset_minutes: int = 0) -> Optional[MailBody]:
        self._select(folder)
        typ, data = self._imap.uid("FETCH", uid, "(BODY.PEEK[])")
        if typ != "OK":
            return None
        raw = b""
        for meta, literal in _iter_fetch_items(data):
            raw = literal
            break
        if not raw:
            return None
        msg = email.message_from_bytes(raw)
        from_name, from_addr = _parse_address(msg.get("From"))
        body = MailBody(uid=uid)
        body.headers = {
            "from": transliterate(f"{from_name} <{from_addr}>".strip()),
            "to": transliterate(_decode_mime(msg.get("To"))),
            "cc": transliterate(_decode_mime(msg.get("Cc"))),
            "date": transliterate(_decode_mime(msg.get("Date"))),
            "subject": transliterate(_decode_mime(msg.get("Subject"))),
            "message_id": msg.get("Message-ID", ""),
            "references": msg.get("References", ""),
            "reply_to": _parse_address(msg.get("Reply-To"))[1] or from_addr,
        }
        text, attachments = _extract_body(msg)
        body.attachments = attachments
        # Build coloured, transliterated lines (quotes dimmed).
        for line in text.split("\n"):
            tline = transliterate(line)
            colour = COL_QUOTE_FG if tline.lstrip().startswith(">") else COL_TEXT_FG
            body.text_lines.append((tline, colour))
        # Mark \Seen.
        try:
            self._imap.uid("STORE", uid, "+FLAGS", "(\\Seen)")
        except Exception as e:
            logger.debug("mark seen failed uid=%s: %s", uid, e)
        return body

    def _do_search(self, folder: str = "INBOX", query: str = "",
                   full_text: bool = False,
                   tz_offset_minutes: int = 0) -> Tuple[List[MailHeader], int]:
        self._select(folder)
        q = query.replace('"', "")
        try:
            if full_text:
                typ, data = self._imap.uid("SEARCH", "CHARSET", "UTF-8",
                                           "TEXT", f'"{q}"')
            else:
                typ, data = self._imap.uid("SEARCH", "CHARSET", "UTF-8",
                                           "OR", "SUBJECT", f'"{q}"',
                                           "FROM", f'"{q}"')
        except Exception:
            # Some servers reject CHARSET; retry plain ASCII.
            if full_text:
                typ, data = self._imap.uid("SEARCH", None, "TEXT", f'"{q}"')
            else:
                typ, data = self._imap.uid("SEARCH", None, "OR",
                                           "SUBJECT", f'"{q}"', "FROM", f'"{q}"')
        if typ != "OK" or not data or not data[0]:
            return [], 0
        uids = list(reversed(data[0].split()))[:PAGE_SIZE]
        if not uids:
            return [], 0
        return self._fetch_header_set(uids, tz_offset_minutes)

    def _fetch_header_set(self, uids, tz_offset_minutes: int):
        tz = timezone(timedelta(minutes=tz_offset_minutes))
        uid_set = b",".join(uids)
        typ, fdata = self._imap.uid(
            "FETCH", uid_set,
            "(UID FLAGS BODYSTRUCTURE BODY.PEEK[HEADER.FIELDS (FROM SUBJECT DATE)])",
        )
        by_uid: Dict[str, MailHeader] = {}
        if typ == "OK":
            for meta, literal in _iter_fetch_items(fdata):
                uid, flags, has_attach = _parse_meta_flags(meta)
                if not uid:
                    continue
                msg = email.message_from_bytes(literal)
                from_name, from_addr = _parse_address(msg.get("From"))
                subject = _decode_mime(msg.get("Subject"))
                try:
                    dt = email.utils.parsedate_to_datetime(msg.get("Date"))
                except Exception:
                    dt = None
                date_str, ts = _format_date(dt, tz)
                by_uid[uid] = MailHeader(
                    uid=uid, from_name=transliterate(from_name)[:24],
                    from_addr=from_addr, subject=transliterate(subject)[:60],
                    date_str=date_str, ts=ts, seen="\\Seen" in flags,
                    flagged="\\Flagged" in flags, answered="\\Answered" in flags,
                    has_attach=has_attach,
                )
        ordered = [by_uid[u.decode("ascii", "ignore")] for u in uids
                   if u.decode("ascii", "ignore") in by_uid]
        return ordered, len(ordered)

    def _do_set_flag(self, folder: str = "INBOX", uid: str = "",
                     flag: str = "", on: bool = True) -> str:
        self._select(folder)
        op = "+FLAGS" if on else "-FLAGS"
        try:
            self._imap.uid("STORE", uid, op, f"({flag})")
            return "ok"
        except Exception as e:
            return f"error:{e}"

    def _do_move(self, folder: str = "INBOX", uid: str = "",
                 dest: str = "Trash") -> str:
        self._select(folder)
        real = self._special.get(dest, dest)
        try:
            # Prefer server-side MOVE.
            typ, _ = self._imap.uid("MOVE", uid, _quote(real))
            if typ == "OK":
                return "ok"
        except Exception:
            pass
        # Fallback: COPY + \Deleted + EXPUNGE.
        try:
            typ, _ = self._imap.uid("COPY", uid, _quote(real))
            if typ != "OK":
                return f"error:copy to {real} failed"
            self._imap.uid("STORE", uid, "+FLAGS", "(\\Deleted)")
            self._imap.expunge()
            return "ok"
        except Exception as e:
            return f"error:{e}"

    def _do_expunge(self, folder: str = "Trash") -> str:
        real = self._special.get(folder, folder)
        try:
            self._select(real)
            self._imap.uid("STORE", "1:*", "+FLAGS", "(\\Deleted)")
            self._imap.expunge()
            return "ok"
        except Exception as e:
            return f"error:{e}"

    def _do_smtp_send(self, to: str = "", cc: str = "", subject: str = "",
                      body: str = "", in_reply_to: str = "",
                      references: str = "") -> str:
        cfg = self._cfg
        host = (cfg.get("MAIL_SMTP_HOST") or "").strip()
        if not host:
            return "error:No SMTP host configured"
        port = int((cfg.get("MAIL_SMTP_PORT") or "587").strip() or "587")
        user = (cfg.get("MAIL_USER") or "").strip()
        password = cfg.get("MAIL_PASS") or ""
        from_name = (cfg.get("MAIL_FROM_NAME") or "").strip()
        tls = (cfg.get("MAIL_TLS") or "ssl").strip().lower()

        msg = EmailMessage()
        msg["From"] = email.utils.formataddr((from_name, user)) if from_name else user
        msg["To"] = to
        if cc.strip():
            msg["Cc"] = cc
        msg["Subject"] = subject
        msg["Date"] = email.utils.formatdate(localtime=True)
        msg["Message-ID"] = email.utils.make_msgid()
        if in_reply_to:
            msg["In-Reply-To"] = in_reply_to
            refs = (references + " " + in_reply_to).strip()
            msg["References"] = refs
        msg.set_content(body or "")

        recipients = [a for a in
                      [x.strip() for x in re.split(r"[,;]", to + "," + cc)] if a]
        try:
            if tls == "ssl" and port == 465:
                server = smtplib.SMTP_SSL(host, port, timeout=30)
            else:
                server = smtplib.SMTP(host, port, timeout=30)
                try:
                    server.starttls()
                except Exception:
                    pass
            with server:
                if user:
                    server.login(user, password)
                server.send_message(msg, from_addr=user, to_addrs=recipients)
        except Exception as e:
            return f"error:{e}"
        # APPEND to Sent (best-effort).
        try:
            sent = self._special.get("Sent")
            if sent and self._imap is not None:
                self._imap.append(_quote(sent), "(\\Seen)",
                                  imaplib.Time2Internaldate(time.time()),
                                  msg.as_bytes())
        except Exception as e:
            logger.debug("append to Sent failed: %s", e)
        return "ok"

    def _do_save_attachment(self, folder: str = "INBOX", uid: str = "",
                            part_idx: int = 0, dest_path: str = "") -> str:
        self._select(folder)
        typ, data = self._imap.uid("FETCH", uid, "(BODY.PEEK[])")
        if typ != "OK":
            return "error:fetch failed"
        raw = b""
        for _meta, literal in _iter_fetch_items(data):
            raw = literal
            break
        if not raw:
            return "error:empty message"
        msg = email.message_from_bytes(raw)
        _text, attachments = _extract_body(msg)
        parts = _attachment_parts(msg)
        if part_idx < 0 or part_idx >= len(parts):
            return "error:no such attachment"
        payload = parts[part_idx].get_payload(decode=True) or b""
        try:
            os.makedirs(os.path.dirname(dest_path), exist_ok=True)
            with open(dest_path, "wb") as f:
                f.write(payload)
            return "ok"
        except Exception as e:
            return f"error:{e}"

    # ------------------------------------------------------------------
    #  IMAP IDLE push (best-effort; only verifiable on real hardware)
    # ------------------------------------------------------------------

    def _start_idle(self):
        if self._idle_thread and self._idle_thread.is_alive():
            return
        self._idle_stop.clear()
        self._idle_thread = threading.Thread(
            target=self._idle_loop, name="mail-idle", daemon=True
        )
        self._idle_thread.start()

    def _idle_loop(self):
        """Hold a dedicated IMAP connection in IDLE on INBOX, push new-mail events."""
        backoff = 5
        while not self._idle_stop.is_set():
            conn = None
            try:
                conn = self._open_imap(self._cfg)
                conn.select("INBOX", readonly=True)
                last_count = _select_count(conn)
                backoff = 5
                while not self._idle_stop.is_set():
                    tag = conn._new_tag()
                    conn.send(tag + b" IDLE\r\n")
                    conn.readline()  # '+ idling'
                    got_exists = self._idle_wait(conn, deadline=time.monotonic() + 540)
                    conn.send(b"DONE\r\n")
                    conn.readline()
                    if got_exists:
                        new_count = _select_count(conn)
                        if new_count > last_count:
                            self._emit_new_mail(conn)
                        last_count = new_count
            except Exception as e:
                logger.debug("mail-idle error: %s", e)
                if self._idle_stop.wait(timeout=backoff):
                    break
                backoff = min(backoff * 2, 120)
            finally:
                if conn is not None:
                    try:
                        conn.logout()
                    except Exception:
                        pass

    def _idle_wait(self, conn, deadline: float) -> bool:
        """Block on the idle socket until EXISTS, timeout, or stop. True on EXISTS."""
        import select as _select_mod
        sock = conn.socket()
        while not self._idle_stop.is_set() and time.monotonic() < deadline:
            r, _, _ = _select_mod.select([sock], [], [], 1.0)
            if not r:
                continue
            try:
                line = conn.readline()
            except Exception:
                return False
            if not line:
                return False
            if b"EXISTS" in line:
                return True
        return False

    def _emit_new_mail(self, conn):
        try:
            typ, data = conn.uid("SEARCH", None, "ALL")
            if typ != "OK" or not data or not data[0]:
                return
            newest = data[0].split()[-1]
            typ, fdata = conn.uid(
                "FETCH", newest,
                "(BODY.PEEK[HEADER.FIELDS (FROM SUBJECT)])")
            from_name, subject = "", ""
            for _meta, literal in _iter_fetch_items(fdata):
                msg = email.message_from_bytes(literal)
                from_name = _parse_address(msg.get("From"))[0]
                subject = _decode_mime(msg.get("Subject"))
                break
            self._update_queue.put_nowait({
                "type": "new_mail",
                "uid": newest.decode("ascii", "ignore"),
                "from": transliterate(from_name),
                "subject": transliterate(subject),
            })
        except Exception as e:
            logger.debug("emit_new_mail failed: %s", e)


# ── Module-level IMAP/mailbox string helpers ────────────────────────

_LIST_RE = re.compile(r'^\([^)]*\)\s+("[^"]*"|\S+)\s+(.*)$')


def _parse_list_mailbox(line: str) -> str:
    """Extract the mailbox name from a LIST response line."""
    m = _LIST_RE.match(line.strip())
    if not m:
        return ""
    name = m.group(2).strip()
    if name.startswith('"') and name.endswith('"'):
        name = name[1:-1]
    return name


def _folder_display(name: str) -> str:
    """Human-friendly folder label (strip [Gmail]/ and hierarchy prefixes)."""
    disp = name
    if "/" in disp:
        disp = disp.split("/")[-1]
    if "." in disp and disp.upper() != "INBOX":
        disp = disp.split(".")[-1]
    return disp or name


def _quote(name: str) -> str:
    """Quote a mailbox name for IMAP commands if it contains spaces/specials."""
    if any(c in name for c in ' []()"'):
        return '"' + name.replace('"', '\\"') + '"'
    return name


def _status_num(status_str: str, key: str) -> int:
    m = re.search(rf"{key}\s+(\d+)", status_str)
    return int(m.group(1)) if m else 0


def _select_count(conn) -> int:
    try:
        typ, data = conn.select("INBOX", readonly=True)
        if typ == "OK" and data and data[0]:
            return int(data[0])
    except Exception:
        pass
    return 0


def _attachment_parts(msg) -> list:
    """Return the list of MIME parts considered attachments, in order."""
    parts = []
    if not msg.is_multipart():
        return parts
    for part in msg.walk():
        if part.is_multipart():
            continue
        disp = (part.get("Content-Disposition") or "").lower()
        filename = part.get_filename()
        if "attachment" in disp or filename:
            parts.append(part)
    return parts


def _extract_body(msg) -> Tuple[str, List[Attachment]]:
    """Return (plain_text, [Attachment]) from a parsed email message."""
    attachments: List[Attachment] = []
    plain = None
    html = None

    def _decode_part(part) -> str:
        payload = part.get_payload(decode=True)
        if payload is None:
            return ""
        charset = part.get_content_charset() or "utf-8"
        try:
            return payload.decode(charset, "replace")
        except (LookupError, Exception):
            return payload.decode("utf-8", "replace")

    if msg.is_multipart():
        idx = 0
        for part in msg.walk():
            if part.is_multipart():
                continue
            ctype = part.get_content_type()
            disp = (part.get("Content-Disposition") or "").lower()
            filename = part.get_filename()
            if "attachment" in disp or filename:
                payload = part.get_payload(decode=True) or b""
                attachments.append(Attachment(
                    idx=idx,
                    filename=_decode_mime(filename) or f"part{idx}",
                    mime=ctype,
                    size=len(payload),
                ))
                idx += 1
                continue
            if ctype == "text/plain" and plain is None:
                plain = _decode_part(part)
            elif ctype == "text/html" and html is None:
                html = _decode_part(part)
    else:
        ctype = msg.get_content_type()
        if ctype == "text/html":
            html = _decode_part(msg)
        else:
            plain = _decode_part(msg)

    if plain is not None and plain.strip():
        text = plain
    elif html is not None:
        text = _html_to_text(html)
    else:
        text = plain or ""
    return text, attachments


# Module-level shared worker (lazy init)
_worker: Optional[_MailWorker] = None
_worker_lock = threading.Lock()


def _get_worker() -> _MailWorker:
    global _worker
    if _worker is None:
        with _worker_lock:
            if _worker is None:
                _worker = _MailWorker()
    return _worker


# =====================================================================
#  MailClientConsole — main console class
# =====================================================================


class MailClientConsole(ServerConsole):
    """Console 8 — PETSCII IMAP/SMTP mail client."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.worker = _get_worker()

        self.mode: int = MODE_LIST
        self.prev_mode: int = MODE_LIST
        self.status_msg: str = ""

        # Connection / config state
        self.connect_state: str = ""  # "" / need_config / error msg

        # Folder state
        self.folders: List[FolderEntry] = []
        self.folder_sel: int = 0
        self.folder_scroll: int = 0
        self.current_folder: str = "INBOX"
        self.folder_unread: int = 0
        self.folder_total: int = 0

        # Message list state
        self.headers: List[MailHeader] = []
        self.list_sel: int = 0
        self.list_scroll: int = 0
        self.list_offset: int = 0  # windowed-fetch offset
        self.searching: bool = False
        self.search_active: bool = False  # search prompt shown
        self.search_query: str = ""

        # Message view state
        self.body: Optional[MailBody] = None
        self.view_scroll: int = 0
        self.attach_overlay: bool = False
        self.attach_sel: int = 0
        self.links: List[MailLink] = []
        self.active_link_idx: int = -1
        self._switched_console: bool = False

        # Compose state
        self.compose_fields = {FIELD_TO: "", FIELD_CC: "", FIELD_SUB: "",
                               FIELD_BODY: ""}
        self.compose_cursor = {FIELD_TO: 0, FIELD_CC: 0, FIELD_SUB: 0,
                               FIELD_BODY: 0}
        self.compose_field: int = FIELD_TO
        self.compose_in_reply_to: str = ""
        self.compose_references: str = ""
        self.draft_saved: bool = False

        # Help scroll
        self.help_scroll: int = 0

        # Background event thread + render lock
        self._is_active: bool = False
        self._render_lock = threading.Lock()
        self._event_stop = threading.Event()
        self._event_thread = threading.Thread(
            target=self._bg_event_loop, name="mail-events", daemon=True
        )
        self._event_thread.start()

        self._try_auto_connect()
        self._full_render()

    # =================================================================
    #  CONFIG
    # =================================================================

    @staticmethod
    def _read_config() -> dict:
        from sdk.config_manager import read_config
        return read_config()

    def _mail_cfg(self) -> dict:
        cfg = self._read_config()
        return {k: cfg.get(k, "") for k in (
            "MAIL_IMAP_HOST", "MAIL_IMAP_PORT", "MAIL_SMTP_HOST",
            "MAIL_SMTP_PORT", "MAIL_USER", "MAIL_PASS", "MAIL_FROM_NAME",
            "MAIL_TLS")}

    def _get_tz_offset_minutes(self) -> int:
        cfg = self._read_config()
        tz_name = cfg.get("TIMEZONE", "UTC").strip()
        try:
            import zoneinfo
            zi = zoneinfo.ZoneInfo(tz_name)
            now = datetime.now(timezone.utc)
            offset = zi.utcoffset(now)
            return int(offset.total_seconds() // 60) if offset is not None else 0
        except Exception:
            return 0

    # =================================================================
    #  AUTO-CONNECT
    # =================================================================

    def _try_auto_connect(self):
        cfg = self._mail_cfg()
        if not (cfg.get("MAIL_IMAP_HOST") and cfg.get("MAIL_USER")
                and cfg.get("MAIL_PASS")):
            self.connect_state = "need_config"
            return
        try:
            result = self.worker.call("connect", cfg=cfg)
            if result == "authorized":
                self.connect_state = ""
                self._open_folder("INBOX")
            elif result == "need_config":
                self.connect_state = "need_config"
            else:
                self.connect_state = result.replace("error:", "")[:38]
        except Exception as e:
            self.connect_state = str(e)[:38]

    # =================================================================
    #  LIFECYCLE
    # =================================================================

    def on_activate(self):
        self._is_active = True
        self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
        with self._render_lock:
            if not self.worker.connected and self.connect_state != "need_config":
                self._try_auto_connect()
            elif self.worker.connected and self.mode == MODE_LIST \
                    and not self.searching:
                self._refresh_list()
            self._full_render()
            self._push_screen()

    def on_deactivate(self):
        self._is_active = False

    def get_badge(self) -> Optional[str]:
        total = self.folder_unread
        if total <= 0:
            return None
        return "99+" if total > 99 else str(total)

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        with self._render_lock:
            handlers = {
                MODE_LIST: self._key_list,
                MODE_VIEW: self._key_view,
                MODE_COMPOSE: self._key_compose,
                MODE_FOLDERS: self._key_folders,
                MODE_HELP: self._key_help,
            }
            handler = handlers.get(self.mode, self._key_list)
            self._switched_console = False
            handler(petscii_code, modifiers)
            # A link handoff (GH #27) already painted the browser console's
            # screen onto the C64; repainting our own buffer here would race
            # it and win, stomping the switch. Skip our own push that turn.
            if not self._switched_console:
                self._full_render()
                self._push_screen()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    # =================================================================
    #  DATA WRAPPERS
    # =================================================================

    def _open_folder(self, name: str):
        self.current_folder = name
        self.searching = False
        self.search_active = False
        self.search_query = ""
        self.list_sel = 0
        self.list_scroll = 0
        self.list_offset = 0
        self._refresh_list()

    def _refresh_list(self):
        if not self.worker.connected:
            return
        try:
            tz = self._get_tz_offset_minutes()
            headers, total = self.worker.call(
                "fetch_headers", folder=self.current_folder,
                offset=0, limit=PAGE_SIZE, tz_offset_minutes=tz)
            self.headers = headers
            self.folder_total = total
            self.list_offset = len(headers)
            self.folder_unread = sum(0 if h.seen else 1 for h in self.headers)
            unread, ftotal = self.worker.call(
                "select_folder", name=self.current_folder)
            self.folder_unread = unread
            self.folder_total = ftotal
            if self.list_sel >= len(self.headers):
                self.list_sel = max(0, len(self.headers) - 1)
        except Exception as e:
            logger.error("refresh_list: %s", e)
            self.status_msg = str(e)[:38]

    def _load_more(self):
        if self.searching or self.list_offset >= self.folder_total:
            return
        try:
            tz = self._get_tz_offset_minutes()
            more, total = self.worker.call(
                "fetch_headers", folder=self.current_folder,
                offset=self.list_offset, limit=PAGE_SIZE, tz_offset_minutes=tz)
            self.headers.extend(more)
            self.list_offset += len(more)
            self.folder_total = total
        except Exception as e:
            logger.error("load_more: %s", e)

    def _refresh_folders(self):
        try:
            self.folders = self.worker.call("list_folders")
        except Exception as e:
            logger.error("refresh_folders: %s", e)

    def _open_message(self, uid: str):
        try:
            tz = self._get_tz_offset_minutes()
            body = self.worker.call("fetch_body", folder=self.current_folder,
                                    uid=uid, tz_offset_minutes=tz)
            if body is None:
                self.status_msg = "Could not open message"
                return
            self.body = body
            self.view_scroll = 0
            self.attach_overlay = False
            self.attach_sel = 0
            self.links = _extract_links(body.text_lines)
            self.active_link_idx = -1
            self.mode = MODE_VIEW
            # Reflect the now-seen state locally.
            for h in self.headers:
                if h.uid == uid:
                    h.seen = True
        except Exception as e:
            logger.error("open_message: %s", e)
            self.status_msg = str(e)[:38]

    # =================================================================
    #  MESSAGE LIST KEYS
    # =================================================================

    def _key_list(self, key: int, mod: int):
        if self.search_active:
            self._key_search_prompt(key, mod)
            return

        if key == KEY_CRSR_UP:
            if self.list_sel > 0:
                self.list_sel -= 1
                if self.list_sel < self.list_scroll:
                    self.list_scroll = self.list_sel
        elif key == KEY_CRSR_DN:
            if self.list_sel < len(self.headers) - 1:
                self.list_sel += 1
                if self.list_sel >= self.list_scroll + self._list_rows():
                    self.list_scroll = self.list_sel - self._list_rows() + 1
                # Auto load-more near the end.
                if self.list_sel >= len(self.headers) - 2:
                    self._load_more()
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            # C=+> — page down.
            rows = self._list_rows()
            self.list_sel = min(len(self.headers) - 1, self.list_sel + rows)
            if self.list_sel >= len(self.headers) - 2:
                self._load_more()
                self.list_sel = min(len(self.headers) - 1, self.list_sel)
            self.list_scroll = max(0, self.list_sel - rows + 1)
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            # C=+< — page up.
            rows = self._list_rows()
            self.list_sel = max(0, self.list_sel - rows)
            self.list_scroll = max(0, min(self.list_scroll, self.list_sel))
        elif key == KEY_RETURN:
            if self.headers:
                self._open_message(self.headers[self.list_sel].uid)
        elif key in (KEY_HOME, KEY_F5):
            self.status_msg = "Refreshing..."
            self._full_render()
            self._push_screen()
            self.status_msg = ""
            if self.searching:
                self._open_folder(self.current_folder)
            else:
                self._refresh_list()
        elif key == KEY_F2:
            self.prev_mode = MODE_LIST
            self._refresh_folders()
            self.folder_sel = 0
            self.folder_scroll = 0
            self.mode = MODE_FOLDERS
        elif key == KEY_F8:
            self.prev_mode = MODE_LIST
            self.help_scroll = 0
            self.mode = MODE_HELP
        else:
            # Letter/symbol commands: translate PETSCII → ASCII first so shift
            # state and the C64 character set don't matter.
            ch = (self._printable(key) or "").lower()
            if ch == "/":
                self.search_active = True
                self.search_query = ""
            elif ch in ("n", "c"):
                self._start_compose_new()
            elif ch == "d":
                self._delete_current()
            elif ch == "u":
                self._toggle_flag_current("\\Seen")
            elif ch == "s":
                self._toggle_flag_current("\\Flagged")
            elif ch == "#":
                self._archive_current()

    def _key_search_prompt(self, key: int, mod: int):
        if key == KEY_RETURN:
            full_text = bool(mod & MOD_COMMODORE)
            self._run_search(self.search_query, full_text)
        elif key == KEY_RUNSTOP:
            self.search_active = False
            self.search_query = ""
        elif key == KEY_DEL:
            self.search_query = self.search_query[:-1]
        else:
            ch = self._printable(key)
            if ch and len(self.search_query) < 38:
                self.search_query += ch

    def _run_search(self, query: str, full_text: bool):
        query = query.strip()
        self.search_active = False
        if not query:
            return
        try:
            tz = self._get_tz_offset_minutes()
            headers, total = self.worker.call(
                "search", folder=self.current_folder, query=query,
                full_text=full_text, tz_offset_minutes=tz)
            self.headers = headers
            self.searching = True
            self.list_sel = 0
            self.list_scroll = 0
            self.status_msg = f"{len(headers)} result(s)"
        except Exception as e:
            logger.error("search: %s", e)
            self.status_msg = str(e)[:38]

    def _delete_current(self):
        if not self.headers:
            return
        h = self.headers[self.list_sel]
        dest = "Trash"
        if self.current_folder in ("Trash", self.worker._special.get("Trash", "")):
            # Hard expunge inside Trash.
            result = self.worker.call("set_flag", folder=self.current_folder,
                                      uid=h.uid, flag="\\Deleted", on=True)
            self.worker.call("expunge", folder=self.current_folder)
        else:
            result = self.worker.call("move", folder=self.current_folder,
                                      uid=h.uid, dest=dest)
        if isinstance(result, str) and result.startswith("error:"):
            self.status_msg = result.replace("error:", "")[:38]
            return
        del self.headers[self.list_sel]
        if self.list_sel >= len(self.headers):
            self.list_sel = max(0, len(self.headers) - 1)
        self.status_msg = "Deleted"

    def _archive_current(self):
        if not self.headers:
            return
        h = self.headers[self.list_sel]
        result = self.worker.call("move", folder=self.current_folder,
                                  uid=h.uid, dest="Archive")
        if isinstance(result, str) and result.startswith("error:"):
            self.status_msg = result.replace("error:", "")[:38]
            return
        del self.headers[self.list_sel]
        if self.list_sel >= len(self.headers):
            self.list_sel = max(0, len(self.headers) - 1)
        self.status_msg = "Archived"

    def _toggle_flag_current(self, flag: str):
        if not self.headers:
            return
        h = self.headers[self.list_sel]
        if flag == "\\Seen":
            new_seen = not h.seen  # 'U' toggles read/unread
            self.worker.call("set_flag", folder=self.current_folder, uid=h.uid,
                             flag="\\Seen", on=new_seen)
            h.seen = new_seen
        else:
            new_val = not h.flagged
            self.worker.call("set_flag", folder=self.current_folder, uid=h.uid,
                             flag="\\Flagged", on=new_val)
            h.flagged = new_val

    # =================================================================
    #  MESSAGE VIEW KEYS
    # =================================================================

    def _key_view(self, key: int, mod: int):
        if self.attach_overlay:
            self._key_attach(key, mod)
            return

        lines = self.body.text_lines if self.body else []
        rows = self._view_rows()
        max_scroll = max(0, len(lines) - rows)

        if key == KEY_CRSR_UP:
            self.view_scroll = max(0, self.view_scroll - 1)
        elif key == KEY_CRSR_DN:
            self.view_scroll = min(max_scroll, self.view_scroll + 1)
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.view_scroll = min(max_scroll, self.view_scroll + rows)
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.view_scroll = max(0, self.view_scroll - rows)
        elif key == KEY_F3:
            self._start_reply(reply_all=False)
        elif key == KEY_F4:
            self._start_reply(reply_all=True)
        elif key == KEY_F7:
            self._start_forward()
        elif key in (KEY_RUNSTOP, KEY_LEFT_ARROW):
            self._back_to_list()
        elif key == KEY_F8:
            self.prev_mode = MODE_VIEW
            self.help_scroll = 0
            self.mode = MODE_HELP
        elif key == KEY_SPACE:
            self._cycle_link()
        elif key == KEY_RETURN:
            self._open_active_link()
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "n":
                self._view_step(1)
            elif ch == "p":
                self._view_step(-1)
            elif ch == "d":
                self._delete_current()
                self._back_to_list()
            elif ch == "a":
                if self.body and self.body.attachments:
                    self.attach_overlay = True
                    self.attach_sel = 0
                else:
                    self.status_msg = "No attachments"

    def _back_to_list(self):
        self.mode = MODE_LIST
        self.body = None
        self.attach_overlay = False
        self.links = []
        self.active_link_idx = -1

    def _view_step(self, delta: int):
        if not self.headers:
            return
        new_sel = self.list_sel + delta
        if 0 <= new_sel < len(self.headers):
            self.list_sel = new_sel
            if self.list_sel >= self.list_scroll + self._list_rows():
                self.list_scroll = self.list_sel - self._list_rows() + 1
            elif self.list_sel < self.list_scroll:
                self.list_scroll = self.list_sel
            self._open_message(self.headers[self.list_sel].uid)

    # =================================================================
    #  LINKS (GH #27 — click links in an email, same UX as the browser)
    # =================================================================

    def _cycle_link(self):
        """Highlight the next link visible in the current scroll window."""
        if not self.links:
            self.status_msg = "No links in this message"
            return
        rows = self._view_rows()
        vis_start = self.view_scroll
        vis_end = self.view_scroll + rows - 1
        visible = [i for i, lk in enumerate(self.links)
                  if vis_start <= lk.line <= vis_end]
        if not visible:
            self.active_link_idx = -1
            self.status_msg = "No links on screen"
            return
        if self.active_link_idx not in visible:
            self.active_link_idx = visible[0]
        else:
            vi = visible.index(self.active_link_idx)
            self.active_link_idx = visible[(vi + 1) % len(visible)]

    def _open_active_link(self):
        if not (0 <= self.active_link_idx < len(self.links)):
            return
        self._open_url_in_browser(self.links[self.active_link_idx].url)

    def _open_url_in_browser(self, url: str):
        """Hand *url* off to the Web Browser console and switch to it.

        Mirrors ``LauncherConsole._open_app``: resolve the slot the browser
        currently lives on (it may have been re-pinned), navigate it, then
        DMA-switch the C64's active console and push the rendered page.
        """
        try:
            from sdk.app_registry import AppRegistry
            from sdk.launcher_config import LauncherConfig
            from sdk.console_manager import ConsoleManager

            registry = AppRegistry.instance()
            info = registry.get("web_browser")
            if info is None:
                self.status_msg = "Browser app unavailable"
                return
            config = LauncherConfig.load(registry.default_pins())
            slot = config.slot_for_app("web_browser") or info.default_slot

            mgr = ConsoleManager.instance()
            try:
                mgr.register_factory(slot, info.factory)
            except Exception:
                logger.exception("open_link: register_factory failed slot=%s", slot)

            browser = mgr.get_console(slot, self.session_id)
            browser._navigate(url)  # blocks; pushes its own loading/result screens

            screen = mgr.get_screen_data(slot, self.session_id)
            color = mgr.get_color_data(slot, self.session_id)
            self._route_and_paint(slot, screen, color)
            self._switched_console = True
        except Exception as e:
            logger.error("open_link failed: %s", e)
            self.status_msg = "Could not open link"

    def _route_and_paint(self, slot: int, screen: bytes, color: bytes):
        """DMA-write w_console=$03EF and paint the target console (HW only)."""
        try:
            from sdk import network_helper as nh

            host = nh.read_last_c64_ip()
            if host:
                # w_console lives at $03EF; console nibble = slot << 4.
                nh.send_dmawrite(host, bytes([0xEF, 0x03, (slot << 4) & 0xFF]))
            nh.send_screen_data(screen, color)
        except Exception:
            logger.debug("open_link: route/paint failed (off hardware?)",
                         exc_info=True)

    def _key_attach(self, key: int, mod: int):
        atts = self.body.attachments if self.body else []
        if key == KEY_CRSR_UP:
            self.attach_sel = max(0, self.attach_sel - 1)
        elif key == KEY_CRSR_DN:
            self.attach_sel = min(len(atts) - 1, self.attach_sel + 1)
        elif key == KEY_RETURN:
            self._save_attachment()
        elif key in (KEY_RUNSTOP, KEY_LEFT_ARROW):
            self.attach_overlay = False

    def _save_attachment(self):
        if not self.body or not self.body.attachments:
            return
        att = self.body.attachments[self.attach_sel]
        from sdk.workspace import WORKSPACE_DIR
        safe = os.path.basename(att.filename) or f"attachment_{att.idx}"
        dest = os.path.join(WORKSPACE_DIR, safe)
        result = self.worker.call("save_attachment", folder=self.current_folder,
                                  uid=self.body.uid, part_idx=att.idx,
                                  dest_path=dest)
        if isinstance(result, str) and result == "ok":
            self.status_msg = f"Saved {safe[:28]}"
            self.attach_overlay = False
        else:
            self.status_msg = str(result).replace("error:", "")[:38]

    # =================================================================
    #  COMPOSE
    # =================================================================

    def _start_compose_new(self):
        self.compose_fields = {FIELD_TO: "", FIELD_CC: "", FIELD_SUB: "",
                               FIELD_BODY: ""}
        self.compose_cursor = {FIELD_TO: 0, FIELD_CC: 0, FIELD_SUB: 0,
                               FIELD_BODY: 0}
        self.compose_field = FIELD_TO
        self.compose_in_reply_to = ""
        self.compose_references = ""
        self.draft_saved = False
        self.mode = MODE_COMPOSE

    def _start_reply(self, reply_all: bool):
        if not self.body:
            return
        hdr = self.body.headers
        to = hdr.get("reply_to") or _parse_address(hdr.get("from"))[1]
        cc = ""
        if reply_all:
            my = (self._read_config().get("MAIL_USER") or "").lower()
            extra = []
            for raw in (hdr.get("to", ""), hdr.get("cc", "")):
                for a in re.split(r"[,;]", raw):
                    _n, addr = _parse_address(a)
                    if addr and addr.lower() != my and addr.lower() != (to or "").lower():
                        extra.append(addr)
            cc = ", ".join(dict.fromkeys(extra))
        subject = hdr.get("subject", "")
        if not subject.lower().startswith("re:"):
            subject = "Re: " + subject
        quoted = self._build_quote(hdr, self.body.text_lines)
        self.compose_fields = {FIELD_TO: to, FIELD_CC: cc, FIELD_SUB: subject,
                               FIELD_BODY: "\n" + quoted}
        self.compose_cursor = {FIELD_TO: len(to), FIELD_CC: len(cc),
                               FIELD_SUB: len(subject), FIELD_BODY: 0}
        self.compose_field = FIELD_BODY
        self.compose_in_reply_to = hdr.get("message_id", "")
        self.compose_references = hdr.get("references", "")
        self.draft_saved = False
        self.mode = MODE_COMPOSE

    def _start_forward(self):
        if not self.body:
            return
        hdr = self.body.headers
        subject = hdr.get("subject", "")
        if not subject.lower().startswith("fwd:"):
            subject = "Fwd: " + subject
        lines = ["---------- Forwarded message ----------",
                 f"From: {hdr.get('from','')}",
                 f"Date: {hdr.get('date','')}",
                 f"Subject: {hdr.get('subject','')}",
                 f"To: {hdr.get('to','')}", ""]
        body = "\n".join(lines) + "\n".join(t for t, _c in self.body.text_lines)
        self.compose_fields = {FIELD_TO: "", FIELD_CC: "", FIELD_SUB: subject,
                               FIELD_BODY: body}
        self.compose_cursor = {FIELD_TO: 0, FIELD_CC: 0,
                               FIELD_SUB: len(subject), FIELD_BODY: 0}
        self.compose_field = FIELD_TO
        self.compose_in_reply_to = ""
        self.compose_references = ""
        self.draft_saved = False
        self.mode = MODE_COMPOSE

    @staticmethod
    def _build_quote(hdr: dict, text_lines) -> str:
        attrib = f"On {hdr.get('date','')}, {hdr.get('from','')} wrote:"
        out = [attrib]
        for t, _c in text_lines:
            out.append("> " + t)
        return "\n".join(out)

    def _key_compose(self, key: int, mod: int):
        cbm = bool(mod & MOD_COMMODORE)
        fld = self.compose_field

        if key == KEY_TAB:
            if cbm:
                self.compose_field = (self.compose_field - 1) % 4
            else:
                self.compose_field = (self.compose_field + 1) % 4
        elif key == KEY_F7:
            self._send_compose()
        elif key == KEY_RUNSTOP:
            self.draft_saved = True
            self.status_msg = "Draft saved"
            self.mode = self.prev_mode if self.prev_mode != MODE_COMPOSE else MODE_LIST
        elif key == KEY_F8:
            self.prev_mode = MODE_COMPOSE
            self.help_scroll = 0
            self.mode = MODE_HELP
        elif key == KEY_RETURN:
            if fld == FIELD_BODY:
                self._compose_insert("\n")
            else:
                self.compose_field = (self.compose_field + 1) % 4
        elif key == KEY_DEL:
            cur = self.compose_cursor[fld]
            if cur > 0:
                txt = self.compose_fields[fld]
                self.compose_fields[fld] = txt[:cur - 1] + txt[cur:]
                self.compose_cursor[fld] = cur - 1
        elif key == KEY_CRSR_LT:
            if cbm:
                self.compose_cursor[fld] = _word_left(
                    self.compose_fields[fld], self.compose_cursor[fld])
            elif self.compose_cursor[fld] > 0:
                self.compose_cursor[fld] -= 1
        elif key == KEY_CRSR_RT:
            if cbm:
                self.compose_cursor[fld] = _word_right(
                    self.compose_fields[fld], self.compose_cursor[fld])
            elif self.compose_cursor[fld] < len(self.compose_fields[fld]):
                self.compose_cursor[fld] += 1
        else:
            ch = self._printable(key)
            if ch:
                self._compose_insert(ch)

    def _compose_insert(self, ch: str):
        fld = self.compose_field
        limit = 4000 if fld == FIELD_BODY else MAX_INPUT_LEN
        txt = self.compose_fields[fld]
        cur = self.compose_cursor[fld]
        if len(txt) >= limit:
            return
        self.compose_fields[fld] = txt[:cur] + ch + txt[cur:]
        self.compose_cursor[fld] = cur + len(ch)

    def _send_compose(self):
        to = self.compose_fields[FIELD_TO].strip()
        if not to:
            self.status_msg = "Recipient (To) required"
            return
        self.status_msg = "Sending..."
        self._full_render()
        self._push_screen()
        try:
            result = self.worker.call(
                "smtp_send", to=to, cc=self.compose_fields[FIELD_CC].strip(),
                subject=self.compose_fields[FIELD_SUB],
                body=self.compose_fields[FIELD_BODY],
                in_reply_to=self.compose_in_reply_to,
                references=self.compose_references)
            if result == "ok":
                if self.compose_in_reply_to:
                    # Mark original answered locally.
                    for h in self.headers:
                        if self.body and h.uid == self.body.uid:
                            h.answered = True
                self.status_msg = "Sent"
                self.mode = MODE_LIST
            else:
                self.status_msg = str(result).replace("error:", "")[:38]
        except Exception as e:
            self.status_msg = str(e)[:38]

    # =================================================================
    #  FOLDERS OVERLAY
    # =================================================================

    def _key_folders(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.folder_sel > 0:
                self.folder_sel -= 1
                if self.folder_sel < self.folder_scroll:
                    self.folder_scroll = self.folder_sel
        elif key == KEY_CRSR_DN:
            if self.folder_sel < len(self.folders) - 1:
                self.folder_sel += 1
                if self.folder_sel >= self.folder_scroll + self._list_rows():
                    self.folder_scroll = self.folder_sel - self._list_rows() + 1
        elif key == KEY_RETURN:
            if self.folders:
                self.mode = MODE_LIST
                self._open_folder(self.folders[self.folder_sel].name)
        elif key in (KEY_RUNSTOP, KEY_LEFT_ARROW):
            self.mode = MODE_LIST
        elif key == KEY_F8:
            self.prev_mode = MODE_FOLDERS
            self.help_scroll = 0
            self.mode = MODE_HELP

    # =================================================================
    #  HELP
    # =================================================================

    def _key_help(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            self.help_scroll = max(0, self.help_scroll - 1)
        elif key == KEY_CRSR_DN:
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            self.help_scroll = min(max_scroll, self.help_scroll + 1)
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
            self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.help_scroll = max(0, self.help_scroll - CONTENT_ROWS)
        elif key in (KEY_F8, KEY_RUNSTOP):
            self.mode = self.prev_mode if self.prev_mode != MODE_HELP else MODE_LIST

    # =================================================================
    #  BACKGROUND EVENTS (IDLE push → toast)
    # =================================================================

    def _bg_event_loop(self):
        while not self._event_stop.wait(timeout=1.0):
            try:
                updates = self.worker.get_pending_updates()
                if not updates:
                    continue
                for upd in updates:
                    self._process_event(upd)
            except Exception as e:
                logger.debug("mail bg_event_loop error: %s", e)

    def _process_event(self, event: dict):
        if not event or event.get("type") != "new_mail":
            return
        with self._render_lock:
            from sdk.console_manager import ConsoleManager
            mgr = ConsoleManager.instance()
            is_active = mgr._active.get(self.session_id) == self.console_id

            sender = event.get("from") or "Mail"
            subject = event.get("subject") or ""
            label = sender[:18]
            avail = SCREEN_COLS - len(label) - 2
            toast = f"{label} - {subject[:avail]}" if avail > 0 else label
            try:
                mgr.show_session_toast(self.session_id, toast[:SCREEN_COLS],
                                       duration_sec=4.0, color=COL_YELLOW)
            except Exception:
                logger.debug("mail toast failed", exc_info=True)

            # Refresh the list if we're actively viewing INBOX.
            if is_active and self.mode == MODE_LIST and not self.searching \
                    and self.current_folder.upper() == "INBOX":
                try:
                    self._refresh_list()
                except Exception:
                    pass
            self._full_render()
            if is_active:
                try:
                    self._push_screen()
                except Exception:
                    logger.debug("mail event push failed", exc_info=True)

    # =================================================================
    #  RENDERING
    # =================================================================

    def _list_rows(self) -> int:
        # rows 2..23 for the list (row 0 title, row 1 separator, row 24 status)
        return STATUS_ROW - 2

    def _view_rows(self) -> int:
        # rows: 0 title, 1-4 headers, 5 sep, ... 23 body, 24 status
        return STATUS_ROW - 6

    def _full_render(self):
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = COL_TEXT_FG
        if self.mode == MODE_LIST:
            self._render_list()
        elif self.mode == MODE_VIEW:
            self._render_view()
        elif self.mode == MODE_COMPOSE:
            self._render_compose()
        elif self.mode == MODE_FOLDERS:
            self._render_folders()
        elif self.mode == MODE_HELP:
            self._render_help()

    # ── List ─────────────────────────────────────────────────────────

    def _render_list(self):
        if self.searching:
            title = f"SEARCH: {self.search_query[:20]}"
        else:
            disp = _folder_display(self.current_folder).upper()[:16]
            title = f"{disp}  ({self.folder_unread} unread)"
        user = (self._read_config().get("MAIL_USER") or "")
        self._render_title_bar(title, right=user[:16])

        # Separator row 1.
        self._hline(1)

        if not self.worker.connected:
            if self.connect_state == "need_config":
                self._put(3, 1, "No mail account configured.", COL_ERROR_FG)
                self._put(5, 1, "Configure IMAP/SMTP in the HDN", COL_HELP_FG)
                self._put(6, 1, "web UI Settings page (Email card).", COL_HELP_FG)
                self._put(8, 1, "Then press HOME to connect.", COL_HELP_FG)
            else:
                self._put(3, 1, "Not connected:", COL_ERROR_FG)
                self._put(4, 1, self.connect_state[:38], COL_ERROR_FG)
                self._put(6, 1, "HOME to retry.  F8 for help.", COL_HELP_FG)
            self._render_status_bar(" F8=HELP  configure in web UI")
            return

        if self.search_active:
            self._render_status_bar(" Type query  RET=find  C=+RET=all text")
        elif self.searching:
            self._render_status_bar(" HOME=Back  RET=Open  F8=HELP")
        else:
            self._render_status_bar(
                " N:New F2:Fldr /Find F5:Refr  F8=HELP")

        if not self.headers:
            self._put(3, 1, "No messages.", COL_LABEL_FG)
            return

        rows = self._list_rows()
        for vi in range(rows):
            idx = self.list_scroll + vi
            if idx >= len(self.headers):
                break
            h = self.headers[idx]
            row = 2 + vi
            self._render_list_row(row, h, idx == self.list_sel)

    def _render_list_row(self, row: int, h: MailHeader, selected: bool):
        # flags(2) sender(14) subject(..) date(6)
        marker = " "
        if not h.seen:
            marker = "*"
        elif h.flagged:
            marker = "!"
        elif h.answered:
            marker = "R"
        elif h.has_attach:
            marker = "A"
        sender = (h.from_name or h.from_addr or "?")[:13]
        date = (h.date_str or "")[:6]
        subj_width = SCREEN_COLS - 2 - 14 - 1 - len(date) - 1
        subject = h.subject[:max(0, subj_width)]

        if selected:
            for c in range(SCREEN_COLS):
                self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
            self._put(row, 0, f"{marker} ", COL_SELECTED_FG, reverse=True)
            self._put(row, 2, sender.ljust(14)[:14], COL_SELECTED_FG, reverse=True)
            self._put(row, 17, subject, COL_SELECTED_FG, reverse=True)
            if date:
                self._put(row, SCREEN_COLS - len(date), date, COL_SELECTED_FG,
                          reverse=True)
            return

        marker_col = COL_UNREAD_FG if marker == "*" else (
            COL_FLAG_FG if marker == "!" else (
                COL_ATTACH_FG if marker == "A" else COL_SENDER_FG))
        self._put(row, 0, marker, marker_col)
        self._put(row, 2, sender.ljust(14)[:14], COL_SENDER_FG)
        subj_col = COL_UNREAD_FG if not h.seen else COL_READ_FG
        self._put(row, 17, subject, subj_col)
        if date:
            self._put(row, SCREEN_COLS - len(date), date, COL_GREY)

    # ── View ─────────────────────────────────────────────────────────

    def _render_view(self):
        hdr = self.body.headers if self.body else {}
        pos = self.list_sel + 1
        total = len(self.headers)
        subject = hdr.get("subject", "")[:26]
        self._render_title_bar(subject, right=f"{pos}/{total}")

        from_line = "From: " + _parse_address(hdr.get("from"))[0]
        self._put(1, 0, from_line[:SCREEN_COLS], COL_SENDER_FG)
        self._put(2, 0, ("To:   " + hdr.get("to", ""))[:SCREEN_COLS], COL_LABEL_FG)
        date_line = "Date: " + hdr.get("date", "")
        self._put(3, 0, date_line[:32], COL_LABEL_FG)
        if self.body and self.body.attachments:
            tag = f"[A] {len(self.body.attachments)} att"
            self._put(3, SCREEN_COLS - len(tag), tag, COL_ATTACH_FG)
        self._hline(4)

        lines = self.body.text_lines if self.body else []
        rows = self._view_rows()
        active_link = (self.links[self.active_link_idx]
                      if 0 <= self.active_link_idx < len(self.links) else None)
        for vi in range(rows):
            li = self.view_scroll + vi
            if li >= len(lines):
                break
            text, colour = lines[li]
            self._put(5 + vi, 0, text[:SCREEN_COLS], colour)
            if active_link is not None and active_link.line == li:
                self._highlight_link(5 + vi, active_link)

        if active_link is not None:
            status = " RETURN=Open link  SPACE=Next  F8=HELP"
        elif self.links:
            status = " SPACE=Links F3Reply F7Fwd D-Del F8=HELP"
        else:
            status = " F3Reply F4All F7Fwd D-Del A-Att F8=HELP"
        self._render_status_bar(status)

        if self.attach_overlay:
            self._render_attach_overlay()

    def _render_attach_overlay(self):
        atts = self.body.attachments if self.body else []
        top = 6
        height = min(len(atts) + 2, 12)
        for r in range(top, top + height):
            for c in range(2, SCREEN_COLS - 2):
                self.screen[r * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                self.color[r * SCREEN_COLS + c] = COL_LABEL_FG
        self._put(top, 3, "ATTACHMENTS - RET=save STOP=close",
                  COL_WHITE, reverse=True)
        for i, att in enumerate(atts[:height - 2]):
            row = top + 1 + i
            sel = i == self.attach_sel
            size_kb = max(1, att.size // 1024)
            label = f"{att.filename[:24]} {size_kb}K"
            col = COL_SELECTED_FG if sel else COL_ATTACH_FG
            self._put(row, 3, ("> " if sel else "  ") + label,
                      col, reverse=True)

    # ── Compose ──────────────────────────────────────────────────────

    def _render_compose(self):
        right = "Draft saved" if self.draft_saved else ""
        self._render_title_bar("COMPOSE", right=right)
        labels = {FIELD_TO: "To:  ", FIELD_CC: "Cc:  ", FIELD_SUB: "Sub: "}
        cursor_rc = None
        for fld in (FIELD_TO, FIELD_CC, FIELD_SUB):
            row = 1 + fld
            self._put(row, 0, labels[fld], COL_LABEL_FG)
            val = self.compose_fields[fld]
            width = SCREEN_COLS - 5
            cur = self.compose_cursor[fld]
            vis_start = max(0, cur - width) if cur > width else 0
            visible = val[vis_start:vis_start + width]
            self._put(row, 5, visible, COL_FIELD_FG)
            if fld == self.compose_field:
                cursor_rc = (row, 5 + (cur - vis_start))
        self._hline(4)

        # Body area rows 5..23.
        body = self.compose_fields[FIELD_BODY]
        wrapped, cursor_line, cursor_col = _wrap_with_cursor(
            body, SCREEN_COLS, self.compose_cursor[FIELD_BODY])
        body_rows = STATUS_ROW - 5
        # Scroll body so cursor visible when body field active.
        start = 0
        if self.compose_field == FIELD_BODY and cursor_line >= body_rows:
            start = cursor_line - body_rows + 1
        for vi in range(body_rows):
            li = start + vi
            if li >= len(wrapped):
                break
            self._put(5 + vi, 0, wrapped[li][:SCREEN_COLS], COL_TEXT_FG)
        if self.compose_field == FIELD_BODY:
            vis_line = cursor_line - start
            if 0 <= vis_line < body_rows:
                cursor_rc = (5 + vis_line, cursor_col)

        self._render_status_bar(" TAB=Field F7=Send STOP=Draft F8=HELP")

        if cursor_rc:
            r, c = cursor_rc
            if 0 <= r < SCREEN_ROWS and 0 <= c < SCREEN_COLS:
                p = r * SCREEN_COLS + c
                self.screen[p] = SC_SPACE | SC_REVERSE_BIT
                self.color[p] = COL_INPUT_FG

    # ── Folders overlay ──────────────────────────────────────────────

    def _render_folders(self):
        self._render_title_bar("FOLDERS")
        self._hline(1)
        if not self.folders:
            self._put(3, 1, "No folders.", COL_LABEL_FG)
        rows = self._list_rows()
        for vi in range(rows):
            idx = self.folder_scroll + vi
            if idx >= len(self.folders):
                break
            f = self.folders[idx]
            row = 2 + vi
            badge = f"({f.unread})" if f.unread else ""
            label = f.display[:26]
            if idx == self.folder_sel:
                for c in range(SCREEN_COLS):
                    self.screen[row * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
                    self.color[row * SCREEN_COLS + c] = COL_SELECTED_FG
                self._put(row, 1, label, COL_SELECTED_FG, reverse=True)
                if badge:
                    self._put(row, SCREEN_COLS - len(badge) - 1, badge,
                              COL_SELECTED_FG, reverse=True)
            else:
                self._put(row, 1, label, COL_WHITE)
                if badge:
                    self._put(row, SCREEN_COLS - len(badge) - 1, badge,
                              COL_UNREAD_FG)
        self._render_status_bar(" UP/DN=Select RET=Open STOP=Cancel")

    # ── Help ─────────────────────────────────────────────────────────

    def _render_help(self):
        self._render_title_bar("HDN MAIL HELP")
        for vi in range(CONTENT_ROWS):
            li = self.help_scroll + vi
            if li >= len(HELP_LINES):
                break
            row = CONTENT_TOP + vi
            text = HELP_LINES[li]
            if text.startswith("==="):
                self._put(row, 0, text[:SCREEN_COLS], COL_YELLOW, reverse=True)
                for c in range(len(text), SCREEN_COLS):
                    p = row * SCREEN_COLS + c
                    self.screen[p] = SC_SPACE | SC_REVERSE_BIT
                    self.color[p] = COL_YELLOW
            elif text and not text.startswith(" "):
                self._put(row, 0, text[:SCREEN_COLS], COL_CYAN)
            else:
                self._put(row, 0, text[:SCREEN_COLS], COL_HELP_FG)
        self._render_status_bar(" UP/DN or C=+</> scroll  F8=Close")

    # =================================================================
    #  RENDER PRIMITIVES
    # =================================================================

    def _render_title_bar(self, text: str, right: str = ""):
        for c in range(SCREEN_COLS):
            self.screen[TITLE_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[TITLE_ROW * SCREEN_COLS + c] = COL_TITLE_FG
        self._put(TITLE_ROW, 0, text[:SCREEN_COLS], COL_TITLE_FG, reverse=True)
        if right:
            self._put(TITLE_ROW, max(0, SCREEN_COLS - len(right)), right,
                      COL_TITLE_FG, reverse=True)

    def _render_status_bar(self, text: str):
        for c in range(SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG
        shown = self.status_msg if self.status_msg else text
        self._put(STATUS_ROW, 0, shown[:SCREEN_COLS], COL_STATUS_FG, reverse=True)

    def _hline(self, row: int):
        for c in range(SCREEN_COLS):
            self.screen[row * SCREEN_COLS + c] = SC_HLINE
            self.color[row * SCREEN_COLS + c] = COL_DARK_GREY

    def _highlight_link(self, row: int, link: "MailLink"):
        """Reverse-video the on-screen slice of *link* (clipped to 0..40)."""
        start = max(0, link.col_start)
        end = min(SCREEN_COLS, link.col_end)
        if row < 0 or row >= SCREEN_ROWS:
            return
        for c in range(start, end):
            pos = row * SCREEN_COLS + c
            self.screen[pos] |= SC_REVERSE_BIT
            self.color[pos] = COL_SELECTED_FG

    def _put(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
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
            logger.debug("mail push_screen failed", exc_info=True)

    def _send_vic_colors(self, border: int, background: int):
        try:
            from sdk.network_helper import send_vic_colors
            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.warning("Could not send VIC colours: %s", e)

    @staticmethod
    def _printable(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None


# ── Compose text helpers (module-level, testable) ───────────────────


def _word_left(text: str, pos: int) -> int:
    p = pos
    while p > 0 and text[p - 1] == " ":
        p -= 1
    while p > 0 and text[p - 1] != " ":
        p -= 1
    return p


def _word_right(text: str, pos: int) -> int:
    p, n = pos, len(text)
    while p < n and text[p] != " ":
        p += 1
    while p < n and text[p] == " ":
        p += 1
    return p


def _wrap_with_cursor(text: str, width: int, cursor: int):
    """Wrap *text* to *width* by hard columns and newlines.

    Returns ``(lines, cursor_line, cursor_col)``. A plain column wrap (rather
    than word wrap) is used so the rendered lines and the cursor position map
    to exactly the same coordinates — essential for an editable body field.
    """
    lines: List[str] = [""]
    cur_line = 0
    cur_col = 0
    for i, ch in enumerate(text):
        if i == cursor:
            cur_line = len(lines) - 1
            cur_col = len(lines[-1])
        if ch == "\n":
            lines.append("")
        else:
            if len(lines[-1]) >= width:
                lines.append("")
            lines[-1] += ch
    if cursor >= len(text):
        cur_line = len(lines) - 1
        cur_col = len(lines[-1])
    return lines, cur_line, cur_col
