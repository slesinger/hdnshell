"""
Unit tests for the shared clipboard feature (GH #18).

Covers:
  * ClipboardService text normalisation, size cap, metadata, session isolation.
  * Visible-screen extraction: line-wise, rectangle, reverse-video cells,
    empty cells, trailing-space trimming, reversed endpoints, edge clamping.
  * Local-paste PETSCII conversion: newline flattening, encoding fallback,
    chunking.
  * Host-clipboard sync watcher: host->server, server->host, loop suppression,
    disabled sync, backend exceptions.
  * Command routing: local COPY_SCREEN / CLIPBOARD_INFO / LOCAL_PASTE_CHUNK
    and server-console COPY_NATIVE / PASTE_TO_APP.
"""

import pytest

from sdk import clipboard as clip
from sdk.clipboard import (
    ClipboardService,
    Selection,
    MODE_LINEWISE,
    MODE_RECTANGLE,
    extract_screen_text,
    text_to_local_petscii,
)
from sdk.petscii import ascii_to_screencode
from sdk.shared_state import reset_all_session_states
from sdk.console_manager import ConsoleManager
from sdk.server_console import ServerConsole
from sdk import command_handler as ch
from sdk.command_handler import CommandHandler


@pytest.fixture(autouse=True)
def _isolate(monkeypatch):
    reset_all_session_states()
    ConsoleManager.reset()
    # Fresh service singleton so max_bytes/host-sink from one test never
    # leaks into the next.
    clip.configure_clipboard_service()
    # Never touch the real network when a console pushes its screen after a
    # paste (there is no C64 attached in unit tests).
    import sdk.network_helper as nh

    monkeypatch.setattr(nh, "send_screen_data", lambda *a, **k: None)
    yield
    reset_all_session_states()
    ConsoleManager.reset()


def _make_screen(rows):
    """Build a 1000-byte screen-code buffer from a list of (row, col, text)."""
    scr = bytearray(b"\x20" * 1000)
    for row, col, text in rows:
        for i, cchar in enumerate(text):
            scr[row * 40 + col + i] = ascii_to_screencode(ord(cchar))
    return bytes(scr)


# ----------------------------------------------------------------------
# ClipboardService core
# ----------------------------------------------------------------------


class TestClipboardServiceCore:
    def test_set_get_roundtrip_normalizes_line_endings(self):
        svc = ClipboardService()
        meta = svc.set_text(1, "a\r\nb\rc", source="test")
        assert svc.get_text(1) == "a\nb\nc"
        assert meta.line_count == 3
        assert meta.source == "test"

    def test_size_cap_truncates_on_utf8_boundary(self):
        svc = ClipboardService(max_bytes=4)
        svc.set_text(1, "abcdef", source="test")
        assert svc.get_text(1) == "abcd"
        # A multi-byte char straddling the cap is dropped, not split.
        svc.set_text(2, "abcé", source="test")  # é is 2 bytes
        assert svc.get_text(2) == "abc"

    def test_session_isolation(self):
        svc = ClipboardService()
        svc.set_text(1, "one", source="test")
        svc.set_text(2, "two", source="test")
        assert svc.get_text(1) == "one"
        assert svc.get_text(2) == "two"

    def test_metadata_recomputed_when_absent(self):
        # Legacy path: raw clipboard entry written without metadata.
        from sdk.shared_state import set_clipboard

        set_clipboard(1, "hello\nworld")
        meta = ClipboardService().get_metadata(1)
        assert meta.byte_length == 11
        assert meta.line_count == 2

    def test_empty_clipboard_metadata(self):
        meta = ClipboardService().get_metadata(99)
        assert meta.byte_length == 0
        assert meta.line_count == 0


# ----------------------------------------------------------------------
# Visible-screen extraction
# ----------------------------------------------------------------------


class TestScreenExtraction:
    def test_linewise_copies_whole_rows_trimmed(self):
        scr = _make_screen([(0, 0, "hello world"), (1, 0, "second")])
        out = extract_screen_text(scr, Selection(MODE_LINEWISE, 5, 0, 2, 1))
        # Whole rows regardless of x; trailing padding removed.
        assert out == "hello world\nsecond"

    def test_rectangle_copies_inclusive_column_range(self):
        scr = _make_screen([(0, 0, "hello world"), (1, 0, "second line")])
        out = extract_screen_text(scr, Selection(MODE_RECTANGLE, 0, 0, 4, 1))
        assert out == "hello\nsecon"

    def test_rectangle_preserves_internal_spaces(self):
        scr = _make_screen([(0, 0, "a b c")])
        out = extract_screen_text(scr, Selection(MODE_RECTANGLE, 0, 0, 4, 0))
        assert out == "a b c"

    def test_reversed_endpoints_normalized(self):
        scr = _make_screen([(0, 0, "hello"), (1, 0, "world")])
        a = extract_screen_text(scr, Selection(MODE_RECTANGLE, 0, 0, 4, 1))
        b = extract_screen_text(scr, Selection(MODE_RECTANGLE, 4, 1, 0, 0))
        assert a == b == "hello\nworld"

    def test_reverse_video_cells_decode_same_as_normal(self):
        scr = bytearray(_make_screen([(0, 0, "hi")]))
        # Set reverse-video bit on both chars.
        scr[0] |= 0x80
        scr[1] |= 0x80
        out = extract_screen_text(bytes(scr), Selection(MODE_RECTANGLE, 0, 0, 1, 0))
        assert out == "hi"

    def test_empty_cells_trimmed(self):
        scr = _make_screen([])  # all spaces
        out = extract_screen_text(scr, Selection(MODE_LINEWISE, 0, 0, 0, 2))
        assert out == "\n\n"

    def test_coordinates_clamped_to_screen(self):
        scr = _make_screen([(24, 0, "bottom")])
        out = extract_screen_text(scr, Selection(MODE_LINEWISE, 200, 200, 0, 24))
        # y clamps to 24, whole row returned.
        assert out.endswith("bottom")


# ----------------------------------------------------------------------
# Local paste conversion
# ----------------------------------------------------------------------


class TestLocalPaste:
    def test_newlines_become_spaces(self):
        # "one\ntwo" -> "one two", no PETSCII carriage return (0x0D).
        out = text_to_local_petscii("one\ntwo")
        assert 0x0D not in out
        assert out == b"\x4f\x4e\x45\x20\x54\x57\x4f"  # "ONE TWO"

    def test_unsupported_char_becomes_question_mark(self):
        out = text_to_local_petscii("a❤b")  # heart
        assert out == b"\x41\x3f\x42"

    def test_chunking(self):
        svc = ClipboardService()
        svc.set_text(1, "abcdef", source="test")
        c0 = svc.to_local_petscii_chunk(1, 0, 4)
        assert c0.data == b"\x41\x42\x43\x44"
        assert c0.total_bytes == 6
        assert c0.done is False
        c1 = svc.to_local_petscii_chunk(1, 4, 4)
        assert c1.data == b"\x45\x46"
        assert c1.done is True

    def test_empty_clipboard_chunk_is_done(self):
        c = ClipboardService().to_local_petscii_chunk(5, 0, 64)
        assert c.data == b""
        assert c.done is True
        assert c.total_bytes == 0


# ----------------------------------------------------------------------
# Host clipboard sync
# ----------------------------------------------------------------------


class _FakeBackend:
    def __init__(self, text=""):
        self.text = text
        self.available = True
        self.raise_on_read = False
        self.reads = 0

    def is_available(self):
        return self.available

    def read_text(self):
        self.reads += 1
        if self.raise_on_read:
            raise RuntimeError("boom")
        return self.text

    def write_text(self, text):
        self.text = text


class TestHostSync:
    def _sync(self, backend, enabled=True):
        from sdk.host_clipboard import HostClipboardSync

        svc = clip.get_clipboard_service()
        sync = HostClipboardSync(svc, backend=backend, enabled=enabled)
        return svc, sync

    def test_server_copy_propagates_to_host(self):
        backend = _FakeBackend()
        svc, sync = self._sync(backend)
        assert sync.start() is True
        try:
            svc.set_text(1, "from c64", source="editor")
            assert backend.text == "from c64"
        finally:
            sync.stop()

    def test_host_change_propagates_to_active_session(self):
        backend = _FakeBackend("initial")
        svc, sync = self._sync(backend)
        assert sync.start() is True
        try:
            # A C64 copy makes session 7 the active target.
            svc.set_text(7, "c64 value", source="editor")
            backend.text = "typed on desktop"
            assert sync.poll_once() is True
            assert svc.get_text(7) == "typed on desktop"
        finally:
            sync.stop()

    def test_loop_suppression(self):
        backend = _FakeBackend()
        svc, sync = self._sync(backend)
        sync.start()
        try:
            svc.set_text(1, "echo me", source="editor")  # written to host
            # The very next poll sees our own write -> must NOT re-import.
            assert sync.poll_once() is False
        finally:
            sync.stop()

    def test_disabled_sync_does_not_start(self):
        backend = _FakeBackend()
        _svc, sync = self._sync(backend, enabled=False)
        assert sync.start() is False

    def test_backend_read_exception_is_swallowed(self):
        backend = _FakeBackend("x")
        svc, sync = self._sync(backend)
        sync.start()
        try:
            svc.set_text(3, "v", source="editor")
            backend.raise_on_read = True
            assert sync.poll_once() is False  # no crash
        finally:
            sync.stop()

    def test_host_change_with_no_active_session_is_ignored(self):
        backend = _FakeBackend("start")
        _svc, sync = self._sync(backend)
        sync.start()
        try:
            backend.text = "new host value"
            # No session has copied yet -> nothing to import into.
            assert sync.poll_once() is False
        finally:
            sync.stop()

    # ── On-demand pull (no background polling => no dock/taskbar flash) ──

    def test_start_does_not_spawn_background_thread_by_default(self):
        import threading

        backend = _FakeBackend()
        _svc, sync = self._sync(backend)
        before = {id(t) for t in threading.enumerate()}
        assert sync.start() is True
        try:
            new_threads = [t for t in threading.enumerate() if id(t) not in before]
            # The whole point of the fix: no poll loop spawning `wl-paste`.
            assert new_threads == [], f"unexpected background thread(s): {new_threads}"
        finally:
            sync.stop()

    def test_pull_from_host_imports_change_on_demand(self):
        backend = _FakeBackend("seed")
        svc, sync = self._sync(backend)
        sync.start()
        try:
            backend.text = "pasted from desktop"
            # A paste into session 5 pulls the host clipboard just-in-time.
            svc.pull_from_host(5)
            assert svc.get_text(5) == "pasted from desktop"
        finally:
            sync.stop()

    def test_pull_debounce_coalesces_info_and_paste(self):
        backend = _FakeBackend("seed")
        _svc, sync = self._sync(backend)
        sync.start()
        reads_after_seed = backend.reads
        try:
            backend.text = "v1"
            assert sync.pull_now(5) is True          # first pull reads
            backend.text = "v2"
            assert sync.pull_now(5) is False         # within debounce -> no read
            # Only one extra backend read happened for the burst.
            assert backend.reads == reads_after_seed + 1
        finally:
            sync.stop()

    def test_pull_suppresses_own_echo(self):
        backend = _FakeBackend()
        svc, sync = self._sync(backend)
        sync.start()
        try:
            svc.set_text(1, "c64 copy", source="editor")  # mirrored to host
            sync._last_pull_ts = 0.0                        # bypass debounce
            # Pulling back our own write must NOT re-import it as a host change.
            assert sync.pull_now(1) is False
        finally:
            sync.stop()

    def test_disabled_sync_has_no_host_source(self):
        backend = _FakeBackend("x")
        svc, sync = self._sync(backend, enabled=False)
        assert sync.start() is False
        # pull_from_host must be a harmless no-op when sync never started.
        svc.pull_from_host(1)
        assert svc.get_text(1) == ""


# ----------------------------------------------------------------------
# Command routing
# ----------------------------------------------------------------------


class _PasteConsole(ServerConsole):
    def __init__(self, console_id, session_id):
        super().__init__(console_id, session_id)
        self.pasted = None
        self.native_ok = False

    def copy_native(self):
        if self.native_ok:
            clip.get_clipboard_service().set_text(
                self.session_id, "native text", source="test"
            )
            return True
        return False

    def handle_clipboard_paste(self, text):
        self.pasted = text
        return True


class TestCommandRouting:
    def test_local_copy_screen_then_info(self):
        from sdk.shared_state import update_session_state

        scr = _make_screen([(0, 0, "hello")])
        update_session_state(1, saved_screen=scr)
        resp = CommandHandler.handle_local_command(
            bytes([ch.SERVER_CMD_COPY_SCREEN, MODE_RECTANGLE, 0, 0, 4, 0]), 1
        )
        # [len_hi, len_lo, lines, flags]; "hello" is 5 bytes, 1 line, present.
        assert resp == bytes([0x00, 0x05, 0x01, ch.CLIP_FLAG_PRESENT])
        assert clip.get_clipboard_service().get_text(1) == "hello"
        info = CommandHandler.handle_local_command(
            bytes([ch.SERVER_CMD_CLIPBOARD_INFO]), 1
        )
        assert info == bytes([0x00, 0x05, 0x01, ch.CLIP_FLAG_PRESENT])

    def test_local_paste_chunk_command(self):
        clip.get_clipboard_service().set_text(1, "hi there", source="test")
        resp = CommandHandler.handle_local_command(
            bytes([ch.SERVER_CMD_LOCAL_PASTE_CHUNK, 0x00, 0x00, 0x04]), 1
        )
        # [total_hi, total_lo, done, <petscii>]
        assert resp[0:3] == bytes([0x00, 0x08, 0x00])  # total 8, not done
        assert resp[3:] == b"\x48\x49\x20\x54"  # "HI T"

    def test_console_paste_to_app(self):
        mgr = ConsoleManager.instance()
        mgr.register_factory(2, _PasteConsole)
        clip.get_clipboard_service().set_text(1, "clip text", source="test")
        resp = CommandHandler.handle_command(
            2, bytes([ch.SERVER_CMD_PASTE_TO_APP]), 1
        )
        assert resp == bytes([ch.PASTE_STATUS_ACCEPTED])
        console = mgr.get_console(2, 1)
        assert console.pasted == "clip text"

    def test_console_paste_rejected_on_base_console(self):
        resp = CommandHandler.handle_command(
            3, bytes([ch.SERVER_CMD_PASTE_TO_APP]), 1
        )
        assert resp == bytes([ch.PASTE_STATUS_REJECTED])

    def test_console_copy_native_fallback_and_success(self):
        mgr = ConsoleManager.instance()
        mgr.register_factory(4, _PasteConsole)
        # No native selection -> status 0 (wedge falls back to screen select).
        resp = CommandHandler.handle_command(
            4, bytes([ch.SERVER_CMD_COPY_NATIVE]), 1
        )
        assert resp == bytes([0x00])
        # Enable native copy -> status 1 + clip info.
        mgr.get_console(4, 1).native_ok = True
        resp = CommandHandler.handle_command(
            4, bytes([ch.SERVER_CMD_COPY_NATIVE]), 1
        )
        assert resp[0] == 0x01
        assert clip.get_clipboard_service().get_text(1) == "native text"
