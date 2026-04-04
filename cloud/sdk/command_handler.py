"""
Command handler for C64 HDN Cloud Server.

Parses and dispatches command packets received from the C64 client.
"""

import logging
from typing import Optional, Tuple

from .generate_pet_asc_table import Petscii
from .console_manager import ConsoleManager, MIN_CONSOLE_ID, MAX_CONSOLE_ID
from .network_helper import send_screen_data
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from request_dispatcher import RequestDispatcher

logger = logging.getLogger(__name__)

# Protocol constants
MAGIC_BYTES = bytes([0xFE])

# Server command IDs (sent inside a COMMAND packet)
SERVER_CMD_GET_SCREEN = 0x01


class CommandID:
    """Command IDs from C64 client"""

    COMMAND = 0x00
    KEYPRESS = 0x01
    TEXT_INPUT = 0x02


class ResponseType:
    """Response types sent to C64"""

    PETSCII_NULL_TERMINATED = 0x01
    MIX_COMMANDS_SCREEN_CODES = 0x02
    MTEXT_FORMAT = 0x03


class ModifierFlags:
    """Modifier flags for keypress commands"""

    SHIFT = 0x01
    CTRL = 0x02
    COMMODORE = 0x04


class CommandHandler:
    """Handles processing of commands from C64 client"""

    # Class-level dispatcher instance
    _dispatcher = None

    @classmethod
    def get_dispatcher(cls):
        """Get or create the request dispatcher instance.
        
        Lazily imports RequestDispatcher from cloud/request_dispatcher.py.
        """
        if cls._dispatcher is None:
            # Import at runtime to avoid circular dependency
            from request_dispatcher import RequestDispatcher
            cls._dispatcher = RequestDispatcher()
        return cls._dispatcher

    @staticmethod
    def parse_packet(packet: bytes) -> Tuple[bytes, int, bytes]:
        """
        Parse a command packet from C64

        Args:
            packet: Raw packet bytes

        Returns:
            Tuple of (magic_bytes, command_id, data)

        Raises:
            ValueError: If packet is invalid
        """
        if len(packet) < 3:
            raise ValueError("Packet too short")

        magic = packet[0 : len(MAGIC_BYTES)]
        if magic != MAGIC_BYTES:
            raise ValueError(f"Invalid magic bytes: {magic.hex()}")

        cmd_id = packet[len(MAGIC_BYTES)]
        data = packet[len(MAGIC_BYTES) + 1 :]

        return magic, cmd_id, data

    @staticmethod
    def handle_keypress(data: bytes) -> bytes:
        """
        Handle keypress command ($01)

        Args:
            data: Command data (1 byte PETSCII code + 1 byte modifier flags)

        Returns:
            Response packet
        """
        print(f"handle_keypress: data={data.hex()}")
        if len(data) < 2:
            logger.warning("Keypress data too short")
            return CommandHandler.create_response(
                ResponseType.PETSCII_NULL_TERMINATED, bytes([0x00])  # Empty response
            )

        petscii_code = data[0]
        modifiers = data[1]

        # Convert PETSCII to ASCII for logging
        ascii_code = Petscii.petscii2ascii(petscii_code)
        char = chr(ascii_code) if 32 <= ascii_code < 127 else f"<{ascii_code:02X}>"

        # Log the keypress
        mod_str = []
        if modifiers & ModifierFlags.SHIFT:
            mod_str.append("SHIFT")
        if modifiers & ModifierFlags.CTRL:
            mod_str.append("CTRL")
        if modifiers & ModifierFlags.COMMODORE:
            mod_str.append("C=")

        mod_desc = "+".join(mod_str) if mod_str else "none"
        logger.info(
            f"Keypress: {char} (PETSCII ${petscii_code:02X}), Modifiers: {mod_desc}"
        )

        # Create echo response
        response_text = f"key: {char}\r".encode("ascii")
        petscii_response = bytes([Petscii.ascii2petscii(b) for b in response_text])
        petscii_response += bytes([0x00])  # Null terminator

        return CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED, petscii_response
        )

    @staticmethod
    def handle_text_input(data: bytes, session_id: int = 0) -> bytes:
        """
        Handle text input by dispatching to appropriate handler
        """
        dispatcher = CommandHandler.get_dispatcher()
        return dispatcher.dispatch(data, session_id)

    @staticmethod
    def create_response(response_type: int, data: bytes) -> bytes:
        """
        Create a response packet

        Args:
            response_type: Type of response (ResponseType constant)
            data: Response data

        Returns:
            Complete response packet with magic bytes and type
        """
        # Null-terminate only if PETSCII_NULL_TERMINATED
        if response_type == ResponseType.PETSCII_NULL_TERMINATED:
            if not data or data[-1] != 0x00:
                data += bytes([0x00])
        # return MAGIC_BYTES + bytes([response_type]) + data
        return data[:-1]

    @staticmethod
    def is_server_console(console_id: int) -> bool:
        """Return True if console_id refers to a server-side console."""
        return MIN_CONSOLE_ID <= console_id <= MAX_CONSOLE_ID

    @staticmethod
    def handle_command(
        console_id: int, data: bytes, session_id: int = 0
    ) -> Optional[bytes]:
        """
        Handle a command for a server-side console.

        SERVER_CMD_GET_SCREEN is handled directly (returns screen + colour
        buffers).  All other commands are forwarded to the console's own
        ``handle_command`` method.

        Args:
            console_id: Server-console ID (1-10).
            data:       Command payload (first byte is the command code).
            session_id: Client session ID.

        Returns:
            Response bytes, or None.
        """
        mgr = ConsoleManager.instance()

        if data[0] == SERVER_CMD_GET_SCREEN:
            logger.info(f"GET_SCREEN for console {console_id}, session {session_id}")
            screen = mgr.get_screen_data(console_id, session_id)
            color = mgr.get_color_data(console_id, session_id)
            send_screen_data(screen, color)
            return None

        # Delegate to console-specific handler
        result = mgr.handle_command(console_id, session_id, data)
        if result is not None:
            return result

        logger.warning(f"Unhandled command 0x{data[0]:02X} for console {console_id}")
        return CommandHandler.create_response(
            ResponseType.PETSCII_NULL_TERMINATED, b"Unknown command"
        )

    @staticmethod
    def handle_console_keypress(
        console_id: int, data: bytes, session_id: int = 0
    ) -> Optional[bytes]:
        """
        Handle a keypress destined for a server-side console.

        Args:
            console_id: Server-console ID (1-10).
            data:       Keypress payload (PETSCII code + modifier flags).
            session_id: Client session ID.
        """
        print(f"handle_console_keypress: console_id={console_id}, data={data.hex()}")
        petscii_code = data[0]
        modifiers = data[1]
        mgr = ConsoleManager.instance()
        mgr.handle_keypress(console_id, session_id, petscii_code, modifiers)

        # TODO temporary inefficient - send whole screen via DMA
        screen = mgr.get_screen_data(console_id, session_id)
        color = mgr.get_color_data(console_id, session_id)
        send_screen_data(screen, color)
        return None

    @staticmethod
    def handle_console_text_input(
        console_id: int, data: bytes, session_id: int = 0
    ) -> Optional[bytes]:
        """
        Handle text input destined for a server-side console.

        Args:
            console_id: Server-console ID (1-10).
            data:       PETSCII text (null-terminated).
            session_id: Client session ID.
        """
        mgr = ConsoleManager.instance()
        return mgr.handle_text_input(console_id, session_id, data)
