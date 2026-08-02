"""
HVSC (High Voltage SID Collection) data layer for the SID Browser console
(GH issue #28). No UI code here.

Live HTTP browsing, not a local mirror: only STIL.txt + Songlengths.md5 (a
few MB of text) are fetched and cached in a local SQLite index; the actual
`.sid` bytes are fetched live at play/save time (`fetch_sid_bytes`) so the
catalog is never stale from HVSC's periodic full-archive updates.

Catalog scope: the full HVSC catalog. Songlengths.md5 lists every tune (path
+ per-subtune duration) and is the source of truth for "every tune in the
collection"; STIL.txt only has trivia (title/author/comment) for a minority
of tunes, so it is overlaid onto the Songlengths-seeded rows rather than
driving the row set itself.
"""

import logging
import os
import re
import sqlite3
import time
from dataclasses import dataclass
from typing import Callable, Dict, List, Optional, Tuple

logger = logging.getLogger(__name__)

# Verified (2026-08) to serve individual files over plain HTTP GET, not
# ZIP-only releases -- required for the live-fetch design in this module.
MIRRORS = [
    "https://www.hvsc.de/download/C64Music",
    "https://hvsc.sannic.nl/C64Music",
]

_DB_FILENAME = "hvsc_index.sqlite3"

_FETCH_TIMEOUT = 30
_SID_FETCH_TIMEOUT = 20


class HvscFetchError(Exception):
    """Raised when fetching HVSC metadata or a .sid file body fails."""


# =====================================================================
#  Config-backed mirror selection
# =====================================================================


def get_index_db_path() -> str:
    from .workspace import WORKSPACE_DIR

    cache_dir = os.path.join(WORKSPACE_DIR, ".cache")
    return os.path.join(cache_dir, _DB_FILENAME)


def get_configured_mirror() -> str:
    """Return the active mirror URL from config, defaulting to MIRRORS[0]."""
    try:
        from .config_manager import read_config

        mirror = read_config().get("sid_mirror_url", "")
    except Exception:
        mirror = ""
    return mirror or MIRRORS[0]


def set_configured_mirror(mirror: str) -> None:
    try:
        from .config_manager import read_config, write_config

        cfg = read_config()
        cfg["sid_mirror_url"] = mirror
        write_config(cfg)
    except Exception as e:
        logger.warning("Could not persist sid_mirror_url: %s", e)


# =====================================================================
#  Fetching raw metadata / tune bytes
# =====================================================================


def fetch_stil(mirror: str) -> str:
    import requests

    url = f"{mirror.rstrip('/')}/DOCUMENTS/STIL.txt"
    try:
        resp = requests.get(url, timeout=_FETCH_TIMEOUT)
        resp.raise_for_status()
    except Exception as e:
        raise HvscFetchError(f"Could not fetch STIL.txt from {mirror}: {e}") from e
    resp.encoding = resp.encoding or "utf-8"
    try:
        return resp.content.decode("cp1252", errors="replace")
    except Exception:
        return resp.content.decode("utf-8", errors="replace")


def fetch_songlengths(mirror: str) -> str:
    import requests

    url = f"{mirror.rstrip('/')}/DOCUMENTS/Songlengths.md5"
    try:
        resp = requests.get(url, timeout=_FETCH_TIMEOUT)
        resp.raise_for_status()
    except Exception as e:
        raise HvscFetchError(
            f"Could not fetch Songlengths.md5 from {mirror}: {e}"
        ) from e
    try:
        return resp.content.decode("utf-8", errors="replace")
    except Exception:
        return resp.content.decode("cp1252", errors="replace")


def fetch_sid_bytes(mirror: str, hvsc_path: str) -> bytes:
    """Fetch the raw bytes of a single .sid file from the mirror."""
    import requests

    url = f"{mirror.rstrip('/')}/{hvsc_path.lstrip('/')}"
    try:
        resp = requests.get(url, timeout=_SID_FETCH_TIMEOUT)
    except Exception as e:
        raise HvscFetchError(f"Could not reach mirror: {e}") from e
    if resp.status_code == 404:
        raise HvscFetchError("File not found (try refreshing index)")
    if resp.status_code != 200:
        raise HvscFetchError(f"Mirror returned HTTP {resp.status_code}")
    return resp.content


# =====================================================================
#  Parsing
# =====================================================================

_STIL_FIELD_RE = re.compile(r"^(TITLE|ARTIST|AUTHOR|COMMENT):\s?(.*)$")
_STIL_SUBTUNE_RE = re.compile(r"^\(#\d+\)\s*$")


def parse_stil(text: str) -> Dict[str, dict]:
    """Parse STIL.txt into {hvsc_path: {titles, author, comment, raw_block}}.

    Blocks are separated by blank lines; each block starts with a
    '/'-prefixed HVSC-relative path. `(#N)` lines mark per-subtune groups --
    every subtune's fields are collected into the one row so search recall
    isn't limited to whichever subtune happens to match. `titles` is the
    ordered list of TITLE values found (one per subtune group, or a single
    entry for an unsegmented block); the caller decides which to display
    versus which to feed the full-text index. Multi-line COMMENT
    continuations (indented, no field label) are appended to the preceding
    COMMENT segment.
    """
    tunes: Dict[str, dict] = {}

    path: Optional[str] = None
    titles: List[str] = []
    author = ""
    comments: List[str] = []
    raw_lines: List[str] = []
    last_field: Optional[str] = None
    subtune_seen = False

    def flush():
        if path:
            tunes[path] = {
                "titles": [t for t in titles if t],
                "author": author.strip(),
                "comment": "\n".join(comments).strip(),
                "raw_block": "\n".join(raw_lines).rstrip("\n"),
                "per_subtune": subtune_seen,
            }

    for raw_line in text.splitlines():
        line = raw_line.rstrip("\r")
        if not line.strip():
            flush()
            path = None
            titles = []
            author = ""
            comments = []
            raw_lines = []
            last_field = None
            subtune_seen = False
            continue

        if line.startswith("/"):
            if path:
                flush()
            path = line.strip()
            titles = []
            author = ""
            comments = []
            raw_lines = [line]
            last_field = None
            subtune_seen = False
            continue

        if path is None:
            continue  # preamble/comment header before the first block

        raw_lines.append(line)
        stripped = line.lstrip()

        if _STIL_SUBTUNE_RE.match(stripped):
            subtune_seen = True
            last_field = None
            continue

        m = _STIL_FIELD_RE.match(stripped)
        if m:
            label, value = m.group(1), m.group(2)
            if label == "TITLE":
                titles.append(value.strip())
                last_field = None
            elif label in ("ARTIST", "AUTHOR"):
                if not author:
                    author = value
                elif value and value not in author:
                    author = f"{author} / {value}"
                last_field = None
            else:  # COMMENT
                comments.append(value)
                last_field = "COMMENT"
        elif last_field == "COMMENT" and comments:
            # Indented continuation of the previous COMMENT line.
            comments[-1] = f"{comments[-1]} {stripped}"

    flush()
    return tunes


_LENGTH_RE = re.compile(r"^(\d+):(\d+)(?:\.\d+)?$")


def _parse_one_length(token: str) -> int:
    """Parse one 'M:SS' or 'M:SS.mmm' duration token into whole seconds."""
    m = _LENGTH_RE.match(token.strip())
    if not m:
        return 0
    minutes, seconds = int(m.group(1)), int(m.group(2))
    return minutes * 60 + seconds


def parse_songlengths(text: str) -> Dict[str, dict]:
    """Parse Songlengths.md5 into {hvsc_path: {lengths, total_length_seconds}}.

    Lines alternate `; /path` then `md5=len1 len2 ...` (one duration per
    subtune). The MD5 itself is not verified -- only used as a separator.
    """
    tunes: Dict[str, dict] = {}
    pending_path: Optional[str] = None

    for raw_line in text.splitlines():
        line = raw_line.rstrip("\r").strip()
        if not line or line.startswith("["):
            continue
        if line.startswith(";"):
            candidate = line[1:].strip()
            pending_path = candidate if candidate.startswith("/") else None
            continue
        if pending_path is None or "=" not in line:
            continue
        _, _, lengths_part = line.partition("=")
        lengths = [_parse_one_length(tok) for tok in lengths_part.split()]
        if not lengths:
            lengths = [0]
        tunes[pending_path] = {
            "lengths": lengths,
            "total_length_seconds": sum(lengths),
        }
        pending_path = None

    return tunes


# =====================================================================
#  Path-derived author/section
# =====================================================================


def filename_title(hvsc_path: str) -> str:
    """Derive a human-readable title from a bare filename (no STIL entry)."""
    base = os.path.splitext(os.path.basename(hvsc_path.rstrip("/")))[0]
    return base.replace("_", " ").strip() or base


def path_author_and_section(hvsc_path: str) -> Tuple[str, str]:
    """Derive (path_author, section) from an HVSC path.

    `/MUSICIANS/H/Hubbard_Rob/Commando.sid` -> ("Hubbard, Rob", "MUSICIANS").
    GAMES/DEMOS/CGSC sections have no composer-folder convention, so
    path_author is "" there (STIL AUTHOR/ARTIST is the only source).
    """
    segments = [s for s in hvsc_path.split("/") if s]
    if not segments:
        return "", ""
    section = segments[0]
    if section != "MUSICIANS" or len(segments) < 3:
        return "", section

    folder = segments[2].replace("_", " ").strip()
    parts = folder.rsplit(" ", 1)
    if len(parts) == 2 and all(parts):
        return f"{parts[0]}, {parts[1]}", section
    return folder, section


# =====================================================================
#  Index build
# =====================================================================

_SCHEMA = """
CREATE TABLE tunes (
    path TEXT PRIMARY KEY,
    title TEXT,
    search_blob TEXT,
    author TEXT,
    section TEXT,
    comment TEXT,
    raw_block TEXT,
    subtune_count INTEGER,
    lengths TEXT,
    total_length_seconds INTEGER,
    has_stil INTEGER DEFAULT 0
);
CREATE INDEX idx_tunes_section ON tunes(section, path);
CREATE INDEX idx_tunes_length ON tunes(total_length_seconds);
CREATE TABLE index_meta (key TEXT PRIMARY KEY, value TEXT);
"""

ProgressCb = Optional[Callable[[str], None]]


def build_index(db_path: str, mirror: str, progress_cb: ProgressCb = None) -> int:
    """Build (or rebuild) the HVSC index at `db_path`. Returns row count.

    Writes to `db_path + ".tmp"` then atomically `os.replace()`s it into
    place, so concurrent readers of the previous index are never handed a
    half-built database.
    """

    def _progress(msg: str):
        if progress_cb:
            try:
                progress_cb(msg)
            except Exception:
                pass

    _progress("Fetching STIL.txt...")
    stil_text = fetch_stil(mirror)
    _progress("Fetching Songlengths.md5...")
    songlengths_text = fetch_songlengths(mirror)

    _progress("Parsing metadata...")
    stil_map = parse_stil(stil_text)
    songlengths_map = parse_songlengths(songlengths_text)

    os.makedirs(os.path.dirname(db_path), exist_ok=True)
    tmp_path = db_path + ".tmp"
    if os.path.exists(tmp_path):
        os.remove(tmp_path)

    _progress("Building index...")
    conn = sqlite3.connect(tmp_path)
    try:
        conn.executescript(_SCHEMA)

        rows = []
        for path, sl in songlengths_map.items():
            path_author, section = path_author_and_section(path)
            stil_entry = stil_map.get(path)
            has_stil = 1 if stil_entry else 0
            fname_title = filename_title(path)

            if stil_entry:
                stil_titles = stil_entry["titles"]
                # A block with per-subtune (#N) groups holds one TITLE per
                # subtune; concatenating them makes a 400-char string that is
                # useless in a 40-column list, so the filename title is the
                # display name there and every subtune title still goes into
                # the search blob. Unsegmented blocks have a single curated
                # TITLE, which beats the filename for display.
                if stil_entry["per_subtune"] or not stil_titles:
                    title = fname_title
                else:
                    title = stil_titles[0]
                author = path_author or stil_entry["author"]
                comment = stil_entry["comment"]
                raw_block = stil_entry["raw_block"]
                search_blob = " ".join([fname_title] + stil_titles)
            else:
                title = fname_title
                author = path_author
                comment = ""
                raw_block = ""
                search_blob = fname_title

            lengths = sl["lengths"]
            rows.append(
                (
                    path,
                    title,
                    search_blob,
                    author,
                    section,
                    comment,
                    raw_block,
                    len(lengths),
                    ",".join(str(x) for x in lengths),
                    sl["total_length_seconds"],
                    has_stil,
                )
            )

        conn.executemany(
            "INSERT INTO tunes (path, title, search_blob, author, section, comment, "
            "raw_block, subtune_count, lengths, total_length_seconds, has_stil) "
            "VALUES (?,?,?,?,?,?,?,?,?,?,?)",
            rows,
        )

        fts_available = _try_build_fts(conn)

        conn.execute(
            "INSERT INTO index_meta (key, value) VALUES (?, ?)",
            ("built_at", str(time.time())),
        )
        conn.execute(
            "INSERT INTO index_meta (key, value) VALUES (?, ?)",
            ("mirror_used", mirror),
        )
        conn.execute(
            "INSERT INTO index_meta (key, value) VALUES (?, ?)",
            ("row_count", str(len(rows))),
        )
        conn.execute(
            "INSERT INTO index_meta (key, value) VALUES (?, ?)",
            ("fts5_available", "1" if fts_available else "0"),
        )
        conn.commit()
    finally:
        conn.close()

    os.replace(tmp_path, db_path)
    _progress(f"Index built: {len(rows)} tunes.")
    return len(rows)


def _try_build_fts(conn: sqlite3.Connection) -> bool:
    """Create + populate the FTS5 virtual table. Returns False (and logs a
    warning, no user-facing error) if this sqlite3 build lacks FTS5 --
    `search()` then falls back to a LIKE scan, just slower.
    """
    try:
        conn.executescript(
            "CREATE VIRTUAL TABLE tunes_fts USING fts5("
            "path UNINDEXED, search_blob, author, comment, "
            "content='tunes', content_rowid='rowid');"
        )
        conn.execute(
            "INSERT INTO tunes_fts(rowid, path, search_blob, author, comment) "
            "SELECT rowid, path, search_blob, author, comment FROM tunes"
        )
        return True
    except sqlite3.OperationalError as e:
        logger.warning("FTS5 unavailable, falling back to LIKE search: %s", e)
        return False


# =====================================================================
#  Read-only index access
# =====================================================================


@dataclass
class TuneRow:
    path: str
    title: str
    author: str
    section: str
    comment: str
    raw_block: str
    subtune_count: int
    lengths: List[int]
    total_length_seconds: int
    has_stil: bool

    @classmethod
    def from_row(cls, row: sqlite3.Row) -> "TuneRow":
        lengths_str = row["lengths"] or ""
        lengths = [int(x) for x in lengths_str.split(",") if x != ""] or [0]
        return cls(
            path=row["path"],
            title=row["title"] or "",
            author=row["author"] or "",
            section=row["section"] or "",
            comment=row["comment"] or "",
            raw_block=row["raw_block"] or "",
            subtune_count=row["subtune_count"] or len(lengths),
            lengths=lengths,
            total_length_seconds=row["total_length_seconds"] or 0,
            has_stil=bool(row["has_stil"]),
        )


_SORTS = {
    "relevance": None,  # handled specially (bm25 or insertion order)
    "length_asc": "t.total_length_seconds ASC",
    "length_desc": "t.total_length_seconds DESC",
    "subtunes_desc": "t.subtune_count DESC",
}


class HvscIndex:
    """Read-only accessor for a built HVSC SQLite index."""

    def __init__(self, db_path: str):
        self.db_path = db_path
        self._conn = sqlite3.connect(f"file:{db_path}?mode=ro", uri=True, check_same_thread=False)
        self._conn.row_factory = sqlite3.Row
        self._fts_available = self._meta("fts5_available") == "1"

    def close(self):
        self._conn.close()

    # -- meta -------------------------------------------------------------

    def _meta(self, key: str, default: Optional[str] = None) -> Optional[str]:
        cur = self._conn.execute("SELECT value FROM index_meta WHERE key=?", (key,))
        row = cur.fetchone()
        return row["value"] if row else default

    def stats(self) -> dict:
        return {
            "row_count": int(self._meta("row_count", "0")),
            "built_at": float(self._meta("built_at", "0")),
            "mirror_used": self._meta("mirror_used", ""),
            "fts5_available": self._fts_available,
        }

    def is_stale(self, max_age_seconds: float) -> bool:
        built_at = float(self._meta("built_at", "0") or "0")
        return (time.time() - built_at) > max_age_seconds

    # -- lookups ------------------------------------------------------------

    def get_by_path(self, path: str) -> Optional[TuneRow]:
        cur = self._conn.execute("SELECT * FROM tunes WHERE path = ?", (path,))
        row = cur.fetchone()
        return TuneRow.from_row(row) if row else None

    def list_folder(self, path_prefix: str = "") -> Tuple[List[Tuple[str, int]], List[TuneRow]]:
        """List immediate children of `path_prefix`: (subfolders, leaf tunes).

        Subfolders are returned as (name, tune_count_under_it) tuples, sorted
        alphabetically; leaf tunes directly under this prefix are returned as
        TuneRow objects, also sorted by path.
        """
        prefix = "/" + path_prefix.strip("/")
        like_prefix = prefix if prefix == "/" else prefix + "/"

        cur = self._conn.execute(
            "SELECT * FROM tunes WHERE path LIKE ? ORDER BY path",
            (like_prefix + "%",),
        )
        plen = len(like_prefix)
        folder_counts: Dict[str, int] = {}
        tunes: List[TuneRow] = []
        for row in cur:
            rest = row["path"][plen:]
            if "/" in rest:
                folder_name = rest.split("/", 1)[0]
                folder_counts[folder_name] = folder_counts.get(folder_name, 0) + 1
            else:
                tunes.append(TuneRow.from_row(row))
        return sorted(folder_counts.items()), tunes

    def search(
        self,
        query: str,
        limit: int = 200,
        sort: str = "relevance",
        min_seconds: Optional[int] = None,
        max_seconds: Optional[int] = None,
    ) -> List[TuneRow]:
        query = (query or "").strip()
        if not query:
            return []

        length_clause = ""
        length_params: List[int] = []
        if min_seconds is not None:
            length_clause += " AND t.total_length_seconds >= ?"
            length_params.append(min_seconds)
        if max_seconds is not None:
            length_clause += " AND t.total_length_seconds <= ?"
            length_params.append(max_seconds)

        order_by = _SORTS.get(sort)

        if self._fts_available:
            tokens = [re.sub(r"[^\w]", "", w) for w in query.split()]
            tokens = [t for t in tokens if t]
            if not tokens:
                return []
            match_query = " ".join(f"{t}*" for t in tokens)
            order_clause = order_by if order_by else "bm25(tunes_fts)"
            sql = (
                "SELECT t.* FROM tunes t JOIN tunes_fts f ON t.rowid = f.rowid "
                f"WHERE tunes_fts MATCH ?{length_clause} "
                f"ORDER BY {order_clause} LIMIT ?"
            )
            try:
                cur = self._conn.execute(sql, (match_query, *length_params, limit))
                return [TuneRow.from_row(r) for r in cur]
            except sqlite3.OperationalError as e:
                logger.warning("FTS query failed (%s), falling back to LIKE", e)

        # LIKE fallback (no FTS5, or FTS query failed).
        like = f"%{query}%"
        order_clause = order_by if order_by else "t.title"
        sql = (
            "SELECT t.* FROM tunes t WHERE "
            "(t.search_blob LIKE ? OR t.author LIKE ? OR t.comment LIKE ?)"
            f"{length_clause} ORDER BY {order_clause} LIMIT ?"
        )
        cur = self._conn.execute(sql, (like, like, like, *length_params, limit))
        return [TuneRow.from_row(r) for r in cur]
