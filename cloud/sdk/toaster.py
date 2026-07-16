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

from typing import List, Optional, Tuple

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
_TOAST_SC_FILL = 0xA0  # reverse space (no longer used by paint_toaster's own
# fill -- kept only so `sdk.server_console`'s backward-compat re-export of
# this name keeps working for anything still importing it from there).
_TOAST_SC_SPACE = 0x20  # plain space = interior fill (renders as VIC bg)
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


def _toast_geometry(text: str):
    """Compute the shared box geometry for *text*, or None if it wraps to nothing.

    Returns (lines, row_start, col_start, inner_w, box_w) where `lines` is the
    word-wrapped content, (row_start, col_start) is the top-left corner of the
    box, `inner_w` is the interior width (padding + content, excluding the
    border columns) and `box_w` is the full outer width including borders.
    This is the single source of truth for box placement/size, shared by
    `paint_toaster` and `toaster_box_rect` so they can never drift apart.
    """
    lines = _toast_word_wrap(text, _TOAST_MAX_CONTENT_WIDTH)
    if not lines:
        return None

    content_w = max(len(line_content) for line_content in lines)
    inner_w = content_w + _TOAST_PADDING * 2  # text + left/right padding
    box_w = inner_w + 2  # + left/right border columns

    col_start = SCREEN_COLS - box_w
    if col_start < 0:
        col_start = 0
    row_start = 0

    return lines, row_start, col_start, inner_w, box_w


def toaster_box_rect(text: str) -> Optional[Tuple[int, int, int, int]]:
    """Return (row, col, height, width) of the box paint_toaster(text) would
    draw -- the full outer rectangle including borders -- or None if `text`
    wraps to nothing (same condition under which paint_toaster paints nothing).
    """
    geom = _toast_geometry(text)
    if geom is None:
        return None
    lines, row_start, col_start, inner_w, box_w = geom
    height = 2 + len(lines)  # top border + text rows + bottom border
    return (row_start, col_start, height, box_w)


def paint_toaster(scr: bytearray, col: bytearray, text: str) -> None:
    """Overlay a toast notification box in the top-right corner of *scr*/*col*.

    Painting order (matches how the box should read on real hardware, where
    a screen cell can only show ONE color -- either "cell filled with color,
    glyph punched out in the global VIC background" (reverse video) or "glyph
    drawn in color on the global VIC background" (normal video), never a
    custom per-cell background):
      1. Draw the border rectangle (dark gray (11), reverse corner/edge
         glyphs -- unchanged from before).
      2. Fill the ENTIRE interior with plain spaces (screen code 0x20, i.e.
         `_TOAST_SC_SPACE`) in the text color. Plain spaces render as the
         global VIC background, so the whole interior reads as one uniform
         panel -- no reverse-video fill blocks.
      3. Write the word-wrapped text glyphs (normal video, white) on top.

    Max outer width is 30 columns; height scales to the word-wrapped content.

    `scr`/`col` are mutated in place (1000-byte screen-code / color
    buffers, row-major 40x25). If `text` is blank/whitespace-only, this
    is a no-op.
    """
    geom = _toast_geometry(text)
    if geom is None:
        return
    lines, row_start, col_start, inner_w, box_w = geom

    def _put(r: int, c: int, sc: int, color: int) -> None:
        if 0 <= r < SCREEN_ROWS and 0 <= c < SCREEN_COLS:
            pos = r * SCREEN_COLS + c
            scr[pos] = sc
            col[pos] = color

    # 1. Top border
    _put(row_start, col_start, _TOAST_SC_TL, _TOAST_COL_BG)
    for i in range(inner_w):
        _put(row_start, col_start + 1 + i, _TOAST_SC_HORIZ, _TOAST_COL_BG)
    _put(row_start, col_start + 1 + inner_w, _TOAST_SC_TR, _TOAST_COL_BG)

    # 1. Side borders + 2. interior filled uniformly with plain spaces
    for li in range(len(lines)):
        row = row_start + 1 + li
        _put(row, col_start, _TOAST_SC_VERT, _TOAST_COL_BG)
        for i in range(inner_w):
            _put(row, col_start + 1 + i, _TOAST_SC_SPACE, _TOAST_COL_TEXT)
        _put(row, col_start + 1 + inner_w, _TOAST_SC_VERT, _TOAST_COL_BG)

    # 3. Text rows, written on top of the uniform fill
    for li, line in enumerate(lines):
        row = row_start + 1 + li
        c = col_start + 1 + _TOAST_PADDING
        for ch in line:
            _put(row, c, ascii_to_screencode(ord(ch)), _TOAST_COL_TEXT)
            c += 1

    # 1. Bottom border
    bot = row_start + 1 + len(lines)
    _put(bot, col_start, _TOAST_SC_BL, _TOAST_COL_BG)
    for i in range(inner_w):
        _put(bot, col_start + 1 + i, _TOAST_SC_HORIZ, _TOAST_COL_BG)
    _put(bot, col_start + 1 + inner_w, _TOAST_SC_BR, _TOAST_COL_BG)
