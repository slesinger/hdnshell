# Launcher

The **Launcher** is the home screen for HDN Shell's console apps — a browsable
catalog of every server app with short descriptions, live badges, and a
dashboard header. It replaces the need to memorise which digit opens which app.

Open it with **C=+CTRL+1**. Return to the local C64 shell with **C=+CTRL+←**
(the back-arrow key, left of `1`).

## What it shows

- **Dashboard band** (top): the time and date, a server-reachable indicator,
  and an aggregate count of unread items across your apps.
- **Catalog list** (left): every registered app, one per row. A pinned app
  shows its digit chip — `[3]` — so you can *learn* the shortcut. Apps with
  activity show a **badge**: a count (e.g. Telegram `3`) or a state (e.g.
  Coding Agent `running`).
- **Detail pane** (right): the highlighted app's description and pin status.

## Keys

| Key | Action |
| --- | --- |
| `↑` / `↓` | Move the highlight |
| `RETURN` | Open the highlighted app |
| `1`–`7`, `0` | **Pin** the highlighted app to that digit slot (`0` = slot 10) |
| `x` | Unpin the highlighted app |
| `/` | Filter the list by title/description (DEL backspaces, RETURN closes) |

## Pins (the hotbar)

The `C=+CTRL+<digit>` shortcuts are user-configurable **pins** into the catalog
rather than fixed app identities. A fresh install ships with the historical
default layout:

| Slot | Default app |
| --- | --- |
| 1 | Launcher (always) |
| 2 | File Editor |
| 3 | Coding Agent |
| 4 | Web Browser |
| 5 | Telegram |
| 6 | RSS Reader |
| 7 | Wikipedia |
| 0 | Vibe Chat (slot 10) |

Pinning from the Launcher takes effect immediately and persists across restarts
(stored in `workspace/.config/launcher.json`). Pressing `C=+CTRL+<digit>` for a
slot with **no** app assigned opens the Launcher pre-highlighting that empty
slot, so you can pick an app and pin it.

## Recents / resume

The Launcher remembers the last app you opened. Opening the Launcher (home) and
pressing `RETURN` returns you to it quickly.

---

## Implementation status

The **server side is complete** and unit-tested (`cloud/test_launcher.py`):

- App catalog / registry — `cloud/sdk/app_registry.py`
- Config-driven pins + recents — `cloud/sdk/launcher_config.py`
- `LauncherConsole` — `cloud/server-apps/launcher.py`
- Per-app badge API — `ServerConsole.get_badge()` (Telegram, Coding Agent
  implemented; other apps opt in over time)
- Factory map built from registry + pins — `cloud/cloud_server.py`

### Remaining: wedge (C64) integration — real-hardware only

The C64-side chord decode changes (issue #22 §4) are **not yet made** because
they cannot be verified in VICE (no C64U DMA/REU emulation) and touch the
byte-tight bank-2 layout with pinned symbol addresses. They must be done and
smoke-tested on real hardware:

1. **`C=+CTRL+←` → local.** Handle matrix code `57` in `cs_modal` to run the
   existing "return to local" path (`scr_restore`, `w_console=$00`).
2. **`C=+CTRL+1` → Launcher (console 1).** Remove the index-0 early-returns in
   `console_switch` (`cpx #$00 / beq csw_ret`) and `cm_match`
   (`cpx #$00 / bne cm_server`) so index 0 drives console nibble `$10`. Keep
   pinned symbols in place with padding (see `wedge/space_map.md`).
3. **`RETURN`-to-open** needs no wedge change: the server DMA-writes
   `w_console = $03EF` to `N<<4` and paints console `N`; `cs_modal` keeps
   routing keys there. `LauncherConsole._route_and_paint()` already does this
   (best-effort, a no-op off hardware).
4. **Unassigned-digit fall-through** is fully server-side — an unpinned slot's
   factory is `LauncherConsole` opened at that slot.

HW smoke checklist: `←`→local, `1`→launcher, `RETURN`-open via `$03EF`,
unassigned-digit fall-through, re-arm-after-`HONDANI` unchanged.
