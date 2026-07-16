"""
TutorialHandler - Handles the interactive tutorials menu and nav commands

Phase 2: menu + `tutN` start wired to a real `TutorialSession` coach
runner (background poll thread, screen overlay) -- manual advance only,
no `verify`/auto-advance/demo-typing yet (that's Phase 3). See
TUTORIALS_PLAN.md sections 6, 7, 9.

Processes:
  - "tutorials" / "tutorial" / "tut"   -> the tutorials menu
  - "tut1".."tut5"                     -> start the tutorial's TutorialSession
                                           (only tut2 has content so far;
                                           the rest reply "not available yet")
  - nav commands (n/b/s/r/q and the
    spelled-out forms), but ONLY while
    a tutorial is active for this
    session                           -> routed to the live TutorialSession
"""

import logging

from sdk import BaseHandler
from sdk.shared_state import get_session_state_copy, update_session_state
from tutorials import TUTORIALS
from tutorials.session import get_session, start_session, stop_session

logger = logging.getLogger(__name__)

# Menu word variants that show the tutorials menu.
MENU_WORDS = {"tutorials", "tutorial", "tut"}

# Number of tutorials currently offered (tut1..tut5). See TUTORIALS_PLAN.md §7/§8.
NUM_TUTORIALS = 5

# Nav commands, single-letter and spelled-out forms (TUTORIALS_PLAN.md §6).
# Only claimed via can_handle() while a tutorial is active for the session
# (risk §10.4: these must not shadow BASIC / other one-letter uses).
NAV_QUIT = {"q", "quit"}
NAV_NEXT = {"n", "next"}
NAV_BACK = {"b", "back"}
NAV_SHOW = {"s", "show"}
NAV_REPEAT = {"r", "repeat"}
NAV_WORDS = NAV_QUIT | NAV_NEXT | NAV_BACK | NAV_SHOW | NAV_REPEAT

# The §7 menu text, reproduced verbatim.
MENU_TEXT = """HDN Shell RR - Tutorials

 tut1  Disks & games: browse, mount, run
 tut2  Getting help
 tut3  Ask me anything (AI chat & tools)
 tut4  Find a demo on CSDB, run & keep it
 tut5  Live on your C64 (the full tour)

Type e.g. tut1 to start.
In a tutorial: n next, b back,
s show me, r repeat, q quit."""


def format_menu() -> str:
    """Build the tutorials menu text (see TUTORIALS_PLAN.md §7)."""
    return MENU_TEXT


def _tut_id_if_valid(word: str):
    """Return "tutN" if word is a valid tutN (1..NUM_TUTORIALS) id, else None."""
    if not word.startswith("tut"):
        return None
    suffix = word[3:]
    if not suffix.isdigit():
        return None
    n = int(suffix)
    if 1 <= n <= NUM_TUTORIALS:
        return f"tut{n}"
    return None


class TutorialHandler(BaseHandler):
    """Handler for the tutorials menu, tutN start, and in-tutorial nav commands."""

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Check if text is a tutorials menu word, a tutN start command, or
        (only while a tutorial is active for this session) a nav command.

        Args:
            text: UTF-8 text to check
            session_id: The session ID (used to gate nav commands on
                whether a tutorial is currently active)

        Returns:
            True if this handler should process the text
        """
        word = text.strip().lower()

        if word in MENU_WORDS:
            return True

        if _tut_id_if_valid(word) is not None:
            return True

        if word in NAV_WORDS:
            state = get_session_state_copy(session_id)
            return bool(state.get("tutorial_active"))

        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Process a tutorials menu/start/nav request.

        Args:
            text: UTF-8 text (validated by can_handle)
            session_id: The session ID

        Returns:
            UTF-8 response text
        """
        word = text.strip().lower()

        if word in MENU_WORDS:
            return format_menu()

        tut_id = _tut_id_if_valid(word)
        if tut_id is not None:
            tutorial = TUTORIALS.get(tut_id)
            if tutorial is None:
                # tut1/tut3/tut4/tut5 content isn't authored yet (Phase 4+);
                # don't mark a tutorial active if there's nothing to run.
                return f"{tut_id} is not available yet."
            update_session_state(session_id, tutorial_active=True, tutorial_id=tut_id)
            start_session(tutorial, session_id)
            return f"Started {tut_id}. Follow the hint box; n next, b back, q quit."

        if word in NAV_QUIT:
            stop_session(session_id)
            update_session_state(session_id, tutorial_active=False, tutorial_id=None)
            return "Tutorial ended."

        if word in NAV_WORDS:
            session = get_session(session_id)
            if session is None:
                # Stale state (e.g. the session was cleared by a power
                # cycle/reset elsewhere) -- clear the flag and bail out
                # gently rather than routing nav commands nowhere.
                update_session_state(session_id, tutorial_active=False, tutorial_id=None)
                return "No tutorial running."

            if word in NAV_NEXT:
                ack = session.next()
            elif word in NAV_BACK:
                ack = session.back()
            elif word in NAV_REPEAT:
                ack = session.repeat()
            else:
                assert word in NAV_SHOW
                ack = session.show()

            if session.is_completed():
                update_session_state(session_id, tutorial_active=False, tutorial_id=None)

            return ack

        # Should not be reached given can_handle's contract, but stay safe.
        logger.warning(f"TutorialHandler.handle called with unrecognised text: {text!r}")
        return format_menu()
