"""
TutorialSession: the coach's per-session background runner.

Phase 2 (MVP overlay, manual advance only -- TUTORIALS_PLAN.md §9 Phase 2):
polls the live C64 screen, re-paints the current step's hint into the
top-right toaster box every tick, and lets the handler drive step
navigation (`n`/`b`/`r`/`s`/`q`). Auto-advance via `Step.verify` and the
real `s` demo-typing land in Phase 3 -- `_tick()` intentionally never
calls `step.verify` yet.

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
    # The poll iteration (Phase 2: render only, no verify/auto-advance)
    # ------------------------------------------------------------------

    def _tick(self) -> None:
        """
        One poll iteration: read the live screen, paint the current step's
        hint into the top-right toaster box, and push it back.

        Phase 2 intentionally does NOT call `step.verify` / auto-advance --
        every step behaves as manual-advance regardless of what its
        `verify` predicate actually is. Real verify wiring is Phase 3.
        """
        host = network_helper.read_last_c64_ip()
        if not host:
            return  # nothing to draw against

        screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
        color_bytes = network_helper.dma_read_memory(host, COLOR_ADDR, SCREEN_LEN)

        # Screen() is built for parity with future (Phase 3) verify calls
        # even though _tick doesn't consult it yet.
        Screen(screen_bytes, color_bytes)

        scr = bytearray(screen_bytes)
        col = bytearray(color_bytes)
        paint_toaster(scr, col, self._current_hint())
        network_helper.send_screen_data(bytes(scr), bytes(col))

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
        Phase 2 stub: real `demo_keys` typing lands in Phase 3. Does not
        type anything onto the C64.
        """
        return "(demo comes in Phase 3)"

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
