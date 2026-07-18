"""
Scrollback history store for the console-0 (local BASIC shell) scrollback
feature.

The C64 wedge has no spare RAM to buffer old screen rows itself, so the
server keeps a plain-text transcript of everything that has scrolled off
the local shell's screen. When the user asks to page back
(SERVER_CMD_SCROLLBACK_PREV/NEXT in `command_handler.py`), the server slices
the transcript into 40-col x 25-row pages, converts them to C64 screen
codes, and DMA-paints them over the live screen -- purely a *view*; nothing
on the C64 side is touched except the visible screen + colour RAM.

Storage format: workspace/.config/.history is plain ASCII text, one screen
row per line, newline-separated, oldest line first / newest line last (i.e.
lines are appended in the order they scroll off the C64 screen). Each line
is stored trimmed of trailing spaces. The file is capped at 100 KB; the
oldest lines are dropped (front of file) to make room for new ones,
truncating only on a line boundary so the file never starts mid-line.

Paging convention (see `get_page`): page 1 is the most recent `page_size`
lines, page 2 the `page_size` lines before that, etc. -- i.e. page number
increases as you go further into the past. Page 0 is reserved by the
caller (command_handler.CommandHandler) to mean "the live saved screen",
not a history page at all; `get_page` itself has no special case for 0.

Capture (see `capture_screen`): the history is kept up to date by DMA-
reading the live screen at two points -- SAVE_SCREEN (opening scrollback)
and the command boundary in `handle_text_input` (both in
`command_handler.py`) -- and overlap-diffing the resulting 25-line frame
against the current history tail so only genuinely new rows are appended,
even though both call sites may see overlapping content.
"""

import logging
import math
import os
from typing import List, Tuple

from .petscii import ascii_to_screencode
from .workspace import get_history_path

logger = logging.getLogger(__name__)

# C64 screen dimensions (kept local to avoid importing server_console, which
# pulls in the toaster/console machinery this module has no need for).
SCREEN_COLS = 40
SCREEN_ROWS = 25
SCREEN_SIZE = SCREEN_COLS * SCREEN_ROWS  # 1000 bytes

SPACE_SCREEN_CODE = 0x20
DEFAULT_TEXT_COLOR = 0x0E  # Light blue -- C64 default text colour.

# Hard cap on workspace/.config/.history, in bytes.
HISTORY_CAP_BYTES = 102400  # 100 KB

DEFAULT_PAGE_SIZE = 25

# Screen-code -> ASCII reverse map, built lazily from `ascii_to_screencode`
# (inverting it over the printable ASCII range), mirroring the approach in
# `agent_tools._build_screencode_to_ascii_map` -- duplicated here (rather
# than imported) to keep this module free of the heavier agent_tools import
# chain. Codes with no printable-ASCII pre-image render as space.
_SCREENCODE_TO_ASCII = None


def _build_screencode_to_ascii_map() -> dict:
    """Build (and cache) a map from C64 screen-code (0-127) -> ASCII char."""
    global _SCREENCODE_TO_ASCII
    if _SCREENCODE_TO_ASCII is not None:
        return _SCREENCODE_TO_ASCII

    mapping = {}
    # Prefer printable ASCII range 32..126; first ASCII code to hit a given
    # screen code wins (matches agent_tools' behaviour).
    for code in range(32, 127):
        sc = ascii_to_screencode(code) & 0x7F
        if sc not in mapping:
            mapping[sc] = chr(code)

    # Ensure every code has at least a space fallback.
    for i in range(128):
        if i not in mapping:
            mapping[i] = " "

    _SCREENCODE_TO_ASCII = mapping
    return mapping


def _screen_bytes_to_lines(screen_bytes: bytes) -> List[str]:
    """Convert a 1000-byte C64 screen buffer into 25 ASCII lines (40 cols).

    Each screen code has its reverse-video bit (0x80) stripped before
    lookup. Lines are NOT right-trimmed here -- callers that need that
    (e.g. `capture_screen`) do it themselves.
    """
    mapping = _build_screencode_to_ascii_map()
    data = screen_bytes[:SCREEN_SIZE].ljust(SCREEN_SIZE, b"\x20")
    lines = []
    for row in range(SCREEN_ROWS):
        start = row * SCREEN_COLS
        chunk = data[start : start + SCREEN_COLS]
        line = "".join(mapping.get(b & 0x7F, " ") for b in chunk)
        lines.append(line)
    return lines


class HistoryStore:
    """Persistent, size-capped store of C64 console-0 scrollback lines.

    Backed by a plain-text file (one row per line). The path is injectable
    so tests can point it at a tmp file instead of the real workspace.
    """

    def __init__(self, path: str = None):
        self.path = path or get_history_path()

    # ------------------------------------------------------------------
    # Raw line access
    # ------------------------------------------------------------------

    def read_lines(self) -> List[str]:
        """Return all stored lines, oldest first / newest last."""
        if not os.path.exists(self.path):
            return []
        with open(self.path, "r", encoding="ascii", errors="replace") as f:
            content = f.read()
        if content == "":
            return []
        return content.split("\n")

    def append_lines(self, lines: List[str]) -> None:
        """Append *lines* to the history, then enforce the 100 KB cap.

        Each line is trimmed of trailing spaces before being stored. The
        cap is enforced by dropping the oldest lines (from the front of the
        file) until the remaining content is <= HISTORY_CAP_BYTES, always
        truncating on a line boundary so the kept tail is intact whole
        lines.
        """
        if not lines:
            return

        existing = self.read_lines()
        cleaned = [line.rstrip(" ") for line in lines]
        all_lines = existing + cleaned
        content = "\n".join(all_lines)
        data = content.encode("ascii", errors="replace")

        if len(data) > HISTORY_CAP_BYTES:
            data = self._enforce_cap(data)

        _ensure_parent_dir(self.path)
        with open(self.path, "wb") as f:
            f.write(data)

    def clear(self) -> None:
        """Empty the history file."""
        _ensure_parent_dir(self.path)
        with open(self.path, "wb") as f:
            f.write(b"")

    # ------------------------------------------------------------------
    # Boundary-snapshot capture (overlap-diff against the live screen)
    # ------------------------------------------------------------------

    def capture_screen(self, screen_bytes: bytes) -> int:
        """Overlap-diff a live 1000-byte screen buffer into the history.

        Converts *screen_bytes* to 25 right-trimmed ASCII lines (screen
        code -> ASCII), drops trailing all-empty lines (the blank bottom
        of the screen is not content -- interior/leading blanks are kept),
        then finds the longest run where the END of the current history
        equals the START of this frame and appends only the lines past
        that overlap. This is what lets the same physical screen be
        captured repeatedly (e.g. once on SAVE_SCREEN, once at the
        previous command boundary) without duplicating rows: a full
        repeat overlaps 100% and appends nothing, a screen scrolled by N
        rows overlaps len(frame) - N and appends exactly the N new rows.

        Returns the number of lines actually appended (0 if the frame is
        entirely blank or a full duplicate of the history tail).
        """
        lines = _screen_bytes_to_lines(screen_bytes)
        frame = [line.rstrip(" ") for line in lines]

        # Drop trailing all-empty lines (blank bottom of the screen).
        while frame and frame[-1] == "":
            frame.pop()

        if not frame:
            return 0

        hist = self.read_lines()
        k = _longest_overlap(hist, frame)

        new_lines = frame[k:]
        if new_lines:
            self.append_lines(new_lines)
        return len(new_lines)

    @staticmethod
    def _enforce_cap(data: bytes) -> bytes:
        """Drop oldest lines from the front of *data* until <= the cap.

        Truncates only on a '\\n' boundary so the kept tail is always
        whole lines -- if a single line alone exceeds the cap (no newline
        found), fall back to a raw byte truncation from the end.
        """
        if len(data) <= HISTORY_CAP_BYTES:
            return data
        cutoff = len(data) - HISTORY_CAP_BYTES
        idx = data.find(b"\n", cutoff)
        if idx == -1:
            return data[-HISTORY_CAP_BYTES:]
        return data[idx + 1 :]

    # ------------------------------------------------------------------
    # Paging
    # ------------------------------------------------------------------

    def total_pages(self, page_size: int = DEFAULT_PAGE_SIZE) -> int:
        """Number of `page_size`-line pages the history spans (0 if empty)."""
        lines = self.read_lines()
        if not lines:
            return 0
        return math.ceil(len(lines) / page_size)

    def get_page(
        self, page_index: int, page_size: int = DEFAULT_PAGE_SIZE
    ) -> List[str]:
        """Return the `page_size` lines making up history page *page_index*.

        Page 1 = the most recent `page_size` lines, page 2 = the
        `page_size` lines before that, etc. (higher page number = further
        into the past). The oldest (highest-numbered) page is padded at
        the TOP with empty strings so every page is exactly `page_size`
        lines long. An out-of-range `page_index` (< 1 or beyond the last
        page) returns a full page of empty strings.

        Page 0 is not a history page -- callers use it to mean "the live
        screen" and should not call this method with 0.
        """
        lines = self.read_lines()
        total = len(lines)
        if total == 0:
            return [""] * page_size

        total_pages = math.ceil(total / page_size)
        if page_index < 1 or page_index > total_pages:
            return [""] * page_size

        end = total - (page_index - 1) * page_size
        start = max(0, end - page_size)
        page_lines = lines[start:end]
        if len(page_lines) < page_size:
            page_lines = [""] * (page_size - len(page_lines)) + page_lines
        return page_lines


def _ensure_parent_dir(path: str) -> None:
    parent = os.path.dirname(path)
    if parent:
        os.makedirs(parent, exist_ok=True)


def _longest_overlap(hist: List[str], frame: List[str]) -> int:
    """Largest k (0 <= k <= min(len(hist), len(frame))) s.t. the LAST k
    lines of *hist* equal the FIRST k lines of *frame*.

    k=0 always qualifies (both slices empty), so this always returns a
    value -- the search starts at the maximum possible k and works down,
    so the first (and therefore largest) match wins.
    """
    max_k = min(len(hist), len(frame))
    for k in range(max_k, 0, -1):
        if hist[len(hist) - k :] == frame[:k]:
            return k
    return 0


# ----------------------------------------------------------------------
# Rendering: history lines -> C64 screen + colour buffers
# ----------------------------------------------------------------------


def render_page(lines: List[str]) -> Tuple[bytes, bytes]:
    """Render up to 25 ASCII text lines into 40x25 screen + colour buffers.

    Each line is converted to C64 screen codes via `ascii_to_screencode`,
    truncated to 40 columns, and space-padded on the right to fill the
    row. Missing rows (fewer than 25 lines) are padded with all-space
    rows. Returns exactly (1000, 1000) bytes. Colour buffer is filled
    uniformly with DEFAULT_TEXT_COLOR (light blue), matching the C64's
    default text colour.
    """
    screen = bytearray(SCREEN_SIZE)
    color = bytearray([DEFAULT_TEXT_COLOR] * SCREEN_SIZE)

    for row in range(SCREEN_ROWS):
        line = lines[row] if row < len(lines) else ""
        row_start = row * SCREEN_COLS
        for col in range(SCREEN_COLS):
            if col < len(line):
                sc = ascii_to_screencode(ord(line[col]))
            else:
                sc = SPACE_SCREEN_CODE
            screen[row_start + col] = sc

    return bytes(screen), bytes(color)
