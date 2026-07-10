# HONDANI Wedge — Next Steps: the local shell command set (steps 11+)

Continuation of `conversion_log.md`. Steps 0–10 are done: `HONDANI <text>`,
auto-dispatch of any unrecognized direct-mode line to the AI, and console
switching (`C=+CTRL+1..7`, steps 10a–10d). **Console switching = item 1 of the
roadmap; considered DONE once 10d passes hardware test** (the deferred per-line
re-arm / disarm-on-LOAD-RUN is out of scope — it needs bank1, which stays FROZEN).

This document plans the remaining shell commands as small, byte-diff-verified,
hardware-tested steps, in the SAME discipline that has kept the cartridge stock
so far. Every step will have to be verified by Honza on real hardware before the next step is attempted to avoid bugs accumulation which will not be possible to fix later.

## Progress Tracking

| Step ID | Change | HW Test Expectation | Status |
|---|---|---|---|
| 11 | Lift error dispatcher into bank3 (behavior-preserving) | Full step-9b regression suite unchanged: `HELLO WORLD` → reply + `READY.`; `PRINT 1/0` → `?DIVISION BY ZERO`; console switching intact; stock sweep | ⬜ pending |
| 12 | `#` and `#<letter>` current-device state | `#` → `8`; `#h` → `H`; `#c`/`#n` forwarded eagerly; garbage → AI; stock sweep | ⬜ pending |
| 13 | `status` (UCI IDENTIFY + NET GET_IP + reachability) | `status` prints firmware ident, correct local IP, server up/down state; stock sweep | ⬜ pending |
| 14 | `time`, `reset`, `menu` tiny control/DOS commands | `time` prints RTC; `reset` reboots; `menu` enters Ultimate menu; each returns cleanly; stock sweep | ⬜ pending |
| 15 | `pwd`, `cd` for h/t/f/c/n (with minimal support on 8/9/s) | On `#t`: `cd sub` / `pwd` / `cd ..` / `cd /` track correctly; on `#c`: server state; IEC shows "not supported" message; stock sweep | ⬜ pending |
| 16 | `ll` / `dir` with optional pattern filter | `ll` on `#t` lists Ultimate dir; `ll outrun*` filters; on `#8` → minimal (point to `$`); on `#c` → server results; stock sweep | ⬜ pending |
| 17 | `mnt` / `umnt` (mount/unmount disk images) | `mnt foo.d64` then `#8` `dir` shows image contents; `LOAD"*",8,1` runs; `umnt` restores; stock sweep | ⬜ pending |
| 18 | `mkdir` (create directory on h/t/f only) | `#t` `mkdir test` then `ll` shows it; IEC/network show "not supported"; stock sweep | ⬜ pending |
| 19 | `cp` file download + `csdb` alias | Manual's CSDB session: `#c` / `find hondani` / `cd rel/<id>` / `cp *.zip` / `#t` / `dir` shows file; `csdb` alias works; stock sweep | ⬜ pending |
| 20 | `memcpy` hex-range save/load (hardest; optional split) | `memcpy $c000-$cfff dump.bin` then `memcpy dump.bin $4000` and compare; relocation works; stock sweep | ⬜ pending |
| 21 | Verify pass-throughs + final sweep | `i:`, `m:`, `:` still work; all new commands once more; manual wording vs actual; update docs | ⬜ pending |

---

Left over debt from last implementation of step 10:

1. Bank1 per-line self-heal / launch-disarm — the one real gap you already hit: the hook is armed by typing HONDANI and is lost after RUN/LOAD/TASS (re-type HONDANI to re-arm). The manual's intent is that any typed line re-arms it. This needs a small bank1 change — and bank1 is frozen with a full pocket, so it's the highest-risk remaining item and deserves its own careful step.
   - **STATUS (2026-07-10): investigated in `conversion_log2.md`, DEFERRED to the bank3 era (do it as part of / after step 11).** Hardware-characterized: **only `TASS` wipes CINV `$0314`** (RUN/LOAD do NOT); the wipe resets only the vector — both tape-buffer stubs (`$0340`, `$03A0`) survive. The heal is a guarded vector re-point `$0314→$03A0` (guard on the armed-flag `$03ED`, which survives TASS and is 0 pre-HONDANI — required, else the first pre-HONDANI line aims the IRQ at `$03A0=BRK`). It lands **exactly 1 byte over** bank1's clean free space (pocket 5 B + gap 8 B), and the only remaining shave touches the MERGE-sensitive IERROR idempotency check — not worth it in frozen bank1. **In bank3 there is room**: carry the guarded re-point (and a proper **local-only `HDN` re-arm command**, no network round-trip) in bank3, called from the existing per-line tap. Full design (exact bytes, guard, shadow-loop reclaim) is in `conversion_log2.md`. **Meanwhile the manual re-arm is `HONDANI`** (installs the hook today, server up or down).
2. Correct modifier mapping — key_send sends modifiers 0; only matters for console apps using explicit CTRL/C= chords (and note those two bits are swapped between SHFLAG and the server's flags).
3. Bank2's free run is nearly full (7 bytes left), so any of these will want the bank3 reserve or a small refactor.


---

## Confirmed decisions (Honza, 2026-07-09)

1. **Dispatch mechanism — bank2/bank3 from the `$02A7` shadow line; bank1 stays
   FROZEN.** Every command in the list is *not* valid BASIC, so it already
   arrives at the bank2 error handler (`hondani_err` @ `$9B2E`) as a direct-mode
   `?SYNTAX ERROR`, with the raw pre-crunch line shadow-copied at `$02A7`
   (step 8). We match/execute commands there; **no new bank1 scanner keywords.**
2. **Current-device state = a PRIVATE wedge byte** (`$CF2A`), **not** KERNAL `FA`
   (`$BA`). Switching `#8`/`#9`/… does **not** change BASIC's LOAD/SAVE default
   device — `LOAD"*",8,1` stays 100% stock.
3. **Sequencing = regrouped by dependency/risk** (below), still delivering every
   listed item.
4. `i:`, `m:`, `:` (python eval) and free-text chat **already work today** via the
   step-9 auto-dispatch (the server routes them by prefix — see
   `cloud/request_dispatcher.py`). Items 2–3 of the roadmap are **verify-only**
   (step 21).

---

## Hard constraint discovered: bank2 is FULL

`bank02` free run `$991E-$9E7F` (1378 B) is essentially exhausted — `hondani_net`
+ `hondani_err` + `cs_install`/`cinv_tmpl` + `console_switch`/`cs_modal`/`scr_*`/
`cs_connect`/`cs_readack`/`key_send` reach ~`$9E7B`, ~4 bytes below the `$9E80`
real-data wall. **No new code can grow bank2.**

Therefore the new command layer lives in **bank3** (`$998B-$9E9C`, ~1298 B, the
documented clean reserve), reached from bank2 by a **RAM bank-switch trampoline**
— identical in spirit to the hardware-proven 10b mechanism (a RAM stub pages a
ROM bank in, `jsr`s it, pages back). Bank1 is frozen; after step 11 bank2 is
frozen too (only a thin shim + the trampoline install remain there).

### Banking / IRQ model for bank3 calls

`hondani_err` is entered by the bank1 RAM IERROR stub with **IRQ already masked
(`sei`)** and bank2 mapped; the stub restores bank1 and `cli`s on return. So a
bank2→bank3 excursion runs entirely inside that masked window — no IRQ can fire
while a non-bank1 ROM is mapped (same guarantee step 9b relies on). The
trampoline runs from RAM (datassette buffer), so the `sta $de00` bank flips never
pull ROM out from under the executing code. Restore uses the **constant `$10`**
(bank2) — never a `$de00` read-back (the 10b read-restore bug post-mortem).

---

## Command routing table (by current device `$CF2A`)

| Device | Letter | `pwd`/`cd`/`ll`/`dir` | `mnt`/`umnt`/`mkdir` | `cp` |
|---|---|---|---|---|
| Real IEC 1541 | `8` `9` | dir via KERNAL/RR `$`; cd/pwd limited | n/a | n/a |
| SoftIEC | `s` (dev 10) | dir via KERNAL `$` | n/a | n/a |
| Ultimate Home/Temp/Flash | `h` `t` `f` | **UCI DOS** (GET_PATH / CHANGE_DIR / OPEN_DIR+READ_DIR / CREATE_DIR / MOUNT_DISK) | UCI DOS | via server (`put`) |
| CSDB | `c` | **forward raw line to server** | n/a | forward (server FTP → C64U /temp) |
| Network drive | `n` | **forward raw line to server** | n/a | forward (server FTP) |

Device-independent local commands: `status`, `time`, `reset`, `menu`, `memcpy`,
`#`, `csdb` (alias `#c`).

**Reference implementations to port** (old ROM-replacement shell — logic reusable,
its `parser.asm`/`CommandDone` framework is NOT): `src-discontinued/` —
`c64u_common.asm` + `c64u_dos.asm` (UCI DOS core), `c64u_network.asm`
(`NET_CMD_GET_IP_ADDRESS $05`), `cmd_hash.asm` (`#`), `cmd_pwd/cd/lsll/mnt/umnt/
mkdir/time/reset/info.asm`. UCI DOS opcodes: `cloud/oscar/include/ultimate_lib.h`.
Server side already implemented: `cloud/handlers/netdrive_handler.py`,
`csdb_handler.py` (accept raw `cd/pwd/ll/dir/cp` + track `active_module`/cwd).

---

## Scratch / RAM map additions (private, PEEKable breadcrumbs)

- `$CF2A` — current device byte (ASCII letter, or `8`/`9`/`s`). Init `'8'`.
- `$CF2B-$CF2F` — command-parser scratch (arg pointer, matched-cmd id).
- RAM trampoline `call_bank3` — datassette buffer free gap **`$0360-$037F`**
  (clear of `$0340` IERROR stub, `$03A0` CINV stub, `$03E7/8` orig vector,
  `$03EC-$03EF` CINV saved vec/latch/`w_console`). ~16 bytes.
- `UII_CMD_BYTES` staging buffer for UCI DOS commands — reuse the reference's
  `$02A7` convention? **No** — `$02A7` holds our shadow line. Stage UCI command
  bytes in a bank3-local scratch page or `$CF40-$CF7F`. Decide in step 11.

---

## The steps

Each step: **bank3-only add** unless noted; bank1 FROZEN; verify by rebuilding and
byte-diffing `build/rr38p-tmp12reu.rebuilt.bin` vs stock `rr38p-tmp12reu.bin`
(every diff byte explainable; banks 0/1/4/5/6/7 must stay as the frozen 10x image
except where a step explicitly says otherwise); archive each build; hardware-test
before the next step. Use a Sonnet/Opus subagent for the mechanical build +
byte-diff + disassembly audit to conserve quota.

### Step 11 — Lift the error dispatcher into bank3 (BEHAVIOR-PRESERVING) 🧱

The foundation. **Zero user-visible change** — the safety pattern of steps 5a/8.

- Re-survey bank3 free run `$998B-$9E9C` for stray reads/inline targets (repeat
  the 5a audit method); pin a `hsh_*` module start with `.errorif`.
- Port a **compact UCI core to bank3** (connect / write / read-until-gap / close /
  accept), reusing our proven **bounded-loop + `$0E` recovery** discipline (steps
  5c/7), not the reference's unbounded `wait_idle`.
- Move `hondani_err`'s "`$02A7` line → `$FE $02` + line → multi-chunk read → CR →
  print → close, carry return" logic into bank3 `hsh_dispatch`.
- Shrink bank2 `hondani_err` @ `$9B2E` to a **thin shim**: self-heal the
  `call_bank3` trampoline into `$0360`, `jsr` it (→ bank3 `hsh_dispatch`),
  propagate carry, `rts`. Freed bank2 bytes → fill. `hondani_net` (HONDANI
  keyword path) + all `cs_*` code stay **byte-identical**.
- **Verify:** full step-9b regression suite must pass unchanged — `HELLO WORLD` →
  AI reply + `READY.`; `PRINT 1/0` → `?DIVISION BY ZERO`; `10 FOO`+`RUN` →
  `?SYNTAX ERROR IN 10`; server down → stock `?SYNTAX ERROR` ≤ ~5 s then recovers;
  `HONDANI HELP` unchanged; console switching (10a–d) unchanged; full stock sweep;
  freeze→resume; `TASS`.
- Bank2 is FROZEN after this step passes.

### Step 12 — `#` and `#<letter>` current-device state (pure local) 🆕

First real command, no UCI. In bank3 `hsh_dispatch`, before the chat-forward:
match `$02A7`.

- `#` alone → print current device letter (`$CF2A`) + CR.
- `#8`/`#9`/`#s`/`#h`/`#t`/`#f`/`#c`/`#n` → validate, store letter in `$CF2A`.
  **`#c`/`#n` are forwarded EAGERLY to the server** (print its reply, e.g.
  `CSDB mode` / `NETDRIVE: /`). This is REQUIRED, not optional: the server sets
  `active_module` only on receiving `#c`/`#n` (`csdb_handler.can_handle` matches
  `t == "#c"`; `netdrive_handler` matches `"#n"`), and thereafter routes bare
  `cd`/`ll`/`cp` lines to that module via the `active_module` fallback in
  `request_dispatcher.py`. Skip the forward and those later commands would wrongly
  hit ChatHandler. (Matches the old `cmd_hash.asm`, which forwarded `#c` to the
  cloud.) `#8`/`#9`/`#s`/`#h`/`#t`/`#f` are purely local — no forward.
- Unrecognized `#x` → C=1 fall-through (AI) as today.
- **Verify:** `#` → `8`; `#h` then `#` → `H`; `#c`/`#n` accepted; garbage line →
  AI; stock sweep; console switching intact.

### Step 13 — `status` (UCI IDENTIFY + NET GET_IP + reachability) 🆕

First UCI DOS/NET read from bank3. Port `uii_identify` (DOS `$01`) +
`uii_getipaddress` (NET `$05` → 12 bytes `ip nm gw`) + a bounded connect probe for
"server reachable". Print ident, IP/netmask/gateway, reachable Y/N.
- **Verify:** `status` prints firmware ident, correct local IP, and server
  up/down correctly (toggle the server). Machine alive; stock sweep.

### Step 14 — `time`, `reset`, `menu` (tiny control/DOS commands) 🆕

- `time` → UCI GET_TIME, print (NTP fetch may pause a moment — bounded).
- `reset` → UCI CONTROL reset (RAM preserved).
- `menu` → UCI CONTROL freeze-to-Ultimate-menu.
- **Verify:** `time` prints RTC; `reset` reboots; `menu` enters the Ultimate menu;
  each returns cleanly / does its thing; stock sweep for the non-destructive ones.

### Step 15 — `pwd`, `cd` 🆕

- `h`/`t`/`f`: UCI DOS GET_PATH (`$12`) / CHANGE_DIR (`$11`) incl. `cd ..`, `cd /`,
  relative + absolute.
- `c`/`n`: forward the raw line to the server (it tracks cwd).
- `8`/`9`/`s` (real IEC): `cd`/`pwd` **not supported** — print a short
  "not supported on IEC drives" and return cleanly. (Confirmed minimal scope,
  Honza: cd/pwd only for the non-IEC filesystems.)
- **Verify:** on `#t`, `cd sub` / `pwd` / `cd ..` / `cd /` track correctly; on
  `#c`, `cd rel/248345` + `pwd` reflect server state; stock sweep.

### Step 16 — `ll` / `dir` (+ pattern filter) 🆕

- `h`/`t`/`f`: UCI OPEN_DIR (`$13`) + READ_DIR (`$14`) loop → CHROUT.
- `c`/`n`: forward raw line to server.
- `8`/`9`/`s` (real IEC): **minimal** — print a short pointer to the stock RR `$`
  directory command rather than porting KERNAL dir + `floppy.asm` into bank3.
- `ll <pattern>` / `dir <pattern>`: trailing `*` = prefix, else substring
  (client-side filter of entry names). Applies to `h`/`t`/`f` and forwarded `c`/`n`.
- **Verify:** `ll` on `#t` lists the Ultimate dir; `ll outrun*` filters; on `#8`
  lists the real disk; on `#c` lists server results; long listing + `CTRL` slows
  output (stock RR courtesy); stock sweep.

### Step 17 — `mnt` / `umnt` 🆕

UCI DOS MOUNT_DISK (`$23`) with a path arg (mount D64/D71/D81 to device 8);
`umnt` = unmount/return to SD dir.
- **Verify:** `mnt foo.d64` then `#8` `dir` shows the image contents;
  `LOAD"*",8,1` runs; `umnt` restores; stock sweep.

### Step 18 — `mkdir` 🆕

UCI DOS CREATE_DIR (`$16`) on `h`/`t`/`f` only; other devices → "not supported".
- **Verify:** `#t` `mkdir test` then `ll` shows it; stock sweep.

### Step 19 — `cp` (+ `csdb` alias) 🆕

- `cp <name>` on `c`/`n` (and `put` on `h`/`t`/`f`): forward the raw line to the
  server; the **server** performs the FTP round-trip to the C64U's own FTP server
  (`netdrive_handler.py` / `csdb_handler.py` `_cp_file`). Print the server's
  progress/result reply. Wedge does not move bytes itself.
- `csdb` → **alias for `#c`** (switch to CSDB device). Confirmed: the old tree has
  no dedicated `csdb` command and the docs only define `#c`/`c:`, so this is the
  minimal, documentation-faithful behavior — route `csdb` through the exact `#c`
  path from step 12.
- **Verify:** the manual's CSDB session — `#c` / `find hondani` / `cd rel/<id>` /
  `cp *.zip` / `#t` / `dir` shows the downloaded (auto-unzipped) file; stock sweep.

### Step 20 — `memcpy` (hardest; last) 🆕

`memcpy $start-$end file` (save range) and `memcpy file $start` (relocatable
load, PRG header ignored). Hex arg parsing; device from `$CF2A` or `#x:` prefix;
UCI DOS OPEN_FILE/READ_DATA/WRITE_DATA/CLOSE + memory read/write (REU-aware if
needed). Not supported on `c`/`n`. This is the biggest bank3 consumer — budget
space, may split (save first, then load).
- **Verify:** `memcpy $c000-$cfff dump.bin` then `memcpy dump.bin $4000` and
  compare (`memcpy` round-trip); relocation works; stock sweep.

### Step 21 — Verify pass-throughs + final sweep 🔎

- Confirm `i:<q>`, `m:<phrase>`, `:<python>`, and bare free-text still reach the
  right server handler unchanged (they ride the step-9 path; regression only).
- Full stock sweep + every new command once more; reconcile
  `docs/user_manual/*` wording against actual behavior; update `conversion_log.md`
  and the analysis doc.

---

## Cardinal rules (unchanged — they saved the tree)

- **Never** write inside bank5 `$8023-$9EB9` (TMP payload).
- Every changed byte must be **byte-diff-explainable** vs stock.
- **One small hardware-tested step at a time**; test more often, not less.
- **Bank1 is FROZEN**; **bank2 is FROZEN after step 11.** All new code is bank3.
- Bounded UCI loops + `$0E` recovery only — no code path may hang the machine
  (steps 5c/7 discipline). Restore banks with **constants**, never a `$de00`
  read-back (10b post-mortem).
- IRQ stays masked for the whole bank2/bank3 excursion; restore bank1 before `cli`
  (step 9b).

## Resolved open items (Honza, 2026-07-09)

- **Step 12 — `#c`/`#n` sync: EAGER.** Forward `#c`/`#n` to the server so it flips
  `active_module`; the server routes later bare `cd`/`ll`/`cp` by that module. The
  cloud code requires it (`csdb_handler.can_handle` / `netdrive_handler` match the
  literal `#c`/`#n`; `request_dispatcher.py` active-module fallback).
- **Step 19 — bare `csdb`: alias for `#c`.** No dedicated command exists in the old
  tree or docs; minimal + doc-faithful is to route it through the `#c` path.
- **Step 15/16 — IEC `8`/`9`/`s`: minimal.** `cd`/`pwd` are **not supported** on
  real IEC drives (print a short notice); `ll`/`dir` point the user at the stock
  RR `$` command. Full local nav is only for the non-IEC filesystems (`h`/`t`/`f`)
  and the server-backed `c`/`n`. No new IEC/KERNAL directory code in the cartridge.
