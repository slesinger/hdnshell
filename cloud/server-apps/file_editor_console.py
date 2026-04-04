"""
Server-side file editor console (console 2) for C64 HDN Cloud Server.

A full-featured text editor rendered into a 40x25 C64 screen-code back-buffer.
Features: multi-file tabs, find/replace, block ops, split view, file browser,
embedded console, menu bar, status bar.

All input arrives as PETSCII key-presses from the C64 client.
"""

import logging
import os
import re
import subprocess
import sys
from typing import Optional, List, Tuple, Dict

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    DEFAULT_SCREEN_CODE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii
from shared_state import get_clipboard, set_clipboard
from workspace_init import WORKSPACE_DIR

logger = logging.getLogger(__name__)

# ── Colour palette (C64 colour nybbles) ─────────────────────────────
COL_MENU_BG = 0  # black  (text on menu bar)
COL_MENU_FG = 1  # white
COL_MENU_HI = 7  # yellow  (highlighted menu item)
COL_STATUS_BG = 0
COL_STATUS_FG = 1  # white
COL_TEXT_FG = 14  # light blue
COL_TEXT_FG2 = 13  # light green (split pane 2)
COL_LINENO_FG = 15  # light grey
COL_CURSOR_FG = 1  # white  (cursor highlight)
COL_SELECT_FG = 7  # yellow (selected block)
COL_BROWSER_DIR = 5  # green
COL_BROWSER_FILE = 14  # light blue
COL_HELP_FG = 3  # cyan
COL_PROMPT_FG = 1  # white
COL_CONSOLE_FG = 5  # green
COL_TAB_ACTIVE = 1  # white
COL_TAB_INACTIVE = 11  # dark grey
COL_FIND_MATCH = 2  # red (highlight search matches)

# ── PETSCII key constants ────────────────────────────────────────────
# See https://sta.c64.org/cbm64petkey.html for a complete table.
# These are the codes sent by the C64 client to the server.

KEY_CTRL_AT = 0x00
KEY_CTRL_A = 0x01
KEY_CTRL_B = 0x02
KEY_RUNSTOP_ESC_CTRLC = 0x03  # RUN/STOP mapped as ESC
KEY_CTRL_D = 0x04
KEY_WHITE_CTRL2_CTRLE = 0x05
KEY_CTRL_F = 0x06
KEY_CTRL_G = 0x07
KEY_CTRL_H = 0x08
KEY_CTRL_I = 0x09
KEY_CTRL_J = 0x0A
KEY_CTRL_K = 0x0B
KEY_CTRL_L = 0x0C
KEY_RETURN = 0x0D
KEY_CHARSET_UPPER_CTRLN = 0x0E
KEY_CTRL_O = 0x0F
KEY_CTRL_P = 0x10
KEY_CRSR_DN_CTRLQ = 0x11
KEY_REVERSE_ON_CTRL9_CTRLR = 0x12
KEY_HOME_CTRLS = 0x13
KEY_DEL_CTRLT = 0x14  # DELETE (backspace)
KEY_CTRL_U = 0x15
KEY_CTRL_V = 0x16
KEY_CTRL_W = 0x17
KEY_CTRL_X = 0x18
KEY_CTRL_Y = 0x19
KEY_CTRL_Z = 0x1A
KEY_CTRL_COLON = 0x1B
KEY_RED_CTRL3_CTRLPOUND = 0x1C
KEY_CRSR_RT_CTRLSEMICOLON = 0x1D
KEY_GREEN_CTRL6_CTRLUPARROW = 0x1E
KEY_BLUE_CTRL7_CTRLEQUAL = 0x1F
KEY_SHIFT_COMA = 0x3C
KEY_SHIFT_PERIOD = 0x3E
KEY_SHIFT_COLON = 0x5B
KEY_POUND = 0x5C
KEY_SHIFT_SEMICOLON = 0x5D
KEY_UP_ARROW = 0x5E
KEY_LEFT_ARROW = 0x5F
KEY_ORANGE_CMD1 = 0x81
KEY_SH_RUNSTOP = 0x83  # RUN
KEY_F1 = 0x85
KEY_F3 = 0x86
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F2 = 0x89
KEY_F4 = 0x8A
KEY_F6 = 0x8B
KEY_F8 = 0x8C
KEY_CHARSET_LOWER = 0x8E
KEY_BLACK_CTRL1 = 0x90
KEY_CRSR_UP = 0x91
KEY_REVERSE_OFF_CTRL0 = 0x92
KEY_CLR = 0x93  # SHIFT+HOME
KEY_INS = 0x94  # INSERT (SHIFT+DEL)
KEY_BROWN_CMD2 = 0x95
KEY_PINK_CMD3 = 0x96
KEY_DARKGREY_CMD4 = 0x97
KEY_GREY_CMD5 = 0x98
KEY_LIGHTGREEN_CMD6 = 0x99
KEY_LIGHTBLUE_CMD7 = 0x9A
KEY_LIGHTGREY_CMD8 = 0x9B
KEY_PURPLE_CTRL5 = 0x9C
KEY_CRSR_LT = 0x9D
KEY_YELLOW_CTRL8 = 0x9E
KEY_CYAN_CTRL4 = 0x9F
KEY_SHIFT_SPACE = 0xA0
KEY_CBM_K = 0xA1
KEY_CBM_I = 0xA2
KEY_CBM_T = 0xA3
KEY_CBM_AT = 0xA4
KEY_CBM_G = 0xA5
KEY_CBM_PLUS = 0xA6
KEY_CBM_M = 0xA7
KEY_CBM_POUND = 0xA8
KEY_CBM_N = 0xAA
KEY_CBM_Q = 0xAB
KEY_CBM_D = 0xAC
KEY_CBM_Z = 0xAD
KEY_CBM_S = 0xAE
KEY_CBM_P = 0xAF
KEY_CBM_A = 0xB0
KEY_CBM_E = 0xB1
KEY_CBM_R = 0xB2
KEY_CBM_W = 0xB3
KEY_CBM_H = 0xB4
KEY_CBM_J = 0xB5
KEY_CBM_L = 0xB6
KEY_CBM_Y = 0xB7
KEY_CBM_U = 0xB8
KEY_CBM_O = 0xB9
KEY_SHIFT_AT = 0xBA
KEY_CBM_F = 0xBB
KEY_CBM_C = 0xBC
KEY_CBM_X = 0xBD
KEY_CBM_V = 0xBE
KEY_CBM_B = 0xBF
KEY_SHIFT_ASTERISK = 0xC0
KEY_SHIFT_PLUS = 0xDB
KEY_CBM_MINUS = 0xDC
KEY_SHIFT_CBM_MINUS = 0xDD
KEY_SHIFT_UPARROW = 0xDE
KEY_CBM_ASTERISK = 0xDF


# Modifier flags (from command_handler.py)
# MOD_SHIFT = 0x01
# MOD_CTRL = 0x02
# MOD_COMMODORE = 0x04

# ── Editor modes ─────────────────────────────────────────────────────
MODE_EDIT = 0
MODE_MENU = 1
MODE_BROWSER = 2
MODE_FIND = 3
MODE_REPLACE = 4
MODE_GOTO_LINE = 5
MODE_HELP = 6
MODE_CONSOLE = 7
MODE_FILE_LIST = 8
MODE_CONFIRM = 9

# ── Layout constants ─────────────────────────────────────────────────
MENU_ROW = 0  # Row 0 = menu bar
STATUS_ROW = 24  # Row 24 = status bar
EDIT_TOP = 1  # First editable row
EDIT_BOTTOM = 23  # Last editable row
EDIT_ROWS = EDIT_BOTTOM - EDIT_TOP + 1  # 23 visible text rows
LINE_NUM_WIDTH = 5  # "1234 " -> 5 chars for line numbers
TEXT_START_COL = LINE_NUM_WIDTH
TEXT_COLS = SCREEN_COLS - TEXT_START_COL  # 35 usable text columns

# Maximum files / tabs
MAX_OPEN_FILES = 8

# ── Working directory (server-side) ──────────────────────────────────
DEFAULT_CWD = WORKSPACE_DIR


# =====================================================================
#  Document — stores the text content of a single open file
# =====================================================================
class Document:
    """An in-memory text document (list of lines)."""

    def __init__(self, path: Optional[str] = None):
        self.path: Optional[str] = path
        self.lines: List[str] = [""]
        self.modified: bool = False
        self.cursor_x: int = 0  # column within the line (char index)
        self.cursor_y: int = 0  # line index in self.lines
        self.scroll_x: int = 0  # horizontal scroll offset
        self.scroll_y: int = 0  # first visible line index
        # Block selection (None = no selection)
        self.sel_start: Optional[Tuple[int, int]] = None  # (line, col)
        self.sel_end: Optional[Tuple[int, int]] = None
        self.name: str = "untitled"
        if path:
            self.name = os.path.basename(path)

    def load(self, path: str):
        """Load file from disk."""
        self.path = path
        self.name = os.path.basename(path)
        try:
            with open(path, "r", errors="replace") as f:
                text = f.read()
            # Normalise line endings
            text = text.replace("\r\n", "\n").replace("\r", "\n")
            self.lines = text.split("\n")
            if not self.lines:
                self.lines = [""]
        except Exception as e:
            logger.error(f"Failed to load {path}: {e}")
            self.lines = [f"Error: {e}"]
        self.modified = False
        self.cursor_x = 0
        self.cursor_y = 0
        self.scroll_x = 0
        self.scroll_y = 0

    def save(self) -> bool:
        """Save to self.path.  Returns True on success."""
        if not self.path:
            return False
        try:
            with open(self.path, "w") as f:
                f.write("\n".join(self.lines))
            self.modified = False
            return True
        except Exception as e:
            logger.error(f"Failed to save {self.path}: {e}")
            return False

    def reload(self):
        """Reload file from disk, preserving cursor and scroll position."""
        if not self.path or not os.path.isfile(self.path):
            return
        # Remember position
        old_cx, old_cy = self.cursor_x, self.cursor_y
        old_sx, old_sy = self.scroll_x, self.scroll_y
        try:
            with open(self.path, "r", errors="replace") as f:
                text = f.read()
            text = text.replace("\r\n", "\n").replace("\r", "\n")
            self.lines = text.split("\n")
            if not self.lines:
                self.lines = [""]
        except Exception as e:
            logger.error(f"Failed to reload {self.path}: {e}")
            return
        self.modified = False
        # Restore position, clamped to new content bounds
        self.cursor_y = min(old_cy, len(self.lines) - 1)
        self.cursor_x = min(old_cx, len(self.cur_line()))
        self.scroll_y = min(old_sy, max(0, len(self.lines) - 1))
        self.scroll_x = old_sx

    @property
    def line_count(self) -> int:
        return len(self.lines)

    def cur_line(self) -> str:
        """Return the line the cursor is on."""
        if 0 <= self.cursor_y < len(self.lines):
            return self.lines[self.cursor_y]
        return ""

    def set_cur_line(self, text: str):
        if 0 <= self.cursor_y < len(self.lines):
            self.lines[self.cursor_y] = text
            self.modified = True

    def clamp_cursor(self):
        """Clamp cursor within valid range."""
        if self.cursor_y < 0:
            self.cursor_y = 0
        if self.cursor_y >= len(self.lines):
            self.cursor_y = len(self.lines) - 1
        line_len = len(self.cur_line())
        if self.cursor_x < 0:
            self.cursor_x = 0
        if self.cursor_x > line_len:
            self.cursor_x = line_len

    def ensure_visible(self, visible_rows: int, visible_cols: int):
        """Adjust scroll so cursor is on screen."""
        if self.cursor_y < self.scroll_y:
            self.scroll_y = self.cursor_y
        if self.cursor_y >= self.scroll_y + visible_rows:
            self.scroll_y = self.cursor_y - visible_rows + 1
        if self.cursor_x < self.scroll_x:
            self.scroll_x = self.cursor_x
        if self.cursor_x >= self.scroll_x + visible_cols:
            self.scroll_x = self.cursor_x - visible_cols + 1

    def has_selection(self) -> bool:
        return self.sel_start is not None and self.sel_end is not None

    def ordered_selection(self) -> Optional[Tuple[Tuple[int, int], Tuple[int, int]]]:
        """Return (start, end) with start <= end."""
        if not self.has_selection():
            return None
        s, e = self.sel_start, self.sel_end
        if (s[0], s[1]) > (e[0], e[1]):
            s, e = e, s
        return s, e

    def get_selected_text(self) -> str:
        """Return the text in the current selection."""
        sel = self.ordered_selection()
        if not sel:
            return ""
        (sy, sx), (ey, ex) = sel
        if sy == ey:
            return self.lines[sy][sx:ex]
        parts = [self.lines[sy][sx:]]
        for y in range(sy + 1, ey):
            parts.append(self.lines[y])
        parts.append(self.lines[ey][:ex])
        return "\n".join(parts)

    def delete_selection(self):
        """Delete the selected block of text."""
        sel = self.ordered_selection()
        if not sel:
            return
        (sy, sx), (ey, ex) = sel
        if sy == ey:
            line = self.lines[sy]
            self.lines[sy] = line[:sx] + line[ex:]
        else:
            before = self.lines[sy][:sx]
            after = self.lines[ey][ex:]
            self.lines[sy] = before + after
            del self.lines[sy + 1 : ey + 1]
        self.cursor_y = sy
        self.cursor_x = sx
        self.sel_start = None
        self.sel_end = None
        self.modified = True

    def insert_text_at_cursor(self, text: str):
        """Insert arbitrary text (may contain newlines) at cursor."""
        if self.has_selection():
            self.delete_selection()
        lines_to_insert = text.split("\n")
        line = self.cur_line()
        before = line[: self.cursor_x]
        after = line[self.cursor_x :]
        if len(lines_to_insert) == 1:
            self.lines[self.cursor_y] = before + lines_to_insert[0] + after
            self.cursor_x += len(lines_to_insert[0])
        else:
            self.lines[self.cursor_y] = before + lines_to_insert[0]
            for i, ln in enumerate(lines_to_insert[1:-1], 1):
                self.lines.insert(self.cursor_y + i, ln)
            last = lines_to_insert[-1] + after
            self.lines.insert(self.cursor_y + len(lines_to_insert) - 1, last)
            self.cursor_y += len(lines_to_insert) - 1
            self.cursor_x = len(lines_to_insert[-1])
        self.modified = True


# =====================================================================
#  FileEditorConsole — the main editor class
# =====================================================================
class FileEditorConsole(ServerConsole):
    """
    Console 2 — File Editor.

    All rendering is done into the inherited screen[] / color[] buffers.
    The C64 client simply calls GET_SCREEN to fetch the 40x25 display.
    """

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        # Open documents (tabs)
        self.documents: List[Document] = [Document()]  # start with one empty doc
        self.active_doc_idx: int = 0
        # Clipboard (shared across consoles via shared_state)
        # Editor mode
        self.mode: int = MODE_EDIT
        self.prev_mode: int = MODE_EDIT
        # Menu state
        self.menu_items = ["File", "Edit", "View", "Search", "Run", "Help(f8)"]
        self.menu_sel: int = 0
        self.submenu_open: bool = False
        self.submenu_sel: int = 0
        self.submenus: Dict[str, List[Tuple[str, str]]] = {
            "File": [
                ("File list", "f1"),
                ("New", "f2"),
                ("Open", "f3"),
                ("Save", "f5"),
                ("Save as", "f6"),
                ("Close", "ctrl+w"),
            ],
            "Edit": [
                ("Cut", "C=+x"),
                ("Copy", "C=+c"),
                ("Paste", "C=+v"),
                ("Sel start", "ctrl+b"),
                ("Sel end", "ctrl+h"),
                ("Sel all", "ctrl+a"),
                ("Del line", "ctrl+y"),
            ],
            "View": [
                ("Console", "f7"),
                ("Cyc split", "ctrl+\x5e"),  # TODO this should be up arrow
                ("Swap pane", "sh+\x5e"),
                ("Tabs", "f2"),
                ("Wrap", "C=+p"),
            ],
            "Search": [
                ("Find", "C=+f"),
                ("Find next", "C=+n"),
                ("Replace", "C=+r"),
                ("Goto line", "C=+g"),
            ],
            "Run": [
                ("Compile", "ctrl+e"),
                ("Run", "ctrl+r"),
            ],
            "Help(f8)": [
                ("keys", "f8"),
            ],
        }
        # Find/replace state
        self.find_pattern: str = ""
        self.replace_text: str = ""
        # (line, col, length)
        self.find_matches: List[Tuple[int, int, int]] = []
        self.find_match_idx: int = -1
        # Input buffer for dialogs (find, goto line, save-as, console)
        self.input_buf: str = ""
        self.input_prompt: str = ""
        self.input_callback: Optional[str] = None  # method name to call
        # File browser state
        self.browser_cwd: str = DEFAULT_CWD
        self.browser_entries: List[Tuple[str, bool]] = []  # (name, is_dir)
        self.browser_sel: int = 0
        self.browser_scroll: int = 0
        # Console (shell) state
        self.console_lines: List[str] = ["$ "]
        self.console_scroll: int = 0
        self.console_input: str = ""
        # Split view
        self.split_mode: int = 0  # 0=none, 1=horizontal, 2=vertical
        self.split_doc_idx: int = 0  # doc index shown in second pane
        # Status message (shown temporarily in status bar)
        self.status_msg: str = ""
        # Compile state
        self._compile_ok: bool = False
        # Confirm dialog
        self.confirm_msg: str = ""
        self.confirm_callback: Optional[str] = None
        # Help scroll
        self.help_scroll: int = 0
        # Word wrap
        self.word_wrap: bool = False
        # Initial render
        self._full_render()

    # ── Property: active document ────────────────────────────────────
    @property
    def doc(self) -> Document:
        return self.documents[self.active_doc_idx]

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        """Reload open documents that were modified on disk by another console."""
        for d in self.documents:
            if d.path and not d.modified:
                d.reload()
        self._full_render()

    def on_deactivate(self):
        """Auto-save modified documents so other consoles see the latest content."""
        for d in self.documents:
            if d.path and d.modified:
                d.save()

    # =================================================================
    #  INPUT HANDLER — all C64 input comes through here as key-presses
    # =================================================================
    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        """Route keypress based on current editor mode."""
        self.status_msg = ""  # clear transient status on any keypress
        handlers = {
            MODE_EDIT: self._key_edit,
            MODE_MENU: self._key_menu,
            MODE_BROWSER: self._key_browser,
            MODE_FIND: self._key_input_dialog,
            MODE_REPLACE: self._key_input_dialog,
            MODE_GOTO_LINE: self._key_input_dialog,
            MODE_HELP: self._key_help,
            MODE_CONSOLE: self._key_console,
            MODE_FILE_LIST: self._key_file_list,
            MODE_CONFIRM: self._key_confirm,
        }
        handler = handlers.get(self.mode, self._key_edit)
        handler(petscii_code, modifiers)
        self._full_render()
        return None  # screen is fetched via GET_SCREEN

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        """Not used — all input is via keypress."""
        return None

    # =================================================================
    #  KEY HANDLERS — one per mode
    # =================================================================

    # ── EDIT mode ────────────────────────────────────────────────────
    def _key_edit(self, key: int, mod: int):
        d = self.doc

        # ─ Navigation ─
        # Note: CBM+cursor_down sends KEY_CRSR_UP (0x91) with mod=0x02
        #       CBM+cursor_right sends KEY_CRSR_LT (0x9D) with mod=0x02
        if key == KEY_CRSR_UP:
            if mod & 0x02:  # CBM+cursor_down → word left
                self._word_left(d)
            else:
                d.cursor_y -= 1
        elif key == KEY_CRSR_DN_CTRLQ:
            d.cursor_y += 1
        elif key == KEY_CRSR_LT:
            if mod & 0x02:  # CBM+cursor_right → word right
                self._word_right(d)
            else:
                d.cursor_x -= 1
                if d.cursor_x < 0 and d.cursor_y > 0:
                    d.cursor_y -= 1
                    d.cursor_x = len(d.cur_line())
        elif key == KEY_CRSR_RT_CTRLSEMICOLON:
            d.cursor_x += 1
            if d.cursor_x > len(d.cur_line()) and d.cursor_y < d.line_count - 1:
                d.cursor_y += 1
                d.cursor_x = 0
        elif key == KEY_HOME_CTRLS:
            if mod & 0x02:  # CTRL modifier
                d.cursor_x = len(d.cur_line())
            else:
                d.cursor_x = 0
        elif key == KEY_CLR:
            d.cursor_y = 0
            d.cursor_x = 0
        elif key == KEY_SHIFT_COMA and mod & 0x02:  # CBM+< → page up
            d.cursor_y -= self._edit_rows()
        elif key == KEY_SHIFT_PERIOD and mod & 0x02:  # CBM+> → page down
            d.cursor_y += self._edit_rows()

        # ─ Editing ─
        elif key == KEY_RETURN:
            self._insert_newline(d)
        elif key == KEY_DEL_CTRLT:
            self._backspace(d)
        elif key == KEY_INS:
            line = d.cur_line()
            d.set_cur_line(line[: d.cursor_x] + " " + line[d.cursor_x :])

        # ─ Function keys ─
        elif key == KEY_F1:
            self._enter_file_list()
        elif key == KEY_F2:
            self._cmd_new_file()
        elif key == KEY_F3:
            self._enter_browser()
        elif key == KEY_F5:
            self._cmd_save()
        elif key == KEY_F6:
            self._start_input("save as: ", "_cb_save_as")
        elif key == KEY_F7:
            self._enter_console()
        elif key == KEY_F8:
            self._enter_help()

        # ─ CBM key combos ─
        elif key == KEY_CTRL_B:
            d.sel_start = (d.cursor_y, d.cursor_x)
            if d.sel_end is None:
                d.sel_end = d.sel_start
        elif key == KEY_CTRL_H:
            d.sel_end = (d.cursor_y, d.cursor_x)
            if d.sel_start is None:
                d.sel_start = d.sel_end
        elif key == KEY_CTRL_A:
            d.sel_start = (0, 0)
            d.sel_end = (d.line_count - 1, len(d.lines[-1]))
        elif key == KEY_CBM_X:
            self._cmd_cut(d)
        elif key == KEY_CBM_C:
            self._cmd_copy(d)
        elif key == KEY_CBM_V:
            self._cmd_paste(d)
        elif key == KEY_CTRL_Y:
            self._cmd_delete_line(d)
        elif key == KEY_CBM_F:
            self._start_input("find: ", "_cb_find")
        elif key == KEY_CBM_N:
            self._cmd_find_next()
        elif key == KEY_CBM_R:
            self._start_input("replace: ", "_cb_replace_prompt")
        elif key == KEY_CBM_G:
            self._start_input("goto line: ", "_cb_goto_line")
        elif key == KEY_CTRL_W:
            self._cmd_close_file()
        elif key == KEY_CBM_S:
            self._cmd_save()
        elif key == KEY_SHIFT_SEMICOLON and mod & 0x02:  # CBM+; → indent line by 2 spaces
            d.set_cur_line("  " + d.cur_line())
            d.cursor_x += 2
        elif key == KEY_SHIFT_COLON and mod & 0x02:  # CBM+: → dedent line by up to 2 spaces
            line = d.cur_line()
            removed = min(2, len(line) - len(line.lstrip(" ")))
            if removed:
                d.set_cur_line(line[removed:])
                d.cursor_x = max(0, d.cursor_x - removed)
        elif key == KEY_ORANGE_CMD1:  # CBM+1 → no split
            self.split_mode = 0
        elif key == KEY_BROWN_CMD2:  # CBM+2 → horizontal split
            self.split_mode = 1
            self._ensure_split_doc()
        elif key == KEY_PINK_CMD3:  # CBM+3 → vertical split
            self.split_mode = 2
            self._ensure_split_doc()
        elif key == KEY_GREEN_CTRL6_CTRLUPARROW:  # CTRL+6 → cycle split mode
            self.split_mode = (self.split_mode + 1) % 3
            if self.split_mode > 0:
                self._ensure_split_doc()
        elif key == KEY_SHIFT_UPARROW:  # SHIFT+UP-ARROW → swap active pane
            if self.split_mode > 0:
                self.active_doc_idx, self.split_doc_idx = self.split_doc_idx, self.active_doc_idx

        # ─ CTRL key combos ─
        elif key == KEY_CTRL_F:
            self._start_input("find: ", "_cb_find")
        elif key == KEY_CHARSET_UPPER_CTRLN:  # CTRL+N
            self._cmd_find_next()
        elif key == KEY_REVERSE_ON_CTRL9_CTRLR:  # CTRL+R
            self._cmd_compile_and_run()
        elif key == KEY_CTRL_G:
            self._start_input("goto line: ", "_cb_goto_line")
        elif key == KEY_CTRL_X:
            self._cmd_cut(d)
        elif key == KEY_CTRL_V:
            self._cmd_paste(d)

        elif key == KEY_WHITE_CTRL2_CTRLE:  # CTRL+E → compile
            self._cmd_compile()

        elif key == KEY_CBM_Q:  # CBM+Q → insert {
            d.insert_text_at_cursor("{")
        elif key == KEY_CBM_W:  # CBM+W → insert }
            d.insert_text_at_cursor("}")
        elif key == KEY_CBM_POUND:  # CBM+£ → insert ~
            d.insert_text_at_cursor("~")
        elif key == KEY_SHIFT_CBM_MINUS:  # SHIFT+CBM+- → insert |
            d.insert_text_at_cursor("|")
        elif key == KEY_CBM_P:  # CBM+P → toggle word wrap
            self.word_wrap = not self.word_wrap
            self.status_msg = "wrap ON" if self.word_wrap else "wrap OFF"
            if self.word_wrap:
                self.doc.scroll_x = 0

        # ─ ESC / RUN-STOP → open menu ─
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_MENU
            self.menu_sel = 0
            self.submenu_open = False

        # ─ Printable characters ─
        else:
            ch = self._petscii_to_char(key)
            if ch is not None:
                if d.has_selection():
                    d.delete_selection()
                line = d.cur_line()
                d.set_cur_line(line[: d.cursor_x] + ch + line[d.cursor_x :])
                d.cursor_x += 1

        d.clamp_cursor()
        if self.word_wrap:
            d.scroll_x = 0
            d.ensure_visible(self._edit_rows(), 10000)
        else:
            d.ensure_visible(self._edit_rows(), TEXT_COLS)

    # ── MENU mode ────────────────────────────────────────────────────
    def _key_menu(self, key: int, mod: int):
        if key == KEY_CRSR_LT:
            if self.submenu_open:
                self.menu_sel = (self.menu_sel - 1) % len(self.menu_items)
                self.submenu_sel = 0
            else:
                self.menu_sel = (self.menu_sel - 1) % len(self.menu_items)
        elif key == KEY_CRSR_RT_CTRLSEMICOLON:
            if self.submenu_open:
                self.menu_sel = (self.menu_sel + 1) % len(self.menu_items)
                self.submenu_sel = 0
            else:
                self.menu_sel = (self.menu_sel + 1) % len(self.menu_items)
        elif key == KEY_CRSR_DN_CTRLQ:
            if self.submenu_open:
                items = self.submenus[self.menu_items[self.menu_sel]]
                self.submenu_sel = (self.submenu_sel + 1) % len(items)
            else:
                self.submenu_open = True
                self.submenu_sel = 0
        elif key == KEY_CRSR_UP:
            if self.submenu_open:
                items = self.submenus[self.menu_items[self.menu_sel]]
                self.submenu_sel = (self.submenu_sel - 1) % len(items)
        elif key == KEY_RETURN:
            if self.submenu_open:
                self._execute_menu_item()
            else:
                self.submenu_open = True
                self.submenu_sel = 0
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_EDIT

    def _execute_menu_item(self):
        """Execute the currently selected menu item."""
        menu_name = self.menu_items[self.menu_sel]
        items = self.submenus[menu_name]
        label, _ = items[self.submenu_sel]
        self.mode = MODE_EDIT  # leave menu first

        if label == "New":
            self._cmd_new_file()
        elif label == "Open":
            self._enter_browser()
        elif label == "Save":
            self._cmd_save()
        elif label == "Save as":
            self._start_input("save as: ", "_cb_save_as")
        elif label == "Close":
            self._cmd_close_file()
        elif label == "File list":
            self._enter_file_list()
        elif label == "Cut":
            self._cmd_cut(self.doc)
        elif label == "Copy":
            self._cmd_copy(self.doc)
        elif label == "Paste":
            self._cmd_paste(self.doc)
        elif label == "Sel start":
            d = self.doc
            d.sel_start = (d.cursor_y, d.cursor_x)
            if d.sel_end is None:
                d.sel_end = d.sel_start
        elif label == "Sel end":
            d = self.doc
            d.sel_end = (d.cursor_y, d.cursor_x)
            if d.sel_start is None:
                d.sel_start = d.sel_end
        elif label == "Sel all":
            d = self.doc
            d.sel_start = (0, 0)
            d.sel_end = (d.line_count - 1, len(d.lines[-1]))
        elif label == "Del line":
            self._cmd_delete_line(self.doc)
        elif label == "Console":
            self._enter_console()
        elif label == "Cyc split":
            self.split_mode = (self.split_mode + 1) % 3
            if self.split_mode > 0:
                self._ensure_split_doc()
        elif label == "Swap pane":
            if self.split_mode > 0:
                self.active_doc_idx, self.split_doc_idx = self.split_doc_idx, self.active_doc_idx
        elif label == "Tabs":
            self._enter_file_list()
        elif label == "Wrap":
            self.word_wrap = not self.word_wrap
            self.status_msg = "wrap ON" if self.word_wrap else "wrap OFF"
            if self.word_wrap:
                self.doc.scroll_x = 0
        elif label == "Find":
            self._start_input("find: ", "_cb_find")
        elif label == "Find next":
            self._cmd_find_next()
        elif label == "Replace":
            self._start_input("replace: ", "_cb_replace_prompt")
        elif label == "Goto line":
            self._start_input("goto line: ", "_cb_goto_line")
        elif label == "Compile":
            self._cmd_compile()
        elif label == "Run":
            self._cmd_compile_and_run()
        elif label == "keys":
            self._enter_help()

    # ── BROWSER mode ─────────────────────────────────────────────────
    def _key_browser(self, key: int, mod: int):
        max_visible = EDIT_ROWS
        if key == KEY_CRSR_DN_CTRLQ:
            if self.browser_sel < len(self.browser_entries) - 1:
                self.browser_sel += 1
            if self.browser_sel >= self.browser_scroll + max_visible:
                self.browser_scroll += 1
        elif key == KEY_CRSR_UP:
            if self.browser_sel > 0:
                self.browser_sel -= 1
            if self.browser_sel < self.browser_scroll:
                self.browser_scroll = self.browser_sel
        elif key == KEY_RETURN:
            if self.browser_entries:
                name, is_dir = self.browser_entries[self.browser_sel]
                if is_dir:
                    if name == "..":
                        new_cwd = os.path.dirname(self.browser_cwd)
                    else:
                        new_cwd = os.path.join(self.browser_cwd, name)
                    new_cwd = os.path.realpath(new_cwd)
                    # Stay within the workspace boundary
                    if new_cwd.startswith(os.path.realpath(WORKSPACE_DIR)):
                        self.browser_cwd = new_cwd
                    self._refresh_browser()
                    # Clamp cursor to new entry count so it stays visible
                    if self.browser_entries:
                        self.browser_sel = min(self.browser_sel, len(self.browser_entries) - 1)
                    else:
                        self.browser_sel = 0
                    if self.browser_sel < self.browser_scroll:
                        self.browser_scroll = self.browser_sel
                else:
                    path = os.path.join(self.browser_cwd, name)
                    self._open_file(path)
                    self.mode = MODE_EDIT
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_EDIT

    # ── FILE LIST mode ───────────────────────────────────────────────
    def _key_file_list(self, key: int, mod: int):
        if key == KEY_CRSR_DN_CTRLQ:
            self.active_doc_idx = (self.active_doc_idx + 1) % len(self.documents)
        elif key == KEY_CRSR_UP:
            self.active_doc_idx = (self.active_doc_idx - 1) % len(self.documents)
        elif key == KEY_RETURN:
            self.mode = MODE_EDIT
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_EDIT

    # ── INPUT DIALOG mode (find, replace, goto line, save-as) ────────
    def _key_input_dialog(self, key: int, mod: int):
        if key == KEY_RETURN:
            cb = self.input_callback
            self.mode = MODE_EDIT
            if cb and hasattr(self, cb):
                getattr(self, cb)()
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_EDIT
        elif key == KEY_DEL_CTRLT:
            if self.input_buf:
                self.input_buf = self.input_buf[:-1]
        else:
            ch = self._petscii_to_char(key)
            if ch is not None:
                self.input_buf += ch

    # ── HELP mode ────────────────────────────────────────────────────
    def _key_help(self, key: int, mod: int):
        if key == KEY_RUNSTOP_ESC_CTRLC or key == KEY_F8:
            self.mode = MODE_EDIT
        elif key == KEY_CRSR_DN_CTRLQ:
            self.help_scroll += 1
        elif key == KEY_CRSR_UP:
            self.help_scroll = max(0, self.help_scroll - 1)

    # ── CONSOLE (shell) mode ─────────────────────────────────────────
    def _key_console(self, key: int, mod: int):
        if key == KEY_RUNSTOP_ESC_CTRLC or key == KEY_F7:
            self.mode = MODE_EDIT
        elif key == KEY_RETURN:
            self._execute_console_command()
        elif key == KEY_DEL_CTRLT:
            if self.console_input:
                self.console_input = self.console_input[:-1]
        elif key == KEY_CRSR_UP:
            self.console_scroll = max(0, self.console_scroll - 1)
        elif key == KEY_CRSR_DN_CTRLQ:
            self.console_scroll += 1
        else:
            ch = self._petscii_to_char(key)
            if ch is not None:
                self.console_input += ch

    # ── CONFIRM dialog mode ──────────────────────────────────────────
    def _key_confirm(self, key: int, mod: int):
        ch = self._petscii_to_char(key)
        if ch and ch.lower() == "y":
            self.mode = MODE_EDIT
            if self.confirm_callback and hasattr(self, self.confirm_callback):
                getattr(self, self.confirm_callback)()
        else:
            self.mode = MODE_EDIT

    # =================================================================
    #  COMMANDS — file operations, editing, find/replace, etc.
    # =================================================================

    def _cmd_new_file(self):
        if len(self.documents) < MAX_OPEN_FILES:
            self.documents.append(Document())
            self.active_doc_idx = len(self.documents) - 1

    def _cmd_save(self):
        d = self.doc
        if d.path:
            d.save()
        else:
            self._start_input("save as: ", "_cb_save_as")

    def _cmd_close_file(self):
        if self.doc.modified:
            self.confirm_msg = "unsaved changes! close? y/n"
            self.confirm_callback = "_cb_force_close"
            self.mode = MODE_CONFIRM
        else:
            self._cb_force_close()

    def _cb_force_close(self):
        if len(self.documents) > 1:
            del self.documents[self.active_doc_idx]
            if self.active_doc_idx >= len(self.documents):
                self.active_doc_idx = len(self.documents) - 1
        else:
            self.documents[0] = Document()

    def _cmd_cut(self, d: Document):
        if d.has_selection():
            set_clipboard(self.session_id, d.get_selected_text())
            d.delete_selection()

    def _cmd_copy(self, d: Document):
        if d.has_selection():
            set_clipboard(self.session_id, d.get_selected_text())

    def _cmd_paste(self, d: Document):
        cb = get_clipboard(self.session_id)
        if cb:
            d.insert_text_at_cursor(cb)

    def _cmd_delete_line(self, d: Document):
        if d.line_count > 1:
            del d.lines[d.cursor_y]
            if d.cursor_y >= d.line_count:
                d.cursor_y = d.line_count - 1
            d.modified = True
        else:
            d.lines[0] = ""
            d.cursor_x = 0
            d.modified = True

    def _insert_newline(self, d: Document):
        if d.has_selection():
            d.delete_selection()
        line = d.cur_line()
        d.set_cur_line(line[: d.cursor_x])
        d.lines.insert(d.cursor_y + 1, line[d.cursor_x :])
        d.cursor_y += 1
        d.cursor_x = 0
        d.modified = True

    def _backspace(self, d: Document):
        if d.has_selection():
            d.delete_selection()
            return
        if d.cursor_x > 0:
            line = d.cur_line()
            d.set_cur_line(line[: d.cursor_x - 1] + line[d.cursor_x :])
            d.cursor_x -= 1
        elif d.cursor_y > 0:
            prev_len = len(d.lines[d.cursor_y - 1])
            d.lines[d.cursor_y - 1] += d.cur_line()
            del d.lines[d.cursor_y]
            d.cursor_y -= 1
            d.cursor_x = prev_len
            d.modified = True

    def _word_left(self, d: Document):
        line = d.cur_line()
        x = d.cursor_x
        while x > 0 and (x - 1 >= len(line) or line[x - 1] == " "):
            x -= 1
        while x > 0 and x - 1 < len(line) and line[x - 1] != " ":
            x -= 1
        d.cursor_x = x

    def _word_right(self, d: Document):
        line = d.cur_line()
        x = d.cursor_x
        while x < len(line) and line[x] != " ":
            x += 1
        while x < len(line) and line[x] == " ":
            x += 1
        d.cursor_x = x

    # ── Find / Replace ───────────────────────────────────────────────
    def _start_input(self, prompt: str, callback: str):
        self.input_prompt = prompt
        self.input_buf = ""
        self.input_callback = callback
        if "find" in callback:
            self.mode = MODE_FIND
        elif "replace" in callback:
            self.mode = MODE_REPLACE
        elif "goto" in callback:
            self.mode = MODE_GOTO_LINE
        else:
            self.mode = MODE_FIND  # generic input

    def _cb_find(self):
        self.find_pattern = self.input_buf
        self._do_find_all()
        self._cmd_find_next()

    def _do_find_all(self):
        """Find all occurrences of self.find_pattern."""
        self.find_matches = []
        self.find_match_idx = -1
        if not self.find_pattern:
            return
        try:
            pat = re.compile(self.find_pattern, re.IGNORECASE)
        except re.error:
            return
        d = self.doc
        for i, line in enumerate(d.lines):
            for m in pat.finditer(line):
                self.find_matches.append((i, m.start(), m.end() - m.start()))

    def _cmd_find_next(self):
        if not self.find_matches:
            return
        d = self.doc
        # Find next match after cursor
        for idx, (ly, lx, _) in enumerate(self.find_matches):
            if (ly, lx) > (d.cursor_y, d.cursor_x):
                self.find_match_idx = idx
                d.cursor_y = ly
                d.cursor_x = lx
                d.clamp_cursor()
                d.ensure_visible(self._edit_rows(), TEXT_COLS)
                return
        # Wrap around
        if self.find_matches:
            self.find_match_idx = 0
            ly, lx, _ = self.find_matches[0]
            d.cursor_y = ly
            d.cursor_x = lx
            d.clamp_cursor()
            d.ensure_visible(self._edit_rows(), TEXT_COLS)

    def _cb_replace_prompt(self):
        """First callback after entering search string for replace."""
        self.find_pattern = self.input_buf
        self._do_find_all()
        self._start_input("with: ", "_cb_replace_exec")

    def _cb_replace_exec(self):
        """Second callback — perform the replacement."""
        self.replace_text = self.input_buf
        d = self.doc
        if not self.find_pattern:
            return
        try:
            pat = re.compile(self.find_pattern, re.IGNORECASE)
        except re.error:
            return
        count = 0
        for i in range(len(d.lines)):
            new_line, n = pat.subn(self.replace_text, d.lines[i])
            if n > 0:
                d.lines[i] = new_line
                count += n
                d.modified = True
        self.find_matches = []
        self.find_match_idx = -1
        # Show count in status — will be rendered on next _full_render

    def _cb_goto_line(self):
        try:
            n = int(self.input_buf)
        except ValueError:
            return
        d = self.doc
        d.cursor_y = max(0, min(n - 1, d.line_count - 1))
        d.cursor_x = 0
        d.clamp_cursor()
        d.ensure_visible(self._edit_rows(), TEXT_COLS)

    def _cb_save_as(self):
        path = self.input_buf.strip()
        if not path:
            return
        if not os.path.isabs(path):
            path = os.path.join(self.browser_cwd, path)
        self.doc.path = path
        self.doc.name = os.path.basename(path)
        self.doc.save()

    # ── File browser ─────────────────────────────────────────────────
    def _enter_browser(self):
        self.mode = MODE_BROWSER
        self.browser_sel = 0
        self.browser_scroll = 0
        self._refresh_browser()

    def _refresh_browser(self):
        self.browser_entries = []
        try:
            entries = sorted(os.listdir(self.browser_cwd))
        except OSError:
            entries = []
        # Parent directory always first
        self.browser_entries.append(("..", True))
        dirs = []
        files = []
        for e in entries:
            if e.startswith("."):
                continue
            full = os.path.join(self.browser_cwd, e)
            if os.path.isdir(full):
                dirs.append((e, True))
            else:
                files.append((e, False))
        self.browser_entries.extend(sorted(dirs, key=lambda x: x[0].lower()))
        self.browser_entries.extend(sorted(files, key=lambda x: x[0].lower()))

    def _open_file(self, path: str):
        """Open a file — reuse existing tab if already open."""
        for i, d in enumerate(self.documents):
            if d.path == path:
                self.active_doc_idx = i
                return
        if len(self.documents) >= MAX_OPEN_FILES:
            # Replace current tab
            doc = Document()
            doc.load(path)
            self.documents[self.active_doc_idx] = doc
        else:
            doc = Document()
            doc.load(path)
            self.documents.append(doc)
            self.active_doc_idx = len(self.documents) - 1

    # ── File list (tabs) ─────────────────────────────────────────────
    def _enter_file_list(self):
        self.mode = MODE_FILE_LIST

    # ── Console (shell) ──────────────────────────────────────────────
    def _enter_console(self):
        self.prev_mode = self.mode
        self.mode = MODE_CONSOLE

    def _execute_console_command(self):
        cmd = self.console_input.strip()
        self.console_input = ""
        if not cmd:
            self.console_lines.append("$ ")
            return
        self.console_lines.append(f"$ {cmd}")

        # Handle cd as a built-in so we can enforce the workspace boundary
        if cmd == "cd" or cmd.startswith("cd "):
            self._handle_cd(cmd)
            self.console_lines.append("$ ")
            self.console_scroll = max(0, len(self.console_lines) - EDIT_ROWS)
            return

        try:
            result = subprocess.run(
                cmd,
                shell=True,
                capture_output=True,
                text=True,
                timeout=10,
                cwd=self.browser_cwd,
            )
            output = result.stdout + result.stderr
            for line in output.split("\n"):
                self.console_lines.append(line)
        except subprocess.TimeoutExpired:
            self.console_lines.append("(timeout)")
        except Exception as e:
            self.console_lines.append(f"error: {e}")
        self.console_lines.append("$ ")
        # Scroll to bottom
        self.console_scroll = max(0, len(self.console_lines) - EDIT_ROWS)

    def _handle_cd(self, cmd: str):
        """Built-in cd that keeps browser_cwd inside WORKSPACE_DIR."""
        parts = cmd.split(None, 1)
        if len(parts) < 2:
            # bare "cd" → go to workspace root
            self.browser_cwd = os.path.realpath(WORKSPACE_DIR)
            return
        target = parts[1].strip()
        if os.path.isabs(target):
            new_cwd = os.path.realpath(target)
        else:
            new_cwd = os.path.realpath(os.path.join(self.browser_cwd, target))
        ws_real = os.path.realpath(WORKSPACE_DIR)
        if new_cwd.startswith(ws_real) and os.path.isdir(new_cwd):
            self.browser_cwd = new_cwd
        else:
            self.console_lines.append("restricted: cannot leave workspace")

    # ── Help ─────────────────────────────────────────────────────────
    def _enter_help(self):
        self.mode = MODE_HELP
        self.help_scroll = 0

    # ── Oscar64 compile / run ─────────────────────────────────────────

    @staticmethod
    def _oscar_dir() -> str:
        """Return the absolute path to the oscar/ directory."""
        meipass = getattr(sys, "_MEIPASS", None)
        if meipass:
            return os.path.join(meipass, "oscar")
        return os.path.join(
            os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "oscar"
        )

    def _cmd_compile(self) -> bool:
        """Save current file and compile it with oscar64. Returns True on success."""
        self._compile_ok = False
        self.status_msg = ""
        d = self.doc
        if not d.path:
            self.status_msg = "Save file first"
            return False
        # Save
        d.save()

        oscar_dir = self._oscar_dir()
        compiler = os.path.join(oscar_dir, "bin", "oscar64")
        include_dir = os.path.join(oscar_dir, "include")

        if not os.path.isfile(compiler):
            self.status_msg = "oscar64 not found"
            print(f"Error: oscar64 compiler not found at {compiler}")
            return False

        try:
            result = subprocess.run(
                [compiler, f"-i={include_dir}", d.path],
                capture_output=True,
                text=True,
                timeout=60,
            )
        except subprocess.TimeoutExpired:
            self.status_msg = "Compile timeout"
            return False
        except Exception as e:
            self.status_msg = f"Error: {e}"
            return False

        output = (result.stdout + result.stderr).strip()

        if result.returncode == 0:
            self.status_msg = "Compiled OK"
            self._compile_ok = True
            # Close error split if it was showing clog.txt
            self._close_clog_split()
            return True

        # Compilation failed — write errors to clog.txt and show in split
        self.status_msg = "Compile FAILED"
        # Strip absolute path prefixes from file references so lines fit in 40 cols.
        # oscar64 emits:  /abs/path/to/file.c(12, 1) : error 3006: ...
        # We keep only:  file.c(12, 1) : error 3006: ...
        output = re.sub(r"(?:/[^/()\s]+)+/([^/()\s]+(?:\.[^/()\s]+)?)(\(\d+(?:,\s*\d+)?\))",
                        r"\1\2", output)
        clog_path = os.path.join(os.path.dirname(d.path), "clog.txt")
        try:
            with open(clog_path, "w") as f:
                f.write(output)
        except OSError:
            pass
        self._open_clog_split(clog_path)
        return False

    def _open_clog_split(self, clog_path: str):
        """Open clog.txt in the bottom split pane."""
        # Check if clog.txt is already open
        for i, doc in enumerate(self.documents):
            if doc.path and os.path.realpath(doc.path) == os.path.realpath(clog_path):
                doc.load(clog_path)
                self.split_doc_idx = i
                self.split_mode = 1
                return
        # Open as a new document
        if len(self.documents) < MAX_OPEN_FILES:
            new_doc = Document(clog_path)
            new_doc.load(clog_path)
            self.documents.append(new_doc)
            self.split_doc_idx = len(self.documents) - 1
            self.split_mode = 1

    def _close_clog_split(self):
        """If the split pane is showing clog.txt, close the split."""
        if self.split_mode != 1:
            return
        if self.split_doc_idx < len(self.documents):
            sdoc = self.documents[self.split_doc_idx]
            if sdoc.name == "clog.txt":
                self.split_mode = 0

    def _cmd_compile_and_run(self):
        """Compile the current file and, if successful, send the .prg to the C64."""
        if not self._cmd_compile():
            return
        d = self.doc
        # Determine .prg path: same directory and base name as source, with .prg ext
        src_dir = os.path.dirname(d.path)
        base = os.path.splitext(os.path.basename(d.path))[0]
        prg_path = os.path.join(src_dir, f"{base}.prg")
        if not os.path.isfile(prg_path):
            self.status_msg = ".prg not found"
            self._log_run(f"[run] .prg not found: {prg_path}")
            return

        from network_helper import read_last_c64_ip, send_dmawrite
        c64_ip = read_last_c64_ip()
        if not c64_ip:
            self.status_msg = "No C64 IP configured"
            self._log_run("[run] no C64 IP — check config")
            return

        try:
            with open(prg_path, "rb") as f:
                prg_data = f.read()

            # ── Debug info ──────────────────────────────────────────
            prg_size = len(prg_data)
            if prg_size < 2:
                self.status_msg = ".prg too small"
                self._log_run(f"[run] .prg too small ({prg_size} bytes)")
                return

            load_addr = int.from_bytes(prg_data[:2], "little")
            self._log_run(f"[run] {os.path.basename(prg_path)}")
            self._log_run(f"      load=${load_addr:04X}  size={prg_size}B")
            self._log_run(f"      target={c64_ip}")

            send_dmawrite(c64_ip, prg_data)

            self.status_msg = "Loaded to C64"
            self._log_run("[run] DMA write sent OK")
        except Exception as e:
            self.status_msg = f"C64 err: {e}"
            self._log_run(f"[run] error: {e}")
        finally:
            self.console_scroll = max(0, len(self.console_lines) - EDIT_ROWS)

    def _log_run(self, msg: str) -> None:
        """Append a debug line to the console log (visible via F7)."""
        self.console_lines.append(msg)

    # ── Split view ───────────────────────────────────────────────────
    def _ensure_split_doc(self):
        if self.split_doc_idx >= len(self.documents):
            self.split_doc_idx = 0
        if len(self.documents) > 1 and self.split_doc_idx == self.active_doc_idx:
            self.split_doc_idx = (self.active_doc_idx + 1) % len(self.documents)

    def _edit_rows(self) -> int:
        """Number of visible text rows for the active pane."""
        if self.split_mode == 1:  # horizontal split: each pane gets half
            return (EDIT_ROWS) // 2
        return EDIT_ROWS

    # =================================================================
    #  RENDERING — write everything into screen[] / color[] buffers
    # =================================================================

    def _full_render(self):
        """Re-render the entire 40x25 screen."""
        # Clear
        for i in range(SCREEN_SIZE):
            self.screen[i] = DEFAULT_SCREEN_CODE
            self.color[i] = COL_TEXT_FG

        self._render_menu_bar()
        self._render_status_bar()

        if self.mode == MODE_BROWSER:
            self._render_browser()
        elif self.mode == MODE_HELP:
            self._render_help()
        elif self.mode == MODE_CONSOLE:
            self._render_console_view()
        elif self.mode == MODE_FILE_LIST:
            self._render_file_list()
        elif self.mode == MODE_CONFIRM:
            self._render_confirm()
        elif self.mode in (MODE_FIND, MODE_REPLACE, MODE_GOTO_LINE):
            self._render_editor_pane(EDIT_TOP, EDIT_BOTTOM, self.doc, True)
            self._render_input_dialog()
        elif self.mode == MODE_MENU:
            self._render_editor_pane(EDIT_TOP, EDIT_BOTTOM, self.doc, True)
            self._render_submenu()
        else:
            # Normal edit mode — possibly with split
            if self.split_mode == 0:
                self._render_editor_pane(EDIT_TOP, EDIT_BOTTOM, self.doc, True)
            elif self.split_mode == 1:
                # Horizontal split (top/bottom)
                mid = EDIT_TOP + EDIT_ROWS // 2
                self._render_editor_pane(EDIT_TOP, mid - 1, self.doc, True)
                self._render_hsplit_divider(mid)
                if self.split_doc_idx < len(self.documents):
                    self._render_editor_pane(
                        mid + 1, EDIT_BOTTOM, self.documents[self.split_doc_idx], False
                    )
            elif self.split_mode == 2:
                # Vertical split (left/right)
                self._render_vsplit_panes()

    # ── Menu bar (row 0) ─────────────────────────────────────────────
    def _render_menu_bar(self):
        # Fill row 0 with reverse background
        for c in range(SCREEN_COLS):
            self.screen[c] = DEFAULT_SCREEN_CODE
            self.color[c] = COL_MENU_FG
        col = 0
        for idx, name in enumerate(self.menu_items):
            is_sel = self.mode == MODE_MENU and idx == self.menu_sel
            fg = COL_MENU_HI if is_sel else COL_MENU_FG
            self._put_text(0, col, name, fg, reverse=is_sel)
            col += len(name) + 1

        # Show tab indicators on right side
        tab_str = f"{self.active_doc_idx + 1}/{len(self.documents)}"
        self._put_text(0, SCREEN_COLS - len(tab_str) - 1, tab_str, COL_TAB_ACTIVE)

    # ── Submenu dropdown ─────────────────────────────────────────────
    def _render_submenu(self):
        if not self.submenu_open:
            return
        menu_name = self.menu_items[self.menu_sel]
        items = self.submenus[menu_name]
        # Compute X position of dropdown
        x = 1
        for i in range(self.menu_sel):
            x += len(self.menu_items[i]) + 1
        w = max(len(lbl) + len(key) + 2 for lbl, key in items) + 2
        if x + w > SCREEN_COLS:
            x = SCREEN_COLS - w
        for i, (lbl, key) in enumerate(items):
            row = MENU_ROW + 1 + i
            if row > EDIT_BOTTOM:
                break
            is_sel = i == self.submenu_sel
            fg = COL_MENU_HI if is_sel else COL_MENU_FG
            # Clear the row area
            for c in range(x, min(x + w, SCREEN_COLS)):
                pos = row * SCREEN_COLS + c
                self.screen[pos] = DEFAULT_SCREEN_CODE
                self.color[pos] = fg
            self._put_text(row, x + 1, lbl, fg, reverse=is_sel)
            self._put_text(row, x + w - len(key) - 1, key, COL_LINENO_FG)

    # ── Editor pane ──────────────────────────────────────────────────
    def _render_editor_pane(
        self,
        top_row: int,
        bottom_row: int,
        doc: Document,
        show_cursor: bool,
        col_offset: int = 0,
        pane_cols: int = SCREEN_COLS,
    ):
        """Render a document into screen rows [top_row..bottom_row]."""
        visible_rows = bottom_row - top_row + 1
        text_cols = pane_cols - LINE_NUM_WIDTH
        if text_cols < 1:
            text_cols = 1

        # Compute selection range
        sel = doc.ordered_selection()
        sel_start = sel[0] if sel else None
        sel_end = sel[1] if sel else None

        if self.word_wrap:
            self._render_editor_pane_wrapped(
                top_row, visible_rows, text_cols, doc,
                show_cursor, col_offset, pane_cols,
                sel_start, sel_end,
            )
            return

        for vi in range(visible_rows):
            screen_row = top_row + vi
            line_idx = doc.scroll_y + vi
            if line_idx < 0 or line_idx >= doc.line_count:
                continue

            # Line number
            lnum_str = f"{line_idx + 1:4d} "
            for ci, ch in enumerate(lnum_str):
                if ci < LINE_NUM_WIDTH and col_offset + ci < pane_cols:
                    pos = screen_row * SCREEN_COLS + col_offset + ci
                    self.screen[pos] = ascii_to_screencode(ord(ch))
                    self.color[pos] = COL_LINENO_FG

            # Text content
            line = doc.lines[line_idx]
            for ci in range(text_cols):
                char_idx = doc.scroll_x + ci
                scol = col_offset + LINE_NUM_WIDTH + ci
                if scol >= col_offset + pane_cols:
                    break
                pos = screen_row * SCREEN_COLS + scol
                if char_idx < len(line):
                    ch = line[char_idx]
                    sc = (
                        ascii_to_screencode(ord(ch))
                        if ord(ch) < 128
                        else DEFAULT_SCREEN_CODE
                    )
                    self.screen[pos] = sc
                else:
                    self.screen[pos] = DEFAULT_SCREEN_CODE

                # Determine color
                fg = COL_TEXT_FG
                # Check if in selection
                if sel_start and sel_end:
                    if self._in_selection(line_idx, char_idx, sel_start, sel_end):
                        fg = COL_SELECT_FG

                # Check if on search match
                for ml, mc, mlen in self.find_matches:
                    if ml == line_idx and mc <= char_idx < mc + mlen:
                        fg = COL_FIND_MATCH
                        break

                self.color[pos] = fg

            # Cursor
            if show_cursor and line_idx == doc.cursor_y:
                cx_screen = doc.cursor_x - doc.scroll_x
                if 0 <= cx_screen < text_cols:
                    scol = col_offset + LINE_NUM_WIDTH + cx_screen
                    pos = screen_row * SCREEN_COLS + scol
                    self.color[pos] = COL_CURSOR_FG
                    # Show cursor as reverse character
                    if pos < SCREEN_SIZE:
                        # reverse bit
                        self.screen[pos] = self.screen[pos] | 0x80

    def _render_editor_pane_wrapped(
        self,
        top_row: int,
        visible_rows: int,
        text_cols: int,
        doc: Document,
        show_cursor: bool,
        col_offset: int,
        pane_cols: int,
        sel_start,
        sel_end,
    ):
        """Render document with word-wrap into screen rows."""
        screen_row = top_row
        line_idx = doc.scroll_y

        while screen_row < top_row + visible_rows and line_idx < doc.line_count:
            line = doc.lines[line_idx]
            # Number of screen rows this line needs
            n_chunks = max(1, (len(line) + text_cols - 1) // text_cols)

            for chunk in range(n_chunks):
                if screen_row >= top_row + visible_rows:
                    break
                chunk_start = chunk * text_cols

                # Line number only on first chunk
                if chunk == 0:
                    lnum_str = f"{line_idx + 1:4d} "
                else:
                    lnum_str = "     "  # blank gutter for continuation
                for ci, ch in enumerate(lnum_str):
                    if ci < LINE_NUM_WIDTH and col_offset + ci < pane_cols:
                        pos = screen_row * SCREEN_COLS + col_offset + ci
                        self.screen[pos] = ascii_to_screencode(ord(ch))
                        self.color[pos] = COL_LINENO_FG

                # Text content for this chunk
                for ci in range(text_cols):
                    char_idx = chunk_start + ci
                    scol = col_offset + LINE_NUM_WIDTH + ci
                    if scol >= col_offset + pane_cols:
                        break
                    pos = screen_row * SCREEN_COLS + scol
                    if char_idx < len(line):
                        ch = line[char_idx]
                        sc = (
                            ascii_to_screencode(ord(ch))
                            if ord(ch) < 128
                            else DEFAULT_SCREEN_CODE
                        )
                        self.screen[pos] = sc
                    else:
                        self.screen[pos] = DEFAULT_SCREEN_CODE

                    # Determine color
                    fg = COL_TEXT_FG
                    if sel_start and sel_end:
                        if self._in_selection(line_idx, char_idx, sel_start, sel_end):
                            fg = COL_SELECT_FG
                    for ml, mc, mlen in self.find_matches:
                        if ml == line_idx and mc <= char_idx < mc + mlen:
                            fg = COL_FIND_MATCH
                            break
                    self.color[pos] = fg

                # Cursor
                if show_cursor and line_idx == doc.cursor_y:
                    if chunk_start <= doc.cursor_x < chunk_start + text_cols:
                        cx_screen = doc.cursor_x - chunk_start
                        scol = col_offset + LINE_NUM_WIDTH + cx_screen
                        pos = screen_row * SCREEN_COLS + scol
                        self.color[pos] = COL_CURSOR_FG
                        if pos < SCREEN_SIZE:
                            self.screen[pos] = self.screen[pos] | 0x80

                screen_row += 1

            line_idx += 1

    def _in_selection(
        self, line: int, col: int, start: Tuple[int, int], end: Tuple[int, int]
    ) -> bool:
        sy, sx = start
        ey, ex = end
        if line < sy or line > ey:
            return False
        if line == sy and line == ey:
            return sx <= col < ex
        if line == sy:
            return col >= sx
        if line == ey:
            return col < ex
        return True

    # ── Horizontal split divider ─────────────────────────────────────
    def _render_hsplit_divider(self, row: int):
        for c in range(SCREEN_COLS):
            pos = row * SCREEN_COLS + c
            self.screen[pos] = 0x40  # horizontal line gfx char
            self.color[pos] = COL_LINENO_FG

    # ── Vertical split panes ─────────────────────────────────────────
    def _render_vsplit_panes(self):
        half = SCREEN_COLS // 2  # 20 columns each
        # Left pane: active doc
        self._render_editor_pane(
            EDIT_TOP, EDIT_BOTTOM, self.doc, True, col_offset=0, pane_cols=half
        )
        # Divider
        for r in range(EDIT_TOP, EDIT_BOTTOM + 1):
            pos = r * SCREEN_COLS + half
            self.screen[pos] = 0x42  # vertical bar gfx
            self.color[pos] = COL_LINENO_FG
        # Right pane
        if self.split_doc_idx < len(self.documents):
            self._render_editor_pane(
                EDIT_TOP,
                EDIT_BOTTOM,
                self.documents[self.split_doc_idx],
                False,
                col_offset=half + 1,
                pane_cols=SCREEN_COLS - half - 1,
            )

    # ── Status bar (row 24) ──────────────────────────────────────────
    def _render_status_bar(self):
        d = self.doc
        # Fill status row
        for c in range(SCREEN_COLS):
            pos = STATUS_ROW * SCREEN_COLS + c
            self.screen[pos] = DEFAULT_SCREEN_CODE
            self.color[pos] = COL_STATUS_FG

        mod_char = "*" if d.modified else " "
        name = d.name[:15]
        pos_str = f"L{d.cursor_y + 1}C{d.cursor_x + 1}"
        lines_str = f"{d.line_count}LN"

        mode_labels = {
            MODE_EDIT: "edt",
            MODE_MENU: "mnu",
            MODE_BROWSER: "brw",
            MODE_FIND: "fnd",
            MODE_REPLACE: "rpl",
            MODE_GOTO_LINE: "gto",
            MODE_HELP: "hlp",
            MODE_CONSOLE: "sh$",
            MODE_FILE_LIST: "tab",
            MODE_CONFIRM: "?",
        }
        mode_str = mode_labels.get(self.mode, "?")

        wrap_str = " W" if self.word_wrap else ""
        if self.status_msg:
            status = f"{mod_char}{name} {self.status_msg}"
        else:
            status = f"{mod_char}{name} {pos_str} {lines_str} {mode_str}{wrap_str}"
        # Truncate or pad to 40
        status = status[:SCREEN_COLS].ljust(SCREEN_COLS)
        self._put_text(STATUS_ROW, 0, status, COL_STATUS_FG)

    # ── File browser view ────────────────────────────────────────────
    def _render_browser(self):
        # Title — show path relative to workspace root, mapped as /
        ws_real = os.path.realpath(WORKSPACE_DIR)
        cwd_real = os.path.realpath(self.browser_cwd)
        if cwd_real == ws_real:
            title = "/"
        else:
            title = "/" + os.path.relpath(cwd_real, ws_real)
        if len(title) > SCREEN_COLS - 2:
            title = "..." + title[-(SCREEN_COLS - 5) :]
        self._put_text(EDIT_TOP, 0, title, COL_HELP_FG)

        max_visible = EDIT_ROWS - 1  # -1 for title row
        for vi in range(max_visible):
            entry_idx = self.browser_scroll + vi
            row = EDIT_TOP + 1 + vi
            if entry_idx >= len(self.browser_entries):
                break
            name, is_dir = self.browser_entries[entry_idx]
            is_sel = entry_idx == self.browser_sel
            fg = COL_BROWSER_DIR if is_dir else COL_BROWSER_FILE
            if is_dir:
                display = f"[{name}]"
            else:
                display = f" {name}"
            display = display[:SCREEN_COLS]
            self._put_text(row, 0, display, fg, reverse=is_sel)

    # ── File list (tabs) view ────────────────────────────────────────
    def _render_file_list(self):
        self._put_text(EDIT_TOP, 0, "open files:", COL_HELP_FG)
        for i, d in enumerate(self.documents):
            row = EDIT_TOP + 1 + i
            if row > EDIT_BOTTOM:
                break
            is_active = i == self.active_doc_idx
            mod = "*" if d.modified else " "
            name = d.name[:30]
            fg = COL_TAB_ACTIVE if is_active else COL_TAB_INACTIVE
            self._put_text(row, 0, f"{mod}{i + 1}. {name}", fg, reverse=is_active)

    # ── Input dialog bar ─────────────────────────────────────────────
    def _render_input_dialog(self):
        row = EDIT_BOTTOM
        # Clear the row
        for c in range(SCREEN_COLS):
            pos = row * SCREEN_COLS + c
            self.screen[pos] = DEFAULT_SCREEN_CODE
            self.color[pos] = COL_PROMPT_FG
        prompt = self.input_prompt + self.input_buf
        prompt = prompt[:SCREEN_COLS]
        self._put_text(row, 0, prompt, COL_PROMPT_FG)
        # Cursor at end of input
        cx = len(self.input_prompt) + len(self.input_buf)
        if cx < SCREEN_COLS:
            pos = row * SCREEN_COLS + cx
            self.screen[pos] = DEFAULT_SCREEN_CODE | 0x80
            self.color[pos] = COL_CURSOR_FG

    # ── Confirm dialog ───────────────────────────────────────────────
    def _render_confirm(self):
        row = EDIT_TOP + EDIT_ROWS // 2
        self._put_text(row, 0, self.confirm_msg[:SCREEN_COLS], COL_PROMPT_FG)

    # ── Console view ─────────────────────────────────────────────────
    def _render_console_view(self):
        # Title
        self._put_text(EDIT_TOP, 0, "console (R/S=back)", COL_HELP_FG)
        max_visible = EDIT_ROWS - 2  # -1 title, -1 input line
        # Clamp scroll
        max_scroll = max(0, len(self.console_lines) - max_visible)
        if self.console_scroll > max_scroll:
            self.console_scroll = max_scroll
        for vi in range(max_visible):
            li = self.console_scroll + vi
            row = EDIT_TOP + 1 + vi
            if li < len(self.console_lines):
                text = self.console_lines[li][:SCREEN_COLS]
                self._put_text(row, 0, text, COL_CONSOLE_FG)
        # Input line at bottom
        input_row = EDIT_BOTTOM
        prompt = f"$ {self.console_input}"
        self._put_text(input_row, 0, prompt[:SCREEN_COLS], COL_CONSOLE_FG)
        cx = len(prompt)
        if cx < SCREEN_COLS:
            pos = input_row * SCREEN_COLS + cx
            self.screen[pos] = DEFAULT_SCREEN_CODE | 0x80
            self.color[pos] = COL_CURSOR_FG

    # ── Help view ────────────────────────────────────────────────────
    def _render_help(self):
        help_lines = [
            "=== hdn editor keys ===",
            "",
            " Navigation:",
            " arrows     move cursor",
            " home       start of line",
            " sh+home    top of file",
            " C=right    next word",
            " C=left     prev word",
            " C=<        page up",
            " C=>        page down",
            "",
            " Editing:",
            " return     new line",
            " del        backspace",
            " ins        insert space",
            " C=[ ]      (un)indent line"
            " arrow left underscore",
            " pound      backslash",
            " C=+q       { open curly brace",
            " C=+w       } close curly brace",
            " C=+£       ~ tilde",
            " sh+C=-     | pipe",
            "",
            " File operations:",
            " f1         file list/tabs",
            " f2         new file",
            " f3         open (browser)",
            " f5         save",
            " f6         save as",
            " ctrl+w     close file",
            "",
            " Clipboard:",
            " ctrl+b     mark block start",
            " ctrl+h     mark block end",
            " ctrl+a     select all",
            " C=+x       cut",
            " C=+c       copy",
            " C=+v       paste",
            " ctrl+y     delete line",
            "",
            " Search:",
            " C=+f       find (regex)",
            " C=+n       find next",
            " C=+r       replace all",
            " C=+g       goto line",
            "",
            " Oscar64 (Run menu):",
            " ctrl+e     compile",
            " ctrl+r     compile & run",
            "",
            " View:",
            " f7         console/shell",
            " f8         this help",
            " ctrl+uparw cycle split mode",
            " sh+uparrow swap pane focus",
            " RUN/STOP   open menu",
            " C=+p       toggle wrap",
            " C=+sh      change lo/up font",
            "",
            " press RUN/STOP to return",
        ]
        for vi in range(EDIT_ROWS):
            li = self.help_scroll + vi
            row = EDIT_TOP + vi
            if li < len(help_lines):
                text = help_lines[li][:SCREEN_COLS]
                self._put_text(row, 0, text, COL_HELP_FG)

    # ── Low-level text rendering helper ──────────────────────────────
    def _put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
        """Write ASCII text to screen buffer at (row, col) with colour."""
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                continue
            if row < 0 or row >= SCREEN_ROWS:
                return
            pos = row * SCREEN_COLS + c
            sc = ascii_to_screencode(ord(ch))
            if reverse:
                sc = sc | 0x80
            self.screen[pos] = sc
            self.color[pos] = fg

    # ── PETSCII → printable char helper ──────────────────────────────
    @staticmethod
    def _petscii_to_char(petscii: int) -> Optional[str]:
        """Convert a PETSCII code to a printable ASCII character, or None."""
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None
