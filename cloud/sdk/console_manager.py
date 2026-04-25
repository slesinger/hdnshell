"""
Console manager for C64 HDN Cloud Server.

Manages 10 server-side virtual consoles (IDs 1-10) per client session.
Each console holds its own screen/colour buffers and can optionally have
a custom input handler registered.

Usage from command_handler / cloud_server:

    manager = ConsoleManager.instance()
    console = manager.get_console(console_id, session_id)
    console.handle_keypress(...)
    console.handle_text_input(...)
    screen = console.get_screen_data()
"""

import logging
from typing import Callable, Dict, Optional, Tuple

from . import _session_toasts
from .server_console import ServerConsole

logger = logging.getLogger(__name__)

# Valid server-console IDs
MIN_CONSOLE_ID = 1
MAX_CONSOLE_ID = 10

# Type alias for a handler factory: (console_id, session_id) -> ServerConsole
ConsoleFactory = Callable[[int, int], ServerConsole]


class ConsoleManager:
    """
    Singleton that owns every server-side console instance.

    Consoles are keyed by (session_id, console_id).  On first access a
    default ``ServerConsole`` is created unless a custom factory was
    registered for that console_id.
    """

    _instance: Optional["ConsoleManager"] = None

    def __init__(self):
        # (session_id, console_id) → ServerConsole
        self._consoles: Dict[Tuple[int, int], ServerConsole] = {}
        # console_id → factory function
        self._factories: Dict[int, ConsoleFactory] = {}
        # session_id → currently active console_id
        self._active: Dict[int, int] = {}

    # ------------------------------------------------------------------
    # Singleton access
    # ------------------------------------------------------------------

    @classmethod
    def instance(cls) -> "ConsoleManager":
        """Return the global ConsoleManager (created on first call)."""
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    @classmethod
    def reset(cls):
        """Reset the singleton (useful for testing)."""
        cls._instance = None

    # ------------------------------------------------------------------
    # Factory registration
    # ------------------------------------------------------------------

    def register_factory(self, console_id: int, factory: ConsoleFactory):
        """
        Register a custom factory for a given console_id.

        The factory receives (console_id, session_id) and must return a
        ``ServerConsole`` (or subclass) instance.  It is called the first
        time that console is accessed for a given session.
        """
        if not MIN_CONSOLE_ID <= console_id <= MAX_CONSOLE_ID:
            raise ValueError(
                f"console_id must be {MIN_CONSOLE_ID}-{MAX_CONSOLE_ID}, "
                f"got {console_id}"
            )
        self._factories[console_id] = factory
        logger.info(f"Registered custom factory for console {console_id}")

    # ------------------------------------------------------------------
    # Console access
    # ------------------------------------------------------------------

    def get_console(self, console_id: int, session_id: int) -> ServerConsole:
        """
        Return the console for the given (session_id, console_id),
        creating it if it does not yet exist.
        """
        key = (session_id, console_id)
        if key not in self._consoles:
            factory = self._factories.get(console_id, ServerConsole)
            self._consoles[key] = factory(console_id, session_id)
            logger.info(
                f"Created console {console_id} for session {session_id} "
                f"(factory={factory.__name__ if hasattr(factory, '__name__') else factory})"
            )
        return self._consoles[key]

    def has_console(self, console_id: int, session_id: int) -> bool:
        """Check whether a console already exists."""
        return (session_id, console_id) in self._consoles

    def remove_console(self, console_id: int, session_id: int):
        """Remove a console (e.g. on session disconnect)."""
        key = (session_id, console_id)
        if key in self._consoles:
            del self._consoles[key]
            logger.info(f"Removed console {console_id} for session {session_id}")

    def remove_session(self, session_id: int):
        """Remove all consoles belonging to a session."""
        keys = [k for k in self._consoles if k[0] == session_id]
        for k in keys:
            del self._consoles[k]
        if keys:
            logger.info(f"Removed {len(keys)} console(s) for session {session_id}")

    # ------------------------------------------------------------------
    # Convenience: route commands directly
    # ------------------------------------------------------------------

    def _notify_switch(self, console_id: int, session_id: int):
        """Call on_deactivate / on_activate when the active console changes."""
        prev_id = self._active.get(session_id)
        if prev_id == console_id:
            return
        # Deactivate old console
        if prev_id is not None:
            prev_key = (session_id, prev_id)
            prev_console = self._consoles.get(prev_key)
            if prev_console is not None:
                try:
                    prev_console.on_deactivate()
                except Exception:
                    logger.exception(
                        f"on_deactivate failed for console {prev_id}"
                    )
        # Activate new console
        self._active[session_id] = console_id
        new_console = self._consoles.get((session_id, console_id))
        if new_console is not None:
            try:
                new_console.on_activate()
            except Exception:
                logger.exception(
                    f"on_activate failed for console {console_id}"
                )

    def handle_keypress(
        self, console_id: int, session_id: int, petscii_code: int, modifiers: int
    ) -> Optional[bytes]:
        """Route a keypress to the appropriate console."""
        self._notify_switch(console_id, session_id)
        console = self.get_console(console_id, session_id)
        # Any keypress dismisses both the per-console and session-level toaster.
        console.clear_toaster()
        _session_toasts.remove(session_id)
        return console.handle_keypress(petscii_code, modifiers)

    def handle_text_input(
        self, console_id: int, session_id: int, data: bytes
    ) -> Optional[bytes]:
        """Route text input to the appropriate console."""
        self._notify_switch(console_id, session_id)
        console = self.get_console(console_id, session_id)
        return console.handle_text_input(data)

    def handle_command(
        self, console_id: int, session_id: int, data: bytes
    ) -> Optional[bytes]:
        """Route a command to the appropriate console."""
        self._notify_switch(console_id, session_id)
        console = self.get_console(console_id, session_id)
        return console.handle_command(data)

    def get_screen_data(self, console_id: int, session_id: int) -> bytes:
        """Return the screen buffer for a console (session toast included automatically)."""
        self._notify_switch(console_id, session_id)
        console = self.get_console(console_id, session_id)
        return console.get_screen_data()

    def get_color_data(self, console_id: int, session_id: int) -> bytes:
        """Return the colour buffer for a console (session toast included automatically)."""
        console = self.get_console(console_id, session_id)
        return console.get_color_data()

    # ------------------------------------------------------------------
    # Session-level toast API (cross-app notifications)
    # ------------------------------------------------------------------

    def show_session_toast(
        self,
        session_id: int,
        text: str,
        duration_sec: float = 3.0,
        color: int = 7,
        push: bool = True,
    ) -> None:
        """Display a temporary toast notification on the currently active console.

        The notification is overlaid on TOASTER_ROW (row 22) without modifying
        any console's internal buffers.  It auto-expires after ``duration_sec``
        seconds and is dismissed immediately by any keypress.

        This method is safe to call from background threads.

        Args:
            session_id:   Target session.
            text:         Message to display (truncated to 40 chars).
            duration_sec: Visible duration in seconds (default 5).
            color:        C64 colour nybble (default 7 = yellow).
            push:         If True, immediately push the updated screen to the C64.
        """
        import time
        _session_toasts.put(session_id, text, time.monotonic() + duration_sec, color & 0x0F)
        if push:
            self._push_session_toast(session_id)

    def clear_session_toast(self, session_id: int) -> None:
        """Dismiss the session-level toast for a session immediately."""
        _session_toasts.remove(session_id)

    def _push_session_toast(self, session_id: int) -> None:
        """Push the currently active console's screen (with session toast overlay) to the C64."""
        active_console_id = self._active.get(session_id)
        if active_console_id is None:
            return
        console = self._consoles.get((session_id, active_console_id))
        if console is None:
            return
        try:
            from . import network_helper as nh
            # get_screen_data()/get_color_data() already include the session toast overlay.
            nh.send_screen_data(console.get_screen_data(), console.get_color_data())
        except Exception:
            logger.debug("Session toast push failed", exc_info=True)
