"""
Server console subclass for the Coding Agent Chat (console 3, CMD+3).

A chat-based coding agent UI rendered into a 40x25 C64 screen-code
back-buffer.  The user types messages, the LLM agent responds, and
the conversation scrolls like a terminal chat.

Features:
- Chat history with scrollable view (Page Up/Down)
- Word-wrapped messages at 40 columns
- Role indicators: user (>), agent, system
- F3: browse and select a working directory
- Agent can read/write .c/.h files, compile, and run on C64
- Slash commands: /clear, /files, /compile, /run, /help
"""

import os
import logging
import threading
from typing import Optional, List, Tuple

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    DEFAULT_SCREEN_CODE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii
from workspace_init import WORKSPACE_DIR
from code_chat_handler import CodeChatAgent
from agent_tools import list_project_files
from network_helper import send_screen_data

logger = logging.getLogger(__name__)

# ── Colour palette ───────────────────────────────────────────────────
COL_STATUS_BG = 0   # black
COL_STATUS_FG = 1   # white
COL_USER_FG = 14    # light blue  (user messages)
COL_AGENT_FG = 13   # light green (agent messages)
COL_SYSTEM_FG = 3   # cyan        (system messages)
COL_ACTION_FG = 7   # yellow      (agent actions: wrote file, compiled)
COL_ERROR_FG = 2    # red         (errors)
COL_INPUT_FG = 1    # white       (input line)
COL_SEPARATOR_FG = 11  # dark grey
COL_BROWSER_DIR = 5    # green
COL_BROWSER_FILE = 14  # light blue
COL_HELP_FG = 3     # cyan
COL_THINKING_FG = 7  # yellow

# ── PETSCII key constants (same as file_editor_console.py) ───────────
KEY_RUNSTOP_ESC_CTRLC = 0x03
KEY_RETURN = 0x0D
KEY_CRSR_DN_CTRLQ = 0x11
KEY_HOME_CTRLS = 0x13
KEY_DEL_CTRLT = 0x14
KEY_CRSR_RT_CTRLSEMICOLON = 0x1D
KEY_SHIFT_COMA = 0x3C  # <  (page up with C=)
KEY_SHIFT_PERIOD = 0x3E  # >  (page down with C=)
KEY_F1 = 0x85
KEY_F3 = 0x86
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F2 = 0x89
KEY_F4 = 0x8A
KEY_F6 = 0x8B
KEY_F8 = 0x8C
KEY_CRSR_UP = 0x91
KEY_CLR = 0x93
KEY_CRSR_LT = 0x9D

# CBM+key constants
KEY_CBM_N = 0xAA
KEY_CBM_E = 0xB1
KEY_CBM_R = 0xB2
KEY_CBM_W = 0xB3

# ── Console modes ────────────────────────────────────────────────────
MODE_CHAT = 0
MODE_BROWSER = 1
MODE_HELP = 2
MODE_THINKING = 3

# ── Layout constants ─────────────────────────────────────────────────
STATUS_ROW = 0       # Row 0 = status bar
CHAT_TOP = 1         # First row of chat area
CHAT_BOTTOM = 22     # Last row of chat area
CHAT_ROWS = CHAT_BOTTOM - CHAT_TOP + 1  # 22 visible chat rows
SEPARATOR_ROW = 23   # Separator line
INPUT_ROW = 24       # Row 24 = input line (default, single-line)
INPUT_PROMPT = "> "
INPUT_MAX_ROWS = 10  # Max rows the input area can occupy
# Characters that fit on the first input line (after the prompt)
_FIRST_LINE_CHARS = SCREEN_COLS - len(INPUT_PROMPT)
# Characters that fit on subsequent (full-width) input lines
_CONT_LINE_CHARS = SCREEN_COLS


class CodingAgentConsole(ServerConsole):
    """
    Console 3 — Coding Agent Chat.

    All rendering is done into the inherited screen[] / color[] buffers.
    The C64 client fetches the display via GET_SCREEN.
    """

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)

        # Chat state
        # Each entry: (role, text) where role is "user", "agent", "system", "action", "error"
        self.chat_history: List[Tuple[str, str]] = []
        # Pre-rendered lines: (text, color) for each screen row
        self._rendered_lines: List[Tuple[str, int]] = []
        self.scroll_offset: int = 0  # 0 = bottom (most recent)

        # Input state
        self.input_buf: str = ""
        self.input_cursor: int = 0

        # Input history (recall previous messages with up/down arrows)
        self.input_history: List[str] = []
        self.input_history_idx: int = -1

        # Working directory
        self.working_dir: Optional[str] = None

        # Agent (created lazily)
        self._agent: Optional[CodeChatAgent] = None

        # Mode
        self.mode: int = MODE_CHAT

        # Browser state
        self.browser_cwd: str = WORKSPACE_DIR
        self.browser_entries: List[Tuple[str, bool]] = []
        self.browser_sel: int = 0
        self.browser_scroll: int = 0

        # Help scroll
        self.help_scroll: int = 0

        # Thinking state
        self._thinking: bool = False
        self._pending_response: Optional[str] = None
        self._thinking_thread: Optional[threading.Thread] = None
        self._refresh_timer: Optional[threading.Timer] = None

        # Status message
        self.status_msg: str = ""

        # Welcome message
        self._add_system_msg("C64 Coding Agent ready.")
        self._add_system_msg("Press F3 to select project dir.")
        self._add_system_msg("Press F8 for help.")

        self._full_render()

    # ── Agent access ─────────────────────────────────────────────────
    def _get_agent(self) -> CodeChatAgent:
        if self._agent is None:
            self._agent = CodeChatAgent()
            if self.working_dir:
                self._agent.set_working_dir(self.working_dir)
        return self._agent

    # =================================================================
    #  INPUT HANDLER
    # =================================================================
    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        self.status_msg = ""

        # Check if thinking thread finished
        if self._thinking and self._pending_response is not None:
            self._finish_thinking()

        handlers = {
            MODE_CHAT: self._key_chat,
            MODE_BROWSER: self._key_browser,
            MODE_HELP: self._key_help,
            MODE_THINKING: self._key_thinking,
        }
        handler = handlers.get(self.mode, self._key_chat)
        handler(petscii_code, modifiers)
        self._full_render()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None  # All input via keypresses

    # =================================================================
    #  KEY HANDLERS
    # =================================================================

    def _key_chat(self, key: int, mod: int):
        # Navigation
        if key == KEY_CRSR_UP:
            self._scroll_up(1)
        elif key == KEY_CRSR_DN_CTRLQ:
            self._scroll_down(1)
        elif key == KEY_SHIFT_COMA:  # C=+< → page up
            self._scroll_up(self._chat_rows)
        elif key == KEY_SHIFT_PERIOD:  # C=+> → page down
            self._scroll_down(self._chat_rows)
        elif key == KEY_HOME_CTRLS:
            self.scroll_offset = max(0, len(self._rendered_lines) - self._chat_rows)
        elif key == KEY_CLR:  # Shift+Home → scroll to bottom
            self.scroll_offset = 0

        # Function keys
        elif key == KEY_F3:
            self._enter_browser()
        elif key == KEY_F8:
            self._enter_help()

        # Input editing
        elif key == KEY_RETURN:
            self._send_input()
        elif key == KEY_DEL_CTRLT:
            if self.input_buf and self.input_cursor > 0:
                self.input_buf = (
                    self.input_buf[:self.input_cursor - 1]
                    + self.input_buf[self.input_cursor:]
                )
                self.input_cursor -= 1
        elif key == KEY_CRSR_LT:
            if self.input_cursor > 0:
                self.input_cursor -= 1
        elif key == KEY_CRSR_RT_CTRLSEMICOLON:
            if self.input_cursor < len(self.input_buf):
                self.input_cursor += 1
        else:
            # Try to insert printable character
            ch = self._petscii_to_char(key)
            if ch and self._input_rows(len(self.input_buf) + 1) <= INPUT_MAX_ROWS:
                self.input_buf = (
                    self.input_buf[:self.input_cursor]
                    + ch
                    + self.input_buf[self.input_cursor:]
                )
                self.input_cursor += 1

    def _key_browser(self, key: int, mod: int):
        max_visible = CHAT_ROWS
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
                    if new_cwd.startswith(os.path.realpath(WORKSPACE_DIR)):
                        self.browser_cwd = new_cwd
                    self._refresh_browser()
                else:
                    # In coding agent, selecting a file sets its parent as working dir
                    path = os.path.join(self.browser_cwd, name)
                    self._set_working_dir(os.path.dirname(path))
        elif key == KEY_F5:
            # F5 selects current directory as working dir
            self._set_working_dir(self.browser_cwd)
        elif key == KEY_RUNSTOP_ESC_CTRLC:
            self.mode = MODE_CHAT

    def _key_help(self, key: int, mod: int):
        if key == KEY_CRSR_DN_CTRLQ:
            self.help_scroll += 1
        elif key == KEY_CRSR_UP:
            if self.help_scroll > 0:
                self.help_scroll -= 1
        elif key in (KEY_RUNSTOP_ESC_CTRLC, KEY_F8):
            self.mode = MODE_CHAT

    def _key_thinking(self, key: int, mod: int):
        # While thinking, check if response arrived
        if self._pending_response is not None:
            self._finish_thinking()
        # Otherwise ignore most keys (animation will update on next keypress)

    # =================================================================
    #  CHAT LOGIC
    # =================================================================

    def _send_input(self):
        text = self.input_buf.strip()
        if not text:
            return

        # Save to history
        self.input_history.append(text)
        self.input_history_idx = -1

        # Clear input
        self.input_buf = ""
        self.input_cursor = 0

        # Handle slash commands
        if text.startswith("/"):
            self._handle_slash_command(text)
            return

        # Add user message to chat
        self._add_chat_msg("user", text)

        # Scroll to bottom
        self.scroll_offset = 0

        # Start thinking
        self._start_thinking(text)

    def _handle_slash_command(self, cmd: str):
        parts = cmd.split(None, 1)
        command = parts[0].lower()
        arg = parts[1] if len(parts) > 1 else ""

        if command == "/clear":
            self.chat_history.clear()
            self._rendered_lines.clear()
            self.scroll_offset = 0
            if self._agent is not None:
                self._agent.clear_history()
            self._add_system_msg("Chat cleared.")
        elif command == "/files":
            if self.working_dir:
                files = list_project_files(self.working_dir)
                self._add_system_msg(f"Project files:\n{files}")
            else:
                self._add_system_msg("No project dir set. Press F3.")
        elif command == "/compile":
            if self.working_dir:
                self._add_system_msg("Compiling...")
                self._start_thinking("/compile" + (f" {arg}" if arg else ""))
            else:
                self._add_system_msg("No project dir set. Press F3.")
        elif command == "/run":
            if self.working_dir:
                self._add_system_msg("Running...")
                self._start_thinking("/run")
            else:
                self._add_system_msg("No project dir set. Press F3.")
        elif command == "/help":
            self._enter_help()
        elif command == "/project":
            if self.working_dir:
                self._add_system_msg(f"Project: {self.working_dir}")
            else:
                self._add_system_msg("No project dir set. Press F3.")
        else:
            self._add_system_msg(f"Unknown command: {command}")

    def _start_thinking(self, query: str):
        """Start the LLM query in a background thread."""
        self._thinking = True
        self._pending_response = None
        self.mode = MODE_THINKING
        self.status_msg = "thinking..."

        agent = self._get_agent()

        def worker():
            try:
                response = agent.handle(query)
                self._pending_response = response
            except Exception as e:
                logger.error(f"Agent error: {e}", exc_info=True)
                self._pending_response = f"Error: {e}"

        self._thinking_thread = threading.Thread(target=worker, daemon=True)
        self._thinking_thread.start()
        self._start_refresh_timer()

    def _finish_thinking(self):
        """Process the completed LLM response."""
        response = self._pending_response
        self._pending_response = None
        self._thinking = False
        self._thinking_thread = None
        self.mode = MODE_CHAT
        self.status_msg = ""

        if response:
            self._add_chat_msg("agent", response)
        self.scroll_offset = 0
        self._stop_refresh_timer()

    # ── Periodic screen refresh while thinking ───────────────────────
    def _start_refresh_timer(self):
        """Schedule periodic screen pushes while the agent is thinking."""
        self._stop_refresh_timer()
        self._schedule_tick()

    def _stop_refresh_timer(self):
        t = self._refresh_timer
        if t is not None:
            t.cancel()
            self._refresh_timer = None

    def _schedule_tick(self):
        self._refresh_timer = threading.Timer(1.0, self._on_refresh_tick)
        self._refresh_timer.daemon = True
        self._refresh_timer.start()

    def _on_refresh_tick(self):
        """Called every ~1 s while the agent is thinking."""
        # Check if the worker thread produced a result
        if self._pending_response is not None:
            self._finish_thinking()

        if self._thinking:
            # Still thinking — re-render (animated dots) and schedule next tick
            self._full_render()
            self._push_screen()
            self._schedule_tick()
        else:
            # Just finished — render final state and push once
            self._full_render()
            self._push_screen()

    def _push_screen(self):
        """DMA-push the current screen/color buffers to the C64."""
        try:
            send_screen_data(bytes(self.screen), bytes(self.color))
        except Exception:
            logger.debug("Screen push failed (no C64 connected?)", exc_info=True)

    # =================================================================
    #  CHAT MESSAGE MANAGEMENT
    # =================================================================

    def _add_chat_msg(self, role: str, text: str):
        self.chat_history.append((role, text))
        self._rebuild_rendered_lines()

    def _add_system_msg(self, text: str):
        self._add_chat_msg("system", text)

    def _rebuild_rendered_lines(self):
        """Word-wrap all chat messages into screen-width lines with colors."""
        lines: List[Tuple[str, int]] = []
        for role, text in self.chat_history:
            color = self._color_for_role(role)
            prefix = "> " if role == "user" else ""
            wrapped = self._word_wrap(prefix + text, SCREEN_COLS)
            for wl in wrapped:
                lines.append((wl, color))
            # Blank line between messages
            lines.append(("", color))
        self._rendered_lines = lines

    @staticmethod
    def _color_for_role(role: str) -> int:
        return {
            "user": COL_USER_FG,
            "agent": COL_AGENT_FG,
            "system": COL_SYSTEM_FG,
            "action": COL_ACTION_FG,
            "error": COL_ERROR_FG,
        }.get(role, COL_AGENT_FG)

    @staticmethod
    def _word_wrap(text: str, width: int) -> List[str]:
        """Wrap text to lines of at most *width* characters."""
        result: List[str] = []
        for raw_line in text.split("\n"):
            if not raw_line:
                result.append("")
                continue
            while len(raw_line) > width:
                # Try to break at a space
                brk = raw_line.rfind(" ", 0, width)
                if brk <= 0:
                    brk = width
                result.append(raw_line[:brk])
                raw_line = raw_line[brk:].lstrip()
            result.append(raw_line)
        return result

    def _input_rows(self, buf_len: int = -1) -> int:
        """How many screen rows the current input buffer needs."""
        if buf_len < 0:
            buf_len = len(self.input_buf)
        if buf_len == 0:
            return 1
        # First row holds prompt + up to _FIRST_LINE_CHARS characters
        if buf_len <= _FIRST_LINE_CHARS:
            return 1
        remaining = buf_len - _FIRST_LINE_CHARS
        return 1 + -(-remaining // _CONT_LINE_CHARS)  # ceil division

    @property
    def _chat_rows(self) -> int:
        """Effective visible chat rows, shrinks as input grows."""
        input_h = self._input_rows()
        # Layout: status(1) + chat + separator(1) + input(input_h) = 25
        return SCREEN_ROWS - 1 - 1 - input_h  # min is enforced at render

    def _scroll_up(self, n: int):
        max_scroll = max(0, len(self._rendered_lines) - self._chat_rows)
        self.scroll_offset = min(self.scroll_offset + n, max_scroll)

    def _scroll_down(self, n: int):
        self.scroll_offset = max(0, self.scroll_offset - n)

    # =================================================================
    #  WORKING DIRECTORY
    # =================================================================

    def _set_working_dir(self, path: str):
        self.working_dir = path
        self.mode = MODE_CHAT

        # Update or create agent
        agent = self._get_agent()
        agent.set_working_dir(path)

        # Show in chat
        ws_real = os.path.realpath(WORKSPACE_DIR)
        display_path = os.path.relpath(os.path.realpath(path), ws_real)
        self._add_system_msg(f"Project dir: /{display_path}")

        # List files
        files = list_project_files(path)
        self._add_system_msg(f"Files: {files}")
        self.scroll_offset = 0

    # =================================================================
    #  BROWSER
    # =================================================================

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

    # =================================================================
    #  HELP
    # =================================================================

    def _enter_help(self):
        self.help_scroll = 0
        self.mode = MODE_HELP

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        """Re-render the entire 40x25 screen."""
        for i in range(SCREEN_SIZE):
            self.screen[i] = DEFAULT_SCREEN_CODE
            self.color[i] = COL_AGENT_FG

        self._render_status_bar()

        if self.mode == MODE_BROWSER:
            self._render_browser()
            self._render_browser_status()
        elif self.mode == MODE_HELP:
            self._render_help()
        else:
            # MODE_CHAT or MODE_THINKING
            self._render_chat_area()
            self._render_separator()
            self._render_input_line()

    # ── Status bar (row 0) ───────────────────────────────────────────
    def _render_status_bar(self):
        if self.working_dir:
            ws_real = os.path.realpath(WORKSPACE_DIR)
            display = "/" + os.path.relpath(os.path.realpath(self.working_dir), ws_real)
        else:
            display = "(no project)"
        if self._thinking:
            right = "thinking..."
        else:
            right = "idle"
        # Count files
        if self.working_dir and os.path.isdir(self.working_dir):
            n_files = sum(
                1 for f in os.listdir(self.working_dir)
                if f.endswith((".c", ".h"))
            )
            right = f"{n_files}f {right}"
        # Compose status line
        avail = SCREEN_COLS - len(right) - 1
        if len(display) > avail:
            display = "..." + display[-(avail - 3):]
        status = display.ljust(avail) + " " + right
        status = status[:SCREEN_COLS]
        self._put_text(STATUS_ROW, 0, status, COL_STATUS_FG, reverse=True)

    # ── Chat area (rows 1 .. dynamic bottom) ────────────────────────
    def _render_chat_area(self):
        chat_rows = self._chat_rows
        chat_bottom = CHAT_TOP + chat_rows - 1
        total = len(self._rendered_lines)
        # Calculate start index from bottom
        if total <= chat_rows:
            start = 0
        else:
            start = total - chat_rows - self.scroll_offset
            if start < 0:
                start = 0

        for vi in range(chat_rows):
            li = start + vi
            row = CHAT_TOP + vi
            if li < total:
                text, color = self._rendered_lines[li]
                self._put_text(row, 0, text[:SCREEN_COLS], color)

        # Thinking indicator
        if self._thinking:
            # Show animated dots on the last line of chat
            dots = "." * ((len(self._rendered_lines) % 3) + 1)
            self._put_text(chat_bottom, 0, f"thinking{dots}", COL_THINKING_FG)

    # ── Separator (dynamic row) ──────────────────────────────────────
    def _render_separator(self):
        sep_row = CHAT_TOP + self._chat_rows
        line = "-" * SCREEN_COLS
        self._put_text(sep_row, 0, line, COL_SEPARATOR_FG)

    # ── Input area (one or more rows from bottom of screen) ──────────
    def _render_input_line(self):
        input_h = self._input_rows()
        first_input_row = SCREEN_ROWS - input_h  # top row of input area

        if self._thinking:
            self._put_text(first_input_row, 0, INPUT_PROMPT + "(waiting...)", COL_SEPARATOR_FG)
            return

        prompt = INPUT_PROMPT
        prompt_len = len(prompt)

        # Build the full character sequence: prompt + input_buf
        full_text = prompt + self.input_buf
        # The cursor's absolute position within full_text
        abs_cursor = prompt_len + self.input_cursor

        # Render each row of the input area
        for r in range(input_h):
            row = first_input_row + r
            if r == 0:
                # First row: starts at column 0, includes the prompt
                line_start = 0
                line_chars = SCREEN_COLS
            else:
                # Continuation rows: full width
                line_start = prompt_len + _FIRST_LINE_CHARS + (r - 1) * _CONT_LINE_CHARS
                # Map back to full_text offset
                line_chars = _CONT_LINE_CHARS

            segment = full_text[line_start:line_start + line_chars]
            self._put_text(row, 0, segment, COL_INPUT_FG)

        # Draw cursor (reversed character)
        # Figure out which row and column the cursor falls on
        if abs_cursor < SCREEN_COLS:
            cursor_row = first_input_row
            cursor_col = abs_cursor
        else:
            past_first = abs_cursor - SCREEN_COLS
            extra_row = past_first // _CONT_LINE_CHARS + 1
            cursor_row = first_input_row + extra_row
            cursor_col = past_first % _CONT_LINE_CHARS

        if 0 <= cursor_row < SCREEN_ROWS and 0 <= cursor_col < SCREEN_COLS:
            pos = cursor_row * SCREEN_COLS + cursor_col
            if self.input_cursor < len(self.input_buf):
                ch = self.input_buf[self.input_cursor]
                self.screen[pos] = ascii_to_screencode(ord(ch)) | 0x80
            else:
                self.screen[pos] = DEFAULT_SCREEN_CODE | 0x80
            self.color[pos] = COL_INPUT_FG

    # ── File browser view ────────────────────────────────────────────
    def _render_browser(self):
        # Title
        ws_real = os.path.realpath(WORKSPACE_DIR)
        cwd_real = os.path.realpath(self.browser_cwd)
        if cwd_real == ws_real:
            title = "/"
        else:
            title = "/" + os.path.relpath(cwd_real, ws_real)
        if len(title) > SCREEN_COLS - 2:
            title = "..." + title[-(SCREEN_COLS - 5):]
        self._put_text(CHAT_TOP, 0, title, COL_HELP_FG)

        # Hint line
        self._put_text(CHAT_TOP + 1, 0, "RETURN=enter dir  F5=select dir", COL_SEPARATOR_FG)

        max_visible = CHAT_ROWS - 2  # -2 for title + hint
        for vi in range(max_visible):
            entry_idx = self.browser_scroll + vi
            row = CHAT_TOP + 2 + vi
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

    def _render_browser_status(self):
        status = "F5:select dir  RUN/STOP:cancel"
        status = status[:SCREEN_COLS].ljust(SCREEN_COLS)
        self._put_text(INPUT_ROW, 0, status, COL_STATUS_FG, reverse=True)

    # ── Help view ────────────────────────────────────────────────────
    def _render_help(self):
        help_lines = [
            "=== coding agent keys ===",
            "",
            " Chat:",
            " type + RETURN   send message",
            " up/down         scroll chat",
            " C=+< / C=+>    page up / down",
            " HOME            scroll to top",
            " SH+HOME         scroll to bottom",
            "",
            " Commands:",
            " F3              browse/select dir",
            " F8              this help",
            " /clear          clear chat",
            " /files          list project files",
            " /compile [f]    compile project",
            " /run            run on C64",
            " /project        show project dir",
            " /help           this help",
            "",
            " Browser:",
            " arrows          navigate",
            " RETURN          enter directory",
            " F5              select as project",
            " RUN/STOP        cancel",
            "",
            " press RUN/STOP to return",
        ]
        for vi in range(CHAT_ROWS + 2):  # Use full area
            li = self.help_scroll + vi
            row = CHAT_TOP + vi
            if row >= SCREEN_ROWS - 1:
                break
            if li < len(help_lines):
                text = help_lines[li][:SCREEN_COLS]
                self._put_text(row, 0, text, COL_HELP_FG)

    # ── Low-level text rendering ─────────────────────────────────────
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

    @staticmethod
    def _petscii_to_char(petscii: int) -> Optional[str]:
        """Convert a PETSCII code to a printable ASCII character, or None."""
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None
