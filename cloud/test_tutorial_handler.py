"""
Unit tests for TutorialHandler (Phase 3: menu + tutN start wired to a real
TutorialSession coach runner, including verify/auto-advance + `s` demo
typing -- see TUTORIALS_PLAN.md §9 Phase 3).

No hardware: `sdk.network_helper.read_last_c64_ip` is monkeypatched to ""
for every test in this file (autouse fixture) so a started TutorialSession's
background thread never performs a real DMA/REST call -- its `_tick()`
returns immediately (see tutorials.session.TutorialSession._tick). Any
session started during a test is stopped in the fixture teardown so no
daemon thread outlives the test.
"""

import os
import sys

import pytest

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

from tutorial_handler import TutorialHandler  # noqa: E402
from sdk.shared_state import (  # noqa: E402
    get_session_state_copy,
    reset_all_session_states,
)
import sdk.network_helper as network_helper  # noqa: E402
from tutorials.session import _SESSIONS, stop_session  # noqa: E402


@pytest.fixture(autouse=True)
def _isolate_session_state(monkeypatch):
    """
    Session state is module-global; reset it so tests don't leak into each
    other. Also stub out the C64 host so any TutorialSession started
    during a test never makes a real network call, and stop any session
    left running afterwards so no daemon thread outlives the test.
    """
    reset_all_session_states()
    monkeypatch.setattr(network_helper, "read_last_c64_ip", lambda: "")
    yield
    for sid in list(_SESSIONS.keys()):
        stop_session(sid)
    reset_all_session_states()


SESSION_ID = 42


class TestCanHandleMenuAndStart:
    def test_menu_words(self):
        handler = TutorialHandler()
        assert handler.can_handle("tutorials")
        assert handler.can_handle("TUT")
        assert handler.can_handle("tutorial")
        assert handler.can_handle("  tutorials  ")

    def test_tut_n_words(self):
        handler = TutorialHandler()
        for n in range(1, 6):
            assert handler.can_handle(f"tut{n}")
            assert handler.can_handle(f"TUT{n}")

    def test_tut_out_of_range_or_malformed(self):
        handler = TutorialHandler()
        assert not handler.can_handle("tut6")
        assert not handler.can_handle("tut0")
        assert handler.can_handle("tut")  # bare "tut" is a menu word, not tutN
        assert not handler.can_handle("tutx")
        assert not handler.can_handle("tut12")

    def test_random_text(self):
        handler = TutorialHandler()
        assert not handler.can_handle("hello there")
        assert not handler.can_handle("help")
        assert not handler.can_handle("")


class TestNavGating:
    def test_nav_false_when_no_tutorial_active(self):
        handler = TutorialHandler()
        assert not handler.can_handle("n", SESSION_ID)
        assert not handler.can_handle("b", SESSION_ID)
        assert not handler.can_handle("s", SESSION_ID)
        assert not handler.can_handle("r", SESSION_ID)
        assert not handler.can_handle("q", SESSION_ID)
        assert not handler.can_handle("next", SESSION_ID)

    def test_nav_true_once_tutorial_active(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        assert handler.can_handle("n", SESSION_ID)
        assert handler.can_handle("b", SESSION_ID)
        assert handler.can_handle("s", SESSION_ID)
        assert handler.can_handle("r", SESSION_ID)
        assert handler.can_handle("q", SESSION_ID)
        assert handler.can_handle("next", SESSION_ID)
        assert handler.can_handle("back", SESSION_ID)
        assert handler.can_handle("show", SESSION_ID)
        assert handler.can_handle("repeat", SESSION_ID)
        assert handler.can_handle("quit", SESSION_ID)

    def test_nav_false_again_after_quit(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        assert handler.can_handle("n", SESSION_ID)
        handler.handle("q", SESSION_ID)
        assert not handler.can_handle("n", SESSION_ID)

    def test_nav_gating_is_per_session(self):
        handler = TutorialHandler()
        other_session = 99
        handler.handle("tut2", SESSION_ID)
        assert handler.can_handle("n", SESSION_ID)
        assert not handler.can_handle("n", other_session)

    def test_nav_false_for_unavailable_tutorial(self):
        """tut3 has no content yet -- starting it must NOT arm nav gating."""
        handler = TutorialHandler()
        handler.handle("tut3", SESSION_ID)
        assert not handler.can_handle("n", SESSION_ID)


class TestHandleMenu:
    def test_menu_contains_all_tutorial_lines(self):
        handler = TutorialHandler()
        response = handler.handle("tutorials")
        for n in range(1, 6):
            assert f"tut{n}" in response

    def test_menu_contains_nav_footer(self):
        handler = TutorialHandler()
        response = handler.handle("tutorials")
        assert "n next" in response
        assert "b back" in response
        assert "s show me" in response
        assert "r repeat" in response
        assert "q quit" in response

    def test_menu_contains_start_hint(self):
        handler = TutorialHandler()
        response = handler.handle("tutorials")
        assert "tut1" in response and "to start" in response


class TestHandleStartTutorial:
    def test_start_sets_session_state(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        state = get_session_state_copy(SESSION_ID)
        assert state["tutorial_active"] is True
        assert state["tutorial_id"] == "tut2"

    def test_start_returns_ack_mentioning_tutorial(self):
        handler = TutorialHandler()
        response = handler.handle("tut2", SESSION_ID)
        assert "tut2" in response
        assert "q" in response.lower()

    def test_start_registers_a_live_session(self):
        from tutorials.session import get_session

        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        assert get_session(SESSION_ID) is not None

    def test_unavailable_tutorial_does_not_activate(self):
        handler = TutorialHandler()
        for tut_id in ("tut3", "tut4", "tut5"):
            response = handler.handle(tut_id, SESSION_ID)
            assert "not available yet" in response
            state = get_session_state_copy(SESSION_ID)
            assert state["tutorial_active"] is False
            assert state["tutorial_id"] is None

    def test_starting_a_new_tutorial_stops_the_previous_session(self):
        from tutorials.session import get_session

        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        first_session = get_session(SESSION_ID)

        handler.handle("tut2", SESSION_ID)
        second_session = get_session(SESSION_ID)

        assert second_session is not first_session


class TestHandleQuit:
    def test_quit_clears_session_state(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is True

        response = handler.handle("q", SESSION_ID)

        state = get_session_state_copy(SESSION_ID)
        assert state["tutorial_active"] is False
        assert state["tutorial_id"] is None
        assert "ended" in response.lower()

    def test_quit_stops_the_live_session(self):
        from tutorials.session import get_session

        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        handler.handle("q", SESSION_ID)
        assert get_session(SESSION_ID) is None


class TestHandleNav:
    def test_next_advances_and_returns_ack(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        response = handler.handle("n", SESSION_ID)
        assert response
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is True

    def test_back_and_repeat_return_acks_without_deactivating(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        handler.handle("n", SESSION_ID)
        assert handler.handle("b", SESSION_ID)
        assert handler.handle("r", SESSION_ID)
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is True

    def test_show_with_no_host_reports_unreachable(self):
        """No C64 host configured (autouse fixture) -> show() must not raise."""
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)  # step 1 has demo_keys
        response = handler.handle("s", SESSION_ID)
        assert "couldn't reach" in response.lower()

    def test_next_past_last_step_completes_and_clears_state(self):
        handler = TutorialHandler()
        handler.handle("tut2", SESSION_ID)
        for _ in range(4):  # tut2 has 4 steps
            handler.handle("n", SESSION_ID)

        state = get_session_state_copy(SESSION_ID)
        assert state["tutorial_active"] is False
        assert state["tutorial_id"] is None

    def test_nav_with_no_live_session_clears_stale_flag_gently(self):
        handler = TutorialHandler()
        # Force the state flag on without a live session (simulates a
        # stale flag left over from e.g. a server restart).
        from sdk.shared_state import update_session_state

        update_session_state(SESSION_ID, tutorial_active=True, tutorial_id="tut2")
        response = handler.handle("n", SESSION_ID)

        assert "no tutorial" in response.lower()
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is False


class TestDispatcherRouting:
    def test_dispatcher_routes_tutorials_to_tutorial_handler(self):
        from request_dispatcher import RequestDispatcher, TutorialHandler as DispatcherTutorialHandler
        from sdk.base_handler import BaseHandler

        dispatcher = RequestDispatcher()
        session_id = 123
        petscii = BaseHandler.utf8_to_petscii("tutorials") + b"\x00"
        response_petscii = dispatcher.dispatch(petscii, session_id)
        response = BaseHandler.petscii_to_utf8(response_petscii)
        assert "Tutorials" in response
        assert "tut1" in response

        handler_classes = [h.__class__ for h in dispatcher.handlers]
        assert DispatcherTutorialHandler in handler_classes
