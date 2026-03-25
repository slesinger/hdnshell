"""
Server-side virtual console for C64 HDN Cloud Server.

Each ServerConsole maintains a 40x25 screen buffer (screen codes) and a
matching 40x25 color buffer, plus cursor state.  When the C64 client
switches to a server console and issues SERVER_CMD_GET_SCREEN the full
screen + color data is returned so the client can render it.

Console contents are updated via write_text / write_petscii / put_char
helpers that advance the cursor and scroll automatically.
"""

import logging
from typing import Optional

logger = logging.getLogger(__name__)

# C64 screen dimensions
SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000 bytes

# Defaults
DEFAULT_SCREEN_CODE = 0x20  # Space
DEFAULT_FG_COLOR = 14  # Light blue
DEFAULT_BG_COLOR = 6  # Blue (VIC background, informational only)


class ServerConsole:
    """
    A single server-side virtual console with 40x25 screen and color buffers.

    Attributes:
        console_id:    Numeric ID (1-10) of this console.
        session_id:    Session that owns this console.
        screen:        bytearray of 1000 screen-code bytes (row-major).
        color:         bytearray of 1000 colour-nybble bytes (row-major).
        cursor_col:    Current cursor column (0-39).
        cursor_row:    Current cursor row (0-24).
        current_color: Colour used for the next character written.
    """

    def __init__(self, console_id: int, session_id: int):
        self.console_id = console_id
        self.session_id = session_id
        self.screen = bytearray(SCREEN_SIZE)
        self.color = bytearray(SCREEN_SIZE)
        self.cursor_col: int = 0
        self.cursor_row: int = 0
        self.current_color: int = DEFAULT_FG_COLOR
        self.clear()

    # ------------------------------------------------------------------
    # Screen buffer operations
    # ------------------------------------------------------------------

    def clear(self):
        """Clear the screen and reset cursor to top-left."""
        for i in range(SCREEN_SIZE):
            self.screen[i] = DEFAULT_SCREEN_CODE
            self.color[i] = self.current_color
        self.cursor_col = 0
        self.cursor_row = 0

    def scroll_up(self):
        """Scroll all rows up by one.  Bottom row is cleared."""
        # Shift rows 1..24 → 0..23
        self.screen[: SCREEN_COLS * (SCREEN_ROWS - 1)] = self.screen[SCREEN_COLS:]
        self.color[: SCREEN_COLS * (SCREEN_ROWS - 1)] = self.color[SCREEN_COLS:]
        # Clear last row
        last = SCREEN_COLS * (SCREEN_ROWS - 1)
        for i in range(SCREEN_COLS):
            self.screen[last + i] = DEFAULT_SCREEN_CODE
            self.color[last + i] = self.current_color

    def put_char(self, screen_code: int):
        """Write a screen-code at the cursor position and advance."""
        if 0 <= self.cursor_col < SCREEN_COLS and 0 <= self.cursor_row < SCREEN_ROWS:
            pos = self.cursor_row * SCREEN_COLS + self.cursor_col
            self.screen[pos] = screen_code & 0xFF
            self.color[pos] = self.current_color & 0x0F
        self.cursor_col += 1
        if self.cursor_col >= SCREEN_COLS:
            self.newline()

    def newline(self):
        """Move cursor to column 0 of the next row, scroll if needed."""
        self.cursor_col = 0
        self.cursor_row += 1
        if self.cursor_row >= SCREEN_ROWS:
            self.scroll_up()
            self.cursor_row = SCREEN_ROWS - 1

    def set_cursor(self, col: int, row: int):
        """Set cursor position (clamped to screen bounds)."""
        self.cursor_col = max(0, min(col, SCREEN_COLS - 1))
        self.cursor_row = max(0, min(row, SCREEN_ROWS - 1))

    # ------------------------------------------------------------------
    # High-level text writing
    # ------------------------------------------------------------------

    def write_text(self, text: str):
        """
        Write a UTF-8 / ASCII string to the console.

        CR and LF both produce a newline.  Printable characters are
        converted to C64 screen codes via `ascii_to_screencode`.
        """
        for ch in text:
            if ch in ("\r", "\n"):
                self.newline()
            else:
                self.put_char(ascii_to_screencode(ord(ch)))

    def write_petscii(self, data: bytes):
        """
        Write raw PETSCII bytes to the console.

        0x0D (CR) produces a newline, 0x00 is ignored, everything else
        is converted through `petscii_to_screencode`.
        """
        for b in data:
            if b == 0x0D:
                self.newline()
            elif b == 0x00:
                continue
            else:
                self.put_char(petscii_to_screencode(b))

    # ------------------------------------------------------------------
    # Input handlers (default implementations – override in subclass or
    # attach a callback via ConsoleManager for console-specific behaviour)
    # ------------------------------------------------------------------

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        """
        Process a single keypress.

        Default: echo the character to the screen buffer.
        Returns optional response bytes to send back to the C64 (or None).
        """
        if petscii_code == 0x0D:
            self.newline()
        else:
            self.put_char(petscii_to_screencode(petscii_code))
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        """
        Process a text-input line (PETSCII, null-terminated).

        Default: write the text to the screen buffer.
        Returns optional PETSCII response bytes.
        """
        self.write_petscii(data.rstrip(b"\x00"))
        self.newline()
        return None

    def handle_command(self, data: bytes) -> Optional[bytes]:
        """
        Process a command byte-string.

        Default: unrecognised – returns None.
        """
        logger.warning(f"Console {self.console_id}: unhandled command 0x{data[0]:02X}")
        return None

    # ------------------------------------------------------------------
    # Lifecycle hooks (called by ConsoleManager on console switch)
    # ------------------------------------------------------------------

    def on_activate(self):
        """Called when this console becomes the active console.

        Override in subclasses to refresh stale state (e.g. reload
        files that may have been modified by another console).
        """
        pass

    def on_deactivate(self):
        """Called when the user switches away from this console.

        Override in subclasses to flush pending state (e.g. auto-save
        modified files so other consoles see the latest content).
        """
        pass

    # ------------------------------------------------------------------
    # Screen data accessors (for SERVER_CMD_GET_SCREEN)
    # ------------------------------------------------------------------

    def get_screen_data(self) -> bytes:
        """Return the 1000-byte screen-code buffer."""
        return bytes(self.screen)

    def get_color_data(self) -> bytes:
        """Return the 1000-byte colour buffer."""
        return bytes(self.color)

    def __repr__(self):
        return (
            f"ServerConsole(id={self.console_id}, session={self.session_id}, "
            f"cursor=({self.cursor_col},{self.cursor_row}))"
        )


# ======================================================================
# Screen-code conversion utilities
# ======================================================================

# Special ASCII characters whose screen-code doesn't follow the range formula.
_SPECIAL_ASCII: dict[int, int] = {
    ord("@"): 0x00,  # @ → $00
    ord("["): 0x1B,  # [ → $1B
    ord("]"): 0x1D,  # ] → $1D
    ord("{"): 0x6B,  # { → $6B
    ord("}"): 0x73,  # } → $73
    ord("_"): 0x64,  # _ → $64
    ord("~"): 0x68,  # ~ → $68
    ord("|"): 0x5D,  # | → $5D
    ord("\\"): 0x7F,  # \ → $7F
}


def ascii_to_screencode(ascii_code: int) -> int:
    """
    Convert an ASCII code point to a C64 screen code.

    Mapping (uppercase mode):
        PC @ convert to $00
        PC [ convert to $1B
        PC ] convert to $1D
        PC { convert to $6B
        PC } convert to $73
        PC _ convert to $64
        PC ~ convert to $68
        PC | convert to $5D
        PC \ convert to $7f
        $20-$3F  →  $20-$3F   (space, digits, punctuation)
        $40-$5F  →  $00-$1F   (@, A-Z, [, £, ], ↑, ←)
        $60-$7F  →  $00-$1F   (lowercase a-z mapped to uppercase screen codes)
        anything else → $20   (space)

    PC is lacking:
    pound sign £
    up arrow
    left arrow
    thick minus
    --- all up to $5a/$da
    """
    if ascii_code in _SPECIAL_ASCII:
        return _SPECIAL_ASCII[ascii_code]
    if 0x20 <= ascii_code <= 0x3F:
        return ascii_code
    if 0x40 <= ascii_code <= 0x5F:
        return ascii_code
    if 0x60 <= ascii_code <= 0x7F:
        return ascii_code - 0x60
    return DEFAULT_SCREEN_CODE


def petscii_to_screencode(petscii: int) -> int:
    """
    Convert a PETSCII byte to a C64 screen code.

    Standard mapping:
        $20-$3F  →  $20-$3F
        $40-$5F  →  $00-$1F
        $60-$7F  →  $40-$5F
        $A0-$BF  →  $60-$7F
        $C0-$DF  →  $40-$5F
        $E0-$FE  →  $60-$7E
        $FF      →  $5E
        $00-$1F  →  $80-$9F  (reverse video)
        $80-$9F  →  set colour / control, not screen-printable → $20
    """
    if 0x20 <= petscii <= 0x3F:
        return petscii
    if 0x40 <= petscii <= 0x5F:
        return petscii - 0x40
    if 0x60 <= petscii <= 0x7F:
        return petscii - 0x20
    if 0xA0 <= petscii <= 0xBF:
        return petscii - 0x40
    if 0xC0 <= petscii <= 0xDF:
        return petscii - 0x80
    if 0xE0 <= petscii <= 0xFE:
        return petscii - 0x80
    if petscii == 0xFF:
        return 0x5E
    if 0x00 <= petscii <= 0x1F:
        return petscii + 0x80  # reverse chars
    # $80-$9F (colour / control) – not directly printable
    return DEFAULT_SCREEN_CODE
