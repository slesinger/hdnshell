# HONDANI Wedge — Next Steps: the local shell command set (steps 11+)

Continuation of `conversion_log.md`. Steps 0–10 are done: `HONDANI <text>`,
auto-dispatch of any unrecognized direct-mode line to the AI, and console
switching (`C=+CTRL+1..7`, steps 10a–10d). **Console switching = item 1 of the
roadmap; considered DONE once 10d passes hardware test** (the deferred per-line
re-arm / disarm-on-LOAD-RUN is out of scope — it needs bank1, which stays FROZEN).

This document plans the remaining shell commands as small, byte-diff-verified,
hardware-tested steps, in the SAME discipline that has kept the cartridge stock
so far. Every step will have to be verified by Honza on real hardware before the next step is attempted to avoid bugs accumulation which will not be possible to fix later.

> **Pre-step-11 readiness audit COMPLETE (2026-07-10).** All groundwork step 11
> depends on is confirmed present in the working cartridge; no deferred item blocks
> step 11; bank3 reserve `$998B–$9E9C` verified all-zero; 5a hardware baseline
> passes (the lone `LOAD"$",8`-after-TASS anomaly is a **pre-existing stock-RR bug**,
> reproduced on genuine RR — not ours, not fixed by decision). Details +
> step-11 build gap + HW test plan in **`conversion_log3.md`**. Ready to start
> step 11 (recommended split: **11a** trampoline round-trip proof, **11b** UCI-core
> port + bank2 shim).

## Progress Tracking

| Step ID | Change | HW Test Expectation | Status |
|---|---|---|---|
| 11a | Bank2→bank3 RAM trampoline round-trip PROOF (shim + trivial bank3 stub) | Type any bad line → **border colour advances one step** (bank3 ran) then `?SYNTAX ERROR`; `PRINT 1/0`→`?DIVISION BY ZERO`; console switch + stock sweep + TASS unchanged; auto-dispatch INTENTIONALLY off (bad line → stock error, no AI reply) | ✅ HW tested 2026-07-10 |
| 11b | Port full UCI dispatcher into bank3 hsh_dispatch (restore auto-dispatch) | Full step-9b regression restored: `i:hello`→AI reply+`READY.`; `PRINT 1/0`→`?DIVISION BY ZERO`; server-down→stock error≤5s; console switch intact; stock sweep; **NO border step now** (dispatch replaces the 11a proof) | ✅ HW tested 2026-07-10 |
| 12 | `#` and `#<letter>` current-device state | `#` → `8`; `#h` → `H`; `#c`/`#n` forwarded eagerly; garbage → AI; stock sweep | ✅ HW tested 2026-07-10 |
| 13 | `status` (UCI IDENTIFY + NET GET_IP + reachability) | `status` prints firmware ident, correct local IP, server up/down state; stock sweep | ✅ HW tested 2026-07-10 (13a+13b) |
| 14 | `time`, `reset`, `menu` tiny control/DOS commands | `time` prints RTC; `reset` reboots; `menu` enters Ultimate menu; each returns cleanly; stock sweep | ✅ 14a + 14b HW tested 2026-07-10 |
| 15-pre | Bank3→bank4 RAM trampoline round-trip PROOF (`B4` test cmd + trivial bank4 stub) | Type `B4` ↵ → **border advances one step** (bank4 ran through the trampoline) then `READY.`; repeat steps each time; every other command unchanged; stock sweep; TASS | ✅ HW tested 2026-07-10 |
| 15a | Bank4 command dispatcher gateway + `pwd` PROOF-print (reads `$02a7`/`$cf2a`, CHROUT from bank4; carry-routed handled/not-mine) | `pwd` ↵ → prints `PWD: <dev>` (e.g. `PWD: 8`, or `PWD: T` after `#t`); repeatable; `PRINT 1/0`→`?DIVISION BY ZERO`; `i:hello`→AI; every other command unchanged; stock sweep; TASS | ✅ HW tested 2026-07-10 |
| 15b | `pwd` real: h/t/f → UCI DOS GET_PATH (`$12`); c/n → server-forward; 8/9/s → "not supported" | On `#t` `pwd` prints the Ultimate path; `#c` `pwd` → server cwd; `#8` `pwd` → "NOT SUPPORTED ON IEC"; stock sweep | ✅ HW tested 2026-07-10 |
| 15c | `cd` (CHANGE_DIR `$11`) incl. `cd ..`, `cd /`, relative/absolute | On `#t`: `cd sub` / `pwd` / `cd ..` / `cd /` track correctly; on `#c`: server state; IEC → "not supported"; bad path → "NOT FOUND"; stock sweep | ✅ HW tested 2026-07-10 |
| 16a | `ll` / `dir` **base** (bare token; no h/t/f pattern filter yet) | c/n forward, IEC notice, tokens, regression all ✅; **h/t/f dir DEFECTIVE** (lists only first entry, then alternates empty — READ_DIR is multi-packet accept-gated, doesn't fit the 15 B left) | ⚠️ HW tested 2026-07-10: all good EXCEPT h/t/f `ll`/`dir` streaming |
| 16-R | **Third code region** — prove bank4 `$9F58-$9FFF` (168 B) safe (border-flash probe, à la 15-pre/15) | `b5` probe → border steps, TMP/TASS/stock sweep unchanged | ✅ **HW tested 2026-07-10 — all good.** `$9F58-$9FFF` confirmed as the third code region (code runs+returns; non-zero bytes there don't corrupt the TMP/TASS REU image). Probe removed. |
| 16a-fix | Correct multi-packet READ_DIR streaming for h/t/f `ll`/`dir` (`while(DATA_AV){drain;accept;}`) in the 3rd region | `ll`/`dir` on `#t` lists the WHOLE dir; repeatable (no alternating); pwd/cd still fine; stock sweep | ✅ HW tested 2026-07-11 (`b4_read_dir_stream` at `$9F58`; accept-gated stream) |
| 16b-1 | h/t/f `dir`/`ll` **clean output** — READ_DIR markers: **`$10`=directory, `$20`=file separator** (filename-internal spaces are `$5F` `←`, not `$20`); rule = **newline on any byte ≤ `$20`** so dirs AND files list one-per-line | `dir` on `#t` and on a dirs+files folder both list one-per-line; stock sweep | ✅ HW tested 2026-07-11 (`cmp #$21/bcs/lda #$0d`) |
| 16b-2 | h/t/f client-side pattern filter (`ll outrun*`) — prefix-match the name between markers (≤`$20`) | `dir <pat>`/`ll <pat>` on `#t` list only entries whose name starts with `<pat>` (case-insensitive; trailing `*` optional); bare `dir`/`ll` unchanged; c/n still filters server-side; stock sweep | 🔨 **built+verified 2026-07-11 (CONS unblocked it)** — SIMPLEST case-INSENSITIVE prefix match. `b4_setpat` folds the pattern into `B4_PAT` ($cfd0, drops leading spaces + trailing `*`), `b4_emit` buffers each entry name into `B4_BUF` ($cf80), `b4_flush` prints name+CR only on a folded-prefix match (`B4_PATLEN`=0 → no filter). Filter helpers in the reclaimed main area; the `$9F58` stream loop shrank (print→`jsr b4_emit`). Build clean (8194), pins hold, stock-data band `$9E9D-$9F57` untouched, trampoline byte-exact — ✅ **HW tested 2026-07-11** |
| FIX-CS | **CINV hook crashed fastloaded games** — armed `HONDANI` left `$0314→$03A0` live; a game reusing the tape buffer ran the clobbered stub → crash (Sprite Studio→freeze menu, Outrun→crumble mid-init). **Reopened bank2** (Honza's call over server-DMA): stub grew a program-mode **self-disarm** (`lda $9d/bne`; `$9D=$80` prompt→live, `$00` program→restore saved `$0314`, chain), digit table moved to `$03F0`, `cs_install` +11 B. Relocated into the `$9B59` 232 B pocket; `console_switch`+downstream **byte-identical** | reboot→`HONDANI`→F1 Sprite Studio 64 & Outrun run (no freeze/crumble); C=+CTRL+2..7 still switches at prompt; regression | ✅ **HW tested 2026-07-11** — Sprite Studio 64 & Outrun run after `HONDANI`+F1; C=+CTRL console switch still works at prompt; MSGFLG `$9D` disarm confirmed reliable; see conversion_log3.md §17 |
| FIX-CS2 | **CINV stub no-match fall-through trapped the local console** — after `C=+CTRL+1` return-to-local, holding `C=+CTRL` on a non-1..7 key (e.g. `$CB=$40` as the chord releases) let the digit-scan loop fall through to `console_switch` with **X=$FF** → bogus console-0 `scr_save`+`scr_get` (server "Unknown local command 0x01") → **trapped in `cs_modal`, w_console=0** = dead cursor / can't type, but other consoles still switch (~80% repro). Fix = self-guarding scan loop (`ldx #$07`/`dex`/`bmi cvr_clear`/`cmp`/`bne`), **zero byte growth** | armed→console 2..7→back to local (repeat ×10): cursor blinks + can type; lone `RESTORE_SCREEN` in log (no spurious `SAVE_SCREEN`/`0x01`); other consoles switch; C=+CTRL+non-digit = no-op; FIX-CS game test + stock sweep + TASS | 🔨 **built+byte-verified 2026-07-11** — exactly 8 bytes changed, all in `cinv_tmpl` (`$9B7D-$9B84`); `console_switch`+downstream+banks 0/1/3/4/5/6/7 byte-identical; `archive-csfix2-cvr-nomatch.bin`. See conversion_log3.md §20 — **awaiting HW test** |
| FIX-CS2 | (see above) console-switch no-match fall-through fix | armed→console 2..7→local ×10: cursor OK; other consoles switch; regression | ✅ **HW tested 2026-07-11** (Honza confirmed console fix passed) |
| 17-pre | **Bank5 reserve opened** — 5th RAM trampoline (`call_bank5` @ `$0378`, shares call_bank4's slot as a sequential sibling) + trivial bank5 `b5_disp` proof stub @ `$9E00`. bank4+bank3 reserves are full; step 17 needs a third ROM bank. Installer copy-map decoded: bank5 copies are `$8100-$9DFF` only, so `$9E00-$9E9C` (157 B) + `$9F58-$9FFF` (168 B) are dead (not copied to RAM/REU) → 325 B reserve. | Type `b5` ↵ → **border advances one colour** (bank5 ran through the trampoline) then `READY.`; repeat steps each time; pwd/cd/dir/ll + `#`/status/time/menu + console switch + stock sweep + TASS/TMP all unchanged (bank5 map-in must NOT corrupt the REU image) | 🔨 **built+byte-verified 2026-07-11** — diff vs step-16 baseline = **bank3 only** (annex `$97C4`: `hsh_ck_b5`+`b5tramp`, + 1 `jmp` operand) **+ bank5** (`b5_disp` 26 B @ `$9E00`); banks 0/1/2/4/6/7 byte-identical; no code shift. See conversion_log3.md §21 — **awaiting HW test** |
| 17 | `mnt` / `umnt` (mount/unmount disk images) — `mnt <path> [8\|9]`, `umnt [8\|9]`, device-independent, drive-9 auto-enable (CONTROL `$32`); lives in bank5 reserve | `mnt foo.d64` then `LOAD"$",8`/`LOAD"*",8,1` runs the image; `mnt x.d64 9` → drive 9 enabled+mounted; `umnt` restores; stock sweep | 🔨 **built+byte-verified 2026-07-11** — bank5 `b5_disp` (mnt @ `$9E00` main region + umnt/b5_domount/b5_enable_b/b5c3 @ `$9F58` third region); DOS MOUNT_DISK `$23`/UMOUNT `$24` via b5c3 trampoline to bank3 helpers; diff vs step-16 = **bank5 only** (300 B) + the unchanged 17-pre bank3 annex; banks 0/1/2/**4**/6/7 byte-identical. Uppercase-match (no fold), silent-on-status. See conversion_log3.md §22 — **awaiting HW test** |
| 18 | `mkdir` (create directory on h/t/f only) | `#t` `mkdir test` then `ll` shows it; IEC/network show "not supported"; stock sweep | ⬜ pending |
| 19 | `cp` file download + `csdb` alias | Manual's CSDB session: `#c` / `find hondani` / `cd rel/<id>` / `cp *.zip` / `#t` / `dir` shows file; `csdb` alias works; stock sweep | ⬜ pending |
| 20 | ~~`memcpy` hex-range save/load~~ | — | ❌ **DROPPED (2026-07-11, Honza)** — not important; cutting it removes the hardest step and the `$C000` conflict, so the lighter bank3-trampoline consolidation covers the rest |
| CONS | **Bank3-trampoline consolidation** (space fix): bank4 calls bank3's FROZEN helper copies via a small RAM trampoline; delete bank4's ~8 duplicated leaf helpers | reclaims ~250 B in bank4; bank3 untouched; UCI path (pwd/cd/dir) unchanged on HW; staged (prove 1 helper first) | 🔨 **built+verified 2026-07-11, awaiting HW test** — stage 1 (trampoline + cd's fin) HW-PASSED; stage 2 (reroute rest + delete 6 dupes) built: **+227 B reclaimed** (main-area free 10→237 B), zero dangling refs, pins hold. Bank4→bank3 via RAM tramp `$0386` (target in X/Y). See conversion_log3.md §18. Unblocks 16b-2 + steps 17-20 — ✅ **HW tested 2026-07-11 (both stages, as part of the step-16 pass)** |
| 21 | Verify pass-throughs + final sweep | `i:`, `m:`, `:` still work; all new commands once more; manual wording vs actual; update docs | ⬜ pending |
| DEV | **Device→mount-path binding**: `#t`→`/temp`, `#h`→`/sd`, `#f`→`/flash`(?), **new `#u`→`/usb0`** — device letter auto-navigates to a fixed Ultimate mount root | `#t` then `pwd`→`/temp`; `#u` then `dir`→USB listing; switching device rebases | 🅳 **DEFERRED (2026-07-11), see §16-DEV** — needs unfreezing bank3 (device switch + new `#u` letter both live there); cleanly separable, does not block 16b/17–20 |

---

Left over debt from last implementation of step 10:

1. Bank1 per-line self-heal / launch-disarm — the one real gap you already hit: the hook is armed by typing HONDANI and is lost after RUN/LOAD/TASS (re-type HONDANI to re-arm). The manual's intent is that any typed line re-arms it. This needs a small bank1 change — and bank1 is frozen with a full pocket, so it's the highest-risk remaining item and deserves its own careful step.
   - **STATUS (2026-07-10): investigated in `conversion_log2.md`, DEFERRED to the bank3 era (do it as part of / after step 11).** Hardware-characterized: **only `TASS` wipes CINV `$0314`** (RUN/LOAD do NOT); the wipe resets only the vector — both tape-buffer stubs (`$0340`, `$03A0`) survive. The heal is a guarded vector re-point `$0314→$03A0` (guard on the armed-flag `$03ED`, which survives TASS and is 0 pre-HONDANI — required, else the first pre-HONDANI line aims the IRQ at `$03A0=BRK`). It lands **exactly 1 byte over** bank1's clean free space (pocket 5 B + gap 8 B), and the only remaining shave touches the MERGE-sensitive IERROR idempotency check — not worth it in frozen bank1. **In bank3 there is room**: carry the guarded re-point (and a proper **local-only `HDN` re-arm command**, no network round-trip) in bank3, called from the existing per-line tap. Full design (exact bytes, guard, shadow-loop reclaim) is in `conversion_log2.md`. **Meanwhile the manual re-arm is `HONDANI`** (installs the hook today, server up or down).
   - **UPDATE (2026-07-12): the DISARM side is the live bug (armed hook crashes RR F1 `%0:*` fastload-autorun); WORKAROUND accepted, see conversion_log3.md §23.** Root cause fully isolated: `HONDANI`→`LOAD"*",8,1`+`RUN`/`MON`+`G` all work (the `$9D` self-disarm fires on a real `RUN`), but **F1 = `%0:*`** (RR menu fastload+autorun) never does a `RUN`/`LOAD`, so the hook stays live and RR clobbers the `$03A0` stub → garble. Disarm logic is trivial (RR CINV is stock `$EA31`, so `set $0314=$EA31`, 8 B, no guard) but **does not fit** the per-line bank1 tap (max 8 B contiguous free; ~12 B needed; the IERROR idempotency bytes are load-bearing). **Deferred real fix:** hook `CRUNCH` `$0304` via a disarm stub at `$03F7-$03FF` (fastload-safe RAM, outside the `$0348-$03E8` clobber zone) chaining to `$A57C` — avoids bank1. **Meanwhile: when armed, launch autostart programs with `LOAD"*",8,1`+`RUN` (or `MON`+`G`), not F1.**
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

### UPDATE (2026-07-10, after step 14): bank3 reserve EXHAUSTED → bank4 opened

Steps 11–14 consumed the whole bank3 reserve (`kw_tab` ends `$9E9B`; ~2 B left to
the `$9E9D` wall; the only clean annex is `$97A2-$97FF` = 94 B). Steps 15–20 do
not fit. **Decision (Honza, 2026-07-10): open bank4 as a second overflow reserve**
(`$9C00-$9E9C` = 669 B, stock-zero, unreferenced), reached by a SECOND RAM
trampoline `call_bank4` (`$0378`): map bank4 `$de00=$80` → `jsr $9c00` → restore
bank3 `$18` → `rts`. bank4 (`$80`) is stock-used only by the boot-time TMP/REU
installer, never at the prompt, so the transient map-in under the existing `sei`
window is safe — same guarantee as bank2→bank3. **Bank encoding: `b7·4+b4·2+b3`,
banks 4-7 = `$80/$88/$90/$98`** (confirmed by the stock bank table at bank4 `$9EF4`
and the installer at `$8039`). bank4 handlers carry their OWN copies of the leaf
helpers (bank3's are unreachable while bank4 is mapped); 669 B has room. Proven
first with step **15-pre** (border-flash round-trip, mirroring 11a) before any
real code is ported. Full detail in `conversion_log3.md` §12.

**⚠ Bank4 reserve after 16a (2026-07-10): 654 B of 669 used, only 15 B free.** 15a–16a
fit inside the bank4 reserve; it is now **effectively full**. Steps 16a-fix/16b/17/18/19/20
**cannot fit in 15 B** — a THIRD code region is HARD-REQUIRED. Full analysis + the two
candidate designs are in **§15 (third code region)** below; the immediate consumer is the
16a `ll`/`dir` streaming fix (§14a).

### Step 16a HW result (2026-07-10) + the `ll`/`dir` defect (§14a)

16a hardware-tested: `#`/`status`/`time`/`menu`/`reset`, pwd/cd, the c/n server-forward,
the IEC notice, tokens and full regression are **all good**. **But h/t/f `ll`/`dir` is
defective**: it lists only the **first** directory entry, and repeated `ll` alternates
"one entry / empty / one entry / …".

**Root cause (confirmed against the authoritative `docs/inspiration/ultimate_lib.c`).**
UCI DOS READ_DIR (`$14`) does **not** return the listing in one shot — it streams
**512-byte packets, and each packet must be drained AND `accept`ed (`$df1c |= $02`) to
release the next** (ultimate_lib.c line 250: *"read this in a loop, and _accept() the data
in order to get the next packet; each data packet is 512 bytes"*). The correct consumer is
the u-sample.c loop:

```
uii_get_dir();                     // send $14 only (push + wait-not-busy; no read/accept)
while (uii_isdataavailable()) {     // DATA_AV = $df1c bit7
    uii_readdata();                 // drain ALL currently-available bytes -> CHROUT
    uii_accept();                   // $df1c |= $02, wait bit1 clears -> loads next packet
}
```

16a instead reused the single-packet `b4_dos1_read_print` (proven for the one-packet
`pwd`/GET_PATH): it drains packet 1, `b4_fin`-accepts once, and stops. Packets 2+ are
never read; the un-accepted leftover leaves the UCI mid-stream, so the **next** `ll`
starts off-by-one → the alternating empties. (Every other command still works because
each command's `b4_idle_kick` issues `$0E`=ACC|ABORT|CLR_ERR first, which resyncs the UCI
— that abort is exactly why "all other tests were good".)

**Fix (16a-fix):** a proper accept-gated stream loop (`while(DATA_AV){ drain→CHROUT;
accept+bounded-ack-wait; }`, no final status needed — the loop ends when DATA_AV stays
clear after the last accept). ~70 B. **Does not fit the 15 B left → blocked on the third
region (§15).** Leave `b4_dos1_read_print` untouched (pwd depends on it); add a dedicated
`b4_read_dir_stream` in the new region and point `b4_do_dir` at it. `b4_open_dir` is
already correct (OPEN_DIR returns status only — ultimate_lib.c `uii_open_dir` does
readstatus+accept, no readdata). The same loop is the prerequisite for 16b's h/t/f filter.

---

## 15. The third code region (bank4 is full) — decision

Everything from 16a-fix on needs code space bank4 no longer has (15 B). Bank3 is full
(~2 B); banks 5/6/7 are the frozen TMP payload. A raw-image zero-run scan (2026-07-10)
of the **stock** `.bin` turned up the real candidates:

| Region | Size | Reach | Notes |
|---|---|---|---|
| **bank4 `$9F58-$9FFF`** | **168 B** | plain `jsr` from bank4 (no new trampoline) | stock-zero & identical across banks 4/5/6/7 (end-of-bank padding); bank4 never reads its own `$9F58+`; installer copies only from `$8121`/`$80B4`; **above** bank5's `$9EB9` TMP line. **Recommended.** |
| bank3 annex `$976A-$97A1` | ~56 B | bank3-mapped only | small; the `$97A2-$97FF` part already holds the bank4 gateway |
| RAM helper page | ~250 B equiv. | any bank (bank-independent RAM) | see §15.2 — the design you asked for; heavier, but the general answer |

### 15.1 Recommended: bank4 `$9F58-$9FFF` (168 B, in-bank) — with a safety probe

`$9F58-$9FFF` sits **above** the live TMP bank-switch machinery (`$9E9D-$9F57`: the bank
table `$9EF4` + the RTI trampoline `$9F01`) and is all-zero across banks 4–7 = end-of-bank
padding. It's reached by a plain `jsr` from the existing `b4_disp` code (same bank, same
`sei`/map-in window — no new RAM trampoline). 168 B comfortably holds 16a-fix (~70 B) +
16b's filter, and likely `mnt`/`umnt`/`mkdir` (they reuse the DOS helpers, ~30–40 B each);
`cp`/`memcpy` may still want more but this unblocks the immediate defect and several steps.

**Residual risk = the TMP REU image.** The boot installer DMAs the TMP payload to the REU;
if that DMA sourced the full bank4 `$8000-$9FFF`, writing `$9F58+` would corrupt the REU
image and break TASS/TMP. Two facts argue it's safe: (a) steps 15–16a already write the
`$9C00-$9E9C` reserve **in the same bank** and TASS/TMP still pass on hardware, so the
installer does not DMA that region; (b) `$9F58+` is further from the payload, past the live
handler. Still, per 15-pre discipline, **prove it with a throwaway border-flash probe
(step 16-R)** — a `B5` test command that `jsr`s a stub at `$9F58` (`inc $d020/rts`), then
run the full stock sweep + **TASS launch/exit + a TMP/`\` resume** to confirm the REU image
is intact — BEFORE porting `b4_read_dir_stream` there.

### 15.2 The RAM-resident shared-helper page (the design you requested) — general fallback

Idea: install the shared UCI **leaf helpers** into a RAM region once, so bank2/bank3/bank4
(and any future overflow bank) `jsr` a **single** copy instead of each carrying its own.
The helpers qualify because they touch **only bank-independent surfaces** — UCI regs
`$df1c-$df1f`, `CHROUT $ffd2` (via `($0326)=$F1CA`), scratch `$cf26/$cf30/$cf31/$cf47/$cf48`,
shadow `$02a7`, device byte `$cf2a` — so they execute correctly no matter which ROM bank is
mapped, with no trampoline per call.

Candidate helper set (~250 B): `idle_kick`, `widl`, `push`, `wdav`, `fin`,
`dos1_read_print`, `read_dir_stream`, `fold`, `curdev`, `is_htf`, `prnsup`.

**What it buys / costs.** Its real win is **de-duplication**: today the same UCI logic
exists twice in ROM — bank3's `hsh_*` set (chat/status) *and* bank4's `b4_*` copies. If
both banks called one RAM copy, one ROM duplicate (~250 B) could be deleted, giving bank4
back ~250 B. **But** RAM code needs a ROM *template* to heal from, and we're out of spare
ROM to hold a 250 B template except the very bytes we'd reclaim — so the net gain only
materialises if the template lives in ONE bank (e.g. keep bank3's copy as the template,
delete bank4's). Sequatially:
- **Template:** keep one ROM copy (bank3's `hsh_*`, extended to the full set) as the source.
- **Install:** copy it to a RAM page. Placement is the hard part — page 1 is cart-owned;
  `$C000-$CFFF` is trampled by programs that load there (round-6 lesson); the datassette
  buffer `$0334-$03FB` is load-safe but only ~180 B and already fragmented by our stubs
  (`$0340`/`$0360`/`$0370`/`$0378`/`$03A0`/`$03E7-$03EF`). So either (i) re-heal the page
  per typed line from the ROM template (heavy: ~250 B copy per line, but the trampolines
  already use per-use heal and it's invisible), or (ii) find a genuinely load-safe 250 B
  RAM run (none obvious today — open question).
- **Callers:** bank2/3/4 command code `jsr`s the RAM entry points (a small fixed jump
  table, like the old cross-bank ABI) instead of local/`b4_*` copies.

**Assessment.** Cleanest *if* we ever open a 4th overflow bank (we can't — 5/6/7 frozen),
or if per-bank duplication keeps growing. For the immediate `ll`/`dir` fix it is heavier
and riskier than §15.1's in-bank 168 B. **Recommendation: take §15.1 (`$9F58`) now (with
the 16-R probe); keep this RAM-helper-page design on the shelf as the escalation if the
168 B + annex run out before `memcpy` (step 20).**

### 15.3 ADDENDUM (2026-07-11): RAM-helper-page ABANDONED → bank3-trampoline chosen

Investigated properly (subagent). The RAM-helper-page is **not viable** and is bigger than
§15.2 implied:
- **No load-safe RAM home exists** given the two product constraints. TMP/TASS copies its
  image into **`$9500-$CEFF`**, clobbering `$A000-$CFFF` (so `$A000` RAM is out); the
  datassette buffer has only **65 B free (fragmented, largest run 26 B)**; `$C000` conflicted
  with the planned `memcpy`. **memcpy is now DROPPED**, but TMP (kept) *still* owns
  `$A000-$CEFF`, so a persistent RAM page still has nowhere to live.
- **Size/scope**: the leaf helpers total **~458 B** (not ~250) across **~70 call sites in 3
  banks**; a shared RAM copy would need bank2 (template) + bank3 (repoint) unfrozen. Heavy.

**Chosen instead — bank3-trampoline consolidation** (table row `CONS`): bank4 deletes its 8
duplicated leaf helpers and calls **bank3's existing (frozen) copies** through a small RAM
trampoline (the `call_bank4` pattern in reverse: map bank3 `$de00=$18` → `jsr helper` → restore
`$80`, all in the existing `sei` window; ~17 B, fits the datassette `$0386-$039F` gap). bank3
is **only called, never modified** (stays frozen); no RAM-placement problem; reclaims ~250 B in
bank4 — enough for 16b + `mnt`/`umnt`/`mkdir`/`cp` (memcpy dropped). The trampoline preserves
`A` + carry (clobbers `X`/`Z`), so `is_htf` (returns `Z`) and tiny `b4_fold` (17 B, 7 sites)
stay bank4-local; the big helpers (`fin` 89, `push` 53, `dos1_read_print` 56, `curdev` 41,
`widl`+`idle_kick` 38, `wdav` 21) move. Stage it: prove the trampoline with ONE helper + HW
test, then migrate the rest, then delete the dups.

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

### §16-DEV — Device→mount-path binding (DEFERRED, decision 2026-07-11) 🅳

**Request (Honza, HW test after 16a-fix):** the device letter should auto-navigate to a
fixed Ultimate mount root, so a bare `#t` puts you in that drive/dir without a manual `cd`:
- `#t` → `/temp` (Ultimate temp)
- `#h` → `/sd` (SD card)   *(note: current bank3 comment labels `H`=Home, `T`=Temp, `F`=Flash;
  the requested `#h`→`/sd` supersedes "Home" — confirm the final `#f` and `#h` targets then)*
- **`#u` → `/usb0` (NEW device letter)**
- `#f` → `/flash` (?) — TBD

**Decision: DEFER.** Not a bug at this stage — today the device letter is a *category label*
(`$cf2a`), and the UCI DOS "current path" is whatever you last `cd`'d to; `#t` then `cd /temp`
works manually. Reasons to defer rather than bolt onto 16b:
1. **It requires unfreezing bank3.** The `#<letter>` handler (`hd_setdev`, bank3 `$998B`
   region, FROZEN since 15a) is a *pure* `sta $cf2a` with no UCI. Both halves of this feature
   touch frozen bank3: (a) the **new `#u` letter** must be added to the `hd_setdev` validation
   chain **and** `hd_norm_cur`/`b4_curdev`; (b) **auto-cd on switch** means the handler must
   now issue a UCI `CHANGE_DIR` (`$11`) to the mount root — bank3 has the UCI helpers but is
   frozen, so this is a deliberate bank3 re-open + re-verify, not a bank4-only change.
2. **The "device = mount root" semantics deserve their own design.** Options: (a) auto-`cd`
   to the root at switch time (simple, but a later `cd sub` then re-`#t` must re-root); or
   (b) track a per-device base path and prepend it (needs path state + string handling).
   (a) is the likely choice and is clean — but it belongs in a dedicated step, not 16b.
3. **No forward complications.** 16b (pattern filter) and 17–20 operate on *whatever* the
   current dir lists, independent of which mount. The only forward-cost of deferring is
   trivial and additive: when bank3 is next opened, add `'U'`/`'u'` to the two validators
   (~4 bytes) alongside the auto-cd. Nothing in 16a/16b needs reworking.

**When we do it:** one planned bank3 unfreeze — add `#u`, add auto-`CHANGE_DIR` to the mount
root in `hd_local` (a table letter→path), re-byte-verify bank3, HW test the full device sweep
+ TASS/TMP. Until then, `#u` is unknown (falls to AI) and `#h/#t/#f` stay category-only.

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
