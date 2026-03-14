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
from typing import Optional, List, Tuple, Dict

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    DEFAULT_SCREEN_CODE,
    ascii_to_screencode,
    petscii_to_screencode,
)
from generate_pet_asc_table import Petscii

logger = logging.getLogger(__name__)

# ── Colour palette (C64 colour nybbles) ─────────────────────────────
COL_MENU_BG      = 0   # black  (text on menu bar)
COL_MENU_FG      = 1   # white
COL_MENU_HI      = 7   # yellow  (highlighted menu item)
COL_STATUS_BG    = 0
COL_STATUS_FG    = 1   # white
COL_TEXT_FG      = 14  # light blue
COL_TEXT_FG2     = 13  # light green (split pane 2)
COL_LINENO_FG    = 15  # light grey
COL_CURSOR_FG    = 1   # white  (cursor highlight)
COL_SELECT_FG    = 7   # yellow (selected block)
COL_BROWSER_DIR  = 5   # green
COL_BROWSER_FILE = 14  # light blue
COL_HELP_FG      = 3   # cyan
COL_PROMPT_FG    = 1   # white
COL_CONSOLE_FG   = 5   # green
COL_TAB_ACTIVE   = 1   # white
COL_TAB_INACTIVE = 11  # dark grey
COL_FIND_MATCH   = 2   # red (highlight search matches)

# ── PETSCII key constants ────────────────────────────────────────────
KEY_RETURN  = 0x0D
KEY_DEL     = 0x14  # DELETE (backspace)
KEY_INS     = 0x94  # INSERT (SHIFT+DEL)
KEY_HOME    = 0x13
KEY_CLR     = 0x93  # SHIFT+HOME
KEY_CRSR_UP = 0x91
KEY_CRSR_DN = 0x11
KEY_CRSR_LT = 0x9D
KEY_CRSR_RT = 0x1D
KEY_F1      = 0x85
KEY_F2      = 0x89  # actually F2 in PETSCII
KEY_F3      = 0x86
KEY_F4      = 0x8A
KEY_F5      = 0x87
KEY_F6      = 0x8B
KEY_F7      = 0x88
KEY_F8      = 0x8C
KEY_ESC     = 0x1B  # RUN/STOP mapped as ESC
KEY_TAB     = 0x09

# Modifier flags (from command_handler.py)
MOD_SHIFT     = 0x01
MOD_CTRL      = 0x02
MOD_COMMODORE = 0x04

# ── Editor modes ─────────────────────────────────────────────────────
MODE_EDIT       = 0
MODE_MENU       = 1
MODE_BROWSER    = 2
MODE_FIND       = 3
MODE_REPLACE    = 4
MODE_GOTO_LINE  = 5
MODE_HELP       = 6
MODE_CONSOLE    = 7
MODE_FILE_LIST  = 8
MODE_CONFIRM    = 9

# ── Layout constants ─────────────────────────────────────────────────
MENU_ROW     = 0    # Row 0 = menu bar
STATUS_ROW   = 24   # Row 24 = status bar
EDIT_TOP     = 1    # First editable row
EDIT_BOTTOM  = 23   # Last editable row
EDIT_ROWS    = EDIT_BOTTOM - EDIT_TOP + 1  # 23 visible text rows
LINE_NUM_WIDTH = 5  # "1234 " -> 5 chars for line numbers
TEXT_START_COL = LINE_NUM_WIDTH
TEXT_COLS = SCREEN_COLS - TEXT_START_COL  # 35 usable text columns

# Maximum files / tabs
MAX_OPEN_FILES = 8

# ── Working directory (server-side) ──────────────────────────────────
DEFAULT_CWD = os.path.expanduser("~")


# =====================================================================
#  Document — stores the text content of a single open file
# =====================================================================
class Document:
    """An in-memory text document (list of lines)."""

    def __init__(self, path: Optional[str] = None):
        self.path: Optional[str] = path
        self.lines: List[str] = [""]
        self.modified: bool = False
        self.cursor_x: int = 0   # column within the line (char index)
        self.cursor_y: int = 0   # line index in self.lines
        self.scroll_x: int = 0   # horizontal scroll offset
        self.scroll_y: int = 0   # first visible line index
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

    def ordered_selection(self) -> Optional[Tuple[Tuple[int,int], Tuple[int,int]]]:
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
        before = line[:self.cursor_x]
        after = line[self.cursor_x:]
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
        # Clipboard
        self.clipboard: str = ""
        # Editor mode
        self.mode: int = MODE_EDIT
        self.prev_mode: int = MODE_EDIT
        # Menu state
        self.menu_items = ["file", "edit", "view", "search", "help"]
        self.menu_sel: int = 0
        self.submenu_open: bool = False
        self.submenu_sel: int = 0
        self.submenus: Dict[str, List[Tuple[str, str]]] = {
            "file": [
                ("new",       "f1"),
                ("open",      "f3"),
                ("save",      "f5"),
                ("save as",   "sf5"),
                ("close",     "c+w"),
                ("file list", "f2"),
            ],
            "edit": [
                ("cut",       "c+x"),
                ("copy",      "c+c"),
                ("paste",     "c+v"),
                ("sel start", "c+b"),
                ("sel end",   "c+e"),
                ("sel all",   "c+a"),
                ("del line",  "c+y"),
            ],
            "view": [
                ("console",   "f7"),
                ("split h",   "c+2"),
                ("split v",   "c+3"),
                ("no split",  "c+1"),
                ("tabs",      "f2"),
            ],
            "search": [
                ("find",      "c+f"),
                ("find next", "c+n"),
                ("replace",   "c+r"),
                ("goto line", "c+g"),
            ],
            "help": [
                ("keys",      "f8"),
            ],
        }
        # Find/replace state
        self.find_pattern: str = ""
        self.replace_text: str = ""
        self.find_matches: List[Tuple[int, int, int]] = []  # (line, col, length)
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
        # Confirm dialog
        self.confirm_msg: str = ""
        self.confirm_callback: Optional[str] = None
        # Help scroll
        self.help_scroll: int = 0
        # Initial render
        self._full_render()

    # ── Property: active document ────────────────────────────────────
    @property
    def doc(self) -> Document:
        return self.documents[self.active_doc_idx]

    # =================================================================
    #  INPUT HANDLER — all C64 input comes through here as key-presses
    # =================================================================
    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        """Route keypress based on current editor mode."""
        handlers = {
            MODE_EDIT:      self._key_edit,
            MODE_MENU:      self._key_menu,
            MODE_BROWSER:   self._key_browser,
            MODE_FIND:      self._key_input_dialog,
            MODE_REPLACE:   self._key_input_dialog,
            MODE_GOTO_LINE: self._key_input_dialog,
            MODE_HELP:      self._key_help,
            MODE_CONSOLE:   self._key_console,
            MODE_FILE_LIST: self._key_file_list,
            MODE_CONFIRM:   self._key_confirm,
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
        ctrl = bool(mod & MOD_CTRL)
        shift = bool(mod & MOD_SHIFT)
        cbm = bool(mod & MOD_COMMODORE)

        # ─ Navigation ─
        if key == KEY_CRSR_UP:
            if ctrl:
                d.scroll_y = max(0, d.scroll_y - 1)
            else:
                d.cursor_y -= 1
        elif key == KEY_CRSR_DN:
            if ctrl:
                d.scroll_y += 1
            else:
                d.cursor_y += 1
        elif key == KEY_CRSR_LT:
            if ctrl:
                # word left
                self._word_left(d)
            else:
                d.cursor_x -= 1
                if d.cursor_x < 0 and d.cursor_y > 0:
                    d.cursor_y -= 1
                    d.cursor_x = len(d.cur_line())
        elif key == KEY_CRSR_RT:
            if ctrl:
                self._word_right(d)
            else:
                d.cursor_x += 1
                if d.cursor_x > len(d.cur_line()) and d.cursor_y < d.line_count - 1:
                    d.cursor_y += 1
                    d.cursor_x = 0
        elif key == KEY_HOME:
            if shift:
                d.cursor_y = 0
                d.cursor_x = 0
            else:
                d.cursor_x = 0
        elif key == KEY_CLR:
            d.cursor_y = d.line_count - 1
            d.cursor_x = len(d.cur_line())

        # ─ Editing ─
        elif key == KEY_RETURN:
            self._insert_newline(d)
        elif key == KEY_DEL:
            self._backspace(d)
        elif key == KEY_INS:
            # Insert a space at cursor
            line = d.cur_line()
            d.set_cur_line(line[:d.cursor_x] + " " + line[d.cursor_x:])
        elif key == KEY_TAB:
            # Insert 4 spaces
            line = d.cur_line()
            d.set_cur_line(line[:d.cursor_x] + "    " + line[d.cursor_x:])
            d.cursor_x += 4

        # ─ Function keys ─
        elif key == KEY_F1:
            self._cmd_new_file()
        elif key == KEY_F2:
            self._enter_file_list()
        elif key == KEY_F3:
            self._enter_browser()
        elif key == KEY_F5:
            if shift:
                self._start_input("save as: ", "_cb_save_as")
            else:
                self._cmd_save()
        elif key == KEY_F7:
            self._enter_console()
        elif key == KEY_F8:
            self._enter_help()

        # ─ Commodore key combos ─
        elif cbm:
            self._handle_cbm_combo(key, d)

        # ─ CTRL combos ─
        elif ctrl:
            self._handle_ctrl_combo(key, d)

        # ─ ESC → open menu ─
        elif key == KEY_ESC:
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
                d.set_cur_line(line[:d.cursor_x] + ch + line[d.cursor_x:])
                d.cursor_x += 1

        d.clamp_cursor()
        d.ensure_visible(self._edit_rows(), TEXT_COLS)

    def _handle_cbm_combo(self, key: int, d: Document):
        """Handle Commodore+key combos."""
        ch = self._petscii_to_char(key)
        if ch is None:
            return
        c = ch.lower()
        if c == 'x':
            self._cmd_cut(d)
        elif c == 'c':
            self._cmd_copy(d)
        elif c == 'v':
            self._cmd_paste(d)
        elif c == 'b':
            d.sel_start = (d.cursor_y, d.cursor_x)
            if d.sel_end is None:
                d.sel_end = d.sel_start
        elif c == 'e':
            d.sel_end = (d.cursor_y, d.cursor_x)
            if d.sel_start is None:
                d.sel_start = d.sel_end
        elif c == 'a':
            d.sel_start = (0, 0)
            d.sel_end = (d.line_count - 1, len(d.lines[-1]))
        elif c == 'y':
            self._cmd_delete_line(d)
        elif c == 'f':
            self._start_input("find: ", "_cb_find")
        elif c == 'n':
            self._cmd_find_next()
        elif c == 'r':
            self._start_input("replace: ", "_cb_replace_prompt")
        elif c == 'g':
            self._start_input("goto line: ", "_cb_goto_line")
        elif c == 'w':
            self._cmd_close_file()
        elif c == 's':
            self._cmd_save()
        elif c == '1':
            self.split_mode = 0
        elif c == '2':
            self.split_mode = 1
            self._ensure_split_doc()
        elif c == '3':
            self.split_mode = 2
            self._ensure_split_doc()

    def _handle_ctrl_combo(self, key: int, d: Document):
        """Handle CTRL+key combos."""
        ch = self._petscii_to_char(key)
        if ch is None:
            return
        c = ch.lower()
        if c == 'f':
            self._start_input("find: ", "_cb_find")
        elif c == 'n':
            self._cmd_find_next()
        elif c == 'r':
            self._start_input("replace: ", "_cb_replace_prompt")
        elif c == 'g':
            self._start_input("goto line: ", "_cb_goto_line")
        elif c == 'x':
            self._cmd_cut(d)
        elif c == 'c':
            self._cmd_copy(d)
        elif c == 'v':
            self._cmd_paste(d)

    # ── MENU mode ────────────────────────────────────────────────────
    def _key_menu(self, key: int, mod: int):
        if key == KEY_CRSR_LT:
            if self.submenu_open:
                self.menu_sel = (self.menu_sel - 1) % len(self.menu_items)
                self.submenu_sel = 0
            else:
                self.menu_sel = (self.menu_sel - 1) % len(self.menu_items)
        elif key == KEY_CRSR_RT:
            if self.submenu_open:
                self.menu_sel = (self.menu_sel + 1) % len(self.menu_items)
                self.submenu_sel = 0
            else:
                self.menu_sel = (self.menu_sel + 1) % len(self.menu_items)
        elif key == KEY_CRSR_DN:
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
        elif key == KEY_ESC:
            self.mode = MODE_EDIT

    def _execute_menu_item(self):
        """Execute the currently selected menu item."""
        menu_name = self.menu_items[self.menu_sel]
        items = self.submenus[menu_name]
        label, _ = items[self.submenu_sel]
        self.mode = MODE_EDIT  # leave menu first

        if label == "new":
            self._cmd_new_file()
        elif label == "open":
            self._enter_browser()
        elif label == "save":
            self._cmd_save()
        elif label == "save as":
            self._start_input("save as: ", "_cb_save_as")
        elif label == "close":
            self._cmd_close_file()
        elif label == "file list":
            self._enter_file_list()
        elif label == "cut":
            self._cmd_cut(self.doc)
        elif label == "copy":
            self._cmd_copy(self.doc)
        elif label == "paste":
            self._cmd_paste(self.doc)
        elif label == "sel start":
            d = self.doc
            d.sel_start = (d.cursor_y, d.cursor_x)
            if d.sel_end is None:
                d.sel_end = d.sel_start
        elif label == "sel end":
            d = self.doc
            d.sel_end = (d.cursor_y, d.cursor_x)
            if d.sel_start is None:
                d.sel_start = d.sel_end
        elif label == "sel all":
            d = self.doc
            d.sel_start = (0, 0)
            d.sel_end = (d.line_count - 1, len(d.lines[-1]))
        elif label == "del line":
            self._cmd_delete_line(self.doc)
        elif label == "console":
            self._enter_console()
        elif label == "split h":
            self.split_mode = 1
            self._ensure_split_doc()
        elif label == "split v":
            self.split_mode = 2
            self._ensure_split_doc()
        elif label == "no split":
            self.split_mode = 0
        elif label == "tabs":
            self._enter_file_list()
        elif label == "find":
            self._start_input("find: ", "_cb_find")
        elif label == "find next":
            self._cmd_find_next()
        elif label == "replace":
            self._start_input("replace: ", "_cb_replace_prompt")
        elif label == "goto line":
            self._start_input("goto line: ", "_cb_goto_line")
        elif label == "keys":
            self._enter_help()

    # ── BROWSER mode ─────────────────────────────────────────────────
    def _key_browser(self, key: int, mod: int):
        max_visible = EDIT_ROWS
        if key == KEY_CRSR_DN:
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
                        self.browser_cwd = os.path.dirname(self.browser_cwd)
                    else:
                        self.browser_cwd = os.path.join(self.browser_cwd, name)
                    self._refresh_browser()
                else:
                    path = os.path.join(self.browser_cwd, name)
                    self._open_file(path)
                    self.mode = MODE_EDIT
        elif key == KEY_ESC:
            self.mode = MODE_EDIT

    # ── FILE LIST mode ───────────────────────────────────────────────
    def _key_file_list(self, key: int, mod: int):
        if key == KEY_CRSR_DN:
            self.active_doc_idx = (self.active_doc_idx + 1) % len(self.documents)
        elif key == KEY_CRSR_UP:
            self.active_doc_idx = (self.active_doc_idx - 1) % len(self.documents)
        elif key == KEY_RETURN:
            self.mode = MODE_EDIT
        elif key == KEY_ESC:
            self.mode = MODE_EDIT

    # ── INPUT DIALOG mode (find, replace, goto line, save-as) ────────
    def _key_input_dialog(self, key: int, mod: int):
        if key == KEY_RETURN:
            cb = self.input_callback
            self.mode = MODE_EDIT
            if cb and hasattr(self, cb):
                getattr(self, cb)()
        elif key == KEY_ESC:
            self.mode = MODE_EDIT
        elif key == KEY_DEL:
            if self.input_buf:
                self.input_buf = self.input_buf[:-1]
        else:
            ch = self._petscii_to_char(key)
            if ch is not None:
                self.input_buf += ch

    # ── HELP mode ────────────────────────────────────────────────────
    def _key_help(self, key: int, mod: int):
        if key == KEY_ESC or key == KEY_F8:
            self.mode = MODE_EDIT
        elif key == KEY_CRSR_DN:
            self.help_scroll += 1
        elif key == KEY_CRSR_UP:
            self.help_scroll = max(0, self.help_scroll - 1)

    # ── CONSOLE (shell) mode ─────────────────────────────────────────
    def _key_console(self, key: int, mod: int):
        if key == KEY_ESC or key == KEY_F7:
            self.mode = MODE_EDIT
        elif key == KEY_RETURN:
            self._execute_console_command()
        elif key == KEY_DEL:
            if self.console_input:
                self.console_input = self.console_input[:-1]
        elif key == KEY_CRSR_UP:
            self.console_scroll = max(0, self.console_scroll - 1)
        elif key == KEY_CRSR_DN:
            self.console_scroll += 1
        else:
            ch = self._petscii_to_char(key)
            if ch is not None:
                self.console_input += ch

    # ── CONFIRM dialog mode ──────────────────────────────────────────
    def _key_confirm(self, key: int, mod: int):
        ch = self._petscii_to_char(key)
        if ch and ch.lower() == 'y':
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
            self.clipboard = d.get_selected_text()
            d.delete_selection()

    def _cmd_copy(self, d: Document):
        if d.has_selection():
            self.clipboard = d.get_selected_text()

    def _cmd_paste(self, d: Document):
        if self.clipboard:
            d.insert_text_at_cursor(self.clipboard)

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
        d.set_cur_line(line[:d.cursor_x])
        d.lines.insert(d.cursor_y + 1, line[d.cursor_x:])
        d.cursor_y += 1
        d.cursor_x = 0
        d.modified = True

    def _backspace(self, d: Document):
        if d.has_selection():
            d.delete_selection()
            return
        if d.cursor_x > 0:
            line = d.cur_line()
            d.set_cur_line(line[:d.cursor_x - 1] + line[d.cursor_x:])
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
        while x > 0 and (x - 1 >= len(line) or line[x - 1] == ' '):
            x -= 1
        while x > 0 and x - 1 < len(line) and line[x - 1] != ' ':
            x -= 1
        d.cursor_x = x

    def _word_right(self, d: Document):
        line = d.cur_line()
        x = d.cursor_x
        while x < len(line) and line[x] != ' ':
            x += 1
        while x < len(line) and line[x] == ' ':
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
        try:
            result = subprocess.run(
                cmd, shell=True, capture_output=True, text=True,
                timeout=10, cwd=self.browser_cwd
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

    # ── Help ─────────────────────────────────────────────────────────
    def _enter_help(self):
        self.mode = MODE_HELP
        self.help_scroll = 0

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
                    self._render_editor_pane(mid + 1, EDIT_BOTTOM,
                                             self.documents[self.split_doc_idx], False)
            elif self.split_mode == 2:
                # Vertical split (left/right)
                self._render_vsplit_panes()

    # ── Menu bar (row 0) ─────────────────────────────────────────────
    def _render_menu_bar(self):
        # Fill row 0 with reverse background
        for c in range(SCREEN_COLS):
            self.screen[c] = DEFAULT_SCREEN_CODE
            self.color[c] = COL_MENU_FG
        col = 1
        for idx, name in enumerate(self.menu_items):
            is_sel = (self.mode == MODE_MENU and idx == self.menu_sel)
            fg = COL_MENU_HI if is_sel else COL_MENU_FG
            self._put_text(0, col, name.upper(), fg, reverse=is_sel)
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
            is_sel = (i == self.submenu_sel)
            fg = COL_MENU_HI if is_sel else COL_MENU_FG
            # Clear the row area
            for c in range(x, min(x + w, SCREEN_COLS)):
                pos = row * SCREEN_COLS + c
                self.screen[pos] = DEFAULT_SCREEN_CODE
                self.color[pos] = fg
            self._put_text(row, x + 1, lbl, fg, reverse=is_sel)
            self._put_text(row, x + w - len(key) - 1, key, COL_LINENO_FG)

    # ── Editor pane ──────────────────────────────────────────────────
    def _render_editor_pane(self, top_row: int, bottom_row: int,
                            doc: Document, show_cursor: bool,
                            col_offset: int = 0, pane_cols: int = SCREEN_COLS):
        """Render a document into screen rows [top_row..bottom_row]."""
        visible_rows = bottom_row - top_row + 1
        text_cols = pane_cols - LINE_NUM_WIDTH
        if text_cols < 1:
            text_cols = 1

        # Compute selection range
        sel = doc.ordered_selection()
        sel_start = sel[0] if sel else None
        sel_end = sel[1] if sel else None

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
                    sc = ascii_to_screencode(ord(ch)) if ord(ch) < 128 else DEFAULT_SCREEN_CODE
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
                for (ml, mc, mlen) in self.find_matches:
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
                        self.screen[pos] = self.screen[pos] | 0x80  # reverse bit

    def _in_selection(self, line: int, col: int,
                      start: Tuple[int, int], end: Tuple[int, int]) -> bool:
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
        self._render_editor_pane(EDIT_TOP, EDIT_BOTTOM, self.doc, True,
                                 col_offset=0, pane_cols=half)
        # Divider
        for r in range(EDIT_TOP, EDIT_BOTTOM + 1):
            pos = r * SCREEN_COLS + half
            self.screen[pos] = 0x42  # vertical bar gfx
            self.color[pos] = COL_LINENO_FG
        # Right pane
        if self.split_doc_idx < len(self.documents):
            self._render_editor_pane(EDIT_TOP, EDIT_BOTTOM,
                                     self.documents[self.split_doc_idx], False,
                                     col_offset=half + 1,
                                     pane_cols=SCREEN_COLS - half - 1)

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
        pos_str = f"l{d.cursor_y + 1}c{d.cursor_x + 1}"
        lines_str = f"{d.line_count}ln"

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

        status = f"{mod_char}{name} {pos_str} {lines_str} {mode_str}"
        # Truncate or pad to 40
        status = status[:SCREEN_COLS].ljust(SCREEN_COLS)
        self._put_text(STATUS_ROW, 0, status, COL_STATUS_FG)

    # ── File browser view ────────────────────────────────────────────
    def _render_browser(self):
        # Title
        title = self.browser_cwd
        if len(title) > SCREEN_COLS - 2:
            title = "..." + title[-(SCREEN_COLS - 5):]
        self._put_text(EDIT_TOP, 0, title, COL_HELP_FG)

        max_visible = EDIT_ROWS - 1  # -1 for title row
        for vi in range(max_visible):
            entry_idx = self.browser_scroll + vi
            row = EDIT_TOP + 1 + vi
            if entry_idx >= len(self.browser_entries):
                break
            name, is_dir = self.browser_entries[entry_idx]
            is_sel = (entry_idx == self.browser_sel)
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
            is_active = (i == self.active_doc_idx)
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
        self._put_text(EDIT_TOP, 0, "console (esc=back)", COL_HELP_FG)
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
            " navigation:",
            " arrows     move cursor",
            " home       start of line",
            " shift+home top of file",
            " clr        end of file",
            " ctrl+arrow scroll/word",
            "",
            " editing:",
            " return     new line",
            " del        backspace",
            " ins        insert space",
            " tab        insert 4 spaces",
            "",
            " file operations:",
            " f1         new file",
            " f2         file list/tabs",
            " f3         open (browser)",
            " f5         save",
            " shift+f5   save as",
            " c=+w       close file",
            "",
            " clipboard:",
            " c=+b       mark block start",
            " c=+e       mark block end",
            " c=+a       select all",
            " c=+x       cut",
            " c=+c       copy",
            " c=+v       paste",
            " c=+y       delete line",
            "",
            " search:",
            " c=+f       find (regex)",
            " c=+n       find next",
            " c=+r       replace all",
            " c=+g       goto line",
            "",
            " view:",
            " f7         console/shell",
            " f8         this help",
            " c=+1       no split",
            " c=+2       split top/bottom",
            " c=+3       split left/right",
            " esc        open menu",
            "",
            " press esc to return",
        ]
        for vi in range(EDIT_ROWS):
            li = self.help_scroll + vi
            row = EDIT_TOP + vi
            if li < len(help_lines):
                text = help_lines[li][:SCREEN_COLS]
                self._put_text(row, 0, text, COL_HELP_FG)

    # ── Low-level text rendering helper ──────────────────────────────
    def _put_text(self, row: int, col: int, text: str, fg: int,
                  reverse: bool = False):
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
