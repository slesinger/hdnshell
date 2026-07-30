"""
Unit tests for the WhatsApp chat console (GH issue #20).

These exercise the console UI/mode machine deterministically by injecting a fake
worker, so they run without the (optional) ``neonize`` dependency and without a
live WhatsApp connection. One test covers the graceful "library not installed"
path using the real worker.
"""

import os
import sys

import pytest

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_APPS_DIR = os.path.join(_CLOUD_DIR, "server-apps")
for _p in (_CLOUD_DIR, _APPS_DIR):
    if _p not in sys.path:
        sys.path.insert(0, _p)

import whatsapp_chat  # noqa: E402
from whatsapp_chat import (  # noqa: E402
    WhatsAppChatConsole,
    ChatEntry,
    ContactEntry,
    MessageEntry,
    MODE_CHATS,
    MODE_CHAT_VIEW,
    MODE_CONTACTS,
    MODE_HELP,
    MODE_LOGIN,
    LOGIN_NO_LIBRARY,
    LOGIN_NEED_PHONE,
    KEY_F8,
    KEY_F3,
    KEY_F1,
    KEY_RETURN,
    KEY_RUNSTOP,
    KEY_CRSR_DN,
)
from sdk.launcher_config import PINNABLE_SLOTS  # noqa: E402
from sdk.app_registry import AppRegistry, AppInfo  # noqa: E402

KEY_A = ord("a")


# ----------------------------------------------------------------------
# Fake worker
# ----------------------------------------------------------------------


class _FakeWorker:
    """Stand-in for ``_WhatsmeowWorker`` — canned, no threads, no network."""

    def __init__(self, connected=True):
        self._connected = connected
        self.no_library = False
        self.sent = []

    @property
    def connected(self):
        return self._connected

    def get_pending_updates(self):
        return []

    def call(self, method, **kwargs):
        if method == "connect":
            return "authorized" if self._connected else "need_login"
        if method == "poll_status":
            return "authorized"
        if method == "get_dialogs":
            return [
                ChatEntry(id="111@s.whatsapp.net", name="Alice", unread_count=2),
                ChatEntry(id="222@g.us", name="Family", is_group=True),
            ]
        if method == "get_messages":
            return [
                MessageEntry(id="m1", sender_name="Alice", text="hi", is_outgoing=False),
                MessageEntry(id="m2", sender_name="", text="hello", is_outgoing=True),
            ]
        if method == "get_contacts":
            return [ContactEntry(id="333@s.whatsapp.net", name="Bob", phone="333")]
        if method == "send_message":
            self.sent.append((kwargs.get("chat_id"), kwargs.get("text")))
            return "ok"
        if method in ("mark_read", "send_typing", "cancel_typing"):
            return "ok"
        return None


@pytest.fixture(autouse=True)
def _reset_worker():
    """Reset the module-level worker singleton around every test."""
    whatsapp_chat._worker = None
    yield
    whatsapp_chat._worker = None


@pytest.fixture
def console(monkeypatch):
    fake = _FakeWorker(connected=True)
    monkeypatch.setattr(whatsapp_chat, "_get_worker", lambda: fake)
    con = WhatsAppChatConsole(console_id=9, session_id=1)
    con.worker = fake  # ensure the same fake even if bg threads re-fetch
    return con


# ----------------------------------------------------------------------
# Registration / config
# ----------------------------------------------------------------------


def test_slot_9_is_pinnable():
    assert 9 in PINNABLE_SLOTS


def test_registry_accepts_whatsapp_app():
    AppRegistry.reset()
    reg = AppRegistry.instance()
    reg.register(
        AppInfo("whatsapp", "WhatsApp", "WhatsApp chats.", 9, WhatsAppChatConsole)
    )
    info = reg.get("whatsapp")
    assert info is not None and info.default_slot == 9
    AppRegistry.reset()


# ----------------------------------------------------------------------
# Connected console behaviour (fake worker)
# ----------------------------------------------------------------------


def test_auto_connect_lands_on_chats(console):
    assert console.mode == MODE_CHATS
    assert len(console.chats) == 2


def test_f8_opens_and_closes_help(console):
    console.handle_keypress(KEY_F8, 0)
    assert console.mode == MODE_HELP
    console.handle_keypress(KEY_F8, 0)
    assert console.mode == MODE_CHATS


def test_f8_hint_visible_on_chat_list(console):
    """The main chat-list title bar must advertise F8 for help."""
    assert _row_contains(console, 0, "F8:Help")


def test_f3_opens_contacts(console):
    console.handle_keypress(KEY_F3, 0)
    assert console.mode == MODE_CONTACTS
    assert len(console.contacts) == 1


def test_open_chat_and_send_message(console):
    console.handle_keypress(KEY_RETURN, 0)  # open first chat
    assert console.mode == MODE_CHAT_VIEW
    assert console.current_chat_id == "111@s.whatsapp.net"
    console.handle_keypress(KEY_A, 0)  # type 'a'
    console.handle_keypress(KEY_RETURN, 0)  # send
    assert console.worker.sent == [("111@s.whatsapp.net", "a")]


def test_stop_returns_to_chats(console):
    console.handle_keypress(KEY_RETURN, 0)
    assert console.mode == MODE_CHAT_VIEW
    console.handle_keypress(KEY_RUNSTOP, 0)
    assert console.mode == MODE_CHATS


def test_chat_navigation(console):
    assert console.chat_sel == 0
    console.handle_keypress(KEY_CRSR_DN, 0)
    assert console.chat_sel == 1


def test_contacts_f1_back_to_chats(console):
    console.handle_keypress(KEY_F3, 0)
    console.handle_keypress(KEY_F1, 0)
    assert console.mode == MODE_CHATS


# ----------------------------------------------------------------------
# Graceful degradation (no fake worker → real worker, neonize absent)
# ----------------------------------------------------------------------


def test_missing_library_shows_hint():
    pytest.importorskip  # keep import lint quiet
    try:
        import neonize  # noqa: F401

        pytest.skip("neonize is installed; no-library path not exercised")
    except ImportError:
        pass
    con = WhatsAppChatConsole(console_id=9, session_id=2)
    assert con.mode == MODE_LOGIN
    assert con.login_state in (LOGIN_NO_LIBRARY, LOGIN_NEED_PHONE)


# ----------------------------------------------------------------------
# Worker store / parsing (no neonize needed — plain objects)
# ----------------------------------------------------------------------


class _Proto:
    """Minimal stand-in for a protobuf message with HasField semantics."""

    def __init__(self, **kw):
        self.__dict__.update(kw)

    def HasField(self, name):
        return bool(getattr(self, name, None))


def test_extract_text_plain_conversation():
    msg = _Proto(conversation="hello")
    assert whatsapp_chat._extract_message_text(msg) == "hello"


def test_extract_text_extended():
    msg = _Proto(conversation="", extendedTextMessage=_Proto(text="link caption"))
    assert whatsapp_chat._extract_message_text(msg) == "link caption"


def test_extract_text_media_placeholder():
    msg = _Proto(conversation="", imageMessage=_Proto(caption=""))
    assert whatsapp_chat._extract_message_text(msg) == "[Photo]"


def test_ingest_dedupes_by_id():
    w = whatsapp_chat._WhatsmeowWorker.__new__(whatsapp_chat._WhatsmeowWorker)
    # initialise just the store fields we touch (skip the worker thread)
    import threading as _t

    w._store_lock = _t.Lock()
    w._chats_by_jid = {}
    w._messages_by_chat = {}
    w._contacts = {}
    w._seen_ids = set()
    w._MSG_CAP_PER_CHAT = 200
    jid = "111@s.whatsapp.net"
    e1 = MessageEntry(id="A", text="hi", is_outgoing=True, epoch=1.0)
    e2 = MessageEntry(id="A", text="hi", is_outgoing=False, epoch=1.0)  # echo dup
    w._ingest_message(jid, e1, bump_unread=False)
    w._ingest_message(jid, e2, bump_unread=False)
    assert len(w._messages_by_chat[jid]) == 1


def test_normalise_contacts_from_dict():
    out = whatsapp_chat._normalise_contacts({"111@s.whatsapp.net": {"FullName": "Al"}})
    assert "111@s.whatsapp.net" in out


def _bare_worker():
    """A worker instance with no threads / no Go client (store checks only)."""
    return whatsapp_chat._WhatsmeowWorker.__new__(whatsapp_chat._WhatsmeowWorker)


def _make_device_db(path, linked):
    """Create a minimal whatsmeow-style store; one device row iff *linked*."""
    import sqlite3

    con = sqlite3.connect(path)
    con.execute("CREATE TABLE whatsmeow_device (jid TEXT)")
    if linked:
        con.execute("INSERT INTO whatsmeow_device (jid) VALUES ('123:4@s.whatsapp.net')")
    con.commit()
    con.close()


def test_logged_in_store_true_when_device_row(tmp_path, monkeypatch):
    db = str(tmp_path / "wa.sqlite3")
    _make_device_db(db, linked=True)
    w = _bare_worker()
    monkeypatch.setattr(w, "_get_session_path", lambda: db)
    assert w._is_logged_in_store() is True


def test_logged_in_store_false_when_empty(tmp_path, monkeypatch):
    db = str(tmp_path / "wa.sqlite3")
    _make_device_db(db, linked=False)
    w = _bare_worker()
    monkeypatch.setattr(w, "_get_session_path", lambda: db)
    assert w._is_logged_in_store() is False


def test_logged_in_store_false_when_no_db(tmp_path, monkeypatch):
    """No store file / no Go-client call -> not linked (never crashes)."""
    db = str(tmp_path / "missing.sqlite3")
    w = _bare_worker()
    monkeypatch.setattr(w, "_get_session_path", lambda: db)
    assert w._is_logged_in_store() is False


def test_canon_jid_maps_lid_to_phone():
    w = _bare_worker()
    w._lid_to_pn = {"259596564304115": "420725720729"}
    # LID address (as live messages arrive) -> phone form (as history is keyed).
    assert w._canon_jid("259596564304115@lid") == "420725720729@s.whatsapp.net"
    # With device suffix, still maps.
    assert w._canon_jid("259596564304115:7@lid") == "420725720729@s.whatsapp.net"
    # Unknown LID is left as-is (bare).
    assert w._canon_jid("999@lid") == "999@lid"
    # Phone JID with a device suffix is stripped to the bare form.
    assert w._canon_jid("420725720729:5@s.whatsapp.net") == "420725720729@s.whatsapp.net"
    # Group JIDs are untouched.
    assert w._canon_jid("123-456@g.us") == "123-456@g.us"


def test_lid_and_phone_messages_land_on_one_chat():
    """A history msg (phone JID) and a live msg (LID) must share one chat."""
    w = _bare_worker()
    import threading as _t

    w._store_lock = _t.Lock()
    w._chats_by_jid = {}
    w._messages_by_chat = {}
    w._contacts = {}
    w._seen_ids = set()
    w._lid_to_pn = {"259596564304115": "420725720729"}
    w._MSG_CAP_PER_CHAT = 200
    phone = w._canon_jid("420725720729@s.whatsapp.net")
    lid = w._canon_jid("259596564304115@lid")
    assert phone == lid  # both canonicalise to the same key
    w._ingest_message(phone, MessageEntry(id="h1", text="old", epoch=1.0), False)
    w._ingest_message(lid, MessageEntry(id="l1", text="new", epoch=2.0), True)
    assert len(w._chats_by_jid) == 1
    assert len(w._messages_by_chat[phone]) == 2


def test_contact_typeahead_narrow_and_cycle(console):
    console.mode = MODE_CONTACTS
    console.contacts = [
        ContactEntry(id="1@s.whatsapp.net", name="Alice"),
        ContactEntry(id="2@s.whatsapp.net", name="Bob"),
        ContactEntry(id="3@s.whatsapp.net", name="Charlie"),
        ContactEntry(id="4@s.whatsapp.net", name="Bella"),
    ]
    console.contact_sel = 0
    console._contact_typeahead("b")  # -> first 'b': Bob
    assert console.contact_sel == 1
    console._contact_typeahead("b")  # same letter cycles -> Bella
    assert console.contact_sel == 3
    console._refresh_contacts()  # (fake worker returns [Bob]); reset search
    console.contacts = [
        ContactEntry(id="1@s.whatsapp.net", name="Alice"),
        ContactEntry(id="2@s.whatsapp.net", name="Bob"),
        ContactEntry(id="3@s.whatsapp.net", name="Charlie"),
    ]
    console._contact_typeahead("c")
    console._contact_typeahead("h")  # "ch" -> Charlie
    assert console.contact_sel == 2


def _cache_worker(cache_path, monkeypatch):
    import threading as t

    w = whatsapp_chat._WhatsmeowWorker.__new__(whatsapp_chat._WhatsmeowWorker)
    w._store_lock = t.Lock()
    w._cache_lock = t.Lock()
    w._chats_by_jid = {}
    w._messages_by_chat = {}
    w._contacts = {}
    w._seen_ids = set()
    w._cache_dirty = False
    w._cache_conn = None
    w._MSG_CAP_PER_CHAT = 200
    monkeypatch.setattr(w, "_get_cache_path", lambda: cache_path)
    w._init_cache()
    return w


def test_cache_survives_restart(tmp_path, monkeypatch):
    cache = str(tmp_path / "cache.sqlite3")
    jid = "111@s.whatsapp.net"
    w = _cache_worker(cache, monkeypatch)
    w._ingest_message(jid, MessageEntry(id="a", text="hi", epoch=1.0), bump_unread=True)
    w._ingest_message(jid, MessageEntry(id="b", text="bye", epoch=2.0), bump_unread=True)
    w._flush_cache()
    # Simulate a server restart: a brand-new worker loads only from disk.
    w2 = _cache_worker(cache, monkeypatch)
    assert jid in w2._chats_by_jid
    assert w2._chats_by_jid[jid].last_message == "bye"  # newest preview kept
    assert len(w2._messages_by_chat[jid]) == 2
    assert {"a", "b"} <= w2._seen_ids  # dedup state persists too


def test_seed_groups_adds_group_chats():
    import threading as t

    w = _bare_worker()
    w._store_lock = t.Lock()
    w._chats_by_jid = {}
    w._contacts = {}
    w._lid_to_pn = {}
    w._cache_dirty = False

    def _jid(user):
        return type("J", (), {"User": user, "Server": "g.us"})()

    def _grp(user, name):
        return type("G", (), {"JID": _jid(user), "GroupName": type("N", (), {"Name": name})()})()

    w._client = type(
        "C", (), {"get_joined_groups": lambda self: [_grp("1-2", "Family"), _grp("3-4", "Work")]}
    )()
    w._seed_groups()
    assert set(w._chats_by_jid) == {"1-2@g.us", "3-4@g.us"}
    fam = w._chats_by_jid["1-2@g.us"]
    assert fam.name == "Family" and fam.is_group is True


def test_fmt_chat_time_today_vs_past():
    import datetime as dt

    tz = dt.timezone.utc
    now = dt.datetime.now(tz)
    today = now.replace(hour=9, minute=5).timestamp()
    assert whatsapp_chat._fmt_chat_time(today, tz) == "09:05"
    # A past date shows a date, never a time.
    old = (now - dt.timedelta(days=40)).timestamp()
    out = whatsapp_chat._fmt_chat_time(old, tz)
    assert out and ":" not in out
    assert whatsapp_chat._fmt_chat_time(0, tz) == ""


# ----------------------------------------------------------------------
# helpers
# ----------------------------------------------------------------------


def _row_contains(console, row, text):
    """True if the screencodes of *text* appear contiguously in *row*.

    Charset-agnostic: compares against ``char_to_screencode`` output (masking
    the reverse-video bit) rather than decoding screen codes back to ASCII.
    """
    from sdk.server_console import SCREEN_COLS, char_to_screencode

    want = [char_to_screencode(ch) & 0x7F for ch in text]
    row_codes = [
        console.screen[row * SCREEN_COLS + c] & 0x7F for c in range(SCREEN_COLS)
    ]
    for start in range(len(row_codes) - len(want) + 1):
        if row_codes[start : start + len(want)] == want:
            return True
    return False
