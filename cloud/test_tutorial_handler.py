"""
Unit tests for TutorialHandler (Phase 1: menu + tutN stub + nav gating).

No coach thread exists yet in Phase 1, so these tests only cover
can_handle/handle contracts and session-state bookkeeping.
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


@pytest.fixture(autouse=True)
def _isolate_session_state():
    """Session state is module-global; reset it so tests don't leak into each other."""
    reset_all_session_states()
    yield
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

    def test_start_returns_stub_mentioning_tutorial(self):
        handler = TutorialHandler()
        response = handler.handle("tut2", SESSION_ID)
        assert "tut2" in response
        assert "q" in response.lower()


class TestHandleQuit:
    def test_quit_clears_session_state(self):
        handler = TutorialHandler()
        handler.handle("tut3", SESSION_ID)
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is True

        response = handler.handle("q", SESSION_ID)

        state = get_session_state_copy(SESSION_ID)
        assert state["tutorial_active"] is False
        assert state["tutorial_id"] is None
        assert "ended" in response.lower()

    def test_other_nav_returns_stub_ack(self):
        handler = TutorialHandler()
        handler.handle("tut1", SESSION_ID)
        response = handler.handle("n", SESSION_ID)
        assert response  # non-empty stub ack
        # Tutorial should still be active - only q/quit clears it.
        assert get_session_state_copy(SESSION_ID)["tutorial_active"] is True


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
