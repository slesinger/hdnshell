"""
Per-install Launcher configuration (GH issue #22).

Stores the user-configurable **pin map** (console slot -> app-id) and the
**recents** list in ``workspace/.config/launcher.json``. On a fresh install the
pins default to today's fixed layout, taken from the AppRegistry, so the
default hotbar is ubiquitous and cross-user-understood.

Slots are ints internally; JSON object keys are always strings, so we
normalise on load/save.
"""

import json
import logging
import os
from typing import Dict, List, Optional

from .workspace import WORKSPACE_DIR

logger = logging.getLogger(__name__)

_CONFIG_FILENAME = "launcher.json"

# Slots that can be pinned to apps from the hotbar. Slot 1 is always the
# Launcher itself and is never a pin target. Slot 10 (SID Browser, GH #28) has
# no wedge chord, so it stays a *fixed* extra (openable via the Launcher's
# RETURN, not digit-pinnable) rather than a hotbar slot -- see GH #22.
#
# PRODUCTION policy: the HDN shell only supports digits 2-7 for pinning.
# Slots 8 (Mail) and 9 (WhatsApp, GH #20) are TEMPORARY testing slots so the
# new apps can be reached on hardware; drop them back to (2-7) before release.
PINNABLE_SLOTS = (2, 3, 4, 5, 6, 7, 8, 9)

# Cap on the recents list length.
MAX_RECENTS = 10


def _config_path() -> str:
    return os.path.join(WORKSPACE_DIR, ".config", _CONFIG_FILENAME)


class LauncherConfig:
    """Load/mutate/save the launcher pin map and recents."""

    def __init__(self, pins: Dict[int, str], recents: List[str]):
        self.pins: Dict[int, str] = dict(pins)
        self.recents: List[str] = list(recents)

    # ------------------------------------------------------------------
    # Load / save
    # ------------------------------------------------------------------

    @classmethod
    def load(cls, default_pins: Optional[Dict[int, str]] = None) -> "LauncherConfig":
        """Load config from disk, falling back to *default_pins* on first run."""
        path = _config_path()
        if os.path.exists(path):
            try:
                with open(path, "r", encoding="utf-8") as f:
                    data = json.load(f)
                raw_pins = data.get("pins", {}) or {}
                pins = {}
                for k, v in raw_pins.items():
                    try:
                        slot = int(k)
                    except (TypeError, ValueError):
                        continue
                    if slot in PINNABLE_SLOTS and isinstance(v, str) and v:
                        pins[slot] = v
                recents = [r for r in data.get("recents", []) if isinstance(r, str)]
                return cls(pins, recents[:MAX_RECENTS])
            except Exception as e:
                logger.warning("Failed to load launcher.json: %s", e)
        # First run (or unreadable): seed from defaults, but only for pinnable
        # slots -- a non-pinnable default (e.g. sid_browser @ slot 10) must not
        # show up as a phantom hotbar pin.
        seeded = {
            slot: app_id
            for slot, app_id in (default_pins or {}).items()
            if slot in PINNABLE_SLOTS
        }
        return cls(seeded, [])

    def save(self) -> None:
        path = _config_path()
        try:
            os.makedirs(os.path.dirname(path), exist_ok=True)
            payload = {
                "pins": {str(slot): app_id for slot, app_id in sorted(self.pins.items())},
                "recents": self.recents[:MAX_RECENTS],
            }
            with open(path, "w", encoding="utf-8") as f:
                json.dump(payload, f, indent=2)
        except Exception as e:
            logger.warning("Failed to save launcher.json: %s", e)

    # ------------------------------------------------------------------
    # Pin operations
    # ------------------------------------------------------------------

    def slot_for_app(self, app_id: str) -> Optional[int]:
        """Return the slot this app is pinned to, or None."""
        for slot, pinned in self.pins.items():
            if pinned == app_id:
                return slot
        return None

    def pin(self, slot: int, app_id: str) -> None:
        """Pin *app_id* to *slot*, removing any prior pin of the same app.

        Pinning an app that is already on another slot **moves** it (an app is
        never pinned to two slots at once).
        """
        if slot not in PINNABLE_SLOTS:
            raise ValueError(f"slot {slot} is not pinnable")
        # Remove any existing pin for this app (repin = move).
        for existing in [s for s, a in self.pins.items() if a == app_id]:
            del self.pins[existing]
        self.pins[slot] = app_id
        self.save()

    def unpin(self, slot: int) -> Optional[str]:
        """Remove the pin at *slot*. Returns the app-id that was there (or None)."""
        app_id = self.pins.pop(slot, None)
        if app_id is not None:
            self.save()
        return app_id

    # ------------------------------------------------------------------
    # Recents
    # ------------------------------------------------------------------

    def add_recent(self, app_id: str) -> None:
        """Mark *app_id* as the most recently used app (front of the list)."""
        self.recents = [app_id] + [r for r in self.recents if r != app_id]
        self.recents = self.recents[:MAX_RECENTS]
        self.save()

    @property
    def last_used(self) -> Optional[str]:
        return self.recents[0] if self.recents else None
