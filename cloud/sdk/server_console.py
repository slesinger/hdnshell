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
import time
from typing import Optional

# Import PETSCII conversion functions from sdk.petscii
from .petscii import ascii_to_screencode, petscii_to_screencode

logger = logging.getLogger(__name__)

# Lazy import to avoid circular dependency
_network_helper = None
def _get_network_helper():
    global _network_helper
    if _network_helper is None:
        from . import network_helper as nh
        _network_helper = nh
    return _network_helper

# C64 screen dimensions
SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000 bytes

# Toast box rendering constants (top-right corner popup)
_TOAST_MAX_CONTENT_WIDTH = 26  # max text width per line (box outer width ≤ 30)
_TOAST_PADDING = 1              # blank cells on each side of text inside box
_TOAST_SC_TL    = 0x70          # top-left corner
_TOAST_SC_TR    = 0x6E          # top-right corner
_TOAST_SC_BL    = 0x6D          # bottom-left corner
_TOAST_SC_BR    = 0x7D          # bottom-right corner
_TOAST_SC_VERT  = 0x5D          # vertical border line
_TOAST_SC_HORIZ = 0x40          # horizontal border line
_TOAST_SC_FILL  = 0xA0          # reverse space = solid background fill
_TOAST_COL_BG   = 11            # dark gray background
_TOAST_COL_TEXT = 1             # white text

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

    # Row used for toaster overlay (one row above the status/input bar).
    TOASTER_ROW = 22

    def __init__(self, console_id: int, session_id: int):
        self.console_id = console_id
        self.session_id = session_id
        self.screen = bytearray(SCREEN_SIZE)
        self.color = bytearray(SCREEN_SIZE)
        self.cursor_col: int = 0
        self.cursor_row: int = 0
        self.current_color: int = DEFAULT_FG_COLOR
        # Toaster notification state
        self._toaster_text: Optional[str] = None
        self._toaster_expires: float = 0.0
        self._toaster_color: int = 7  # COL_YELLOW
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
    # Toaster notifications (generic — available to all consoles)
    # ------------------------------------------------------------------

    # Screen-code reverse-video bit (same value used in subclasses).
    _SC_REVERSE_BIT = 0x80
    _SC_SPACE = 0x20

    def show_toaster(self, text: str, duration_sec: float = 8.0, color: int = 7):
        """Display a temporary toast notification box in the top-right corner.

        The box is overlaid on top of the rendered screen without touching the
        internal screen/color buffers, so the next normal render restores it.
        Text is word-wrapped to fit the box (max 26 chars per line).

        Args:
            text:         Message to display.
            duration_sec: How long the toaster stays visible.
            color:        Ignored (box always uses dark gray background / white text).
        """
        self._toaster_text = text
        self._toaster_expires = time.monotonic() + duration_sec
        self._toaster_color = color & 0x0F

    def clear_toaster(self):
        """Dismiss the toaster immediately."""
        self._toaster_text = None

    def _toaster_active(self) -> bool:
        """Return True if a toaster is currently visible."""
        return bool(self._toaster_text) and time.monotonic() < self._toaster_expires

    # ------------------------------------------------------------------
    # Enhanced screen rendering helpers (refactored from console apps)
    # ------------------------------------------------------------------

    def put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
        """
        Write a string at the specified screen position.
        
        This is a common pattern used by all console apps. Writes text starting
        at (row, col), wrapping to next column automatically. Does not wrap to
        next row (stops at screen edge).
        
        Args:
            row: Row coordinate (0-24)
            col: Starting column coordinate (0-39)
            text: Text to write (ASCII/UTF-8)
            fg: Foreground color (0-15)
            reverse: If True, set reverse-video bit on characters
        """
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                continue
            if row < 0 or row >= SCREEN_ROWS:
                return
            
            pos = row * SCREEN_COLS + c
            sc = ascii_to_screencode(ord(ch))
            if reverse:
                sc = sc | 0x80  # Set reverse-video bit
            
            self.screen[pos] = sc
            self.color[pos] = fg & 0x0F

    def fill_row(self, row: int, char: str = " ", fg: int = DEFAULT_FG_COLOR):
        """
        Fill an entire row with a character and color.
        
        Args:
            row: Row coordinate (0-24)
            char: Character to fill with (default: space)
            fg: Foreground color (0-15)
        """
        if row < 0 or row >= SCREEN_ROWS:
            return
        
        sc = ascii_to_screencode(ord(char))
        row_start = row * SCREEN_COLS
        
        for i in range(SCREEN_COLS):
            self.screen[row_start + i] = sc
            self.color[row_start + i] = fg & 0x0F

    def render_status_bar(self, text: str, row: int = 24, fg: int = 1, bg: int = 0, center: bool = False):
        """
        Render a reverse-video status bar with optional centered text.
        
        This is a common UI element in console apps. Creates a "button-like"
        reverse-video bar with optional text inside.
        
        Args:
            text: Status text to display
            row: Row coordinate (default: 24, the bottom row)
            fg: Text color (default: 1 = white)
            bg: Background color (default: 0 = black, shown as reverse video)
            center: If True, center the text; otherwise left-align
        """
        # Fill entire row with background color
        self.fill_row(row, " ", bg)
        
        # Truncate/pad text to 40 columns
        if len(text) > SCREEN_COLS:
            text = text[:SCREEN_COLS-1]
        
        if center:
            # Center the text
            padding = (SCREEN_COLS  - len(text)) // 2
            col = padding
        else:
            col = 0
        
        # Write text with reverse-video bit set
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                continue
            
            pos = row * SCREEN_COLS + c
            sc = ascii_to_screencode(ord(ch)) | 0x80  # Always reverse for status bar
            
            self.screen[pos] = sc
            self.color[pos] = fg & 0x0F

    def clear_region(self, row: int, col: int, width: int, height: int):
        """
        Clear a rectangular region of the screen with spaces and default color.
        
        Args:
            row: Starting row (0-24)
            col: Starting column (0-39)
            width: Width in columns
            height: Height in rows
        """
        for r in range(row, min(row + height, SCREEN_ROWS)):
            for c in range(col, min(col + width, SCREEN_COLS)):
                pos = r * SCREEN_COLS + c
                self.screen[pos] = DEFAULT_SCREEN_CODE
                self.color[pos] = self.current_color

    def push_screen(self):
        """
        Send the current screen and color buffers to the C64 via DMA.
        
        Called after rendering screen updates to transmit them to all connected C64 clients.
        Internally uses network_helper.send_screen_data() to push via DMA writes.
        Toaster overlays are included automatically via get_screen_data()/get_color_data().
        """
        try:
            nh = _get_network_helper()
            nh.send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception as e:
            logger.warning(f"Failed to push screen data: {e}")

    def push_vic_colors(self, border: int, background: int):
        """
        Send VIC border and background colors to the C64.
        
        Args:
            border: Border color (0-15) - written to $D020
            background: Background color (0-15) - written to $D021
        """
        try:
            nh = _get_network_helper()
            nh.send_vic_colors(border, background)
        except Exception as e:
            logger.warning(f"Failed to push VIC colors: {e}")

    # Auto-push support: track whether to auto-send screen after keypresses
    @property
    def auto_push(self) -> bool:
        """Check if automatic screen pushing is enabled after keypress handling."""
        return getattr(self, "_auto_push", True)
    
    @auto_push.setter
    def auto_push(self, value: bool):
        """Enable/disable automatic screen pushing after keypress handling."""
        self._auto_push = value

    # ------------------------------------------------------------------
    # Screen data accessors (for SERVER_CMD_GET_SCREEN)
    # ------------------------------------------------------------------

    def get_screen_data(self) -> bytes:
        """Return the 1000-byte screen-code buffer, with toast box overlay if active."""
        from . import _session_toasts
        scr = bytearray(self.screen)
        col = bytearray(self.color)
        if self._toaster_active():
            _render_toast_box(scr, col, self._toaster_text or "")
        session_toast = _session_toasts.get(self.session_id)
        if session_toast and time.monotonic() < session_toast["expires"]:
            _render_toast_box(scr, col, session_toast["text"])
        return bytes(scr)

    def get_color_data(self) -> bytes:
        """Return the 1000-byte colour buffer, with toast box overlay if active."""
        from . import _session_toasts
        scr = bytearray(self.screen)
        col = bytearray(self.color)
        if self._toaster_active():
            _render_toast_box(scr, col, self._toaster_text or "")
        session_toast = _session_toasts.get(self.session_id)
        if session_toast and time.monotonic() < session_toast["expires"]:
            _render_toast_box(scr, col, session_toast["text"])
        return bytes(col)

    def __repr__(self):
        return (
            f"ServerConsole(id={self.console_id}, session={self.session_id}, "
            f"cursor=({self.cursor_col},{self.cursor_row}))"
        )


# ======================================================================
# Screen-code conversion utilities are now imported from sdk.petscii
# See: petscii module for ascii_to_screencode, petscii_to_screencode
# ======================================================================


# ======================================================================
# Toast box rendering helpers
# ======================================================================

def _toast_word_wrap(text: str, width: int) -> list:
    """Wrap *text* so that each line fits within *width* characters."""
    if not text.strip():
        return []
    lines = []
    for word in text.split():
        word = word[:width]  # never let a single word exceed width
        if not lines:
            lines.append(word)
        elif len(lines[-1]) + 1 + len(word) <= width:
            lines[-1] += " " + word
        else:
            lines.append(word)
    return lines


def _render_toast_box(scr: bytearray, col: bytearray, text: str) -> None:
    """Overlay a toast notification box in the top-right corner of *scr*/*col*.

    Box uses dark gray (11) borders + fill and white (1) text.
    Max outer width is 30 columns; height scales to the word-wrapped content.
    """
    lines = _toast_word_wrap(text, _TOAST_MAX_CONTENT_WIDTH)
    if not lines:
        return

    content_w = max(len(l) for l in lines)
    inner_w   = content_w + _TOAST_PADDING * 2   # text + left/right padding
    box_w     = inner_w + 2                        # + left/right border columns

    col_start = SCREEN_COLS - box_w
    if col_start < 0:
        col_start = 0
    row_start = 0

    def _put(r: int, c: int, sc: int, color: int) -> None:
        if 0 <= r < SCREEN_ROWS and 0 <= c < SCREEN_COLS:
            pos = r * SCREEN_COLS + c
            scr[pos] = sc
            col[pos] = color

    # Top border
    _put(row_start, col_start, _TOAST_SC_TL, _TOAST_COL_BG)
    for i in range(inner_w):
        _put(row_start, col_start + 1 + i, _TOAST_SC_HORIZ, _TOAST_COL_BG)
    _put(row_start, col_start + 1 + inner_w, _TOAST_SC_TR, _TOAST_COL_BG)

    # Text rows
    for li, line in enumerate(lines):
        row = row_start + 1 + li
        c   = col_start
        _put(row, c, _TOAST_SC_VERT, _TOAST_COL_BG);  c += 1
        for _ in range(_TOAST_PADDING):
            _put(row, c, _TOAST_SC_FILL, _TOAST_COL_BG);  c += 1
        for ch in line:
            _put(row, c, ascii_to_screencode(ord(ch)), _TOAST_COL_TEXT);  c += 1
        for _ in range(content_w - len(line) + _TOAST_PADDING):
            _put(row, c, _TOAST_SC_FILL, _TOAST_COL_BG);  c += 1
        _put(row, c, _TOAST_SC_VERT, _TOAST_COL_BG)

    # Bottom border
    bot = row_start + 1 + len(lines)
    _put(bot, col_start, _TOAST_SC_BL, _TOAST_COL_BG)
    for i in range(inner_w):
        _put(bot, col_start + 1 + i, _TOAST_SC_HORIZ, _TOAST_COL_BG)
    _put(bot, col_start + 1 + inner_w, _TOAST_SC_BR, _TOAST_COL_BG)
