"""
Server console subclass for the Vibe Coding AI Chat (console 10).

Wraps the existing CodeChatHandler so it participates in the
ConsoleManager framework while keeping the same LLM-agent logic.
"""

import logging
from typing import Optional

from server_console import ServerConsole
from code_chat_handler import CodeChatHandler

logger = logging.getLogger(__name__)


class CodeChatConsole(ServerConsole):
    """
    Console 10 — Vibe Coding AI Chat.

    Overrides ``handle_text_input`` to forward the user's PETSCII text
    to ``CodeChatHandler``, write the exchange to the screen buffer,
    and return the PETSCII response.
    """

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        """
        Forward text input to the CodeChatHandler agent, write both
        the prompt and the response to this console's screen buffer,
        and return the PETSCII response bytes.
        """
        # Echo user input into the screen buffer
        self.write_petscii(data.rstrip(b"\x00"))
        self.newline()

        # Delegate to the existing CodeChatHandler
        response = CodeChatHandler.handle_text_input(data, self.session_id)

        # Write AI response into the screen buffer as well
        if response:
            self.write_petscii(response)
            self.newline()

        return response
