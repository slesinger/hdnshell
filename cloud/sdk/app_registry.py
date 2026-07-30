"""
App registry for HDN Server — the catalog source of truth for the Launcher
(GH issue #22).

Each console app registers an ``AppInfo`` describing its stable app-id, human
title, one-line description, default console slot, and factory. The Launcher
(console 1) renders this catalog; ``cloud_server`` builds the ConsoleManager
factory map from the registry + per-install pin config (``launcher_config``).

The stable **app-id** is the identity that pins/recents reference. The console
**slot** (1-10) is where an app's factory is registered so the wedge can route
keypresses to it; which app lives on slots 2-7/10 is user-configurable, but the
app-id never changes.
"""

import logging
from dataclasses import dataclass
from typing import Callable, Dict, List, Optional

logger = logging.getLogger(__name__)

# Factory: (console_id, session_id) -> ServerConsole (kept loose to avoid a
# hard import of ServerConsole here — server-apps import this module).
AppFactory = Callable[[int, int], object]


@dataclass
class AppInfo:
    """Catalog metadata for one console app."""

    app_id: str  # stable identity, e.g. "telegram"
    title: str  # short display title, e.g. "Telegram"
    description: str  # one-line description for the detail pane
    default_slot: int  # console slot this app defaults to (1-10)
    factory: AppFactory  # builds the console instance


class AppRegistry:
    """Singleton catalog of all known console apps, keyed by app-id."""

    _instance: Optional["AppRegistry"] = None

    def __init__(self):
        self._apps: Dict[str, AppInfo] = {}

    @classmethod
    def instance(cls) -> "AppRegistry":
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    @classmethod
    def reset(cls):
        """Reset the singleton (useful for testing)."""
        cls._instance = None

    def register(self, info: AppInfo) -> None:
        """Register (or replace) an app in the catalog."""
        self._apps[info.app_id] = info
        logger.info(
            "Registered app '%s' (%s) default slot %d",
            info.app_id,
            info.title,
            info.default_slot,
        )

    def get(self, app_id: str) -> Optional[AppInfo]:
        return self._apps.get(app_id)

    def all_apps(self) -> List[AppInfo]:
        """Return every registered app, ordered by default slot then title."""
        return sorted(self._apps.values(), key=lambda a: (a.default_slot, a.title))

    def default_pins(self) -> Dict[int, str]:
        """Default slot -> app-id map (today's fixed layout) from registrations."""
        return {info.default_slot: info.app_id for info in self._apps.values()}

    def __contains__(self, app_id: str) -> bool:
        return app_id in self._apps
