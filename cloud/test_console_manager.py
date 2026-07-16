"""
Unit tests for the two toast types (timed vs key-confirmed) exposed by
ServerConsole.show_toaster and ConsoleManager.show_session_toast.

- timed:         duration_sec is a number -- the toast auto-expires.
- key-confirmed: duration_sec=None -- the toast has no timeout and is only
  dismissed by a keypress (ConsoleManager.handle_keypress clears both the
  per-console and session-level toaster on every keypress).
"""

import time

import pytest

from sdk.console_manager import ConsoleManager
from sdk.server_console import ServerConsole
from sdk import _session_toasts


@pytest.fixture(autouse=True)
def _isolate_console_manager():
    ConsoleManager.reset()
    yield
    ConsoleManager.reset()


# ----------------------------------------------------------------------
# ServerConsole.show_toaster
# ----------------------------------------------------------------------


class TestServerConsoleToastTypes:
    def test_timed_toast_expires_after_duration(self, monkeypatch):
        fake_now = [1000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        console = ServerConsole(console_id=1, session_id=1)
        console.show_toaster("Saved.", duration_sec=5.0)
        assert console._toaster_active() is True

        fake_now[0] += 5.1  # past the deadline
        assert console._toaster_active() is False

    def test_key_confirmed_toast_survives_long_time_passing(self, monkeypatch):
        fake_now = [1000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        console = ServerConsole(console_id=1, session_id=1)
        console.show_toaster("Press any key...", duration_sec=None)
        assert console._toaster_active() is True

        fake_now[0] += 10_000_000.0  # a very long time
        assert console._toaster_active() is True  # still visible, no timeout

    def test_keypress_dismisses_key_confirmed_toast(self, monkeypatch):
        fake_now = [1000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        mgr = ConsoleManager.instance()
        console = mgr.get_console(console_id=1, session_id=42)
        console.show_toaster("Press any key...", duration_sec=None)
        assert console._toaster_active() is True

        fake_now[0] += 10_000_000.0
        assert console._toaster_active() is True  # still up before any keypress

        mgr.handle_keypress(console_id=1, session_id=42, petscii_code=0x41, modifiers=0)
        assert console._toaster_active() is False  # gone after keypress


# ----------------------------------------------------------------------
# ConsoleManager.show_session_toast
# ----------------------------------------------------------------------


class TestSessionToastTypes:
    def test_timed_session_toast_expires(self, monkeypatch):
        fake_now = [2000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        mgr = ConsoleManager.instance()
        session_id = 43
        mgr.show_session_toast(session_id, "hello", duration_sec=3.0, push=False)
        assert _session_toasts.active(session_id) is True

        fake_now[0] += 3.1
        assert _session_toasts.active(session_id) is False

    def test_key_confirmed_session_toast_survives_long_time_passing(self, monkeypatch):
        fake_now = [2000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        mgr = ConsoleManager.instance()
        session_id = 44
        mgr.show_session_toast(session_id, "hello", duration_sec=None, push=False)
        assert _session_toasts.active(session_id) is True

        fake_now[0] += 10_000_000.0
        assert _session_toasts.active(session_id) is True

    def test_keypress_dismisses_key_confirmed_session_toast(self, monkeypatch):
        fake_now = [2000.0]
        monkeypatch.setattr(time, "monotonic", lambda: fake_now[0])

        mgr = ConsoleManager.instance()
        session_id = 45
        mgr.show_session_toast(session_id, "hello", duration_sec=None, push=False)
        assert _session_toasts.active(session_id) is True

        fake_now[0] += 10_000_000.0
        assert _session_toasts.active(session_id) is True  # no timeout yet

        mgr.handle_keypress(
            console_id=1, session_id=session_id, petscii_code=0x41, modifiers=0
        )
        assert _session_toasts.active(session_id) is False
