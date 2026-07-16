"""
TutorialSession: the coach's per-session background runner.

Phase 3 (screen-read auto-advance + demo -- TUTORIALS_PLAN.md §9 Phase 3):
polls the live C64 screen, calls the current step's `verify(screen)` and
auto-advances at most one step per tick when it returns True, re-paints
the (possibly new) current step's hint into the top-right toaster box,
and lets the handler drive manual nav (`n`/`b`/`r`/`s`/`q`). `s` types
the step's `demo_keys` onto the C64 via
`network_helper.send_c64_keyboard_input`.

Off-shell guard (plan §5.2/§10.1): before painting/verifying, `_tick()`
checks `_on_shell(session_id)` and returns without touching the screen
if the user has switched to a server console (File Editor, Browser,
...) so the coach never stomps on a console it doesn't own. See
`_on_shell()`'s docstring for how that's detected and its confirmed
(non-VICE-testable) hardware trace.

Design goal: `_tick()` is a single, synchronous, side-effect-only poll
iteration with no thread/hardware dependency baked in, so tests can call
it directly (monkeypatching `sdk.network_helper.read_last_c64_ip` /
`dma_read_memory` / `send_screen_data` -- this module calls them via the
`network_helper` module object, not bound names, so monkeypatch.setattr
on `sdk.network_helper.*` takes effect) without spinning up the
background thread at all. See TUTORIALS_PLAN.md §5.
"""

import logging
import threading
import time
from typing import Dict, Optional

from sdk import network_helper
from sdk.toaster import paint_toaster

from .model import Screen, Tutorial

logger = logging.getLogger(__name__)

SCREEN_ADDR = 0x0400
COLOR_ADDR = 0xD800
SCREEN_LEN = 1000

DEFAULT_POLL_INTERVAL = 1.5
# How long _run() sleeps between "is _running still true?" checks while
# waiting out poll_interval -- keeps stop() responsive without busy-looping.
_STOP_CHECK_GRANULARITY = 0.1


# Module-level registry of live sessions, keyed by session_id. One
# TutorialSession per session at a time (starting a new one stops any
# prior one first -- see start_session()).
_SESSIONS: Dict[int, "TutorialSession"] = {}
_REGISTRY_LOCK = threading.Lock()


def get_session(session_id: int) -> Optional["TutorialSession"]:
    """Return the live TutorialSession for session_id, or None."""
    with _REGISTRY_LOCK:
        return _SESSIONS.get(session_id)


def start_session(tutorial: Tutorial, session_id: int, poll_interval: float = DEFAULT_POLL_INTERVAL) -> "TutorialSession":
    """
    Start a new TutorialSession for `tutorial` on `session_id`.

    Stops (and removes) any prior session already running for this
    session_id first, so only one coach runs per session at a time.
    """
    stop_session(session_id)
    session = TutorialSession(tutorial, session_id, poll_interval=poll_interval)
    with _REGISTRY_LOCK:
        _SESSIONS[session_id] = session
    session.start()
    return session


def stop_session(session_id: int) -> None:
    """Stop the live TutorialSession for session_id, if any (no-op otherwise)."""
    with _REGISTRY_LOCK:
        session = _SESSIONS.get(session_id)
    if session is not None:
        session.stop()


class TutorialSession:
    """
    Per-session background coach runner: polls the live C64 screen and
    overlays the current step's hint, while `next()`/`back()`/`repeat()`/
    `show()` (called by TutorialHandler on the handler thread) drive step
    navigation under a shared lock.
    """

    def __init__(self, tutorial: Tutorial, session_id: int, poll_interval: float = DEFAULT_POLL_INTERVAL):
        self.tutorial = tutorial
        self.session_id = session_id
        self.poll_interval = poll_interval

        self._lock = threading.Lock()
        self._step_index = 0
        self._running = False
        self._stopped = False
        self._completed = False
        self._thread: Optional[threading.Thread] = None

    # ------------------------------------------------------------------
    # Lifecycle
    # ------------------------------------------------------------------

    def start(self) -> None:
        """Spawn the daemon poll thread. Safe to call once per instance."""
        with self._lock:
            if self._running:
                return
            self._running = True
        self._thread = threading.Thread(
            target=self._run,
            name=f"tutorial-session-{self.session_id}",
            daemon=True,
        )
        self._thread.start()

    def stop(self) -> None:
        """
        Stop the poll thread (if running), then push one clean frame (no
        overlay) from a fresh live read so `q` leaves the C64 at a clean
        prompt, and remove self from the module-level session registry.

        Idempotent: safe to call more than once (e.g. once from `next()`
        on completion and again from `stop_session()`/a later `q`) -- only
        the first call joins the thread / pushes the clean frame.
        """
        with self._lock:
            if self._stopped:
                return
            self._stopped = True
            was_running = self._running
            self._running = False

        thread = self._thread
        if was_running and thread is not None:
            thread.join(timeout=2.0)

        self._push_clean_frame()

        with _REGISTRY_LOCK:
            if _SESSIONS.get(self.session_id) is self:
                del _SESSIONS[self.session_id]

    def _push_clean_frame(self) -> None:
        """Re-read the live screen/color and push it back with no overlay."""
        try:
            host = network_helper.read_last_c64_ip()
            if not host:
                return
            screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
            color_bytes = network_helper.dma_read_memory(host, COLOR_ADDR, SCREEN_LEN)
            network_helper.send_screen_data(bytes(screen_bytes), bytes(color_bytes))
        except Exception:
            logger.debug("TutorialSession: clean-frame push failed (host unreachable?)", exc_info=True)

    def _run(self) -> None:
        """Background poll loop: tick, then sleep in small increments."""
        while True:
            with self._lock:
                if not self._running:
                    return
            self._safe_tick()

            slept = 0.0
            while slept < self.poll_interval:
                with self._lock:
                    if not self._running:
                        return
                time.sleep(_STOP_CHECK_GRANULARITY)
                slept += _STOP_CHECK_GRANULARITY

    def _safe_tick(self) -> None:
        """Run `_tick()`, swallowing any transport error so the thread never dies."""
        try:
            self._tick()
        except Exception:
            logger.debug("TutorialSession._tick failed (host unreachable?)", exc_info=True)

    # ------------------------------------------------------------------
    # The poll iteration (Phase 3: verify + auto-advance + overlay)
    # ------------------------------------------------------------------

    def _tick(self) -> None:
        """
        One poll iteration:
          1. read the live screen+color, build a `Screen`.
          2. if the user isn't at the shell (`_on_shell()` is False),
             return without painting/verifying -- a server console owns
             the display right now (plan §5.2).
          3. call the current step's `verify(screen)` (best-effort -- a
             predicate that raises is logged and treated as False so a
             buggy verify can never crash the poll thread); advance one
             step on True, unless already on the last step (last steps
             are manual/"press q" -- they never auto-advance since
             `always_manual()` always returns False).
          4. paint the (possibly new) current step's hint and push the
             frame back.
        """
        host = network_helper.read_last_c64_ip()
        if not host:
            return  # nothing to draw against

        screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
        color_bytes = network_helper.dma_read_memory(host, COLOR_ADDR, SCREEN_LEN)
        screen = Screen(screen_bytes, color_bytes)

        if not self._on_shell(self.session_id):
            return  # a server console owns the screen right now -- don't stomp on it

        with self._lock:
            last_index = len(self.tutorial.steps) - 1
            if self._step_index < last_index:
                step = self.tutorial.steps[self._step_index]
                try:
                    done = bool(step.verify(screen))
                except Exception:
                    logger.debug("TutorialSession: step.verify raised", exc_info=True)
                    done = False
                if done:
                    self._step_index += 1  # advance at most one step per tick

        scr = bytearray(screen_bytes)
        col = bytearray(color_bytes)
        paint_toaster(scr, col, self._current_hint())
        network_helper.send_screen_data(bytes(scr), bytes(col))

    def _on_shell(self, session_id: int) -> bool:
        """
        True when it's safe to paint the overlay / run verify this tick:
        the user is at the native BASIC shell (console 0 on the wire),
        not inside a server console (File Editor=2 .. Wikipedia=7).

        Confirmed by tracing the wedge asm + server packet handling
        (TUTORIALS_PLAN.md §10.1 investigation, Phase 3):
          - `ConsoleManager._active[session_id]` (cloud/sdk/console_manager.py)
            is set only by `_notify_switch()`, called from
            `handle_keypress`/`handle_text_input`/`handle_command`/
            `get_screen_data` -- i.e. only when a packet routes to a
            *server* console (wire console_id 1-10). It starts unset
            (`.get()` -> None) until the first switch.
          - Returning to local (C=+CTRL+1, wedge/rr38p-tmp12reu.bank02.asm
            `cs_modal`/`cm_match`) does NOT send a server-console packet:
            it calls `scr_restore`, which sends a console_id==0 COMMAND
            (SERVER_CMD_RESTORE_SCREEN) handled by
            `CommandHandler.handle_local_command()` -- a code path that
            never touched `ConsoleManager` before this Phase 3 change.
            Left alone, `_active` would go stale: once the user visits
            any server console, `_active[session_id]` stays pinned at
            that id forever, even long after they've returned to BASIC,
            which would permanently disable the overlay/auto-advance for
            the rest of the session. Fixed by calling
            `ConsoleManager.deactivate_session(session_id)` (which clears
            `_active` AND runs the previous console's on_deactivate hook,
            e.g. File Editor auto-save) in `handle_local_command()`'s
            `SERVER_CMD_RESTORE_SCREEN` branch
            (cloud/sdk/command_handler.py) -- see that function's
            docstring. With that fix, `_active.get(session_id)` reads
            None whenever the user is at BASIC (never switched, or
            switched-away-and-back), and 2..10 only while a server
            console is actually on screen.
          - No physical key maps to wire console_id 1 in the current
            build (digit "1" always means "back to local", handled the
            way above -- see `console_switch`/`cs_modal` in the same
            asm file), but MIN_CONSOLE_ID=1 and the plan's key table
            (§0) calls slot "1" the local shell conceptually, so treat
            active==1 as on-shell too, defensively.

        Any other active id (2..10) means a server console owns the
        screen right now -> skip. Any lookup failure (e.g. ConsoleManager
        not importable) fails closed (treated as "not on shell") so a
        broken signal can't cause the overlay to stomp on a console it
        doesn't own.

        # TODO(hw): confirm on real hardware that RESTORE_SCREEN always
        # fires when the user presses C=+CTRL+1 to return to local
        # (including power-cycle/reset edge cases) so `_active` reliably
        # clears; if some path skips it, add a heartbeat/timeout fallback
        # here instead of relying solely on the RESTORE_SCREEN hook.
        """
        try:
            from sdk.console_manager import ConsoleManager

            active = ConsoleManager.instance()._active.get(session_id)
        except Exception:
            logger.debug("TutorialSession._on_shell: ConsoleManager lookup failed", exc_info=True)
            return False
        return active is None or active == 1

    def _current_hint(self) -> str:
        """The current step's hint text, prefixed with a short step counter."""
        with self._lock:
            idx = self._step_index
            total = len(self.tutorial.steps)
            hint = self.tutorial.steps[idx].hint
        return f"[{idx + 1}/{total}] {hint}"

    # ------------------------------------------------------------------
    # Nav, called by the handler thread (not the poll thread)
    # ------------------------------------------------------------------

    def next(self) -> str:
        """Advance to the next step, or complete+stop if already on the last."""
        with self._lock:
            last_index = len(self.tutorial.steps) - 1
            if self._step_index >= last_index:
                self._completed = True
                ack = "Tutorial complete!"
            else:
                self._step_index += 1
                ack = f"Step {self._step_index + 1}/{len(self.tutorial.steps)}."

        if self._completed:
            self._repaint_best_effort(final_text="Tutorial complete! Type q.")
            self.stop()
            return ack

        self._repaint_best_effort()
        return ack

    def back(self) -> str:
        """Go back one step (floors at 0)."""
        with self._lock:
            self._step_index = max(0, self._step_index - 1)
            ack = f"Step {self._step_index + 1}/{len(self.tutorial.steps)}."
        self._repaint_best_effort()
        return ack

    def repeat(self) -> str:
        """Re-show the current step's hint (no index change)."""
        self._repaint_best_effort()
        return "Repeating hint."

    def show(self) -> str:
        """
        Demo the current step: type its `demo_keys` onto the C64 via
        `network_helper.send_c64_keyboard_input`. If the step has no
        `demo_keys`, do nothing and say so. Network errors (dead host)
        are swallowed -- `s` is a nav command, it must never raise back
        into the handler.
        """
        with self._lock:
            demo_keys = self.tutorial.steps[self._step_index].demo_keys

        if not demo_keys:
            return "No demo for this step."

        try:
            network_helper.send_c64_keyboard_input(demo_keys)
        except Exception:
            logger.debug("TutorialSession.show: send_c64_keyboard_input failed (host unreachable?)", exc_info=True)
            return "Couldn't reach the C64."

        return "Typing demo..."

    def is_completed(self) -> bool:
        with self._lock:
            return self._completed

    def _repaint_best_effort(self, final_text: Optional[str] = None) -> None:
        """
        Force an immediate repaint after a nav action, so the user sees
        the new hint without waiting a full poll interval. Best-effort --
        network errors are swallowed the same as the background tick.
        """
        if final_text is not None:
            try:
                host = network_helper.read_last_c64_ip()
                if not host:
                    return
                screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
                color_bytes = network_helper.dma_read_memory(host, COLOR_ADDR, SCREEN_LEN)
                scr = bytearray(screen_bytes)
                col = bytearray(color_bytes)
                paint_toaster(scr, col, final_text)
                network_helper.send_screen_data(bytes(scr), bytes(col))
            except Exception:
                logger.debug("TutorialSession: final repaint failed", exc_info=True)
            return

        self._safe_tick()
