"""
SID Browser console (console 10) for HDN Server — GH issue #28.

Browse and search the High Voltage SID Collection (~61k tunes) live over
HTTP, inspect a tune's PSID/RSID header (load/init/play addresses, SID
model, clock, memory footprint) for demo work, save tunes plus a
license/credit note into a workspace folder, keep playlists, and play tunes
on real Ultimate64/C64U hardware.

Server-only: no wedge/ASM changes. Reached via the Launcher (slot 10 has no
C=+CTRL chord).

Playback note (GH #28): the Ultimate's own `sidplay` runner was tried first
and rejected — it takes the C64 over (no keys reach the wedge) and the REST
API has no stop endpoint, so the only way out is a reset, which loses the
console. Playback here instead uses `sdk.sid_c64_player`, which DMAs the tune
plus a tiny player stub into RAM and hooks it onto IGETIN ($032A), the KERNAL
vector the console's own key loop already calls every frame. The console stays
on screen and interactive, and STOP restores the RAM it borrowed.
"""

import logging
import os
import random
import threading
from typing import List, Optional, Tuple

from sdk.server_console import (
    ServerConsole,
    SCREEN_COLS,
    SCREEN_ROWS,
    SCREEN_SIZE,
    char_to_screencode as _char_to_screencode,
    transliterate,
)
from sdk.generate_pet_asc_table import Petscii
from sdk.clipboard import get_clipboard_service
from sdk.network_helper import send_screen_data
from sdk.text_utils import word_wrap as _word_wrap
from sdk import hvsc_index as hvsc
from sdk.hvsc_index import HvscIndex, HvscFetchError, TuneRow
from sdk.sid_header import parse_sid_header, save_sid_to_workspace, SidHeaderError
from sdk.sid_playlists import PlaylistStore, FAVORITES, export_m3u, import_m3u
from sdk import sid_c64_player
from sdk.sid_c64_player import SidPlayerError
from workspace_init import WORKSPACE_DIR

logger = logging.getLogger(__name__)

# ── Colours ─────────────────────────────────────────────────────────
COL_BLACK = 0
COL_WHITE = 1
COL_CYAN = 3
COL_GREEN = 5
COL_BLUE = 6
COL_YELLOW = 7
COL_ORANGE = 8
COL_LIGHT_RED = 10
COL_DARK_GREY = 11
COL_GREY = 12
COL_LIGHT_GREEN = 13
COL_LIGHT_BLUE = 14
COL_LIGHT_GREY = 15

COL_TITLE_FG = COL_WHITE
COL_STATUS_FG = COL_WHITE
COL_TEXT_FG = COL_LIGHT_GREY
COL_SELECTED_FG = COL_WHITE
COL_AUTHOR_FG = COL_CYAN
COL_HEADING_FG = COL_YELLOW
COL_META_FG = COL_GREY
COL_ADDR_FG = COL_LIGHT_GREEN
COL_WARN_FG = COL_ORANGE
COL_FOLDER_FG = COL_GREEN
COL_CURSOR_FG = COL_YELLOW
COL_FAV_FG = COL_LIGHT_RED

# ── Screen codes ────────────────────────────────────────────────────
SC_SPACE = 0x20
SC_REVERSE_BIT = 0x80
SC_HLINE = 0x63

# ── PETSCII keys ────────────────────────────────────────────────────
KEY_RETURN = 0x0D
KEY_HOME = 0x13
KEY_DEL = 0x14
KEY_CTRL_N = 0x0E
KEY_SPACE = 0x20
KEY_RUNSTOP = 0x03
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_CRSR_RT = 0x1D
KEY_CRSR_LT = 0x9D
KEY_F1 = 0x85
KEY_F2 = 0x89
KEY_F3 = 0x86
KEY_F4 = 0x8A
KEY_F5 = 0x87
KEY_F7 = 0x88
KEY_F8 = 0x8C
KEY_CBM_C = 0xBC
KEY_SHIFT_COMA = 0x3C  # <
KEY_SHIFT_PERIOD = 0x3E  # >

MOD_COMMODORE = 0x04

# ── Modes ───────────────────────────────────────────────────────────
MODE_SEARCH = 0
MODE_BROWSE = 1
MODE_LIST = 2
MODE_DETAIL = 3
MODE_PLAYING = 4
MODE_PLAYLISTS = 5
MODE_SAVE_DIALOG = 6
MODE_SETTINGS = 7
MODE_HELP = 8
MODE_TEXT_INPUT = 9

# ── Layout ──────────────────────────────────────────────────────────
TITLE_ROW = 0
CONTENT_TOP = 1
CONTENT_BOTTOM = 23
CONTENT_ROWS = CONTENT_BOTTOM - CONTENT_TOP + 1
STATUS_ROW = 24
LINES_PER_TUNE = 2  # title line + author/length line

SORT_MODES = ["relevance", "length_asc", "length_desc", "subtunes_desc"]
SORT_LABELS = {
    "relevance": "Relevance",
    "length_asc": "Shortest",
    "length_desc": "Longest",
    "subtunes_desc": "Most subtunes",
}

YES_NO = ["no", "yes"]

# ── Settings ────────────────────────────────────────────────────────
SETTINGS_FIELDS = [
    "Mirror",
    "Index max age (days)",
    "Raster time border (yes/no)",
    "Rebuild index",
]
SETTINGS_KEYS = [
    "sid_mirror_url",
    "sid_index_max_age_days",
    "sid_raster_border",
    "__rebuild__",
]
SETTINGS_DEFAULTS = {
    "sid_mirror_url": hvsc.MIRRORS[0],
    "sid_index_max_age_days": "14",
    "sid_raster_border": "no",
    "sid_last_save_dir": "",
}

HELP_TEXT = [
    "       SID BROWSER - HELP",
    "",
    " Browse the High Voltage SID Collection",
    " (~61000 tunes) and play them on your C64.",
    "",
    " GLOBAL",
    "  F1        Search screen",
    "  F3        Playlists",
    "  F4        Folder browser",
    "  F2        Settings",
    "  F8        Help (this screen)",
    "  STOP      Back one screen",
    "",
    " SEARCH",
    "  Type      Enter search words",
    "  RETURN    Run the search",
    "  Searches title, author and STIL",
    "  comments. Composers work even for",
    "  tunes with no STIL entry.",
    "",
    " TUNE LIST",
    "  UP/DOWN   Select tune",
    "  C=+</C=+> Page up / page down",
    "  RETURN    Open tune details",
    "  P         Play right away",
    "  X         Play a random tune (shuffle)",
    "  F5        Cycle sort order",
    "  L         Like (add to Favorites)",
    "  A         Add to a playlist",
    "  C=+C      Copy HVSC path",
    "",
    " TUNE DETAIL",
    "  < / >     Previous / next subtune",
    "  RETURN/P  Play this subtune",
    "  S         Save tune to a folder",
    "  L         Like (add to Favorites)",
    "  A         Add to a playlist",
    "  C=+C      Copy HVSC path",
    "  Shows load/init/play addresses,",
    "  SID model, clock and memory use.",
    "",
    " PLAYING",
    "  N         Play next tune in the list",
    "  X         Play a random tune",
    "  S         Save the playing tune",
    "  STOP      Halt playback and go back",
    "  The tune plays from C64 RAM under",
    "  this console, so the screen stays",
    "  yours. STOP unhooks the player and",
    "  restores the memory it borrowed.",
    "  Settings can bracket the play call",
    "  with border colour, so the coloured",
    "  band shows the tune's raster time.",
    "",
    " FOLDER BROWSER",
    "  UP/DOWN   Select folder or tune",
    "  RETURN    Enter folder / open tune",
    "  STOP      Up one level",
    "",
    " PLAYLISTS",
    "  RETURN    Open playlist",
    "  CTRL+N    New playlist",
    "  DEL       Delete playlist / remove tune",
    "  E         Export playlist to .m3u",
    "  I         Import an .m3u file",
    "",
    " SAVE DIALOG",
    "  UP/DOWN   Select folder",
    "  RETURN    Enter folder",
    "  S         Save here",
    "  Writes <tune>.sid plus a .sid.txt note",
    "  with credits and a licensing reminder.",
]


class SidBrowserConsole(ServerConsole):
    """Console 10 — HVSC SID collection browser."""

    def __init__(self, console_id: int, session_id: int):
        super().__init__(console_id, session_id)

        self._is_active = False

        # Index
        self.index: Optional[HvscIndex] = None
        self._index_building = False

        # Search
        self.search_input = ""
        self.search_cursor = 0

        # Result / folder list
        self.tunes: List[TuneRow] = []
        self.tune_sel = 0
        self.tune_scroll = 0
        # ("search", query) | ("folder", prefix) | ("playlist", name)
        self.list_source: Tuple[str, str] = ("search", "")
        self.sort_mode = "relevance"

        # Folder browsing
        self.browse_prefix = ""
        self.folders: List[Tuple[str, int]] = []
        self.browse_sel = 0
        self.browse_scroll = 0

        # Detail
        self.current: Optional[TuneRow] = None
        self.current_subtune = 1
        self.current_bytes: Optional[bytes] = None
        self.current_header = None
        self.detail_scroll = 0
        self._fetching = False

        # Live RAM player, if a tune is currently hooked into $032A.
        self.installed: Optional[sid_c64_player.InstalledPlayer] = None

        # Playlists
        self.store = PlaylistStore.load()
        self.playlist_names: List[str] = []
        self.playlist_sel = 0
        self.current_playlist = ""

        # Save dialog
        self.save_cwd = os.path.realpath(WORKSPACE_DIR)
        self.save_entries: List[str] = []
        self.save_sel = 0
        self.save_scroll = 0

        # Generic text input (new playlist name / m3u path)
        self.text_input = ""
        self.text_cursor = 0
        self.text_prompt = ""
        self.text_action = ""

        # Settings
        self.settings_sel = 0
        self.settings_editing = False
        self.settings_input = ""
        self.settings_cursor = 0

        self.help_scroll = 0

        self.mode = MODE_SEARCH
        self.prev_mode = MODE_SEARCH
        self.status_msg = ""

        self._open_or_build_index()
        self._full_render()

    # =================================================================
    #  LIFECYCLE
    # =================================================================

    def on_activate(self):
        self._is_active = True
        self._send_vic_colors(COL_BLUE, COL_BLACK)
        with self.lock:
            self._refresh_index_if_stale()
            self._full_render()
            self._push_screen()

    def on_deactivate(self):
        self._is_active = False

    def get_badge(self) -> Optional[str]:
        favs = len(self.store.paths(FAVORITES))
        return str(favs) if favs else None

    # =================================================================
    #  INDEX LIFECYCLE
    # =================================================================

    def _open_or_build_index(self):
        """Open the on-disk index, or kick off a background build if missing.

        A corrupt/partial index (e.g. the process was killed mid-build) is
        treated as missing and triggers a fresh build.
        """
        db_path = hvsc.get_index_db_path()
        if os.path.exists(db_path):
            try:
                self.index = HvscIndex(db_path)
                return
            except Exception as e:
                logger.warning("HVSC index unusable (%s), rebuilding", e)
                self.index = None
        self._start_index_build()

    def _refresh_index_if_stale(self):
        """Refresh in the background if the index is older than the configured
        max age. Search keeps working against the old index meanwhile."""
        if self.index is None or self._index_building:
            return
        cfg = self._read_settings()
        try:
            max_age_days = float(
                cfg.get("sid_index_max_age_days")
                or SETTINGS_DEFAULTS["sid_index_max_age_days"]
            )
        except ValueError:
            max_age_days = 14.0
        if self.index.is_stale(max_age_days * 86400):
            self._start_index_build()

    def _start_index_build(self):
        if self._index_building:
            return
        self._index_building = True
        self.status_msg = "Building index, please wait..."

        def _do_build():
            db_path = hvsc.get_index_db_path()
            mirror = hvsc.get_configured_mirror()
            try:
                hvsc.build_index(db_path, mirror, progress_cb=self._index_progress)
                new_index = HvscIndex(db_path)
            except Exception as e:
                logger.warning("HVSC index build failed: %s", e)
                with self.lock:
                    self._index_building = False
                    self.status_msg = f"Index build failed: {e}"[:SCREEN_COLS]
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return

            with self.lock:
                old = self.index
                self.index = new_index
                self._index_building = False
                stats = new_index.stats()
                self.status_msg = f"Index ready: {stats['row_count']} tunes"
                self._full_render()
                if self._is_active:
                    self._push_screen()
            if old is not None:
                try:
                    old.close()
                except Exception:
                    pass

        threading.Thread(target=_do_build, daemon=True).start()

    def _index_progress(self, msg: str):
        with self.lock:
            self.status_msg = msg[:SCREEN_COLS]
            self._full_render()
            if self._is_active:
                self._push_screen()

    # =================================================================
    #  INPUT DISPATCH
    # =================================================================

    def handle_keypress(self, petscii_code: int, modifiers: int) -> Optional[bytes]:
        with self.lock:
            self.status_msg = ""
            handlers = {
                MODE_SEARCH: self._key_search,
                MODE_BROWSE: self._key_browse,
                MODE_LIST: self._key_list,
                MODE_DETAIL: self._key_detail,
                MODE_PLAYING: self._key_playing,
                MODE_PLAYLISTS: self._key_playlists,
                MODE_SAVE_DIALOG: self._key_save_dialog,
                MODE_SETTINGS: self._key_settings,
                MODE_HELP: self._key_help,
                MODE_TEXT_INPUT: self._key_text_input,
            }
            handlers.get(self.mode, self._key_search)(petscii_code, modifiers)
            self._full_render()
        return None

    def handle_text_input(self, data: bytes) -> Optional[bytes]:
        return None

    def copy_native(self) -> bool:
        """C=+CTRL+C: copy the selected tune's HVSC path."""
        tune = self._selected_tune()
        if tune:
            get_clipboard_service().set_text(self.session_id, tune.path, source="sid")
            self.status_msg = "Path copied!"
            return True
        return False

    # =================================================================
    #  KEY HANDLERS
    # =================================================================

    def _key_search(self, key: int, mod: int):
        if key == KEY_RETURN:
            self._run_search()
        elif key == KEY_CRSR_LT:
            self.search_cursor = max(0, self.search_cursor - 1)
        elif key == KEY_CRSR_RT:
            self.search_cursor = min(len(self.search_input), self.search_cursor + 1)
        elif key == KEY_HOME:
            self.search_cursor = 0
        elif key == KEY_DEL:
            if self.search_cursor > 0:
                self.search_input = (
                    self.search_input[: self.search_cursor - 1]
                    + self.search_input[self.search_cursor :]
                )
                self.search_cursor -= 1
        elif key == KEY_F3:
            self._enter_playlists()
        elif key == KEY_F4:
            self._enter_browse("")
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = self._printable(key)
            if ch and len(self.search_input) < 60:
                self.search_input = (
                    self.search_input[: self.search_cursor]
                    + ch
                    + self.search_input[self.search_cursor :]
                )
                self.search_cursor += 1

    def _key_list(self, key: int, mod: int):
        n = len(self.tunes)

        if key == KEY_CRSR_UP and n:
            self.tune_sel = max(0, self.tune_sel - 1)
            self._ensure_tune_visible()
        elif key == KEY_CRSR_DN and n:
            self.tune_sel = min(n - 1, self.tune_sel + 1)
            self._ensure_tune_visible()
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.tune_sel = max(0, self.tune_sel - CONTENT_ROWS // LINES_PER_TUNE)
            self._ensure_tune_visible()
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.tune_sel = min(
                max(0, n - 1), self.tune_sel + CONTENT_ROWS // LINES_PER_TUNE
            )
            self._ensure_tune_visible()
        elif key == KEY_RETURN and n:
            self._open_detail(self.tunes[self.tune_sel])
        elif key == KEY_CBM_C:
            self.copy_native()
        elif key == KEY_F5:
            self._cycle_sort()
        elif key == KEY_F1:
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F3:
            self._enter_playlists()
        elif key == KEY_F4:
            self._enter_browse(self.browse_prefix)
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        elif key == KEY_RUNSTOP:
            self._list_back()
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "p" and n:
                self._play_tune(self.tunes[self.tune_sel], 1)
            elif ch == "x" and n:
                self._shuffle_play()
            elif ch == "l" and n:
                self._toggle_like(self.tunes[self.tune_sel])
            elif ch == "a" and n:
                self._prompt_add_to_playlist(self.tunes[self.tune_sel])

    def _key_browse(self, key: int, mod: int):
        total = len(self.folders) + len(self.tunes)

        if key == KEY_CRSR_UP:
            self.browse_sel = max(0, self.browse_sel - 1)
            self._ensure_browse_visible()
        elif key == KEY_CRSR_DN:
            self.browse_sel = min(max(0, total - 1), self.browse_sel + 1)
            self._ensure_browse_visible()
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.browse_sel = max(0, self.browse_sel - CONTENT_ROWS)
            self._ensure_browse_visible()
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.browse_sel = min(max(0, total - 1), self.browse_sel + CONTENT_ROWS)
            self._ensure_browse_visible()
        elif key == KEY_RETURN:
            if self.browse_sel < len(self.folders):
                name = self.folders[self.browse_sel][0]
                prefix = f"{self.browse_prefix}/{name}".strip("/")
                self._enter_browse(prefix)
            else:
                tune = self.tunes[self.browse_sel - len(self.folders)]
                self.list_source = ("folder", self.browse_prefix)
                self.tune_sel = self.browse_sel - len(self.folders)
                self._open_detail(tune)
        elif key == KEY_RUNSTOP:
            if self.browse_prefix:
                parent = "/".join(self.browse_prefix.split("/")[:-1])
                self._enter_browse(parent)
            else:
                self._switch_mode(MODE_SEARCH)
        elif key == KEY_F1:
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F3:
            self._enter_playlists()
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "x" and self.tunes:
                self.list_source = ("folder", self.browse_prefix)
                self._shuffle_play()

    def _key_detail(self, key: int, mod: int):
        tune = self.current
        if tune is None:
            self.mode = MODE_LIST
            return

        if key == KEY_CRSR_UP:
            self.detail_scroll = max(0, self.detail_scroll - 1)
        elif key == KEY_CRSR_DN:
            self.detail_scroll += 1
        elif key in (KEY_SHIFT_COMA, KEY_CRSR_LT):
            self.current_subtune = max(1, self.current_subtune - 1)
        elif key in (KEY_SHIFT_PERIOD, KEY_CRSR_RT):
            self.current_subtune = min(tune.subtune_count, self.current_subtune + 1)
        elif key == KEY_RETURN:
            self._play_tune(tune, self.current_subtune)
        elif key == KEY_CBM_C:
            self.copy_native()
        elif key == KEY_RUNSTOP:
            self.mode = MODE_LIST if self.list_source[0] != "folder" else MODE_BROWSE
        elif key == KEY_F1:
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F3:
            self._enter_playlists()
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "p":
                self._play_tune(tune, self.current_subtune)
            elif ch == "s":
                self._enter_save_dialog()
            elif ch == "l":
                self._toggle_like(tune)
            elif ch == "a":
                self._prompt_add_to_playlist(tune)

    def _key_playing(self, key: int, mod: int):
        if key == KEY_RUNSTOP:
            self._stop_playback()
            self.mode = MODE_DETAIL
        elif key == KEY_RETURN:
            self.mode = MODE_DETAIL
        elif key == KEY_F1:
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "n":
                self._play_next()
            elif ch == "x":
                self._shuffle_play()
            elif ch == "s" and self.current:
                self._enter_save_dialog()

    def _key_playlists(self, key: int, mod: int):
        # Two levels: playlist names, then that playlist's tunes (MODE_LIST).
        n = len(self.playlist_names)

        if key == KEY_CRSR_UP:
            self.playlist_sel = max(0, self.playlist_sel - 1)
        elif key == KEY_CRSR_DN:
            self.playlist_sel = min(max(0, n - 1), self.playlist_sel + 1)
        elif key == KEY_RETURN and n:
            self._open_playlist(self.playlist_names[self.playlist_sel])
        elif key == KEY_CTRL_N:
            self._prompt_text("New playlist name:", "new_playlist")
        elif key == KEY_DEL and n:
            name = self.playlist_names[self.playlist_sel]
            self.store.delete(name)
            self._refresh_playlists()
            self.status_msg = f"Deleted playlist '{name}'"
        elif key == KEY_RUNSTOP or key == KEY_F1:
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F2:
            self._switch_mode(MODE_SETTINGS)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "e" and n:
                self._export_playlist(self.playlist_names[self.playlist_sel])
            elif ch == "i":
                self._prompt_text("Import .m3u (workspace path):", "import_m3u")

    def _key_save_dialog(self, key: int, mod: int):
        n = len(self.save_entries)

        if key == KEY_CRSR_UP:
            self.save_sel = max(0, self.save_sel - 1)
            self._ensure_save_visible()
        elif key == KEY_CRSR_DN:
            self.save_sel = min(max(0, n - 1), self.save_sel + 1)
            self._ensure_save_visible()
        elif key == KEY_RETURN and n:
            entry = self.save_entries[self.save_sel]
            target = os.path.realpath(os.path.join(self.save_cwd, entry))
            ws_real = os.path.realpath(WORKSPACE_DIR)
            # Keep the dialog inside the workspace, same boundary the file
            # editor's browser enforces.
            if target.startswith(ws_real) and os.path.isdir(target):
                self.save_cwd = target
                self.save_sel = 0
                self.save_scroll = 0
                self._refresh_save_entries()
        elif key == KEY_RUNSTOP:
            self.mode = MODE_DETAIL
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)
        else:
            ch = (self._printable(key) or "").lower()
            if ch == "s":
                self._do_save()

    def _key_text_input(self, key: int, mod: int):
        if key == KEY_RETURN:
            value = self.text_input.strip()
            action = self.text_action
            self.mode = self.prev_mode
            self.text_input = ""
            self.text_cursor = 0
            if value:
                self._apply_text_action(action, value)
        elif key == KEY_RUNSTOP:
            self.mode = self.prev_mode
            self.text_input = ""
            self.text_cursor = 0
        elif key == KEY_CRSR_LT:
            self.text_cursor = max(0, self.text_cursor - 1)
        elif key == KEY_CRSR_RT:
            self.text_cursor = min(len(self.text_input), self.text_cursor + 1)
        elif key == KEY_HOME:
            self.text_cursor = 0
        elif key == KEY_DEL:
            if self.text_cursor > 0:
                self.text_input = (
                    self.text_input[: self.text_cursor - 1]
                    + self.text_input[self.text_cursor :]
                )
                self.text_cursor -= 1
        else:
            ch = self._printable(key)
            if ch and len(self.text_input) < 60:
                self.text_input = (
                    self.text_input[: self.text_cursor]
                    + ch
                    + self.text_input[self.text_cursor :]
                )
                self.text_cursor += 1

    def _key_settings(self, key: int, mod: int):
        if self.settings_editing:
            self._key_settings_edit(key, mod)
            return

        n = len(SETTINGS_FIELDS)
        if key == KEY_CRSR_UP:
            self.settings_sel = max(0, self.settings_sel - 1)
        elif key == KEY_CRSR_DN:
            self.settings_sel = min(n - 1, self.settings_sel + 1)
        elif key == KEY_RETURN:
            cfg_key = SETTINGS_KEYS[self.settings_sel]
            if cfg_key == "__rebuild__":
                self._start_index_build()
            else:
                cfg = self._read_settings()
                self.settings_input = cfg.get(
                    cfg_key, SETTINGS_DEFAULTS.get(cfg_key, "")
                )
                self.settings_cursor = len(self.settings_input)
                self.settings_editing = True
        elif key in (KEY_RUNSTOP, KEY_F1):
            self._switch_mode(MODE_SEARCH)
        elif key == KEY_F8:
            self._switch_mode(MODE_HELP)

    def _key_settings_edit(self, key: int, mod: int):
        if key == KEY_RETURN:
            cfg = self._read_settings()
            cfg_key = SETTINGS_KEYS[self.settings_sel]
            value = self.settings_input.strip()
            if cfg_key == "sid_raster_border" and value.lower() not in YES_NO:
                self.status_msg = f"Raster border must be one of: {', '.join(YES_NO)}"
            else:
                cfg[cfg_key] = (
                    value.lower() if cfg_key == "sid_raster_border" else value
                )
                self._write_settings(cfg)
            self.settings_editing = False
        elif key == KEY_RUNSTOP:
            self.settings_editing = False
        elif key == KEY_CRSR_LT:
            self.settings_cursor = max(0, self.settings_cursor - 1)
        elif key == KEY_CRSR_RT:
            self.settings_cursor = min(len(self.settings_input), self.settings_cursor + 1)
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
            ch = self._printable(key)
            if ch and len(self.settings_input) < 60:
                self.settings_input = (
                    self.settings_input[: self.settings_cursor]
                    + ch
                    + self.settings_input[self.settings_cursor :]
                )
                self.settings_cursor += 1

    def _key_help(self, key: int, mod: int):
        max_scroll = max(0, len(HELP_TEXT) - CONTENT_ROWS)
        if key == KEY_CRSR_UP:
            self.help_scroll = max(0, self.help_scroll - 1)
        elif key == KEY_CRSR_DN:
            self.help_scroll = min(max_scroll, self.help_scroll + 1)
        elif key == KEY_SHIFT_COMA and (mod & MOD_COMMODORE):
            self.help_scroll = max(0, self.help_scroll - CONTENT_ROWS)
        elif key == KEY_SHIFT_PERIOD and (mod & MOD_COMMODORE):
            self.help_scroll = min(max_scroll, self.help_scroll + CONTENT_ROWS)
        elif key in (KEY_F8, KEY_RUNSTOP):
            self.mode = self.prev_mode
        elif key == KEY_F1:
            self._switch_mode(MODE_SEARCH)

    # =================================================================
    #  ACTIONS
    # =================================================================

    def _switch_mode(self, new_mode: int):
        self.prev_mode = self.mode
        self.mode = new_mode

    def _selected_tune(self) -> Optional[TuneRow]:
        if self.mode == MODE_DETAIL or self.mode == MODE_PLAYING:
            return self.current
        if self.mode == MODE_BROWSE:
            idx = self.browse_sel - len(self.folders)
            if 0 <= idx < len(self.tunes):
                return self.tunes[idx]
            return None
        if self.tunes and 0 <= self.tune_sel < len(self.tunes):
            return self.tunes[self.tune_sel]
        return None

    def _run_search(self):
        query = self.search_input.strip()
        if not query:
            self.status_msg = "Enter something to search for"
            return
        if self.index is None:
            self.status_msg = "Building index, please wait..."
            return
        self.list_source = ("search", query)
        self._reload_list()
        self.mode = MODE_LIST
        if not self.tunes:
            self.status_msg = f"No tunes matched '{query}'"

    def _reload_list(self):
        """(Re)populate self.tunes from the current list_source + sort."""
        kind, value = self.list_source
        if self.index is None:
            self.tunes = []
            return
        if kind == "search":
            self.tunes = self.index.search(value, limit=200, sort=self.sort_mode)
        elif kind == "folder":
            _, tunes = self.index.list_folder(value)
            self.tunes = self._sort_rows(tunes)
        elif kind == "playlist":
            rows = []
            for path in self.store.paths(value):
                row = self.index.get_by_path(path)
                if row:
                    rows.append(row)
            self.tunes = self._sort_rows(rows)
        self.tune_sel = 0
        self.tune_scroll = 0

    def _sort_rows(self, rows: List[TuneRow]) -> List[TuneRow]:
        """Apply the current sort to an already-fetched row list.

        Search results are ordered by SQL (bm25/length), but folder and
        playlist listings come back in path order, so they sort here.
        """
        if self.sort_mode == "length_asc":
            return sorted(rows, key=lambda t: t.total_length_seconds)
        if self.sort_mode == "length_desc":
            return sorted(rows, key=lambda t: t.total_length_seconds, reverse=True)
        if self.sort_mode == "subtunes_desc":
            return sorted(rows, key=lambda t: t.subtune_count, reverse=True)
        return rows

    def _cycle_sort(self):
        idx = SORT_MODES.index(self.sort_mode)
        self.sort_mode = SORT_MODES[(idx + 1) % len(SORT_MODES)]
        sel_path = self.tunes[self.tune_sel].path if self.tunes else None
        self._reload_list()
        # Keep the highlight on the same tune across a re-sort.
        if sel_path:
            for i, t in enumerate(self.tunes):
                if t.path == sel_path:
                    self.tune_sel = i
                    self._ensure_tune_visible()
                    break
        self.status_msg = f"Sort: {SORT_LABELS[self.sort_mode]}"

    def _list_back(self):
        kind = self.list_source[0]
        if kind == "playlist":
            self._enter_playlists()
        elif kind == "folder":
            self._enter_browse(self.browse_prefix)
        else:
            self._switch_mode(MODE_SEARCH)

    def _enter_browse(self, prefix: str):
        self.browse_prefix = prefix.strip("/")
        self.browse_sel = 0
        self.browse_scroll = 0
        if self.index is None:
            self.folders, self.tunes = [], []
            self.status_msg = "Building index, please wait..."
        else:
            self.folders, tunes = self.index.list_folder(self.browse_prefix)
            self.tunes = tunes
        self.mode = MODE_BROWSE

    def _open_detail(self, tune: TuneRow):
        self.current = tune
        self.current_subtune = 1
        self.current_bytes = None
        self.current_header = None
        self.detail_scroll = 0
        self.mode = MODE_DETAIL
        self._start_header_fetch(tune)

    def _start_header_fetch(self, tune: TuneRow):
        """Fetch the .sid bytes in the background so the detail view can show
        the parsed header (load/init/play, model, clock, memory)."""
        if self._fetching:
            return
        self._fetching = True

        def _do_fetch():
            mirror = hvsc.get_configured_mirror()
            try:
                data = hvsc.fetch_sid_bytes(mirror, tune.path)
                header = parse_sid_header(data)
                err = None
            except (HvscFetchError, SidHeaderError) as e:
                data, header, err = None, None, str(e)
            except Exception as e:
                logger.warning("SID header fetch failed: %s", e)
                data, header, err = None, None, str(e)

            with self.lock:
                self._fetching = False
                # Only apply if the user is still on this tune.
                if self.current is not None and self.current.path == tune.path:
                    self.current_bytes = data
                    self.current_header = header
                    if err:
                        self.status_msg = err[:SCREEN_COLS]
                    self._full_render()
                    if self._is_active:
                        self._push_screen()

        threading.Thread(target=_do_fetch, daemon=True).start()

    # ── Playback ─────────────────────────────────────────────────────

    def _play_tune(self, tune: TuneRow, subtune: int):
        """Play `tune` under the running console, using the in-C64 RAM player.

        The bytes are fetched live from the mirror (HVSC tunes are never on
        the Ultimate's own storage), then DMA'd into C64 RAM along with a
        small stub hooked onto IGETIN ($032A). The console keeps running and
        keeps the screen -- unlike the Ultimate's `sidplay` runner, which
        takes the machine over and can only be escaped with a reset.
        """
        from sdk.network_helper import read_last_c64_ip

        host = read_last_c64_ip()
        if not host:
            self.status_msg = "No C64 IP configured"
            return

        self.current = tune
        self.current_subtune = subtune
        self.mode = MODE_PLAYING
        self.status_msg = "Fetching tune..."

        cached = self.current_bytes if self.current_bytes else None

        def _do_play():
            mirror = hvsc.get_configured_mirror()
            try:
                data = cached or hvsc.fetch_sid_bytes(mirror, tune.path)
            except HvscFetchError as e:
                with self.lock:
                    self.status_msg = str(e)[:SCREEN_COLS]
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return

            try:
                header = parse_sid_header(data)
            except SidHeaderError as e:
                with self.lock:
                    self.status_msg = f"Bad SID file: {e}"[:SCREEN_COLS]
                    self.mode = MODE_DETAIL
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return

            # A previous tune must be unhooked and its RAM restored before the
            # next one overwrites anything, or the backups would capture the
            # *previous* tune's bytes instead of the console's.
            self._stop_playback(quiet=True)

            border = self._read_settings().get(
                "sid_raster_border", SETTINGS_DEFAULTS["sid_raster_border"]
            ) == "yes"

            try:
                installed = sid_c64_player.install(
                    host, data, header, song=subtune, raster_border=border
                )
            except SidPlayerError as e:
                with self.lock:
                    self.status_msg = str(e)[:SCREEN_COLS]
                    self.mode = MODE_DETAIL
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return
            except Exception as e:
                with self.lock:
                    self.status_msg = f"C64 unreachable: {e}"[:SCREEN_COLS]
                    self.mode = MODE_DETAIL
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return

            with self.lock:
                self.installed = installed
                if self.current is not None and self.current.path == tune.path:
                    self.current_bytes = data
                    self.current_header = header
                self.status_msg = "Playing (STOP to halt)"
                self._full_render()
                if self._is_active:
                    self._push_screen()

        threading.Thread(target=_do_play, daemon=True).start()

    def _stop_playback(self, quiet: bool = False):
        """Unhook the RAM player, silence the SID and restore the C64's RAM.

        No reset, no machine pause: the console keeps its screen and state.
        `quiet` is for the internal stop-before-next-tune case, which must not
        clobber the status line the caller is about to set.
        """
        from sdk.network_helper import read_last_c64_ip

        installed = self.installed
        if installed is None:
            return

        host = read_last_c64_ip()
        if not host:
            if not quiet:
                self.status_msg = "No C64 IP configured"
            return

        try:
            sid_c64_player.stop(host, installed)
            self.installed = None
            if not quiet:
                self.status_msg = "Stopped, C64 memory restored"
        except Exception as e:
            # Leave `installed` in place so STOP can be retried; the RAM is
            # still ours to put back.
            if not quiet:
                self.status_msg = f"Stop failed: {e}"[:SCREEN_COLS]

    def _play_next(self):
        """Play the next tune in the current list (album-style)."""
        if not self.tunes or self.current is None:
            self.status_msg = "No list to advance through"
            return
        idx = next(
            (i for i, t in enumerate(self.tunes) if t.path == self.current.path), -1
        )
        if idx < 0 or idx + 1 >= len(self.tunes):
            self.status_msg = "End of list"
            return
        nxt = self.tunes[idx + 1]
        self.tune_sel = idx + 1
        self._ensure_tune_visible()
        self.current_bytes = None
        self.current_header = None
        self._play_tune(nxt, 1)

    def _shuffle_play(self):
        if not self.tunes:
            self.status_msg = "Nothing to shuffle"
            return
        tune = random.choice(self.tunes)
        self.tune_sel = self.tunes.index(tune)
        self._ensure_tune_visible()
        self.current_bytes = None
        self.current_header = None
        self._play_tune(tune, 1)

    # ── Likes / playlists ────────────────────────────────────────────

    def _toggle_like(self, tune: TuneRow):
        now_fav = self.store.toggle_favorite(tune.path)
        self.status_msg = "Added to Favorites" if now_fav else "Removed from Favorites"

    def _prompt_add_to_playlist(self, tune: TuneRow):
        self._prompt_text("Add to playlist (name):", "add_to_playlist")

    def _enter_playlists(self):
        self._refresh_playlists()
        self._switch_mode(MODE_PLAYLISTS)

    def _refresh_playlists(self):
        self.playlist_names = self.store.list_playlists()
        if self.playlist_sel >= len(self.playlist_names):
            self.playlist_sel = max(0, len(self.playlist_names) - 1)

    def _open_playlist(self, name: str):
        if self.index is None:
            self.status_msg = "Building index, please wait..."
            return
        self.current_playlist = name
        self.list_source = ("playlist", name)
        self._reload_list()
        self.mode = MODE_LIST
        if not self.tunes:
            self.status_msg = f"'{name}' is empty"

    def _export_playlist(self, name: str):
        if self.index is None:
            self.status_msg = "Building index, please wait..."
            return
        try:
            text = export_m3u(self.store, name, self.index)
            dest = os.path.join(WORKSPACE_DIR, f"{name}.m3u")
            with open(dest, "w", encoding="utf-8") as f:
                f.write(text)
            rel = os.path.relpath(dest, WORKSPACE_DIR)
            self.status_msg = f"Exported to {rel}"[:SCREEN_COLS]
        except OSError as e:
            self.status_msg = f"Export failed: {e}"[:SCREEN_COLS]

    def _apply_text_action(self, action: str, value: str):
        if action == "new_playlist":
            if self.store.create(value):
                self._refresh_playlists()
                self.status_msg = f"Created playlist '{value}'"
            else:
                self.status_msg = f"'{value}' already exists"
        elif action == "add_to_playlist":
            tune = self._selected_tune()
            if tune is None:
                return
            if self.store.add(value, tune.path):
                self.status_msg = f"Added to '{value}'"
            else:
                self.status_msg = f"Already in '{value}'"
            self._refresh_playlists()
        elif action == "import_m3u":
            self._import_playlist(value)

    def _import_playlist(self, rel_path: str):
        if self.index is None:
            self.status_msg = "Building index, please wait..."
            return
        path = rel_path
        if not os.path.isabs(path):
            path = os.path.join(WORKSPACE_DIR, path)
        try:
            with open(path, "r", encoding="utf-8") as f:
                text = f.read()
        except OSError as e:
            self.status_msg = f"Import failed: {e}"[:SCREEN_COLS]
            return

        paths = import_m3u(text)
        name = os.path.splitext(os.path.basename(path))[0] or "imported"
        found = 0
        for p in paths:
            if self.index.get_by_path(p):
                self.store.add(name, p)
                found += 1
        self._refresh_playlists()
        missing = len(paths) - found
        self.status_msg = (
            f"Imported {found}/{len(paths)} tracks"
            + (f" ({missing} not found)" if missing else "")
        )[:SCREEN_COLS]

    # ── Save dialog ──────────────────────────────────────────────────

    def _enter_save_dialog(self):
        if self.current is None:
            return
        cfg = self._read_settings()
        last = cfg.get("sid_last_save_dir", "") or WORKSPACE_DIR
        if not os.path.isabs(last):
            last = os.path.join(WORKSPACE_DIR, last)
        self.save_cwd = last if os.path.isdir(last) else os.path.realpath(WORKSPACE_DIR)
        self.save_sel = 0
        self.save_scroll = 0
        self._refresh_save_entries()
        self._switch_mode(MODE_SAVE_DIALOG)

    def _refresh_save_entries(self):
        """List only directories — the dialog picks a destination folder."""
        entries = [".."]
        try:
            for e in sorted(os.listdir(self.save_cwd), key=str.lower):
                if e.startswith("."):
                    continue
                if os.path.isdir(os.path.join(self.save_cwd, e)):
                    entries.append(e)
        except OSError as e:
            self.status_msg = f"Cannot list folder: {e}"[:SCREEN_COLS]
        self.save_entries = entries

    def _do_save(self):
        tune = self.current
        if tune is None:
            return
        data = self.current_bytes
        dest = self.save_cwd

        if data is not None:
            self._write_save(data, tune, dest)
            return

        # Not fetched yet (or the fetch failed) — get it now, then write.
        self.status_msg = "Fetching tune..."

        def _do_fetch_and_save():
            mirror = hvsc.get_configured_mirror()
            try:
                fetched = hvsc.fetch_sid_bytes(mirror, tune.path)
            except HvscFetchError as e:
                with self.lock:
                    self.status_msg = str(e)[:SCREEN_COLS]
                    self._full_render()
                    if self._is_active:
                        self._push_screen()
                return
            with self.lock:
                if self.current is not None and self.current.path == tune.path:
                    self.current_bytes = fetched
                self._write_save(fetched, tune, dest)
                self._full_render()
                if self._is_active:
                    self._push_screen()

        threading.Thread(target=_do_fetch_and_save, daemon=True).start()

    def _write_save(self, data: bytes, tune: TuneRow, dest: str):
        try:
            sid_path, _txt_path = save_sid_to_workspace(
                data,
                tune.path,
                dest,
                mirror=hvsc.get_configured_mirror(),
                stil_raw_block=tune.raw_block or None,
            )
        except OSError as e:
            self.status_msg = f"Save failed: {e}"[:SCREEN_COLS]
            return

        cfg = self._read_settings()
        cfg["sid_last_save_dir"] = dest
        self._write_settings(cfg)

        name = os.path.basename(sid_path)
        try:
            where = os.path.relpath(dest, WORKSPACE_DIR)
        except ValueError:
            where = dest
        self.status_msg = f"Saved {name} + .sid.txt to {where}/"[:SCREEN_COLS]
        self.mode = MODE_DETAIL

    # ── Generic text prompt ──────────────────────────────────────────

    def _prompt_text(self, prompt: str, action: str):
        self.text_prompt = prompt
        self.text_action = action
        self.text_input = ""
        self.text_cursor = 0
        self._switch_mode(MODE_TEXT_INPUT)

    # ── Scroll helpers ───────────────────────────────────────────────

    def _ensure_tune_visible(self):
        top = self.tune_sel * LINES_PER_TUNE
        if top < self.tune_scroll:
            self.tune_scroll = top
        bottom = top + LINES_PER_TUNE - 1
        if bottom >= self.tune_scroll + CONTENT_ROWS:
            self.tune_scroll = bottom - CONTENT_ROWS + 1

    def _ensure_browse_visible(self):
        if self.browse_sel < self.browse_scroll:
            self.browse_scroll = self.browse_sel
        elif self.browse_sel >= self.browse_scroll + CONTENT_ROWS:
            self.browse_scroll = self.browse_sel - CONTENT_ROWS + 1

    def _ensure_save_visible(self):
        if self.save_sel < self.save_scroll:
            self.save_scroll = self.save_sel
        elif self.save_sel >= self.save_scroll + CONTENT_ROWS - 4:
            self.save_scroll = self.save_sel - (CONTENT_ROWS - 4) + 1

    # =================================================================
    #  RENDERING
    # =================================================================

    def _full_render(self):
        for i in range(SCREEN_SIZE):
            self.screen[i] = SC_SPACE
            self.color[i] = COL_TEXT_FG

        renderers = {
            MODE_SEARCH: self._render_search,
            MODE_BROWSE: self._render_browse,
            MODE_LIST: self._render_list,
            MODE_DETAIL: self._render_detail,
            MODE_PLAYING: self._render_playing,
            MODE_PLAYLISTS: self._render_playlists,
            MODE_SAVE_DIALOG: self._render_save_dialog,
            MODE_SETTINGS: self._render_settings,
            MODE_HELP: self._render_help,
            MODE_TEXT_INPUT: self._render_text_input,
        }
        renderers.get(self.mode, self._render_search)()

    def _render_title_bar(self, text: str):
        text = text[:SCREEN_COLS].ljust(SCREEN_COLS)
        for col, ch in enumerate(text):
            self.screen[col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[col] = COL_TITLE_FG

    def _render_status_bar(self, text: str):
        if self.status_msg:
            text = self.status_msg
        text = text[:SCREEN_COLS].ljust(SCREEN_COLS)
        off = STATUS_ROW * SCREEN_COLS
        for col, ch in enumerate(text):
            self.screen[off + col] = _char_to_screencode(ch) | SC_REVERSE_BIT
            self.color[off + col] = COL_STATUS_FG

    def _write_text(
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
            if col + i >= SCREEN_COLS:
                break
            sc = _char_to_screencode(ch)
            if reverse:
                sc |= SC_REVERSE_BIT
            self.screen[off + i] = sc
            self.color[off + i] = color

    def _draw_cursor(self, row: int, col: int):
        if 0 <= col < SCREEN_COLS and 0 <= row < SCREEN_ROWS:
            off = row * SCREEN_COLS + col
            self.screen[off] |= SC_REVERSE_BIT
            self.color[off] = COL_CURSOR_FG

    # ── Search ───────────────────────────────────────────────────────

    def _render_search(self):
        self._render_title_bar("SID BROWSER")

        self._write_text(3, 1, "Search the HVSC collection:", COL_HEADING_FG)

        visible_width = SCREEN_COLS - 2
        view_start = max(0, self.search_cursor - visible_width + 1)
        visible = self.search_input[view_start : view_start + visible_width]
        self._write_text(5, 1, visible, COL_WHITE)
        self._draw_cursor(5, 1 + self.search_cursor - view_start)

        self._write_text(7, 1, "Searches title, author and STIL", COL_TEXT_FG)
        self._write_text(8, 1, "comments across the whole catalog.", COL_TEXT_FG)

        if self.index is not None:
            stats = self.index.stats()
            self._write_text(11, 1, f"{stats['row_count']} tunes indexed", COL_META_FG)
        elif self._index_building:
            self._write_text(11, 1, "Building index, please wait...", COL_WARN_FG)

        favs = len(self.store.paths(FAVORITES))
        if favs:
            self._write_text(12, 1, f"{favs} favorites", COL_FAV_FG)

        self._write_text(15, 1, "RETURN  Search", COL_CYAN)
        self._write_text(16, 1, "F4      Browse by folder", COL_CYAN)
        self._write_text(17, 1, "F3      Playlists", COL_CYAN)
        self._write_text(18, 1, "F2      Settings", COL_CYAN)
        self._write_text(19, 1, "F8      Help", COL_CYAN)

        self._render_status_bar("RET:Search F4:Browse F3:Lists F8:Help")

    # ── Tune list ────────────────────────────────────────────────────

    def _render_list(self):
        kind, value = self.list_source
        if kind == "search":
            heading = f"RESULTS: {value}"
        elif kind == "folder":
            heading = f"/{value}" if value else "/"
        else:
            heading = f"PLAYLIST: {value}"
        count = f" {len(self.tunes)}"
        self._render_title_bar((heading[: SCREEN_COLS - len(count)] + count))

        if not self.tunes:
            self._write_text(3, 2, "Nothing here.", COL_TEXT_FG)
            self._render_status_bar("STOP:Back  F1:Search  F8:Help")
            return

        self._render_tune_rows()
        self._render_status_bar(
            f"RET:Open P:Play X:Shuffle F5:{SORT_LABELS[self.sort_mode]}"
        )

    def _render_tune_rows(self):
        screen_row = CONTENT_TOP
        first = self.tune_scroll // LINES_PER_TUNE
        for idx in range(first, len(self.tunes)):
            if screen_row > CONTENT_BOTTOM:
                break
            tune = self.tunes[idx]
            is_sel = idx == self.tune_sel
            fav = self.store.is_favorite(tune.path)

            title = transliterate(tune.title or "(untitled)")
            prefix = "*" if fav else " "
            line1 = f"{prefix}{title}"
            if is_sel:
                self._write_text(
                    screen_row, 0, line1.ljust(SCREEN_COLS)[:SCREEN_COLS],
                    COL_SELECTED_FG, reverse=True,
                )
            else:
                if fav:
                    self._write_text(screen_row, 0, prefix, COL_FAV_FG)
                self._write_text(screen_row, 1, title[: SCREEN_COLS - 1], COL_WHITE)
            screen_row += 1
            if screen_row > CONTENT_BOTTOM:
                break

            author = transliterate(tune.author or "(unknown)")
            meta = _fmt_duration(tune.total_length_seconds)
            if tune.subtune_count > 1:
                meta += f" {tune.subtune_count}st"
            line2 = f" {author}"[: SCREEN_COLS - len(meta) - 2].ljust(
                SCREEN_COLS - len(meta) - 1
            ) + meta
            if is_sel:
                self._write_text(
                    screen_row, 0, line2.ljust(SCREEN_COLS)[:SCREEN_COLS],
                    COL_LIGHT_BLUE, reverse=True,
                )
            else:
                self._write_text(screen_row, 1, author[: SCREEN_COLS - len(meta) - 2],
                                 COL_AUTHOR_FG)
                self._write_text(screen_row, SCREEN_COLS - len(meta), meta, COL_META_FG)
            screen_row += 1

    # ── Folder browse ────────────────────────────────────────────────

    def _render_browse(self):
        heading = f"/{self.browse_prefix}" if self.browse_prefix else "/"
        self._render_title_bar(f"BROWSE {heading}"[:SCREEN_COLS])

        rows = [(name, True, count) for name, count in self.folders]
        rows += [(t.title, False, t.total_length_seconds) for t in self.tunes]

        if not rows:
            self._write_text(3, 2, "Empty folder.", COL_TEXT_FG)
            self._render_status_bar("STOP:Up  F1:Search  F8:Help")
            return

        for i in range(CONTENT_ROWS):
            idx = self.browse_scroll + i
            if idx >= len(rows):
                break
            name, is_dir, extra = rows[idx]
            screen_row = CONTENT_TOP + i
            is_sel = idx == self.browse_sel

            label = transliterate(name)
            if is_dir:
                right = f"{extra}"
                text = f"{label}/"
            else:
                right = _fmt_duration(extra)
                text = label
            text = text[: SCREEN_COLS - len(right) - 2]

            if is_sel:
                line = (" " + text).ljust(SCREEN_COLS - len(right) - 1) + right
                self._write_text(
                    screen_row, 0, line.ljust(SCREEN_COLS)[:SCREEN_COLS],
                    COL_SELECTED_FG, reverse=True,
                )
            else:
                self._write_text(
                    screen_row, 1, text, COL_FOLDER_FG if is_dir else COL_WHITE
                )
                self._write_text(
                    screen_row, SCREEN_COLS - len(right), right, COL_META_FG
                )

        self._render_status_bar("RET:Open STOP:Up X:Shuffle F1:Search")

    # ── Detail ───────────────────────────────────────────────────────

    def _detail_lines(self) -> List[Tuple[str, int]]:
        """Build the (text, colour) lines for the detail view."""
        tune = self.current
        lines: List[Tuple[str, int]] = []
        if tune is None:
            return lines

        for line in _word_wrap(transliterate(tune.title or "(untitled)")):
            lines.append((line, COL_HEADING_FG))
        lines.append((transliterate(tune.author or "(unknown author)"), COL_AUTHOR_FG))
        lines.append(("", COL_TEXT_FG))

        total = _fmt_duration(tune.total_length_seconds)
        sub_len = (
            tune.lengths[self.current_subtune - 1]
            if 0 < self.current_subtune <= len(tune.lengths)
            else 0
        )
        lines.append(
            (
                f"Subtune {self.current_subtune}/{tune.subtune_count}"
                f"  {_fmt_duration(sub_len)}  (all {total})",
                COL_TEXT_FG,
            )
        )
        lines.append(("", COL_TEXT_FG))

        header = self.current_header
        if header is not None:
            lines.append((f"Load  {header.load_address_display()}", COL_ADDR_FG))
            lines.append((f"Init  {header.init_address_display()}", COL_ADDR_FG))
            lines.append((f"Play  {header.play_address_display()}", COL_ADDR_FG))
            fmt = f"{header.magic} v{header.version}"
            if header.sid_model:
                fmt += f"  SID {header.sid_model}"
            if header.clock:
                fmt += f"  {header.clock}"
            lines.append((fmt, COL_TEXT_FG))
            if header.free_pages:
                lines.append((header.free_pages_display(), COL_TEXT_FG))
            if header.is_basic:
                lines.append(("BASIC tune", COL_TEXT_FG))
            if header.is_multi_sid():
                lines.append(
                    ("! Multi-SID: needs 2+ SIDs to sound right", COL_WARN_FG)
                )
            if header.released:
                lines.append((f"Released {transliterate(header.released)}", COL_META_FG))
        elif self._fetching:
            lines.append(("Loading header...", COL_META_FG))
        else:
            lines.append(("Header unavailable", COL_META_FG))

        lines.append(("", COL_TEXT_FG))
        for line in _word_wrap(transliterate(tune.path)):
            lines.append((line, COL_META_FG))

        if tune.comment:
            lines.append(("", COL_TEXT_FG))
            lines.append(("STIL:", COL_HEADING_FG))
            for line in _word_wrap(transliterate(tune.comment)):
                lines.append((line, COL_TEXT_FG))

        return lines

    def _render_detail(self):
        tune = self.current
        if tune is None:
            return
        fav = "*" if self.store.is_favorite(tune.path) else ""
        self._render_title_bar(f"{fav}{transliterate(tune.title or 'TUNE')}")

        lines = self._detail_lines()
        max_scroll = max(0, len(lines) - CONTENT_ROWS)
        self.detail_scroll = min(self.detail_scroll, max_scroll)

        for i in range(CONTENT_ROWS):
            idx = self.detail_scroll + i
            if idx >= len(lines):
                break
            text, color = lines[idx]
            self._write_text(CONTENT_TOP + i, 0, text[:SCREEN_COLS], color)

        self._render_status_bar("RET:Play </>:Subtune S:Save L:Like A:Add")

    # ── Playing ──────────────────────────────────────────────────────

    def _render_playing(self):
        tune = self.current
        self._render_title_bar("NOW PLAYING")
        if tune is None:
            self._render_status_bar("STOP:Back")
            return

        row = 4
        for line in _word_wrap(transliterate(tune.title or "(untitled)")):
            self._write_text(row, 1, line, COL_HEADING_FG)
            row += 1
        self._write_text(row + 1, 1, transliterate(tune.author or "(unknown)"),
                         COL_AUTHOR_FG)

        sub_len = (
            tune.lengths[self.current_subtune - 1]
            if 0 < self.current_subtune <= len(tune.lengths)
            else 0
        )
        duration = _fmt_duration(sub_len) if sub_len else "unknown length"
        self._write_text(
            row + 3, 1,
            f"Subtune {self.current_subtune}/{tune.subtune_count}   {duration}",
            COL_TEXT_FG,
        )

        # No progress bar: nothing reports the playback position, and this
        # console runs no timer thread, so a bar here would be a guess that
        # only moved when you happened to press a key.
        hdr = self.current_header
        if hdr is not None:
            self._write_text(
                row + 5, 1,
                f"init ${hdr.init_address:04X}  play ${hdr.play_address:04X}"
                f"  {hdr.clock or '?'}",
                COL_ADDR_FG,
            )

        if self.installed is not None:
            self._write_text(
                row + 7, 1, "Playing in C64 RAM under this console.", COL_META_FG
            )
            self._write_text(
                row + 8, 1,
                f"Player stub at ${self.installed.stub_addr:04X}, CIA2 TA tempo.",
                COL_META_FG,
            )
            border_on = self._read_settings().get(
                "sid_raster_border", SETTINGS_DEFAULTS["sid_raster_border"]
            ) == "yes"
            if border_on:
                self._write_text(
                    row + 9, 1, "Border band = the tune's raster time.", COL_CYAN
                )
            self._write_text(
                row + 11, 1, "STOP unhooks and restores C64 RAM.", COL_WARN_FG
            )

        self._render_status_bar("STOP:Halt N:Next X:Shuffle RET:Back")

    # ── Playlists ────────────────────────────────────────────────────

    def _render_playlists(self):
        self._render_title_bar(f"PLAYLISTS ({len(self.playlist_names)})")

        if not self.playlist_names:
            self._write_text(3, 2, "No playlists yet.", COL_TEXT_FG)
            self._write_text(5, 2, "CTRL+N  Create one", COL_CYAN)
            self._write_text(6, 2, "I       Import an .m3u", COL_CYAN)
            self._write_text(8, 2, "Press L on a tune to add it to", COL_TEXT_FG)
            self._write_text(9, 2, "Favorites.", COL_TEXT_FG)
            self._render_status_bar("^N:New I:Import STOP:Back")
            return

        for i, name in enumerate(self.playlist_names):
            if i >= CONTENT_ROWS:
                break
            row = CONTENT_TOP + i
            count = len(self.store.paths(name))
            right = f"{count}"
            label = f" {name}"
            if i == self.playlist_sel:
                line = label.ljust(SCREEN_COLS - len(right) - 1) + right
                self._write_text(
                    row, 0, line.ljust(SCREEN_COLS)[:SCREEN_COLS],
                    COL_SELECTED_FG, reverse=True,
                )
            else:
                color = COL_FAV_FG if name == FAVORITES else COL_WHITE
                self._write_text(row, 1, name[: SCREEN_COLS - len(right) - 2], color)
                self._write_text(row, SCREEN_COLS - len(right), right, COL_META_FG)

        self._render_status_bar("RET:Open ^N:New DEL:Del E:Export I:Import")

    # ── Save dialog ──────────────────────────────────────────────────

    def _render_save_dialog(self):
        self._render_title_bar("SAVE SID TO FOLDER")

        tune = self.current
        if tune is not None:
            name = os.path.basename(tune.path)
            self._write_text(CONTENT_TOP, 1, transliterate(name)[:SCREEN_COLS - 2],
                             COL_HEADING_FG)

        try:
            rel = os.path.relpath(self.save_cwd, WORKSPACE_DIR)
        except ValueError:
            rel = self.save_cwd
        self._write_text(CONTENT_TOP + 1, 1, f"into: {rel}/"[:SCREEN_COLS - 2],
                         COL_ADDR_FG)

        list_top = CONTENT_TOP + 3
        visible_rows = CONTENT_BOTTOM - list_top + 1
        for i in range(visible_rows):
            idx = self.save_scroll + i
            if idx >= len(self.save_entries):
                break
            entry = self.save_entries[idx]
            row = list_top + i
            if idx == self.save_sel:
                self._write_text(
                    row, 0, f" {entry}/".ljust(SCREEN_COLS)[:SCREEN_COLS],
                    COL_SELECTED_FG, reverse=True,
                )
            else:
                self._write_text(row, 1, f"{entry}/"[: SCREEN_COLS - 2], COL_FOLDER_FG)

        self._render_status_bar("RET:Enter S:Save here STOP:Cancel")

    # ── Text input ───────────────────────────────────────────────────

    def _render_text_input(self):
        self._render_title_bar("SID BROWSER")
        self._write_text(4, 1, self.text_prompt[:SCREEN_COLS - 2], COL_HEADING_FG)

        visible_width = SCREEN_COLS - 2
        view_start = max(0, self.text_cursor - visible_width + 1)
        visible = self.text_input[view_start : view_start + visible_width]
        self._write_text(6, 1, visible, COL_WHITE)
        self._draw_cursor(6, 1 + self.text_cursor - view_start)

        self._render_status_bar("RETURN:OK  STOP:Cancel")

    # ── Settings ─────────────────────────────────────────────────────

    def _render_settings(self):
        self._render_title_bar("SETTINGS")
        cfg = self._read_settings()

        row = CONTENT_TOP + 1
        for i, label in enumerate(SETTINGS_FIELDS):
            if row > CONTENT_BOTTOM - 1:
                break
            cfg_key = SETTINGS_KEYS[i]
            is_sel = i == self.settings_sel

            if cfg_key == "__rebuild__":
                value = "building..." if self._index_building else "press RETURN"
            else:
                value = cfg.get(cfg_key, SETTINGS_DEFAULTS.get(cfg_key, ""))

            if is_sel and self.settings_editing:
                self._write_text(row, 1, f"{label}:", COL_HEADING_FG)
                row += 1
                self._write_text(row, 2, self.settings_input[: SCREEN_COLS - 3],
                                 COL_WHITE)
                self._draw_cursor(row, 2 + min(self.settings_cursor, SCREEN_COLS - 3))
                row += 2
            else:
                self._write_text(row, 1, f"{label}:", COL_HEADING_FG)
                row += 1
                line = f"  {value}"
                if is_sel:
                    self._write_text(
                        row, 0, line.ljust(SCREEN_COLS)[:SCREEN_COLS],
                        COL_SELECTED_FG, reverse=True,
                    )
                else:
                    self._write_text(row, 0, line[:SCREEN_COLS], COL_TEXT_FG)
                row += 2

        if self.index is not None:
            stats = self.index.stats()
            self._write_text(
                CONTENT_BOTTOM, 1,
                f"{stats['row_count']} tunes indexed"[:SCREEN_COLS - 2],
                COL_META_FG,
            )

        self._render_status_bar("RET:Edit STOP:Back F8:Help")

    # ── Help ─────────────────────────────────────────────────────────

    def _render_help(self):
        self._render_title_bar("HELP")
        for i in range(CONTENT_ROWS):
            idx = self.help_scroll + i
            if idx >= len(HELP_TEXT):
                break
            self._write_text(CONTENT_TOP + i, 0, HELP_TEXT[idx][:SCREEN_COLS],
                             COL_TEXT_FG)
        self._render_status_bar("UP/DN:Scroll  F8/STOP:Close")

    # =================================================================
    #  SETTINGS PERSISTENCE
    # =================================================================

    @staticmethod
    def _read_settings() -> dict:
        try:
            from sdk.config_manager import read_config

            return read_config()
        except Exception:
            return {}

    @staticmethod
    def _write_settings(data: dict):
        try:
            from sdk.config_manager import write_config

            write_config(data)
        except Exception as e:
            logger.warning("Could not write settings: %s", e)

    # =================================================================
    #  UTILITIES
    # =================================================================

    @staticmethod
    def _printable(petscii: int) -> Optional[str]:
        ascii_code = Petscii.petscii2ascii(petscii)
        if 32 <= ascii_code < 127:
            return chr(ascii_code)
        return None

    def _push_screen(self):
        try:
            send_screen_data(self.get_screen_data(), self.get_color_data())
        except Exception:
            logger.debug("sid push_screen failed (no C64 connected?)", exc_info=True)

    def _send_vic_colors(self, border: int, background: int):
        try:
            from sdk.network_helper import send_vic_colors

            send_vic_colors(border & 0x0F, background & 0x0F)
        except Exception as e:
            logger.debug("Could not send VIC colours: %s", e)


def _fmt_duration(seconds: int) -> str:
    """Format whole seconds as M:SS (or H:MM:SS past an hour)."""
    if not seconds:
        return "-:--"
    minutes, secs = divmod(int(seconds), 60)
    if minutes >= 60:
        hours, minutes = divmod(minutes, 60)
        return f"{hours}:{minutes:02d}:{secs:02d}"
    return f"{minutes}:{secs:02d}"
