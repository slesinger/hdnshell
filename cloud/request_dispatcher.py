"""
Request dispatcher for HDN Server.

Dispatches text input requests to the appropriate handler.
"""

import logging
import os
import sys
import importlib
from typing import List

from sdk.base_handler import BaseHandler
from sdk.shared_state import get_session_state_copy, update_session_state

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

ChatHandler = importlib.import_module("chat_handler").ChatHandler
HelpHandler = importlib.import_module("help_handler").HelpHandler
TutorialHandler = importlib.import_module("tutorial_handler").TutorialHandler
PythonEvalHandler = importlib.import_module("python_eval_handler").PythonEvalHandler
UltimateHandler = importlib.import_module("ultimate_handler").UltimateHandler
CSDBHandler = importlib.import_module("csdb_handler").CSDBHandler
NetDriveHandler = importlib.import_module("netdrive_handler").NetDriveHandler

logger = logging.getLogger(__name__)


class RequestDispatcher:
    """Dispatches text input requests to appropriate handlers"""

    def __init__(self):
        """Initialize dispatcher with all available handlers"""
        self.handlers: List[BaseHandler] = []
        self._initialize_handlers()

    def _initialize_handlers(self):
        """Initialize all request handlers in priority order"""
        try:
            # Order matters - first matching handler will process the request.
            # TutorialHandler is checked right after HelpHandler, before the
            # AI/CSDB/NetDrive catch-alls (TUTORIALS_PLAN.md §6): it only
            # claims the tutorials menu words / tutN, plus the single-letter
            # nav commands (n/b/s/r/q) -- and even those only while a
            # tutorial is active for the session (see can_handle), so it
            # never shadows BASIC or the other handlers otherwise.
            # UltimateHandler (mkdir/memcpy) MUST stay before CSDBHandler and
            # NetDriveHandler: those two claim *any* line once their module is
            # active (the active_module catch-all below), so if they preceded
            # UltimateHandler a `mkdir`/`memcpy` typed while #c/#n is active
            # would be silently swallowed by the wrong handler.
            self.handlers = [
                HelpHandler(),
                TutorialHandler(),
                PythonEvalHandler(),
                ChatHandler(),
                UltimateHandler(),
                CSDBHandler(),
                NetDriveHandler(),
            ]
            logger.info(f"Initialized {len(self.handlers)} request handlers")
        except Exception:
            logger.exception("Error initializing handlers")
            self.handlers = []

    def dispatch(self, petscii_text: bytes, session_id: int = 0) -> bytes:
        """
        Dispatch request to appropriate handler

        Args:
            petscii_text: PETSCII encoded text input (null-terminated)
            session_id: The session ID for the request

        Returns:
            PETSCII encoded response
        """
        try:
            raw = petscii_text.rstrip(b"\x00")

            # Step 21: optional cwd CONTEXT frame from the cartridge, shape:
            #   \x01 <cwd-ascii> \x01 <command line (PETSCII)>
            # The wedge front-prepends this for mkdir/memcpy on a UCI-DOS drive so the
            # server can resolve a relative path against the C64's current directory.
            # The cwd comes from UCI GET_PATH as raw ASCII; the command line is PETSCII
            # as always -> each half is decoded with its OWN codec, never one pass over
            # both (a single PETSCII pass would mangle the mixed-case ASCII path).
            dos_cwd = None
            if raw[:1] == b"\x01":
                end = raw.find(b"\x01", 1)
                if end != -1:
                    dos_cwd = raw[1:end].decode("latin-1", errors="replace")
                    raw = raw[end + 1:]

            # Convert PETSCII to UTF-8
            utf8_text = BaseHandler.petscii_to_utf8(raw)

            # Record (or clear) this session's cwd context so UltimateHandler can turn a
            # relative mkdir/memcpy path into an absolute one. Set every request (value
            # or None) so a stale cwd never leaks into a later un-framed command.
            update_session_state(session_id, dos_cwd=dos_cwd)

            logger.info(f"Session {session_id}: Received: '{utf8_text}'"
                        + (f" (cwd={dos_cwd})" if dos_cwd else ""))

            # Find appropriate handler
            for handler in self.handlers:
                if handler.can_handle(utf8_text, session_id):
                    logger.info(f"Dispatching to {handler.__class__.__name__}")
                    response_text = handler.handle(utf8_text, session_id)
                    logger.info(f"Response: '{response_text[:100]}...'")
                    # Convert response back to PETSCII
                    return BaseHandler.utf8_to_petscii(response_text)

            # If no handler claims it, but a module is active, send it to that module's handler
            state = get_session_state_copy(session_id)
            active_module = state.get("active_module")
            if active_module:
                for handler in self.handlers:
                    # A bit of a hack to see which handler corresponds to the module
                    if (
                        (active_module == "c" and isinstance(handler, CSDBHandler))
                        or (active_module == "n" and isinstance(handler, NetDriveHandler))
                        or (active_module == "i" and isinstance(handler, ChatHandler))
                    ):
                        logger.info(
                            f"Dispatching to active module handler {handler.__class__.__name__}"
                        )
                        response_text = handler.handle(utf8_text, session_id)
                        logger.info(f"Response: '{response_text[:100]}...'")
                        return BaseHandler.utf8_to_petscii(response_text)

            # Default response if no handler is found
            logger.warning("No handler found for the request.")
            return BaseHandler.utf8_to_petscii("?ERROR")

        except Exception as e:
            logger.error(f"Error during dispatch: {e}", exc_info=True)
            return BaseHandler.utf8_to_petscii(f"Server error: {str(e)}")
