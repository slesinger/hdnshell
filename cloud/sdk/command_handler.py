"""
Command handler for HDN Server.

Parses and dispatches command packets received from the C64 client.
"""

import logging
from typing import Optional, Tuple

from .generate_pet_asc_table import Petscii
from .console_manager import ConsoleManager, MIN_CONSOLE_ID, MAX_CONSOLE_ID
from .network_helper import send_screen_data, send_vic_colors
from .scrollback import HistoryStore, render_page

logger = logging.getLogger(__name__)

# Persistent console-0 scrollback transcript (workspace/.config/.history).
# Module-level singleton; tests replace/repoint it to a tmp-file-backed
# HistoryStore to avoid touching the real workspace.
_history_store = HistoryStore()

# Protocol constants
MAGIC_BYTES = bytes([0xFE])

# Server command IDs (sent inside a COMMAND packet)
SERVER_CMD_GET_SCREEN = 0x01
# Console-0 (local shell) commands: the wedge asks the server to snapshot /
# restore the C64's own screen via DMA, so the C64 side needs no buffer RAM.
SERVER_CMD_SAVE_SCREEN = 0x02
SERVER_CMD_RESTORE_SCREEN = 0x03
# Scrollback paging: view one screen OLDER (PREV) or NEWER (NEXT) than the
# currently-displayed one, DMA-painting the result over the live screen.
# See `handle_local_command` and `sdk/scrollback.py` for the page-cursor
# semantics (page 0 == the live screen saved by SERVER_CMD_SAVE_SCREEN).
SERVER_CMD_SCROLLBACK_PREV = 0x04
SERVER_CMD_SCROLLBACK_NEXT = 0x05

# Clipboard operations (GH #18). A contiguous range reserved AFTER the
# existing screen/scrollback commands (0x01-0x05) so old cartridge images
# never collide. See sdk/clipboard.py for the semantics and the user manual
# (docs/user_manual/clipboard.md) for the on-the-wire contract.
#
#   COPY_SCREEN        console 0: extract from the DMA-saved screen;
#                      consoles 1-10: extract from the app's screen buffer.
#                      Payload: mode, x0, y0, x1, y1. -> clip-info reply.
#   COPY_NATIVE        route to the active app's native copy hook (server
#                      consoles only). -> status(1) [+ clip-info].
#   CLIPBOARD_INFO     no payload. -> clip-info reply (length/lines/flags,
#                      never the content itself).
#   PASTE_TO_APP       route the clipboard UTF-8 text to the app paste hook
#                      (server consoles only). -> status(1).
#   LOCAL_PASTE_CHUNK  console 0 only. Payload: offset_hi, offset_lo,
#                      max_bytes. -> paste-chunk reply (PETSCII, chunked).
SERVER_CMD_COPY_SCREEN = 0x10
SERVER_CMD_COPY_NATIVE = 0x11
SERVER_CMD_CLIPBOARD_INFO = 0x12
SERVER_CMD_PASTE_TO_APP = 0x13
SERVER_CMD_LOCAL_PASTE_CHUNK = 0x14

# Paste-to-app status bytes (chosen non-zero so the local-console response
# path's null-terminator stripping never eats them).
PASTE_STATUS_ACCEPTED = 0x01
PASTE_STATUS_REJECTED = 0x02

# clip-info flags byte (kept non-zero for the same null-safety reason).
CLIP_FLAG_PRESENT = 0x01
CLIP_FLAG_EMPTY = 0x02


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
        Handle text input by dispatching to appropriate handler.

        Before dispatching, DMA-reads the live console-0 screen and
        overlap-diffs it into the scrollback transcript (sdk/scrollback.py).
        At this point the C64 screen holds whatever the previous command
        left behind PLUS the line the user just typed + RETURN -- exactly
        what should be scrollable once the next command's output starts
        overwriting it. Capture is best-effort: a missing host or any DMA
        failure is logged and swallowed so it can never block dispatch.
        """
        try:
            from .network_helper import dma_read_memory, read_last_c64_ip
            from .shared_state import get_session_state_copy

            state = get_session_state_copy(session_id)
            host = state.get("client_ip") or read_last_c64_ip()
            if host:
                screen = dma_read_memory(host, 0x0400, 1000)
                _history_store.capture_screen(screen)
            else:
                logger.warning(
                    f"handle_text_input: no host for session {session_id}, "
                    "skipping scrollback capture"
                )
        except Exception:
            logger.exception("scrollback capture failed in handle_text_input")

        dispatcher = CommandHandler.get_dispatcher()
        return dispatcher.dispatch(data, session_id)

    @staticmethod
    def handle_local_command(data: bytes, session_id: int = 0) -> Optional[bytes]:
        """
        Handle a COMMAND packet for console 0 (the local C64 shell).

        SERVER_CMD_SAVE_SCREEN: DMA-read the C64's screen ($0400) and colour
        ($D800) RAM and stash both in the session state.
        SERVER_CMD_RESTORE_SCREEN: DMA-write the stashed buffers back.
        SERVER_CMD_SCROLLBACK_PREV / _NEXT: page the *displayed* screen one
        step older / newer through the persistent scrollback transcript
        (sdk/scrollback.py) and DMA-paint the result. The expected C64-side
        flow is: SAVE_SCREEN (snapshot the live screen), any number of
        PREV/NEXT (pure view -- nothing is written back to history),
        then RESTORE_SCREEN to repaint the live screen and exit scrollback.
        A per-session `scrollback_page` cursor in session state tracks
        where the view currently is: 0 == the live saved screen, 1..N ==
        history pages (1 = newest, N = HistoryStore.total_pages() =
        oldest). PREV increments the cursor (older), NEXT decrements it
        (newer); both clamp at their respective ends instead of wrapping.

        Both return a short ack only after the DMA transfer has completed --
        the C64 wedge blocks on that ack to sequence save -> screen switch
        -> restore correctly (each packet arrives on its own connection, so
        without the ack the transfers could race).

        RESTORE_SCREEN is also the only reliable "the user is back at the
        local BASIC shell" signal the server sees: the wedge's console
        switcher (wedge/rr38p-tmp12reu.bank02.asm, `cs_modal`/`cm_match`,
        digit "1" case) calls `scr_restore` -> this command -- when
        returning from a server console (C=+CTRL+1), never a server-console
        packet. Left alone, `ConsoleManager._active[session_id]` (set by
        `_notify_switch()` only on *server*-console traffic) would go stale
        forever after the first console switch. Clearing it here lets
        `TutorialSession._on_shell()` (cloud/tutorials/session.py,
        TUTORIALS_PLAN.md §10.1) tell "at BASIC" apart from "still on a
        server console" -- see that method's docstring for the full trace.

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
            # Bring the transcript current the moment the user opens
            # scrollback (overlap-diffed, so re-capturing the same screen
            # the boundary capture just saw appends nothing new -- see
            # HistoryStore.capture_screen). Never let a capture failure
            # block SAVE_SCREEN itself.
            try:
                _history_store.capture_screen(screen)
            except Exception:
                logger.exception("capture_screen failed on SAVE_SCREEN")
            update_session_state(session_id, saved_screen=screen, saved_color=color)
            return b"00"

        if data[0] == SERVER_CMD_RESTORE_SCREEN:
            logger.info(f"RESTORE_SCREEN for session {session_id} (host {host})")
            # The user is back at the local BASIC shell. Deactivate the
            # previously-active server console: this runs its
            # on_deactivate hook (e.g. File Editor auto-saves modified
            # documents there) AND clears the manager's "active console"
            # record, so signals like TutorialSession._on_shell() see
            # None (== on the shell) rather than the last-visited console
            # id forever. Normally on_deactivate fires lazily on the next
            # server-console switch, but returning to local sends no
            # server-console packet, so we must trigger it here. See this
            # method's docstring.
            ConsoleManager.instance().deactivate_session(session_id)
            screen = state.get("saved_screen")
            color = state.get("saved_color")
            if screen and color:
                send_screen_data(screen, color)
            else:
                logger.warning("RESTORE_SCREEN with no saved screen for session")
            # Reset the local shell to the default C64 palette (border light-blue
            # $0E, background blue $06). SAVE/RESTORE only snapshot $0400/$D800,
            # not $D020/$D021, so a server app's colours (e.g. the Launcher's
            # black background) would otherwise linger into BASIC. GH #22.
            try:
                send_vic_colors(14, 6)
            except Exception:
                logger.debug("RESTORE_SCREEN vic-colour reset failed", exc_info=True)
            # Returning to the live screen always exits scrollback view.
            update_session_state(session_id, scrollback_page=0)
            return b"00"

        if data[0] == SERVER_CMD_SCROLLBACK_PREV:
            total = _history_store.total_pages()
            current = state.get("scrollback_page") or 0
            new_page = min(current + 1, total)
            logger.info(
                f"SCROLLBACK_PREV for session {session_id}: "
                f"page {current} -> {new_page} (total history pages={total})"
            )
            if new_page == 0:
                screen = state.get("saved_screen")
                color = state.get("saved_color")
                if screen and color:
                    send_screen_data(screen, color)
            else:
                screen, color = render_page(_history_store.get_page(new_page))
                send_screen_data(screen, color)
            update_session_state(session_id, scrollback_page=new_page)
            return b"00"

        if data[0] == SERVER_CMD_SCROLLBACK_NEXT:
            current = state.get("scrollback_page") or 0
            new_page = max(current - 1, 0)
            logger.info(
                f"SCROLLBACK_NEXT for session {session_id}: "
                f"page {current} -> {new_page}"
            )
            if new_page == 0:
                screen = state.get("saved_screen")
                color = state.get("saved_color")
                if screen and color:
                    send_screen_data(screen, color)
                else:
                    logger.warning(
                        "SCROLLBACK_NEXT reached the live screen with no "
                        "saved screen for session"
                    )
            else:
                screen, color = render_page(_history_store.get_page(new_page))
                send_screen_data(screen, color)
            update_session_state(session_id, scrollback_page=new_page)
            return b"00"

        if data[0] in (
            SERVER_CMD_COPY_SCREEN,
            SERVER_CMD_CLIPBOARD_INFO,
            SERVER_CMD_LOCAL_PASTE_CHUNK,
        ):
            return CommandHandler._handle_local_clipboard(data, session_id, state)

        logger.warning(f"Unknown local command 0x{data[0]:02X}")
        return None

    @staticmethod
    def _handle_local_clipboard(
        data: bytes, session_id: int, state: dict
    ) -> Optional[bytes]:
        """Console-0 (local BASIC) clipboard commands (GH #18).

        COPY_SCREEN extracts from the DMA-saved screen buffer (the wedge is
        expected to SAVE_SCREEN first, exactly like the scrollback flow).
        CLIPBOARD_INFO reports length/line-count/flags. LOCAL_PASTE_CHUNK
        serves PETSCII text to the local input in bounded, newline-flattened
        chunks so the C64 never holds a persistent clipboard copy.
        """
        from .clipboard import get_clipboard_service, Selection

        service = get_clipboard_service()

        if data[0] == SERVER_CMD_COPY_SCREEN:
            if len(data) < 6:
                logger.warning("COPY_SCREEN payload too short")
                return None
            mode, x0, y0, x1, y1 = data[1], data[2], data[3], data[4], data[5]
            screen = state.get("saved_screen")
            if not screen:
                logger.warning("COPY_SCREEN with no saved screen for session")
                return None
            meta = service.copy_screen(
                session_id, screen, Selection(mode, x0, y0, x1, y1), source="local"
            )
            logger.info(f"COPY_SCREEN (local) stored {meta.byte_length} bytes")
            return CommandHandler.encode_clip_info(meta)

        if data[0] == SERVER_CMD_CLIPBOARD_INFO:
            service.pull_from_host(session_id)
            return CommandHandler.encode_clip_info(service.get_metadata(session_id))

        # SERVER_CMD_LOCAL_PASTE_CHUNK
        service.pull_from_host(session_id)
        offset = 0
        max_bytes = 64
        if len(data) >= 3:
            offset = (data[1] << 8) | data[2]
        if len(data) >= 4:
            max_bytes = data[3] or 256
        chunk = service.to_local_petscii_chunk(session_id, offset, max_bytes)
        return CommandHandler.encode_paste_chunk(chunk)

    @staticmethod
    def _handle_console_clipboard(
        console_id: int, data: bytes, session_id: int, mgr
    ) -> Optional[bytes]:
        """Server-console (1-10) clipboard commands (GH #18).

        COPY_SCREEN extracts from the app's authoritative ``screen`` buffer
        (not $0400, which may be mid-redraw). COPY_NATIVE routes to the app's
        native copy hook, falling back (status 0) so the wedge can start a
        generic screen selection. PASTE_TO_APP routes the clipboard text to
        the app paste hook, showing a toaster on rejection.
        """
        from .clipboard import get_clipboard_service, Selection

        service = get_clipboard_service()
        console = mgr.get_console(console_id, session_id)
        # Route through the manager so on_activate/on_deactivate stay correct.
        mgr._notify_switch(console_id, session_id)

        if data[0] == SERVER_CMD_COPY_SCREEN:
            if len(data) < 6:
                logger.warning("COPY_SCREEN payload too short")
                return None
            mode, x0, y0, x1, y1 = data[1], data[2], data[3], data[4], data[5]
            meta = service.copy_screen(
                session_id,
                bytes(console.screen),
                Selection(mode, x0, y0, x1, y1),
                source=f"console{console_id}",
            )
            return CommandHandler.encode_clip_info(meta)

        if data[0] == SERVER_CMD_COPY_NATIVE:
            copied = False
            try:
                copied = bool(console.copy_native())
            except Exception:
                logger.exception(f"copy_native failed for console {console_id}")
            if not copied:
                # No native selection -> tell the wedge to fall back to the
                # generic visible-screen selector.
                return bytes([0x00])
            meta = service.get_metadata(session_id)
            return bytes([0x01]) + CommandHandler.encode_clip_info(meta)

        if data[0] == SERVER_CMD_CLIPBOARD_INFO:
            service.pull_from_host(session_id)
            return CommandHandler.encode_clip_info(service.get_metadata(session_id))

        # SERVER_CMD_PASTE_TO_APP
        service.pull_from_host(session_id)
        text = service.get_text(session_id)
        accepted = False
        try:
            accepted = bool(console.handle_clipboard_paste(text))
        except Exception:
            logger.exception(f"handle_clipboard_paste failed for console {console_id}")
        if accepted:
            console.push_screen()
            return bytes([PASTE_STATUS_ACCEPTED])
        try:
            console.show_toaster("PASTE NOT AVAILABLE", duration_sec=3.0)
            console.push_screen()
        except Exception:
            logger.debug("toaster on paste-reject failed", exc_info=True)
        return bytes([PASTE_STATUS_REJECTED])

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

    # ------------------------------------------------------------------
    # Clipboard reply encoders (GH #18)
    #
    # Both replies are designed so their LAST byte is never 0x00 -- the
    # local-console (console 0) response path funnels through
    # ``create_response(PETSCII_NULL_TERMINATED, ...)`` which strips a
    # trailing null. clip-info ends on a non-zero flags byte; paste-chunk
    # ends either on the ``done`` byte (0x00/0x01 -- only 0x01 when the
    # payload is empty) or on a PETSCII text byte (>= 0x20).
    # ------------------------------------------------------------------

    @staticmethod
    def encode_clip_info(meta) -> bytes:
        """Encode ClipboardMetadata as [len_hi, len_lo, line_count, flags]."""
        length = min(meta.byte_length, 0xFFFF)
        lines = min(meta.line_count, 0xFF)
        flags = CLIP_FLAG_PRESENT if meta.byte_length > 0 else CLIP_FLAG_EMPTY
        return bytes([(length >> 8) & 0xFF, length & 0xFF, lines, flags])

    @staticmethod
    def encode_paste_chunk(chunk) -> bytes:
        """Encode a PasteChunk as [total_hi, total_lo, done, <petscii...>]."""
        total = min(chunk.total_bytes, 0xFFFF)
        done = 0x01 if chunk.done else 0x00
        return bytes([(total >> 8) & 0xFF, total & 0xFF, done]) + chunk.data

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

        if data[0] in (
            SERVER_CMD_COPY_SCREEN,
            SERVER_CMD_COPY_NATIVE,
            SERVER_CMD_CLIPBOARD_INFO,
            SERVER_CMD_PASTE_TO_APP,
        ):
            return CommandHandler._handle_console_clipboard(
                console_id, data, session_id, mgr
            )

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

        # A keypress handler can switch the session's active console -- e.g. the
        # Launcher's RETURN opens an app on another slot (LauncherConsole._open_app),
        # which DMA-writes w_console and paints that app. Repaint whichever console
        # is active *now*, not the one the key was addressed to; otherwise we'd
        # paint the Launcher straight back over the app it just opened, and the app
        # would only surface on the user's *next* keypress. GH #22.
        active_id = mgr.active_console_id(session_id)
        if active_id is None:
            active_id = console_id
        # TODO temporary inefficient - send whole screen via DMA
        screen = mgr.get_screen_data(active_id, session_id)
        color = mgr.get_color_data(active_id, session_id)
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
