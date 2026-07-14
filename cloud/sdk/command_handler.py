"""
Command handler for HDN Server.

Parses and dispatches command packets received from the C64 client.
"""

import logging
from typing import Optional, Tuple

from .generate_pet_asc_table import Petscii
from .console_manager import ConsoleManager, MIN_CONSOLE_ID, MAX_CONSOLE_ID
from .network_helper import send_screen_data

logger = logging.getLogger(__name__)

# Protocol constants
MAGIC_BYTES = bytes([0xFE])

# Server command IDs (sent inside a COMMAND packet)
SERVER_CMD_GET_SCREEN = 0x01
# Console-0 (local shell) commands: the wedge asks the server to snapshot /
# restore the C64's own screen via DMA, so the C64 side needs no buffer RAM.
SERVER_CMD_SAVE_SCREEN = 0x02
SERVER_CMD_RESTORE_SCREEN = 0x03


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
    """Modifier flags for keypress commands (server-canonical convention)"""

    SHIFT = 0x01
    CTRL = 0x02
    COMMODORE = 0x04


def swap_c64_modifiers(raw: int) -> int:
    """Convert a raw C64 SHFLAG byte to the server-canonical ModifierFlags.

    The wedge forwards the KERNAL SHFLAG ($028D) verbatim because bank2 has no
    room to remap it. SHFLAG lays the bits out as {b0 SHIFT, b1 C=, b2 CTRL},
    whereas the server's ModifierFlags is {b0 SHIFT, b1 CTRL, b2 COMMODORE} --
    i.e. the C= and CTRL bits are swapped. Swap b1<->b2, keep SHIFT (b0); other
    bits are always 0 on SHFLAG and are ignored.
    """
    return (raw & 0x01) | ((raw >> 1) & 0x02) | ((raw << 1) & 0x04)


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
        modifiers = swap_c64_modifiers(data[1])

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
    def handle_local_command(data: bytes, session_id: int = 0) -> Optional[bytes]:
        """
        Handle a COMMAND packet for console 0 (the local C64 shell).

        SERVER_CMD_SAVE_SCREEN: DMA-read the C64's screen ($0400) and colour
        ($D800) RAM and stash both in the session state.
        SERVER_CMD_RESTORE_SCREEN: DMA-write the stashed buffers back.

        Both return a short ack only after the DMA transfer has completed --
        the C64 wedge blocks on that ack to sequence save -> screen switch
        -> restore correctly (each packet arrives on its own connection, so
        without the ack the transfers could race).

        Args:
            data:       Command payload (first byte is the command code).
            session_id: Client session ID (stable per client IP).

        Returns:
            Raw PETSCII ack bytes, or None for unknown commands.
        """
        from .network_helper import dma_read_memory, read_last_c64_ip
        from .shared_state import get_session_state_copy, update_session_state

        state = get_session_state_copy(session_id)
        host = state.get("client_ip") or read_last_c64_ip()

        if data[0] == SERVER_CMD_SAVE_SCREEN:
            logger.info(f"SAVE_SCREEN for session {session_id} (host {host})")
            screen = dma_read_memory(host, 0x0400, 1000)
            color = dma_read_memory(host, 0xD800, 1000)
            update_session_state(session_id, saved_screen=screen, saved_color=color)
            return b"00"

        if data[0] == SERVER_CMD_RESTORE_SCREEN:
            logger.info(f"RESTORE_SCREEN for session {session_id} (host {host})")
            screen = state.get("saved_screen")
            color = state.get("saved_color")
            if screen and color:
                send_screen_data(screen, color)
            else:
                logger.warning("RESTORE_SCREEN with no saved screen for session")
            return b"00"

        logger.warning(f"Unknown local command 0x{data[0]:02X}")
        return None

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
            # Wire format is un-terminated: strip the null terminator we just
            # ensured above before sending.
            return data[:-1]
        # return MAGIC_BYTES + bytes([response_type]) + data
        return data

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
        # print(f"handle_console_keypress: console_id={console_id}, data={data.hex()}")
        petscii_code = data[0]
        modifiers = swap_c64_modifiers(data[1])
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
