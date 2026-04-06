"""
Server-side Wikipedia browser console (console 7) for C64 HDN Cloud Server.

A specialised PETSCII Wikipedia reader rendered into a 40x25 C64 screen-code
back-buffer.  Strips all non-essential content from Wikipedia pages to show
only the super-essential text and links on a 40-column screen.

Content extraction is structure-based (tag semantics, link patterns) — no
hard-coded element IDs — so it works across languages and survives layout
changes.

Uses the shared Playwright worker from web_browser.py for page fetching.

All input arrives as PETSCII key-presses from the C64 client.
Invoked from C64 by pressing CBM+7.
"""

import logging
import re
import unicodedata
from dataclasses import dataclass, field
from typing import Optional, List, Tuple
from urllib.parse import urljoin, urlparse, quote

from server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    ascii_to_screencode,
)
from generate_pet_asc_table import Petscii
from text_utils import word_wrap

logger = logging.getLogger(__name__)


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

# Wikipedia browser colour scheme
COL_LINK_FG = COL_CYAN
COL_LINK_ACTIVE_FG = COL_WHITE
COL_HEADING_FG = COL_WHITE
COL_TEXT_FG = COL_LIGHT_GREY
COL_STATUS_FG = COL_WHITE
COL_SEARCH_LABEL_FG = COL_LIGHT_BLUE
COL_SEARCH_INPUT_FG = COL_WHITE
COL_HELP_FG = COL_LIGHT_GREY
COL_LANG_FG = COL_YELLOW

# Special screen codes
SC_SPACE = 0x20
SC_LBRACKET = 0x1B  # [
SC_RBRACKET = 0x1D  # ]
SC_HLINE = 0x63
SC_REVERSE_BIT = 0x80

# PETSCII key constants
KEY_RETURN = 0x0D
KEY_CHARSET_UPPER_CTRLN = 0x0E
KEY_HOME_CTRLS = 0x13
KEY_DEL_CTRLT = 0x14
KEY_SPACE = 0x20
KEY_RUNSTOP = 0x03
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_CRSR_RT = 0x1D
KEY_CRSR_LT = 0x9D
KEY_LEFT_ARROW = 0x5F
KEY_F1 = 0x85
KEY_F3 = 0x86
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C

# Browser modes
MODE_BROWSE = 0
MODE_SEARCH = 1
MODE_HELP = 2

# Layout
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1  # 23
STATUS_ROW = 24
MAX_SEARCH_LEN = 200

# Wikipedia URL patterns (structure-based detection)
_WIKI_LANG_RE = re.compile(r"^https?://([a-z]{2,3}(?:-[a-z]+)?)\.wikipedia\.org/?$")
_WIKI_ARTICLE_RE = re.compile(
    r"^https?://([a-z]{2,3}(?:-[a-z]+)?)\.wikipedia\.org/wiki/(.+)"
)
_WIKI_MAIN_RE = re.compile(r"^https?://(www\.)?wikipedia\.org/?$")

HELP_LINES = [
    "=== HDNSH WIKIPEDIA BROWSER   F8=close =",
    "",
    " NAVIGATION",
    " UP/DOWN     Scroll one line",
    " F3          Page up",
    " F5          Page down",
    " SPACE       Cycle links on screen",
    " RETURN      Follow highlighted link",
    " LEFT ARROW  Back one page",
    "",
    " SEARCH",
    " F7          Open search input",
    " Type query, press RETURN to search",
    " STOP        Cancel search",
    "",
    " OTHER",
    " F1          Go to wikipedia.org",
    " F8          This help screen",
    "",
    " CONSOLE SWITCHING",
    " C=+1        Local C64 shell",
    " C=+4        Web browser",
    " C=+7        Wikipedia (this)",
    "",
    " press F8 or STOP to close help",
]


# =====================================================================
#  ContentLine — one rendered line in the page view
# =====================================================================
@dataclass
class ContentLine:
    chars: List[int] = field(default_factory=lambda: [SC_SPACE] * SCREEN_COLS)
    colors: List[int] = field(default_factory=lambda: [COL_TEXT_FG] * SCREEN_COLS)


# =====================================================================
#  LinkInfo — extracted hyperlink with position in content_lines
# =====================================================================
@dataclass
class LinkInfo:
    url: str
    text: str
    row_start: int
    row_end: int
    col_start: int
    col_end: int


# =====================================================================
#  WikiBrowserConsole — main Wikipedia browser console class
# =====================================================================
class WikiBrowserConsole(ServerConsole):
    """Console 7 — PETSCII Wikipedia Browser."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)
        self.mode: int = MODE_BROWSE
        self.content_lines: List[ContentLine] = []
        self.links: List[LinkInfo] = []
        self.scroll_y: int = 0
        self.active_link_idx: int = -1
        self.current_url: str = ""
        self.current_title: str = ""
        self.history: List[str] = []
        self._navigating_back: bool = False
        # Search state
        self.search_input: str = ""
        self.search_cursor: int = 0
        self.search_lang: str = "en"
        # Show welcome screen
        self._show_welcome()
        self._full_render()

    # =================================================================
    #  LIFECYCLE HOOKS
    # =================================================================

    def on_activate(self):
        self._send_vic_colors(COL_BLACK, COL_BLACK)
        self._full_render()

    def on_deactivate(self):
        pass

    # =================================================================
    #  INPUT HANDLER
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        handlers = {
            MODE_BROWSE: self._key_browse,
            MODE_SEARCH: self._key_search,
            MODE_HELP: self._key_help,
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

    def _key_browse(self, key: int, mod: int):
        if key == KEY_CRSR_UP:
            if self.scroll_y > 0:
                self.scroll_y -= 1
                self.active_link_idx = -1

        elif key == KEY_CRSR_DN:
            max_scroll = max(0, len(self.content_lines) - CONTENT_ROWS)
            if self.scroll_y < max_scroll:
                self.scroll_y += 1
                self.active_link_idx = -1

        elif key == KEY_F3:
            self.scroll_y = max(0, self.scroll_y - CONTENT_ROWS)
            self.active_link_idx = -1

        elif key == KEY_F5:
            max_scroll = max(0, len(self.content_lines) - CONTENT_ROWS)
            self.scroll_y = min(max_scroll, self.scroll_y + CONTENT_ROWS)
            self.active_link_idx = -1

        elif key == KEY_SPACE:
            self._cycle_link()

        elif key == KEY_RETURN:
            if 0 <= self.active_link_idx < len(self.links):
                link = self.links[self.active_link_idx]
                target_url = urljoin(self.current_url, link.url) if self.current_url else link.url
                self._navigate(target_url)

        elif key == KEY_F7:
            self.search_input = ""
            self.search_cursor = 0
            self.mode = MODE_SEARCH
            self._send_vic_colors(COL_BLUE, COL_BLUE)

        elif key == KEY_F1:
            self._navigate("https://www.wikipedia.org/")

        elif key == KEY_LEFT_ARROW:
            if self.history:
                prev_url = self.history.pop()
                self._navigating_back = True
                self._navigate(prev_url)

        elif key == KEY_F8:
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_BLUE, COL_BLUE)

        elif key == KEY_RUNSTOP:
            self.search_input = ""
            self.search_cursor = 0
            self.mode = MODE_SEARCH
            self._send_vic_colors(COL_BLUE, COL_BLUE)

    def _key_search(self, key: int, mod: int):
        if key == KEY_RETURN:
            query = self.search_input.strip()
            if query:
                search_url = (
                    f"https://{self.search_lang}.wikipedia.org/w/index.php"
                    f"?search={quote(query)}&title=Special%3ASearch&go=Go"
                )
                self.mode = MODE_BROWSE
                self._send_vic_colors(COL_BLACK, COL_BLACK)
                self._navigate(search_url)
            return

        elif key == KEY_RUNSTOP:
            self.mode = MODE_BROWSE
            self._send_vic_colors(COL_BLACK, COL_BLACK)
            return

        elif key == KEY_DEL_CTRLT:
            if self.search_cursor > 0:
                self.search_input = (
                    self.search_input[: self.search_cursor - 1]
                    + self.search_input[self.search_cursor :]
                )
                self.search_cursor -= 1

        elif key == KEY_CRSR_LT:
            if self.search_cursor > 0:
                self.search_cursor -= 1

        elif key == KEY_CRSR_RT:
            if self.search_cursor < len(self.search_input):
                self.search_cursor += 1

        elif key == KEY_HOME_CTRLS:
            self.search_cursor = 0

        elif key == KEY_CRSR_UP:
            # Cycle search language backward
            self._cycle_search_lang(-1)

        elif key == KEY_CRSR_DN:
            # Cycle search language forward
            self._cycle_search_lang(1)

        elif key == KEY_F8:
            self.help_scroll = 0
            self.mode = MODE_HELP
            self._send_vic_colors(COL_BLUE, COL_BLUE)

        else:
            ch = self._petscii_to_printable(key)
            if ch and len(self.search_input) < MAX_SEARCH_LEN:
                self.search_input = (
                    self.search_input[: self.search_cursor]
                    + ch
                    + self.search_input[self.search_cursor :]
                )
                self.search_cursor += 1

    _SEARCH_LANGS = ["en", "de", "fr", "es", "it", "pt", "ru", "ja", "zh", "pl",
                     "nl", "sv", "uk", "ca", "fi", "cs", "hu", "ko", "id", "tr"]

    def _cycle_search_lang(self, direction: int):
        try:
            idx = self._SEARCH_LANGS.index(self.search_lang)
        except ValueError:
            idx = 0
        idx = (idx + direction) % len(self._SEARCH_LANGS)
        self.search_lang = self._SEARCH_LANGS[idx]

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
        elif key in (KEY_RUNSTOP, KEY_F8):
            self.mode = MODE_BROWSE
            self._send_vic_colors(COL_BLACK, COL_BLACK)

    # =================================================================
    #  LINK CYCLING
    # =================================================================

    def _cycle_link(self):
        if not self.links:
            return
        vis_start = self.scroll_y
        vis_end = self.scroll_y + CONTENT_ROWS - 1
        visible = [
            (i, lnk)
            for i, lnk in enumerate(self.links)
            if lnk.row_end >= vis_start and lnk.row_start <= vis_end
        ]
        if not visible:
            self.active_link_idx = -1
            return
        if self.active_link_idx < 0:
            self.active_link_idx = visible[0][0]
        else:
            found = False
            for vi, (gi, _) in enumerate(visible):
                if gi == self.active_link_idx:
                    next_vi = (vi + 1) % len(visible)
                    self.active_link_idx = visible[next_vi][0]
                    found = True
                    break
            if not found:
                self.active_link_idx = visible[0][0]

    # =================================================================
    #  NAVIGATION
    # =================================================================

    def _navigate(self, url: str):
        logger.info(f"Wiki browser navigating to: {url}")

        if not self._navigating_back and self.current_url:
            self.history.append(self.current_url)
            if len(self.history) > 50:
                self.history = self.history[-50:]
        self._navigating_back = False

        self.current_url = url
        self.active_link_idx = -1
        self.scroll_y = 0

        # Show loading
        self.content_lines = [self._make_text_line("Loading...", COL_WHITE)]
        self._full_render()
        try:
            from network_helper import send_screen_data
            send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception:
            pass

        try:
            page_data = self._fetch_page(url)
            self.current_title = (page_data.get("title") or url)[:38]

            # Detect page type and extract accordingly
            if _WIKI_MAIN_RE.match(url):
                self.content_lines, self.links = self._extract_portal(page_data, url)
            else:
                self.content_lines, self.links = self._extract_article(page_data, url)

            self.scroll_y = 0
            self.active_link_idx = -1

            # Detect search language from URL
            m = _WIKI_ARTICLE_RE.match(url) or _WIKI_LANG_RE.match(url)
            if m:
                self.search_lang = m.group(1)

            logger.info(
                f"Wiki loaded: {self.current_title!r}, "
                f"lines={len(self.content_lines)}, links={len(self.links)}"
            )

            if not self.content_lines:
                self.content_lines = [self._make_text_line("(no content)", COL_LIGHT_GREY)]

        except Exception as e:
            logger.error(f"Wiki navigation error: {e}", exc_info=True)
            self.current_title = "Error"
            self.content_lines = self._text_to_lines(
                f"Error loading page:\n{str(e)[:120]}\n\nURL: {url}",
                COL_RED,
            )
            self.links = []

        self._send_vic_colors(COL_BLACK, COL_BLACK)

    def _fetch_page(self, url: str) -> dict:
        """Fetch page via shared Playwright worker, but use a Wikipedia-optimised
        extraction script for article pages that targets the main content area
        by semantic HTML (main, article, role=main) — no hardcoded IDs."""
        from web_browser import _pw_worker

        if _WIKI_MAIN_RE.match(url):
            # Portal page — generic extraction is fine
            return _pw_worker.fetch_page(url)

        # For article/search pages, use custom extraction that skips nav chrome
        return self._fetch_wiki_article(url)

    def _fetch_wiki_article(self, url: str) -> dict:
        """Fetch a Wikipedia article with targeted content extraction.

        Finds the main content area using semantic HTML markers (main tag,
        role=main, article tag) and only extracts from there — skipping
        all navigation, sidebars, and footer chrome.
        """
        from web_browser import _pw_worker

        class _WikiFetchJob:
            """Piggyback on the Playwright worker's thread by submitting
            a custom job that runs our extraction JS instead of the default."""
            pass

        # We need to use the worker thread. The simplest approach: fetch
        # via the worker (which gives us the generic extraction), but then
        # also do a second fetch with custom JS. Instead, let's use the
        # worker's internal queue directly with a custom extraction.
        import queue as _queue

        result_q = _queue.Queue()

        def _custom_fetch(browser_context, url):
            page = browser_context.new_page()
            try:
                page.goto(url, wait_until="domcontentloaded", timeout=15000)
                try:
                    page.wait_for_load_state("networkidle", timeout=5000)
                except Exception:
                    pass

                data = page.evaluate(_WIKI_EXTRACT_JS)
                return data
            finally:
                page.close()

        # Submit custom job to the worker
        # The worker expects (url, result_q) tuples, but we need custom extraction.
        # Use the standard fetch and post-process to skip chrome elements.
        raw = _pw_worker.fetch_page(url)

        # Post-process: strip navigation chrome from the element list
        elements = raw.get("elements", [])
        filtered = self._strip_wiki_chrome(elements)
        raw["elements"] = filtered
        return raw

    @staticmethod
    def _strip_wiki_chrome(elements: list) -> list:
        """Remove Wikipedia navigation chrome from extracted elements.

        Structure-based rules (no hardcoded IDs/classes):
        1. Find content start by looking for the 'From Wikipedia' marker in
           any language, OR fall back to the last BLOCK_END NAV boundary.
        2. After content start, skip nav text, edit links, footer, etc.
        """
        # "From Wikipedia, the free encyclopedia" in various languages
        _WIKI_MARKERS = [
            "from wikipedia",        # English
            "aus wikipedia",         # German
            "de wikipedia",          # French, Spanish, Portuguese, Catalan
            "da wikipedia",          # Italian
            "z wikipedii",           # Polish
            "material from wikipedia", # fallback
        ]

        # Navigation text to always skip
        _NAV_TEXTS = {
            # English
            "jump to content", "main menu", "search", "appearance",
            "donate", "create account", "log in", "toggle the table of contents",
            "languages", "article", "talk", "read", "edit", "view history",
            "tools", "general", "what links here", "related changes",
            "upload file", "permanent link", "page information",
            "cite this page", "get shortened url", "download as pdf",
            "printable version", "in other projects", "toggle limited content width",
            "move to sidebar", "hide", "main page", "contents",
            "current events", "random article", "about wikipedia",
            "contact us", "contribute", "help", "learn to edit",
            "community portal", "recent changes",
            # German
            "zum inhalt springen", "hauptmenü", "suche", "erscheinungsbild",
            "jetzt spenden", "benutzerkonto erstellen", "anmelden",
            "inhaltsverzeichnis umschalten", "artikel", "diskussion",
            "lesen", "bearbeiten", "quelltext bearbeiten", "versionsgeschichte",
            "werkzeuge",
            # French
            "aller au contenu", "menu principal", "rechercher",
            "contribuer", "créer un compte", "se connecter",
            "basculer la table des matières", "discussion", "lire",
            "modifier", "modifier le code", "voir l'historique", "outils",
            # Spanish
            "ir al contenido", "menú principal", "buscar",
            "crear una cuenta", "acceder", "herramientas",
        }

        # Phase 1: Find content start
        content_start_idx = None

        # Strategy A: Look for "From Wikipedia" text marker
        for i, elem in enumerate(elements):
            text_lower = (elem.get("text", "") or "").strip().lower()
            for marker in _WIKI_MARKERS:
                if marker in text_lower:
                    content_start_idx = i + 1  # skip the marker itself
                    break
            if content_start_idx is not None:
                break

        # Strategy B: Find last BLOCK_END NAV — article content follows
        if content_start_idx is None:
            last_nav_end = None
            for i, elem in enumerate(elements):
                tag = elem.get("tag", "")
                text = (elem.get("text", "") or "").strip()
                if tag == "BLOCK_END" and text == "NAV":
                    last_nav_end = i
            if last_nav_end is not None:
                content_start_idx = last_nav_end + 1

        # Strategy C: Find first H1
        if content_start_idx is None:
            for i, elem in enumerate(elements):
                tag = elem.get("tag", "")
                text = (elem.get("text", "") or "").strip().lower()
                if tag == "H1" and len(text) > 3 and text not in _NAV_TEXTS:
                    content_start_idx = i
                    break

        if content_start_idx is None:
            return elements

        # Phase 2: Filter elements after content start
        result = []
        for elem in elements[content_start_idx:]:
            tag = elem.get("tag", "")
            text = (elem.get("text", "") or "").strip()
            text_lower = text.lower()

            # Skip navigation text
            if text_lower in _NAV_TEXTS:
                continue

            # Skip tiny text fragments (UI artifacts)
            if tag == "#text" and len(text) <= 2:
                continue

            # Skip "N languages/Sprachen/langues" text
            if re.match(r"^\d+\s+\S+$", text_lower) and any(
                w in text_lower for w in ["language", "sprach", "langue", "idioma", "lingu"]
            ):
                continue

            # Skip edit links
            if tag == "A":
                href = (elem.get("href", "") or "")
                if "action=edit" in href:
                    continue
                if text_lower in ("edit", "[edit]", "bearbeiten",
                                  "modifier", "editar", "modifica"):
                    continue

            # Skip footer/meta content
            if tag == "#text" and any(p in text_lower for p in [
                "this page was last edited",
                "diese seite wurde zuletzt",
                "la dernière modification",
                "text is available under",
                "creative commons",
                "privacy policy",
                "terms of use",
                "cookie statement",
                "wikipedia® is a registered trademark",
                "powered by mediawiki",
                "datenschutz", "impressum",
            ]):
                continue

            result.append(elem)

        return result

    # =================================================================
    #  WIKIPEDIA PORTAL EXTRACTION (wikipedia.org main page)
    # =================================================================

    def _extract_portal(self, page_data: dict, url: str) -> Tuple[List[ContentLine], List[LinkInfo]]:
        """Extract language links from the Wikipedia portal page.

        Uses structure-based detection:
        - Links whose href matches *.wikipedia.org/ are language edition links
        - The link text contains the language name + article count
        """
        elements = page_data.get("elements", [])
        lines: List[ContentLine] = []
        links: List[LinkInfo] = []

        # Title
        lines.append(self._make_text_line("WIKIPEDIA", COL_WHITE, reverse=True, center=True))
        lines.append(self._make_text_line("The Free Encyclopedia", COL_LIGHT_GREY, center=True))
        lines.append(self._make_empty_line())

        # Collect language links from elements — identify by href pattern
        lang_links = []
        for elem in elements:
            tag = elem.get("tag", "")
            href = elem.get("href", "") or ""
            text = (elem.get("text", "") or "").strip()
            if tag == "A" and text and _WIKI_LANG_RE.match(href):
                # Split text: first line is language name, rest is article count
                parts = text.split("\n")
                lang_name = parts[0].strip()
                article_count = parts[1].strip() if len(parts) > 1 else ""
                if lang_name:
                    lang_links.append((lang_name, article_count, href))

        # Render language links
        if lang_links:
            lines.append(self._make_text_line("Languages:", COL_YELLOW))
            lines.append(self._make_empty_line())

            for lang_name, article_count, href in lang_links:
                # Format: [LangName]  article_count
                display = lang_name[:20]
                col = 0
                line = ContentLine(
                    chars=[SC_SPACE] * SCREEN_COLS,
                    colors=[COL_TEXT_FG] * SCREEN_COLS,
                )

                # Write " " indent
                col = 1
                link_col_start = col
                link_row_start = len(lines)

                # Opening bracket
                line.chars[col] = SC_LBRACKET
                line.colors[col] = COL_LINK_FG
                col += 1

                # Link text
                for ch in display:
                    if col >= SCREEN_COLS - 1:
                        break
                    line.chars[col] = _char_to_screencode(ch)
                    line.colors[col] = COL_LINK_FG
                    col += 1

                # Closing bracket
                line.chars[col] = SC_RBRACKET
                line.colors[col] = COL_LINK_FG
                col += 1

                link_col_end = col
                link_row_end = len(lines)

                links.append(LinkInfo(
                    url=href, text=display,
                    row_start=link_row_start, row_end=link_row_end,
                    col_start=link_col_start, col_end=link_col_end,
                ))

                # Article count after the link
                if article_count and col < SCREEN_COLS - 2:
                    col += 1  # space
                    count_text = article_count[:SCREEN_COLS - col]
                    for ch in count_text:
                        if col >= SCREEN_COLS:
                            break
                        line.chars[col] = _char_to_screencode(ch)
                        line.colors[col] = COL_DARK_GREY
                        col += 1

                lines.append(line)

        lines.append(self._make_empty_line())
        lines.append(self._make_hline())
        lines.append(self._make_empty_line())
        lines.append(self._make_text_line("F7 = Search  F8 = Help", COL_HELP_FG, center=True))

        return lines, links

    # =================================================================
    #  WIKIPEDIA ARTICLE EXTRACTION
    # =================================================================

    def _extract_article(self, page_data: dict, url: str) -> Tuple[List[ContentLine], List[LinkInfo]]:
        """Extract essential content from a Wikipedia article page.

        Structure-based rules:
        - Headings (H1-H6) → section titles
        - Paragraphs with text → body text
        - Links (A tags with /wiki/ hrefs) → navigable links
        - Skip: images, navigation chrome, footers, references, edit links,
                infoboxes (tables at top), navboxes, external links sections
        """
        elements = page_data.get("elements", [])
        lines: List[ContentLine] = []
        links: List[LinkInfo] = []

        col = 0
        current_line = ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[COL_TEXT_FG] * SCREEN_COLS,
        )
        last_was_blank = True
        in_block = 0
        skip_section = False
        # Track sections to skip (references, external links, see also, etc.)
        _SKIP_SECTIONS = {
            "references", "external links", "see also", "notes",
            "further reading", "bibliography", "citations",
            "navigation menu", "tools", "print/export",
            # Common non-English equivalents
            "einzelnachweise", "weblinks", "siehe auch",  # German
            "referencias", "enlaces externos", "vease tambien",  # Spanish
            "references", "liens externes", "voir aussi",  # French
        }

        def flush_line():
            nonlocal current_line, col, last_was_blank
            lines.append(current_line)
            last_was_blank = all(c == SC_SPACE for c in current_line.chars)
            current_line = ContentLine(
                chars=[SC_SPACE] * SCREEN_COLS,
                colors=[COL_TEXT_FG] * SCREEN_COLS,
            )
            col = 0

        def blank_line():
            nonlocal last_was_blank
            if not last_was_blank:
                flush_line()

        def write_text(text: str, fg: int, reverse: bool = False):
            nonlocal col
            # If the raw text starts with whitespace and we're mid-line, emit a
            # separating space (preserves the natural gap between inline elements
            # such as text nodes surrounding a link).
            if text and text[0].isspace() and col > 0:
                if col < SCREEN_COLS:
                    current_line.chars[col] = SC_SPACE
                    current_line.colors[col] = fg
                    col += 1
                else:
                    flush_line()
            # Normalise all whitespace (tabs, multi-spaces, embedded newlines)
            # to single spaces so word-boundary detection works correctly.
            text = " ".join(text.split())
            if not text:
                return
            words = text.split(" ")
            for wi, word in enumerate(words):
                if wi > 0 and col > 0:
                    if col < SCREEN_COLS:
                        current_line.chars[col] = SC_SPACE
                        current_line.colors[col] = fg
                        col += 1
                    else:
                        flush_line()
                if not word:
                    continue
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
            nonlocal col
            if not text:
                return
            # +1 for leading space when mid-line, +2 for brackets
            leading_space = col > 0
            total_len = len(text) + 2 + (1 if leading_space else 0)
            if col > 0 and col + total_len > SCREEN_COLS:
                flush_line()
                leading_space = False
            if leading_space and col < SCREEN_COLS:
                current_line.chars[col] = SC_SPACE
                current_line.colors[col] = fg
                col += 1
            link_col_start = col
            link_row_start = len(lines)

            if col < SCREEN_COLS:
                current_line.chars[col] = SC_LBRACKET
                current_line.colors[col] = fg
                col += 1
            for ch in text:
                if col >= SCREEN_COLS:
                    flush_line()
                current_line.chars[col] = _char_to_screencode(ch)
                current_line.colors[col] = fg
                col += 1
            if col >= SCREEN_COLS:
                flush_line()
            current_line.chars[col] = SC_RBRACKET
            current_line.colors[col] = fg
            col += 1

            links.append(LinkInfo(
                url=href or "", text=text,
                row_start=link_row_start, row_end=len(lines),
                col_start=link_col_start, col_end=col,
            ))

        for elem in elements:
            tag = elem.get("tag", "")
            text = (elem.get("text", "") or "").strip()
            href = elem.get("href", "") or ""
            list_index = elem.get("list_index", -1)

            # Check if we should skip this section
            if tag in ("H1", "H2", "H3", "H4", "H5", "H6"):
                section_name = text.lower().strip()
                # Strip [edit] suffix
                section_name = re.sub(r"\[edit\]$", "", section_name).strip()
                skip_section = section_name in _SKIP_SECTIONS
                if skip_section:
                    continue
                blank_line()
                write_text(text, COL_HEADING_FG, reverse=True)
                flush_line()
                continue

            if skip_section:
                continue

            if tag == "BLOCK_START":
                blank_line()
                in_block += 1

            elif tag == "BLOCK_END":
                if col > 0:
                    flush_line()
                in_block -= 1
                if in_block < 0:
                    in_block = 0

            elif tag == "BR":
                flush_line()

            elif tag == "HR":
                if col > 0:
                    flush_line()
                lines.append(self._make_hline())
                last_was_blank = False

            elif tag == "A":
                if not text or not href:
                    if text:
                        write_text(text, COL_TEXT_FG)
                    continue

                # Filter links: only keep internal wiki links
                parsed = urlparse(href)
                path = parsed.path
                is_wiki_link = "/wiki/" in path and ":" not in path.split("/wiki/", 1)[-1]
                is_wiki_lang_link = bool(_WIKI_LANG_RE.match(href))

                if is_wiki_link or is_wiki_lang_link:
                    # Skip tiny links (usually [edit], [citation needed], etc.)
                    if len(text) <= 2 and text not in ("", ):
                        continue
                    # Skip reference numbers like [1], [2]
                    if re.match(r"^\[\d+\]$", text):
                        continue
                    write_link(text[:36], href, COL_LINK_FG)
                else:
                    # External link — just show as text
                    write_text(text, COL_TEXT_FG)

            elif tag == "IMG":
                # Skip images entirely for Wikipedia
                continue

            elif tag == "LI":
                if col > 0:
                    flush_line()
                prefix = f"{list_index}. " if list_index > 0 else "* "
                write_text(prefix + text, COL_TEXT_FG)

            elif tag in ("PRE", "CODE"):
                if col > 0:
                    flush_line()
                for pre_line in text.split("\n"):
                    for ch in pre_line:
                        if col >= SCREEN_COLS:
                            flush_line()
                        current_line.chars[col] = _char_to_screencode(ch)
                        current_line.colors[col] = COL_CYAN
                        col += 1
                    flush_line()

            elif tag == "#text":
                if list_index >= 0:
                    if col > 0:
                        flush_line()
                    prefix = f"{list_index}. " if list_index > 0 else "* "
                    write_text(prefix, COL_TEXT_FG)
                write_text(text, COL_TEXT_FG)

        if col > 0:
            flush_line()

        if not lines:
            lines.append(self._make_text_line("(no content found)", COL_LIGHT_GREY))

        return lines, links

    # =================================================================
    #  WELCOME SCREEN
    # =================================================================

    def _show_welcome(self):
        self.content_lines = []
        self.links = []
        self.content_lines.append(self._make_text_line("WIKIPEDIA BROWSER", COL_WHITE, reverse=True, center=True))
        self.content_lines.append(self._make_empty_line())
        self.content_lines.append(self._make_text_line("F1  Go to wikipedia.org", COL_HELP_FG))
        self.content_lines.append(self._make_text_line("F7  Search Wikipedia", COL_HELP_FG))
        self.content_lines.append(self._make_text_line("F8  Help", COL_HELP_FG))
        self.content_lines.append(self._make_empty_line())
        self.content_lines.append(self._make_text_line("Press F1 or F7 to start.", COL_LIGHT_GREY))

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        fill_color = COL_TEXT_FG
        if self.mode == MODE_SEARCH:
            fill_color = COL_SEARCH_INPUT_FG
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = fill_color

        if self.mode == MODE_BROWSE:
            self._render_header()
            self._render_content()
            self._render_status_bar()
        elif self.mode == MODE_SEARCH:
            self._render_search()
        elif self.mode == MODE_HELP:
            self._render_help()

    def _render_header(self):
        """Row 0: title bar."""
        title = f"W: {self.current_title}" if self.current_title else "WIKIPEDIA"
        title = title[:SCREEN_COLS]
        for i, ch in enumerate(title):
            sc = ascii_to_screencode(ord(ch)) | SC_REVERSE_BIT
            self.screen[i] = sc
            self.color[i] = COL_WHITE
        for i in range(len(title), SCREEN_COLS):
            self.screen[i] = SC_SPACE | SC_REVERSE_BIT
            self.color[i] = COL_WHITE

    def _render_content(self):
        active_link = self.active_link_idx
        for vi in range(CONTENT_ROWS):
            screen_row = CONTENT_TOP + vi
            line_idx = self.scroll_y + vi
            if line_idx >= len(self.content_lines):
                break
            cl = self.content_lines[line_idx]
            row_base = screen_row * SCREEN_COLS
            for c in range(SCREEN_COLS):
                sc = cl.chars[c]
                color = cl.colors[c]
                if 0 <= active_link < len(self.links):
                    lnk = self.links[active_link]
                    if lnk.row_start <= line_idx <= lnk.row_end:
                        if lnk.row_start == lnk.row_end:
                            hl_start, hl_end = lnk.col_start, lnk.col_end
                        elif line_idx == lnk.row_start:
                            hl_start, hl_end = lnk.col_start, SCREEN_COLS
                        elif line_idx == lnk.row_end:
                            hl_start, hl_end = 0, lnk.col_end
                        else:
                            hl_start, hl_end = 0, SCREEN_COLS
                        if hl_start <= c < hl_end:
                            color = COL_LINK_ACTIVE_FG
                self.screen[row_base + c] = sc
                self.color[row_base + c] = color

    def _render_status_bar(self):
        row_base = STATUS_ROW * SCREEN_COLS
        # Build status
        total = len(self.content_lines)
        if total > 0:
            pct = min(100, (self.scroll_y + CONTENT_ROWS) * 100 // total)
        else:
            pct = 100
        link_count = len(self.links)
        status = f"F7=Search F1=Home {pct}%"
        if link_count > 0:
            status += f" {link_count}L"
        status = status[:SCREEN_COLS]
        for i, ch in enumerate(status):
            sc = ascii_to_screencode(ord(ch)) | SC_REVERSE_BIT
            self.screen[row_base + i] = sc
            self.color[row_base + i] = COL_STATUS_FG
        for i in range(len(status), SCREEN_COLS):
            self.screen[row_base + i] = SC_SPACE | SC_REVERSE_BIT
            self.color[row_base + i] = COL_STATUS_FG

    def _render_search(self):
        # Header
        header = "WIKIPEDIA SEARCH"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        # Language selector
        self._put_text(2, 0, f"Language: {self.search_lang}", COL_SEARCH_LABEL_FG)
        self._put_text(2, 20, "(UP/DOWN to change)", COL_DARK_GREY)

        # Search label
        self._put_text(4, 0, "Search:", COL_SEARCH_LABEL_FG)

        # Search input field (row 5)
        visible_start = 0
        if self.search_cursor > SCREEN_COLS - 1:
            visible_start = self.search_cursor - SCREEN_COLS + 1
        visible = self.search_input[visible_start : visible_start + SCREEN_COLS]

        for i, ch in enumerate(visible):
            sc = ascii_to_screencode(ord(ch)) if 32 <= ord(ch) < 127 else SC_SPACE
            is_cursor = (visible_start + i) == self.search_cursor
            if is_cursor:
                sc |= SC_REVERSE_BIT
            self.screen[5 * SCREEN_COLS + i] = sc
            self.color[5 * SCREEN_COLS + i] = COL_SEARCH_INPUT_FG

        # Cursor at end
        cursor_pos = self.search_cursor - visible_start
        if 0 <= cursor_pos < SCREEN_COLS and cursor_pos >= len(visible):
            pos = 5 * SCREEN_COLS + cursor_pos
            self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
            self.color[pos] = COL_SEARCH_INPUT_FG

        # Help text
        self._put_text(8, 1, "RETURN   Search", COL_HELP_FG)
        self._put_text(9, 1, "STOP     Cancel", COL_HELP_FG)
        self._put_text(10, 1, "UP/DOWN  Change language", COL_HELP_FG)

        # Status bar
        status = "RETURN=Search  STOP=Cancel"
        self._put_text(STATUS_ROW, 0, status, COL_STATUS_FG, reverse=True)
        for c in range(len(status), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    def _render_help(self):
        header = "WIKIPEDIA HELP"
        self._put_text(0, (SCREEN_COLS - len(header)) // 2, header, COL_WHITE, reverse=True)
        for c in range(SCREEN_COLS):
            if self.screen[c] == SC_SPACE:
                self.screen[c] = SC_SPACE | SC_REVERSE_BIT
                self.color[c] = COL_WHITE

        for vi in range(CONTENT_ROWS):
            li = getattr(self, "help_scroll", 0) + vi
            if li >= len(HELP_LINES):
                break
            row = CONTENT_TOP + vi
            text = HELP_LINES[li]
            if text.startswith("==="):
                self._put_text(row, 0, text[:SCREEN_COLS], COL_YELLOW, reverse=True)
                for c in range(len(text), SCREEN_COLS):
                    pos = row * SCREEN_COLS + c
                    self.screen[pos] = SC_SPACE | SC_REVERSE_BIT
                    self.color[pos] = COL_YELLOW
            elif text and not text.startswith(" "):
                self._put_text(row, 0, text[:SCREEN_COLS], COL_CYAN)
            else:
                self._put_text(row, 0, text[:SCREEN_COLS], COL_HELP_FG)

        status = "UP/DN=Scroll  F8/STOP=Close"
        self._put_text(STATUS_ROW, 0, status[:SCREEN_COLS], COL_STATUS_FG, reverse=True)
        for c in range(len(status), SCREEN_COLS):
            self.screen[STATUS_ROW * SCREEN_COLS + c] = SC_SPACE | SC_REVERSE_BIT
            self.color[STATUS_ROW * SCREEN_COLS + c] = COL_STATUS_FG

    # =================================================================
    #  HELPERS
    # =================================================================

    def _put_text(self, row: int, col: int, text: str, fg: int, reverse: bool = False):
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

    def _make_text_line(self, text: str, fg: int, reverse: bool = False, center: bool = False) -> ContentLine:
        line = ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[fg] * SCREEN_COLS,
        )
        start = 0
        if center:
            start = max(0, (SCREEN_COLS - len(text)) // 2)
        for i, ch in enumerate(text):
            col = start + i
            if col >= SCREEN_COLS:
                break
            sc = _char_to_screencode(ch)
            if reverse:
                sc |= SC_REVERSE_BIT
            line.chars[col] = sc
            line.colors[col] = fg
        return line

    def _make_empty_line(self) -> ContentLine:
        return ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[COL_TEXT_FG] * SCREEN_COLS,
        )

    def _make_hline(self) -> ContentLine:
        return ContentLine(
            chars=[SC_HLINE] * SCREEN_COLS,
            colors=[COL_GREY] * SCREEN_COLS,
        )

    def _text_to_lines(self, text: str, fg: int) -> List[ContentLine]:
        lines: List[ContentLine] = []
        for line_str in word_wrap(text, SCREEN_COLS):
            cl = ContentLine(
                chars=[SC_SPACE] * SCREEN_COLS,
                colors=[fg] * SCREEN_COLS,
            )
            for i, ch in enumerate(line_str[:SCREEN_COLS]):
                cl.chars[i] = _char_to_screencode(ch)
                cl.colors[i] = fg
            lines.append(cl)
        return lines if lines else [ContentLine(
            chars=[SC_SPACE] * SCREEN_COLS,
            colors=[fg] * SCREEN_COLS,
        )]

    @staticmethod
    def _petscii_to_printable(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    def _send_vic_colors(self, border: int, background: int):
        try:
            from network_helper import send_vic_colors
            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.warning(f"Could not send VIC colours: {e}")


# =====================================================================
#  Character conversion utility
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
