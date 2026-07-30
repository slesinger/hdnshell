"""
Launcher / dashboard server console (console 1) for HDN Server — GH issue #22.

A browsable catalog of all console apps with short descriptions, live badges,
a dashboard header band (clock/date, server status, aggregate unread), and a
flow to (re)assign apps to the C=+CTRL+<digit> hotbar.

Reached from the C64 with C=+CTRL+1. Digit shortcuts (2-7, 0) become
user-configurable *pins* into this catalog rather than fixed app identities.

Layout (40x25):
  rows 0-1   dashboard band (title+clock, server dot + aggregate unread)
  row  2     separator
  rows 3-22  catalog list (left) + detail pane (right)
  row  23    hint line
  row  24    status / search bar
"""

import logging
import time
from typing import List, Optional

from sdk.server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    char_to_screencode as _char_to_screencode,
)
from sdk.app_registry import AppRegistry, AppInfo
from sdk.launcher_config import LauncherConfig, PINNABLE_SLOTS
from sdk.console_manager import ConsoleManager
from sdk.generate_pet_asc_table import Petscii
from sdk.text_utils import word_wrap as _word_wrap

logger = logging.getLogger(__name__)

# ── C64 colour palette ──────────────────────────────────────────────
COL_BLACK = 0
COL_WHITE = 1
COL_CYAN = 3
COL_GREEN = 5
COL_BLUE = 6
COL_YELLOW = 7
COL_ORANGE = 8
COL_RED = 2
COL_DARK_GREY = 11
COL_GREY = 12
COL_LIGHT_GREEN = 13
COL_LIGHT_BLUE = 14
COL_LIGHT_GREY = 15

# ── Screen-code constants ───────────────────────────────────────────
SC_SPACE = 0x20
SC_REVERSE_BIT = 0x80
SC_HLINE = 0x63

# ── PETSCII key constants ───────────────────────────────────────────
KEY_RETURN = 0x0D
KEY_RUNSTOP = 0x03
KEY_DEL = 0x14
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91

# ── Layout ───────────────────────────────────────────────────────────
DASH_TITLE_ROW = 0
DASH_STATUS_ROW = 1
SEP_ROW = 2
LIST_TOP = 3
LIST_BOTTOM = 22
LIST_ROWS = LIST_BOTTOM - LIST_TOP + 1  # 20
HINT_ROW = 23
STATUS_ROW = 24

# Column split: catalog list on the left, detail pane on the right.
LIST_WIDTH = 24
DETAIL_COL = LIST_WIDTH + 1  # leave a 1-col gutter
DETAIL_WIDTH = SCREEN_COLS - DETAIL_COL


class LauncherConsole(ServerConsole):
    """Console 1 — the app launcher / dashboard."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)

        # When opened as an unpinned slot (console_id != 1) the launcher
        # pre-highlights that empty slot so a digit-press pins it there.
        self.focus_slot: Optional[int] = console_id if console_id != 1 else None

        self.registry = AppRegistry.instance()
        self.config = LauncherConfig.load(self.registry.default_pins())

        # Cursor / view state
        self.sel: int = 0
        self.scroll: int = 0

        # Filter/search state
        self.filtering: bool = False
        self.filter_text: str = ""

        # Transient status message
        self.status_msg: str = ""

        self._select_initial()
        self._full_render()

    # =================================================================
    #  LIFECYCLE
    # =================================================================

    def on_activate(self):
        # Reload config in case another session/console changed pins.
        self.config = LauncherConfig.load(self.registry.default_pins())
        # Match the local shell's default C64 palette (border light-blue,
        # background blue) so switching between the Launcher and BASIC is
        # visually consistent -- see the RESTORE_SCREEN reset in
        # command_handler. GH #22.
        self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
        self._full_render()

    def on_deactivate(self):
        pass

    # =================================================================
    #  CATALOG / SELECTION HELPERS
    # =================================================================

    def _apps(self) -> List[AppInfo]:
        """Return the (optionally filtered) catalog list."""
        apps = self.registry.all_apps()
        if self.filter_text:
            q = self.filter_text.lower()
            apps = [
                a
                for a in apps
                if q in a.title.lower() or q in a.description.lower()
            ]
        return apps

    def _select_initial(self):
        """Pre-select the resume app (home) or the app on the focused slot."""
        apps = self._apps()
        if not apps:
            self.sel = 0
            return
        target_app_id: Optional[str] = None
        if self.focus_slot is None:
            # Home: highlight the most-recently-used app.
            target_app_id = self.config.last_used
        else:
            # Opened as an empty slot: highlight whatever app defaults there.
            for a in apps:
                if a.default_slot == self.focus_slot:
                    target_app_id = a.app_id
                    break
        self.sel = 0
        if target_app_id:
            for i, a in enumerate(apps):
                if a.app_id == target_app_id:
                    self.sel = i
                    break
        self._ensure_visible()

    def _ensure_visible(self):
        if self.sel < self.scroll:
            self.scroll = self.sel
        elif self.sel >= self.scroll + LIST_ROWS:
            self.scroll = self.sel - LIST_ROWS + 1

    def _current_app(self) -> Optional[AppInfo]:
        apps = self._apps()
        if 0 <= self.sel < len(apps):
            return apps[self.sel]
        return None

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        self.status_msg = ""
        if self.filtering:
            self._key_filter(petscii_code)
        else:
            self._key_catalog(petscii_code)
        self._full_render()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    def _key_catalog(self, key: int):
        apps = self._apps()
        n = len(apps)

        if key == KEY_CRSR_UP:
            if self.sel > 0:
                self.sel -= 1
                self._ensure_visible()
        elif key == KEY_CRSR_DN:
            if self.sel < n - 1:
                self.sel += 1
                self._ensure_visible()
        elif key == KEY_RETURN:
            app = self._current_app()
            if app:
                self._open_app(app.app_id)
        else:
            ch = self._petscii_to_char(key)
            if ch == "/":
                self.filtering = True
                self.filter_text = ""
            elif ch and ch in "1234567890":
                self._pin_current(ch)
            elif ch and ch.lower() == "x":
                self._unpin_current()

    def _key_filter(self, key: int):
        if key in (KEY_RETURN, KEY_RUNSTOP):
            self.filtering = False
            self.sel = 0
            self.scroll = 0
        elif key == KEY_DEL:
            self.filter_text = self.filter_text[:-1]
            self.sel = 0
            self.scroll = 0
        else:
            ch = self._petscii_to_char(key)
            if ch and ch.isprintable() and len(self.filter_text) < 30:
                self.filter_text += ch
                self.sel = 0
                self.scroll = 0

    # =================================================================
    #  PIN / UNPIN / OPEN
    # =================================================================

    def _digit_to_slot(self, ch: str) -> Optional[int]:
        """Map a typed digit to a pinnable console slot ('0' -> slot 10)."""
        slot = 10 if ch == "0" else int(ch)
        return slot if slot in PINNABLE_SLOTS else None

    def _pin_current(self, ch: str):
        app = self._current_app()
        if not app:
            return
        slot = self._digit_to_slot(ch)
        if slot is None:
            self.status_msg = f"Slot {ch} cannot be pinned"
            return
        self.config.pin(slot, app.app_id)
        self._apply_pin(slot, app.app_id)
        self.status_msg = f"Pinned {app.title} to {self._slot_label(slot)}"

    def _unpin_current(self):
        app = self._current_app()
        if not app:
            return
        slot = self.config.slot_for_app(app.app_id)
        if slot is None:
            self.status_msg = f"{app.title} is not pinned"
            return
        self.config.unpin(slot)
        self._apply_unpin(slot)
        self.status_msg = f"Unpinned {app.title}"

    def _apply_pin(self, slot: int, app_id: str):
        """Re-register the affected console slot's factory and evict its cache."""
        info = self.registry.get(app_id)
        if info is None:
            return
        mgr = ConsoleManager.instance()
        try:
            mgr.register_factory(slot, info.factory)
            mgr.remove_console(slot, self.session_id)
        except Exception:
            logger.exception("Failed to apply pin slot=%s app=%s", slot, app_id)

    def _apply_unpin(self, slot: int):
        """Unpinned slot falls back to a Launcher opened pre-highlighting it."""
        mgr = ConsoleManager.instance()
        try:
            mgr.register_factory(slot, LauncherConsole)
            mgr.remove_console(slot, self.session_id)
        except Exception:
            logger.exception("Failed to apply unpin slot=%s", slot)

    def _open_app(self, app_id: str):
        """Open the highlighted app: switch the active console to its slot,
        DMA-write w_console ($03EF) so the wedge routes keys there, and paint
        that console's screen. Hardware steps are best-effort (no-op off HW)."""
        info = self.registry.get(app_id)
        if info is None:
            return
        # Resolve the slot the app lives on: its pin, else its default.
        slot = self.config.slot_for_app(app_id)
        if slot is None:
            slot = info.default_slot

        mgr = ConsoleManager.instance()
        # Ensure the target slot builds this app.
        try:
            mgr.register_factory(slot, info.factory)
        except Exception:
            logger.exception("open: register_factory failed slot=%s", slot)

        self.config.add_recent(app_id)

        # get_screen_data() creates the console, runs on_activate via
        # _notify_switch, and returns the rendered buffer.
        try:
            screen = mgr.get_screen_data(slot, self.session_id)
            color = mgr.get_color_data(slot, self.session_id)
        except Exception:
            logger.exception("open: could not render target console slot=%s", slot)
            return

        self._route_and_paint(slot, screen, color)

    def _route_and_paint(self, slot: int, screen: bytes, color: bytes):
        """DMA-write w_console=$03EF and paint the target console (HW only)."""
        try:
            from sdk import network_helper as nh

            host = nh.read_last_c64_ip()
            if host:
                # w_console lives at $03EF; console nibble = slot << 4.
                nh.send_dmawrite(host, bytes([0xEF, 0x03, (slot << 4) & 0xFF]))
            nh.send_screen_data(screen, color)
        except Exception:
            logger.debug("open: route/paint failed (off hardware?)", exc_info=True)

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = COL_LIGHT_GREY

        self._render_dashboard()
        self._render_separator()
        self._render_list()
        self._render_detail()
        self._render_hint()
        self._render_status()

    def _render_dashboard(self):
        now = time.localtime()
        clock = time.strftime("%H:%M", now)
        date = time.strftime("%a %d %b", now)
        title = "HDN LAUNCHER"
        # Row 0: reverse title bar with clock at the right.
        left = f" {title}"
        right = f"{date} {clock} "
        bar = left + " " * max(1, SCREEN_COLS - len(left) - len(right)) + right
        bar = bar[:SCREEN_COLS].ljust(SCREEN_COLS)
        for col, ch in enumerate(bar):
            self.screen[col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[col] = COL_WHITE

        # Row 1: aggregate attention summary. (No server-status line: the
        # Launcher only renders while the server is online, so it would always
        # read "online" and carries no information.)
        unread = self._aggregate_unread()
        if unread:
            note = f"{unread} unread"
            self._write(DASH_STATUS_ROW, SCREEN_COLS - len(note), note, COL_YELLOW)

    def _render_separator(self):
        off = SEP_ROW * SCREEN_COLS
        for c in range(SCREEN_COLS):
            self.screen[off + c] = SC_HLINE
            self.color[off + c] = COL_DARK_GREY

    def _render_list(self):
        apps = self._apps()
        if not apps:
            self._write(LIST_TOP + 1, 1, "No apps match filter.", COL_LIGHT_GREY)
            return
        for i in range(LIST_ROWS):
            idx = self.scroll + i
            if idx >= len(apps):
                break
            app = apps[idx]
            row = LIST_TOP + i
            is_sel = idx == self.sel

            chip = self._app_chip(app.app_id)
            badge = self._app_badge(app.app_id)
            title = app.title[: LIST_WIDTH - 4]
            line = f"{chip}{title}"
            line = line[:LIST_WIDTH].ljust(LIST_WIDTH)
            # Place badge at the right edge of the list column if present.
            if badge:
                b = badge[:3]
                line = line[: LIST_WIDTH - len(b) - 1].ljust(LIST_WIDTH - len(b) - 1)
                line = line + " " + b

            if is_sel:
                self._write(row, 0, line.ljust(LIST_WIDTH), COL_WHITE, reverse=True)
            else:
                # chip in cyan, title in light grey
                self._write(row, 0, chip, COL_CYAN)
                self._write(row, len(chip), title, COL_LIGHT_GREY)
                if badge:
                    b = badge[:3]
                    self._write(row, LIST_WIDTH - len(b), b, COL_YELLOW)

    def _render_detail(self):
        app = self._current_app()
        # Vertical divider between list and detail.
        for r in range(LIST_TOP, LIST_BOTTOM + 1):
            self.screen[r * SCREEN_COLS + LIST_WIDTH] = SC_SPACE
        if app is None:
            return
        row = LIST_TOP
        for line in _word_wrap(app.title, DETAIL_WIDTH):
            self._write(row, DETAIL_COL, line, COL_YELLOW)
            row += 1
        row += 1
        for line in _word_wrap(app.description, DETAIL_WIDTH):
            if row > LIST_BOTTOM:
                break
            self._write(row, DETAIL_COL, line, COL_LIGHT_GREY)
            row += 1
        # Pin state
        slot = self.config.slot_for_app(app.app_id)
        if row <= LIST_BOTTOM - 1:
            pin_txt = (
                f"pinned {self._slot_label(slot)}" if slot else "not pinned"
            )
            self._write(LIST_BOTTOM, DETAIL_COL, pin_txt[:DETAIL_WIDTH], COL_GREEN)

    def _render_hint(self):
        if self.focus_slot is not None:
            hint = f"Slot {self._slot_label(self.focus_slot)} empty - pick+pin"
            self._write(HINT_ROW, 0, hint[:SCREEN_COLS], COL_ORANGE)
        else:
            hint = "[RET]open [1-7/0]pin [x]unpin [/]find"
            self._write(HINT_ROW, 0, hint[:SCREEN_COLS], COL_DARK_GREY)

    def _render_status(self):
        if self.filtering:
            text = f"Find: {self.filter_text}_"
        elif self.status_msg:
            text = self.status_msg
        else:
            apps = self._apps()
            text = f"{len(apps)} apps  C=+CTRL+<- = local"
        text = text[:SCREEN_COLS].ljust(SCREEN_COLS)
        off = STATUS_ROW * SCREEN_COLS
        for col, ch in enumerate(text):
            self.screen[off + col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[off + col] = COL_CYAN

    # =================================================================
    #  BADGE / STATUS HELPERS
    # =================================================================

    def _resolved_slot(self, app_id: str) -> int:
        slot = self.config.slot_for_app(app_id)
        if slot is not None:
            return slot
        info = self.registry.get(app_id)
        return info.default_slot if info else 0

    def _app_chip(self, app_id: str) -> str:
        """Digit chip for a pinned app ('[3] '), or blank pad if unpinned."""
        slot = self.config.slot_for_app(app_id)
        if slot is None:
            return "    "
        return f"[{self._slot_label(slot)}] "

    @staticmethod
    def _slot_label(slot: Optional[int]) -> str:
        """Slot 10 is reached with digit 0; show it as such."""
        if slot is None:
            return "-"
        return "0" if slot == 10 else str(slot)

    def _app_badge(self, app_id: str) -> Optional[str]:
        """Poll a live console's badge without instantiating dormant apps."""
        slot = self._resolved_slot(app_id)
        mgr = ConsoleManager.instance()
        if slot and mgr.has_console(slot, self.session_id):
            try:
                console = mgr.get_console(slot, self.session_id)
                return console.get_badge()
            except Exception:
                return None
        return None

    def _aggregate_unread(self) -> int:
        """Sum numeric badges across live consoles for the dashboard band."""
        total = 0
        for app in self.registry.all_apps():
            badge = self._app_badge(app.app_id)
            if badge and badge.rstrip("+").isdigit():
                total += int(badge.rstrip("+"))
        return total

    # =================================================================
    #  UTILITY
    # =================================================================

    def _write(
        self,
        row: int,
        col: int,
        text: str,
        color: int,
        reverse: bool = False,
    ):
        if row < 0 or row >= SCREEN_ROWS:
            return
        off = row * SCREEN_COLS + col
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or c < 0:
                break
            sc = _char_to_screencode(ch)
            if reverse:
                sc |= SC_REVERSE_BIT
            self.screen[off + i] = sc
            self.color[off + i] = color

    @staticmethod
    def _petscii_to_char(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    def _send_vic_colors(self, border: int, background: int):
        try:
            from sdk.network_helper import send_vic_colors

            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.debug("Could not send VIC colours: %s", e)
