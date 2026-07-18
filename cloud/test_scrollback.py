"""
Unit tests for the console-0 scrollback feature (STEP 1 + STEP 1b):

  - sdk/scrollback.py:  HistoryStore (persistent transcript, paging math)
                        and render_page (history lines -> screen/colour
                        buffers).
  - sdk/command_handler.py: SERVER_CMD_SCROLLBACK_PREV/_NEXT dispatch and
                        the scrollback_page session cursor, plus the
                        RESTORE_SCREEN -> scrollback_page reset.

STEP 1b adds server-side capture of the live screen into the transcript
(HistoryStore.capture_screen, an overlap-diff) and its two call sites in
command_handler.py: SERVER_CMD_SAVE_SCREEN and handle_text_input.
"""

import os

import pytest

from sdk.scrollback import HistoryStore, render_page, HISTORY_CAP_BYTES, SCREEN_COLS, SCREEN_ROWS
from sdk.petscii import ascii_to_screencode


def screen_from_lines(lines):
    """Build a 1000-byte C64 screen buffer (40x25 screen codes) from a list
    of ASCII strings. Lines beyond 25 are ignored; missing rows/cols are
    space-filled -- the inverse of what `capture_screen` reads back."""
    data = bytearray([0x20] * (SCREEN_COLS * SCREEN_ROWS))
    for row in range(SCREEN_ROWS):
        line = lines[row] if row < len(lines) else ""
        for col in range(SCREEN_COLS):
            if col < len(line):
                data[row * SCREEN_COLS + col] = ascii_to_screencode(ord(line[col]))
    return bytes(data)


# ----------------------------------------------------------------------
# HistoryStore: append_lines + 100KB cap
# ----------------------------------------------------------------------


class TestHistoryStoreCap:
    def test_append_and_cap_keeps_newest_drops_oldest(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))

        # Each line is 100 chars; with the joining '\n' that's 101 bytes/line.
        # 2000 lines ~= 202000 bytes, comfortably over the 102400 cap.
        lines = [f"line-{i:06d}-" + ("x" * 88) for i in range(2000)]
        assert all(len(line) == 100 for line in lines)

        store.append_lines(lines)

        raw = open(store.path, "rb").read()
        assert len(raw) <= HISTORY_CAP_BYTES

        stored = store.read_lines()
        # Newest line survived, in full, at the tail.
        assert stored[-1] == lines[-1]
        # Oldest lines were dropped from the front.
        assert lines[0] not in stored
        assert lines[1] not in stored
        # What remains is still a contiguous, in-order suffix of what we wrote.
        assert lines[-len(stored):] == stored

    def test_append_is_cumulative_across_calls(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        store.append_lines(["a", "b"])
        store.append_lines(["c"])
        assert store.read_lines() == ["a", "b", "c"]

    def test_trailing_spaces_are_trimmed(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        store.append_lines(["hello   ", "world"])
        assert store.read_lines() == ["hello", "world"]


# ----------------------------------------------------------------------
# HistoryStore: get_page / total_pages paging math
# ----------------------------------------------------------------------


class TestHistoryStorePaging:
    def _make_store(self, tmp_path, n_lines):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        lines = [f"L{i:03d}" for i in range(n_lines)]
        store.append_lines(lines)
        return store, lines

    def test_total_pages_empty(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        assert store.total_pages() == 0

    def test_total_pages_ceil(self, tmp_path):
        store, _ = self._make_store(tmp_path, 63)
        assert store.total_pages(page_size=25) == 3  # ceil(63/25)

    def test_page1_is_most_recent_25_in_order(self, tmp_path):
        store, lines = self._make_store(tmp_path, 63)
        page1 = store.get_page(1, page_size=25)
        assert page1 == lines[38:63]  # last 25 lines, in order

    def test_page2_is_prior_25(self, tmp_path):
        store, lines = self._make_store(tmp_path, 63)
        page2 = store.get_page(2, page_size=25)
        assert page2 == lines[13:38]

    def test_oldest_page_top_padded(self, tmp_path):
        store, lines = self._make_store(tmp_path, 63)
        page3 = store.get_page(3, page_size=25)
        # Only 13 real lines remain (L000..L012); padded with 12 empties on top.
        assert page3 == [""] * 12 + lines[0:13]
        assert len(page3) == 25

    def test_out_of_range_page_is_all_empty(self, tmp_path):
        store, _ = self._make_store(tmp_path, 63)
        assert store.get_page(4, page_size=25) == [""] * 25
        assert store.get_page(0, page_size=25) == [""] * 25

    def test_get_page_on_empty_store(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        assert store.get_page(1) == [""] * 25


# ----------------------------------------------------------------------
# HistoryStore: clear
# ----------------------------------------------------------------------


class TestHistoryStoreClear:
    def test_clear_empties_file(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        store.append_lines(["a", "b", "c"])
        assert store.read_lines() != []
        store.clear()
        assert store.read_lines() == []
        assert os.path.exists(store.path)
        assert open(store.path, "rb").read() == b""


# ----------------------------------------------------------------------
# render_page
# ----------------------------------------------------------------------


class TestRenderPage:
    def test_returns_1000_bytes_each(self):
        screen, color = render_page(["hello"])
        assert len(screen) == 1000
        assert len(color) == 1000

    def test_known_line_maps_to_expected_screen_codes_and_padding(self):
        screen, color = render_page(["ABC"])
        expected = [
            ascii_to_screencode(ord("A")),
            ascii_to_screencode(ord("B")),
            ascii_to_screencode(ord("C")),
        ]
        assert list(screen[0:3]) == expected
        # Rest of row 0 is space-padded.
        assert all(b == 0x20 for b in screen[3:40])
        # All other rows are blank.
        assert all(b == 0x20 for b in screen[40:1000])

    def test_missing_rows_padded_blank(self):
        screen, _ = render_page([])
        assert all(b == 0x20 for b in screen)

    def test_color_is_all_light_blue(self):
        _, color = render_page(["anything"])
        assert all(b == 0x0E for b in color)

    def test_long_line_truncated_to_40_cols(self):
        line = "x" * 50
        screen, _ = render_page([line])
        assert len(screen) == 1000
        assert list(screen[0:40]) == [ascii_to_screencode(ord("x"))] * 40
        assert all(b == 0x20 for b in screen[40:80])


# ----------------------------------------------------------------------
# Command handling: SERVER_CMD_SCROLLBACK_PREV / _NEXT / RESTORE_SCREEN
# ----------------------------------------------------------------------


@pytest.fixture
def patched_store(tmp_path, monkeypatch):
    """Point sdk.command_handler's module-level HistoryStore at a tmp file
    pre-loaded with exactly 3 full pages (75 lines) of known content."""
    import sdk.command_handler as ch

    store = HistoryStore(path=str(tmp_path / "history.txt"))
    lines = [f"row-{i:03d}" for i in range(75)]  # exactly 3 pages, no padding
    store.append_lines(lines)
    monkeypatch.setattr(ch, "_history_store", store)
    return store, lines


@pytest.fixture
def captured_screens(monkeypatch):
    """Stub network_helper.send_screen_data as imported into command_handler,
    recording every (screen, color) pair it's called with."""
    import sdk.command_handler as ch

    calls = []
    monkeypatch.setattr(
        ch, "send_screen_data", lambda screen, color: calls.append((screen, color))
    )
    return calls


def _prev_packet():
    from sdk.command_handler import SERVER_CMD_SCROLLBACK_PREV

    return bytes([SERVER_CMD_SCROLLBACK_PREV])


def _next_packet():
    from sdk.command_handler import SERVER_CMD_SCROLLBACK_NEXT

    return bytes([SERVER_CMD_SCROLLBACK_NEXT])


def _restore_packet():
    from sdk.command_handler import SERVER_CMD_RESTORE_SCREEN

    return bytes([SERVER_CMD_RESTORE_SCREEN])


class TestScrollbackCommands:
    @pytest.fixture(autouse=True)
    def _reset_console_manager(self):
        from sdk.console_manager import ConsoleManager

        ConsoleManager.reset()
        yield
        ConsoleManager.reset()

    def test_prev_from_page0_enters_page1_and_paints(
        self, patched_store, captured_screens
    ):
        from sdk.command_handler import CommandHandler
        from sdk.scrollback import render_page
        from sdk.shared_state import get_session_state_copy

        store, lines = patched_store
        sid = 201

        CommandHandler.handle_local_command(_prev_packet(), sid)

        state = get_session_state_copy(sid)
        assert state["scrollback_page"] == 1
        assert len(captured_screens) == 1
        expected_screen, expected_color = render_page(store.get_page(1))
        assert captured_screens[0] == (expected_screen, expected_color)

    def test_prev_walks_to_oldest_page_and_clamps(
        self, patched_store, captured_screens
    ):
        from sdk.command_handler import CommandHandler
        from sdk.shared_state import get_session_state_copy

        sid = 202
        # 5 PREVs against a 3-page history: 1, 2, 3, 3, 3 (clamped).
        for _ in range(5):
            CommandHandler.handle_local_command(_prev_packet(), sid)

        state = get_session_state_copy(sid)
        assert state["scrollback_page"] == 3
        assert len(captured_screens) == 5  # every PREV still paints

    def test_next_walks_down_and_repaints_saved_live_screen_at_0(
        self, patched_store, captured_screens
    ):
        from sdk.command_handler import CommandHandler
        from sdk.shared_state import get_session_state_copy, update_session_state

        sid = 203
        saved_screen = bytes([0x41]) * 1000  # arbitrary "live" screen
        saved_color = bytes([0x01]) * 1000
        update_session_state(sid, saved_screen=saved_screen, saved_color=saved_color)

        # Walk into history first.
        CommandHandler.handle_local_command(_prev_packet(), sid)  # -> page 1
        CommandHandler.handle_local_command(_prev_packet(), sid)  # -> page 2
        captured_screens.clear()

        # Now walk back down: page 2 -> 1 -> 0 (repaint saved live screen).
        CommandHandler.handle_local_command(_next_packet(), sid)
        CommandHandler.handle_local_command(_next_packet(), sid)

        state = get_session_state_copy(sid)
        assert state["scrollback_page"] == 0
        assert captured_screens[-1] == (saved_screen, saved_color)

        # Further NEXT clamps at 0 and keeps repainting the live screen.
        CommandHandler.handle_local_command(_next_packet(), sid)
        state = get_session_state_copy(sid)
        assert state["scrollback_page"] == 0
        assert captured_screens[-1] == (saved_screen, saved_color)

    def test_next_with_no_saved_screen_is_a_quiet_noop_at_page0(
        self, patched_store, captured_screens
    ):
        from sdk.command_handler import CommandHandler
        from sdk.shared_state import get_session_state_copy

        sid = 204
        # No SAVE_SCREEN happened for this session: no saved_screen/saved_color.
        CommandHandler.handle_local_command(_next_packet(), sid)

        state = get_session_state_copy(sid)
        assert state["scrollback_page"] == 0
        assert captured_screens == []  # nothing to paint, no crash

    def test_restore_resets_scrollback_page_to_zero(
        self, patched_store, captured_screens
    ):
        from sdk.command_handler import CommandHandler
        from sdk.shared_state import get_session_state_copy, update_session_state

        sid = 205
        update_session_state(
            sid, saved_screen=bytes(1000), saved_color=bytes(1000)
        )
        CommandHandler.handle_local_command(_prev_packet(), sid)
        CommandHandler.handle_local_command(_prev_packet(), sid)
        assert get_session_state_copy(sid)["scrollback_page"] == 2

        CommandHandler.handle_local_command(_restore_packet(), sid)

        assert get_session_state_copy(sid)["scrollback_page"] == 0


# ----------------------------------------------------------------------
# HistoryStore.capture_screen: overlap-diff unit tests (STEP 1b)
# ----------------------------------------------------------------------


class TestCaptureScreenOverlapDiff:
    def test_empty_history_appends_whole_trimmed_frame(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        screen = screen_from_lines(["HELLO", "WORLD"])

        n = store.capture_screen(screen)

        assert n == 2
        assert store.read_lines() == ["HELLO", "WORLD"]

    def test_identical_screen_as_last_capture_appends_nothing(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        screen = screen_from_lines(["HELLO", "WORLD"])
        store.capture_screen(screen)

        n = store.capture_screen(screen)

        assert n == 0
        assert store.read_lines() == ["HELLO", "WORLD"]

    def test_screen_scrolled_by_n_lines_appends_exactly_n(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        first = screen_from_lines(["LINE1", "LINE2", "LINE3", "LINE4", "LINE5"])
        store.capture_screen(first)

        # Scrolled by 3: the old bottom 2 lines are now the top 2, plus 3
        # brand-new lines below.
        scrolled = screen_from_lines(
            ["LINE4", "LINE5", "LINE6", "LINE7", "LINE8"]
        )
        n = store.capture_screen(scrolled)

        assert n == 3
        assert store.read_lines() == [
            "LINE1",
            "LINE2",
            "LINE3",
            "LINE4",
            "LINE5",
            "LINE6",
            "LINE7",
            "LINE8",
        ]

    def test_completely_different_screen_appends_whole_frame(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        store.capture_screen(screen_from_lines(["AAA", "BBB"]))

        n = store.capture_screen(screen_from_lines(["XXX", "YYY", "ZZZ"]))

        assert n == 3
        assert store.read_lines() == ["AAA", "BBB", "XXX", "YYY", "ZZZ"]

    def test_trailing_blank_rows_are_not_appended(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        # Only 2 of the 25 rows have content; the rest of the screen is blank.
        screen = screen_from_lines(["FOO", "BAR"])

        n = store.capture_screen(screen)

        assert n == 2
        assert store.read_lines() == ["FOO", "BAR"]

    def test_interior_and_leading_blank_lines_are_kept(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        screen = screen_from_lines(["", "FOO", "", "BAR"])

        n = store.capture_screen(screen)

        assert n == 4
        assert store.read_lines() == ["", "FOO", "", "BAR"]

    def test_completely_blank_screen_appends_nothing(self, tmp_path):
        store = HistoryStore(path=str(tmp_path / "history.txt"))

        n = store.capture_screen(screen_from_lines([]))

        assert n == 0
        assert store.read_lines() == []

    def test_repeated_captures_of_unchanged_screen_never_grow_history(
        self, tmp_path
    ):
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        screen = screen_from_lines(["STABLE", "SCREEN"])

        store.capture_screen(screen)
        first_len = len(store.read_lines())
        for _ in range(10):
            store.capture_screen(screen)

        assert len(store.read_lines()) == first_len
        assert store.read_lines() == ["STABLE", "SCREEN"]

    def test_trailing_spaces_within_a_line_are_trimmed_before_diffing(
        self, tmp_path
    ):
        # ascii_to_screencode(' ') fills the rest of each row, so a "HI" row
        # naturally comes back as "HI" + 38 trailing spaces from
        # _screen_bytes_to_lines; capture_screen must rstrip that before
        # comparing/storing, same as append_lines does.
        store = HistoryStore(path=str(tmp_path / "history.txt"))
        n = store.capture_screen(screen_from_lines(["HI"]))
        assert n == 1
        assert store.read_lines() == ["HI"]


# ----------------------------------------------------------------------
# Command handling: capture call sites (SAVE_SCREEN, handle_text_input)
# ----------------------------------------------------------------------


class TestSaveScreenCapturesHistory:
    @pytest.fixture(autouse=True)
    def _reset_console_manager(self):
        from sdk.console_manager import ConsoleManager

        ConsoleManager.reset()
        yield
        ConsoleManager.reset()

    def test_save_screen_captures_dma_read_screen_into_history(
        self, tmp_path, monkeypatch
    ):
        import sdk.command_handler as ch
        from sdk.command_handler import CommandHandler, SERVER_CMD_SAVE_SCREEN

        store = HistoryStore(path=str(tmp_path / "history.txt"))
        monkeypatch.setattr(ch, "_history_store", store)

        screen = screen_from_lines(["CAPTURED", "FROM SAVE_SCREEN"])
        color = bytes([0x0E]) * 1000

        def fake_dma_read_memory(host, address, length):
            return screen if address == 0x0400 else color

        monkeypatch.setattr(
            "sdk.network_helper.dma_read_memory", fake_dma_read_memory
        )
        monkeypatch.setattr(
            "sdk.network_helper.read_last_c64_ip", lambda: "192.168.1.64"
        )

        sid = 301
        response = CommandHandler.handle_local_command(
            bytes([SERVER_CMD_SAVE_SCREEN]), sid
        )

        assert response == b"00"
        assert store.read_lines() == ["CAPTURED", "FROM SAVE_SCREEN"]

    def test_save_screen_capture_failure_does_not_break_save(
        self, tmp_path, monkeypatch
    ):
        """A broken capture_screen must not stop SAVE_SCREEN from stashing
        the screen/color and returning its ack."""
        import sdk.command_handler as ch
        from sdk.command_handler import CommandHandler, SERVER_CMD_SAVE_SCREEN
        from sdk.shared_state import get_session_state_copy

        class ExplodingStore:
            def capture_screen(self, screen_bytes):
                raise RuntimeError("boom")

        monkeypatch.setattr(ch, "_history_store", ExplodingStore())

        screen = screen_from_lines(["X"])
        color = bytes([0x0E]) * 1000
        monkeypatch.setattr(
            "sdk.network_helper.dma_read_memory",
            lambda host, address, length: screen if address == 0x0400 else color,
        )
        monkeypatch.setattr(
            "sdk.network_helper.read_last_c64_ip", lambda: "192.168.1.64"
        )

        sid = 302
        response = CommandHandler.handle_local_command(
            bytes([SERVER_CMD_SAVE_SCREEN]), sid
        )

        assert response == b"00"
        state = get_session_state_copy(sid)
        assert state["saved_screen"] == screen
        assert state["saved_color"] == color


class TestHandleTextInputCapturesHistory:
    def test_captures_screen_before_dispatch(self, tmp_path, monkeypatch):
        import sdk.command_handler as ch
        from sdk.command_handler import CommandHandler

        store = HistoryStore(path=str(tmp_path / "history.txt"))
        monkeypatch.setattr(ch, "_history_store", store)

        screen = screen_from_lines(["READY.", "LOAD FOO"])
        monkeypatch.setattr(
            "sdk.network_helper.dma_read_memory",
            lambda host, address, length: screen,
        )
        monkeypatch.setattr(
            "sdk.network_helper.read_last_c64_ip", lambda: "192.168.1.64"
        )

        dispatch_calls = []

        class FakeDispatcher:
            def dispatch(self, data, session_id):
                dispatch_calls.append((data, session_id))
                return b"dispatched"

        monkeypatch.setattr(ch.CommandHandler, "_dispatcher", FakeDispatcher())

        result = CommandHandler.handle_text_input(b"LOAD FOO\x00", session_id=401)

        assert result == b"dispatched"
        assert dispatch_calls == [(b"LOAD FOO\x00", 401)]
        assert store.read_lines() == ["READY.", "LOAD FOO"]

    def test_missing_host_skips_capture_but_still_dispatches(
        self, tmp_path, monkeypatch
    ):
        import sdk.command_handler as ch
        from sdk.command_handler import CommandHandler

        store = HistoryStore(path=str(tmp_path / "history.txt"))
        monkeypatch.setattr(ch, "_history_store", store)

        called = []
        monkeypatch.setattr(
            "sdk.network_helper.dma_read_memory",
            lambda host, address, length: called.append(1) or b"",
        )
        monkeypatch.setattr("sdk.network_helper.read_last_c64_ip", lambda: "")

        dispatch_calls = []

        class FakeDispatcher:
            def dispatch(self, data, session_id):
                dispatch_calls.append((data, session_id))
                return b"dispatched"

        monkeypatch.setattr(ch.CommandHandler, "_dispatcher", FakeDispatcher())

        result = CommandHandler.handle_text_input(b"HELLO\x00", session_id=402)

        assert result == b"dispatched"
        assert dispatch_calls == [(b"HELLO\x00", 402)]
        assert called == []  # dma_read_memory never invoked: no host
        assert store.read_lines() == []

    def test_dma_failure_does_not_break_dispatch(self, tmp_path, monkeypatch):
        import sdk.command_handler as ch
        from sdk.command_handler import CommandHandler

        store = HistoryStore(path=str(tmp_path / "history.txt"))
        monkeypatch.setattr(ch, "_history_store", store)

        def broken_dma_read_memory(host, address, length):
            raise ConnectionError("host unreachable")

        monkeypatch.setattr(
            "sdk.network_helper.dma_read_memory", broken_dma_read_memory
        )
        monkeypatch.setattr(
            "sdk.network_helper.read_last_c64_ip", lambda: "192.168.1.64"
        )

        dispatch_calls = []

        class FakeDispatcher:
            def dispatch(self, data, session_id):
                dispatch_calls.append((data, session_id))
                return b"dispatched"

        monkeypatch.setattr(ch.CommandHandler, "_dispatcher", FakeDispatcher())

        result = CommandHandler.handle_text_input(b"HELLO\x00", session_id=403)

        assert result == b"dispatched"
        assert dispatch_calls == [(b"HELLO\x00", 403)]
        assert store.read_lines() == []


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
