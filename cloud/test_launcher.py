"""
Unit tests for the Launcher / dashboard console (GH issue #22).

Covers:
  - AppRegistry catalog + default pins
  - LauncherConfig load/default/pin/unpin/recents (isolated to a tmp file)
  - Empty-slot -> Launcher factory pre-highlight (focus_slot)
  - Launcher key handling: navigation, pin/unpin, filter, RETURN-open
  - get_badge aggregation across live consoles
"""

import os
import sys

import pytest

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_APPS_DIR = os.path.join(_CLOUD_DIR, "server-apps")
if _APPS_DIR not in sys.path:
    sys.path.insert(0, _APPS_DIR)

from sdk.app_registry import AppRegistry, AppInfo  # noqa: E402
from sdk.console_manager import ConsoleManager  # noqa: E402
from sdk.server_console import ServerConsole  # noqa: E402
import sdk.launcher_config as launcher_config  # noqa: E402
from sdk.launcher_config import LauncherConfig, PINNABLE_SLOTS  # noqa: E402
from launcher import LauncherConsole  # noqa: E402

# PETSCII key codes used in tests
KEY_RETURN = 0x0D
KEY_CRSR_DN = 0x11
KEY_CRSR_UP = 0x91
KEY_DEL = 0x14


# ----------------------------------------------------------------------
# Fixtures
# ----------------------------------------------------------------------


class _FakeConsole(ServerConsole):
    """A ServerConsole subclass with a configurable badge."""

    badge_value = None

    def get_badge(self):
        return self.badge_value


def _make_app(app_id, slot, badge=None):
    factory = type(
        f"App_{app_id}",
        (_FakeConsole,),
        {"badge_value": badge},
    )
    return AppInfo(app_id, app_id.title(), f"desc for {app_id}", slot, factory)


@pytest.fixture(autouse=True)
def _isolate(tmp_path, monkeypatch):
    """Reset singletons and point launcher.json at a tmp file each test."""
    AppRegistry.reset()
    ConsoleManager.reset()
    cfg_file = tmp_path / "launcher.json"
    monkeypatch.setattr(launcher_config, "_config_path", lambda: str(cfg_file))

    reg = AppRegistry.instance()
    for app_id, slot in [
        ("file_editor", 2),
        ("coding_agent", 3),
        ("web_browser", 4),
        ("telegram", 5),
        ("rss", 6),
        ("wiki", 7),
        ("vibe_chat", 10),
    ]:
        reg.register(_make_app(app_id, slot))
    yield
    AppRegistry.reset()
    ConsoleManager.reset()


# ----------------------------------------------------------------------
# AppRegistry
# ----------------------------------------------------------------------


class TestAppRegistry:
    def test_all_apps_sorted_by_slot(self):
        reg = AppRegistry.instance()
        slots = [a.default_slot for a in reg.all_apps()]
        assert slots == sorted(slots)

    def test_default_pins_match_registration(self):
        reg = AppRegistry.instance()
        pins = reg.default_pins()
        assert pins[5] == "telegram"
        assert pins[10] == "vibe_chat"


# ----------------------------------------------------------------------
# LauncherConfig
# ----------------------------------------------------------------------


class TestLauncherConfig:
    def test_first_run_uses_defaults(self):
        defaults = AppRegistry.instance().default_pins()
        cfg = LauncherConfig.load(defaults)
        # Only pinnable slots are seeded; slot 10 (vibe_chat) is a fixed extra.
        expected = {s: a for s, a in defaults.items() if s in PINNABLE_SLOTS}
        assert cfg.pins == expected
        assert 10 not in cfg.pins
        assert cfg.recents == []

    def test_pin_persists_and_reloads(self):
        cfg = LauncherConfig.load(AppRegistry.instance().default_pins())
        cfg.pin(2, "telegram")  # move telegram from slot 5 to slot 2
        reloaded = LauncherConfig.load({})
        assert reloaded.slot_for_app("telegram") == 2

    def test_pin_moves_app_off_old_slot(self):
        cfg = LauncherConfig.load(AppRegistry.instance().default_pins())
        assert cfg.slot_for_app("telegram") == 5
        cfg.pin(2, "telegram")
        # No longer on slot 5.
        assert 5 not in cfg.pins or cfg.pins[5] != "telegram"
        assert cfg.slot_for_app("telegram") == 2

    def test_unpin_removes_slot(self):
        cfg = LauncherConfig.load(AppRegistry.instance().default_pins())
        removed = cfg.unpin(5)
        assert removed == "telegram"
        assert cfg.slot_for_app("telegram") is None

    def test_pin_rejects_non_pinnable_slot(self):
        cfg = LauncherConfig.load({})
        with pytest.raises(ValueError):
            cfg.pin(1, "telegram")  # slot 1 is the launcher itself

    def test_recents_dedup_and_order(self):
        cfg = LauncherConfig.load({})
        cfg.add_recent("rss")
        cfg.add_recent("telegram")
        cfg.add_recent("rss")
        assert cfg.recents[0] == "rss"
        assert cfg.recents.count("rss") == 1
        assert cfg.last_used == "rss"


# ----------------------------------------------------------------------
# LauncherConsole
# ----------------------------------------------------------------------


class TestLauncherConsole:
    def test_home_highlights_recent(self):
        cfg = LauncherConfig.load(AppRegistry.instance().default_pins())
        cfg.add_recent("wiki")
        lc = LauncherConsole(1, 1)
        assert lc._current_app().app_id == "wiki"

    def test_empty_slot_sets_focus(self):
        lc = LauncherConsole(6, 1)  # opened as slot 6 (unpinned scenario)
        assert lc.focus_slot == 6
        # Pre-highlights the app defaulting to slot 6 (rss).
        assert lc._current_app().app_id == "rss"

    def test_navigation_down_up(self):
        lc = LauncherConsole(1, 1)
        start = lc.sel
        lc.handle_keypress(KEY_CRSR_DN, 0)
        assert lc.sel == start + 1
        lc.handle_keypress(KEY_CRSR_UP, 0)
        assert lc.sel == start

    def test_pin_digit_updates_config(self):
        lc = LauncherConsole(1, 1)
        # Highlight telegram (slot 5 by default).
        apps = lc._apps()
        lc.sel = next(i for i, a in enumerate(apps) if a.app_id == "telegram")
        lc.handle_keypress(ord("2"), 0)  # pin to slot 2
        assert lc.config.slot_for_app("telegram") == 2
        # Reloading from disk shows persistence.
        assert LauncherConfig.load({}).slot_for_app("telegram") == 2

    def test_pin_digit_zero_rejected(self):
        # Slot 10 is no longer a hotbar slot (no C=+0 chord yet), so digit '0'
        # cannot pin -- the app keeps its existing pin unchanged.
        lc = LauncherConsole(1, 1)
        apps = lc._apps()
        lc.sel = next(i for i, a in enumerate(apps) if a.app_id == "telegram")
        lc.handle_keypress(ord("0"), 0)
        assert lc.config.slot_for_app("telegram") == 5  # unchanged

    def test_unpin_with_x(self):
        lc = LauncherConsole(1, 1)
        apps = lc._apps()
        lc.sel = next(i for i, a in enumerate(apps) if a.app_id == "telegram")
        assert lc.config.slot_for_app("telegram") == 5
        lc.handle_keypress(ord("x"), 0)
        assert lc.config.slot_for_app("telegram") is None

    def test_filter_narrows_list(self):
        lc = LauncherConsole(1, 1)
        lc.handle_keypress(ord("/"), 0)
        assert lc.filtering is True
        for ch in "rss":
            lc.handle_keypress(ord(ch), 0)
        ids = [a.app_id for a in lc._apps()]
        assert ids == ["rss"]
        # DEL backs out the chars; an empty filter restores the full list.
        for _ in range(len("rss")):
            lc.handle_keypress(KEY_DEL, 0)
        assert lc.filter_text == ""
        assert len(lc._apps()) == len(AppRegistry.instance().all_apps())

    def test_pin_registers_factory_and_evicts(self):
        mgr = ConsoleManager.instance()
        lc = LauncherConsole(1, 1)
        apps = lc._apps()
        lc.sel = next(i for i, a in enumerate(apps) if a.app_id == "telegram")
        lc.handle_keypress(ord("2"), 0)
        # Slot 2 factory now builds the telegram app class.
        console = mgr.get_console(2, 1)
        assert console.__class__.__name__ == "App_telegram"

    def test_return_open_records_recent(self, monkeypatch):
        # Avoid any hardware path.
        import launcher as launcher_mod

        monkeypatch.setattr(
            launcher_mod.LauncherConsole, "_route_and_paint", lambda *a, **k: None
        )
        lc = LauncherConsole(1, 1)
        apps = lc._apps()
        lc.sel = next(i for i, a in enumerate(apps) if a.app_id == "rss")
        lc.handle_keypress(KEY_RETURN, 0)
        assert lc.config.last_used == "rss"


# ----------------------------------------------------------------------
# Badges
# ----------------------------------------------------------------------


class TestBadges:
    def test_badge_only_for_live_console(self):
        reg = AppRegistry.instance()
        reg.register(_make_app("telegram", 5, badge="3"))  # replace with badge
        mgr = ConsoleManager.instance()
        mgr.register_factory(5, reg.get("telegram").factory)
        lc = LauncherConsole(1, 1)
        # No live telegram console yet -> no badge.
        assert lc._app_badge("telegram") is None
        # Instantiate the telegram console; now its badge shows.
        mgr.get_console(5, 1)
        assert lc._app_badge("telegram") == "3"

    def test_aggregate_unread_sums_numeric_badges(self):
        reg = AppRegistry.instance()
        reg.register(_make_app("telegram", 5, badge="3"))
        reg.register(_make_app("coding_agent", 3, badge="running"))
        mgr = ConsoleManager.instance()
        mgr.register_factory(5, reg.get("telegram").factory)
        mgr.register_factory(3, reg.get("coding_agent").factory)
        mgr.get_console(5, 1)  # telegram live, badge "3"
        mgr.get_console(3, 1)  # coding agent live, badge "running" (non-numeric)
        lc = LauncherConsole(1, 1)
        assert lc._aggregate_unread() == 3


# ----------------------------------------------------------------------
# Keypress repaint: opening an app must paint THAT app, not the Launcher
# ----------------------------------------------------------------------


class TestKeypressRepaint:
    """Regression for GH #22: pressing RETURN in the Launcher opened the app on
    another slot but handle_console_keypress repainted console 1 (the Launcher)
    right over it, so the app only surfaced on the *next* keypress."""

    def test_return_paints_opened_app_not_launcher(self, monkeypatch):
        from sdk import command_handler as chmod
        import launcher as launcher_mod

        reg = AppRegistry.instance()

        class _MarkerConsole(ServerConsole):
            """App whose whole screen is a recognizable 0xAA marker."""

            def __init__(self, cid, sid):
                super().__init__(cid, sid)
                for i in range(len(self.screen)):
                    self.screen[i] = 0xAA

        reg.register(AppInfo("marker", "Marker", "desc", 8, _MarkerConsole))

        mgr = ConsoleManager.instance()
        mgr.register_factory(1, launcher_mod.LauncherConsole)
        # Don't touch the network when the launcher paints the target console.
        monkeypatch.setattr(
            launcher_mod.LauncherConsole, "_route_and_paint", lambda *a, **k: None
        )
        sent = []
        monkeypatch.setattr(chmod, "send_screen_data", lambda s, c: sent.append(bytes(s)))

        session = 1
        launcher = mgr.get_console(1, session)
        apps = launcher._apps()
        launcher.sel = next(i for i, a in enumerate(apps) if a.app_id == "marker")

        chmod.CommandHandler.handle_console_keypress(
            1, bytes([KEY_RETURN, 0x00]), session
        )

        # The keypress switched the active console to the app's slot ...
        assert mgr.active_console_id(session) == 8
        # ... and the screen pushed to the C64 is the app's, not the Launcher's.
        assert sent, "expected a screen push"
        assert set(sent[-1]) == {0xAA}
