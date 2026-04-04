"""
Server-side text web browser console (console 4) for C64 HDN Cloud Server.

A PETSCII web browser rendered into a 40x25 C64 screen-code back-buffer.
Features: multi-tab browsing (max 10), link navigation via Space/Return,
scrolling, URL input, border/background color from page CSS.

Uses Playwright (headless Chromium) on the server for full JavaScript
rendering, then converts the rendered DOM content to PETSCII screen codes.

All input arrives as PETSCII key-presses from the C64 client.
Invoked from C64 by pressing CBM+4.
"""

import json
import logging
import os
import queue
import re
import threading
import unicodedata
from dataclasses import dataclass, field
from typing import Optional, List, Tuple
from urllib.parse import urljoin

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii

logger = logging.getLogger(__name__)


# =====================================================================
#  _PlaywrightWorker — single long-lived thread that owns Playwright
# =====================================================================

class _PlaywrightWorker:
    """Runs all Playwright operations in one dedicated daemon thread.

    Playwright's sync API binds its greenlet dispatcher to the OS thread
    that called ``sync_playwright().start()``.  Using it from any other
    thread raises ``greenlet.error: cannot switch to a different thread``.

    This worker starts once, keeps the thread alive for the lifetime of
    the process, and accepts fetch jobs via a queue so any caller thread
    can safely request page fetches without touching the Playwright API
    directly.
    """

    _SENTINEL = object()  # poison-pill to shut down the worker

    def __init__(self):
        self._job_queue: queue.Queue = queue.Queue()
        self._thread = threading.Thread(target=self._run, name="playwright-worker", daemon=True)
        self._thread.start()

    def fetch_page(self, url: str) -> dict:
        """Fetch *url* and return extracted page data.

        Blocks the calling thread until the result (or an exception) is
        available from the worker thread.
        """
        result_q: queue.Queue = queue.Queue()
        self._job_queue.put((url, result_q))
        result = result_q.get()
        if isinstance(result, Exception):
            raise result
        return result

    def shutdown(self):
        self._job_queue.put(self._SENTINEL)

    # ------------------------------------------------------------------
    #  Worker thread body
    # ------------------------------------------------------------------

    def _run(self):
        """Main loop — runs entirely inside the dedicated worker thread."""
        playwright = None
        browser = None
        browser_context = None

        def ensure_browser():
            nonlocal playwright, browser, browser_context
            if browser is not None:
                return
            from playwright.sync_api import sync_playwright
            playwright = sync_playwright().start()
            browser = playwright.chromium.launch(
                headless=True,
                args=["--no-sandbox", "--disable-gpu"],
            )
            browser_context = browser.new_context(
                viewport={"width": 800, "height": 600},
                user_agent=(
                    "Mozilla/5.0 (compatible; C64-PETSCII-Browser/1.0; "
                    "+https://github.com/example/hdnsh)"
                ),
            )

        while True:
            job = self._job_queue.get()
            if job is self._SENTINEL:
                break
            url, result_q = job
            try:
                ensure_browser()
                result_q.put(self._do_fetch(browser_context, url))
            except Exception as exc:
                logger.error(f"Playwright worker fetch error: {exc}", exc_info=True)
                # Reset browser so it will be re-initialised on next request
                try:
                    if browser_context:
                        browser_context.close()
                    if browser:
                        browser.close()
                    if playwright:
                        playwright.stop()
                except Exception:
                    pass
                browser = None
                browser_context = None
                playwright = None
                result_q.put(exc)

        # Clean shutdown
        try:
            if browser_context:
                browser_context.close()
            if browser:
                browser.close()
            if playwright:
                playwright.stop()
        except Exception:
            pass

    @staticmethod
    def _do_fetch(browser_context, url: str) -> dict:
        """Perform the actual Playwright fetch (called inside worker thread)."""
        page = browser_context.new_page()
        try:
            page.goto(url, wait_until="domcontentloaded", timeout=15000)
            try:
                page.wait_for_load_state("networkidle", timeout=5000)
            except Exception:
                pass  # Some pages never reach network idle

            data = page.evaluate(
                """() => {
                function getElements(node, depth) {
                    if (depth > 50) return [];
                    const results = [];
                    const dominated = new Set([
                        'SCRIPT', 'STYLE', 'NOSCRIPT', 'SVG', 'PATH',
                        'META', 'LINK', 'HEAD', 'IFRAME', 'OBJECT',
                        'EMBED', 'TEMPLATE'
                    ]);

                    for (const child of node.childNodes) {
                        if (child.nodeType === Node.TEXT_NODE) {
                            const t = child.textContent;
                            if (t && t.trim()) {
                                results.push({
                                    tag: '#text',
                                    text: t.trim(),
                                    href: null,
                                    alt: null,
                                    list_index: -1
                                });
                            }
                        } else if (child.nodeType === Node.ELEMENT_NODE) {
                            const tag = child.tagName;
                            if (dominated.has(tag)) continue;

                            const style = window.getComputedStyle(child);
                            if (style.display === 'none' ||
                                style.visibility === 'hidden') continue;

                            if (tag === 'IMG') {
                                const alt = child.alt || child.title ||
                                            child.src.split('/').pop() || 'image';
                                results.push({
                                    tag: 'IMG',
                                    text: alt,
                                    href: null,
                                    alt: alt,
                                    list_index: -1
                                });
                            } else if (tag === 'BR') {
                                results.push({
                                    tag: 'BR',
                                    text: '',
                                    href: null,
                                    alt: null,
                                    list_index: -1
                                });
                            } else if (tag === 'HR') {
                                results.push({
                                    tag: 'HR',
                                    text: '',
                                    href: null,
                                    alt: null,
                                    list_index: -1
                                });
                            } else if (tag === 'A') {
                                const text = child.innerText || child.textContent || '';
                                results.push({
                                    tag: 'A',
                                    text: text.trim(),
                                    href: child.href || null,
                                    alt: null,
                                    list_index: -1
                                });
                            } else if (['H1','H2','H3','H4','H5','H6'].includes(tag)) {
                                const text = child.innerText || child.textContent || '';
                                results.push({
                                    tag: tag,
                                    text: text.trim(),
                                    href: null,
                                    alt: null,
                                    list_index: -1
                                });
                            } else if (tag === 'LI') {
                                const parent = child.parentElement;
                                let idx = -1;
                                if (parent && parent.tagName === 'OL') {
                                    idx = Array.from(parent.children).indexOf(child) + 1;
                                }
                                const inner = getElements(child, depth + 1);
                                if (inner.length > 0) {
                                    inner[0].list_index = idx;
                                    results.push(...inner);
                                } else {
                                    const text = child.innerText || child.textContent || '';
                                    results.push({
                                        tag: 'LI',
                                        text: text.trim(),
                                        href: null,
                                        alt: null,
                                        list_index: idx
                                    });
                                }
                            } else if (tag === 'PRE' || tag === 'CODE') {
                                const text = child.innerText || child.textContent || '';
                                results.push({
                                    tag: tag,
                                    text: text,
                                    href: null,
                                    alt: null,
                                    list_index: -1
                                });
                            } else if (['P','DIV','SECTION','ARTICLE','MAIN',
                                        'HEADER','FOOTER','NAV','ASIDE',
                                        'BLOCKQUOTE','FIGURE','FIGCAPTION',
                                        'TD','TH','TR','TABLE','THEAD','TBODY',
                                        'DT','DD','DL','DETAILS','SUMMARY',
                                        'SPAN','STRONG','EM','B','I','U',
                                        'SMALL','SUB','SUP','LABEL',
                                        'UL','OL','FORM'].includes(tag)) {
                                const isBlock = ['P','DIV','SECTION','ARTICLE',
                                    'MAIN','HEADER','FOOTER','NAV','ASIDE',
                                    'BLOCKQUOTE','FIGURE','FIGCAPTION',
                                    'TABLE','DT','DD','DL','DETAILS',
                                    'SUMMARY','FORM','TR'].includes(tag);
                                if (isBlock) {
                                    results.push({
                                        tag: 'BLOCK_START',
                                        text: tag,
                                        href: null,
                                        alt: null,
                                        list_index: -1
                                    });
                                }
                                const inner = getElements(child, depth + 1);
                                results.push(...inner);
                                if (isBlock) {
                                    results.push({
                                        tag: 'BLOCK_END',
                                        text: tag,
                                        href: null,
                                        alt: null,
                                        list_index: -1
                                    });
                                }
                            } else {
                                const inner = getElements(child, depth + 1);
                                results.push(...inner);
                            }
                        }
                    }
                    return results;
                }

                const body = document.body;
                const bgColor = window.getComputedStyle(body).backgroundColor || '#ffffff';
                return {
                    title: document.title || '',
                    bg_color: bgColor,
                    elements: getElements(body, 0)
                };
            }"""
            )
            return data
        finally:
            page.close()


# Module-level singleton worker — created once, lives for the process lifetime
_pw_worker = _PlaywrightWorker()


# =====================================================================
#  Bookmark persistence — JSON array of URL strings
# =====================================================================

def _bookmarks_path() -> str:
    """Return path to workspace/.config/bookmarks.json."""
    from workspace_init import WORKSPACE_DIR
    return os.path.join(WORKSPACE_DIR, ".config", "bookmarks.json")


def _load_bookmarks() -> List[str]:
    """Load bookmarks from disk. Returns empty list on any error."""
    path = _bookmarks_path()
    if not os.path.exists(path):
        return []
    try:
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        if isinstance(data, list):
            return [str(u) for u in data[:MAX_BOOKMARKS]]
    except Exception as e:
        logger.warning("Could not load bookmarks: %s", e)
    return []


def _save_bookmarks(bookmarks: List[str]) -> None:
    """Persist bookmarks to disk as a JSON array."""
    path = _bookmarks_path()
    os.makedirs(os.path.dirname(path), exist_ok=True)
    try:
        with open(path, "w", encoding="utf-8") as f:
            json.dump(bookmarks[:MAX_BOOKMARKS], f, indent=2)
    except Exception as e:
        logger.warning("Could not save bookmarks: %s", e)


# ── C64 colour nybbles ──────────────────────────────────────────────
COL_BLACK = 0
COL_WHITE = 1
COL_RED = 2
COL_CYAN = 3
COL_PURPLE = 4
COL_GREEN = 5
COL_BLUE = 6
COL_YELLOW = 7
COL_ORANGE = 8
COL_BROWN = 9
COL_LIGHT_RED = 10
COL_DARK_GREY = 11
COL_GREY = 12
COL_LIGHT_GREEN = 13
COL_LIGHT_BLUE = 14
COL_LIGHT_GREY = 15

# Browser-specific colour assignments
COL_LINK_FG = COL_BLUE  # normal link text
COL_LINK_ACTIVE_FG = COL_LIGHT_BLUE  # highlighted/active link
COL_HEADING_FG = COL_WHITE  # heading text (reverse video)
COL_BOLD_FG = COL_WHITE  # bold text
COL_CODE_FG = COL_CYAN  # <pre>/<code> text
COL_IMG_FG = COL_CYAN  # [IMG: alt] text
COL_TEXT_FG = COL_LIGHT_GREY  # default body text
COL_TAB_ACTIVE = COL_WHITE
COL_TAB_INACTIVE = COL_DARK_GREY
COL_STATUS_FG = COL_WHITE
COL_URL_LABEL_FG = COL_LIGHT_BLUE
COL_URL_INPUT_FG = COL_WHITE
COL_HELP_FG = COL_LIGHT_GREY

# Special screen codes
SC_SPACE = 0x20
SC_LBRACKET = 0x1B  # [
SC_RBRACKET = 0x1D  # ]
SC_ACTIVE_BRACKET = 0xDE  # screen code $DE for active link brackets
SC_HLINE = 0x63  # horizontal line drawing character
SC_REVERSE_BIT = 0x80  # set high bit for reverse video

# ── PETSCII key constants (mirrored from file_editor_console) ───────
KEY_RETURN = 0x0D
KEY_CHARSET_UPPER_CTRLN = 0x0E  # CTRL+N
KEY_HOME_CTRLS = 0x13
KEY_DEL_CTRLT = 0x14
KEY_CTRL_W = 0x17
KEY_SPACE = 0x20
KEY_RUNSTOP = 0x03
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_CRSR_RT = 0x1D
KEY_CRSR_LT = 0x9D
KEY_LEFT_ARROW = 0x5F
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F4 = 0x8A
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C

# ── Browser modes ────────────────────────────────────────────────────
MODE_BROWSE = 0
MODE_URL_INPUT = 1
MODE_TAB_LIST = 2
MODE_HELP = 3
MODE_BOOKMARKS = 4
MODE_HISTORY = 5

# ── Layout ───────────────────────────────────────────────────────────
TAB_BAR_ROW = 0
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1  # 23
STATUS_ROW = 24
MAX_TABS = 10
MAX_URL_LEN = 2048
MAX_BOOKMARKS = 50
MAX_HISTORY = 50

# ── Help screen content ──────────────────────────────────────────────
HELP_LINES = [
    "=== HDNSH WEB BROWSER HELP   F8=close ===",
    "",
    " NAVIGATION",
    " UP/DOWN     Scroll one line",
    " F3          Page up",
    " F5          Page down",
    " SPACE       Cycle links on screen",
    " RETURN      Follow highlighted link",
    " LEFT ARROW  Back one page",
    "",
    " URL & TABS",
    " F7          Open URL input",
    " F1          Tab list",
    " F2          Bookmarks",
    " F4          History",
    " STOP        Open URL input (browse)",
    "",
    " URL INPUT MODE",
    " Type URL    Enter address",
    " RETURN      Navigate",
    " STOP        Cancel",
    " LEFT/RIGHT  Move cursor",
    " DEL         Backspace",
    " HOME        Start of URL",
    "",
    " TAB MANAGEMENT",
    " CTRL+N      Open new tab",
    " CTRL+W      Close current tab",
    " F1          Open tab switcher",
    " UP/DOWN     Select tab (in list)",
    " RETURN      Switch to tab",
    "",
    " BOOKMARKS",
    " F2          Open bookmarks",
    " CTRL+N      Add current URL",
    " CTRL+W      Delete bookmark",
    " UP/DOWN     Select bookmark",
    " RETURN      Navigate to bookmark",
    "",
    " HISTORY",
    " F4          Open history",
    " CTRL+W      Delete history entry",
    " UP/DOWN     Select entry",
    " RETURN      Navigate to entry",
    "",
    " PAGE CONTENT",
    " [link]      Clickable link (blue)",
    " link        Active link (light blue)",
    " [IMG: alt]  Image placeholder (cyan)",
    " HEADING     Shown in reverse video",
    " --------    Horizontal rule",
    " code        Preformatted (cyan)",
    "",
    " CONSOLE SWITCHING",
    " C=+1        Local C64 shell",
    " C=+2        File editor",
    " C=+3        Coding agent",
    " C=+4        Web browser",
    " C=+5        Telegram",
    " C=+6        RSS reader (this)",
    "",
    " press F8 or STOP to close help",
]

# ── VICE C64 palette (RGB) for CSS colour matching ──────────────────
C64_PALETTE_RGB: List[Tuple[int, int, int]] = [
    (0, 0, 0),  # 0  black
    (255, 255, 255),  # 1  white
    (136, 0, 0),  # 2  red
    (170, 255, 238),  # 3  cyan
    (204, 68, 204),  # 4  purple
    (0, 204, 85),  # 5  green
    (0, 0, 170),  # 6  blue
    (238, 238, 119),  # 7  yellow
    (221, 136, 85),  # 8  orange
    (102, 68, 0),  # 9  brown
    (255, 119, 119),  # 10 light red
    (51, 51, 51),  # 11 dark grey
    (119, 119, 119),  # 12 grey
    (170, 255, 102),  # 13 light green
    (0, 136, 255),  # 14 light blue
    (187, 187, 187),  # 15 light grey
]


# =====================================================================
#  ContentLine — one rendered line in the page view
# =====================================================================
@dataclass
class ContentLine:
    """A single rendered line of page content (40 screen codes + 40 colours)."""

    chars: List[int] = field(default_factory=lambda: [SC_SPACE] * SCREEN_COLS)
    colors: List[int] = field(default_factory=lambda: [COL_TEXT_FG] * SCREEN_COLS)


# =====================================================================
#  LinkInfo — extracted hyperlink with position in content_lines
# =====================================================================
@dataclass
class LinkInfo:
    """A link extracted from the page with its position in content_lines."""

    url: str
    text: str
    row_start: int  # first row index in content_lines (not screen row)
    row_end: int  # last row index in content_lines
    col_start: int  # column of opening bracket (on row_start)
    col_end: int  # column after closing bracket (on row_end)


# =====================================================================
#  BrowserTab — state for one browser tab
# =====================================================================
@dataclass
class BrowserTab:
    """State for a single browser tab."""

    url: str = ""
    title: str = "New Tab"
    content_lines: List[ContentLine] = field(default_factory=list)
    links: List[LinkInfo] = field(default_factory=list)
    scroll_y: int = 0
    active_link_idx: int = -1  # -1 = no link highlighted
    bg_color: int = COL_BLUE  # page background mapped to C64 colour
    border_color: int = COL_LIGHT_BLUE
    loading: bool = False
    error_msg: str = ""
    history: List[str] = field(default_factory=list)  # navigation history stack


# =====================================================================
#  WebBrowserConsole — main browser console class
# =====================================================================
class WebBrowserConsole(ServerConsole):
    """Console 4 — PETSCII Text Web Browser."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.tabs: List[BrowserTab] = [BrowserTab()]
        self.active_tab_idx: int = 0
        self.mode: int = MODE_URL_INPUT  # start in URL input mode
        # URL input state
        self.url_input: str = ""
        self.url_cursor: int = 0
        # Tab list selection
        self.tab_list_sel: int = 0
        # Help screen scroll
        self.help_scroll: int = 0
        # Bookmark state
        self.bookmarks: List[str] = _load_bookmarks()
        self.bookmark_sel: int = 0
        self.bookmark_scroll: int = 0
        # History list state
        self.history_sel: int = 0
        self.history_scroll: int = 0
        self._navigating_back: bool = False
        # Initial render
        # If a home page is configured in server settings, start navigation
        # in a background thread so initialization isn't blocked.
        try:
            from config_manager import read_config
            cfg = read_config() or {}
            _homepage = (cfg.get("home_page_url") or "").strip()
        except Exception:
            _homepage = ""

        if _homepage:
            self.mode = MODE_BROWSE
            # Launch navigation asynchronously
            threading.Thread(target=lambda: self._navigate(_homepage), daemon=True).start()
        else:
            self.mode = MODE_URL_INPUT

        self._full_render()

    @property
    def tab(self) -> BrowserTab:
        """Active browser tab."""
        return self.tabs[self.active_tab_idx]

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        """Restore border/background colours and re-render."""
        if self.mode == MODE_URL_INPUT:
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
        else:
            # Browse, help, and tab list all use page colours
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)
        self._full_render()

    def on_deactivate(self):
        pass

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        """Route keypress based on current browser mode."""
        handlers = {
            MODE_BROWSE: self._key_browse,
            MODE_URL_INPUT: self._key_url_input,
            MODE_TAB_LIST: self._key_tab_list,
            MODE_HELP: self._key_help,
            MODE_BOOKMARKS: self._key_bookmarks,
            MODE_HISTORY: self._key_history,
        }
        handler = handlers.get(self.mode, self._key_browse)
        handler(petscii_code, modifiers)
        self._full_render()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    # =================================================================
    #  KEY HANDLERS
    # =================================================================

    # ── BROWSE mode ──────────────────────────────────────────────────
    def _key_browse(self, key: int, mod: int):
        tab = self.tab

        if key == KEY_CRSR_UP:
            # Scroll up one line
            if tab.scroll_y > 0:
                tab.scroll_y -= 1
                tab.active_link_idx = -1

        elif key == KEY_CRSR_DN:
            # Scroll down one line
            max_scroll = max(0, len(tab.content_lines) - CONTENT_ROWS)
            if tab.scroll_y < max_scroll:
                tab.scroll_y += 1
                tab.active_link_idx = -1

        elif key == KEY_F3:
            # Page up
            tab.scroll_y = max(0, tab.scroll_y - CONTENT_ROWS)
            tab.active_link_idx = -1

        elif key == KEY_F5:
            # Page down
            max_scroll = max(0, len(tab.content_lines) - CONTENT_ROWS)
            tab.scroll_y = min(max_scroll, tab.scroll_y + CONTENT_ROWS)
            tab.active_link_idx = -1

        elif key == KEY_SPACE:
            # Cycle to next visible link
            self._cycle_link()

        elif key == KEY_RETURN:
            # Follow highlighted link
            if tab.active_link_idx >= 0 and tab.active_link_idx < len(tab.links):
                link = tab.links[tab.active_link_idx]
                # Resolve relative URL
                target_url = urljoin(tab.url, link.url) if tab.url else link.url
                self._navigate(target_url)

        elif key == KEY_F7:
            # Switch to URL input mode
            self.url_input = tab.url
            self.url_cursor = len(self.url_input)
            self.mode = MODE_URL_INPUT
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F1:
            # Open tab list
            self.tab_list_sel = self.active_tab_idx
            self.mode = MODE_TAB_LIST
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_CTRL_W:
            # Close current tab
            self._close_tab(self.active_tab_idx)

        elif key == KEY_CHARSET_UPPER_CTRLN:
            # Open new tab (CTRL+N)
            self._new_tab()

        elif key == KEY_RUNSTOP:
            # Go to URL input
            self.url_input = tab.url
            self.url_cursor = len(self.url_input)
            self.mode = MODE_URL_INPUT
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F8:
            # Open help screen
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F2:
            # Open bookmarks
            self.bookmark_sel = 0
            self.bookmark_scroll = 0
            self.mode = MODE_BOOKMARKS
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_LEFT_ARROW:
            # Navigate back one page in history
            if tab.history:
                prev_url = tab.history.pop()
                self._navigating_back = True
                self._navigate(prev_url)

        elif key == KEY_F4:
            # Open history list
            self.history_sel = len(tab.history) - 1 if tab.history else 0
            self.history_scroll = max(0, self.history_sel - (CONTENT_ROWS - 3))
            self.mode = MODE_HISTORY
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

    # ── URL INPUT mode ───────────────────────────────────────────────
    def _key_url_input(self, key: int, mod: int):
        if key == KEY_RETURN:
            # Navigate to entered URL
            url = self.url_input.strip()
            if url:
                # Add https:// if no scheme
                if not url.startswith(("http://", "https://")):
                    url = "https://" + url
                self.mode = MODE_BROWSE
                self._navigate(url)
            return

        elif key == KEY_RUNSTOP:
            # Cancel — back to browse mode
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)
            return

        elif key == KEY_DEL_CTRLT:
            # Backspace
            if self.url_cursor > 0:
                self.url_input = (
                    self.url_input[:self.url_cursor - 1]
                    + self.url_input[self.url_cursor:]
                )
                self.url_cursor -= 1

        elif key == KEY_CRSR_LT:
            if self.url_cursor > 0:
                self.url_cursor -= 1

        elif key == KEY_CRSR_RT:
            if self.url_cursor < len(self.url_input):
                self.url_cursor += 1

        elif key == KEY_HOME_CTRLS:
            self.url_cursor = 0

        elif key == KEY_F1:
            # Open tab list from URL mode too
            self.tab_list_sel = self.active_tab_idx
            self.mode = MODE_TAB_LIST
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F8:
            # Open help screen from URL mode
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F2:
            # Open bookmarks from URL mode
            self.bookmark_sel = 0
            self.bookmark_scroll = 0
            self.mode = MODE_BOOKMARKS
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F4:
            # Open history from URL mode
            history = self.tab.history
            self.history_sel = len(history) - 1 if history else 0
            self.history_scroll = max(0, self.history_sel - (CONTENT_ROWS - 3))
            self.mode = MODE_HISTORY
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        else:
            # Try to type a character
            ch = self._petscii_to_printable(key)
            if ch and len(self.url_input) < MAX_URL_LEN:
                self.url_input = (
                    self.url_input[:self.url_cursor]
                    + ch
                    + self.url_input[self.url_cursor:]
                )
                self.url_cursor += 1

    # ── TAB LIST mode ────────────────────────────────────────────────
    def _key_tab_list(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.tab_list_sel > 0:
                self.tab_list_sel -= 1

        elif key == KEY_CRSR_DN:
            if self.tab_list_sel < len(self.tabs) - 1:
                self.tab_list_sel += 1

        elif key == KEY_RETURN:
            # Switch to selected tab
            self.active_tab_idx = self.tab_list_sel
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)

        elif key == KEY_CTRL_W:
            # Close selected tab
            self._close_tab(self.tab_list_sel)
            if self.tab_list_sel >= len(self.tabs):
                self.tab_list_sel = len(self.tabs) - 1

        elif key == KEY_CHARSET_UPPER_CTRLN:
            # New tab
            self._new_tab()

        elif key in (KEY_F1, KEY_RUNSTOP):
            # Back to browse
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)

        elif key == KEY_F8:
            # Open help from tab list
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F2:
            # Open bookmarks from tab list
            self.bookmark_sel = 0
            self.bookmark_scroll = 0
            self.mode = MODE_BOOKMARKS
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

        elif key == KEY_F4:
            # Open history from tab list
            history = self.tab.history
            self.history_sel = len(history) - 1 if history else 0
            self.history_scroll = max(0, self.history_sel - (CONTENT_ROWS - 3))
            self.mode = MODE_HISTORY
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

    # ── HELP mode ───────────────────────────────────────────────────
    def _key_help(self, key: int, mod: int):
        max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
        if key in (KEY_CRSR_UP, KEY_F3):
            if key == KEY_F3:
                self.help_scroll = max(0, self.help_scroll - CONTENT_ROWS)
            elif self.help_scroll > 0:
                self.help_scroll -= 1
        elif key in (KEY_CRSR_DN, KEY_F5):
            if key == KEY_F5:
                self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
            elif self.help_scroll < max_scroll:
                self.help_scroll += 1
        elif key in (KEY_RUNSTOP, KEY_F8, KEY_F1):
            # Return to previous mode
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)

    # ── BOOKMARKS mode ──────────────────────────────────────────────
    def _key_bookmarks(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.bookmark_sel > 0:
                self.bookmark_sel -= 1
                # Scroll up if selection moved above visible area
                if self.bookmark_sel < self.bookmark_scroll:
                    self.bookmark_scroll = self.bookmark_sel

        elif key == KEY_CRSR_DN:
            if self.bookmark_sel < len(self.bookmarks) - 1:
                self.bookmark_sel += 1
                # Scroll down if selection moved below visible area
                visible_bottom = self.bookmark_scroll + CONTENT_ROWS - 2  # -2 for header gap
                if self.bookmark_sel > visible_bottom:
                    self.bookmark_scroll = self.bookmark_sel - (CONTENT_ROWS - 2)

        elif key == KEY_RETURN:
            # Navigate to selected bookmark
            if self.bookmarks and 0 <= self.bookmark_sel < len(self.bookmarks):
                url = self.bookmarks[self.bookmark_sel]
                if url:
                    if not url.startswith(("http://", "https://")):
                        url = "https://" + url
                    self.mode = MODE_BROWSE
                    self._navigate(url)

        elif key == KEY_CHARSET_UPPER_CTRLN:
            # Add current URL as new bookmark
            if len(self.bookmarks) < MAX_BOOKMARKS:
                new_url = self.tab.url or ""
                self.bookmarks.append(new_url)
                _save_bookmarks(self.bookmarks)
                self.bookmark_sel = len(self.bookmarks) - 1
                # Adjust scroll to show new entry
                visible_bottom = self.bookmark_scroll + CONTENT_ROWS - 2
                if self.bookmark_sel > visible_bottom:
                    self.bookmark_scroll = self.bookmark_sel - (CONTENT_ROWS - 2)

        elif key == KEY_CTRL_W:
            # Delete selected bookmark
            if self.bookmarks and 0 <= self.bookmark_sel < len(self.bookmarks):
                self.bookmarks.pop(self.bookmark_sel)
                _save_bookmarks(self.bookmarks)
                if self.bookmark_sel >= len(self.bookmarks) and self.bookmarks:
                    self.bookmark_sel = len(self.bookmarks) - 1
                if not self.bookmarks:
                    self.bookmark_sel = 0
                    self.bookmark_scroll = 0

        elif key in (KEY_F2, KEY_RUNSTOP):
            # Back to browse mode
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)

        elif key == KEY_F8:
            # Open help from bookmarks
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

    # ── HISTORY mode ─────────────────────────────────────────────────
    def _key_history(self, key: int, mod: int):
        history = self.tab.history
        if key == KEY_CRSR_UP:
            if self.history_sel > 0:
                self.history_sel -= 1
                if self.history_sel < self.history_scroll:
                    self.history_scroll = self.history_sel

        elif key == KEY_CRSR_DN:
            if self.history_sel < len(history) - 1:
                self.history_sel += 1
                visible_bottom = self.history_scroll + CONTENT_ROWS - 2
                if self.history_sel > visible_bottom:
                    self.history_scroll = self.history_sel - (CONTENT_ROWS - 2)

        elif key == KEY_RETURN:
            # Navigate to selected history entry
            if history and 0 <= self.history_sel < len(history):
                url = history[self.history_sel]
                if url:
                    self.mode = MODE_BROWSE
                    self._navigate(url)

        elif key == KEY_CTRL_W:
            # Delete selected history entry
            if history and 0 <= self.history_sel < len(history):
                history.pop(self.history_sel)
                if self.history_sel >= len(history) and history:
                    self.history_sel = len(history) - 1
                if not history:
                    self.history_sel = 0
                    self.history_scroll = 0

        elif key in (KEY_F4, KEY_RUNSTOP):
            # Back to browse mode
            self.mode = MODE_BROWSE
            self._send_vic_colors(self.tab.border_color, self.tab.bg_color)

        elif key == KEY_F8:
            # Open help from history
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

    # =================================================================
    #  TAB MANAGEMENT
    # =================================================================

    def _new_tab(self):
        """Open a new empty tab if under MAX_TABS."""
        if len(self.tabs) >= MAX_TABS:
            return
        # If a homepage is configured, open the new tab to that URL.
        try:
            from config_manager import read_config
            cfg = read_config() or {}
            homepage = (cfg.get("home_page_url") or "").strip()
        except Exception:
            homepage = ""

        self.tabs.append(BrowserTab())
        self.active_tab_idx = len(self.tabs) - 1

        if homepage:
            # Open directly to the homepage (navigate asynchronously).
            self.mode = MODE_BROWSE
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
            threading.Thread(target=lambda: self._navigate(homepage), daemon=True).start()
            return

        # Default: open URL input field for manual entry
        self.url_input = ""
        self.url_cursor = 0
        self.mode = MODE_URL_INPUT
        self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)

    def _close_tab(self, idx: int):
        """Close a tab. Keeps at least one tab open."""
        if len(self.tabs) <= 1:
            # Reset the single tab instead of closing
            self.tabs[0] = BrowserTab()
            self.active_tab_idx = 0
            self.url_input = ""
            self.url_cursor = 0
            self.mode = MODE_URL_INPUT
            self._send_vic_colors(COL_LIGHT_BLUE, COL_BLUE)
            return
        # Close Playwright page for this tab if we have one
        self.tabs.pop(idx)
        if self.active_tab_idx >= len(self.tabs):
            self.active_tab_idx = len(self.tabs) - 1
        if self.tab_list_sel >= len(self.tabs):
            self.tab_list_sel = len(self.tabs) - 1

    # =================================================================
    #  LINK CYCLING
    # =================================================================

    def _cycle_link(self):
        """Cycle to the next visible link on the current screen."""
        tab = self.tab
        if not tab.links:
            return

        # Build list of links visible on current screen
        vis_start = tab.scroll_y
        vis_end = tab.scroll_y + CONTENT_ROWS - 1
        visible = [
            (i, lnk)
            for i, lnk in enumerate(tab.links)
            if lnk.row_end >= vis_start and lnk.row_start <= vis_end
        ]
        if not visible:
            tab.active_link_idx = -1
            return

        # Find next link after current
        if tab.active_link_idx < 0:
            tab.active_link_idx = visible[0][0]
        else:
            # Find position of current in visible list
            found = False
            for vi, (gi, _) in enumerate(visible):
                if gi == tab.active_link_idx:
                    # Move to next visible
                    next_vi = (vi + 1) % len(visible)
                    tab.active_link_idx = visible[next_vi][0]
                    found = True
                    break
            if not found:
                tab.active_link_idx = visible[0][0]

    # =================================================================
    #  NAVIGATION
    # =================================================================

    def _navigate(self, url: str):
        """Fetch and render a URL in the active tab."""
        logger.info(f"Browser navigating to: {url}")
        tab = self.tab

        # Record current URL in history (unless navigating back)
        if not self._navigating_back and tab.url:
            tab.history.append(tab.url)
            if len(tab.history) > MAX_HISTORY:
                tab.history = tab.history[-MAX_HISTORY:]
        self._navigating_back = False

        tab.url = url
        tab.loading = True
        tab.active_link_idx = -1
        tab.scroll_y = 0
        tab.error_msg = ""

        # Show loading state immediately
        tab.content_lines = []
        loading_line = ContentLine()
        msg = "Loading... (takes time on first load)"
        for i, ch in enumerate(msg):
            if i < SCREEN_COLS:
                loading_line.chars[i] = ascii_to_screencode(ord(ch))
                loading_line.colors[i] = COL_WHITE
        tab.content_lines.append(loading_line)
        self._full_render()

        # Send screen update before blocking fetch
        try:
            from network_helper import send_screen_data
            send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception:
            pass

        # Fetch and render
        try:
            page_data = self._fetch_page(url)
            tab.title = page_data.get("title", url)[:20] or url[:20]
            tab.bg_color = self._css_bg_to_c64_color(
                page_data.get("bg_color", "#ffffff")
            )
            # Use contrasting border
            tab.border_color = tab.bg_color
            tab.content_lines, tab.links = self._html_to_c64_lines(page_data)
            tab.scroll_y = 0
            tab.active_link_idx = -1
            logger.info(
                f"Browser loaded: {tab.title!r}, "
                f"bg={page_data.get('bg_color', '?')}, "
                f"elements={len(page_data.get('elements', []))}, "
                f"lines={len(tab.content_lines)}, links={len(tab.links)}"
            )
            # If content is effectively empty, show a helpful message
            if len(tab.content_lines) <= 1 and all(
                c == SC_SPACE for c in tab.content_lines[0].chars
            ) if tab.content_lines else True:
                logger.warning(f"Browser: page has no extractable content: {url}")
                default_fg = self._contrast_fg(tab.bg_color)
                tab.content_lines = self._text_to_content_lines(
                    f"Page loaded but no text content found.\n\n"
                    f"URL: {url}\n\n"
                    f"The page may use JavaScript rendering\n"
                    f"or contain only images/video.",
                    default_fg,
                )
        except Exception as e:
            logger.error(f"Navigation error: {e}", exc_info=True)
            tab.title = "Error"
            tab.error_msg = str(e)[:120]
            err_lines = self._text_to_content_lines(
                f"Error loading page:\n{tab.error_msg}\n\nURL: {url}",
                COL_RED,
            )
            tab.content_lines = err_lines
            tab.links = []
            tab.bg_color = COL_BLACK
            tab.border_color = COL_BLACK
        finally:
            tab.loading = False

        self._send_vic_colors(tab.border_color, tab.bg_color)

        # Push the completed page immediately so the C64 sees it without
        # waiting for the next keypress to trigger handle_keypress re-render.
        self._full_render()
        try:
            from network_helper import send_screen_data
            send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception:
            pass

    # =================================================================
    #  PAGE FETCHING (delegates to module-level _PlaywrightWorker)
    # =================================================================

    def _fetch_page(self, url: str) -> dict:
        """Fetch a page via the shared Playwright worker thread.

        Returns dict with keys: title, bg_color, elements (list of dicts).
        Each element: {tag, text, href, alt, list_index}.
        """
        return _pw_worker.fetch_page(url)

    # =================================================================
    #  HTML → C64 CONTENT LINES CONVERTER
    # =================================================================

    def _html_to_c64_lines(self, page_data: dict) -> Tuple[List[ContentLine], List[LinkInfo]]:
        """Convert extracted page data to content lines and links."""
        elements = page_data.get("elements", [])
        lines: List[ContentLine] = []
        links: List[LinkInfo] = []
        bg = self._css_bg_to_c64_color(page_data.get("bg_color", "#ffffff"))

        # Determine default text colour (contrast with background)
        default_fg = self._contrast_fg(bg)

        # Current position state
        col = 0
        current_line = ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[default_fg] * SCREEN_COLS,
        )
        in_block_depth = 0
        last_was_blank = True  # avoid leading blank lines

        def flush_line():
            nonlocal current_line, col, last_was_blank
            lines.append(current_line)
            last_was_blank = all(c == SC_SPACE for c in current_line.chars)
            current_line = ContentLine(
                chars=[SC_SPACE] * SCREEN_COLS,
                colors=[default_fg] * SCREEN_COLS,
            )
            col = 0

        def blank_line():
            nonlocal last_was_blank
            if not last_was_blank:
                flush_line()

        def write_text(text: str, fg: int, reverse: bool = False):
            """Write text with word-wrap at SCREEN_COLS."""
            nonlocal col
            words = text.split(" ")
            for wi, word in enumerate(words):
                # Add space between words (not before first)
                if wi > 0 and col > 0:
                    if col < SCREEN_COLS:
                        current_line.chars[col] = SC_SPACE
                        current_line.colors[col] = fg
                        col += 1
                    else:
                        flush_line()

                if not word:
                    continue

                # Word wrap: if word doesn't fit and we're not at start of line
                if col > 0 and col + len(word) > SCREEN_COLS:
                    flush_line()

                for ch in word:
                    if col >= SCREEN_COLS:
                        flush_line()
                    sc = _char_to_screencode(ch)
                    if reverse:
                        sc |= SC_REVERSE_BIT
                    current_line.chars[col] = sc
                    current_line.colors[col] = fg
                    col += 1

        def write_link(text: str, href: str, fg: int):
            """Write a link as [text] and register it."""
            nonlocal col
            if not text:
                return

            # Calculate total length: [text]
            total_len = len(text) + 2  # brackets

            # Word wrap if needed
            if col > 0 and col + total_len > SCREEN_COLS:
                flush_line()

            link_col_start = col
            link_row_start = len(lines)  # row before writing

            # Opening bracket '['
            if col < SCREEN_COLS:
                current_line.chars[col] = SC_LBRACKET
                current_line.colors[col] = fg
                col += 1

            # Link text
            for ch in text:
                if col >= SCREEN_COLS:
                    flush_line()
                sc = _char_to_screencode(ch)
                current_line.chars[col] = sc
                current_line.colors[col] = fg
                col += 1

            # Closing bracket ']'
            if col >= SCREEN_COLS:
                flush_line()
            current_line.chars[col] = SC_RBRACKET
            current_line.colors[col] = fg
            col += 1

            # Register link — track first and last row for multi-line links
            link_row_end = len(lines)
            links.append(LinkInfo(
                url=href or "",
                text=text,
                row_start=link_row_start,
                row_end=link_row_end,
                col_start=link_col_start,
                col_end=col,
            ))

        # Process elements
        for elem in elements:
            tag = elem.get("tag", "")
            text = elem.get("text", "")
            href = elem.get("href", "")
            alt = elem.get("alt", "")
            list_index = elem.get("list_index", -1)

            if tag == "BLOCK_START":
                blank_line()
                in_block_depth += 1

            elif tag == "BLOCK_END":
                if col > 0:
                    flush_line()
                in_block_depth -= 1
                if in_block_depth < 0:
                    in_block_depth = 0

            elif tag == "BR":
                flush_line()

            elif tag == "HR":
                if col > 0:
                    flush_line()
                hr_line = ContentLine(
                    chars=[SC_HLINE] * SCREEN_COLS,
                    colors=[COL_GREY] * SCREEN_COLS,
                )
                lines.append(hr_line)
                last_was_blank = False
                col = 0
                current_line = ContentLine(
                    chars=[SC_SPACE] * SCREEN_COLS,
                    colors=[default_fg] * SCREEN_COLS,
                )

            elif tag in ("H1", "H2", "H3", "H4", "H5", "H6"):
                blank_line()
                write_text(text, default_fg, reverse=True)
                flush_line()

            elif tag == "A":
                if text and href:
                    write_link(text, href, COL_LINK_FG)
                elif text:
                    write_text(text, default_fg)

            elif tag == "IMG":
                img_text = f"IMG: {alt}" if alt else "IMG"
                # Truncate to fit in brackets
                if len(img_text) > SCREEN_COLS - 4:
                    img_text = img_text[: SCREEN_COLS - 4]
                if col > 0 and col + len(img_text) + 2 > SCREEN_COLS:
                    flush_line()
                # Write [IMG: alt]
                if col < SCREEN_COLS:
                    current_line.chars[col] = SC_LBRACKET
                    current_line.colors[col] = COL_IMG_FG
                    col += 1
                for ch in img_text:
                    if col >= SCREEN_COLS:
                        flush_line()
                    current_line.chars[col] = _char_to_screencode(ch)
                    current_line.colors[col] = COL_IMG_FG
                    col += 1
                if col >= SCREEN_COLS:
                    flush_line()
                current_line.chars[col] = SC_RBRACKET
                current_line.colors[col] = COL_IMG_FG
                col += 1

            elif tag == "LI":
                if col > 0:
                    flush_line()
                # List prefix
                if list_index > 0:
                    prefix = f"{list_index}. "
                else:
                    prefix = "* "
                write_text(prefix + text, default_fg)

            elif tag in ("PRE", "CODE"):
                # Preserve whitespace for preformatted text
                if col > 0:
                    flush_line()
                for pre_line in text.split("\n"):
                    for ch in pre_line:
                        if col >= SCREEN_COLS:
                            flush_line()
                        current_line.chars[col] = _char_to_screencode(ch)
                        current_line.colors[col] = COL_CODE_FG
                        col += 1
                    flush_line()

            elif tag == "#text":
                # Handle list prefix if this text is first item in an LI
                if list_index >= 0:
                    if col > 0:
                        flush_line()
                    prefix = f"{list_index}. " if list_index > 0 else "* "
                    write_text(prefix, default_fg)

                write_text(text, default_fg)

        # Flush remaining content
        if col > 0:
            flush_line()

        # Ensure at least one line
        if not lines:
            lines.append(ContentLine(
                chars=[SC_SPACE] * SCREEN_COLS,
                colors=[default_fg] * SCREEN_COLS,
            ))

        return lines, links

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        """Re-render the entire 40x25 screen."""
        # Clear
        fill_color = COL_TEXT_FG
        if self.mode == MODE_URL_INPUT:
            fill_color = COL_URL_INPUT_FG
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = fill_color

        if self.mode == MODE_BROWSE:
            self._render_tab_bar()
            self._render_content()
            self._render_status_bar()
        elif self.mode == MODE_URL_INPUT:
            self._render_url_input()
        elif self.mode == MODE_TAB_LIST:
            self._render_tab_list()
        elif self.mode == MODE_HELP:
            self._render_help()
        elif self.mode == MODE_BOOKMARKS:
            self._render_bookmarks()
        elif self.mode == MODE_HISTORY:
            self._render_history()

    # ── Tab bar (row 0) ──────────────────────────────────────────────
    def _render_tab_bar(self):
        col = 0
        # Adaptive colors: contrast with VIC background so tabs are always visible
        chrome_fg = self._contrast_fg(self.tab.bg_color)
        for idx, tab in enumerate(self.tabs):
            is_active = idx == self.active_tab_idx
            fg = chrome_fg if is_active else COL_GREY

            # Format: [N:Title]
            # Calculate available space
            remaining = SCREEN_COLS - col
            if remaining < 6:
                break  # No room for more tabs

            prefix = f"{idx + 1}:"
            max_title_len = min(remaining - len(prefix) - 2, 12)  # -2 for brackets
            if max_title_len < 1:
                break
            title = (tab.title or "New")[:max_title_len]
            tab_text = f"{prefix}{title}"

            # Opening bracket (reverse for active)
            if col < SCREEN_COLS:
                self.screen[col] = SC_LBRACKET if not is_active else (SC_LBRACKET | SC_REVERSE_BIT)
                self.color[col] = fg
                col += 1

            # Tab text
            for ch in tab_text:
                if col >= SCREEN_COLS:
                    break
                sc = ascii_to_screencode(ord(ch))
                if is_active:
                    sc |= SC_REVERSE_BIT
                self.screen[col] = sc
                self.color[col] = fg
                col += 1

            # Closing bracket
            if col < SCREEN_COLS:
                self.screen[col] = SC_RBRACKET if not is_active else (SC_RBRACKET | SC_REVERSE_BIT)
                self.color[col] = fg
                col += 1

    # ── Page content (rows 1-23) ─────────────────────────────────────
    def _render_content(self):
        tab = self.tab
        active_link = tab.active_link_idx

        for vi in range(CONTENT_ROWS):
            screen_row = CONTENT_TOP + vi
            line_idx = tab.scroll_y + vi
            if line_idx >= len(tab.content_lines):
                break

            cl = tab.content_lines[line_idx]
            row_base = screen_row * SCREEN_COLS

            for c in range(SCREEN_COLS):
                sc = cl.chars[c]
                color = cl.colors[c]

                # Check if this position is inside the active link
                if active_link >= 0 and active_link < len(tab.links):
                    lnk = tab.links[active_link]
                    if lnk.row_start <= line_idx <= lnk.row_end:
                        # Determine highlight range for this row
                        if lnk.row_start == lnk.row_end:
                            # Single-line link
                            hl_start, hl_end = lnk.col_start, lnk.col_end
                        elif line_idx == lnk.row_start:
                            hl_start, hl_end = lnk.col_start, SCREEN_COLS
                        elif line_idx == lnk.row_end:
                            hl_start, hl_end = 0, lnk.col_end
                        else:
                            hl_start, hl_end = 0, SCREEN_COLS
                        if hl_start <= c < hl_end:
                            color = COL_LINK_ACTIVE_FG
                            # Replace brackets with active bracket char
                            if line_idx == lnk.row_start and c == lnk.col_start:
                                sc = SC_ACTIVE_BRACKET
                            elif line_idx == lnk.row_end and c == lnk.col_end - 1:
                                sc = SC_ACTIVE_BRACKET

                self.screen[row_base + c] = sc
                self.color[row_base + c] = color

    # ── Status bar (row 24) ──────────────────────────────────────────
    def _render_status_bar(self):
        tab = self.tab
        row_base = STATUS_ROW * SCREEN_COLS

        # Adaptive status color: contrast with VIC background
        status_fg = self._contrast_fg(self.tab.bg_color)

        # Fill with reverse
        for c in range(SCREEN_COLS):
            self.screen[row_base + c] = SC_SPACE
            self.color[row_base + c] = status_fg

        # Build status text
        if tab.loading:
            status = "Loading..."
        else:
            # URL (truncated) + scroll position
            url_display = tab.url[:25] if tab.url else "No page"
            total = len(tab.content_lines)
            if total > 0:
                pct = min(100, (tab.scroll_y + CONTENT_ROWS) * 100 // total)
            else:
                pct = 100
            link_count = len(tab.links)
            status = f"{url_display} {pct}%"
            if link_count > 0:
                status += f" {link_count}L"

        # Write status (reversed)
        for i, ch in enumerate(status[:SCREEN_COLS]):
            sc = ascii_to_screencode(ord(ch))
            sc |= SC_REVERSE_BIT
            self.screen[row_base + i] = sc
            self.color[row_base + i] = status_fg

    # ── URL input screen ─────────────────────────────────────────────
    def _render_url_input(self):
        # Row 0: "HDNSH WEB BROWSER" header
        header = "HDNSH WEB BROWSER"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)

        # Row 2: "URL:" label
        self._put_text(2, 0, "URL:", COL_URL_LABEL_FG)

        # Row 3: URL input field
        # Show as much URL as fits, with cursor
        visible_start = 0
        if self.url_cursor > SCREEN_COLS - 1:
            visible_start = self.url_cursor - SCREEN_COLS + 1
        visible_url = self.url_input[visible_start: visible_start + SCREEN_COLS]

        for i, ch in enumerate(visible_url):
            sc = ascii_to_screencode(ord(ch)) if 32 <= ord(ch) < 127 else SC_SPACE
            is_cursor = (visible_start + i) == self.url_cursor
            if is_cursor:
                sc |= SC_REVERSE_BIT
            self.screen[3 * SCREEN_COLS + i] = sc
            self.color[3 * SCREEN_COLS + i] = COL_URL_INPUT_FG

        # Show cursor at end if past last char
        cursor_screen_pos = self.url_cursor - visible_start
        if 0 <= cursor_screen_pos < SCREEN_COLS and cursor_screen_pos >= len(visible_url):
            pos = 3 * SCREEN_COLS + cursor_screen_pos
            self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
            self.color[pos] = COL_URL_INPUT_FG

        # Row 5: current tab info
        if self.tab.url:
            self._put_text(5, 0, f"Current: {self.tab.url[:30]}", COL_LIGHT_GREY)

        # Help text rows
        self._put_text(8, 1, "RETURN  Navigate to URL", COL_HELP_FG)
        self._put_text(9, 1, "STOP    Cancel", COL_HELP_FG)
        self._put_text(10, 1, "F1      Tab list", COL_HELP_FG)
        self._put_text(11, 1, "F2      Bookmarks", COL_HELP_FG)
        self._put_text(12, 1, "F4      History", COL_HELP_FG)

        # Row 13: Navigation tips
        self._put_text(14, 1, "While browsing:", COL_WHITE)
        self._put_text(15, 1, "UP/DOWN  Scroll line", COL_HELP_FG)
        self._put_text(16, 1, "F3/F5   Page up/down", COL_HELP_FG)
        self._put_text(17, 1, "SPACE   Cycle links", COL_HELP_FG)
        self._put_text(18, 1, "RETURN  Follow link", COL_HELP_FG)
        self._put_text(19, 1, "F7      URL input", COL_HELP_FG)
        self._put_text(20, 1, "F1      Tab list", COL_HELP_FG)
        self._put_text(21, 1, "CTRL+N  New tab", COL_HELP_FG)
        self._put_text(22, 1, "CTRL+W  Close tab", COL_HELP_FG)

        # Status bar
        help_status = "RETURN=Go  STOP=Cancel"
        self._put_text(STATUS_ROW, 0, help_status, COL_STATUS_FG, reverse=True)
        # Fill rest of status row with reverse spaces
        for c in range(len(help_status), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    # ── Bookmark list screen ──────────────────────────────────────────
    def _render_bookmarks(self):
        # Header
        header = f"BOOKMARKS ({len(self.bookmarks)})"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        # Fill row 0
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        if not self.bookmarks:
            self._put_text(2, 1, "No bookmarks.", COL_LIGHT_GREY)
            self._put_text(3, 1, "CTRL+N to add current URL.", COL_LIGHT_GREY)
        else:
            # Calculate visible range
            max_visible = CONTENT_ROWS - 1  # rows 2..23 = 22 entries
            for vi in range(max_visible):
                bi = self.bookmark_scroll + vi
                if bi >= len(self.bookmarks):
                    break
                row = 2 + vi
                if row >= STATUS_ROW:
                    break
                is_sel = bi == self.bookmark_sel
                fg = COL_WHITE if is_sel else COL_CYAN
                url = self.bookmarks[bi] or "(empty)"
                entry = f"{bi + 1:2d}. {url[:SCREEN_COLS - 5]}"
                self._put_text(row, 1, entry[:SCREEN_COLS - 2], fg, reverse=is_sel)

        # Status bar
        help_text = "RET=Go CTRL+N=Add CTRL+W=Del F2=Back"
        self._put_text(STATUS_ROW, 0, help_text, COL_STATUS_FG, reverse=True)
        for c in range(len(help_text), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    # ── History list screen ───────────────────────────────────────────
    def _render_history(self):
        history = self.tab.history
        # Header
        header = f"HISTORY ({len(history)})"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        # Fill row 0
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        if not history:
            self._put_text(2, 1, "No history.", COL_LIGHT_GREY)
        else:
            max_visible = CONTENT_ROWS - 1  # rows 2..23 = 22 entries
            for vi in range(max_visible):
                hi = self.history_scroll + vi
                if hi >= len(history):
                    break
                row = 2 + vi
                if row >= STATUS_ROW:
                    break
                is_sel = hi == self.history_sel
                fg = COL_WHITE if is_sel else COL_CYAN
                url = history[hi] or "(empty)"
                entry = f"{hi + 1:2d}. {url[:SCREEN_COLS - 5]}"
                self._put_text(row, 1, entry[:SCREEN_COLS - 2], fg, reverse=is_sel)

        # Status bar
        help_text = "RET=Go CTRL+W=Del F4=Back"
        self._put_text(STATUS_ROW, 0, help_text, COL_STATUS_FG, reverse=True)
        for c in range(len(help_text), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    # ── Tab list screen ──────────────────────────────────────────────
    def _render_tab_list(self):
        # Header
        header = f"TABS ({len(self.tabs)}/{MAX_TABS})"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        # Fill row 0
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        for i, tab in enumerate(self.tabs):
            row = 2 + i
            if row >= STATUS_ROW:
                break
            is_sel = i == self.tab_list_sel
            is_active = i == self.active_tab_idx
            fg = COL_WHITE if is_sel else (COL_TAB_ACTIVE if is_active else COL_TAB_INACTIVE)

            # Format: [N] Title - url
            marker = ">" if is_active else " "
            title = (tab.title or "New Tab")[:15]
            url = (tab.url or "about:blank")[:20]
            entry = f"{marker}{i + 1}. {title} - {url}"
            self._put_text(row, 1, entry[:SCREEN_COLS - 2], fg, reverse=is_sel)

        # Help row
        help_text = "RET=Switch CTRL+W=Close CTRL+N=New"
        self._put_text(STATUS_ROW, 0, help_text, COL_STATUS_FG, reverse=True)
        for c in range(len(help_text), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    # ── Help screen ──────────────────────────────────────────────────
    def _render_help(self):
        # Header (row 0) — full reverse bar
        header = "BROWSER HELP"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        # Content rows (1-23)
        for vi in range(CONTENT_ROWS):
            li = self.help_scroll + vi
            if li >= len(HELP_LINES):
                break
            row = CONTENT_TOP + vi
            text = HELP_LINES[li]
            # Choose colour based on content
            if text.startswith("==="):
                fg = COL_YELLOW
                self._put_text(row, 0, text[:SCREEN_COLS], fg, reverse=True)
                # Fill rest of row with reverse
                for c in range(len(text), SCREEN_COLS):
                    pos = row * SCREEN_COLS + c
                    self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                    self.color[pos] = fg
            elif text and not text.startswith(" ") and not text.startswith("\\"):
                # Section heading (no leading space, not empty)
                self._put_text(row, 0, text[:SCREEN_COLS], COL_CYAN)
            else:
                # Regular help text: key in white, description in light grey
                stripped = text.lstrip()
                indent = len(text) - len(stripped)
                if stripped and " " in stripped:
                    # Split at longest run of spaces separating key from description
                    parts = stripped.split("  ", 1)
                    if len(parts) == 2 and parts[0].strip():
                        key_part = text[:indent + len(parts[0])]
                        desc_part = "  " + parts[1]
                        self._put_text(row, 0, key_part[:SCREEN_COLS], COL_WHITE)
                        desc_start = indent + len(parts[0])
                        self._put_text(row, desc_start, desc_part[:SCREEN_COLS - desc_start], COL_LIGHT_GREY)
                    else:
                        self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)
                else:
                    self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)

        # Scroll indicator on right of first content row if scrollable
        max_scroll = max(0, len(HELP_LINES) - CONTENT_ROWS)
        if max_scroll > 0:
            pct = self.help_scroll * 100 // max_scroll if max_scroll else 100
            indicator = f"{pct:3d}%"
            self._put_text(1, SCREEN_COLS - len(indicator), indicator, COL_DARK_GREY)

        # Status bar
        help_status = "UP/DN=Scroll  F3/F5=Page  F8/STOP=Close"
        self._put_text(STATUS_ROW, 0, help_status[:SCREEN_COLS], COL_STATUS_FG, reverse=True)
        for c in range(len(help_status), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

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
                sc |= SC_REVERSE_BIT
            self.screen[pos] = sc
            self.color[pos] = fg

    def _text_to_content_lines(
        self, text: str, fg: int = COL_TEXT_FG
    ) -> List[ContentLine]:
        """Convert plain text to ContentLine list with word-wrap."""
        lines: List[ContentLine] = []
        for paragraph in text.split("\n"):
            col = 0
            current = ContentLine(
                chars=[SC_SPACE] * SCREEN_COLS,
                colors=[fg] * SCREEN_COLS,
            )
            words = paragraph.split(" ")
            for wi, word in enumerate(words):
                if wi > 0 and col > 0:
                    if col < SCREEN_COLS:
                        current.chars[col] = SC_SPACE
                        current.colors[col] = fg
                        col += 1
                    else:
                        lines.append(current)
                        current = ContentLine(
                            chars=[SC_SPACE] * SCREEN_COLS,
                            colors=[fg] * SCREEN_COLS,
                        )
                        col = 0
                if not word:
                    continue
                if col > 0 and col + len(word) > SCREEN_COLS:
                    lines.append(current)
                    current = ContentLine(
                        chars=[SC_SPACE] * SCREEN_COLS,
                        colors=[fg] * SCREEN_COLS,
                    )
                    col = 0
                for ch in word:
                    if col >= SCREEN_COLS:
                        lines.append(current)
                        current = ContentLine(
                            chars=[SC_SPACE] * SCREEN_COLS,
                            colors=[fg] * SCREEN_COLS,
                        )
                        col = 0
                    current.chars[col] = _char_to_screencode(ch)
                    current.colors[col] = fg
                    col += 1
            lines.append(current)
        return lines if lines else [ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[fg] * SCREEN_COLS,
        )]

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        """Convert PETSCII code to a printable ASCII character for URL input."""
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    def _send_vic_colors(self, border: int, background: int):
        """DMA-write border ($D020) and background ($D021) colours to C64."""
        try:
            from network_helper import send_vic_colors
            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.warning(f"Could not send VIC colours: {e}")

    @staticmethod
    def _css_bg_to_c64_color(css_color: str) -> int:
        """Map a CSS colour string to the nearest C64 colour index."""
        r, g, b = _parse_css_color(css_color)
        best_idx = COL_BLUE  # default
        best_dist = float("inf")
        for idx, (pr, pg, pb) in enumerate(C64_PALETTE_RGB):
            dist = (r - pr) ** 2 + (g - pg) ** 2 + (b - pb) ** 2
            if dist < best_dist:
                best_dist = dist
                best_idx = idx
        return best_idx

    @staticmethod
    def _contrast_fg(bg_color: int) -> int:
        """Return a foreground colour that contrasts with the background."""
        # Simple luminance check
        r, g, b = C64_PALETTE_RGB[bg_color]
        luma = 0.299 * r + 0.587 * g + 0.114 * b
        if luma > 128:
            return COL_BLACK
        return COL_LIGHT_GREY


# =====================================================================
#  CSS colour parsing utility
# =====================================================================

# Named CSS colours (common subset)
_CSS_NAMED_COLORS = {
    "black": (0, 0, 0),
    "white": (255, 255, 255),
    "red": (255, 0, 0),
    "green": (0, 128, 0),
    "blue": (0, 0, 255),
    "yellow": (255, 255, 0),
    "cyan": (0, 255, 255),
    "magenta": (255, 0, 255),
    "orange": (255, 165, 0),
    "purple": (128, 0, 128),
    "grey": (128, 128, 128),
    "gray": (128, 128, 128),
    "silver": (192, 192, 192),
    "navy": (0, 0, 128),
    "teal": (0, 128, 128),
    "maroon": (128, 0, 0),
    "olive": (128, 128, 0),
    "lime": (0, 255, 0),
    "aqua": (0, 255, 255),
    "fuchsia": (255, 0, 255),
    "transparent": (255, 255, 255),
}


def _char_to_screencode(ch: str) -> int:
    """Convert a single character to C64 screen code.

    ASCII printable characters are passed directly.  Non-ASCII characters are
    transliterated to their closest ASCII base character via NFKD normalisation
    (e.g. á→a, č→c, ü→u).  If no ASCII base can be found the space code is
    returned.
    """
    code = ord(ch)
    if 32 <= code < 127:
        return ascii_to_screencode(code)
    normalized = unicodedata.normalize("NFKD", ch)
    for c in normalized:
        c_code = ord(c)
        if 32 <= c_code < 127:
            return ascii_to_screencode(c_code)
    return SC_SPACE


def _parse_css_color(css: str) -> Tuple[int, int, int]:
    """Parse a CSS colour string to (R, G, B) tuple."""
    css = css.strip().lower()

    # Named colour
    if css in _CSS_NAMED_COLORS:
        return _CSS_NAMED_COLORS[css]

    # Hex: #RGB or #RRGGBB
    m = re.match(r"^#([0-9a-f]{3})$", css)
    if m:
        h = m.group(1)
        return (int(h[0] * 2, 16), int(h[1] * 2, 16), int(h[2] * 2, 16))

    m = re.match(r"^#([0-9a-f]{6})$", css)
    if m:
        h = m.group(1)
        return (int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16))

    # rgb(R, G, B) or rgba(R, G, B, A)
    m = re.match(r"^rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)", css)
    if m:
        return (int(m.group(1)), int(m.group(2)), int(m.group(3)))

    # Default to white
    return (255, 255, 255)
