"""
Shared "toaster" overlay painter: paints a dark-gray/white notification box
into the top-right corner of a 40x25 screen-code + color buffer pair.

This is the pure geometry/rendering logic factored out of
`sdk.server_console` (`ServerConsole.show_toaster` /
`_render_toast_box`) so it can be reused by both:
  - `ServerConsole.get_screen_data()`/`get_color_data()` (the existing
    per-console toast notifications), and
  - `tutorials.session.TutorialSession` (the coach's hint overlay, which
    paints directly onto a freshly DMA-read live screen buffer, not a
    ServerConsole).

Box geometry/colors are unchanged from the original `server_console.py`
implementation -- callers must see byte-identical output.
See TUTORIALS_PLAN.md §5.3, §9 Phase 2.
"""

from typing import List

from .petscii import ascii_to_screencode

# C64 screen dimensions (kept in sync with sdk.server_console).
SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000 bytes

# Toast box rendering constants (top-right corner popup).
_TOAST_MAX_CONTENT_WIDTH = 26  # max text width per line (box outer width ≤ 30)
_TOAST_PADDING = 1  # blank cells on each side of text inside box
_TOAST_SC_TL = 0x70  # top-left corner
_TOAST_SC_TR = 0x6E  # top-right corner
_TOAST_SC_BL = 0x6D  # bottom-left corner
_TOAST_SC_BR = 0x7D  # bottom-right corner
_TOAST_SC_VERT = 0x5D  # vertical border line
_TOAST_SC_HORIZ = 0x40  # horizontal border line
_TOAST_SC_FILL = 0xA0  # reverse space = solid background fill
_TOAST_COL_BG = 11  # dark gray background
_TOAST_COL_TEXT = 1  # white text


def _toast_word_wrap(text: str, width: int) -> List[str]:
    """Wrap *text* so that each line fits within *width* characters."""
    if not text.strip():
        return []
    lines: List[str] = []
    for word in text.split():
        word = word[:width]  # never let a single word exceed width
        if not lines:
            lines.append(word)
        elif len(lines[-1]) + 1 + len(word) <= width:
            lines[-1] += " " + word
        else:
            lines.append(word)
    return lines


def paint_toaster(scr: bytearray, col: bytearray, text: str) -> None:
    """Overlay a toast notification box in the top-right corner of *scr*/*col*.

    Box uses dark gray (11) borders + fill and white (1) text.
    Max outer width is 30 columns; height scales to the word-wrapped content.

    `scr`/`col` are mutated in place (1000-byte screen-code / color
    buffers, row-major 40x25). If `text` is blank/whitespace-only, this
    is a no-op.
    """
    lines = _toast_word_wrap(text, _TOAST_MAX_CONTENT_WIDTH)
    if not lines:
        return

    content_w = max(len(line_content) for line_content in lines)
    inner_w = content_w + _TOAST_PADDING * 2  # text + left/right padding
    box_w = inner_w + 2  # + left/right border columns

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
        c = col_start
        _put(row, c, _TOAST_SC_VERT, _TOAST_COL_BG)
        c += 1
        for _ in range(_TOAST_PADDING):
            _put(row, c, _TOAST_SC_FILL, _TOAST_COL_BG)
            c += 1
        for ch in line:
            _put(row, c, ascii_to_screencode(ord(ch)), _TOAST_COL_TEXT)
            c += 1
        for _ in range(content_w - len(line) + _TOAST_PADDING):
            _put(row, c, _TOAST_SC_FILL, _TOAST_COL_BG)
            c += 1
        _put(row, c, _TOAST_SC_VERT, _TOAST_COL_BG)

    # Bottom border
    bot = row_start + 1 + len(lines)
    _put(bot, col_start, _TOAST_SC_BL, _TOAST_COL_BG)
    for i in range(inner_w):
        _put(bot, col_start + 1 + i, _TOAST_SC_HORIZ, _TOAST_COL_BG)
    _put(bot, col_start + 1 + inner_w, _TOAST_SC_BR, _TOAST_COL_BG)
