"""
SID Browser playlists (GH issue #28): JSON-backed named playlists of HVSC
paths, plus Extended M3U export/import (the de facto interchange format for
chiptune/media player playlists -- there is no HVSC/SID-specific standard).

Persistence idiom matches sdk.launcher_config: os.makedirs, json.dump with
indent=2, tolerant load that falls back to an empty store on parse error.
"""

import json
import logging
import os
from datetime import datetime, timezone
from typing import List, Optional

from .workspace import WORKSPACE_DIR

logger = logging.getLogger(__name__)

_STORE_FILENAME = "sid_playlists.json"

FAVORITES = "favorites"


def _store_path() -> str:
    return os.path.join(WORKSPACE_DIR, ".config", _STORE_FILENAME)


class PlaylistStore:
    """Load/mutate/save named playlists of HVSC paths."""

    def __init__(self, playlists: Optional[dict] = None):
        # {name: {"paths": [str, ...], "created": iso_str}}
        self.playlists: dict = playlists if playlists is not None else {}

    # ------------------------------------------------------------------
    # Load / save
    # ------------------------------------------------------------------

    @classmethod
    def load(cls) -> "PlaylistStore":
        path = _store_path()
        if os.path.exists(path):
            try:
                with open(path, "r", encoding="utf-8") as f:
                    data = json.load(f)
                if isinstance(data, dict):
                    cleaned = {}
                    for name, entry in data.items():
                        if not isinstance(entry, dict):
                            continue
                        paths = [p for p in entry.get("paths", []) if isinstance(p, str)]
                        cleaned[name] = {
                            "paths": paths,
                            "created": entry.get("created", _now_iso()),
                        }
                    return cls(cleaned)
            except Exception as e:
                logger.warning("Failed to load sid_playlists.json: %s", e)
        return cls({})

    def save(self) -> None:
        path = _store_path()
        try:
            os.makedirs(os.path.dirname(path), exist_ok=True)
            with open(path, "w", encoding="utf-8") as f:
                json.dump(self.playlists, f, indent=2)
        except Exception as e:
            logger.warning("Failed to save sid_playlists.json: %s", e)

    # ------------------------------------------------------------------
    # Playlist management
    # ------------------------------------------------------------------

    def list_playlists(self) -> List[str]:
        return sorted(self.playlists.keys())

    def create(self, name: str) -> bool:
        name = name.strip()
        if not name or name in self.playlists:
            return False
        self.playlists[name] = {"paths": [], "created": _now_iso()}
        self.save()
        return True

    def delete(self, name: str) -> bool:
        if name not in self.playlists:
            return False
        del self.playlists[name]
        self.save()
        return True

    def contains(self, name: str, path: str) -> bool:
        entry = self.playlists.get(name)
        return bool(entry and path in entry["paths"])

    def add(self, name: str, path: str) -> bool:
        if name not in self.playlists:
            self.playlists[name] = {"paths": [], "created": _now_iso()}
        entry = self.playlists[name]
        if path in entry["paths"]:
            return False
        entry["paths"].append(path)
        self.save()
        return True

    def remove(self, name: str, path: str) -> bool:
        entry = self.playlists.get(name)
        if not entry or path not in entry["paths"]:
            return False
        entry["paths"].remove(path)
        self.save()
        return True

    def paths(self, name: str) -> List[str]:
        entry = self.playlists.get(name)
        return list(entry["paths"]) if entry else []

    # ------------------------------------------------------------------
    # Favorites convenience wrapper (backs the 'L'-for-Like key binding)
    # ------------------------------------------------------------------

    def toggle_favorite(self, path: str) -> bool:
        """Toggle `path` in the built-in "favorites" playlist.

        Returns the new state: True if now a favorite, False if removed.
        """
        if self.contains(FAVORITES, path):
            self.remove(FAVORITES, path)
            return False
        self.add(FAVORITES, path)
        return True

    def is_favorite(self, path: str) -> bool:
        return self.contains(FAVORITES, path)


def _now_iso() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


# =====================================================================
#  Extended M3U export / import
# =====================================================================


def export_m3u(store: PlaylistStore, name: str, index) -> str:
    """Build Extended M3U text for playlist `name`.

    Entries are emitted as full mirror URLs (rather than bare HVSC-relative
    paths) so the exported file is directly playable in any standard player
    outside the HDN shell too.
    """
    from .hvsc_index import get_configured_mirror

    mirror = get_configured_mirror().rstrip("/")
    lines = ["#EXTM3U"]
    for path in store.paths(name):
        tune = index.get_by_path(path)
        if tune:
            duration = tune.lengths[0] if tune.lengths else 0
            display = f"{tune.author} - {tune.title}" if tune.author else tune.title
            lines.append(f"#EXTINF:{duration},{display}")
        lines.append(f"{mirror}{path}")
    return "\n".join(lines) + "\n"


# Top-level HVSC sections. A full mirror URL carries a mirror-specific
# prefix before these (e.g. ".../download/C64Music/MUSICIANS/..."), which
# varies per mirror, so import re-anchors on the first section segment
# rather than assuming any particular mirror layout.
_HVSC_SECTIONS = ("MUSICIANS", "GAMES", "DEMOS", "CGSC")


def import_m3u(text: str) -> List[str]:
    """Parse Extended M3U text into a list of HVSC-relative paths.

    Strips #EXTM3U/#EXTINF comment lines; for full-URL lines, strips the
    scheme+host *and* the mirror's own path prefix, re-anchoring on the
    first HVSC top-level section so a file exported against one mirror
    imports cleanly against another. Does not validate against an index --
    callers cross-check returned paths and report any that don't resolve.
    """
    paths: List[str] = []
    for raw_line in text.splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        if "://" in line:
            _, _, rest = line.partition("://")
            _, _, rest = rest.partition("/")
            line = "/" + rest
        line = _reanchor_on_section(line)
        if line.startswith("/"):
            paths.append(line)
    return paths


def _reanchor_on_section(path: str) -> str:
    """Trim anything before the first HVSC top-level section segment."""
    segments = path.split("/")
    for i, seg in enumerate(segments):
        if seg in _HVSC_SECTIONS:
            return "/" + "/".join(segments[i:])
    return path
