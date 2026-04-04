"""
Request dispatcher for C64 HDN Cloud Server.

Dispatches text input requests to the appropriate handler.
"""

import logging
import os
import sys
import importlib
from typing import List

from base_handler import BaseHandler
from shared_state import get_session_state

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_HANDLERS_DIR = os.path.join(_CLOUD_DIR, "handlers")
if _HANDLERS_DIR not in sys.path:
    sys.path.insert(0, _HANDLERS_DIR)

ChatHandler = importlib.import_module("chat_handler").ChatHandler
HelpHandler = importlib.import_module("help_handler").HelpHandler
PythonEvalHandler = importlib.import_module("python_eval_handler").PythonEvalHandler
CSDBHandler = importlib.import_module("csdb_handler").CSDBHandler

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
            # Order matters - first matching handler will process the request
            self.handlers = [
                HelpHandler(),
                PythonEvalHandler(),
                ChatHandler(),
                CSDBHandler(),
            ]
            logger.info(f"Initialized {len(self.handlers)} request handlers")
        except Exception as e:
            logger.error(f"Error initializing handlers: {e}")
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
            # Convert PETSCII to UTF-8
            utf8_text = BaseHandler.petscii_to_utf8(petscii_text.rstrip(b"\x00"))
            logger.info(f"Session {session_id}: Received: '{utf8_text}'")

            # Find appropriate handler
            for handler in self.handlers:
                if handler.can_handle(utf8_text, session_id):
                    logger.info(f"Dispatching to {handler.__class__.__name__}")
                    response_text = handler.handle(utf8_text, session_id)
                    logger.info(f"Response: '{response_text[:100]}...'")
                    # Convert response back to PETSCII
                    return BaseHandler.utf8_to_petscii(response_text)

            # If no handler claims it, but a module is active, send it to that module's handler
            state = get_session_state(session_id)
            active_module = state.get("active_module")
            if active_module:
                for handler in self.handlers:
                    # A bit of a hack to see which handler corresponds to the module
                    if (active_module == "c" and isinstance(handler, CSDBHandler)) or (
                        active_module == "i" and isinstance(handler, ChatHandler)
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
