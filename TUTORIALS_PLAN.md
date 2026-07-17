# HDN Shell RR — Interactive Tutorials: Implementation Plan

Status: design approved 2026-07-15. Execute the phases in order; each phase is a
self-contained, testable increment. Check items off as you go.

## 0. Background (read first — makes this plan self-contained)

**What the product is.** *HDN Shell RR* is the C64-side experience, delivered as
an upgraded **Retro Replay cartridge** (a "wedge"). You type at the ordinary BASIC
`READY.` prompt: recognised shell commands run in the cartridge, plain BASIC keeps
working, and anything neither understands is forwarded to the **HDN Server** — a
Python companion app the user runs on their own PC/Mac (repo dir `cloud/`; "cloud"
in the code is legacy naming, it is a *local* server, no SaaS/accounts). The C64
talks to the server, and the server talks to the C64 Ultimate ("C64U") hardware
over its REST API + a DMA service.

**Two kinds of server app** (`cloud/sdk/`):
- **Handlers** — text in / text out. Base `sdk.BaseHandler`; `can_handle(text)` +
  `handle(text)`. Registered in `cloud/request_dispatcher.py` in priority order;
  first match wins. Examples: `HelpHandler`, `ChatHandler`, `CSDBHandler`.
- **Consoles** — screen-based, own the full 40×25 display. Base `sdk.ServerConsole`.
  Reached via **console-switch keys** `C=+CTRL+<n>` (armed by typing `HONDANI`).

**Console slots** (all taken — that's why tutorials are command-launched, not a slot):

| Key | Console |
|---|---|
| `C=+CTRL+1` | Local shell (native BASIC `READY.` prompt) |
| `C=+CTRL+2` | File Editor |
| `C=+CTRL+3` | Coding Agent |
| `C=+CTRL+4` | Web Browser |
| `C=+CTRL+5` | Telegram |
| `C=+CTRL+6` | RSS Reader |
| `C=+CTRL+7` | Wikipedia |

**Existing tools the coach relies on.** The server can already **read the C64
screen** and **type keys** onto the C64 (used today by the AI assistant's
screen-read / type-keys tools). This plan reuses those low-level primitives
directly rather than the AI layer.

**Files you will touch / reference:**
- `cloud/request_dispatcher.py` — handler registry + the `active_module` "claim the
  line" fallback pattern (the model for routing nav commands).
- `cloud/handlers/help_handler.py` — reference for a clean `BaseHandler`.
- `cloud/sdk/network_helper.py` — the DMA/REST primitives (see §2).
- `cloud/sdk/server_console.py` — `show_toaster` + the toaster box renderer to factor out.
- `cloud/sdk/console_manager.py` — `ConsoleManager.instance()`; tracks the active
  console per session (for `active_console_is` verifies).
- `cloud/sdk/shared_state.py` — `get_session_state_copy` / `update_session_state`
  (per-session dict; already stores `active_module`, `dos_cwd`).
- `cloud/sdk/petscii.py` — screencode/PETSCII ↔ ASCII conversion (for the `Screen` decoder).
- `docs/user_manual/` — user docs; manifest `docs-manifest.json`; **must be mirrored
  to `cloud/static/docs/` after edits.**

**Testing constraint.** VICE **cannot** emulate the C64U (no REST/DMA/console
switching). Anything touching the screen-read/overlay/DMA path must be tested on
real C64U hardware. Pure-Python pieces (`Screen` decoder, verify predicates,
handler routing, menu text) are unit-testable off-hardware.

**Run the server locally for dev:** `cd cloud && make run-server` (source checkout,
not the GitHub release build).

## 1. Goal & UX

A newcomer types `tutorials` at the `READY.` prompt and gets a short menu. Typing
`tut1`..`tut5` starts a **guided coach** that walks them through a real task
*while they stay at the BASIC prompt*. The coach:

- shows the current step as a **toaster hint** overlaid on the live C64 screen
  (top-right box, non-destructive),
- **watches the real screen** (screen-read poll) and **auto-advances** the moment
  it detects the step was completed,
- can **demo** a step by typing the command for the user (existing type-keys tool),
- is driven by short **nav commands** typed at the prompt: `n` next, `b` back,
  `s` show me, `r` repeat, `q` quit.

Decisions locked in:
- **Full coached** tier (screen-read auto-advance + demo), not just static cards.
- **Toaster/status overlay** model — the coach never owns the screen; the prompt
  stays fully usable so the user builds muscle memory on real commands.

## 2. Architecture

The coach is **not** a `ServerConsole` (those own the 40×25 screen; the shell,
console slot 1, is native BASIC that the server does not render). It is a new
pattern: a **per-session background runner** attached to the shell.

```
  READY.  --tutorials-->  TutorialHandler (text in/out)  -->  menu text
  READY.  --tut1-------->  TutorialHandler starts TutorialSession (bg thread)
                                     |
                                     v
                    TutorialSession.run() loop (every ~1.5 s):
                      1. host = read_last_c64_ip()
                      2. screen = dma_read_memory(host, $0400, 1000)
                         color  = dma_read_memory(host, $D800, 1000)
                      3. if active console != shell: skip overlay this tick
                      4. if step.verify(screen): advance step
                      5. overlay hint box into (screen,color) copy;
                         send_screen_data(overlaid_screen, overlaid_color)
  READY.  --n/b/s/q/r-->  TutorialHandler routes nav to the live TutorialSession
```

Key building blocks that already exist (`cloud/sdk/network_helper.py`):
- `read_last_c64_ip()` — the C64U host.
- `dma_read_memory(host, addr, length)` — read live C64 memory (screen `$0400`,
  color `$D800`, each 1000 bytes).
- `send_screen_data(screen_bytes, color_bytes)` — DMA-push a full 40×25 frame.
- `send_c64_keyboard_input(data, host)` — type keys onto the C64 (for `s`/demo).

The dispatcher's existing "active module claims the line" mechanism
(`cloud/request_dispatcher.py`, the `active_module` fallback) is the model for
routing nav commands to an active tutorial.

## 3. New / changed files

| File | Purpose |
|---|---|
| `cloud/handlers/tutorial_handler.py` | NEW. `can_handle` for `tutorials`/`tut<N>`/nav; starts/stops sessions; returns menu + status text. |
| `cloud/tutorials/__init__.py` | NEW. Tutorial registry (`TUTORIALS: dict[str, Tutorial]`). |
| `cloud/tutorials/model.py` | NEW. `Tutorial`, `Step` dataclasses; `verify` predicate helpers over the screen buffer. |
| `cloud/tutorials/session.py` | NEW. `TutorialSession` background runner (poll loop, overlay, advance, demo). |
| `cloud/tutorials/content.py` | NEW. The five tutorials as data (steps: hint / verify / demo_keys). |
| `cloud/request_dispatcher.py` | EDIT. Register `TutorialHandler` (before Chat/CSDB/NetDrive catch-alls, next to `HelpHandler`). |
| `cloud/sdk/shared_state.py` | EDIT (maybe). Add `tutorial_active`, `tutorial_id`, `tutorial_step` session fields if not free-form. |
| `docs/user_manual/tutorials.md` | NEW. User-facing doc; add to `docs-manifest.json` + mirror to `cloud/static/docs/`. |
| `cloud/test_tutorial_handler.py` | NEW. Unit tests (menu, nav routing, verify predicates with fake screens). |

## 4. Data model

```python
# cloud/tutorials/model.py
@dataclass
class Step:
    hint: str                       # <=~120 chars; wrapped into the toaster box
    verify: Callable[[Screen], bool] # given decoded screen text/grid -> done?
    demo_keys: Optional[bytes] = None  # PETSCII to type when user presses 's'
    on_enter: Optional[Callable] = None  # optional side effect (rare)

@dataclass
class Tutorial:
    id: str            # "tut1"
    title: str         # "Disks & games: browse, mount, run"
    blurb: str         # one line for the menu
    steps: list[Step]
    requires: list[str] = field(default_factory=list)  # e.g. ["mkdisk","web-search"]
```

`Screen` is a small helper wrapping the 1000-byte screencode buffer with a
`text` property (PETSCII/screencode → ASCII, whitespace-normalised) so verify
predicates can just do `"free" in s.text.lower()` or regex. Put the decoder in
`model.py` reusing `sdk/petscii.py`.

**Verify predicate library** (in `model.py`, keep them tiny + reusable):
- `screen_contains(*substrings)` — any/all substring present (case-insensitive).
- `screen_matches(regex)`.
- `prompt_device_is(letter)` — detect current drive from the shell prompt line.
- `active_console_is(n)` — read `ConsoleManager.instance()` active id for the session.
- `always_manual()` — never auto-advances; user must press `n` (for narration-only
  steps like tut5's "look at this").

## 5. The coach runner (`session.py`)

Responsibilities:
1. **Lifecycle**: `start()` spawns a daemon thread; `stop()` sets a flag and joins.
   One session per `session_id`; starting a new `tutN` stops any prior one.
2. **Poll loop** (~1.5 s cadence — tune; must be gentle on the REST API):
   - read screen+color; build `Screen`.
   - if the active console for this session is **not** the shell, skip overlay +
     verify this tick (don't stomp on File Editor/Browser/etc.).
   - run `step.verify(screen)`; on True, advance and reset the "just advanced"
     toaster so the user sees the next hint immediately.
   - overlay the hint box and `send_screen_data`. **Save/restore is implicit**:
     we always start from the freshly-read live buffer, so BASIC's own output is
     preserved except the ≤6×26 top-right box, which is re-derived every tick.
3. **Overlay renderer**: port the toaster box geometry from
   `ServerConsole.show_toaster`/render (top-right, dark-gray bg, white text, word
   wrap at 26 cols). Factor the pure "paint box into (screen,color) arrays"
   routine so both the console toaster and the coach share it.
4. **Nav handling** (called by the handler, not the thread):
   - `n` → advance (or finish if last); `b` → previous; `r` → re-show hint;
   - `s` → if `demo_keys`, `send_c64_keyboard_input(demo_keys)`;
   - `q` → stop + clear overlay (push one clean frame from the live read).
5. **Completion**: after the last step, show a "✓ done" toaster for a few ticks,
   then stop.

Thread-safety: guard step index + nav with a `threading.Lock`. The handler
thread and the poll thread both touch it.

## 6. Handler & routing (`tutorial_handler.py` + dispatcher)

`can_handle(text)` returns True when the trimmed lower text is:
- `tutorials` / `tutorial` / `tut` (menu),
- `tut1`..`tut5` (start), or
- a nav command **only while a tutorial is active for this session**
  (`n`,`b`,`s`,`r`,`q` and spelled-out `next`,`back`,`show`,`quit`).

`handle(text)`:
- menu → return `format_menu()` (see §7).
- `tutN` → stop any active session, `TutorialSession(id, session_id).start()`,
  set session state `tutorial_active=True, tutorial_id=id`; return a one-line
  "Started tutN. Do the steps; type q to quit." (the real UI is the overlay).
- nav → forward to the live session; return short ack text.

Register in `request_dispatcher.py` right after `HelpHandler()` so it is checked
before the Chat/CSDB/NetDrive catch-alls. Mirror the existing ordering comment.

Store active-tutorial flags via `update_session_state` /
`get_session_state_copy` (same API used for `dos_cwd`/`active_module`). The
running `TutorialSession` objects themselves live in a module-level
`{session_id: TutorialSession}` registry in `session.py`.

## 7. The `tutorials` menu (server → C64)

```
HDN Shell RR - Tutorials

 tut1  Disks & games: browse, mount, run
 tut2  Getting help
 tut3  Ask me anything (AI chat & tools)
 tut4  Find a demo on CSDB, run & keep it
 tut5  Live on your C64 (the full tour)

Type e.g. tut1 to start.
In a tutorial: n next, b back,
s show me, r repeat, q quit.
```

## 8. Tutorial content (`content.py`)

Each step below lists **hint** (toaster text) / **verify** (auto-advance
condition) / **demo** (what `s` types). Keep hints ≤ ~4 wrapped lines.

### tut1 — Disks & games: browse, mount, run  *(no external deps)*
1. hint "Pick a drive: type `#u` (USB) or `#s` (SD)." · verify `prompt_device_is('u'|'s'|'t'|'f'|'h')` · demo `#u`
2. hint "Type `ll` to list this drive." · verify screen shows a listing (≥3 lines with file sizes / `.d64`/`.prg`) · demo `ll`
3. hint "Too many? `ll a*` filters by prefix." · verify `screen_contains via ll <prefix>` result changed · demo `ll a*` · (optional — allow `n` to skip)
4. hint "Mount a disk image: put `mnt` in front of its name, e.g. `mnt game.d64`. Case doesn't matter." · verify screen shows mount confirmation / no error · demo `mnt` (leave name to user)
5. hint "See inside the disk: `$` or `ll`." · verify listing present after mount · demo `$`
6. hint "Run the first program: `^*` (or `^name`)." · verify screen leaves BASIC listing / program starts (heuristic: screen clears or fills) · demo `^*`
7. hint "The shell stepped aside so the game runs clean. Back at BASIC, type `HONDANI` to re-arm the app keys. Done — press q." · verify `always_manual` · demo `HONDANI`

### tut2 — Getting help  *(no external deps; build FIRST)*
1. hint "Type `help` for the command cheat-sheet." · verify `screen_contains("HDN Shell","Help")` · demo `help`
2. hint "Type `help topics`, then `help <topic>`." · verify `screen_contains("Help topics")` · demo `help topics`
3. hint "Search the manual raw: `m:memcpy`." · verify `screen_contains("memory-operations","memcpy")` · demo `m:memcpy`
4. hint "Just ask! Anything unrecognised goes to the AI. Try: `how do I mount a disk?` Press q when done." · verify `always_manual` · demo `how do i mount a disk?`

### tut3 — Ask me anything (AI chat & tools)  *(needs web-search key + Web Remote Control)*
1. hint "Ask a question: `i:how much is 96-32?` (the `i:` is optional)." · verify screen shows `64` · demo `i:how much is 96-32?`
2. hint "Search the web: `i:latest C64 demo winners`." · verify a multi-line AI answer appears · demo `i:latest c64 demo winners`
3. hint "Leave an error on screen, then ask `i:what's on my screen?`" · verify AI answer references screen content · demo `i:what is on my screen?`
4. hint "Let it drive: `i:list the files on this disk` — watch it type `ll`." · verify a directory listing appears · demo `i:list the files here`
5. hint "It can also read/modify C64 memory and remember your prefs. See the manual. Press q." · verify `always_manual`
   - **Gate**: on start, if web-search / remote-control not configured, show a hint pointing to Settings and mark steps 2–4 as skippable with `n`.

### tut4 — Find a demo on CSDB, run it, and keep it  *(BLOCKED on `mkdisk`; also verify csdb run syntax)*
1. hint "Search CSDB: `c:latest releases` or `c:booze design`." · verify `screen_contains("csdb"|release names)` · demo `c:latest releases`
2. hint "Open a release from the list." · verify release detail on screen · demo (depends on csdb.md syntax — CONFIRM)
3. hint "Run it now." · verify program starts · demo (CONFIRM)
4. hint "Keep it — make a disk: `mkdisk demos.d81`." · verify disk-created confirmation · demo `mkdisk demos.d81`  · **needs TODO mkdisk**
5. hint "Copy the demo onto it, then `mnt demos.d81`." · verify mount ok · demo `mnt demos.d81`
6. hint "Next time, no internet: `mnt demos.d81` then `^*`. Press q." · verify `always_manual`

### tut5 — Live on your C64 (the full tour)  *(mostly narration; verify via active console)*
1. hint "Type `HONDANI` to unlock the app keys." · verify `screen_contains` re-arm ack or `always_manual` · demo `HONDANI`
2. hint "Web browser: press C=+CTRL+4. Real web pages!" · verify `active_console_is(4)`
3. hint "Telegram: C=+CTRL+5. Read & reply to chats." · verify `active_console_is(5)`
4. hint "News: C=+CTRL+6 (RSS)." · verify `active_console_is(6)`
5. hint "Wikipedia: C=+CTRL+7." · verify `active_console_is(7)`
6. hint "Coding Agent: C=+CTRL+3. Describe a program, it builds & runs it." · verify `active_console_is(3)`
7. hint "Home: C=+CTRL+1. That's your whole computer — no PC. 😎 Press q." · verify `active_console_is(1)` then `always_manual`

## 9. Build phases (execute in order)

**Phase 0 — scaffolding** ✅
- [x] Create `cloud/tutorials/` package: `model.py` (`Step`, `Tutorial`, `Screen`,
      verify helpers), empty `content.py`, `__init__.py` with `TUTORIALS = {}`.
- [x] Unit-test the `Screen` decoder + `screen_contains`/`screen_matches` against
      hand-built 1000-byte buffers. No hardware needed.

**Phase 1 — menu + handler (no coach yet)** ✅
- [x] `tutorial_handler.py`: `can_handle` for `tutorials`/`tut<N>`; `handle`
      returns the §7 menu and a stub "not yet implemented" for `tutN`.
- [x] Register in `request_dispatcher.py`.
- [x] Test on real C64U: `tutorials` prints the menu. (VICE can't emulate the
      C64U DMA/REST path — go straight to hardware.)

**Phase 2 — coach runner, MVP overlay (manual advance only)** ✅
- [x] Factor the toaster box painter out of `ServerConsole` into a shared
      `paint_toaster(screen, color, text)` in `sdk/`.
- [x] `session.py`: poll loop that reads the screen and re-paints the current
      step's hint each tick; nav `n`/`b`/`r`/`q` via the handler. **No verify yet**
      (every step is `always_manual`).
- [x] Wire `tut2` content with `always_manual` verifies.
- [x] Hardware test: `tut2`, walk with `n`/`b`, `q` clears the overlay cleanly.
- [x] Confirm the overlay survives BASIC redraws and doesn't corrupt typing.

**Phase 3 — screen-read auto-advance + demo** ✅
- [x] Add real `verify` predicates; auto-advance when matched. Hardware testing
      (2026-07-16) found two real bugs beyond the plan's scope and fixed them:
      a self-read cascade (the coach matching its own painted hint text) and
      pre-existing-content false positives (a step's verify already true from
      unrelated leftover screen content) -- see `session.py`'s module
      docstring for `_verify_view()`/`_latch_entry_satisfied()`. Also changed
      the advance UX from "auto-advance the index" to two-state SHOWING/CONFIRM
      (only `n` ever moves the index) per user feedback that toasts moved too
      fast.
- [x] Implement `s` → `send_c64_keyboard_input(step.demo_keys)`.
- [x] Add the "active console != shell → skip overlay" guard.
- [x] Finish `tut2` verifies; add `tut1`; hardware-test both end to end.

**Phase 4 — remaining tutorials** ✅ (2026-07-17)
- [x] `tut5` (active-console verifies). Required a real fix, not just content:
      `active_console_is()`'s `session_id` can't be baked in at content.py
      authoring time (Tutorial/Step objects are shared across every session),
      so it now tags its closure with a `_console_id` marker that
      `TutorialSession._run_verify()` resolves against *this session's*
      `session_id`. Also found and fixed a real conflict: the off-shell guard
      returned before ever calling `verify()`, but tut5's whole premise is
      detecting the user switching INTO a server console -- exactly the
      transition that makes `_on_shell()` False. `_check_console_marker_step()`
      is the narrow, screen-free exception (console-tour steps don't read the
      screen at all, so they're safe to check off-shell; every other,
      content-reading verify predicate still only runs on-shell).
- [x] `tut3` -- deterministic steps (the arithmetic question, "list the files")
      auto-verify; open-ended AI-response steps (web search, screen reading)
      are `always_manual()` with "press n to skip" in the hint rather than a
      full capability-gate system, matching tut1's existing pattern for
      unpredictable-output steps.
- [x] `tut4` -- built against the real documented CSDB workflow
      (`docs/user_manual/csdb.md`) and confirmed `mkdisk`/`mnt`/`cp` semantics,
      not the plan's placeholder syntax. Note: `cp` only bridges Ultimate
      `/temp` with a server-backed device (`n`/`c`) -- it cannot copy onto a
      mounted disk image directly -- so "keep it" uses plain BASIC
      `LOAD`/`SAVE` across two IEC devices instead of an unsupported `cp`
      variant. `mkdisk` already ships, so no `requires=["mkdisk"]` gate needed.

**Phase 5 — docs & polish**
- [ ] `docs/user_manual/tutorials.md`; add to `docs-manifest.json` and
      `search-index.json`; **mirror to `cloud/static/docs/`** (keep in sync — see
      product memory).
- [ ] Add a `tutorials` line to `help` output (`HelpHandler.HELP_TEXT`) and to
      `using-the-shell.md`.
- [ ] Tune poll cadence + toaster duration for feel; make sure the coach stops on
      session reset / power cycle (clear stale registry on disconnect).

## 10. Risks & things to confirm during build

1. **Active-console detection for the shell (slot 1).** Verify whether the server
   tracks `_active[session]=1` when the user is at BASIC, or whether slot 1 never
   goes through `ConsoleManager`. If untracked, the "skip overlay off-shell" guard
   needs another signal (e.g. last console-switch packet seen). Resolve in Phase 3.
2. **REST poll load.** ~1.5 s screen reads over the C64U REST API — watch latency
   and error handling (host unreachable → pause, don't crash the thread).
3. **Overlay vs. cursor.** The C64 keeps a live cursor; make sure the top-right box
   never overlaps the input line, and that a redraw doesn't leave box fragments.
4. **Nav-command collisions.** `n`/`b`/`s`/`q`/`r` must only be claimed while a
   tutorial is active, or they'd shadow real one-letter uses / BASIC. Gate strictly
   on `tutorial_active` in `can_handle`.
5. **`tut4` dependencies.** Blocked on `mkdisk`; also the CSDB open/run syntax must
   be read from `csdb.md` before writing demo keys.
6. **Thread cleanup.** A power cycle or `reset` must stop the runner and drop the
   registry entry; otherwise a zombie thread keeps DMA-pushing to a fresh session.

## 11. Definition of done

- `tutorials` menu works; `tut1`, `tut2`, `tut5` are fully coached (auto-advance +
  demo) on real hardware; `tut3` works when capabilities are configured; `tut4`
  ships with its `mkdisk` step enabled once that command lands.
- Overlay is non-destructive; `q` always returns a clean prompt.
- Docs updated and mirrored; `help` mentions `tutorials`.
