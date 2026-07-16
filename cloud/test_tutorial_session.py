"""
Unit tests for tutorials.session.TutorialSession (Phase 3: screen-read
auto-advance, `s` demo-typing, and the off-shell overlay guard -- see
TUTORIALS_PLAN.md §9 Phase 3).

No hardware, no real network: `sdk.network_helper.read_last_c64_ip` /
`dma_read_memory` / `send_screen_data` / `send_c64_keyboard_input` are
monkeypatched throughout, following the style in
test_agent_tools_c64_memory.py. `_tick()` is called directly wherever
possible so most tests never spin up the background thread; the few
that do use a tiny poll_interval and always stop the session in a
fixture teardown so no thread leaks past a test.
"""

import time

import pytest

import sdk.network_helper as network_helper
from sdk.console_manager import ConsoleManager
from sdk.petscii import ascii_to_screencode
from sdk.shared_state import reset_all_session_states
from sdk.toaster import toaster_box_rect
from tutorials.content import tut1, tut2
from tutorials.model import Screen, Step, Tutorial, always_manual, screen_contains
from tutorials.session import (
    SCREEN_ADDR,
    TutorialSession,
    _SESSIONS,
    get_session,
    start_session,
    stop_session,
)


@pytest.fixture(autouse=True)
def _isolate_state():
    """Reset shared session state and make sure no session/thread leaks."""
    reset_all_session_states()
    ConsoleManager.reset()
    yield
    # Stop anything left running so no daemon thread outlives the test.
    for sid in list(_SESSIONS.keys()):
        stop_session(sid)
    reset_all_session_states()
    ConsoleManager.reset()


def _blank_buffer() -> bytes:
    return bytes([0x20] * 1000)  # screencode space


def _buffer_with_row(row: int, text: str) -> bytes:
    """A 1000-byte screencode buffer, blank except `text` written at `row`."""
    buf = bytearray(_blank_buffer())
    start = row * 40
    line = text[:40].ljust(40)
    for i, ch in enumerate(line):
        buf[start + i] = ascii_to_screencode(ord(ch))
    return bytes(buf)


def _make_tutorial(n_steps: int = 2) -> Tutorial:
    return Tutorial(
        id="tut-test",
        title="Test tutorial",
        blurb="For unit tests",
        steps=[
            Step(hint=f"Step {i + 1} hint text", verify=always_manual())
            for i in range(n_steps)
        ],
    )


# ----------------------------------------------------------------------
# _tick(): direct, synchronous, no thread
# ----------------------------------------------------------------------


class TestTick:
    def test_tick_pushes_current_hint_into_toaster(self, monkeypatch):
        pushed = {}

        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: _blank_buffer(),
        )

        def _capture_send(screen_data, color_data):
            pushed["screen"] = screen_data
            pushed["color"] = color_data

        monkeypatch.setattr(network_helper, "send_screen_data", _capture_send)

        tutorial = _make_tutorial()
        session = TutorialSession(tutorial, session_id=1)
        session._tick()

        assert "screen" in pushed
        text = Screen(pushed["screen"]).text
        assert "Step 1 hint text" in text

    def test_tick_noop_when_no_host_configured(self, monkeypatch):
        calls = []
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda *a, **kw: calls.append("dma_read") or _blank_buffer(),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda *a, **kw: calls.append("send"),
        )

        session = TutorialSession(_make_tutorial(), session_id=1)
        session._tick()

        assert calls == []  # nothing was read or sent

    def test_tick_transport_error_is_not_swallowed_by_tick_itself(self, monkeypatch):
        """_tick() itself may raise -- only _safe_tick()/_run() must swallow it."""
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")

        def _boom(*a, **kw):
            raise ConnectionError("host unreachable")

        monkeypatch.setattr(network_helper, "dma_read_memory", _boom)

        session = TutorialSession(_make_tutorial(), session_id=1)
        with pytest.raises(ConnectionError):
            session._tick()

    def test_safe_tick_swallows_transport_error(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")

        def _boom(*a, **kw):
            raise ConnectionError("host unreachable")

        monkeypatch.setattr(network_helper, "dma_read_memory", _boom)

        session = TutorialSession(_make_tutorial(), session_id=1)
        session._safe_tick()  # must not raise


# ----------------------------------------------------------------------
# Nav: next/back/repeat/show, called directly (no background thread)
# ----------------------------------------------------------------------


class TestNav:
    def _wire_network(self, monkeypatch):
        pushed = {}
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: _blank_buffer(),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.update(
                screen=screen_data, color=color_data
            ),
        )
        return pushed

    def test_next_advances_step_and_repaints(self, monkeypatch):
        pushed = self._wire_network(monkeypatch)
        session = TutorialSession(_make_tutorial(3), session_id=1)

        session.next()

        text = Screen(pushed["screen"]).text
        assert "Step 2 hint text" in text

    def test_back_floors_at_zero(self, monkeypatch):
        pushed = self._wire_network(monkeypatch)
        session = TutorialSession(_make_tutorial(3), session_id=1)

        session.back()  # already at step 0, must not go negative

        text = Screen(pushed["screen"]).text
        assert "Step 1 hint text" in text

    def test_next_then_back_returns_to_first_step(self, monkeypatch):
        pushed = self._wire_network(monkeypatch)
        session = TutorialSession(_make_tutorial(3), session_id=1)

        session.next()
        session.back()

        text = Screen(pushed["screen"]).text
        assert "Step 1 hint text" in text

    def test_repeat_repaints_same_step(self, monkeypatch):
        pushed = self._wire_network(monkeypatch)
        session = TutorialSession(_make_tutorial(2), session_id=1)

        session.next()
        pushed.clear()
        session.repeat()

        text = Screen(pushed["screen"]).text
        assert "Step 2 hint text" in text

    def test_show_with_no_demo_keys_sends_nothing(self, monkeypatch):
        keys_sent = []
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "send_c64_keyboard_input",
            lambda *a, **kw: keys_sent.append(a),
        )
        # _make_tutorial()'s steps have no demo_keys set.
        session = TutorialSession(_make_tutorial(), session_id=1)

        result = session.show()

        assert "no demo" in result.lower()
        assert keys_sent == []

    def test_show_with_demo_keys_types_exactly_those_bytes(self, monkeypatch):
        keys_sent = []
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "send_c64_keyboard_input",
            lambda data, host=None: keys_sent.append(data),
        )
        session = TutorialSession(tut2, session_id=1)  # step 1 demo_keys = b"help\r"

        result = session.show()

        assert keys_sent == [b"help\r"]
        assert "typing" in result.lower()

    def test_show_swallows_transport_error(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")

        def _boom(*a, **kw):
            raise ConnectionError("host unreachable")

        monkeypatch.setattr(network_helper, "send_c64_keyboard_input", _boom)
        session = TutorialSession(tut2, session_id=1)

        result = session.show()  # must not raise

        assert "couldn't reach" in result.lower()

    def test_next_past_last_step_completes_and_stops(self, monkeypatch):
        self._wire_network(monkeypatch)
        tutorial = _make_tutorial(2)
        session = start_session(tutorial, session_id=42, poll_interval=100)

        session.next()  # step 1 -> step 2 (last)
        session.next()  # past the last step -> complete

        assert session.is_completed() is True
        assert get_session(42) is None  # removed from the registry by stop()


# ----------------------------------------------------------------------
# stop(): clean-frame push + idempotency
# ----------------------------------------------------------------------


class TestStop:
    def test_stop_pushes_a_clean_frame_with_no_overlay(self, monkeypatch):
        pushed = {}
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: _blank_buffer(),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.update(
                screen=screen_data, color=color_data
            ),
        )

        session = start_session(_make_tutorial(), session_id=7, poll_interval=100)
        pushed.clear()
        session.stop()

        # The clean frame has no toaster box -- just the blank buffer we
        # fed dma_read_memory, unmodified.
        assert pushed["screen"] == _blank_buffer()

    def test_stop_is_idempotent(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        session = start_session(_make_tutorial(), session_id=8, poll_interval=100)

        session.stop()
        session.stop()  # must not raise / double-join

    def test_stop_removes_from_registry(self, monkeypatch):
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
        start_session(_make_tutorial(), session_id=9, poll_interval=100)

        assert get_session(9) is not None
        stop_session(9)
        assert get_session(9) is None


# ----------------------------------------------------------------------
# Background thread: starts, ticks at least once, stop() joins cleanly
# ----------------------------------------------------------------------


class TestBackgroundThread:
    def test_thread_ticks_and_stops_cleanly(self, monkeypatch):
        pushed = []
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: _blank_buffer(),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.append(screen_data),
        )

        session = start_session(_make_tutorial(), session_id=10, poll_interval=0.05)
        time.sleep(0.2)
        stop_session(10)

        assert len(pushed) >= 1
        assert get_session(10) is None

    def test_thread_survives_host_unreachable(self, monkeypatch):
        """A transport error on every tick must not crash the poll thread."""
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")

        def _boom(*a, **kw):
            raise ConnectionError("host unreachable")

        monkeypatch.setattr(network_helper, "dma_read_memory", _boom)

        session = start_session(_make_tutorial(), session_id=11, poll_interval=0.05)
        time.sleep(0.2)

        # Thread must still be alive (not crashed) before we stop it.
        assert session._thread.is_alive()
        stop_session(11)


# ----------------------------------------------------------------------
# paint_toaster parity with the pre-existing server_console alias
# ----------------------------------------------------------------------


def test_paint_toaster_matches_server_console_alias():
    from sdk.server_console import _render_toast_box
    from sdk.toaster import paint_toaster

    scr_a = bytearray([0x20] * 1000)
    col_a = bytearray([14] * 1000)
    scr_b = bytearray(scr_a)
    col_b = bytearray(col_a)

    paint_toaster(scr_a, col_a, "Type help for the command cheat-sheet.")
    _render_toast_box(scr_b, col_b, "Type help for the command cheat-sheet.")

    assert bytes(scr_a) == bytes(scr_b)
    assert bytes(col_a) == bytes(col_b)


# ----------------------------------------------------------------------
# tut1 / tut2 content registration
# ----------------------------------------------------------------------


def test_tut2_is_registered_with_four_steps():
    from tutorials import TUTORIALS

    assert "tut2" in TUTORIALS
    assert TUTORIALS["tut2"] is tut2
    assert len(TUTORIALS["tut2"].steps) == 4


def test_tut1_is_registered_with_seven_steps():
    from tutorials import TUTORIALS

    assert "tut1" in TUTORIALS
    assert TUTORIALS["tut1"] is tut1
    assert len(TUTORIALS["tut1"].steps) == 7


def test_tut2_step1_verify_true_on_help_body_text():
    # The real HELP_TEXT body copy ("...is sent to the AI assistant...")
    # -- placed away from row 0 the way it really renders (lower/left of
    # the toaster box footprint).
    screen = Screen(_buffer_with_row(14, "is sent to the AI assistant, so the"))
    assert tut2.steps[0].verify(screen) is True
    assert tut2.steps[0].verify(Screen(_blank_buffer())) is False


def test_tut2_step1_verify_false_on_tutorials_menu_header():
    # Regression for the real hardware bug: the tutorials menu header
    # ("HDN Shell RR - Tutorials") is still on screen the instant tut2's
    # step 1 becomes current (the user just typed "tut2" from that
    # menu) -- it must NOT satisfy step 1's verify.
    screen = Screen(_buffer_with_row(0, "HDN Shell RR - Tutorials"))
    assert tut2.steps[0].verify(screen) is False


def test_tut2_step4_is_always_manual():
    # Last step stays manual ("press q") regardless of screen content.
    screen = Screen(_buffer_with_row(0, "HDN Shell RR - Help Help topics memcpy"))
    assert tut2.steps[3].verify(screen) is False


# ----------------------------------------------------------------------
# CONFIRM latch (Task 3): _tick() calls step.verify() and, on a genuine
# True, moves the CURRENT step from SHOWING to CONFIRM -- it never moves
# `_step_index` itself any more; only next()/back() do that.
# ----------------------------------------------------------------------


class TestAutoAdvance:
    def _wire_network(self, monkeypatch, screen_bytes: bytes):
        pushed = {}
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: screen_bytes,
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.update(
                screen=screen_data, color=color_data
            ),
        )
        return pushed

    def test_tick_enters_confirm_when_verify_true(self, monkeypatch):
        # Row 14 -- clear of the toaster box footprint (top-right, ~rows 0-5).
        screen_bytes = _buffer_with_row(14, "is sent to the AI assistant")
        pushed = self._wire_network(monkeypatch, screen_bytes)
        session = TutorialSession(tut2, session_id=1)

        assert session._step_index == 0
        assert session._confirmed is False
        session._tick()

        assert session._step_index == 0  # index never moves via tick
        assert session._confirmed is True
        text = Screen(pushed["screen"]).text.lower()
        assert "done!" in text
        assert "press n for" in text
        assert "next." in text

    def test_tick_does_not_advance_when_verify_false(self, monkeypatch):
        pushed = self._wire_network(monkeypatch, _blank_buffer())
        session = TutorialSession(tut2, session_id=1)

        session._tick()

        assert session._step_index == 0
        assert session._confirmed is False
        text = Screen(pushed["screen"]).text
        assert "help" in text.lower()  # still step 1's hint

    def test_tick_never_moves_step_index_even_when_verify_stays_true(self, monkeypatch):
        """Task 3: the coach never auto-advances the index -- only next() does,
        even across many repeated ticks while CONFIRMed."""
        tutorial = Tutorial(
            id="tut-multi",
            title="t",
            blurb="t",
            steps=[
                Step(hint="one", verify=screen_contains("MARKER")),
                Step(hint="two", verify=screen_contains("MARKER")),
                Step(hint="three", verify=always_manual()),
            ],
        )
        screen_bytes = _buffer_with_row(14, "MARKER")
        self._wire_network(monkeypatch, screen_bytes)
        session = TutorialSession(tutorial, session_id=1)

        session._tick()
        assert session._step_index == 0
        assert session._confirmed is True

        for _ in range(5):
            session._tick()
        assert session._step_index == 0  # still step 0 -- never jumped to 1/2
        assert session._confirmed is True

    def test_tick_never_confirms_the_last_step(self, monkeypatch):
        tutorial = Tutorial(
            id="tut-last",
            title="t",
            blurb="t",
            steps=[Step(hint="only step", verify=screen_contains("MARKER"))],
        )
        screen_bytes = _buffer_with_row(14, "MARKER")
        self._wire_network(monkeypatch, screen_bytes)
        session = TutorialSession(tutorial, session_id=1)

        session._tick()

        assert session._step_index == 0
        assert session._confirmed is False  # last step never auto-confirms

    def test_verify_that_raises_does_not_crash_tick(self, monkeypatch):
        def _boom_verify(screen):
            raise ValueError("bad predicate")

        tutorial = Tutorial(
            id="tut-boom",
            title="t",
            blurb="t",
            steps=[
                Step(hint="Step 1 hint text", verify=_boom_verify),
                Step(hint="Step 2 hint text", verify=always_manual()),
            ],
        )
        pushed = self._wire_network(monkeypatch, _blank_buffer())
        session = TutorialSession(tutorial, session_id=1)

        session._tick()  # must not raise

        assert session._step_index == 0  # advance skipped
        assert session._confirmed is False
        text = Screen(pushed["screen"]).text
        assert "Step 1 hint text" in text  # hint still painted


# ----------------------------------------------------------------------
# Self-read regression (the hardware bug, Task 1): the coach must never
# match its OWN painted overlay text against verify(), including via a
# real DMA round-trip (write the box, then read that exact buffer back).
# ----------------------------------------------------------------------


class TestSelfReadRegression:
    def test_tick_does_not_match_a_dma_round_trip_of_its_own_box(self, monkeypatch):
        """
        Reproduces the real hardware cascade (tut2, 2026-07-16 trace):
        step 2's own SHOWING hint text is 'Type "help topics", then "help
        <topic>".' which CONTAINS the string "help topics" -- exactly
        what step 2's verify checks for. Tick 1 paints that hint into the
        (blank) screen and pushes it; tick 2 is fed that EXACT pushed
        buffer back as the live DMA read (the real hardware round-trip),
        simulating what the C64U would echo back. Without Task 1's
        blanking, tick 2 would read its own hint text back and fire
        CONFIRM on nothing the user did.
        """
        state = {"screen": _blank_buffer(), "color": bytes([14] * 1000)}

        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: (
                state["screen"] if address == SCREEN_ADDR else state["color"]
            ),
        )

        def _capture_send(screen_data, color_data):
            state["screen"] = screen_data
            state["color"] = color_data

        monkeypatch.setattr(network_helper, "send_screen_data", _capture_send)

        session = TutorialSession(tut2, session_id=1)
        session._step_index = 1  # step 2: "help topics" hint / verify collision
        session._confirmed = False
        session._entry_satisfied = False

        session._tick()  # tick 1: paints step 2's own hint box (contains "help topics")
        assert session._step_index == 1
        assert session._confirmed is False

        session._tick()  # tick 2: DMA-reads back tick 1's own pushed buffer verbatim
        assert session._step_index == 1  # never moved by tick, ever
        assert session._confirmed is False  # and must NOT have self-matched


# ----------------------------------------------------------------------
# Entry suppression (Task 2): a step that becomes current with its own
# verify already true (pre-existing/leftover screen content) must not
# fire CONFIRM until the match goes False and then True again.
# ----------------------------------------------------------------------


class TestEntrySuppression:
    def _wire_network(self, monkeypatch, screen_provider):
        pushed = {}
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: screen_provider(),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.update(
                screen=screen_data, color=color_data
            ),
        )
        return pushed

    def _tutorial(self):
        return Tutorial(
            id="tut-entry",
            title="t",
            blurb="t",
            steps=[
                Step(hint="one", verify=screen_contains("MARKER")),
                Step(hint="two", verify=always_manual()),
            ],
        )

    def test_pre_existing_match_at_start_does_not_enter_confirm(self, monkeypatch):
        screen_bytes = _buffer_with_row(14, "MARKER")
        self._wire_network(monkeypatch, lambda: screen_bytes)

        session = TutorialSession(self._tutorial(), session_id=1)
        session._latch_entry_satisfied()  # simulate "on start" (see start()'s docstring)
        assert session._entry_satisfied is True

        session._tick()

        assert session._confirmed is False  # stale pre-existing match suppressed
        assert session._step_index == 0

    def test_suppression_clears_after_false_then_fires_on_true_again(self, monkeypatch):
        state = {"screen": _buffer_with_row(14, "MARKER")}
        self._wire_network(monkeypatch, lambda: state["screen"])

        session = TutorialSession(self._tutorial(), session_id=1)
        session._latch_entry_satisfied()
        assert session._entry_satisfied is True

        session._tick()
        assert session._confirmed is False  # still suppressed (match never went away)

        state["screen"] = _blank_buffer()
        session._tick()
        assert session._confirmed is False
        assert session._entry_satisfied is False  # cleared -- verify went False

        state["screen"] = _buffer_with_row(14, "MARKER")
        session._tick()
        assert session._confirmed is True  # genuine transition: now allowed to fire


# ----------------------------------------------------------------------
# Genuine detection (no pre-existing match): _tick() enters CONFIRM the
# moment a real match appears, the step index stays put, and only next()
# advances it (to the next step, in SHOWING state).
# ----------------------------------------------------------------------


class TestGenuineDetection:
    def test_entry_clean_then_real_match_confirms_then_next_advances(self, monkeypatch):
        state = {"screen": _blank_buffer()}
        pushed = {}
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: state["screen"],
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda screen_data, color_data: pushed.update(
                screen=screen_data, color=color_data
            ),
        )

        session = TutorialSession(tut2, session_id=1)
        session._latch_entry_satisfied()  # nothing on screen yet
        assert session._entry_satisfied is False

        session._tick()
        assert session._confirmed is False
        assert session._step_index == 0

        # A real match appears outside the box footprint (row 14).
        state["screen"] = _buffer_with_row(14, "is sent to the AI assistant")
        session._tick()
        assert session._confirmed is True
        assert session._step_index == 0  # still unchanged -- CONFIRM, not advance

        ack = session.next()
        assert session._step_index == 1
        assert session._confirmed is False  # SHOWING on the new step
        assert "step 2" in ack.lower()


# ----------------------------------------------------------------------
# toaster_box_rect-based blanking (Task 1 building block): text painted
# inside the box area must be invisible to verify().
# ----------------------------------------------------------------------


class TestVerifyViewBlanking:
    def test_box_region_text_never_satisfies_verify(self):
        session = TutorialSession(_make_tutorial(2), session_id=1)
        rect = toaster_box_rect(session._current_hint())
        assert rect is not None
        row, col, _height, _width = rect

        screen = bytearray(_blank_buffer())
        for i, ch in enumerate("ZAPPO"):
            screen[(row + 1) * 40 + col + 1 + i] = ascii_to_screencode(ord(ch))
        session._last_box_rect = rect

        predicate = screen_contains("ZAPPO")
        # Sanity: without blanking, the raw screen WOULD have matched.
        assert predicate(Screen(bytes(screen))) is True

        verify_screen = session._verify_view(bytes(screen))
        assert predicate(verify_screen) is False


# ----------------------------------------------------------------------
# Off-shell guard (Phase 3, plan §5.2/§10.1): _tick() must not paint or
# verify while a server console (File Editor/Browser/...) is active.
# ----------------------------------------------------------------------


class TestOffShellGuard:
    def test_tick_skips_paint_and_advance_when_off_shell(self, monkeypatch):
        send_calls = []
        monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "10.0.0.5")
        monkeypatch.setattr(
            network_helper,
            "dma_read_memory",
            lambda host, address, length: _buffer_with_row(14, "is sent to the AI assistant"),
        )
        monkeypatch.setattr(
            network_helper,
            "send_screen_data",
            lambda *a, **kw: send_calls.append(a),
        )

        session_id = 5
        ConsoleManager.instance()._active[session_id] = 4  # Browser is active
        session = TutorialSession(tut2, session_id=session_id)

        session._tick()

        assert send_calls == []  # never painted/pushed
        assert session._step_index == 0  # untouched
        assert session._confirmed is False  # never confirmed, even though verify(screen) is True

    def test_on_shell_true_when_never_switched(self):
        session = TutorialSession(tut2, session_id=6)
        assert session._on_shell(6) is True  # ConsoleManager._active has no entry

    def test_on_shell_true_after_returning_to_local(self):
        # Simulates command_handler.handle_local_command's
        # SERVER_CMD_RESTORE_SCREEN branch clearing the stale entry.
        session_id = 7
        ConsoleManager.instance()._active[session_id] = 4
        ConsoleManager.instance()._active.pop(session_id, None)
        session = TutorialSession(tut2, session_id=session_id)
        assert session._on_shell(session_id) is True

    def test_on_shell_false_while_server_console_active(self):
        session_id = 8
        ConsoleManager.instance()._active[session_id] = 2  # File Editor
        session = TutorialSession(tut2, session_id=session_id)
        assert session._on_shell(session_id) is False
