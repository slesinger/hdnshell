"""
Unit tests for sdk.toaster: box geometry (`toaster_box_rect`) and the
uniform-interior-fill painting algorithm (`paint_toaster`).

Painting algorithm under test (per user report -- the box interior used to
be patchy: reverse-video gray fill cells where there was no text, versus
blue-background text cells where there was): "first it draws the
rectangle, then it draws spaces everywhere inside it, then it will put
text in it." The whole interior must now be plain spaces (screen code
0x20) in the text color, so it reads as one uniform panel, with the
word-wrapped text glyphs written on top.
"""

from sdk.c64_colors import COL_YELLOW
from sdk.toaster import (
    SCREEN_COLS,
    SCREEN_ROWS,
    _TOAST_COL_BG,
    _TOAST_COL_TEXT,
    _TOAST_SC_BL,
    _TOAST_SC_BR,
    _TOAST_SC_HORIZ,
    _TOAST_SC_TL,
    _TOAST_SC_TR,
    _TOAST_SC_VERT,
    paint_toaster,
    toaster_box_rect,
)

_BORDER_SC = {_TOAST_SC_TL, _TOAST_SC_TR, _TOAST_SC_BL, _TOAST_SC_BR, _TOAST_SC_HORIZ, _TOAST_SC_VERT}


def _blank_buffers():
    return bytearray(SCREEN_COLS * SCREEN_ROWS), bytearray(SCREEN_COLS * SCREEN_ROWS)


def _painted_bounds(scr: bytearray, blank_sc: int = 0x00):
    """Return (min_row, min_col, max_row, max_col) of cells that differ from
    a freshly-zeroed buffer, or None if nothing was painted."""
    rows = []
    cols = []
    for r in range(SCREEN_ROWS):
        for c in range(SCREEN_COLS):
            pos = r * SCREEN_COLS + c
            if scr[pos] != blank_sc:
                rows.append(r)
                cols.append(c)
    if not rows:
        return None
    return min(rows), min(cols), max(rows), max(cols)


# ----------------------------------------------------------------------
# Task 1: uniform interior fill
# ----------------------------------------------------------------------


class TestUniformInteriorFill:
    def test_interior_cells_are_plain_spaces_not_reverse_fill(self):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, "Hi")

        rect = toaster_box_rect("Hi")
        assert rect is not None
        row, box_col, height, width = rect

        # Interior = box minus the 1-cell border on all sides.
        for r in range(row + 1, row + height - 1):
            for c in range(box_col + 1, box_col + width - 1):
                pos = r * SCREEN_COLS + c
                sc = scr[pos]
                # Every interior cell is either the plain-space fill or a
                # normal (non-reverse) text glyph -- never the old 0xA0
                # reverse-space fill, and never left as an untouched 0x00.
                assert sc != 0xA0, f"cell ({r},{c}) still uses reverse-space fill"
                assert not (sc & 0x80), f"cell ({r},{c}) is reverse-video: 0x{sc:02X}"

    def test_interior_padding_cells_use_text_color(self):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, "Hi")

        rect = toaster_box_rect("Hi")
        row, box_col, height, width = rect

        # Padding cell immediately right of the left border, row 1 (first
        # text row) -- with padding=1 this is the pre-text padding cell.
        pos = (row + 1) * SCREEN_COLS + (box_col + 1)
        assert scr[pos] == 0x20  # plain space
        assert col[pos] == _TOAST_COL_TEXT

    def test_border_cells_unchanged_dark_gray(self):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, "Hello world")

        rect = toaster_box_rect("Hello world")
        row, box_col, height, width = rect

        # Every border cell (top row, bottom row, left/right columns) must
        # still be a border screen-code in the dark-gray border color.
        for c in range(box_col, box_col + width):
            assert scr[row * SCREEN_COLS + c] in _BORDER_SC
            assert col[row * SCREEN_COLS + c] == _TOAST_COL_BG
            bot = row + height - 1
            assert scr[bot * SCREEN_COLS + c] in _BORDER_SC
            assert col[bot * SCREEN_COLS + c] == _TOAST_COL_BG
        for r in range(row, row + height):
            assert scr[r * SCREEN_COLS + box_col] in _BORDER_SC
            assert col[r * SCREEN_COLS + box_col] == _TOAST_COL_BG
            right = box_col + width - 1
            assert scr[r * SCREEN_COLS + right] in _BORDER_SC
            assert col[r * SCREEN_COLS + right] == _TOAST_COL_BG

    def test_text_glyphs_written_on_top_of_fill(self):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, "Hi")

        rect = toaster_box_rect("Hi")
        row, box_col, _height, _width = rect
        text_row = row + 1
        # Text starts right after the left border + 1 padding cell.
        h_pos = text_row * SCREEN_COLS + box_col + 2
        i_pos = h_pos + 1
        assert scr[h_pos] != 0x20  # 'H' glyph, not a space
        assert scr[i_pos] != 0x20  # 'i' glyph, not a space
        assert col[h_pos] == _TOAST_COL_TEXT
        assert col[i_pos] == _TOAST_COL_TEXT

    def test_blank_text_paints_nothing(self):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, "   ")
        assert scr == bytearray(SCREEN_COLS * SCREEN_ROWS)
        assert col == bytearray(SCREEN_COLS * SCREEN_ROWS)

    def test_text_is_yellow_border_is_dark_gray(self):
        """Locks in the two-color scheme: text (incl. interior fill) is
        yellow, border is dark gray -- and the two must never collapse to
        the same value."""
        assert _TOAST_COL_TEXT == COL_YELLOW
        assert _TOAST_COL_BG == 11  # dark gray, unchanged by this task
        assert _TOAST_COL_TEXT != _TOAST_COL_BG

        scr, col = _blank_buffers()
        paint_toaster(scr, col, "Hello world")

        rect = toaster_box_rect("Hello world")
        row, box_col, height, width = rect

        for r in range(row, row + height):
            for c in range(box_col, box_col + width):
                pos = r * SCREEN_COLS + c
                is_border = (
                    r in (row, row + height - 1)
                    or c in (box_col, box_col + width - 1)
                )
                if is_border:
                    assert col[pos] == _TOAST_COL_BG
                else:
                    assert col[pos] == _TOAST_COL_TEXT


# ----------------------------------------------------------------------
# Task 2: toaster_box_rect geometry parity with paint_toaster
# ----------------------------------------------------------------------


class TestToasterBoxRect:
    def _assert_rect_matches_paint(self, text: str):
        scr, col = _blank_buffers()
        paint_toaster(scr, col, text)

        rect = toaster_box_rect(text)
        bounds = _painted_bounds(scr)

        if bounds is None:
            assert rect is None
            return

        assert rect is not None
        min_r, min_c, max_r, max_c = bounds
        row, box_col, height, width = rect
        assert (row, box_col) == (min_r, min_c)
        assert height == max_r - min_r + 1
        assert width == max_c - min_c + 1

    def test_one_line_text(self):
        self._assert_rect_matches_paint("Saved.")

    def test_multi_line_wrapped_text(self):
        self._assert_rect_matches_paint(
            "This is a much longer notification message that will wrap onto "
            "several lines inside the toast box."
        )

    def test_empty_text_returns_none(self):
        assert toaster_box_rect("") is None
        assert toaster_box_rect("   ") is None

    def test_returns_full_outer_rect_including_borders(self):
        rect = toaster_box_rect("Hi")
        assert rect is not None
        row, col, height, width = rect
        assert row == 0
        assert height == 3  # top border + 1 text row + bottom border
        assert width >= len("Hi") + 4  # borders + padding
        assert col == SCREEN_COLS - width
