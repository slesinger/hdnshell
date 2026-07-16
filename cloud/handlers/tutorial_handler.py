"""
TutorialHandler - Handles the interactive tutorials menu and nav commands

Phase 1: menu + `tutN` start/stop bookkeeping only. No coach runner yet
(no background thread, no screen overlay) -- that lands in Phase 2+.
See TUTORIALS_PLAN.md sections 6, 7, 9.

Processes:
  - "tutorials" / "tutorial" / "tut"   -> the tutorials menu
  - "tut1".."tut5"                     -> start a tutorial (stub for now)
  - nav commands (n/b/s/r/q and the
    spelled-out forms), but ONLY while
    a tutorial is active for this
    session                           -> nav ack (stub for now)
"""

import logging

from sdk import BaseHandler
from sdk.shared_state import get_session_state_copy, update_session_state

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
            # Phase 1 stub: record the tutorial as active but don't start any
            # coach thread yet. Real session lifecycle lands in Phase 2.
            update_session_state(session_id, tutorial_active=True, tutorial_id=tut_id)
            return f"{tut_id} not yet implemented (coach coming in Phase 2). Type q to quit."

        if word in NAV_QUIT:
            update_session_state(session_id, tutorial_active=False, tutorial_id=None)
            return "Tutorial ended."

        if word in NAV_WORDS:
            # n/b/s/r and their spelled-out forms: real routing to a live
            # TutorialSession lands in Phase 2.
            return "(coach not running yet)"

        # Should not be reached given can_handle's contract, but stay safe.
        logger.warning(f"TutorialHandler.handle called with unrecognised text: {text!r}")
        return format_menu()
