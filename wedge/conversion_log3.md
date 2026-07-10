# HONDANI Wedge — conversion log 3 (the bank3 shell era)

Split off from `conversion_log.md` (steps 0–10f) and `conversion_log2.md` (the
deferred bank1 CINV self-heal). This log covers **step 11 onward** — the local
shell command set living in bank3.

This first entry is the **pre-step-11 readiness audit** requested by Honza
(2026-07-10): confirm the groundwork step 11 depends on is really in the working
cartridge, resolve the "deferred statements", identify what step 11 must still
build, and propose the hardware tests. **No cartridge byte was changed by this
audit** — it is analysis only.

---

## 0. Baseline facts established this session

- **`rr38p-tmp12reu.bin` is pure-stock RR** (the byte-diff reference), *not* our
  working image. Our working cartridge = `build/rr38p-tmp12reu.rebuilt.bin`,
  byte-identical to `build/archive-10f.bin`. Toolchain reproduces cleanly.
- **Our build discipline vs stock (per 8 KB bank):**

  | bank | bytes changed vs stock | what |
  |---|---|---|
  | 0 | 0 | untouched |
  | 1 | 168 | step-8 tap `$9D74–$9E0A`, armed IERROR stub `$9E3A–$9E50`, 3-byte scanner hook `$83FF–$8401` |
  | 2 | 1329 | all HONDANI/console-switch code |
  | 3 | 0 | **reserve is all-zero, == stock** |
  | 4–7 | 0 | untouched |

  Banks 0,3,4,5,6,7 are **byte-identical to stock**. In particular **bank5 (TMP
  payload) is untouched** — cardinal rule #1 holds.

- **Bank3 reserve `$998B–$9E9C` (~1298 B) is confirmed all-zero** (0 non-zero
  bytes) and no bank3 code entry point or data label lands inside it (last label
  before it is `$97A1`, next is `$9F01`).

---

## 1. Pre-step-11 groundwork — CONFIRMED PRESENT in the working cartridge

Step 11 ("lift the error dispatcher into bank3, behavior-preserving") depends on
these, all verified present today:

1. **`$02A7` shadow line** — the raw pre-crunch typed line, copied every line by
   the bank1 tap `hondani_nomatch` @ `$9D8B` (bound `<= $58`, null-terminated).
   This is the *input* the dispatcher reads. ✓
2. **Bank1 RAM IERROR stub `hd_stub` → `$0340`** (23 B, re-copied per line). Its
   calling convention is exactly what step 11 reuses:
   ```
   sei ; lda #$10 ; sta $de00      ; map bank2, IRQ already masked
   jsr $9b2e                        ; hondani_err (pinned)
   lda #$08 ; sta $de00 ; cli       ; restore bank1, re-enable IRQ
   bcs hd_pass ; jmp $e37b          ; C=0 handled -> READY.
   hd_pass: jmp ($03e7)             ; C=1 -> stock IERROR
   ```
   → the whole bank2 (and future bank2→bank3) excursion runs **under `sei`**, with
   ROM banks flipped only while the stub restores bank1 before `cli`. The
   masked-window guarantee step 11 relies on is real and in force. ✓
3. **`hondani_err` @ `$9B2E`** (step 9b dispatcher) — works today, address pinned
   (the RAM stub hardcodes `jsr $9b2e`). This is the code to lift. ✓
4. **`$de00` bank primitive proven** on hardware by both the HONDANI keyword path
   (bank1→bank2 via the `$DEDE` gate) and `hd_stub` (bank1↔bank2 direct flip).
   Bank encoding confirmed: **bank2 = `$10`, bank3 = `$18`, bank1 = `$08`**
   (control bits b3/b4/b7). Restore-with-constant `$10` is available. ✓
5. **UCI registers are ROM-bank-independent** — `$DF1C/1D/1E` live in I/O2
   (`$DF00`), not the `$8000–$9FFF` ROM window, so bank3 code can drive UCI
   directly. This is why porting the UCI core into bank3 is feasible. ✓
6. **Private RAM scratch is free** — `$CF2A` (step-12 current-device) and
   `$CF2B+` are unused today (bank2 uses only `$CF20–$CF27`, `$CF29`). ✓
7. **Page-3 datassette map has room for the trampoline** — 23 B IERROR stub ends
   at `$0356`; 71 B CINV stub occupies `$03A0–$03E6`; **`$0360–$037F` is a clean
   free gap** for the `call_bank3` RAM trampoline. ✓

**Conclusion: every prerequisite step 11 consumes is already in the cartridge.
There is no missing "preparation" byte to land before step 11 — the prerequisites
are all in place. What remains is step 11's own new code (§3).**

---

## 2. The "deferred statements" — NONE block step 11

Honza was unsure whether the deferred items gate step 11. They do not:

- **Bank1 per-line CINV self-heal / local `HDN` re-arm** (conversion_log2 decision
  2026-07-10): deferred to the bank3 era *on purpose*. Step 11 does **not** need
  it — step 11 is a behavior-preserving lift. The relationship is the reverse:
  step 11's new bank3 trampoline is the *enabler* that finally makes the guarded
  re-point + a local-only re-arm command cheap to add **after** step 11. It is a
  post-step-11 feature, not a prerequisite. (Meanwhile manual re-arm = `HONDANI`.)
- **Modifier mapping** (next_steps §35, item 2): cosmetic, unrelated to step 11.
- **Bank2 nearly full** (next_steps §36, item 3): this is the *motivation* for
  moving to bank3, not a blocker.

---

## 3. What step 11 must still BUILD (the real gap — for next session)

None of this exists yet; it is step 11's scope:

1. **`call_bank3` RAM trampoline** (~14–18 B, lands at `$0360`): from RAM,
   `lda #$18 ; sta $de00` (map bank3) → `jsr hsh_dispatch` → `lda #$10 ; sta
   $de00` (restore bank2) → `rts`. Runs from RAM so the ROM flips never pull code
   out from under it; carry from `hsh_dispatch` survives the `lda/sta` restore, so
   the handled/not-handled contract propagates. Installed (self-healed) by the
   bank2 shim each call — **no bank1 change**.
2. **Bank3 `hsh_*` module** at the pinned reserve start: `hsh_dispatch` + a
   **compact UCI core re-implemented in bank3**. Note the current `hn_*` leaf
   helpers (`hn_hdr $9A42`, `hn_push $9A71`, `hn_fin $9ABB`, `hn_wdav $9AA6`,
   `hn_close $9A31`, `hn_ip $9B14`, …) are all **bank2-resident** and therefore
   unreachable while bank3 is mapped — they must be re-created in bank3 (with the
   proven bounded-loop + `$0E` recovery discipline).
3. **Bank2 shim replacing `hondani_err` @ `$9B2E`** (address stays pinned):
   self-heal the trampoline into `$0360`, `jsr $0360`, propagate carry, `rts`.
   Freed bank2 bytes → fill. `hondani_net` + all `cs_*` stay byte-identical.
4. **Decide the UCI staging buffer** — `$CF40–$CF7F` or a bank3-local page (not
   `$02A7`, which holds the shadow line).
5. **Pin the bank3 module start** with `.errorif`, mirroring the bank1/bank2
   guards.

**The one genuinely unproven thing is the bank2→bank3 RAM trampoline round-trip.**
Bank1↔bank2 is hardware-proven; bank2→bank3 is not. Recommend step 11 open with a
trivial **11a** proof (a bank3 stub that just sets carry a known way and returns)
before porting the ~250 B of dispatch logic.

---

## 4. Fundamental problem to AVOID (from `wedge-latest-not-working`)

Per Honza: do **not** copy from that tree. A structural byte-diff of its *built*
image vs our working image (no code was read/reused) shows why it is unsafe:

| bank | bytes it diverges | our rule |
|---|---|---|
| 0 | 59 | we change 0 |
| 1 | 176 | bank1 is FROZEN (we change 168, all in our tap/stub, none new) |
| 2 | 1329 | — |
| 3 | 19 | — |
| **5** | **4477** | **cardinal rule #1: NEVER write bank5 (TMP payload)** |

The **4477-byte scribble into bank5** (the TMP payload, `$8023–$9EB9`) and the
extra bank1/bank0 churn are exactly the class of violation our cardinal rules
forbid. Our tree keeps bank5 byte-identical to stock and bank1 limited to the
frozen tap/stub. **Step 11 stays bank3-only (+ the thin bank2 shim + RAM
trampoline); it must never touch bank5, and never grow bank1.**

---

## 5. Proposed hardware test cases

### 5a. Regression baseline to run BEFORE step 11 (prove today's image on the exact
test rig, so any step-11 failure is unambiguous):

Baseline result (Honza, hardware, 2026-07-10): **all pass. The one apparent
failure (`LOAD"$",8` after TASS) is a PRE-EXISTING STOCK-RR BUG, not ours — see
the resolution note below. Clean line for step 11 is established.**

- `HELLO WORLD` → server rejects (no handler) → `?ERROR`. **PASS** (bare text is
  not chat; real chat = `i:hello world` → answer + `READY.`).
- `PRINT 1/0` → `?DIVISION BY ZERO`. **PASS.**
- `10 FOO` then `RUN` → `?SYNTAX ERROR IN 10`. **PASS.**
- `HONDANI HELP` → help reply. **PASS.**
- Console switch `C=+CTRL+1..7` cycles as in 10a–d. **PASS.**
- Server **down**: garbage line → stock `?SYNTAX ERROR`, recovers. **PASS.**
- `TASS` launch + exit → READY (re-type `HONDANI` to re-arm). **PASS.**
- freeze→resume / normal BASIC program. **PASS.**
- **`LOAD"$",8` → FAIL (REGRESSION, blocks step 11).** Screen flashes briefly
  (like a font/charset change), returns to `READY.`, **drive never spins, nothing
  loads.** The stock RR `$` directory command still works. Must be fixed first.

#### Open regression: `LOAD"$",8` silently aborts (under investigation)

Signature: brief screen flash + clean `READY.` + no drive access. Leading
hypothesis: the armed CINV console-switch IRQ stub (`$03A0`, present only after
`HONDANI`) fires during RR's fastloader and either (a) spuriously matches
C=+CTRL+digit — because the fastloader reprograms the keyboard CIA, corrupting
`$028D`/`$CB` that the stub samples — triggering a screen swap (the flash) and
stealing the transfer, or (b) merely stealing IRQ cycles from a timing-critical
fastload. Needs the pre/post-`HONDANI` discriminator before a fix is chosen.

**UPDATE (hardware, 2026-07-10) — hypothesis above REJECTED.** New data:
- The screen flash is **normal** (stock RR does it too) — a red herring.
- `w_console` (`$03EF`) = 0 after the failure → the console switch did **not**
  fire. Not the CINV hook.
- Real trigger is **`TASS` + exit** (not the console subsystem), and it
  **persists through `HONDANI` re-arm**. `LOAD"*",8` still works; only
  `LOAD"$",8` fails. Bare `$` (RR's dollar command) still works.
- `$0314/15` = `160 3` (CINV correctly armed), so HONDANI ran fine.

**Fable5 advisor analysis (RR disassembly, 2026-07-10):**
- Both `LOAD"$"` and `LOAD"*"` enter via ILOAD `$DE6D` → bank1 `$8933`
  (bank01.asm 1433–1492). They diverge at 1474–1480: a `$` filename (`cmp #$24`)
  is routed to api_04 `$82D2`; its `$82DD` tail (647–659) does `dec $7a` then
  **re-parses the typed line from TXTPTR via `$90DC`** (2484–2510, overwriting
  `$BB/$B7`), then cross-bank calls bank2 `$801B` → `$8A37` (RR's DOS-command
  executor). `$8A37`'s first guard `lda $b7 / bne / jmp $81E7` → **empty/garbage
  name = silent clean exit to READY, zero drive I/O.** `LOAD"*"` never re-parses
  (uses KERNAL `$BB/$B7` via the turbo path 1489–1492) → survives.
- The guarded ILOAD re-hook (700–716: only re-arms `$0330→$DE6D` when
  `$0331==$F4`) **is** a genuine stock-RR+TASS defect, but **can't explain this**
  (a dangling ILOAD would break `"*"` too). So the RR handler IS entered and dies
  in the `"$"`-only re-parse/DOS branch on persistent state TASS corrupted and RR
  doesn't restore (candidate: the RR print-redirect vectors `$0320/1` CHKOUT,
  `$0326/7` CHROUT that the directory display needs; `$8364/$836F/$8385`, 717–755).
- **Wedge mostly exonerated**: the `$83FF` tap runs before statement execution,
  restores A/X/Y/flags, writes only `$0340`-stub/`$03E7-8`/`$0300-1`/`$02A7+` —
  none consumed by the LOAD/`"$"` flow; IERROR fires only on BASIC errors, which
  this flow never raises. (Latent unrelated wedge risk it flagged: the per-line
  install can capture a transient RR IERROR `$85C9` set by the TASS launcher
  (994–997) into `$03E7/8` → would crash on a *later* error, not this failure.)

**RESOLVED (Honza, hardware, 2026-07-10): PRE-EXISTING STOCK-RR BUG — NOT OURS.**
- Check 1 (broken state): `PEEK 816,817,768,769 = 109 222 64 3` → ILOAD `$0330/1`
  = `$DE6D` **intact** (not the dangling-vector path), our IERROR `$0300/1` = our
  stub. Rules out ILOAD corruption; consistent with the `"$"`-branch re-parse
  theory.
- Check 2: the failure reproduces on **pure-stock RR** (our `STOCK-rr38p-stockRR.crt`,
  built from the untouched stock `.bin`) **and on the genuine original RR
  cartridge binary**. `LOAD"$",8` after TASS fails identically on unmodified RR.

**Verdict: inherent Retro Replay + Turbo Assembler defect, independent of our
reassembly and every HONDANI change. Decision (Honza): do NOT fix it. It does not
block step 11.** Workaround for users: use the RR built-in `$` command (works), or
reset after exiting TASS. The stock test cartridge was a throwaway and has been
removed from `wedge/`.

Net: the 5a baseline is effectively 10/10 — the lone anomaly is stock-RR behavior.
**Clean line for step 11 confirmed.**

### 5b. Step 11 acceptance (next session) — must be **identical** to 5a:

- Every 5a case, byte-for-byte same behavior (step 11 is zero-user-visible-change).
- Extra scrutiny on the **server-down** path and the **`$0E` recovery** timing,
  since the UCI core now runs from bank3 through the trampoline.
- PEEK the trampoline site after use — `$0360…` intact; `$0314/$0300` vectors and
  `$03A0/$0340` stubs unchanged (no page-3 collision).
- Long-session soak: many dispatched lines in a row (no bank leak — always land
  back on bank2 then bank1).

---

## 6. Recommendation

The cartridge is **ready for step 11** — no preparatory byte is missing. Step 11
is net-new bank3 code (trampoline + `hsh_*` core + bank2 shim), best split as:

- **11a** — trampoline round-trip proof (trivial bank3 stub), HW-tested.
- **11b** — port the compact UCI core + `hsh_dispatch` into bank3, shim in bank2,
  full 5a/5b regression.

Await Honza's go / scope confirmation before writing any code.

---

## 7. Step 11a — trampoline round-trip proof (BUILT 2026-07-10, awaiting HW test)

### 7.0 The bank2-is-FULL discovery that reshaped the split

The pre-audit called bank2 "nearly full (7 bytes)". The real number: `key_send`
ends at `$9E7E` (`rts`), the real-data wall is `$9E80` — **effectively 0 free
bytes.** The planned "11a = trampoline proof *without touching hondani_err*" is
therefore impossible: there is no byte in bank2 to hold the trampoline installer,
and (chicken-and-egg) bank3 can't be reached until bank2 installs the trampoline.
The **only** reclaimable bank2 space is `hondani_err` itself.

**Decision (Honza, 2026-07-10):** fold the proof into the shim. 11a replaces
`hondani_err`'s body with the thin shim + a trivial bank3 stub; **auto-dispatch is
intentionally OFF during 11a** (bad line → stock `?SYNTAX ERROR`). 11b restores it
by fleshing out `hsh_dispatch`. Proof = **border flash** (`inc $d020`), Honza's pick.

### 7.1 What was built

- **Bank2 shim** replacing `hondani_err` @ `$9B2E` (still pinned; bank1 RAM stub
  hardcodes `jsr $9b2e`). Bytes verified in `build/rr38p-tmp12reu.rebuilt.bin`:
  ```
  $9B2E E0 0B      cpx #$0b            ; SYNTAX ERROR?
  $9B30 D0 17      bne he_pass ($9B49)
  $9B32 A5 3A      lda $3a             ; direct mode?
  $9B34 C9 FF      cmp #$ff
  $9B36 D0 11      bne he_pass ($9B49)
  $9B38 A2 0D      ldx #13             ; copy 14-byte trampoline -> $0360
  $9B3A BD 4B 9B   lda tramp,x   ($9B4B)
  $9B3D 9D 60 03   sta $0360,x
  $9B40 CA         dex
  $9B41 10 F7      bpl ($9B3A)
  $9B43 20 60 03   jsr $0360           ; -> map bank3, call $998B, restore bank2
  $9B46 A2 0B      ldx #$0b            ; restore error index for stock IERROR
  $9B48 60         rts                 ; C from bank3 propagates (C=1 -> stock err)
  $9B49 38 60      he_pass: sec / rts
  $9B4B  tramp:  A9 18 8D 00 DE  20 8B 99  A9 10 8D 00 DE  60
                 map bank3 ($18) | jsr $998B | restore bank2 ($10) | rts
  $9B59..$9C40  .fill $00   ; freed bytes; cs_install stays pinned at $9C41
  ```
  The trampoline runs from RAM (`$0360`), reinstalled per line (self-heal), all
  operands absolute/immediate so the RAM copy is position-independent. Restore is
  the **constant `$10`**, never a `$de00` read-back (10b post-mortem). X is rebuilt
  to `$0B` after the call because the copy loop clobbers it; carry is untouched by
  `ldx`/`lda`/`sta`, so the bank3 verdict survives to the bank1 stub's `bcs`.

- **Bank3 stub** `hsh_dispatch` @ `$998B` (pinned — the trampoline hardcodes it):
  ```
  $998B EE 20 D0   inc $d020   ; 11a proof: border advances once per dispatched line
  $998E 38         sec         ; C=1 = not handled -> stock ?SYNTAX ERROR
  $998F 60         rts
  ```
  Does not touch X. Its mere clean execution proves bank3 ROM was mapped: if the
  `$de00=$18` map had failed, `jsr $998B` would have hit bank2's code at that
  address (`cs_*` region), not this stub — the machine would misbehave, not count.

### 7.2 Byte-diff vs the 10f working image (`build/archive-10f.bin`)

Total 269 bytes changed, **fully localized**:

| region | bytes | what |
|---|---|---|
| bank2 `$9B31–$9C40` | 264 | old `hondani_err` body → shim + trampoline + zero-fill |
| bank3 `$998B–$998F` | 5 | `hsh_dispatch` stub |

Banks 0,1,4,5,6,7 **byte-identical to 10f**; `cs_install`@`$9C41` and everything
downstream **byte-identical** (verified) — the RAM CINV stub's `jsr console_switch`
target is unmoved. Build archived as `build/archive-11a.bin`. No `.errorif` tripped.

### 7.3 Hardware test plan for 11a (Honza)

Arm first: type `HONDANI` (installs the bank1 tap/stub as usual).

1. **Proof:** type a bad line, e.g. `ASDF` ↵. Expect: **border colour advances by
   one**, then `?SYNTAX ERROR`, `READY.`. Repeat 3–4× → border steps each time.
   (That is bank3 executing through the trampoline. Border persists; reset or
   `POKE 53280,14` to restore.)
2. **Auto-dispatch is OFF (expected in 11a):** `i:hello` gives `?SYNTAX ERROR`
   (border steps), **no AI reply** — this is correct for 11a, restored in 11b.
3. **Gate intact:** `PRINT 1/0` → `?DIVISION BY ZERO` with **no border step**
   (X≠$0B path passes straight through).
4. **Console switch** `C=+CTRL+1..7` still cycles (10a–d) — unaffected.
5. **Stock sweep** (normal BASIC, freeze→resume) unchanged.
6. **TASS** launch/exit still returns to `READY.`; re-`HONDANI` to re-arm.
7. **PEEK the page-3 map** after use: `$0360` region holds the 14 trampoline bytes;
   `$0314/$0300` vectors and `$0340/$03A0` stubs unchanged (no page-3 collision).

If all pass, bank2→bank3 is proven and 11b (full port) can proceed.

**RESULT (Honza, hardware, 2026-07-10): ALL PASS.** Border steps per bad line,
gate intact, console switch / stock sweep / TASS unaffected. bank2→bank3 RAM
trampoline round-trip is PROVEN. `build/archive-11a.bin`.

---

## 8. Step 11b — port the full dispatcher into bank3 (BUILT 2026-07-10, awaiting HW test)

Restores auto-dispatch by lifting the entire step-9b `hondani_err` logic (+ its
`hn_*` leaf helpers) into bank3 `hsh_dispatch` at `$998B`. The bank2 shim is
UNCHANGED from 11a (comment-only edit) — it still gates, installs the trampoline,
`jsr`s it, rebuilds X=`$0B`, and propagates carry. The 11a border-flash proof stub
is replaced by the real dispatcher, so **there is no more border step** in 11b.

### 8.1 The CHROUT bank-safety question (resolved before writing)

`hsh_dispatch` prints the reply with `jsr $ffd2` (CHROUT = `jmp ($0326)`). Risk:
if `$0326` pointed into the `$8000–$9FFF` cartridge window, then with **bank3**
mapped that vector would hit bank3 bytes instead of a CHROUT handler → crash (the
old dispatcher only survived because **bank2** happened to be mapped).

Resolved by reading the RR ROM: `bank01_sub_836F` sets `$0326/$0327 = $DE78`
(RR's own dir-display CHROUT, in **I/O1** — not the ROM window) and
`bank01_sub_839A` restores `$0326/$0327 = $F1CA` (stock KERNAL CHROUT). RR only
installs `$DE78` **transiently** during its `$` directory command and restores
`$F1CA` after. At the BASIC prompt (where a SYNTAX ERROR → our IERROR stub →
`hsh_dispatch` runs) `$0326 = $F1CA`, i.e. KERNAL at `$E000–$FFFF`, which is
**independent of the `$de00` ROM-bank bits**. Corroboration: hondani replies
already print as clean PETSCII — RR's `$83xx`/`$DE78` dir-CHROUT would mangle them.
**So `jsr $ffd2` from bank3 is safe and behaviour-identical to the bank2 version.**
Every other resource `hsh_dispatch` touches is likewise outside the ROM window:
UCI regs `$DF1C–$DF1F` (I/O2), shadow line `$02A7` + scratch `$CFxx` (RAM).

### 8.2 What was built (bank3 `$998B–$9B7D`, ~485 B)

- `hsh_dispatch` @ `$998B` — a faithful port of `hondani_err`'s body: UCI-present
  check (`$DF1D`==`$C9`) → connect (target `$03`/cmd `$07`, port 6464, `hsh_ip`) →
  write (cmd `$11`, `$FE $02`, then the `$02A7` shadow line, bound `$59`) →
  multi-chunk read with retry (cmd `$10`, `$00E8` chunks, CR-once latch `$CF25`,
  retry window `$CF24`) → CHROUT each byte → close (cmd `$09`). Returns **C=0
  handled / C=1 not-handled**. The gate + `ldx #$0B` restore stay in the bank2
  shim, so `hsh_dispatch` omits them (it just sets carry).
- Bank3-local leaf helpers (the `hn_*` are bank2-resident, unreachable here):
  `hsh_hdr` `$9A9F`, `hsh_widl` `$9AB6`, `hsh_push` `$9ACE`, `hsh_wdav` `$9B03`,
  `hsh_fin` `$9B18`, `hsh_close` `$9A8E` — byte-for-byte logic of `hn_hdr/widl/
  push/wdav/fin/close`, same bounded loops + `$0E` recovery (5c/7 discipline).
  Shared scratch `$CF21/22/23/24/25/26/30/31` (RAM, reused from the bank2 path —
  the two never run concurrently). Data `hsh_ip` @ `$9B71` = `"192.168.1.2",0`.

### 8.3 Byte-diff & structural verification

- Vs `build/archive-11a.bin`: **only bank3 changed** (`$998B–$9B7B`, 485 B — code
  replacing reserve zeros). Bank3 real data at `$9E9D` **byte-identical**; banks
  0/1/2/4/5/6/7 **byte-identical**. Cumulative vs 10f: bank2 264 B (shim), bank3
  485 B (dispatcher); banks 0/1/4/5/6/7 untouched. No `.errorif` tripped.
- Emitted-code checks: all 37 `hsh_*` labels resolved (KickAss would error on any
  undefined label or out-of-range branch); exactly **2** `jsr $ffd2` (`$9A4A` CR,
  `$9A5C` CHROUT) and **1** `lda $02a7,y` (`$99DF`) inside the module; first branch
  `bne hsh_unreach` @ `$9990` → `$99C3` correct; two `$0E` UCI-recovery kicks
  (`hsh_hdr` + `hsh_push`). Module ends `$9B7D`, well inside the reserve (`$9E9C`).
- Archived `build/archive-11b.bin`.

### 8.4 Hardware test plan for 11b (Honza) — must restore the full step-9b behaviour

Arm first: type `HONDANI`.

1. **Auto-dispatch RESTORED:** `i:hello world` → AI reply printed, then `READY.`
   **No border step** (the 11a proof is gone). A bare unrecognized line likewise
   reaches the server.
2. **Gate intact:** `PRINT 1/0` → `?DIVISION BY ZERO`; `10 FOO`+`RUN` →
   `?SYNTAX ERROR IN 10` (non-direct-mode passes straight through).
3. **`HONDANI HELP`** (the keyword path, bank2 `hondani_net`) unchanged.
4. **Server DOWN:** a dispatched line → stock `?SYNTAX ERROR` within ~5 s, machine
   recovers, next lines work when the server returns. Extra scrutiny here + on the
   `$0E` recovery timing (the UCI core now runs from bank3 through the trampoline).
5. **Console switch** `C=+CTRL+1..7` (10a–d), **stock sweep**, freeze→resume,
   **TASS** launch/exit — all unchanged.
6. **Soak:** many dispatched lines in a row — no bank leak (always lands back on
   bank2 then bank1); PEEK `$0360` trampoline + `$0314/$0300` vectors intact.

If all pass, **bank2 is FROZEN** and steps 12+ (real commands) build on this base.

**RESULT (Honza, hardware, 2026-07-10): ALL PASS.** Auto-dispatch restored, gate
intact, server-down recovers, console switch / stock sweep / TASS unchanged.
bank2→bank3 dispatcher is live. **Bank2 is now FROZEN.** `build/archive-11b.bin`.

---

## 9. Step 12 — `#` / `#<letter>` current-device state (BUILT 2026-07-10, awaiting HW test)

First real shell command. **Pure local**, no UCI for the local devices — it runs at
the very top of `hsh_dispatch` (bank3 `$998B`), before the chat-forward. The current
device is the PRIVATE byte **`$CF2A`** (an ASCII letter, per confirmed decision #2 —
**NOT** KERNAL `FA`), so switching it never changes BASIC's LOAD/SAVE default device.

### 9.1 Behaviour (matches next_steps §12 + the resolved open items)

- **`#` alone** → print the current device letter (`$CF2A`) + CR, C=0 (handled).
- **`#8 #9 #S #H #T #F`** → store the letter in `$CF2A`, C=0 — **purely local**,
  no server contact (works server-down / no-UCI).
- **`#C #N`** → store `'C'`/`'N'` in `$CF2A`, then **fall through** to the existing
  step-11b dispatcher, which forwards the raw `$02A7` line (`#c`/`#n`) to the server.
  This IS the required eager `active_module` sync — the server's `csdb_handler` /
  `netdrive_handler` match the literal `#c`/`#n`, and `request_dispatcher.py` then
  routes later bare `cd`/`ll`/`cp` to that module. No new network code was needed:
  the forward is just "set letter, don't return".
- **`#<anything else>`** (e.g. `#z`, `#help`, `#c foo`) → fall through to the AI, as
  today.

**Decisions honoured (Honza, 2026-07-10):**
1. **Lazy init** — `$CF2A` is uninitialized RAM and bank1/2 are frozen, so there is
   no boot hook. `hd_norm_cur` validates on read: anything outside the device set is
   defaulted to `'8'` (and rewritten). First-ever `#` therefore prints `8`.
2. **Both cases** accepted — `hd_fold` maps lowercase (`$61-$7A` → `AND $DF`) and
   shifted PETSCII (`$C1-$DA` → `AND $7F`) to uppercase `$41-$5A`; digits and
   uppercase pass through. Future-proof for the planned lower/upper display font.
3. **Exact match** — only `#`+EOL or `#`+one letter+EOL are local; a non-zero third
   char routes to the AI (`ldx $02A9 / bne hsh_body`).

### 9.2 What was built (bank3, entirely inside the reserve)

- **Matcher** prepended at `hsh_dispatch` `$998B` (`$998B–$99D9`, 79 B): `'#'` test,
  bare-vs-letter split, exact-match guard, fold, 8-way validate, local-store vs
  set-and-forward. The old step-11b body is unchanged behind the new label
  **`hsh_body` `$99DA`** (the UCI-present check onward). X is clobbered by the
  matcher (`ldx $02A9`) but the bank2 shim rebuilds `X=$0B` after the call, and
  `hsh_body` doesn't read X — safe.
- **Helpers** after `hsh_ip`: `hd_fold` `$9BCC` (case-fold), `hd_norm_cur` `$9BDD`
  (lazy-default `'8'`). Module now ends `$9C05`, far inside the `$9E9D` reserve wall.
- Nothing else moved semantically — the whole 11b dispatcher just shifted down by
  79 B (all label-based; no hardcoded internal address except the pinned `$998B`
  entry, verified still `$998B`, and the `bne hsh_body` lands exactly on `$99DA`).

### 9.3 Byte-diff & verification

- **Vs `build/archive-11b.bin`: only bank3 changed** (610 B — the 79 B matcher plus
  the downward shift of the dispatcher/fill; banks 0/1/2/4/5/6/7 byte-identical).
- **Cumulative vs `build/archive-10f.bin`:** bank2 264 B (the frozen 11a/11b shim,
  unchanged), bank3 622 B; **banks 0/1/4/5/6/7 byte-identical** (bank5 TMP payload
  untouched — cardinal rule #1 holds; bank1 frozen).
- Emitted-code audit (disassembled from the rebuilt bin): `hsh_dispatch`=`$998B` ✓,
  `hsh_body`=`$99DA` ✓, first `bne` target = `$99DA` ✓, fold/validate chains and the
  two `sta $CF2A` stores correct, `#C`/`#N` → `jmp hsh_body`. No `.errorif` tripped.
- Archived `build/archive-12.bin`.

### 9.4 Hardware test plan for step 12 (Honza)

Arm first: type `HONDANI`.

1. **Bare `#`** ↵ → prints `8` (lazy default), then `READY.`.
2. **Set + read local:** `#h` ↵ (nothing printed, `READY.`), then `#` ↵ → prints `H`.
   Repeat with `#t`→`T`, `#f`→`F`, `#8`→`8`, `#9`→`9`, `#s`→`S`. Each returns cleanly,
   **no server contact** (try with the server DOWN — must still work instantly).
3. **Both cases:** if you can switch to a lowercase font, `#h` still sets `H`
   (case-folded). (Optional now; the fold is in regardless.)
4. **Eager forward `#c`:** with the server UP, `#c` ↵ → server reply (e.g. `CSDB mode`)
   + `READY.`, **and** `#` ↵ now → prints `C`. Then `#n` similarly → `N`.
5. **Garbage → AI:** `#z` ↵ and `#help` ↵ → go to the server/AI path (reply or, if
   the server has no handler, the stock error) — **not** treated as a device set;
   `#` afterwards still shows the previous device (unchanged by garbage).
6. **Gate + regression intact:** `PRINT 1/0` → `?DIVISION BY ZERO`; `i:hello world`
   → AI reply + `READY.`; `HONDANI HELP` unchanged; console switch `C=+CTRL+1..7`
   (10a–d); stock sweep; freeze→resume; TASS launch/exit.
7. **PEEK check:** `PRINT PEEK(53034)` shows the current device letter's PETSCII
   (`$CF2A` = 53034; `8`=56, `H`=72, `C`=67, …).

If all pass, step 12 is done and step 13 (`status`, first UCI DOS/NET read) is next.

**RESULT (Honza, hardware, 2026-07-10): ALL PASS.** `#` prints the current device,
local sets work server-down, `#c`/`#n` eager-forward + set the letter, garbage → AI,
gate + stock sweep intact. Step 12 done. `build/archive-12.bin`.

---

## 10. Step 13 — `status` (BUILT IN SUB-STEPS; split confirmed by Honza)

Decisions (Honza, 2026-07-10): print **IP + netmask + gateway** (all 12 GET_IP
bytes), **labeled multi-line** layout, and **split the step 13a / 13b** so each is
hardware-tested separately. Server host + reachability target stays `192.168.1.2:6464`
(the same `hsh_ip` string the chat path uses).

### 10a. Step 13a — `status` matcher + UCI IDENTIFY only (BUILT 2026-07-10, awaiting HW test)

First UCI **DOS** read from bank3 (all prior bank3 UCI traffic was NET, target `$03`).
13a proves a DOS1 (target `$01`) command round-trips through the trampoline and its
reply string prints; 13b then adds the NET GET_IP octet-printing + a reachability probe.

**What was built (bank3 only):**
- **Dispatcher-top reroute.** The `'#'`-miss branch `bne hsh_body` became
  `beq hsh_ishash / jmp hsh_ck_status` (near `beq` + far `jmp`, because
  `hsh_ck_status` @ `$9C09` is 628 B away — out of `bne` range). This is a +3-byte
  insert at the top, so the whole 11b/12 dispatcher shifted **uniformly down by 3
  bytes** (same idiom as step 12's 79-byte matcher shift; all internal refs are
  label-based, KickAss recomputes them). Pinned entry `hsh_dispatch=$998B` unchanged;
  the bank2 trampoline's `jsr $998B` still lands correctly.
- **`hsh_ck_status` @ `$9C09`** — case-folds each typed char via the existing
  `hd_fold` and compares to `st_word` (`"STATUS"` = `53 54 41 54 55 53`); requires
  EOL at `$02A7+6` (exact, no args). Match → `jsr do_status` + `clc` (handled, no
  stock error). Miss → `jmp hsh_body` (normal dispatcher / AI).
- **`do_status` @ `$9C28`** — UCI-present guard (`$DF1D==$C9`); present →
  `st_identify`; absent → print `st_noult` (`"NO ULTIMATE"`) + CR.
- **`st_identify` @ `$9C45`** — bounded `hsh_widl` (+ `$0E` kick), send target `$01`
  cmd `$01`, `hsh_push`; on success print a leading CR, bounded `hsh_wdav` for the
  first byte, then drain the DATA_AV queue to CHROUT, `hsh_fin` (status/accept →
  idle), trailing CR. Reuses the proven bounded helpers exactly — never hangs.

**Byte-diff & verification:**
- Vs `build/archive-12.bin`: **751 B, all in bank3** (`$7990–$7C93` file offset =
  `$9990–$9C93`). = the uniform 3-byte downward shift of the existing dispatcher +
  the new 13a block. Banks 0/1/2/4/5/6/7 **byte-identical** (bank2 trampoline/shim
  frozen, bank5 TMP payload untouched — cardinal rule #1 holds).
- Module now ends `~$9C95`, far inside the `$9E9D` reserve wall; bank3 real data at
  `$9E9D` byte-identical to stock. No `.errorif` tripped; all `st_*`/`hsh_*` labels
  resolved. Archived `build/archive-13a.bin`.

**Hardware test plan for 13a (Honza).** Arm first: type `HONDANI`.
1. **Identify:** type `STATUS` ↵ → prints the UCI firmware ident string (e.g.
   `*** C64 Ultimate (V1.47) 3.14 ***`) on its own line, then `READY.`. Repeat 2–3× —
   same string each time, machine stays alive (bounded loops, no hang).
2. **Exact match:** `STATUS ` (trailing space / any arg) and `STAT` → **not** treated
   as the command → go to the AI/stock-error path, not the ident string.
3. **Gate + regression intact:** `PRINT 1/0` → `?DIVISION BY ZERO`; `i:hello world`
   → AI reply; `#` ↵ → device letter (step 12 unaffected); `HONDANI HELP` unchanged;
   console switch `C=+CTRL+1..7`; stock sweep; freeze→resume; TASS launch/exit.
4. **PEEK check (optional):** machine responsive after several `STATUS` in a row
   (no bank leak — always lands back on bank2 then bank1).

If all pass, 13b adds the local IP/netmask/gateway lines + the SERVER UP/DOWN probe.

**RESULT (Honza, hardware, 2026-07-10): ALL PASS.** `STATUS` prints the firmware
ident string; exact-match + gate + stock sweep intact; machine stays alive across
repeats. First bank3 DOS read proven. `build/archive-13a.bin`.

### 10b. Step 13b — GET_IP (IP/NM/GW) + SERVER reachability (BUILT 2026-07-10, awaiting HW test)

Completes `status`: after the ident string, print the three local-address lines and
a `SERVER <host>: UP/DOWN` reachability line. First bank3 **NET GET_IP** read and the
first byte→decimal printing in the wedge.

**What was built (bank3 only):**
- **`do_status` chained** — `st_identify` → `st_getip` → `st_reach` (+6 B insert, so
  the 13a tail shifted down 6 B; label-based, all internal refs recomputed).
- **`st_getip` @ `$9C9B`** — NET GET_IP (`hsh_hdr` target `$03` cmd `$05`, payload
  byte `$00` = interface 0), `hsh_push`, bounded `hsh_wdav`, read up to 12 bytes into
  `$CF50-$CF5B` (buffer zeroed first; excess drained), `hsh_fin`. Then prints
  `IP: a.b.c.d` / `NM: …` / `GW: …` via `st_prlabel` + `st_proctets`.
- **`st_proctets` @ `$9D05`** — A = buffer offset (0/4/8); prints 4 octets dotted +
  CR. Register-free across `prbyte` via `$CF45`/`$CF46` scratch.
- **`prbyte` @ `$9D30` / `prdig` @ `$9D50`** — self-contained 0..255 → decimal, no
  leading zeros (uses `$CF40-$CF42`; **no** BASIC-ROM `$BDCD` dependency). Verified
  byte-exact on the built image (hundreds/tens via repeated-subtract `prdig`, ones
  always printed; `0`→"0", `1`→"1", `10`→"10", `192`→"192", `255`→"255").
- **`st_reach` @ `$9D79`** — prints `SERVER ` + the `hsh_ip` host string, then a
  bounded TCP connect probe to host:6464 (reuses `hsh_hdr`/`push`/`wdav`/`fin`);
  status `"00"` → `hsh_close` + `: UP`, else → `: DOWN`. Same host the chat path uses.
- Data: `st_labels` (`"IP: NM: GW: "`), `st_srvlbl`, `st_uptxt` (`": UP",CR`),
  `st_dntxt` (`": DOWN",CR`). Module ends `~$9E08`, under the `$9E9D` reserve wall.

**Byte-diff & verification:**
- Vs `build/archive-13a.bin`: **450 B, bank3 only** (`$9C12–$9E06`) = the 6-B
  `do_status` insert + new block. Banks 0/1/2/4/5/6/7 **byte-identical** to their prior
  images (bank2 shim/trampoline frozen, **bank5 TMP untouched**). Reserve tail
  `$9E9D` byte-identical to stock. No `.errorif` tripped; all labels resolved; emitted
  bytes for `prbyte`/`prdig`/`st_proctets`/data spot-checked correct.
- Archived `build/archive-13b.bin`.

**Hardware test plan for 13b (Honza).** Arm first: type `HONDANI`.
1. **Full status, server UP:** `STATUS` ↵ →
   ```
   *** C64 Ultimate (Vx.yz) … ***
   IP: <your C64U local IP>
   NM: <netmask>
   GW: <gateway>
   SERVER 192.168.1.2: UP
   READY.
   ```
   Confirm the **IP/NM/GW match your actual network** (cross-check the Ultimate menu),
   and the octets read naturally (no leading zeros, `1` not `001`).
2. **Server DOWN:** stop the HDN server, `STATUS` ↵ → identical IP/NM/GW, but the last
   line reads `SERVER 192.168.1.2: DOWN` (within ~1 s, no hang). Restart server →
   `UP` again. Toggle a couple of times.
3. **Repeat/soak:** run `STATUS` several times back-to-back — stable output, machine
   alive (bounded loops, always lands back on bank2→bank1; no bank leak).
4. **Gate + regression:** `PRINT 1/0`→`?DIVISION BY ZERO`; `i:hello world`→AI reply;
   `#`→device letter; `#c`→server reply; `HONDANI HELP`; console switch `C=+CTRL+1..7`;
   stock sweep; freeze→resume; TASS launch/exit.

If all pass, step 13 (`status`) is complete and step 14 (`time`/`reset`/`menu`) is next.

**RESULT (Honza, hardware, 2026-07-10): 13a + 13b ALL PASS.** `status` prints the
firmware ident + correct IP/NM/GW + SERVER UP/DOWN (toggled). Step 13 complete.
`build/archive-13b.bin`.

---

## 11. Step 14 — `time` / `reset` / `menu` (tiny control/DOS commands)

Device-independent local commands (routing table: run regardless of `$CF2A`).
Matched at the dispatcher top, **exact + case-folded + no args**, same discipline as
`status`. Decisions (Honza, 2026-07-10):
- **`reset`** → **RR clean cold-boot via a RAM stub**: map bank0 (RR boot; `CBM80`
  autostart confirmed at `$8004`, coldstart `$8009`) then `jmp ($8000)`. The bank
  switch + jump MUST run from RAM (repaging the `$8000-$9FFF` window from code inside
  it pulls the code out from under itself — the trampoline lesson). BASIC program
  lost; RAM not zeroed (== pressing RESET). *Not a plain `jmp $FCE2`* — that would
  leave RR mapped to bank3 and likely not cold-start cleanly.
- **`menu`** → UCI **CONTROL FREEZE** (`$04`/`$05`); the Ultimate freezes to its own
  menu. On menu resume the C64 continues from the frozen state and unwinds to READY.
- **Split** (Honza): **14a = `time` + `menu`** (low-risk UCI sends), **14b = `reset`**
  (banking-sensitive) alone.

### 11a. Step 14a — `time` + `menu` (BUILT 2026-07-10, awaiting HW test)

**Space reality.** The bank3 reserve free run after step 13b was `$9E08-$9E9D` (~149
bytes). To fit both commands *and* leave room for 14b, the tested DOS1 read+print body
was **factored out** of `st_identify` into a shared `dos1_read_print` (also driven by
`time`); a shared `cmd_match` keyword matcher was added; and a shared `uci_idle_kick`
(the bounded-idle-wait + `$0E` kick preamble) was extracted. `st_identify` is now just
`lda #$01 : jmp dos1_read_print` — **status is re-tested as 14a regression** since its
read path moved.

**What was built (bank3 only):**
- **`st_no` reroute** — was `jmp hsh_body`, now `jmp hsh_ck_more` (the new 'time'/'menu'
  chain), which itself falls through to `hsh_body` (chat/AI) on no match. Zero change
  to the pinned `hsh_dispatch=$998B` entry or the `#`/`status` matchers above it.
- **`uci_idle_kick` `$9DCF`** (14 B) — `hsh_widl`; if stuck, `$0E` kick + retry; rts.
- **`dos1_read_print` `$9DDD`** (A = DOS1 cmd byte) — stash cmd `$CF47`, `uci_idle_kick`,
  send target `$01` + cmd, `hsh_push`, then print the reply string framed by a leading
  + trailing CR via bounded `hsh_wdav`/`$FFD2`/`hsh_fin`. Shared by `st_identify` (`$01`)
  and `do_time` (`$26`). Byte-for-byte the old identify read logic, just parameterized.
- **`do_time` `$9E15`** — UCI-present guard (`$DF1D==$C9`) → `lda #$26` (GET_TIME) →
  `jmp dos1_read_print`. Prints the RTC string (e.g. ` 2024/12/31 23:59:59`).
- **`do_menu` `$9E22`** — UCI-present guard → `uci_idle_kick` → send target `$04`
  (CONTROL) + cmd `$05` (FREEZE) → `hsh_push` → `hsh_fin`. The freeze then takes over.
- **`cmd_match` `$9E3D`** — A = keyword offset in `kw_tab`, Y = length; case-folds each
  typed char via the existing `hd_fold` and compares; returns Z=1 iff line == keyword
  AND next char is EOL (exact, no args). Scratch `$CF45/$CF46` (free during matching).
- **`hsh_ck_more` `$9E63`** — tries `time` then `menu` via `cmd_match`; on match runs
  the handler + `clc` (handled); else `jmp hsh_body`. `kw_tab` `$9E82` = `"TIME","MENU"`.

**Byte-diff & verification:**
- Vs `build/archive-13b.bin`: **563 B, bank3 only** (`$9C12-$9E89`) = the `st_identify`
  refactor + downstream address shifts (label-based; `do_status`'s `jsr` targets moved)
  + the new block. Banks 0/1/2/4/5/6/7 **byte-identical** (bank2 shim/trampoline frozen,
  bank1 frozen, **bank5 TMP untouched** — cardinal rule #1 holds).
- Module now ends `kw_tab+8 = $9E8A`, still under the `$9E9D` reserve wall (**19 B free**
  for 14b — 14b will reclaim the inline `status` matcher into `cmd_match` if it needs
  more). Pinned `hsh_dispatch=$998B` unchanged; bank2 trampoline `jsr $998B` still lands.
  No `.errorif` tripped. Emitted opcodes for every new routine spot-checked from the
  rebuilt bin (target/cmd bytes, branch targets, `kw_tab`). Archived `build/archive-14a.bin`.

**Hardware test plan for 14a (Honza).** Arm first: type `HONDANI`.
1. **`time`:** `TIME` ↵ → prints the current date/time on its own line, then `READY.`.
   Repeat 2-3× — sensible clock, machine stays alive (bounded loops).
2. **`menu`:** `MENU` ↵ → the **Ultimate menu appears** (freeze). Exit/resume the menu →
   the C64 returns to `READY.` (or use the menu's own reset/run as you like).
3. **Exact match:** `TIME ` (trailing space/arg), `TIM`, `MEN`, `MENUS` → **not** the
   command → go to the AI/stock-error path, not the time/menu action.
4. **`status` regression (its read path moved):** `STATUS` ↵ → same firmware ident +
   IP/NM/GW + SERVER UP/DOWN as step 13.
5. **Gate + regression intact:** `PRINT 1/0`→`?DIVISION BY ZERO`; `i:hello world`→AI
   reply; `#`→device letter; `#c`→server reply; `HONDANI HELP`; console switch
   `C=+CTRL+1..7`; stock sweep; freeze→resume; TASS launch/exit.

If all pass, 14b adds `reset` (RAM stub + bank0 cold-boot).

**RESULT (Honza, hardware, 2026-07-10): 14a ALL PASS.** `time` prints the RTC;
`menu` freezes to the Ultimate menu and resumes cleanly; exact-match + `status`
regression + gate + stock sweep intact. `build/archive-14a.bin`.

### 11b. Step 14b — `reset` (BUILT 2026-07-10, awaiting HW test)

Adds the third command. `reset` **cold-boots the RR cartridge cleanly** (Honza's
decision): map bank0 (which holds RR's boot code — `CBM80` autostart confirmed at
`$8004`, coldstart `$8009`) then `jmp $FCE2`; the KERNAL reset finds that `CBM80`
and cold-starts RR properly. *Not a plain `jmp $FCE2`* — with bank3 still mapped the
KERNAL would find no cartridge signature and boot a bare C64 with RR un-armed.

**Why a RAM stub:** the `$de00` bank write and the following jump MUST execute from
RAM — repaging the `$8000-$9FFF` window from code living inside it pulls that code
out from under itself (the same rule the `call_bank3` trampoline follows). `do_reset`
copies an 8-byte stub to **`$0370`** (a free page-3 gap, clear of the `$0360`
`call_bank3` trampoline and every other page-3 stub) and jumps to it:
```
$0370  A9 00        lda #$00      ; bank0 = RR boot
$0372  8D 00 DE     sta $de00     ; map bank0 (from RAM)
$0375  4C E2 FC     jmp $fce2     ; KERNAL reset -> finds CBM80 in bank0 -> $8009
```
`$de00 = $00` reproduces RR's power-on/reset register state (bank field = 0, mode
bits 0). RAM is preserved (not zeroed); the BASIC program is lost — identical to
pressing RESET.

**Space: the reserve was full after 14a**, so 14b first **reclaimed** room:
1. **Folded the inline `status` matcher into the shared `cmd_match`.** `hsh_ck_status`
   dropped its bespoke compare loop (`st_ml`) and now does `lda #kw_status_off /
   ldy #6 / jsr cmd_match / bne st_no / jsr do_status / clc / rts`; `"STATUS"` moved
   from `st_word` into `kw_tab`. Reclaimed ~14 B; unifies all four commands on one
   matcher. (`status` is re-tested as 14b regression since its match path moved.)
2. **Dropped `do_time`'s redundant UCI-present guard** (`lda $df1d / cmp #$c9 / bne`).
   The shared `dos1_read_print` already runs only bounded helpers (`uci_idle_kick` +
   `hsh_push`), which no-op safely (time out, print nothing) if UCI were ever absent
   — which never happens on the Ultimate-only target. On-target behaviour is
   identical; saved 8 B. (`do_menu` keeps its guard — unchanged.)

**What was built (bank3 only):**
- **`ckm_reset`** inserted in the `hsh_ck_status → ckm_time → ckm_menu → ckm_reset →
  ckm_none(chat/AI)` chain: `cmd_match` on `"RESET"` (kw_tab offset 14) → `jmp do_reset`.
- **`do_reset` `$9E72`** + **`rstub` `$9E80`** (8 B) as above.
- **`kw_tab` `$9E88`** grown to `TIME`(0) `MENU`(4) `STATUS`(8) `RESET`(14).

**Byte-diff & verification:**
- Vs `build/archive-14a.bin`: **634 B, bank3 only** (`$9C09-$9E9A`) = the status-fold
  upward shift + the new reset code. Banks 0/1/2/4/5/6/7 **byte-identical** (bank2
  shim/trampoline frozen, bank1 frozen, **bank5 TMP untouched** — cardinal rule #1).
- Module now ends `kw_tab+19 = $9E9B`, still under the `$9E9D` reserve wall (2 B to
  spare). Pinned `hsh_dispatch=$998B` and the dispatcher-top `jmp hsh_ck_status`
  target `$9C09` unchanged. No `.errorif` tripped; every new/changed routine's
  emitted opcodes (matcher offsets, `rstub` bytes, copy loop, branch targets)
  spot-checked from the rebuilt bin. Archived `build/archive-14b.bin`.

**Hardware test plan for 14b (Honza).** Arm first: type `HONDANI`.
1. **`reset`:** `RESET` ↵ → the machine **reboots into the RR banner/READY** as if you
   pressed RESET (RAM not zeroed; BASIC program cleared). RR is armed/normal after.
   If instead it boots a bare C64 without RR, or hangs, the `$de00=$00` mode value
   needs adjusting — report which.
2. **`time` regression (guard removed):** `TIME` ↵ → still prints the date/time.
3. **`menu` regression:** `MENU` ↵ → Ultimate menu, resume → `READY.`.
4. **`status` regression (match path moved):** `STATUS` ↵ → ident + IP/NM/GW +
   SERVER UP/DOWN as before.
5. **Exact match:** `RESET ` (arg), `RESE`, `RESETS` → AI/stock-error path, **not** a
   reboot. Likewise `TIM`, `MEN`, `STAT`.
6. **Gate + regression intact:** `PRINT 1/0`→`?DIVISION BY ZERO`; `i:hello world`→AI
   reply; `#`→device letter; `#c`→server reply; `HONDANI HELP`; console switch
   `C=+CTRL+1..7`; stock sweep; freeze→resume; TASS launch/exit.

If all pass, **step 14 is complete** and step 15 (`pwd`/`cd`) is next.

**RESULT (Honza, hardware, 2026-07-10): 14a + 14b ALL PASS.** Step 14 complete.

---

## 12. Step 15-pre — bank3→bank4 RAM trampoline round-trip PROOF (✅ HW TESTED 2026-07-10)

### 12.0 Why a new bank: the bank3 reserve is exhausted

Preparing step 15 (`pwd`/`cd`) surfaced a hard wall: **the bank3 reserve is full.**
After step 14b, `kw_tab` (the last hsh byte) ends at **`$9E9B`**, 2 bytes short of
the `$9E9D` stock-data wall. The only other clean, audited bank3 free region is
the **`$97A2-$97FF` annex = 94 B** (verified all-zero, unreferenced by bank3; the
further ~55 B at `$976A-$97A0` carries disassembler `sub_97xx` labels and would
need its own audit). So safe bank3 free ≈ **96 B**, but step 15 alone needs
~130–185 B, and steps 16–20 (`ll`/`dir`, `mnt`/`umnt`, `mkdir`, `cp`, `memcpy`)
are far larger. The single-bank3 plan ran out of room.

**Survey of all banks for a fresh reserve** (largest contiguous zero run):

| bank | largest zero run | window | usable? |
|---|---|---|---|
| 0 | 125 | `$8102-$817E` | small |
| 1 | 8 | — | frozen, no |
| 2 | 232 | `$9B59-$9C40` | frozen after step 11 |
| 3 | 150 | `$976A-$97FF` | 94 B clean annex (used by 15-pre) |
| **4** | **669** | **`$9C00-$9E9C`** | **YES — byte-identical to stock zeros, unreferenced** |
| 5 | 494 | `$9012-$91FF` | **NO — TMP payload, cardinal rule #1** |
| 6 | 222 | `$8022-$80FF` | possible future |
| 7 | 222 | `$8022-$80FF` | possible future |

**Decision (Honza, 2026-07-10): open bank4** as the step-15+ command home (669 B).

### 12.1 Reaching bank4 — the encoding and safety

- **Bank encoding `b7·4 + b4·2 + b3`** → banks 0-7 = `$00/$08/$10/$18/$80/$88/$90/$98`,
  so **bank4 = `$de00`=`$80`**. Confirmed three ways: the RR `$DE00` register layout
  (b3/b4 = ROM-bank A13/A14, b7 = A15); the stock bank-select table at bank4 `$9EF4`
  (`$80,$88,$90,$98`); and the boot TMP/REU installer at bank4 `$8039` (`$88` bank5,
  `$90` bank6, `$98` bank7).
- **Safe to map transiently:** bank4 is stock-used ONLY by that boot-time TMP/REU
  installer (assembles Turbo Macro Pro from banks 5/6/7 into RAM at launch), **never
  at the BASIC prompt.** Our excursion runs inside the existing `sei` window
  (bank1 IERROR stub) with a RAM trampoline and restore-with-constant `$18` — no ROM
  is pulled from under executing code. Identical guarantee to bank2→bank3 (step 11).
- **`call_bank4` RAM trampoline at `$0378`** (14 B): `lda #$80 / sta $de00 /
  jsr $9c00 / lda #$18 / sta $de00 / rts`. Self-healed (copied fresh) before each use
  — same model as `call_bank3` (`$0360`) and the reset `rstub` (`$0370`). `$0378-$0385`
  is clear of every OUR persistent stub (IERROR `$0340`, call_bank3 `$0360`, rstub
  `$0370`, CINV `$03A0`). It DOES overlap the datassette buffer that stock RR's tape/
  turbo code (bank2 `$97F7`) stages into `$0348-$03E8`, but that runs only during tape
  ops, never at the prompt — the standard time-shared-buffer convention call_bank3
  already coexists with.

### 12.2 What was built (bank3 annex + bank4 stub)

- **Bank3 annex `hsh_ck_b4` @ `$97A2`** (54 B incl. the 14-B `b4tramp` template).
  Reached from `ckm_none` — the tail of the `time`/`menu`/`reset` chain — which
  changed from `jmp hsh_body` to **`jmp hsh_ck_b4`** (2-byte operand retarget, no
  code shift). Matches the dedicated **`B4`** test command (case-folded `B`, `4`,
  exact EOL), copies `b4tramp`→`$0378`, `jsr $0378`, then `clc/rts` (handled → no
  stock error). Any non-`B4` line → `jmp hsh_body`, i.e. the normal chat/AI forward,
  **exactly as before** — the working dispatcher is untouched.
- **Bank4 stub `b4_stub` @ `$9C00`** (pinned; the trampoline hardcodes `jsr $9c00`):
  `inc $d020 / rts`. The border step is the visible proof that bank4 ROM was mapped
  and executed; if the `$de00=$80` map had failed, `jsr $9c00` would hit bank3's own
  `$9C00` (mid-`do_status`) and misbehave rather than cleanly step the border.

### 12.3 Byte-diff & verification

- **Vs `build/archive-14b.bin`: 58 bytes total** — bank3 `$97A2-$9E71` (54 B: the
  annex + the `ckm_none` retarget) and bank4 `$9C00-$9C03` (4 B: the stub). Banks
  0,1,2,5,6,7 **byte-identical** (bank2 frozen, **bank5 TMP untouched** — cardinal
  rule #1 holds; bank1 frozen). Cumulative vs stock: bank4 now 4 B (was 0).
- Emitted-code audit from the rebuilt bin: all three `bne` in `hsh_ck_b4` target
  `hcb_no` (`jmp $99DD`=hsh_body ✓); `lda $97CB,x` matches the `b4tramp` location ✓;
  `b4tramp` = `A9 80 / 8D 00 DE / 20 00 9C / A9 18 / 8D 00 DE / 60` ✓; `jsr $0378` ✓;
  bank4 `$9C00` = `EE 20 D0 60` ✓; bank4 `$9E9D` real data byte-identical to stock ✓.
  No `.errorif` tripped (three new pins hold: `b4_stub@$9C00`, bank4 fill→`$9E9D`,
  annex fill→`$9800`). Archived `build/archive-15pre.bin`.

### 12.4 Hardware test plan for 15-pre (Honza)

Arm first: type `HONDANI`.
1. **Proof:** type `B4` ↵ → **border colour advances by one**, then `READY.`. Repeat
   3–4× → border steps each time (bank4 executing through the second trampoline; the
   machine stays alive = clean round-trip). Border persists; `POKE 53280,14` or reset
   to restore.
2. **`B4` is handled (no error):** `B4` gives **no** `?SYNTAX ERROR` (it returns C=0).
   `B4X`, `B 4`, `B4 ` (arg/space) → **not** matched → normal AI/stock-error path.
3. **Dispatcher untouched:** `i:hello world` → AI reply + `READY.` (no border step);
   `PRINT 1/0` → `?DIVISION BY ZERO`; `#` → device letter; `#c` → server reply;
   `STATUS`/`TIME`/`MENU`/`RESET` all as in steps 12–14; `HONDANI HELP` unchanged.
4. **Console switch** `C=+CTRL+1..7` (10a–d), **stock sweep**, freeze→resume, **TASS**
   launch/exit — all unchanged.
5. **PEEK check (optional):** after a few `B4`, machine responsive (no bank leak —
   always lands back bank4→bank3→bank2→bank1); `$0378` holds the 14 trampoline bytes;
   `$0360`/`$0370` and the `$0314/$0300` vectors + `$0340/$03A0` stubs unchanged.

If all pass, **bank2→bank3→bank4 nesting is proven** and step 15 (`pwd`/`cd`, built in
bank4 with its own helper copies) proceeds.

**RESULT (2026-07-10): all pass on hardware.** `B4` steps the border each time, the
machine stays alive, and every other command is unchanged. The bank2→bank3→bank4
nesting is proven; step 15 proceeds, split into 15a/15b/15c.

---

## 13. Step 15 — `pwd` / `cd`, built in bank4 (split 15a → 15b → 15c)

Split rationale (same discipline as 13a/13b, 14a/14b): the bank4 command layer needs
a *self-contained* dispatcher + its own copies of the leaf helpers (while bank4 is
mapped, bank3's helpers are unreachable). Rather than pour all of that in at once,
15a proves the **dispatch machinery** (bank4 reads `$02a7`/`$cf2a`, CHROUTs, and the
carry-routed handled/not-mine gateway works, with chat/AI still intact) using a
proof-print, then 15b/15c add the real UCI DOS behaviour on top of a proven skeleton.

### 13.1 Architecture — the bank4 command dispatcher (`b4_disp` @ `$9C00`)

The bank3 `B4` proof-gateway is replaced by the **real gateway**: `hsh_ck_b4` now
*always* self-heals the `call_bank4` trampoline (`$0378`, unchanged 14 bytes) and
`jsr`s it into bank4 `b4_disp` (`$9C00`, pinned — the trampoline hardcodes `jsr
$9c00`). bank4 owns all matching/execution for its command set and returns:

- **C=0 = handled** → bank3 `rts` (no stock `?SYNTAX ERROR`).
- **C=1 = not mine** → bank3 `jmp hsh_body` (chat/AI forward — *and* this is exactly
  the c/n server-forward path for `pwd`/`cd`, so c/n needs no extra bank4 code).

Carry survives the trampoline's `lda #$18 / sta $de00` restore (neither touches C),
so bank4's final `clc`/`sec` reaches the bank3 branch intact. Everything runs inside
the existing `sei` window; the trampoline runs from RAM so the `$de00` flips never
pull ROM out from under the executing code; restore is the **constant `$18`**, never
a `$de00` read-back (10b post-mortem). Bank-independent surfaces bank4 uses directly:
`$02a7` (shadow line), `$cf2a` (current device), `$dfxx` (UCI regs), `$ffd2` (CHROUT
via `($0326)=$F1CA` in KERNAL).

### 13.2 What was built in 15a (bank4 `$9C00`, 125 B; bank3 annex, 52 B)

- **bank4 `b4_disp`** (`$9C00`): match `pwd` (exact, case-folded via a local `b4_fold`
  = byte-copy of bank3 `hd_fold`, EOL required — no args); on match, print `"PWD: "`
  + the **normalized current-device letter** (`b4_curdev` = byte-copy of bank3
  `hd_norm_cur`, lazy-defaulting `$cf2a` to `'8'`) + CR, then `clc/rts`. No match →
  `sec/rts`.
- **bank3 gateway** (`hsh_ck_b4`, annex `$97A2`): dropped the `B4` string match (proof
  only); now unconditionally calls bank4 and branches on carry (`bcs hcb_no` →
  `jmp hsh_body`, else `rts`). Net smaller than the 15-pre gateway — freed annex bytes
  zero-fill up to `$9800`. The `b4tramp` (14 B) is unchanged.

### 13.3 Byte-diff & verification (rebuilt vs `build/archive-15pre.bin`)

- **177 bytes differ, all in bank3 + bank4**: bank3 **52 B** (annex gateway rewrite),
  bank4 **125 B** (dispatcher). Banks **0,1,2,5,6,7 byte-identical** to the 15-pre
  image (bank2 frozen, **bank5 TMP untouched** — cardinal rule #1 holds). Confirmed by
  a per-bank `cmp -l` sweep. Banks 0/1/2/5/6/7 also match stock exactly except the
  frozen wedge banks 1 (168 B) and 2 (1100 B), unchanged from prior steps.
- **Emitted-code audit** (from the rebuilt bin): bank4 `$9C00` = `AD A7 02` (`lda
  $02a7`) `20 3F 9C` (`jsr b4_fold`) `C9 50` (`cmp #'P'`) `D0 33` (`bne b4_nomatch`),
  then the W/D compares — ✓. bank3 `$97A2` = `A2 0D / BD B6 97 / 9D 78 03 / CA 10 F7`
  (trampoline self-heal), `20 78 03` (`jsr $0378`), `B0 01` (`bcs hcb_no`), `60`
  (`rts`), `4C DD 99` (`jmp hsh_body`) — ✓ carry-routed. No `.errorif` tripped
  (`b4_disp@$9C00`, bank4 fill→`$9E9D`, annex fill→`$9800` all hold).
- Deployed `.crt` md5 matches `build/hdn-rr38p-tmp12reu.crt`; archived
  `build/archive-15a.bin`.

**RESULT (2026-07-10): all pass on hardware.** `pwd` prints `PWD: <dev>`, tracks the
device across `#t`/`#h`/`#9`/`#8`, non-matches still chat, dispatcher unchanged. The
bank4 dispatch machinery is proven; 15b builds real behaviour on it (below).

### 13.4 Hardware test plan for 15a (Honza)

Arm first: type `HONDANI`.
1. **pwd proof:** `pwd` ↵ → prints `PWD: 8` (default device), then `READY.`. Repeatable.
2. **device tracked:** `#t` ↵ (device → T), then `pwd` → `PWD: T`. Try `#h`→`PWD: H`,
   `#9`→`PWD: 9`, back to `#8`→`PWD: 8`. (15a only *prints* the device; real path
   listing arrives in 15b.)
3. **not-a-command still chats:** `pwd` with any arg (`pwd x`, `pwd `) is **not**
   matched → normal AI/stock path; `i:hello world` → AI reply; free text → AI.
4. **dispatcher untouched:** `PRINT 1/0` → `?DIVISION BY ZERO`; `#`/`#c`; `STATUS`/
   `TIME`/`MENU`/`RESET` as in steps 12–14; `HONDANI HELP` unchanged.
5. **Console switch** `C=+CTRL+1..7`, **stock sweep**, freeze→resume, **TASS** — all
   unchanged.

If all pass, 15b replaces the proof-print with real behaviour: h/t/f → UCI DOS
GET_PATH (`$12`, via bank4 copies of `dos1_read_print` + the bounded UCI helpers);
c/n → return C=1 (bank3 forwards the raw line to the server); 8/9/s → print
"not supported on IEC".

### 13.5 Step 15b — real `pwd` (BUILT 2026-07-10, awaiting HW test)

**What was built (bank4 only; bank3 unchanged since 15a).** `b4_disp` keeps the
`pwd`-exact match, then dispatches on the normalized current device (`b4_curdev`):

- **c/n** → `beq b4_nomatch` → `sec/rts` → bank3 `hsh_body` forwards the raw `pwd`
  line to the server (which routes it to the csdb/netdrive module by `active_module`).
  No bank4 output — exactly the desired server-tracked-cwd behaviour, zero extra code.
- **h/t/f** → `b4_dos1_read_print` with `$12` (DOS GET_PATH): sends target `$01` +
  `$12`, prints the returned path string framed by CRs, `clc/rts` (handled).
- **8/9/s** → print `"NOT SUPPORTED ON IEC"` + CR, `clc/rts` (handled).

The UCI leaf helpers bank4 needs are **byte-faithful copies** of the bank3 originals,
ported in full since bank3 is unreachable while bank4 is mapped:
`b4_dos1_read_print`, `b4_idle_kick`, `b4_widl`, `b4_push`, `b4_wdav`, `b4_fin`. They
touch only `$dfxx` (UCI regs) and `$cf26/$cf30/$cf31/$cf47` scratch — all
bank-independent, transient, and never contended (bank3/bank4 are never both mapped).
Every wait loop is bounded (~64K polls) with `$0E` recovery, so no path can hang.

**Byte-diff & verification (rebuilt vs `build/archive-15a.bin`):**
- **Only bank4 differs (381 B); bank3 + banks 0/1/2/5/6/7 byte-identical.** The stock
  real-data pin at `$9E9D` is intact (`20 BA DE 00 00 00 00`); no `.errorif` tripped.
- Emitted dispatch @ `$9C00`: `AD A7 02` / `20 52 9C` (`jsr b4_fold`) / `C9 50` /
  `D0 46`, W/D compares, then `20 63 9C` (`jsr b4_curdev`) / `C9 43` (`cmp #'C'`) …
  device fan-out — ✓.
- **Reserve usage:** the bank4 module now spans `$9C00–$9DA1` = **418 B of 669**;
  **251 B free** for 15c (`cd`) + steps 16–20 (each reuses these helpers → cheap).
- Deployed `.crt` md5 matches `build/hdn-rr38p-tmp12reu.crt`; archived
  `build/archive-15b.bin`.

**Hardware test plan for 15b (Honza).** Arm first: type `HONDANI`.
1. **Ultimate FS:** `#t` then `pwd` → prints the current Ultimate path (e.g. `/Temp/`
   or `/`); `#h` `pwd`, `#f` `pwd` likewise. Path should reflect reality on the C64U.
2. **IEC not supported:** `#8` `pwd` → `NOT SUPPORTED ON IEC`; `#9`/`#s` same.
3. **Server-forwarded:** `#c` then `pwd` → the **server's** cwd reply (csdb module);
   `#n` `pwd` → netdrive reply. (Server must be up; if down, stock `?SYNTAX ERROR` ≤5s
   — the bank3 forward path, unchanged.)
4. **Regression:** `pwd x` (arg) → AI/stock (not matched); `i:hello`→AI; `PRINT 1/0`→
   `?DIVISION BY ZERO`; `#`/`STATUS`/`TIME`/`MENU`/`RESET`/`HONDANI HELP`; console
   switch; stock sweep; freeze→resume; TASS — all unchanged.

If all pass, **15c** adds `cd` (CHANGE_DIR `$11` with a path payload; `cd ..`, `cd /`,
relative/absolute) reusing the same bank4 helpers.

**RESULT (2026-07-10): all pass on hardware.** h/t/f `pwd` prints the Ultimate path,
IEC prints the notice, c/n forwards to the server, regressions clean. 15c proceeds.

### 13.6 Step 15c — `cd` (BUILT 2026-07-10, awaiting HW test)

**What was built (bank4 only; bank3 unchanged since 15a).** `b4_disp` becomes a
two-command dispatcher: the first case-folded char selects the family (`'P'`→pwd,
`'C'`→cd, else `sec/rts`), so pwd is unchanged and cd is added alongside.

- **Match:** `cd` requires a following **space** (`"cd" + $20`); `cdX` is not our
  token → chat. Leading spaces after `cd` are skipped to the first arg char; `cd`
  with no path → chat. The arg start index is stashed in `$cf48`.
- **Device dispatch** (via `b4_curdev`, mirroring pwd, factored through the shared
  `b4_is_htf` and `b4_prnsup`): c/n → `sec/rts` (bank3 forwards the raw `cd …` line
  to the server); 8/9/s → `NOT SUPPORTED ON IEC`; h/t/f → UCI DOS CHANGE_DIR.
- **CHANGE_DIR ($11):** `b4_idle_kick`, write target `$01` + `$11` + the raw arg bytes
  (terminator omitted — the FIFO length delimits the payload), `b4_push`, then
  `b4_fin` (C=0 iff status `"00"`). **Silent on success** (unix-style); on push
  failure or non-`"00"` status → print `NOT FOUND` + CR. The Ultimate CHANGE_DIR
  resolves `..`, `/`, relative and absolute natively, so no path parsing in the
  wedge. Bounded loops + `$0E` recovery throughout — never hangs.
- New leaf helpers: `b4_prnsup` (shared IEC notice), `b4_is_htf` (Z=1 iff H/T/F),
  string `b4_cderr` = `"NOT FOUND",CR,0`. All other helpers reused from 15b.

**Byte-diff & verification (Sonnet subagent, rebuilt vs `build/archive-15b.bin`):**
- **Only bank4 differs (535 B); banks 0/1/2/3/5/6/7 byte-identical** (bank3 frozen
  since 15a; bank5 TMP untouched). Stock pin at `$9E9D` intact (`20 BA DE 00 00 00
  00`); no `.errorif` tripped.
- Emitted dispatch @ `$9C00`: `AD A7 02` / `20 CB 9C` (`jsr b4_fold`@`$9CCB`) /
  `C9 50` / `F0 06` (`beq b4_ck_pwd`) / `C9 43` / `F0 34` (`beq b4_ck_cd`) / `38 60`
  (`sec/rts` = b4_nomatch) — ✓ two-family dispatch.
- Deployed `.crt` md5 matches `build/hdn-rr38p-tmp12reu.crt`; archived
  `build/archive-15c.bin`.

**⚠ Reserve headroom.** The bank4 module now spans `$9C00–$9E25` = **550 B of 669;
only 119 B free.** Steps 16–20 (`ll`/`dir`, `mnt`/`umnt`, `mkdir`, `cp`, `memcpy`)
reuse these helpers so incremental cost is lower, but `ll`/`dir` (OPEN_DIR+READ_DIR
loop + optional pattern filter) and `memcpy` (hex parsing + block r/w) are large and
**will not all fit in 119 B**. A third overflow region will be needed before step 16
or 20 — note banks 5/6/7 are the TMP payload (frozen), so the next reserve is not
obvious and needs its own decision (candidate: reclaim more of the bank3 shadow gap,
or a RAM-resident helper page). Flag for Honza; does not block 15c.

**Hardware test plan for 15c (Honza).** Arm first: type `HONDANI`. Server up for c/n.
1. **Ultimate FS nav:** `#t`, `pwd` (note path), `cd <subdir>` (a real dir on Temp),
   `pwd` → reflects the new path; `cd ..` → back up; `cd /` → root; `pwd` confirms
   each. Same on `#h`/`#f`.
2. **Bad path:** `cd nonesuch123` on `#t` → `NOT FOUND`, machine alive; `pwd`
   unchanged.
3. **IEC:** `#8` `cd x` → `NOT SUPPORTED ON IEC`; `#9`/`#s` same.
4. **Server-forwarded:** `#c`, `cd rel/<id>` then `pwd` → server-tracked cwd; `#n`
   likewise.
5. **Token discipline:** `cd` alone → AI/stock (no arg); `cdx` → AI (not the token);
   `pwd` still works as in 15b.
6. **Regression:** `i:hello`→AI; `PRINT 1/0`→`?DIVISION BY ZERO`; `#`/`STATUS`/`TIME`/
   `MENU`/`RESET`/`HONDANI HELP`; console switch; stock sweep; freeze→resume; TASS —
   all unchanged.

If all pass, **step 15 (`pwd`/`cd`) is complete**; step 16 (`ll`/`dir`) follows —
first resolving the reserve-headroom decision above.
