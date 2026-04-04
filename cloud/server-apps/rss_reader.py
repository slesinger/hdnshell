"""
Server-side RSS reader console (console 6) for C64 HDN Cloud Server.

A PETSCII RSS/Atom feed reader rendered into a 40x25 C64 screen-code
back-buffer.  Features: feed directory management, article list, article
reading view, settings, and help.

All input arrives as PETSCII key-presses from the C64 client.
Invoked from C64 by pressing CBM+6.
"""

import html
import json
import logging
import os
import re
import threading
import time
import unicodedata
from dataclasses import dataclass, field
from typing import Optional, List

import feedparser
import requests
from bs4 import BeautifulSoup

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii
from shared_state import get_clipboard, set_clipboard
from workspace_init import WORKSPACE_DIR

logger = logging.getLogger(__name__)

# ── C64 colour palette ──────────────────────────────────────────────
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

# ── Application colour scheme ───────────────────────────────────────
COL_TITLE_FG = COL_WHITE
COL_STATUS_FG = COL_WHITE
COL_TEXT_FG = COL_LIGHT_GREY
COL_SELECTED_FG = COL_WHITE
COL_FEED_NAME_FG = COL_CYAN
COL_DATE_FG = COL_DARK_GREY
COL_HEADING_FG = COL_YELLOW
COL_HELP_KEY_FG = COL_CYAN
COL_HELP_TEXT_FG = COL_LIGHT_GREY
COL_URL_FG = COL_LIGHT_BLUE
COL_CURSOR_FG = COL_YELLOW

# ── Screen-code constants ───────────────────────────────────────────
SC_SPACE = 0x20
SC_REVERSE_BIT = 0x80
SC_HLINE = 0x63

# ── PETSCII key constants ───────────────────────────────────────────
KEY_RETURN = 0x0D
KEY_CHARSET_UPPER_CTRLN = 0x0E  # CTRL+N
KEY_HOME = 0x13
KEY_DEL = 0x14
KEY_CTRL_W = 0x17
KEY_SPACE = 0x20
KEY_RUNSTOP = 0x03
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_CRSR_RT = 0x1D
KEY_CRSR_LT = 0x9D
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F5 = 0x87
KEY_F8 = 0x8C
KEY_CBM_C = 0xBC

# ── Modes ────────────────────────────────────────────────────────────
MODE_ARTICLES = 0
MODE_SETTINGS = 1
MODE_FEEDS = 2
MODE_HELP = 3
MODE_ARTICLE = 4
MODE_FEED_EDIT = 5

# ── Layout ───────────────────────────────────────────────────────────
TITLE_ROW = 0
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1  # 23
STATUS_ROW = 24
LINES_PER_ARTICLE = 5  # title + 2 summary lines + date + separator

# ── Settings keys (stored in config_manager) ─────────────────────────
SETTINGS_FIELDS = ["Max Articles", "Refresh (min)"]
SETTINGS_KEYS = ["rss_max_articles", "rss_refresh_minutes"]
SETTINGS_DEFAULTS = {"rss_max_articles": "100", "rss_refresh_minutes": "5"}

# ── Article fetch timeout for full-content fetch ────────────────────
_ARTICLE_FETCH_TIMEOUT = 15

# ── Feed file ────────────────────────────────────────────────────────
_FEEDS_FILENAME = "rss_feeds.json"

DEFAULT_FEEDS = [
    {"url": "https://news.ycombinator.com/rss", "title": "Hacker News"},
    {"url": "https://feeds.bbci.co.uk/news/rss.xml", "title": "BBC News"},
    {"url": "https://www.csdb.dk/rss/latestreleases.php", "title": "CSDb Releases"},
]

# ── Full article content extractor ─────────────────────────────────

def _fetch_full_article(url: str) -> str:
    """Fetch the full article text from *url* using requests + BeautifulSoup."""
    headers = {"User-Agent": "Mozilla/5.0 (compatible; HDNCloud RSS Reader/1.0)"}
    resp = requests.get(url, timeout=_ARTICLE_FETCH_TIMEOUT, headers=headers)
    resp.raise_for_status()

    soup = BeautifulSoup(resp.text, "html.parser")

    # Remove boilerplate elements
    for tag in soup(["script", "style", "nav", "header", "footer",
                     "aside", "form", "noscript", "iframe"]):
        tag.decompose()

    # Try common main-content selectors first
    content_node = (
        soup.find("article")
        or soup.find("main")
        or soup.find(attrs={"id": re.compile(r"content|article|post|story", re.I)})
        or soup.find(attrs={"class": re.compile(r"content|article|post|story|body", re.I)})
        or soup.body
        or soup
    )

    return _strip_html(content_node.get_text(separator="\n"))

# ── Help text ────────────────────────────────────────────────────────
HELP_TEXT = [
    "       RSS READER - HELP",
    "",
    " NAVIGATION",
    "  F1        Article list",
    "  F2        Settings",
    "  F3        Feed directory",
    "  F8        Help (this screen)",
    "",
    " ARTICLE LIST (MAIN SCREEN)",
    "  UP/DOWN   Select article",
    "  F5        Page down",
    "  RETURN    Read article",
    "  SPACE     Refresh feeds",
    "  F3        Feed directory",
    "",
    " ARTICLE VIEW",
    "  UP/DOWN   Scroll text",
    "  F3/F5     Page up / page down",
    "  C=+C      Copy link to clipboard",
    "  STOP      Back to article list",
    "",
    " FEED DIRECTORY",
    "  UP/DOWN   Select feed",
    "  RETURN    Edit feed URL",
    "  CTRL+N    Add new feed",
    "  CTRL+W    Delete selected feed",
    "  SPACE     Enable/disable feed",
    "  STOP      Back to article list",
    "",
    " FEED EDIT",
    "  LEFT/RT   Move cursor",
    "  HOME      Start of URL",
    "  DEL       Delete character",
    "  RETURN    Save and close",
    "  STOP      Cancel",
    "",
    " SETTINGS",
    "  UP/DOWN   Select setting",
    "  RETURN    Edit value",
    "  STOP      Back to article list",
    "",
    " CONSOLE SWITCHING",
    "  C=+1      Local C64 shell",
    "  C=+2      File editor",
    "  C=+3      Coding agent",
    "  C=+4      Web browser",
    "  C=+5      Telegram",
    "  C=+6      RSS reader (this)",
]

# Timeout for fetching an individual feed (seconds)
_FEED_FETCH_TIMEOUT = 15


# =====================================================================
#  Helper: strip HTML tags and decode entities
# =====================================================================

_TAG_RE = re.compile(r"<[^>]+>")
_WS_RE = re.compile(r"[ \t]+")
_NL_RE = re.compile(r"\n{3,}")


def _strip_html(text: str) -> str:
    """Remove HTML tags and decode entities, collapsing whitespace."""
    text = _TAG_RE.sub(" ", text)
    text = html.unescape(text)
    text = _WS_RE.sub(" ", text)
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = _NL_RE.sub("\n\n", text)
    return text.strip()


# =====================================================================
#  Helper: character to C64 screen code (with Unicode normalisation)
# =====================================================================

def _char_to_screencode(ch: str) -> int:
    code = ord(ch)
    if 32 <= code < 127:
        return ascii_to_screencode(code)
    normalized = unicodedata.normalize("NFKD", ch)
    for c in normalized:
        c_code = ord(c)
        if 32 <= c_code < 127:
            return ascii_to_screencode(c_code)
    return SC_SPACE


# =====================================================================
#  Helper: word-wrap a plain-text string into 40-char lines
# =====================================================================

def _word_wrap(text: str, width: int = SCREEN_COLS) -> List[str]:
    """Word-wrap *text* to the given *width*.  Respects existing newlines."""
    result: List[str] = []
    for paragraph in text.split("\n"):
        if not paragraph.strip():
            result.append("")
            continue
        words = paragraph.split()
        line = ""
        for word in words:
            if not line:
                line = word[:width]
            elif len(line) + 1 + len(word) <= width:
                line += " " + word
            else:
                result.append(line)
                line = word[:width]
        if line:
            result.append(line)
    return result


# =====================================================================
#  Feed persistence
# =====================================================================

def _feeds_path() -> str:
    return os.path.join(WORKSPACE_DIR, ".config", _FEEDS_FILENAME)


def _load_feeds() -> List[dict]:
    path = _feeds_path()
    if os.path.exists(path):
        try:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
            if isinstance(data, list):
                return data
        except Exception as e:
            logger.warning(f"Failed to load feeds: {e}")
    return list(DEFAULT_FEEDS)


def _save_feeds(feeds: List[dict]) -> None:
    path = _feeds_path()
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(feeds, f, indent=2)


# =====================================================================
#  RSSReaderConsole
# =====================================================================

class RSSReaderConsole(ServerConsole):
    """Console 6 — PETSCII RSS/Atom Feed Reader."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)

        # Feed directory
        self.feeds: List[dict] = _load_feeds()

        # Articles (merged from all feeds, sorted newest-first)
        self.articles: List[dict] = []
        self.article_sel: int = 0
        self.article_scroll: int = 0

        # Article reading view
        self.current_article: Optional[dict] = None
        self.article_lines: List[str] = []
        self.article_view_scroll: int = 0
        self._article_fetching: bool = False
        self._article_fetch_url: str = ""

        # Feed directory navigation
        self.feed_sel: int = 0
        self.feed_scroll: int = 0

        # Feed URL editing
        self.feed_edit_input: str = ""
        self.feed_edit_cursor: int = 0
        self.feed_edit_idx: int = -1  # -1 = adding new feed

        # Settings
        self.settings_sel: int = 0
        self.settings_editing: bool = False
        self.settings_input: str = ""
        self.settings_cursor: int = 0

        # Help scroll
        self.help_scroll: int = 0

        # Mode
        self.mode: int = MODE_ARTICLES
        self.prev_mode: int = MODE_ARTICLES

        # Status message (shown briefly)
        self.status_msg: str = ""

        # Feed fetch state
        self._last_fetch_time: float = 0.0
        self._fetching: bool = False

        # Kick off initial fetch
        self._fetch_all_feeds()
        self._full_render()

    # =================================================================
    #  LIFECYCLE
    # =================================================================

    def on_activate(self):
        self._send_vic_colors(COL_BLUE, COL_BLACK)
        # Auto-refresh if stale
        cfg = self._read_settings()
        refresh_min = int(cfg.get("rss_refresh_minutes", "5") or "5")
        if time.time() - self._last_fetch_time > refresh_min * 60:
            self._fetch_all_feeds()
        self._full_render()

    def on_deactivate(self):
        pass

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        self.status_msg = ""  # clear transient status
        handlers = {
            MODE_ARTICLES: self._key_articles,
            MODE_SETTINGS: self._key_settings,
            MODE_FEEDS: self._key_feeds,
            MODE_HELP: self._key_help,
            MODE_ARTICLE: self._key_article,
            MODE_FEED_EDIT: self._key_feed_edit,
        }
        handler = handlers.get(self.mode, self._key_articles)
        handler(petscii_code, modifiers)
        self._full_render()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    # =================================================================
    #  KEY HANDLERS — ARTICLES (main screen)
    # =================================================================

    def _key_articles(self, key: int, mod: int):
        n = len(self.articles)
        if not n:
            # Only allow mode switches when list is empty
            if key == KEY_F2:
                self._switch_mode(MODE_SETTINGS)
            elif key == KEY_F3:
                self._switch_mode(MODE_FEEDS)
            elif key == KEY_F8:
                self._switch_mode(MODE_HELP)
            elif key in (KEY_F5, KEY_SPACE):
                self._fetch_all_feeds()
            return

        if key == KEY_CRSR_UP:
            if self.article_sel > 0:
                self.article_sel -= 1
                self._ensure_article_visible()

        elif key == KEY_CRSR_DN:
            if self.article_sel < n - 1:
                self.article_sel += 1
                self._ensure_article_visible()

        elif key == KEY_F3:
            self._switch_mode(MODE_FEEDS)

        elif key == KEY_F5:
            # Page down
            self.article_sel = min(n - 1, self.article_sel + (CONTENT_ROWS // LINES_PER_ARTICLE))
            self._ensure_article_visible()

        elif key == KEY_RETURN:
            self._open_article(self.article_sel)

        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)

        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)

        elif key == KEY_SPACE:
            # Manual refresh
            self._fetch_all_feeds()

    # =================================================================
    #  KEY HANDLERS — ARTICLE VIEW
    # =================================================================

    def _key_article(self, key: int, mod: int):
        max_scroll = max(0, len(self.article_lines) - CONTENT_ROWS)

        if key == KEY_CRSR_UP:
            if self.article_view_scroll > 0:
                self.article_view_scroll -= 1

        elif key == KEY_CRSR_DN:
            if self.article_view_scroll < max_scroll:
                self.article_view_scroll += 1

        elif key == KEY_F3:
            self.article_view_scroll = max(0, self.article_view_scroll - CONTENT_ROWS)

        elif key == KEY_F5:
            self.article_view_scroll = min(max_scroll, self.article_view_scroll + CONTENT_ROWS)

        elif key == KEY_RUNSTOP:
            self.mode = MODE_ARTICLES

        elif key == KEY_CBM_C:
            if self.current_article and self.current_article.get("link"):
                set_clipboard(self.session_id, self.current_article["link"])
                self.status_msg = "Link copied!"

        elif key == KEY_F1:
            self.mode = MODE_ARTICLES

        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)

        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)

    # =================================================================
    #  KEY HANDLERS — FEED DIRECTORY
    # =================================================================

    def _key_feeds(self, key: int, mod: int):
        n = len(self.feeds)

        if key == KEY_CRSR_UP:
            if self.feed_sel > 0:
                self.feed_sel -= 1
                self._ensure_feed_visible()

        elif key == KEY_CRSR_DN:
            if n and self.feed_sel < n - 1:
                self.feed_sel += 1
                self._ensure_feed_visible()

        elif key == KEY_RETURN:
            if n:
                # Edit selected feed URL
                self.feed_edit_idx = self.feed_sel
                self.feed_edit_input = self.feeds[self.feed_sel].get("url", "")
                self.feed_edit_cursor = len(self.feed_edit_input)
                self.mode = MODE_FEED_EDIT

        elif key == KEY_CHARSET_UPPER_CTRLN:
            # New feed
            self.feed_edit_idx = -1
            self.feed_edit_input = ""
            self.feed_edit_cursor = 0
            self.mode = MODE_FEED_EDIT

        elif key == KEY_SPACE:
            # Toggle enable/disable selected feed
            if n:
                feed = self.feeds[self.feed_sel]
                feed["enabled"] = not feed.get("enabled", True)
                _save_feeds(self.feeds)
                self.status_msg = "Feed " + ("enabled" if feed["enabled"] else "disabled")

        elif key == KEY_CTRL_W:
            # Delete selected feed
            if n:
                del self.feeds[self.feed_sel]
                if self.feed_sel >= len(self.feeds) and self.feed_sel > 0:
                    self.feed_sel -= 1
                _save_feeds(self.feeds)
                self.status_msg = "Feed deleted"

        elif key == KEY_RUNSTOP:
            self.mode = MODE_ARTICLES

        elif key == KEY_F1:
            self.mode = MODE_ARTICLES

        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)

        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)

    # =================================================================
    #  KEY HANDLERS — FEED EDIT
    # =================================================================

    def _key_feed_edit(self, key: int, mod: int):
        if key == KEY_RETURN:
            url = self.feed_edit_input.strip()
            if url:
                if self.feed_edit_idx == -1:
                    # Adding new feed
                    self.feeds.append({"url": url, "title": ""})
                    self.feed_sel = len(self.feeds) - 1
                else:
                    self.feeds[self.feed_edit_idx]["url"] = url
                _save_feeds(self.feeds)
                # Refresh to pick up new feed title
                self._fetch_all_feeds()
            self.mode = MODE_FEEDS

        elif key == KEY_RUNSTOP:
            self.mode = MODE_FEEDS

        elif key == KEY_CRSR_LT:
            if self.feed_edit_cursor > 0:
                self.feed_edit_cursor -= 1

        elif key == KEY_CRSR_RT:
            if self.feed_edit_cursor < len(self.feed_edit_input):
                self.feed_edit_cursor += 1

        elif key == KEY_HOME:
            self.feed_edit_cursor = 0

        elif key == KEY_DEL:
            if self.feed_edit_cursor > 0:
                self.feed_edit_input = (
                    self.feed_edit_input[: self.feed_edit_cursor - 1]
                    + self.feed_edit_input[self.feed_edit_cursor :]
                )
                self.feed_edit_cursor -= 1

        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.feed_edit_input) < 256:
                self.feed_edit_input = (
                    self.feed_edit_input[: self.feed_edit_cursor]
                    + ch
                    + self.feed_edit_input[self.feed_edit_cursor :]
                )
                self.feed_edit_cursor += 1

    # =================================================================
    #  KEY HANDLERS — SETTINGS
    # =================================================================

    def _key_settings(self, key: int, mod: int):
        if self.settings_editing:
            self._key_settings_edit(key, mod)
            return

        n = len(SETTINGS_FIELDS)

        if key == KEY_CRSR_UP:
            if self.settings_sel > 0:
                self.settings_sel -= 1
        elif key == KEY_CRSR_DN:
            if self.settings_sel < n - 1:
                self.settings_sel += 1

        elif key == KEY_RETURN:
            cfg = self._read_settings()
            cfg_key = SETTINGS_KEYS[self.settings_sel]
            self.settings_input = cfg.get(cfg_key, SETTINGS_DEFAULTS.get(cfg_key, ""))
            self.settings_cursor = len(self.settings_input)
            self.settings_editing = True

        elif key == KEY_RUNSTOP:
            self.mode = MODE_ARTICLES
        elif key == KEY_F1:
            self.mode = MODE_ARTICLES
        elif key == KEY_F3:
            self._switch_mode(MODE_FEEDS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)

    def _key_settings_edit(self, key: int, mod: int):
        if key == KEY_RETURN:
            cfg = self._read_settings()
            cfg_key = SETTINGS_KEYS[self.settings_sel]
            cfg[cfg_key] = self.settings_input.strip()
            self._write_settings(cfg)
            self.settings_editing = False

        elif key == KEY_RUNSTOP:
            self.settings_editing = False

        elif key == KEY_CRSR_LT:
            if self.settings_cursor > 0:
                self.settings_cursor -= 1
        elif key == KEY_CRSR_RT:
            if self.settings_cursor < len(self.settings_input):
                self.settings_cursor += 1
        elif key == KEY_HOME:
            self.settings_cursor = 0

        elif key == KEY_DEL:
            if self.settings_cursor > 0:
                self.settings_input = (
                    self.settings_input[: self.settings_cursor - 1]
                    + self.settings_input[self.settings_cursor :]
                )
                self.settings_cursor -= 1

        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.settings_input) < 40:
                self.settings_input = (
                    self.settings_input[: self.settings_cursor]
                    + ch
                    + self.settings_input[self.settings_cursor :]
                )
                self.settings_cursor += 1

    # =================================================================
    #  KEY HANDLERS — HELP
    # =================================================================

    def _key_help(self, key: int, mod: int):
        max_scroll = max(0, len(HELP_TEXT) - CONTENT_ROWS)

        if key == KEY_CRSR_UP:
            if self.help_scroll > 0:
                self.help_scroll -= 1
        elif key == KEY_CRSR_DN:
            if self.help_scroll < max_scroll:
                self.help_scroll += 1
        elif key == KEY_F3:
            self.help_scroll = max(0, self.help_scroll - CONTENT_ROWS)
        elif key == KEY_F5:
            self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
        elif key in (KEY_F8, KEY_RUNSTOP):
            self.mode = self.prev_mode
        elif key == KEY_F1:
            self.mode = MODE_ARTICLES
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)

    # =================================================================
    #  MODE SWITCHING
    # =================================================================

    def _switch_mode(self, new_mode: int):
        self.prev_mode = self.mode
        self.mode = new_mode

    # =================================================================
    #  ARTICLE OPERATIONS
    # =================================================================

    def _open_article(self, idx: int):
        if idx < 0 or idx >= len(self.articles):
            return
        art = self.articles[idx]
        self.current_article = art
        self.article_view_scroll = 0

        # Build readable text
        lines: List[str] = []
        title_text = art.get("title", "(no title)") or "(no title)"
        lines.extend(_word_wrap(title_text))
        lines.append("")
        src = art.get("feed_title", "")
        date = art.get("published", "")
        if src or date:
            meta = []
            if src:
                meta.append(src)
            if date:
                meta.append(date)
            lines.extend(_word_wrap(" | ".join(meta)))
            lines.append("")
        link = art.get("link", "")
        if link:
            lines.append(link[:SCREEN_COLS])
            lines.append("")

        summary = art.get("summary", "")
        if summary:
            lines.extend(_word_wrap(summary))

        self.article_lines = lines
        self.mode = MODE_ARTICLE

        # Kick off background full-content fetch
        if link:
            self._start_article_fetch(link)

    def _start_article_fetch(self, url: str):
        """Fetch the full article in a background thread."""
        if self._article_fetching:
            return
        self._article_fetching = True
        self._article_fetch_url = url

        def _do_fetch():
            try:
                full_text = _fetch_full_article(url)
            except Exception as e:
                full_text = f"(Could not fetch full article: {e})"
            finally:
                self._article_fetching = False

            # Only update if we are still viewing the same article
            if (
                self.mode == MODE_ARTICLE
                and self.current_article
                and self.current_article.get("link") == url
            ):
                art = self.current_article
                lines: List[str] = []
                title_text = art.get("title", "(no title)") or "(no title)"
                lines.extend(_word_wrap(title_text))
                lines.append("")
                src = art.get("feed_title", "")
                date = art.get("published", "")
                if src or date:
                    meta = []
                    if src:
                        meta.append(src)
                    if date:
                        meta.append(date)
                    lines.extend(_word_wrap(" | ".join(meta)))
                    lines.append("")
                if url:
                    lines.append(url[:SCREEN_COLS])
                    lines.append("")
                lines.extend(_word_wrap(full_text))
                self.article_lines = lines
                self.article_view_scroll = 0
                self.status_msg = "Full article loaded"
                self._full_render()

        threading.Thread(target=_do_fetch, daemon=True).start()

    def _ensure_article_visible(self):
        """Ensure the selected article is visible in the viewport."""
        top_line = self.article_sel * LINES_PER_ARTICLE
        if top_line < self.article_scroll:
            self.article_scroll = top_line
        bottom_line = top_line + LINES_PER_ARTICLE - 1
        if bottom_line >= self.article_scroll + CONTENT_ROWS:
            self.article_scroll = bottom_line - CONTENT_ROWS + 1

    def _ensure_feed_visible(self):
        """Ensure the selected feed is visible in the viewport."""
        rows_per_feed = 2
        top_line = self.feed_sel * rows_per_feed
        if top_line < self.feed_scroll:
            self.feed_scroll = top_line
        bottom_line = top_line + rows_per_feed - 1
        if bottom_line >= self.feed_scroll + CONTENT_ROWS:
            self.feed_scroll = bottom_line - CONTENT_ROWS + 1

    # =================================================================
    #  FEED FETCHING
    # =================================================================

    def _fetch_all_feeds(self):
        """Fetch all subscribed feeds and merge articles."""
        if self._fetching:
            return
        self._fetching = True
        self.status_msg = "Loading feeds..."
        self._full_render()

        cfg = self._read_settings()
        max_articles = int(cfg.get("rss_max_articles", "100") or "100")

        articles: List[dict] = []
        seen_links: set = set()

        for feed_info in self.feeds:
            if not feed_info.get("enabled", True):
                continue
            url = feed_info.get("url", "")
            if not url:
                continue
            try:
                parsed = feedparser.parse(url)
                feed_title = feed_info.get("title", "") or parsed.feed.get("title", url)
                # Update stored title if empty
                if not feed_info.get("title"):
                    feed_info["title"] = feed_title

                for entry in parsed.entries:
                    link = entry.get("link", "")
                    if link and link in seen_links:
                        continue
                    if link:
                        seen_links.add(link)

                    # Parse published date
                    pub_parsed = entry.get("published_parsed") or entry.get("updated_parsed")
                    pub_str = ""
                    pub_ts = 0.0
                    if pub_parsed:
                        try:
                            pub_ts = time.mktime(pub_parsed)
                            pub_str = time.strftime("%Y-%m-%d %H:%M", pub_parsed)
                        except Exception:
                            pass
                    if not pub_str:
                        pub_str = entry.get("published", entry.get("updated", ""))[:19]

                    summary_raw = entry.get("summary", entry.get("description", ""))
                    summary = _strip_html(summary_raw) if summary_raw else ""

                    articles.append({
                        "title": entry.get("title", "(no title)"),
                        "summary": summary,
                        "link": link,
                        "published": pub_str,
                        "pub_ts": pub_ts,
                        "feed_title": feed_title,
                    })
            except Exception as e:
                logger.warning(f"Error fetching feed {url}: {e}")

        # Sort newest first
        articles.sort(key=lambda a: a.get("pub_ts", 0), reverse=True)
        self.articles = articles[:max_articles]

        # Save updated feed titles
        _save_feeds(self.feeds)

        self._last_fetch_time = time.time()
        self._fetching = False
        self.status_msg = f"{len(self.articles)} articles loaded"

        # Reset selection if needed
        if self.article_sel >= len(self.articles):
            self.article_sel = max(0, len(self.articles) - 1)
        self.article_scroll = 0

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        """Re-render the entire 40x25 screen."""
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = COL_TEXT_FG

        if self.mode == MODE_ARTICLES:
            self._render_articles()
        elif self.mode == MODE_ARTICLE:
            self._render_article_view()
        elif self.mode == MODE_FEEDS:
            self._render_feeds()
        elif self.mode == MODE_FEED_EDIT:
            self._render_feed_edit()
        elif self.mode == MODE_SETTINGS:
            self._render_settings()
        elif self.mode == MODE_HELP:
            self._render_help()

    # ── Title bar (row 0, reversed) ──────────────────────────────────

    def _render_title_bar(self, text: str):
        text = text[:SCREEN_COLS].ljust(SCREEN_COLS)
        for col, ch in enumerate(text):
            self.screen[col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[col] = COL_TITLE_FG

    # ── Status bar (row 24, reversed) ────────────────────────────────

    def _render_status_bar(self, text: str):
        if self.status_msg:
            text = self.status_msg
        text = text[:SCREEN_COLS].ljust(SCREEN_COLS)
        off = STATUS_ROW * SCREEN_COLS
        for col, ch in enumerate(text):
            self.screen[off + col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[off + col] = COL_STATUS_FG

    # ── Write a text string at a given row/col ───────────────────────

    def _write_text(self, row: int, col: int, text: str, color: int,
                    reverse: bool = False, max_len: int = SCREEN_COLS):
        if row < 0 or row >= SCREEN_ROWS:
            return
        off = row * SCREEN_COLS + col
        for i, ch in enumerate(text):
            c = col + i
            if c >= SCREEN_COLS or i >= max_len:
                break
            sc = _char_to_screencode(ch)
            if reverse:
                sc |= SC_REVERSE_BIT
            self.screen[off + i] = sc
            self.color[off + i] = color

    # ── Article list ─────────────────────────────────────────────────

    def _render_articles(self):
        n = len(self.articles)
        count_str = f" {n} articles"
        feeds_str = f" {len(self.feeds)} feeds"
        title = "RSS READER" + " " * max(1, SCREEN_COLS - 10 - len(count_str) - len(feeds_str)) + feeds_str + count_str
        self._render_title_bar(title[:SCREEN_COLS])

        if not n:
            self._write_text(3, 2, "No articles loaded.", COL_TEXT_FG)
            self._write_text(5, 2, "Press SPACE to refresh feeds", COL_HELP_KEY_FG)
            self._write_text(6, 2, "or F3 to manage feeds.", COL_HELP_KEY_FG)
            self._render_status_bar("SPC:Refresh F2:Set F3:Feeds F8:Help")
            return

        # Render visible articles
        screen_row = CONTENT_TOP
        # Determine which articles are visible based on scroll
        first_art = self.article_scroll // LINES_PER_ARTICLE
        for art_idx in range(first_art, n):
            if screen_row > CONTENT_BOTTOM:
                break
            art = self.articles[art_idx]
            is_sel = (art_idx == self.article_sel)

            # Line 1: feed abbreviation + title
            feed_abbr = (art.get("feed_title", "") or "")[:8]
            if feed_abbr:
                feed_abbr = feed_abbr + " "
            title_space = SCREEN_COLS - len(feed_abbr)
            art_title = (art.get("title", "") or "(no title)")[:title_space]
            full_line = feed_abbr + art_title

            if is_sel:
                self._write_text(screen_row, 0, full_line.ljust(SCREEN_COLS),
                                 COL_SELECTED_FG, reverse=True)
            else:
                # Feed name in cyan, title in white
                if feed_abbr:
                    self._write_text(screen_row, 0, feed_abbr, COL_FEED_NAME_FG)
                self._write_text(screen_row, len(feed_abbr), art_title, COL_WHITE)

            screen_row += 1
            if screen_row > CONTENT_BOTTOM:
                break

            # Lines 2-3: summary preview (up to 2 word-wrapped lines)
            summary = art.get("summary", "") or ""
            preview_lines = _word_wrap(summary[:200])[:2]
            for pi in range(2):
                pline = preview_lines[pi] if pi < len(preview_lines) else ""
                if is_sel:
                    self._write_text(screen_row, 0, pline.ljust(SCREEN_COLS),
                                     COL_TEXT_FG, reverse=True)
                else:
                    self._write_text(screen_row, 0, pline, COL_TEXT_FG)
                screen_row += 1
                if screen_row > CONTENT_BOTTOM:
                    break

            if screen_row > CONTENT_BOTTOM:
                break

            # Line 4: date
            date_str = art.get("published", "")[:SCREEN_COLS]
            if is_sel:
                self._write_text(screen_row, 0, date_str.ljust(SCREEN_COLS),
                                 COL_LIGHT_BLUE, reverse=True)
            else:
                self._write_text(screen_row, 0, date_str, COL_DATE_FG)

            screen_row += 1

            # Line 5: horizontal separator between articles
            if screen_row <= CONTENT_BOTTOM:
                off = screen_row * SCREEN_COLS
                for col in range(SCREEN_COLS):
                    self.screen[off + col] = SC_HLINE
                    self.color[off + col] = COL_DARK_GREY
                screen_row += 1

        self._render_status_bar("RET:Read SPC:Refresh F3:Feeds F8:Help")

    # ── Article reading view ─────────────────────────────────────────

    def _render_article_view(self):
        if not self.current_article:
            return
        title = (self.current_article.get("title", "") or "Article")[:SCREEN_COLS]
        self._render_title_bar(title)

        total = len(self.article_lines)
        # Find where the title ends (index of first empty line)
        title_end = 0
        for i, l in enumerate(self.article_lines):
            if not l:
                title_end = i
                break

        for row_idx in range(CONTENT_ROWS):
            line_idx = self.article_view_scroll + row_idx
            if line_idx >= total:
                break
            line = self.article_lines[line_idx]
            screen_row = CONTENT_TOP + row_idx

            # Title lines (before the first empty line) get heading color
            if line_idx < title_end:
                self._write_text(screen_row, 0, line[:SCREEN_COLS], COL_HEADING_FG)
            # URL line gets URL color
            elif line.startswith("http://") or line.startswith("https://"):
                self._write_text(screen_row, 0, line[:SCREEN_COLS], COL_URL_FG)
            else:
                self._write_text(screen_row, 0, line[:SCREEN_COLS], COL_TEXT_FG)

        # Scroll indicator
        pct = ""
        if total > CONTENT_ROWS:
            pct = f" {self.article_view_scroll * 100 // max(1, total - CONTENT_ROWS)}%"
        if self._article_fetching:
            self._render_status_bar(f"Fetching full article...{pct}")
        else:
            self._render_status_bar(f"STOP:Back C=+C:Copy Link{pct}")

    # ── Feed directory ───────────────────────────────────────────────

    def _render_feeds(self):
        n = len(self.feeds)
        self._render_title_bar(f"FEED DIRECTORY ({n} feeds)")

        if not n:
            self._write_text(3, 2, "No feeds configured.", COL_TEXT_FG)
            self._write_text(5, 2, "Press CTRL+N to add a feed.", COL_HELP_KEY_FG)
            self._render_status_bar("CTRL+N:New  STOP:Back  F8:Help")
            return

        screen_row = CONTENT_TOP
        rows_per_feed = 2
        first_feed = self.feed_scroll // rows_per_feed
        for fi in range(first_feed, n):
            if screen_row > CONTENT_BOTTOM:
                break
            feed = self.feeds[fi]
            is_sel = (fi == self.feed_sel)

            # Line 1: feed title with enabled/disabled indicator
            enabled = feed.get("enabled", True)
            prefix = "" if enabled else "[OFF] "
            title = (prefix + (feed.get("title", "") or "(untitled)"))[:SCREEN_COLS]
            title_col = COL_WHITE if enabled else COL_DARK_GREY
            if is_sel:
                self._write_text(screen_row, 0, title.ljust(SCREEN_COLS),
                                 COL_SELECTED_FG, reverse=True)
            else:
                self._write_text(screen_row, 0, title, title_col)
            screen_row += 1

            if screen_row > CONTENT_BOTTOM:
                break

            # Line 2: URL (truncated)
            url = (feed.get("url", ""))[:SCREEN_COLS]
            url_col = COL_URL_FG if enabled else COL_DARK_GREY
            if is_sel:
                self._write_text(screen_row, 0, url.ljust(SCREEN_COLS),
                                 COL_LIGHT_BLUE, reverse=True)
            else:
                self._write_text(screen_row, 0, url, url_col)
            screen_row += 1

        self._render_status_bar("RET:Edit ^N:New ^W:Del SPC:Toggle STOP:Back")

    # ── Feed URL edit ────────────────────────────────────────────────

    def _render_feed_edit(self):
        if self.feed_edit_idx == -1:
            self._render_title_bar("ADD NEW FEED")
        else:
            self._render_title_bar("EDIT FEED URL")

        self._write_text(3, 1, "Enter feed URL:", COL_TEXT_FG)

        # Render URL input area (rows 5-7, show visible portion)
        url = self.feed_edit_input
        cursor = self.feed_edit_cursor

        # Determine visible window of the URL
        visible_width = SCREEN_COLS - 2
        # Ensure cursor is visible
        view_start = 0
        if cursor > visible_width - 1:
            view_start = cursor - visible_width + 1

        visible = url[view_start: view_start + visible_width]

        self._write_text(5, 1, visible, COL_URL_FG)

        # Draw cursor
        cursor_col = 1 + (cursor - view_start)
        if 0 <= cursor_col < SCREEN_COLS:
            off = 5 * SCREEN_COLS + cursor_col
            if off < SCREEN_SIZE:
                self.screen[off] = self.screen[off] | SC_REVERSE_BIT
                self.color[off] = COL_CURSOR_FG

        self._write_text(8, 1, "RETURN to save, STOP to cancel", COL_HELP_TEXT_FG)

        self._render_status_bar("RETURN:Save  STOP:Cancel")

    # ── Settings ─────────────────────────────────────────────────────

    def _render_settings(self):
        self._render_title_bar("SETTINGS")
        cfg = self._read_settings()

        screen_row = CONTENT_TOP + 1
        for i, label in enumerate(SETTINGS_FIELDS):
            if screen_row > CONTENT_BOTTOM - 1:
                break
            is_sel = (i == self.settings_sel)
            cfg_key = SETTINGS_KEYS[i]
            value = cfg.get(cfg_key, SETTINGS_DEFAULTS.get(cfg_key, ""))

            # If currently editing this field
            if is_sel and self.settings_editing:
                self._write_text(screen_row, 1, f"{label}:", COL_HEADING_FG)
                screen_row += 1
                # Editable input
                inp = self.settings_input
                self._write_text(screen_row, 2, inp, COL_URL_FG)
                # Cursor
                cursor_col = 2 + self.settings_cursor
                if cursor_col < SCREEN_COLS:
                    off = screen_row * SCREEN_COLS + cursor_col
                    if off < SCREEN_SIZE:
                        self.screen[off] = self.screen[off] | SC_REVERSE_BIT
                        self.color[off] = COL_CURSOR_FG
                screen_row += 2
            else:
                line = f" {label}: {value}"
                if is_sel:
                    self._write_text(screen_row, 0, line.ljust(SCREEN_COLS),
                                     COL_SELECTED_FG, reverse=True)
                else:
                    self._write_text(screen_row, 0, line, COL_TEXT_FG)
                screen_row += 2

        self._render_status_bar("RET:Edit  STOP:Back  F8:Help")

    # ── Help ─────────────────────────────────────────────────────────

    def _render_help(self):
        self._render_title_bar("HELP")

        for row_idx in range(CONTENT_ROWS):
            line_idx = self.help_scroll + row_idx
            if line_idx >= len(HELP_TEXT):
                break
            line = HELP_TEXT[line_idx]
            screen_row = CONTENT_TOP + row_idx
            self._write_text(screen_row, 0, line[:SCREEN_COLS], COL_HELP_TEXT_FG)

        self._render_status_bar("UP/DN:Scroll  F8/STOP:Close")

    # =================================================================
    #  SETTINGS PERSISTENCE (via config_manager)
    # =================================================================

    @staticmethod
    def _read_settings() -> dict:
        try:
            from config_manager import read_config
            return read_config()
        except Exception:
            return {}

    @staticmethod
    def _write_settings(data: dict):
        try:
            from config_manager import write_config
            write_config(data)
        except Exception as e:
            logger.warning(f"Could not write settings: {e}")

    # =================================================================
    #  UTILITY METHODS
    # =================================================================

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        """Convert PETSCII code to a printable ASCII character."""
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    def _send_vic_colors(self, border: int, background: int):
        """DMA-write border and background colours to C64."""
        try:
            from network_helper import send_vic_colors
            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.warning(f"Could not send VIC colours: {e}")
