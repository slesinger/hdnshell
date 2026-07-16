"""
TutorialSession: the coach's per-session background runner.

Phase 3 (screen-read auto-advance + demo -- TUTORIALS_PLAN.md §9 Phase 3):
polls the live C64 screen, calls the current step's `verify(screen)` and
overlays the current step's hint into the top-right toaster box, and lets
the handler drive manual nav (`n`/`b`/`r`/`s`/`q`). `s` types the step's
`demo_keys` onto the C64 via `network_helper.send_c64_keyboard_input`.

Key-confirmed advance (hardware bug-fix pass, 2026-07-16). Two real bugs
were found on hardware and fixed here together, because the fix for one
enables the fix for the other:

1. **Self-read.** `_tick()` DMA-writes the hint box into C64 screen RAM,
   then the NEXT tick DMA-reads that same RAM back -- so the coach was
   reading its own toast text (and even its OWN hint's wording) and
   matching it against `verify()`. See `_verify_view()`/`_blank_rect()`:
   every tick, the `Screen` handed to `verify()` has the coach's own box
   region blanked out (both the rect physically on screen from last
   tick, `_last_box_rect`, and the rect this tick is about to paint) so
   no hint text the coach itself wrote can ever satisfy a predicate.
2. **Pre-existing content.** Even with (1) fixed, a step can become
   current while its own verify predicate is *already* true because of
   unrelated leftover screen content (e.g. the tutorials menu header
   still on screen, or a previous step's `help`-family output still
   containing a later step's keyword). See `_latch_entry_satisfied()`:
   the moment a step becomes current, its verify result is snapshotted
   into `_entry_satisfied`; a tick only fires once that snapshot has
   gone False and then True again -- a genuine transition, not a stale
   match. Bias is deliberately toward suppression: a *missed*
   auto-detect costs the user nothing (`n` is the same key they'd press
   to confirm anyway), a *false* "done" is actively confusing.

On top of those two correctness fixes, the auto-advance UX itself
changed (the "toasts move forward too quick" complaint): the coach no
longer advances the step index by itself at all. Each step has two
display states -- SHOWING (the hint) and CONFIRM (verify fired; "Press n
for next", index unchanged) -- and only `next()` (the `n` nav command,
called by the handler thread) ever moves `_step_index`. See
`_current_hint()` for the two texts and `next()`/`back()` for the state
transitions.

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
from typing import Dict, Optional, Tuple

from sdk import network_helper
from sdk.toaster import SCREEN_COLS, SCREEN_ROWS, paint_toaster, toaster_box_rect

from .model import Screen, Tutorial

logger = logging.getLogger(__name__)

SCREEN_ADDR = 0x0400
COLOR_ADDR = 0xD800
SCREEN_LEN = 1000

# Screen code for a blank cell -- used both by the toaster box painter and
# by `_blank_rect()` below to erase the coach's own overlay from the view
# `verify()` sees.
_BLANK_SCREENCODE = 0x20

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


def _blank_rect(buf: bytearray, rect: Optional[Tuple[int, int, int, int]]) -> None:
    """
    Overwrite every screen cell inside `rect` = (row, col, height, width)
    with the blank screen code (0x20), in place.

    `rect` may be None (no-op -- e.g. `toaster_box_rect()` returns None
    when its text wraps to nothing). Row/col are clamped to the 40x25
    grid so an out-of-range rect can't corrupt adjacent memory. Pure and
    independently testable -- no lock, no I/O.
    """
    if rect is None:
        return
    row, col, height, width = rect
    for r in range(row, row + height):
        if not (0 <= r < SCREEN_ROWS):
            continue
        base = r * SCREEN_COLS
        for c in range(col, col + width):
            if 0 <= c < SCREEN_COLS:
                buf[base + c] = _BLANK_SCREENCODE


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

        # Key-confirmed advance state (Task 3): True once the current
        # step's verify has fired; only next()/back() ever clear it (by
        # moving to a different step). _current_hint() reads this to pick
        # SHOWING vs CONFIRM text.
        self._confirmed = False
        # Entry-suppression latch (Task 2): "was the current step's
        # verify already true the moment it became current". See
        # _latch_entry_satisfied().
        self._entry_satisfied = False
        # The (row, col, height, width) box rect actually painted onto
        # the live screen by the most recent paint_toaster() call --
        # what's physically on screen right now. See _verify_view().
        self._last_box_rect: Optional[Tuple[int, int, int, int]] = None

    # ------------------------------------------------------------------
    # Lifecycle
    # ------------------------------------------------------------------

    def start(self) -> None:
        """
        Spawn the daemon poll thread. Safe to call once per instance.

        Before spawning, snapshots verify() against whatever's on screen
        right now via `_latch_entry_satisfied()` ("on start", Task 2) so
        step 1 doesn't fire CONFIRM on the very first tick just because
        its condition happened to already be true (e.g. leftover screen
        content). Best-effort/synchronous -- see that method's docstring;
        a slow/unreachable host just means step 1 falls back to the
        ordinary per-tick edge-trigger instead of an entry snapshot.
        """
        with self._lock:
            if self._running:
                return
            self._running = True
        self._latch_entry_satisfied()
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
    # The poll iteration (verify + CONFIRM latch + overlay)
    # ------------------------------------------------------------------

    def _tick(self) -> None:
        """
        One poll iteration:
          1. read the live screen+color.
          2. if the user isn't at the shell (`_on_shell()` is False),
             return without painting/verifying -- a server console owns
             the display right now (plan §5.2).
          3. build the verify-facing `Screen` with the coach's own
             overlay blanked out (`_verify_view()` -- see Task 1 in the
             module docstring: prevents the self-read bug).
          4. unless already CONFIRMed, or this is the last step (last
             steps are manual/"press q" -- `always_manual()` is always
             False so this rarely matters in practice), call
             `step.verify()` best-effort (a predicate that raises is
             logged and treated as False so a buggy verify can never
             crash the poll thread) and apply the entry-suppression edge
             trigger (Task 2): only transition SHOWING -> CONFIRM when
             `_entry_satisfied` is False and verify is True; if verify
             goes False, clear `_entry_satisfied` so a later genuine
             match can still fire. The step index itself never changes
             here -- only `next()`/`back()` (the `n`/`b` nav commands)
             move it (Task 3).
          5. paint the current hint (SHOWING or CONFIRM text) and push
             the frame back; remember the box rect actually painted.
        """
        host = network_helper.read_last_c64_ip()
        if not host:
            return  # nothing to draw against

        screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
        color_bytes = network_helper.dma_read_memory(host, COLOR_ADDR, SCREEN_LEN)

        if not self._on_shell(self.session_id):
            return  # a server console owns the screen right now -- don't stomp on it

        with self._lock:
            already_confirmed = self._confirmed

        if not already_confirmed:
            verify_screen = self._verify_view(screen_bytes)
            result = self._run_verify(verify_screen)
            with self._lock:
                if self._entry_satisfied:
                    if not result:
                        self._entry_satisfied = False  # stale match cleared; a later True can now fire
                elif result:
                    self._confirmed = True  # genuine transition -> CONFIRM (index unchanged)

        scr = bytearray(screen_bytes)
        col = bytearray(color_bytes)
        hint_text = self._current_hint()
        paint_toaster(scr, col, hint_text)
        with self._lock:
            self._last_box_rect = toaster_box_rect(hint_text)
        network_helper.send_screen_data(bytes(scr), bytes(col))

    def _run_verify(self, verify_screen: Screen) -> bool:
        """
        Call the current step's `verify(verify_screen)`, best-effort: an
        exception is logged and treated as False. The last step's verify
        is never evaluated -- last steps are manual ("press q"), so they
        never enter CONFIRM via auto-detect.
        """
        with self._lock:
            idx = self._step_index
            last_index = len(self.tutorial.steps) - 1
            if idx >= last_index:
                return False
            step = self.tutorial.steps[idx]
        try:
            return bool(step.verify(verify_screen))
        except Exception:
            logger.debug("TutorialSession: step.verify raised", exc_info=True)
            return False

    def _verify_view(self, screen_bytes) -> Screen:
        """
        Build the `Screen` that `verify()` is allowed to see this tick: a
        copy of the freshly-read screen buffer with the coach's own
        overlay box blanked out, so no hint/toast text the coach itself
        painted can ever satisfy a predicate (the hardware self-read bug
        -- see the module docstring's Task 1).

        Blanks the UNION of:
          - `self._last_box_rect`: the box actually painted last tick
            (what's physically on the live screen right now).
          - `toaster_box_rect(self._current_hint())`: the box this tick
            is about to paint, computed from the pre-transition hint
            (verify hasn't run yet at this point) -- a close-enough
            prediction; if verify DOES fire this tick the box that
            actually gets painted (CONFIRM text) is caught next tick by
            `_last_box_rect` regardless.

        Only this verify-facing copy is blanked; the real `screen_bytes`
        used for painting is left untouched.

        # TODO(hw): if BASIC scrolls the screen, a *scrolled* remnant of
        # an older box could sit outside both of these fixed rects and
        # still self-match. This fixed-rect blank doesn't catch that --
        # known residual, not solved here.
        """
        blanked = bytearray(screen_bytes)
        with self._lock:
            last_rect = self._last_box_rect
        _blank_rect(blanked, last_rect)
        _blank_rect(blanked, toaster_box_rect(self._current_hint()))
        return Screen(bytes(blanked))

    def _latch_entry_satisfied(self) -> None:
        """
        Snapshot "was this step's verify already true the moment it
        became current" into `_entry_satisfied`. Called whenever a step
        becomes current: session construction ("on start"), and every
        `next()`/`back()`.

        Rationale (Task 2): a step can become current while its own
        verify predicate is ALREADY true from pre-existing screen
        content that has nothing to do with the user just having done
        this step (leftover output from a previous command, a menu
        header still on screen, ...). Latching that as "already true"
        here means `_tick()` treats it as a stale pre-existing match and
        won't fire CONFIRM until the predicate goes False and then True
        again -- a genuine transition.

        Best-effort: if the live screen can't be read right now (no
        host configured / DMA error), this defaults `_entry_satisfied`
        to False and lets the next successful tick settle it for real,
        rather than crashing. A missed auto-detect costs the user
        nothing (`n` is the same key they'd press to confirm anyway); a
        false "done" is actively confusing -- so this deliberately
        biases toward suppression, not toward firing.
        """
        entry_satisfied = False
        try:
            host = network_helper.read_last_c64_ip()
            if host:
                screen_bytes = network_helper.dma_read_memory(host, SCREEN_ADDR, SCREEN_LEN)
                entry_satisfied = self._run_verify(self._verify_view(screen_bytes))
        except Exception:
            logger.debug("TutorialSession: entry-suppression latch failed (host unreachable?)", exc_info=True)
            entry_satisfied = False

        with self._lock:
            self._entry_satisfied = entry_satisfied

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
        """
        The text painted into the toaster box this tick, prefixed with a
        short step counter -- either the current step's SHOWING hint, or
        (once verify has fired for this step -- see `_confirmed`) the
        CONFIRM prompt telling the user to press `n`.
        """
        with self._lock:
            idx = self._step_index
            total = len(self.tutorial.steps)
            confirmed = self._confirmed
            hint = self.tutorial.steps[idx].hint
        if confirmed:
            # Plain ASCII only -- ascii_to_screencode() has no mapping for
            # a unicode checkmark (falls back to a space), so this stays
            # ASCII rather than rendering as "Press n for next." with a
            # blank where a checkmark was intended.
            return f"[{idx + 1}/{total}] Done! Press n for next."
        return f"[{idx + 1}/{total}] {hint}"

    # ------------------------------------------------------------------
    # Nav, called by the handler thread (not the poll thread)
    # ------------------------------------------------------------------

    def next(self) -> str:
        """
        Advance to the next step in SHOWING state, or complete+stop if
        already on the last step. This is the ONLY way the step index
        moves (Task 3) -- from CONFIRM it's the user's explicit
        confirmation; from SHOWING it's a manual skip (always allowed,
        the user can move on whenever they like).
        """
        with self._lock:
            last_index = len(self.tutorial.steps) - 1
            if self._step_index >= last_index:
                self._completed = True
                ack = "Tutorial complete!"
            else:
                self._step_index += 1
                self._confirmed = False
                ack = f"Step {self._step_index + 1}/{len(self.tutorial.steps)}."

        if self._completed:
            self._repaint_best_effort(final_text="Tutorial complete! Type q.")
            self.stop()
            return ack

        self._latch_entry_satisfied()
        self._repaint_best_effort()
        return ack

    def back(self) -> str:
        """Go back one step (floors at 0), into SHOWING state, re-latching entry suppression."""
        with self._lock:
            self._step_index = max(0, self._step_index - 1)
            self._confirmed = False
            ack = f"Step {self._step_index + 1}/{len(self.tutorial.steps)}."
        self._latch_entry_satisfied()
        self._repaint_best_effort()
        return ack

    def repeat(self) -> str:
        """Re-show the current step's hint/state (no index change)."""
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
                with self._lock:
                    self._last_box_rect = toaster_box_rect(final_text)
                network_helper.send_screen_data(bytes(scr), bytes(col))
            except Exception:
                logger.debug("TutorialSession: final repaint failed", exc_info=True)
            return

        self._safe_tick()
