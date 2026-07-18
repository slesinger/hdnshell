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

**RESULT (2026-07-10): step 15 (15a+15b+15c) fully HW tested — all pass.** `pwd`/`cd`
work across h/t/f (UCI DOS), c/n (server-forward) and 8/9/s (IEC notice), regressions
clean. Step 16 proceeds.

---

## 14. Step 16 — `ll` / `dir` (split: 16a base now, 16b filter deferred)

### 14.1 Space decision at the top of step 16 (Honza, 2026-07-10)

The reserve audit at the top of step 16 confirmed the log's warning: **bank4 is the
only ROM overflow and it is capped at `$9E9C`** (`$9E9D`+ is the live TMP bank-switch
code — verified byte-identical to stock, not reclaimable). After 15c only **119 B**
were free; bank3 reserve is full (~2 B); the bank3 annex `$97A2-$97FF` (~40 B) is
bank3-mapped and unreachable while bank4 is mapped; banks 5/6/7 are the frozen TMP
payload. So the "third overflow region" the plan anticipated **does not exist in ROM**.

Finding that softened it: the `ll`/`dir` **base** (OPEN_DIR `$13` + READ_DIR `$14` →
CHROUT, reusing the 15b bank4 helpers) fits in ~104 B of the 119; only the **h/t/f
client-side pattern filter** (per-entry buffer + compare) overflows, and for **c/n the
filter is free** (`ll pat*` forwards verbatim to the server, which filters).

**Honza's call: split step 16.** *16a* = `ll`/`dir` bare-token base now (fits); tokens
`ll` and `dir` only. *16b* = the h/t/f pattern filter + multi-chunk streaming, deferred
until a third code region exists. The RAM-resident-helper-page architecture (option a in
next_steps §"Bank4 reserve") is the intended answer for 16b/17–20.

### 14.2 What was built in 16a (bank4 only; bank3 frozen since 15a)

`b4_disp` gains two more command families off the case-folded first char: `'D'`→`dir`,
`'L'`→`ll`. Both handlers sit past `b4_prnsup`, out of the dispatcher's `beq` range, so
they are reached via two 3-byte `jmp` thunks (`b4_j_dir`/`b4_j_ll`) placed right after
`b4_nomatch` (in range). Placement matters: the block was first put *between* `b4_ck_cd`
and `b4_prnsup` and pushed `b4_prnsup` 203 B away, breaking pwd/cd's existing
`bne b4_prnsup` — moved it to *after* `b4_prnsup` so pwd/cd keep their short branch.

- **Match:** bare token only — `dir`+EOL / `ll`+EOL (each char case-folded via the
  shared `b4_fold`). `ll <arg>`/`dir <arg>` do **not** match → `sec/rts` (C=1) → bank3
  `hsh_body` forwards the raw line. That is exactly right for **c/n** (server lists +
  filters `ll pat*`); for **h/t/f** an arg currently falls to the AI (the deferred
  16b filter will intercept it).
- **Device dispatch** (`b4_do_dir`, via the shared `b4_curdev`, mirroring pwd): c/n →
  `sec/rts` (server-forward); 8/9/s → `b4_prnsup` "NOT SUPPORTED ON IEC" (reused — no
  KERNAL dir port in the wedge; the `$`-pointer wording is a step-21 nicety); h/t/f →
  `b4_open_dir` (OPEN_DIR `$13`, silent) then `b4_dos1_read_print` with READ_DIR `$14`.
- **`b4_open_dir`** (new, ~20 B): idle_kick, write target `$01` + `$13`, `b4_push`,
  `b4_fin` (drain/status/accept), no print — opens the *current* dir (payload len 0).
- **Listing** reuses the proven 15b `b4_dos1_read_print` (leading CR, CHROUT the reply,
  trailing CR, `b4_fin`). **Single-chunk drain** like the pwd path: correct for typical
  dirs; a directory that exceeds one FIFO drain would truncate (never hang — every loop
  is bounded with `$0E` recovery). Multi-chunk accept-gated streaming is deferred to 16b
  together with the filter (the reference `cmd_lsll.asm` uses an accept-loop for this).

### 14.3 Byte-diff & verification (rebuilt vs `build/archive-15c.bin`)

- **Only bank4 differs (633 B — mostly code-shift from the two dispatch thunks near the
  top); banks 0/1/2/3/5/6/7 byte-identical.** bank3 frozen since 15a; bank5 TMP
  untouched (cardinal rule #1). Confirmed by a per-bank `cmp -l` sweep.
- **bank4 `$9E9D`..`$9FFF` (real TMP data / bank-switch code) byte-identical to STOCK**
  (`cmp -l` = 0). No `.errorif` tripped (`b4_disp@$9C00`, no reserve overrun, fill lands
  on `$9E9D`).
- **Emitted-code audit** (rebuilt bin): dispatch `$9C00` = `AD A7 02 / 20 33 9D` (jsr
  b4_fold) `/ C9 50 F0 14` (P→pwd) `/ C9 43 F0 42` (C→cd) `/ C9 44 F0 06` (D→b4_j_dir)
  `/ C9 4C F0 05` (L→b4_j_ll) `/ 38 60` (nomatch) `/ 4C C7 9C` (jmp b4_ck_dir) — ✓.
  `b4_do_dir` `$9CF3` = `20 44 9D` (curdev) `/ C9 43 F0 E8 / C9 4E F0 E4` (c/n→nomatch)
  `/ 20 21 9D` (is_htf) `/ D0 B5` (bne b4_prnsup) `/ 20 0D 9D` (b4_open_dir) `/ A9 14`
  `/ 20 6D 9D` (read_print, READ_DIR) `/ 18 60` — ✓. `b4_open_dir` `$9D0D` = `20 A5 9D`
  (idle_kick) `/ A9 01 8D 1D DF / A9 13 8D 1D DF` (target $01 + OPEN_DIR $13) `/ 20 CB 9D`
  (b4_push) … `b4_fin` `/ 60` — ✓.
- **Reserve usage:** module now spans `$9C00–$9E8D` = **654 B of 669; only 15 B free.**
  bank4 is effectively full — 16b/17–20 are blocked on the third region (see §14.1 /
  next_steps). Deployed `.crt` md5 matches `build/hdn-rr38p-tmp12reu.crt`; archived
  `build/archive-16a.bin`.

### 14.4 Hardware test plan for 16a (Honza)

Arm first: type `HONDANI`. Server up for c/n.
1. **Ultimate FS:** `#t`, then `dir` → lists the current Ultimate/Temp directory; `ll`
   → same listing. `cd <subdir>` then `dir` → reflects the new dir. Same on `#h`/`#f`.
   (A very long dir may truncate at one screen-full-ish — that's the deferred 16b
   streaming, note it but it's not a failure.)
2. **IEC:** `#8` `dir` → `NOT SUPPORTED ON IEC`; `ll` same; `#9`/`#s` same.
3. **Server-forwarded:** `#c` then `dir`/`ll` → the server's listing; `ll <pattern>` →
   server-filtered results (the arg forwards verbatim). `#n` likewise. (Server down →
   stock `?SYNTAX ERROR` ≤5 s — the unchanged bank3 forward path.)
4. **Token discipline:** `dir` / `ll` alone match; `ll x` / `dir foo` on `#t` → AI/stock
   (arg not matched locally in 16a — expected); `dirx`/`lls` → AI (not the token).
5. **Regression:** `pwd`/`cd` still work as in 15b/15c; `i:hello`→AI; `PRINT 1/0`→
   `?DIVISION BY ZERO`; `#`/`STATUS`/`TIME`/`MENU`/`RESET`/`HONDANI HELP`; console switch
   `C=+CTRL+1..7`; stock sweep; freeze→resume; TASS — all unchanged.

If all pass, **16a is done**; before 16b/17 we resolve the third-code-region decision
(RAM-resident helper page is the recommended path — it reclaims the bank4 duplicate
helpers and unblocks 16b–20).

**RESULT (2026-07-10): HW tested — all good EXCEPT h/t/f `ll`/`dir`.** `#`/`status`/`time`/
`menu`/`reset`, pwd/cd, c/n server-forward, the IEC notice, tokens and full regression all
pass. **h/t/f `ll`/`dir` lists only the FIRST entry, and repeated `ll` alternates
"one entry / empty / …".**

**Root cause (confirmed against `docs/inspiration/ultimate_lib.c`, the authoritative UCI
library).** READ_DIR (`$14`) streams **512-byte packets, each of which must be drained AND
`accept`ed to release the next** (ultimate_lib.c:250 *"read this in a loop, and _accept()
the data to get the next packet; each data packet is 512 bytes"*; the u-sample.c consumer
is `while(uii_isdataavailable()){ uii_readdata(); uii_accept(); }`). 16a reused the
single-packet `b4_dos1_read_print` (correct only for the one-packet `pwd`/GET_PATH): it
drains packet 1, `b4_fin`-accepts once, stops. Packets 2+ are never read; the un-accepted
leftover leaves the UCI mid-stream so the NEXT `ll` runs off-by-one → alternating empties.
Everything else survives because each command's `b4_idle_kick` issues `$0E`
(ACC|ABORT|CLR_ERR) first, resyncing the UCI (the same abort-recovery pattern documented in
the old project's round-11 "UCI state survives a reset" post-mortem).

**Fix path.** A correct accept-gated stream loop (`b4_read_dir_stream`: `while(DATA_AV){
drain→CHROUT; accept+bounded-ack; }`, no final status) is ~70 B and **does not fit the 15 B
left in the bank4 reserve** → it is blocked on a third code region. `b4_open_dir` is already
correct (OPEN_DIR returns status only). Full analysis + the third-region decision (recommended:
**bank4 `$9F58-$9FFF`, 168 B in-bank**, proven by a border-flash probe step 16-R first; the
RAM-helper-page design kept as the escalation) is written up in **`next_steps.md` §14a + §15**.
`b4_dos1_read_print` stays untouched (pwd depends on it).

## 15. Step 16-R — third-code-region probe (BUILT 2026-07-10, awaiting HW test)

Before porting the ~70 B `b4_read_dir_stream` fix into bank4 `$9F58-$9FFF`, prove that
region is safe — both that code there **runs + returns**, and that its mere non-zero
presence **does not corrupt the TMP/TASS REU image** (the whole worry with the end-of-bank
padding). This mirrors the 15-pre "B4 border-flash proof" discipline.

**What was built (bank4 only, throwaway — tagged `16-R PROBE (TEMPORARY)` at both sites):**
- Dispatcher (`b4_disp`, `$9C00`): a new first-char route `cmp #$42 ('B') / beq b4_j_b5`,
  plus a thunk `b4_j_b5: jmp b4_probe_9f58` beside the existing dir/ll thunks. **+7 B in the
  reserve → 661/669** (still 8 B free; `.errorif (* > $9E9D)` held, reserve high-water `$9E94`).
- Stub at `$9F58` (19 B, replacing stock zeros): validates the exact token `b5`
  (`$02a7+1=='5'`, `$02a7+2==EOL`), then `inc $d020` (visible border bump) → `clc/rts`
  (handled); non-`b5` `B…` words `sec/rts` → fall through to bank3 chat unchanged.
  Reached by `jmp $9F58` from the thunk — same bank window, **no trampoline** needed.

**Verification (rebuilt vs pristine `rr38p-tmp12reu.bin` + vs `build/archive-16a.bin`):**
- `build/bank04.bin` = 8194 B (2 hdr + `$2000`); bank still ends exactly at `$A000`.
- Stock data `$9E9D-$9EFF` (the `$20 $BA $DE` cross-bank stubs) **byte-identical** to
  pristine — the 7-B insertion shift was fully absorbed by the reserve `.fill`, never
  reaching the stock data.
- `$9F58` stub bytes = `AD A8 02 C9 35 D0 0A AD A9 02 D0 05 EE 20 D0 18 60 38 60` (as intended).
- `$9F6B-$9FFF` (149 B) **still all zero** — only the 19 stub bytes became non-zero.

### 15.1 Hardware test plan for 16-R (Honza)

Flash `hdn-rr38p-tmp12reu.crt`. Arm with `HONDANI`.
1. **Probe runs + returns:** type `b5` a few times → the **border colour steps** each time
   (proves `$9F58` executes and the `rts` unwinds cleanly back through `b4_disp`/`call_bank4`;
   the prompt returns normally, no hang/crash). `bX` (any non-`b5` B-word) → AI/stock, unchanged.
2. **REU image intact (the real point):** launch **TASS**, exit; then a **TMP `\` resume** —
   both must work exactly as before, proving the boot installer did **not** DMA the now-non-zero
   `$9F58+` bytes into the TMP image.
3. **Regression:** full stock sweep + `#`/`status`/`time`/`menu`/`reset`, pwd/cd, c/n forward,
   freeze→resume — all unchanged from 16a.

If all pass, `$9F58-$9FFF` is confirmed as the third code region: **delete the `16-R PROBE`
block + the `'B'`/`b4_j_b5` dispatch entry**, then port `b4_read_dir_stream` there as **16a-fix**.

**RESULT (2026-07-10): HW tested — all good.** `b5` steps the border and returns cleanly;
TASS launch/exit + TMP `\` resume + full stock/regression sweep all unchanged. **`$9F58-$9FFF`
is confirmed as the third code region** — code there runs+returns, and its non-zero presence
does not corrupt the TMP/TASS REU image (the installer copies only `$8121`/`$80B4`, never
`$9F58+`). Probe deleted.

## 16. Step 16a-fix — correct multi-packet READ_DIR streaming (BUILT 2026-07-10, awaiting HW test)

Fixes the 16a defect (§14a: h/t/f `ll`/`dir` listed only the first 512-byte packet and
alternated empty on repeat). The single-packet `b4_dos1_read_print` is replaced — for the
READ_DIR path only — by a new `b4_read_dir_stream` in the third code region (`$9F58`, 90 B).
`b4_dos1_read_print` is untouched (pwd/GET_PATH still uses it — that reply is one packet).

**Protocol (authoritative: `ultimate_lib.c` + `u-shell.c` dir loop).** READ_DIR streams
512-byte packets; each must be drained AND `accept`ed (`$df1c |= $02`) to release the next:
`open_dir; get_dir; while(DATA_AV){ read all bytes; accept; }`. The decisive detail is in
`uii_accept()` (ultimate_lib.c:512): it sets DATA_ACC then **waits for that bit to clear** —
that handshake is the sync point, so an immediate `DATA_AV` (`$df1c & $80`) re-check right
after it reliably reflects the *next* packet. So the loop needs no per-packet poll delay and
never truncates early. `b4_read_dir_stream`:
- `idle_kick → target $01 → cmd $14 → push`; leading CR.
- `b4_wdav` (bounded ~64K) for the FIRST packet (covers command latency / empty dir → finish).
- inner drain: `while ($df1c & $80) { CHROUT $df1e }`.
- accept: `$df1c |= $02`, then bounded wait for bit `$02` to clear (`$cf26` hi-count).
- re-check `$df1c & $80`: set → drain next packet; clear → finish.
- `b4_fin` (drain any trailing status + accept → idle); trailing CR. Every wait bounded → no hang.

**b4_do_dir** now `jsr b4_open_dir` then `jsr b4_read_dir_stream` (was `lda #$14 / jsr
b4_dos1_read_print`) — a same-bank-window `jsr` to `$9F58`, no trampoline.

**Byte-diff & verification (rebuilt vs pristine `rr38p-tmp12reu.bin` + vs `archive-16a.bin`):**
- `build/bank04.bin` = 8194 B; bank ends exactly at `$A000`.
- `b4_read_dir_stream` occupies **`$9F58-$9FB1` (90 B)**; `$9FB2-$9FFF` (78 B) still zero — free
  for 16b/17–20. `$9F00-$9F57` identical to pristine (zeros). Probe fully gone (no `EE 20 D0`).
- Reserve high-water back down to **`$9E8B`** (< `$9E9D` pin, ~17 B headroom) — removing the
  probe route + shortening `b4_do_dir` by 2 B more than paid for the rewire.
- Stock data `$9E9D-$9EFF` **byte-identical** to pristine.
- `$9F58` head bytes: `20 A3 9D A9 01 8D 1D DF A9 14 8D 1D DF 20 C9 9D B0 43 …` (jsr idle_kick,
  target $01, cmd $14, jsr push, …) — as intended.

### 16.1 Hardware test plan for 16a-fix (Honza)

Flash `hdn-rr38p-tmp12reu.crt`, arm with `HONDANI` (server up for c/n).
1. **The fix:** `#t`, then `dir` → lists the **WHOLE** directory (all entries, past 512 B / >1
   packet), not just the first; `ll` → same. Run `ll` **several times in a row** → identical full
   listing each time (**no alternating empty**, the 16a symptom). Same on `#h`/`#f`.
2. `cd <subdir>` then `dir` → reflects the new dir, full listing. `cd ..` / `cd /` back.
3. **Empty dir** (if you can `cd` into one) → just the framing CRs, prompt returns promptly (the
   first-packet `b4_wdav` times out once, bounded — no hang).
4. **IEC / server:** `#8`/`#9`/`#s` `dir`/`ll` → `NOT SUPPORTED ON IEC`; `#c`/`#n` `dir`/`ll` →
   server listing; `ll <pattern>` on c/n → server-filtered (arg forwards verbatim).
5. **Regression:** `pwd`/`cd` unchanged; `#`/`status`/`time`/`menu`/`reset`; stock sweep;
   freeze→resume; **TASS launch/exit + TMP `\` resume** (proves `$9F58` code + the REU image
   still coexist). All unchanged.

If all pass, **16a is fully done**; next is **16b** (h/t/f client-side `ll outrun*` pattern
filter), which also lives in the third region.

**RESULT (2026-07-11): HW tested — 16a-fix good (dir/ll list the whole directory, repeatable).**
One follow-up raised: device letters should bind to Ultimate mount roots (`#t`→/temp, `#h`→/sd,
new `#u`→/usb0). **Decided: DEFER** — it needs unfreezing bank3 (both the new `#u` letter and
auto-`cd` live there) and deserves its own step; it's cleanly separable and doesn't block/
complicate 16b/17–20 (only forward-cost = trivially adding `u` to two validators later). Full
decision + future-step spec: **next_steps.md §16-DEV** (+ table row `DEV`).

### 16.2 Step 16b BLOCKER — READ_DIR per-entry byte format is undocumented

A correct client-side `ll <pattern>` filter must split the READ_DIR stream into per-entry
records and match the *filename* — but the exact wire format (entry delimiter; whether a line
starts with the filename or with attribute/size metadata) is **not documented anywhere in the
repo** (`ultimate_lib.h`'s `struct DirectoryEntry {attributes; filename}` is declared-but-
unused; all sample code just CHROUTs raw packets; the official UltimateDOS spec is referenced
but absent). Our `b4_read_dir_stream` works precisely because it never parses. Resolving 16b
needs the format confirmed from real hardware (the on-screen listing already renders as
readable per-line entries, strongly implying CR/`$0D`-delimited lines, but the filename's
position within a line is unconfirmed). Approach chosen with Honza before implementing.

## 17  Regression fix — HONDANI-armed console-switch hook crashed fastloaded games

**Symptom (Honza, real HW, 2026-07-11):** fresh reboot → `HONDANI` (arms the CINV
console-switch hook) → RR fastload (F1) a game → the game **loads, begins init, then
crashes** (Sprite Studio 64 jumps to the freeze menu; Outrun draws half its init screen
then crumbles). Without `HONDANI` arming, the same fastload runs perfectly.

**Bisection (HW-confirmed the exact cause):**
- Typing a non-HONDANI junk line first (arms only the unrelated IERROR `$0300` stub, NOT
  the CINV hook) → game works. → IERROR path innocent.
- After `HONDANI`, `POKE 788,49:POKE 789,234` (restore `$0314/$0315` to KERNAL `$EA31`,
  disarming ONLY the CINV hook) → game works. → **the live CINV hook at `$0314→$03A0`
  is the cause.** The game reuses the tape buffer (`$033C-$03FB`) where our `$03A0` stub
  lives and/or relies on `$0314`; an IRQ mid-init runs the clobbered stub → crash.

**Why no cartridge-side fix could reach it (Fable5 advisor):** in the failing flow NO
open (bank4) code runs between `HONDANI` and F1 — HONDANI is caught by frozen bank1/bank2,
F1 is stock RR ROM. So the *stub itself* had to change. Chosen fix (Honza): **reopen
bank2** for a permanent, server-independent self-disarm (not the server-DMA option).

**The fix — program-mode self-disarm in the CINV stub:**
- New 4-byte prefix `lda $9d / bne cvr_live`. MSGFLG `$9D` = `$80` at the BASIC prompt,
  `$00` once `RUN` enters program mode. Direct mode → keep the hook live (console switch
  works). Program mode → **restore the saved `$0314/$0315` from `$03EC/$03ED` and chain**,
  so our stub leaves the IRQ path on the first IRQ after RUN, before the game clobbers
  `$03A0`. Semantics become prompt-only console-switch (re-`HONDANI` to re-arm).
- The 7-byte digit table no longer fits inside the stub, so it moved out to **`$03F0`**;
  `cs_install` grew +11 B to copy it there alongside the stub.

**Space / placement (bank2 was full, 1 B):** the grown stub (71 B, `$03A0-$03E6`) + digit
table were relocated into the **232-byte reclaimed pocket at `$9B59`** (the old
`.fill $9C41-*` step-11a shim gap). `cs_install` stays pinned at `$9C41` (grew +11); the
stub's old slot after it became zero padding pinned so **`console_switch` stays at `$9CB7`
and ALL downstream bank2 code is byte-identical** to the frozen build.

**Build + byte-verify (2026-07-11):** `./build.sh` clean (no `.errorif` trips); bank02.bin
= 8194 B. Byte-diff vs pristine frozen bank2: **all 178 changed bytes confined to
`$9B59-$9CB6`**; ZERO diffs at/after `$9CB7` (console_switch + downstream) and ZERO diffs
below `$9B59`; stock RR (`$8000-$9B58`, `$9E80-$9FFF`) untouched. Stub @ `$9B59` starts
`A5 9D D0` (`lda $9d`/`bne`). **HW TESTED 2026-07-11 — ALL PASS:** Sprite Studio 64 and
Outrun both fastload and run correctly after `HONDANI` arming (no freeze menu / no crumble);
C=+CTRL+2..7 console switch still works at the READY prompt (confirms the stub stays live in
direct mode and that `$03F0-$03F6` is free RAM); full regression clean. The MSGFLG `$9D`
direct-vs-program heuristic proved reliable for these RR fastloaders — no CURLIN `$3A`
fallback needed.

### 17.1  HW test plan
1. **THE FIX:** reboot → `HONDANI` → F1 fastload **Sprite Studio 64** → must run normally
   (no freeze menu). Repeat with **Outrun** → must reach its title/game (no crumble).
2. **Feature intact:** reboot → `HONDANI` → at the READY prompt, hold **C=+CTRL+2..7** →
   console switch must still work (proves `$9D=$80` keeps the stub live at the prompt, and
   proves `$03F0-$03F6` is free RAM — the digit compare relies on it).
3. **Re-arm:** after a game disarms the hook, returning to BASIC leaves console-switch off
   until you re-type `HONDANI` (expected new behaviour, not a bug).
4. **Regression:** `ll`/`dir` one-per-line unchanged; pwd/cd; `#8 dir`→IEC notice; stock
   sweep; TASS launch/exit + TMP `\` resume.

## 18  CONS — bank4→bank3 leaf-helper trampoline (space reclaim), staged

**Why:** bank4 keeps byte-identical local copies of 8 bank3 UCI leaf helpers (315 B).
16b-2's correct filter overflowed the third region by 59 B, so we reclaim space by
calling bank3's FROZEN originals through a small RAM trampoline and deleting the bank4
dupes. Chosen over cutting 16b-2 scope; also unblocks steps 17-20.

**Mechanism:** bank4 dispatch already runs under `sei` (bank3 `hsh_ck_b4` heals `b4tramp`
→ `$0378`, jsr `$9c00`, all masked). New `b4c3_install` (at the top of `b4_disp`) self-heals
a 25-byte stub into the free datassette pocket **`$0386-$039E`** (clear of IERROR `$0340` /
call_bank3 `$0360` / call_bank4 `$0378` / CINV `$03A0`). The stub:
`stx vec / sty vec+1 / lda #$18 / sta $de00 / jsr (->jmp (vec)) / lda #$80 / sta $de00 / rts`.
Target bank3 address passed in **X(lo)/Y(hi)**; A is clobbered by the flips, **X/Y/C survive**
(`lda`/`sta` touch neither) — exactly what the C-returning leaf helpers need. `dos1_read_print`
(needs A) will use pre-stash `$cf47` + target `dos1+2` in stage 2.

**Stage 1 (mechanism proof, built+verified 2026-07-11):** trampoline installed; ONLY `cd`'s
`b4_fin` rerouted to bank3 `hsh_fin` (`$9B6A`) via the `$0386` stub — proves C-flag +
`$cf30/$cf31` status pass across the bank switch. All other helper sites stay LOCAL (A/B
safety: if the stub were broken, only `cd` misbehaves; pwd/dir unaffected). No helper bodies
deleted yet (no reclaim yet — that's stage 2).
- Build clean, bank04.bin = 8194. `b4_disp` still pinned `$9C00`. Inserting `jsr b4c3_install`
  (+3 B) shifted the main area +3 (all our code, label-relative; `b4_read_dir_stream` stayed
  pinned at `$9F58`, only its jsr operands updated). Trampoline template assembled byte-exact
  to design (`8E 9D 03 8C 9E 03 A9 18 8D 00 DE 20 9A 03 A9 80 8D 00 DE 60 6C 9D 03 00 00`) at
  `$9FC4`; install loop at `$9FBD`. Third region: **37 B free** after stage-1 code.

### 18.1  Stage-1 HW test plan
Flash, arm HONDANI, select a UCI device (`#t` or `#h`):
1. `cd <valid-subdir>` → silent success (prompt returns, no error) = **C=0 passed through the
   trampoline** (bank3 hsh_fin ran, status "00").
2. `pwd` → shows the new path (confirms cd actually changed dir; pwd uses LOCAL helper, so this
   also cross-checks the trampoline didn't corrupt UCI state).
3. `cd <nonexistent>` → prints **"NOT FOUND"** = C=1 passed through the trampoline (b4_cd_err).
4. `cd ..`, navigate back → works.
5. Regression: `pwd`, `dir`/`ll` on h/t/f still list correctly (local helpers); `#8 dir`→IEC
   notice; c/n forward; stock sweep; TASS/TMP `\` resume; C=+CTRL console-switch still works.

If cd's success AND failure paths both work → trampoline proven → stage 2 (reroute
idle_kick/push/wdav/dos1, delete the 6 bodies, reclaim ~150 B). If cd breaks but pwd/dir are
fine → the trampoline/register-passing is the suspect, isolated cleanly.

### 18.2  CONS stage 2 — reroute the rest + delete the dupes (built+verified 2026-07-11)
With the trampoline proven, rerouted the remaining 10 leaf-helper call sites through
`B4C3_RUN` and DELETED the 6 duplicate bodies (`b4_dos1_read_print`, `b4_idle_kick`,
`b4_widl`, `b4_push`, `b4_wdav`, `b4_fin` — a contiguous block at the end of the leaf area).
`b4_fold`/`b4_curdev` stay local (many callers, tiny).
- Reroutes: idle_kick→`B3_IDLE $9DBB` (cd, open_dir, read_dir_stream), push→`B3_PUSH $9B20`
  (same 3), wdav→`B3_WDAV $9B55` (read_dir_stream), fin→`B3_FIN $9B6A` (open_dir,
  read_dir_stream; cd's was stage 1). **pwd's dos1** needs an A-arg: pre-stash `$cf47` then
  enter bank3 `dos1_read_print+3 = $9DCC` (past its own `sta $cf47`), target via X/Y →
  `B3_DOS1`. The 4 helper calls INSIDE the old dos1 body vanished with the deletion.
- One mechanical fix: rerouting pushed `bne b4_prnsup` (pwd) out of ±127 range → changed to
  `beq b4_pwd_ok / jmp b4_prnsup` (no logic change).
- **Reclaim: main-area free 10 B → 237 B (+227 B).** Third region 37 → 21 B (the 4 in-region
  reroutes cost +16 B). Build clean, bank04.bin = 8194, `b4_disp`@`$9C00` +
  `bank04_data_9F58`@`$9F58` pins hold, ZERO dangling refs, trampoline template byte-exact.
  16b-2's ~130 B filter now fits easily in the reclaimed main area.

### 18.3  CONS stage-2 HW test plan (FULL UCI regression — everything now routes via bank3)
Flash, arm HONDANI, on a UCI device (`#t` then `#h`):
1. **`pwd`** → prints the current path. (Riskiest new path: dos1 reroute + A-arg via `$cf47`
   pre-stash + bank3 entry at +3. If the path prints correctly, arg-passing is proven.)
2. **`cd <subdir>` → silent OK; `pwd` confirms; `cd <bad>` → "NOT FOUND".** (idle_kick+push+fin
   all via bank3.)
3. **`dir` / `ll`** → whole directory, one entry per line. (read_dir_stream's idle_kick/push/
   wdav/fin + open_dir's idle_kick/push/fin, all via bank3.)
4. Repeat 1-3 on the other device.
5. Regression: `#8 dir`→IEC notice; c/n forward; stock sweep; TASS/TMP `\` resume; C=+CTRL
   console-switch still works.
If all pass, CONS is done (~227 B reclaimed) and 16b-2 is unblocked (simplest case-insensitive
prefix filter, in the freed main area).

## 19  16b-2 — h/t/f client-side prefix filter for `dir`/`ll` (built+verified 2026-07-11)

CONS reclaimed the main area, so 16b-2 landed as the **SIMPLEST case-INSENSITIVE prefix
match** (Honza: exact-case display not required). `dir <pat>` / `ll <pat>` on h/t/f now list
only entries whose name starts with `<pat>`; bare `dir`/`ll` unchanged; c/n still filter
server-side (bank3 forward).

**Design (all bank4, one edited source file):**
- **Token parse** (`b4_ck_dir`/`b4_ck_ll`): the old exact-EOL check became: EOL → bare (no
  filter); a space → `jmp b4_setpat` with X = arg index (`#$04` for "dir ", `#$03` for "ll ");
  anything else (e.g. "direct") → not-our-token (C=1 → chat/AI). Bare paths set `B4_PATLEN=0`.
- **`b4_setpat`** (main area): skip extra spaces, then copy chars into `B4_PAT` **folded to
  uppercase** (`b4_fold`), stopping at EOL or a trailing `*` (prefix wildcard); `Y`→`B4_PATLEN`
  (cap `B4_PATMAX=40`; 0 = e.g. "dir  " → no filter). `jmp b4_do_dir`.
- **Streaming**: `b4_do_dir` zeroes `B4_BUFLEN` before `b4_read_dir_stream`. The `$9F58` drain
  loop's per-char CHROUT was **replaced by `jsr b4_emit`** (loop got *smaller*), and a
  `jsr b4_flush` was added at `b4_rds_fin` to emit the final entry (no trailing marker).
- **`b4_emit`** (per data byte, main area): byte ≥`$21` → append to `B4_BUF` (`B4_BUFMAX=80`,
  extra chars dropped); byte ≤`$20` (entry separator) → `jmp b4_flush`.
- **`b4_flush`**: empty buffer → nothing; `B4_PATLEN==0` → print; else fold-compare `B4_BUF`
  prefix vs `B4_PAT` (name shorter than pattern → skip; all pattern chars matched → print).
  Print = name bytes + CR; always reset `B4_BUFLEN`.

**RAM scratch** (all above the TMP image `$A000-$CEFF`, clear of bank3 ≤`$cf62` / bank4
≤`$cf48` UCI scratch, and clear of bank0's transient `$cfff`): `B4_PATLEN=$cf49`,
`B4_BUFLEN=$cf4a`, `B4_BUF=$cf80-$cfcf` (80 B), `B4_PAT=$cfd0-$cff7` (40 B). The bank3 leaf
helpers called via the trampoline during streaming never touch these (grep-verified), so the
buffer/pattern survive each `B4C3_RUN` excursion.

**Register safety:** `b4_emit` clobbers A/X (not Y — the accept-handshake at `b4_rds_acc` owns
Y); on a marker `b4_flush` clobbers A/Y then `rts`, and the loop reloads via `jmp b4_rds_rd`.
KERNAL CHROUT (`$ffd2`) preserves X/Y (same guarantee the `b4_cderr`/`b4_nsupmsg` message
loops already rely on); `b4_fold` preserves X/Y. So the Y-indexed compare/print loops are safe.

**Build + byte-verify (2026-07-11):** `./build.sh` clean (no `.errorif`); bank04.bin = 8194.
Only `bank04.asm` edited (git). bank4 diffs vs stock confined to `$9C00-$9E9C` (main reserve,
filter helpers) + `$9F58-$9FFF` (stream loop) — **stock-data band `$9E9D-$9F57` = 0 diffs**
(TMP bank table + RTI trampoline intact); banks 0/5/6/7 identical to stock; banks 1/2/3
unchanged by this edit. `b4_disp`@`$9C00` + `bank04_data_9F58`@`$9F58` pins hold; trampoline
template byte-exact (`8E 9D 03 ... 6C 9D 03 00 00`); `b4c3_end`=`$9FEA` (third region grew to
22 B free — the drain loop shrank 3 B). Archived `build/archive-16b2.bin`.

### 19.1  HW test plan
Flash, arm `HONDANI`, on a UCI device (`#t` then `#h`):
1. **`dir`** (bare) → whole directory, one entry per line (16b-1 behaviour, unchanged).
2. **`dir <prefix>`** (a prefix that matches some entries, mixed case, e.g. `dir OuT`) →
   lists only entries whose name starts with `<prefix>`, case-insensitively. Repeat with `ll`.
3. **`dir <prefix>*`** (trailing `*`) → same result as without the `*` (wildcard dropped).
4. **`dir zznope`** (matches nothing) → empty listing (just blank line(s)), returns cleanly.
5. **`dir`/`ll` with lowercase vs uppercase** patterns give the same matches (case-insensitive).
6. Regression: `pwd`/`cd` still fine; `#8 dir` → IEC notice; `#c dir`/`ll <pat>` still
   forward to the server verbatim (C=1 fall-through — "direct"-style non-tokens still chat);
   stock sweep; TASS/TMP `\` resume; C=+CTRL console-switch at the prompt.
If all pass, 16b-2 is done and steps 17-20 (`mnt`/`umnt`/`mkdir`/`cp`) are next in the freed area.

**RESULT (Honza, hardware, 2026-07-11): STEP 16 COMPLETE — ALL PASS.** 16a-fix (multi-packet
READ_DIR streaming), 16b-1 (one-entry-per-line output), 16b-2 (client-side prefix filter) and
CONS (both stages of the bank4→bank3 leaf-helper trampoline) all verified on real hardware.
`build/rr38p-tmp12reu.rebuilt.bin` at this point is the tracking table's step-16 baseline.

---

## 20  FIX-CS2 — CINV stub no-match fall-through trapped the local console

**Symptom (Honza, real HW, long-standing, ~80% reproducible):** arm `HONDANI`, switch to a
server console with `C=+CTRL+2..7`, then press `C=+CTRL+1` to return to the local console.
The local screen is restored, **but the cursor stops blinking and no key can be typed.**
Switching to the *other* consoles (`C=+CTRL+2..7`) still works. Server log for the failure:
```
RESTORE_SCREEN for session …      <- the legit C=+CTRL+1 return-to-local
SAVE_SCREEN    for session …      <- a spurious second console_switch fires
WARNING - Unknown local command 0x01   <- its scr_get, on console 0 (GET_SCREEN invalid there)
```

**Root cause — asymmetric guard between the two keyboard scanners.** The CINV RAM stub
(`cinv_tmpl` → `$03A0`) scans the 1..7 digit table like this (pre-fix):
```
    ldx #$06
cvr_chk:
    cmp $03f0,x
    beq cvr_match
    dex
    bpl cvr_chk
cvr_match:            ; <-- NO-MATCH FALLS THROUGH HERE with X=$FF
    …
    jsr console_switch ; called with a bogus index
```
When `C=+CTRL` is held while the key down is **not** 1..7 (e.g. as the return chord releases,
`$CB` (SFDX) reads `$40` = "no key"), the loop exhausts and drops into `cvr_match` with
**X=$FF**. `console_switch` then computes console nibble `($FF+1)<<4 = $00`, does `scr_save`
(the log's SAVE_SCREEN), stores `w_console=$00`, does `scr_get` with wire byte `$00`+sub `$01`
(the "Unknown local command 0x01" — GET_SCREEN is invalid for the local console 0), and enters
`cs_modal` **for a bogus console 0**. The machine is now trapped in the modal loop with
`w_console=0`: BASIC is frozen (dead cursor, keystrokes shipped off as console-0 keypresses),
yet `C=+CTRL+2..7` still hops consoles (that's `cm_server` *inside* the modal). Every reported
detail — including the exact three log lines — matches. `cs_modal`'s own scanner (`cm_chk`) was
already immune: it explicitly routes "combo held but not a digit" to a drop-and-ignore; only the
CINV stub lacked the guard.

**The fix — self-guarding scan loop, ZERO byte growth.** The stub is byte-exact full (71 B,
`$03A0-$03E6`; `$03E7` is the saved IERROR vector — it cannot grow). Restructured the loop to
the *same* 10 bytes so a no-match routes to `cvr_clear` (drop the chord + chain), never to
`console_switch`:
```
    ldx #$07
cvr_chk:
    dex
    bmi cvr_clear    ; ran past index 0 => no digit matched: drop & chain
    cmp $03f0,x
    bne cvr_chk
cvr_match:           ; reached ONLY on a real match, X in 0..6 (unchanged contract)
```
`ldx #$06`+`[cmp/beq/dex/bpl]` → `ldx #$07`+`[dex/bmi/cmp/bne]`, identical size. Mirrors the
`wedge-latest-not-working` tree's independent fix (no code copied — logic only).

**Build + byte-verify (2026-07-11):** `./build.sh` clean (no `.errorif` trips). Byte-diff vs the
step-16 build: **exactly 8 bytes changed, all in `$9B7D-$9B84` (inside `cinv_tmpl`)**; every
other byte of the whole cartridge — including `cinv_tmpl_end $9BA0`, `cs_install $9C41`,
`console_switch $9CB7` and all downstream bank2, and the frozen banks 0/1/3/4/5/6/7 — is
byte-identical. `cvr_chk` stays at `$9B7E`; RAM `cvr_match` stays at `$03CD`. Archived
`build/archive-csfix2-cvr-nomatch.bin`. **Awaiting HW test.**

### 20.1  HW test plan for FIX-CS2 (Honza)
Arm first: `HONDANI`.
1. **THE FIX (repeat ~10× to beat the old 80%):** `C=+CTRL+2` (or any 2..7) to a server
   console, then `C=+CTRL+1` back to local → the local cursor **blinks** and you can type
   `READY.`-line BASIC immediately. No dead console. Server log shows a lone `RESTORE_SCREEN`
   (no trailing spurious `SAVE_SCREEN` / `Unknown local command 0x01`).
2. **Feature intact:** `C=+CTRL+2..7` still switches between all server consoles; re-entering a
   console still paints it; typing inside a server console still forwards keys.
3. **Non-digit chord is now a clean no-op:** hold `C=+CTRL` and tap a non-1..7 key (e.g. `Q`) →
   nothing happens (no screen save, no trap), the prompt keeps working.
4. **Regression:** `ll`/`dir`, `pwd`/`cd`, `status`/`time`, `#`/`#c`; the FIX-CS game test
   (`HONDANI`→F1 Sprite Studio 64 / Outrun still run); stock sweep; TASS launch/exit + TMP `\`.

If all pass, the long-standing "local console dead after return" bug is closed.

## 21  Step 17-pre — bank5 reserve opened (BUILT+byte-verified 2026-07-11, awaiting HW test)

**Why.** Step 17 (`mnt`/`umnt`) does not fit. After step 16 the bank4 reserve has only
~98 B free (main-area `$9E51-$9E9C` = 76 B + third region `$9FEA-$9FFF` = 22 B); the bank3
reserve is exhausted. `mnt`+`umnt` with the device-argument + drive-9 enable Honza asked for
is ~240 B even after maximal helper reuse (each command name costs ~27-30 B just to match).
`$80B4-$9F00` in bank4 is the stock TMP/REU payload — not free. So a THIRD ROM bank is
hard-required (foreseen in §14a). Decision (Honza, 2026-07-11): open **bank5** as the next
overflow reserve, proven first with a border-flash round-trip (this step), mirroring how
bank4 was opened (15-pre) and how the bank4 third region was proven (16-R).

**Where in bank5 (the safe-region analysis).** bank5 (`$de00=$88`) is mapped by the boot
installer only, never at the BASIC prompt — same safety basis as bank2→bank3 / bank3→bank4.
The installer's copy map was decoded from both relocatable variants (`$80B4` → C64 RAM, and
`$8124` → REU/`$8000+`):

- bank5 → RAM/REU sources copied: `$8800-$92FF`, `$9200-$99FF` (variant 1) and `$8100-$87FF`,
  `$9700-$9DFF` (variant 2). **Union = `$8100-$9DFF`.**
- Therefore bank5 **`$9E00-$9E9C` (157 B)** and **`$9F58-$9FFF` (168 B)** are stock-zero AND
  copied nowhere → genuinely dead; code there cannot corrupt the TMP/TASS REU image.
- The 494 B zero run at `$9012-$91FF` is a trap: it is INSIDE `$8800-$92FF`, i.e. copied to
  RAM — code there WOULD corrupt TMP. Rejected. (Mirrors bank4, where only the end-of-bank
  `$9F58` region was dead; 16-R.)

Bank5 reserve therefore = `$9E00-$9E9C` + `$9F58-$9FFF` = **325 B**, structured exactly like
bank4 (main reserve + third region). Enough for `mnt`+`umnt`+enable now and 18-20 later.

**The trampoline (call_bank5).** bank5 and bank4 are dispatched as **sequential siblings**
from bank3 (bank5 first, then bank4, then chat) — never nested — so `call_bank5` safely
**shares call_bank4's `$0378` RAM slot**: `hsh_ck_b5` heals its own 14-byte `b5tramp`
(`lda #$88 / sta $de00 / jsr $9e00 / lda #$18 / sta $de00 / rts`) right before `jsr $0378`,
and if bank5 returns C=1, `hsh_ck_b4` re-heals `b4tramp` into the same slot before its own
jsr. The datassette buffer has no free 14 B gap (`$0340-$0356` IERROR stub, `$0360` call_bank3,
`$0370` rstub, `$0378` call_bank4, `$0386` b4c3, `$03A0` CINV) — slot-sharing is the clean fit,
and the sibling (non-nested) dispatch makes it correct. A bank4→bank5 *nested* design was
rejected: call_bank4 stays live on the return path, so a nested call_bank5 would need a
distinct slot that does not exist.

**Changes (all in our own gateway code — no stock bytes, no pinned hsh_* modules touched):**
1. `rr38p-tmp12reu.bank03.asm`: `hsh_ck_more`'s `ckm_none` now `jmp hsh_ck_b5` (was `hsh_ck_b4`).
2. `rr38p-tmp12reu.bank03.asm` annex (`$97C4`): added `hsh_ck_b5` (heal `b5tramp`→`$0378`, jsr,
   C=0→rts handled, C=1→`jmp hsh_ck_b4`) + `b5tramp`. Annex now `$97A2-$97E5` (68/94 B used).
3. `rr38p-tmp12reu.bank05.asm` (`$9E00`): `b5_disp` proof stub — matches the literal line `b5`
   → `inc $d020` (border +1) → C=0 (READY.); anything else → C=1 (fall through to bank4/chat).

**Build + byte-verify (vs `build/baseline-step16.bin`).** All `.errorif` pins held. Diff = 58
bytes, in **bank3 + bank5 only**:
- bank3 `$97C4-$97E5` (31 B): `hsh_ck_b5`+`b5tramp` (was zeros); bank3 `$9E70` (1 B): the
  `jmp` operand low byte `$A2`→`$C4` (retarget to `hsh_ck_b5` @ `$97C4`). No code shift — the
  annex `.fill $9800` absorbed the addition, so all downstream bank3 addresses are unchanged.
- bank5 `$9E00-$9E19` (26 B): `b5_disp`.
- **banks 0/1/2/4/6/7 byte-identical.**

**HW test plan (Honza):**
1. Reboot to the RR/HONDANI prompt (no HONDANI needed — `b5` is local).
2. Type `b5` ↵ → the **border steps one colour** then `READY.`. Repeat a few times → border
   keeps advancing (proves bank5 code runs + returns cleanly through the trampoline each time).
3. Regression — nothing else may change: `pwd`/`cd`/`dir`/`ll` on `#t`; `#`/`status`/`time`/
   `menu`; `i:hello` → AI; `PRINT 1/0` → `?DIVISION BY ZERO`; a normal chat line still forwards.
4. **REU-image integrity (the key check):** launch **TASS** and **TMP** (`\`), and a fastloaded
   game (Sprite Studio 64 / Outrun via HONDANI+F1) — all must still work, confirming the
   transient bank5 map-in does not disturb the TMP/TASS REU image.

If all pass, bank5 is confirmed as the third reserve and the `b5` probe is replaced by the real
`mnt`/`umnt` dispatcher (step 17).

## 22  Step 17 — `mnt` / `umnt`, built in bank5 (BUILT+byte-verified 2026-07-11, awaiting HW test)

Real mnt/umnt, replacing the 17-pre `b5` proof stub. bank5 (`$de00=$88`) is the third ROM
reserve opened in 17-pre; b5_disp now dispatches `mnt`/`umnt` and returns C=1 for everything
else (fall through to bank4, then chat). All UCI work is done by bank3's FROZEN leaf helpers
(`uci_idle_kick $9dbb`, `hsh_push $9b20`, `hsh_fin $9b6a`) reached through a bank5->bank3 RAM
trampoline **b5c3 @ $0386** (a byte-for-byte mirror of bank4's b4c3, restoring `$88` instead of
`$80`). b5c3 SHARES b4c3's `$0386` slot — safe because bank4/bank5 dispatch as sequential
siblings (bank5 first, then bank4), never nested, and each heals its template before use.

**Commands (device-INDEPENDENT — mnt/umnt act on the Ultimate DOS filesystem regardless of the
current `#`-device; the path resolves against the Ultimate current dir or is absolute):**
- `mnt <path> [8|9]` → DOS `MOUNT_DISK ($23)`: mount the image to IEC device 8 (default) or 9.
  For device 9 it first issues CONTROL `ENABLE_DISK_B ($32)` to power on the Ultimate's Drive B
  (idempotent) so a disabled Drive B still works. Payload = `<target $01><cmd $23><dev><path>`.
- `umnt [8|9]` → DOS `UMOUNT_DISK ($24)`: unmount device 8 (default) or 9. Payload =
  `<target $01><cmd $24><dev>` (no path). "umnt 9" = single-space form.

Both silent on the UCI status (the reference `cmd_mnt` has only a `TODO` error too); a bad path
simply fails to mount. Shared sender `b5_domount` (A=cmd, `$cf43`=device, `$cf44`=write-path
flag, `$cf48`=path-start idx) writes target+cmd+device (+path if flag), then `b5_pushfin`
(PUSH+FIN via b5c3). Scratch `$cf43/$cf44/$cf48` are private and untouched by the bank3 helpers
(they use `$cf26/$cf30/$cf31`), so they survive across the trampoline hops.

The `mnt` device-arg parse scans the path to EOL, then checks for a trailing ` 8`/` 9` token
(space at EOL-2 + digit at EOL-1); if present it sets the device and **pokes a `$00` over the
space** in the `$02a7` shadow line to truncate the path (safe — the shadow line is consumed by
then and only the always-handled path pokes it). No trailing token ⇒ device 8, full path.

**Case:** mnt/umnt match UPPERCASE PETSCII directly (no `b5_fold`) to fit the 325 B bank5
budget — the C64 BASIC prompt is uppercase mode by default. pwd/cd/dir/ll still fold; a fold for
mnt/umnt can be added when a further region (bank6/7) opens, if lowercase input is ever wanted.

**Layout (fits with margin):** main region `$9E00-$9E9C` = `b5_disp` + `b5_ck_mnt` + `b5_pushfin`
(ends `$9E92`, 11 B free); third region `$9F58-$9FFF` = `b5_ck_umnt` + `b5_domount` +
`b5_enable_b` + `b5c3` (ends `$9FF9`, 7 B free). `umnt` is reached from `b5_disp` via a `jmp`
thunk (`b5_j_umnt`) since the third region is out of `beq` range.

**Build + byte-verify.** All `.errorif` pins held (regions in bounds, b5c3 ≤ `$039F`). Diff vs
`build/baseline-step16.bin`: **bank5 `$9E00-$9FF6` (300 B)** + the unchanged 17-pre bank3 annex
(`$97C4` + the `$9E70` jmp operand); **banks 0/1/2/4/6/7 byte-identical** (bank4's pwd/cd/dir/ll
completely untouched). Archived `build/archive-17-mnt-umnt.bin`.

**HW test plan (Honza):**
1. `#t` (or wherever a `.d64`/`.d81` lives), `cd` to its dir, `mnt foo.d64` → returns to READY.
   Then `LOAD"$",8` + `LIST` shows the image dir, and `LOAD"*",8,1` / `LOAD"filename",8` runs a
   program off the mounted image. (NB: our `dir` on `#8` still says "NOT SUPPORTED ON IEC" by
   design — a mounted image is a virtual IEC drive, so its directory is read the stock way via
   `LOAD"$",8`, not our UCI `dir`. Confirm that's the intended UX or tell me to add it.)
2. `mnt game.d64 9` → mounts to device 9 with Drive B enabled: `LOAD"*",9,1` runs. (Test with
   Drive B initially disabled in the Ultimate config to confirm the auto-enable.)
3. `umnt` (and `umnt 9`) → device unmounted: a subsequent `LOAD"*",8,1` fails / returns to the
   prior state.
4. **Regression (must be unchanged):** `pwd`/`cd`/`dir`/`ll` on `#t`; `#`/`status`/`time`/`menu`;
   `i:hello`→AI; `PRINT 1/0`→`?DIVISION BY ZERO`; a chat line forwards; console switch; stock
   sweep; **TASS + TMP (`\`) + a fastloaded game (HONDANI+F1)** still run (bank5 REU-image
   integrity, re-confirmed now that bank5 carries real code, not just the 26 B proof stub).

If all pass, step 17 is done and step 18 (`mkdir`) follows — it will reuse `b5_domount`
(DOS `CREATE_DIR $16` with a path), so it is small and fits the remaining bank5 headroom.

## 23  Console-hook vs RR F1 (`%0:*`) fastload — investigated, WORKAROUND (2026-07-12)

**Symptom (Honza, during step-17 HW test):** reboot → mount a game → `HONDANI` (arms the
CINV console-switch hook) → **F1** → RR fastloads+autoruns and the init screen **garbles**.
Without arming, F1 is fine.

**This is NOT a step-17 regression.** Banks 0/1/2/4 are byte-identical to the FIX-CS/FIX-CS2
build, and it garbles with no `mnt` involved. It is the pre-existing "armed CINV hook survives
into a fastloaded program" fragility (deferred debt item #1).

**Decisive isolation (Honza's tests):**
- `HONDANI` → `LOAD"*",8,1` → `RUN`  → **works**
- `HONDANI` → `LOAD"*",8,1` → `MON` → `G 080D` → **works**
- `HONDANI` → **F1** (types `%0:*`, RR menu fastload+autorun) → **garbles**

So the `$9D` (MSGFLG) self-disarm in the CINV stub fires for a BASIC `RUN` (and the KERNAL
`LOAD` path is fine), but **`%0:*` autoruns without a `RUN`/`LOAD` transition**, so `$9D` stays
`$80`, the hook stays live, RR's fastloader clobbers the tape-buffer stub at `$03A0`, and the
next IRQ executes garbage. The KERNAL `LOAD` (`$0330`) disarm idea is ruled out — `LOAD"*",8,1`
already works without it.

**The fix is trivial in logic, impossible to place.** RR's stock CINV is `$EA31` (`b02_982D`
sets it), so the disarm is just `set $0314=$EA31` (8 B, no guard). It must run per-line, before
`%0:*`'s fastloader clobbers `$03A0` — the natural spot is the bank1 per-line tap. **But bank1
is full**: max contiguous free = 8 B (`$9E51-$9E58`), the tape buffer max 9 B, and the only
"reclaimable" bank1 bytes (the IERROR idempotency check) are load-bearing (they keep the saved
original `$0300` correct across lines). The disarm + register-preservation needs ~12 contiguous
bytes → does not fit anywhere in-place. This is exactly the wall deferred item #1 named.

**A real fix exists but is deferred:** hook `CRUNCH` (`$0304`, stock/unhooked) via a small stub
at **`$03F7-$03FF`** — free RAM that is OUTSIDE the fastloader's `$0348-$03E8` clobber zone, so
it survives a load — that disarms `$0314=$EA31` and chains to stock CRUNCH (`$A57C`). Avoids
bank1 entirely; catches `%0:*` (tokenized by CRUNCH before RR acts on `%`). Not built: it is a
new global vector hook with unverified assumptions (that `%0:*` goes through CRUNCH) and can't
be cheaply HW-iterated — a dedicated, carefully-designed step if/when F1 support is wanted.

**DECISION (Honza, 2026-07-12): WORKAROUND, no code change.** F1/`%0:*` is the ONLY broken
path. When the console-switch hook is armed (`HONDANI`), launch autostart programs with
`LOAD"*",8,1` + `RUN` (or `MON` + `G <addr>`) instead of F1 — both are transparent. Console
switching and everything else are unaffected. The CRUNCH-hook fix stays on the shelf.

## 24  Steps 18/19/20 — SERVER-SIDE, ZERO CARTRIDGE CHANGE (2026-07-12)

After step 17 passed HW test, Honza's call: **stop squeezing cartridge ROM.** The remaining
shell commands are implemented as **HDN Server handlers**, using the C64 Ultimate REST API
(`docs/development/rest_api_calls.md`) and its built-in FTP server. **The cartridge `.bin` is
byte-identical to the step-17 image — no wedge rebuild, no bank touched.** Full rationale +
the four grilled decisions are in `next_steps.md §PIVOT`. Summary of what shipped in `cloud/`:

- **Zero-asm reach:** an unrecognized token on any device already falls through the wedge to
  `hsh_body`, which forwards the raw `$02a7` line verbatim (`$FE $02` frame, no prefix —
  `bank03.asm:3132`). A new `cloud/handlers/ultimate_handler.py` (`UltimateHandler`) claims
  `mkdir`/`memcpy`; it is registered **before** CSDB/NetDrive in `request_dispatcher.py` so it
  beats their active-module catch-all (comment added there to lock the invariant).
- **Step 18 `mkdir <abspath>`** → FTP `MKD` (REST has NO mkdir endpoint; FTP is the forced
  transport). Absolute paths only. Single-level (`MKD` is not recursive).
- **Step 19** — `csdb` aliased to `#c` in `csdb_handler.py` (exact, no-args); `cp` already
  worked via the existing CSDB/NetDrive FTP handlers.
- **Step 20 `memcpy` (un-dropped)** — `memcpy $S-$E /path` (save) reads C64 memory via REST
  `readmem` (256 B chunks, length-verified) then FTP-`STOR`s the file; `memcpy /path $A` (load)
  FTP-`RETR`s then REST-`writemem`s (256 B chunks, address advanced per chunk — guards the
  unproven POST size cap). Inclusive range (`$c000-$cfff` = 4096 B). Direction is decided by
  which arg is a `$hex` range vs a `$hex` addr; both-hex / both-path → usage string.
- **cwd model = absolute paths only.** The cartridge's current dir lives in the Ultimate UCI
  DOS1 context (driven by `cd`=CHANGE_DIR `$11`), NOT shared with REST/FTP sessions, so there
  is nothing to sync. **Deferred asm "quality win"** (own HW-tested step): reuse the existing
  `pwd`/GET_PATH machinery to capture the current absolute path and prepend it to the forwarded
  line so a relative `mkdir foo` works.
- **Verification:** `cloud/test_ultimate_handler.py` (28 tests, all network mocked) +
  `test_handlers.py` → `70 passed`. Live HW pass (server up) still owed by Honza.

## 25  Step 21-pre — bank6 reserve OPEN (2026-07-12)

The deferred **asm "quality win"** (reuse GET_PATH to auto-prepend the current dir so a relative
`mkdir foo` / `memcpy … foo` works) does NOT fit anywhere: **bank3/4/5 shell reserves are full**
(bank5 has ~6 B left after step 17). It needs a **FOURTH ROM bank**. This pre-step opens bank6 in
isolation — same discipline as **17-pre** — so the bank-map risk is HW-proved *before* any feature
logic rides on it.

**Why bank6 is safe (cross-verified, read-only agents + byte diff):**
- The boot **installer copies bank6/7 `$8100-$9DFF` ONLY** — the single `lda #$90 / sta $de00`
  followed by `ldx #$1c` (29 pages) page-copy loop in `bank04.asm` (~`$8068`). It is the *only*
  `$90→$de00` write in the whole 8-bank disassembly; bank6 is never mapped at the BASIC prompt.
- So bank6 pockets **`$9E00-$9E9C`, `$8023-$80FF`, `$9F58-$9FFF`** are copied to neither RAM nor the
  REU image — identical dead-space property to bank5's step-17 pockets (`bank04` copy-map + the
  `.errorif` fills prove it). Code here cannot corrupt the TMP/TASS REU image.
- Bank6's own interior stock-zero gaps (inside `$8100-$9DFF`) are **NOT** safe — they *are* in the
  copy window. Only the three outer pockets are usable. (Same for bank7 if ever opened.)

**What shipped (byte-diff-explainable, 30 bytes total vs the step-17 image):**
- **bank3 annex** (`hsh_ck_b5`, `$97C7-$97EF`, +10 B; still `< $9800`): after bank5 misses, reuse
  the already-healed `call_bank5` RAM stub at `$0378` and just repoint its bank operand
  (`$0379`, b5tramp's `lda #$88` immediate) to bank6 `#$90`, then re-`jsr $0378` — bank6's
  dispatcher also lives at `$9E00`. `bcc hc5_yes` on handle, else `jmp hsh_ck_b4`. No second
  trampoline needed; bank5/bank6 are SEQUENTIAL SIBLINGS, never nested, and `hsh_ck_b5` re-heals
  b5tramp (`$88`) fresh next command. `b5tramp`/`hc5_yes` shift down 10 B; fill `$97F0-$97FF` stays
  zero (no stock leak).
- **bank6** (`b6_disp @ $9E00`): a **no-op dispatcher** — `sec` (`$38`) / `rts` (`$60`), the ONLY
  two changed bank6 bytes (`$9E00`, `$9E01`); the rest of `$9E00-$9E9C` stays `.fill`-zero. Returns
  C=1 ("not mine") so `mkdir`/`memcpy` still fall through to `hsh_body` and forward exactly as in
  step 18/20 — behaviour is unchanged, this only proves the map-in/out path works.
- Build: all `.errorif` guards pass (`b6_disp=$9E00`, fill lands `$9E9D`, annex `b5tramp=$97E2`);
  `cmp` of rebuilt vs step-17 image = **only** those 30 bytes (2 bank6 + 28 bank3-annex).

**HW test owed (Honza):** stock sweep, freeze→resume, TASS launch/exit, `#h`/`#t`/`#f` + `pwd`/`cd`/
`ll`/`mnt`/`umnt`, and `mkdir`/`memcpy` (server up) — all must behave exactly as step-17/20. This
proves opening bank6 disturbs nothing. **Only after it passes** does step 21 fill in `get_path` +
the `$01`-framed relative-path prepend inside `b6_disp`.

## 26  Step 21 — get_path + relative-path prepend (2026-07-12)

21-pre HW-passed (opening bank6 is clean), so this step fills `b6_disp` with the real feature:
relative `mkdir foo` / `memcpy … foo` on a UCI-DOS drive now work by having the wedge capture the
current dir and hand it to the server, which does the join. Fable5-vetted design; **all path
grammar stays server-side (testable), the cartridge only captures + front-prepends a context
field, and it FAILS OPEN to the step-18/20 absolute-path behaviour** so no cartridge bug can
misplace a file.

**Cartridge (bank6, 3 pockets, reached from the 21-pre annex hook):**
- `b6_disp` (`$9E00`): case-folded exact match of `mkdir ` / `memcpy ` (full token + space). Not
  ours → C=1, `$02a7` untouched (bank4 then `hsh_body` forward it as before). Device gate on the
  already-folded `$cf2a`: only `T`/`F`/`H` (+ `U`/`V`, dormant until #u/#v are added to bank3 per
  §16-DEV) — other devices forward unchanged. **b6_disp ALWAYS returns C=1** (it never "handles",
  only optionally rewrites the line).
- `b6_get_path` (`$8023` pocket): issues UCI DOS1 GET_PATH (`$01,$12`) via the new `b6c3`
  bank6→bank3 leaf trampoline (`$0386`, sibling of `b5c3`, restore `$90`), captures the reply into
  `B6_PATHBUF=$cf80` (shares B4_BUF — never live during ll/dir), NUL-terminated, bytes `<$20`
  dropped **but still drained** (avoids the step-16a UCI-desync class), length → `B6_CWDLEN=$cf63`.
  C=1 on push/wdav failure → caller fails open.
- `b6_prepend` (`$8023`): rewrites `$02a7` `"<line>"` → `"$01 <cwd> $01 <line>"` (backward
  in-place shift, dest>src). Bounds-checked (`L+cwd+2 ≤ 88` vs the `$0300` cliff / `hsh_wlp`'s
  `cpy #$59`); on would-overflow it **bails before touching `$02a7`** (fail open).
- `b6c3` (`$9F58` pocket): the trampoline (heals into `$0386`, shares b5c3's slot; b6_disp heals it
  fresh before use). Byte-diff vs step-17 = bank3 annex (21-pre) + bank6 `$9E00-$9E95` (150 B) +
  `$8023-$80D4` (~174 B) + `$9F58-$9F7A` (~34 B); stock bands `$8100-$9DFF`/`$9E9D-$9F57` and banks
  0/1/2/4/5/7 untouched. All `.errorif` pocket guards hold.

**Server (`cloud/`):** `request_dispatcher.dispatch` detects a leading `$01`, splits the frame,
decodes **cwd as ASCII (latin-1)** and the command line as **PETSCII** separately (a single
PETSCII pass would mangle the mixed-case path), and stores/clears `state['dos_cwd']` every request.
`ultimate_handler._resolve_abspath` joins a relative `mkdir`/`memcpy` path against `dos_cwd`
(`posixpath.normpath`, so root `/` and trailing slashes can't yield `//`); absolute paths pass
through; relative + no cwd → the old usage message. memcpy direction detection reworked to key off
the range's `-` (SAVE) vs a bare hex addr (LOAD) so relative filenames parse. Tests: **12 new
(9 resolution + 3 frame-decode), full cloud suite 161 passed / 1 skipped.**

**✅ HW tested 2026-07-12 (Honza, server up) — all good.** `cd /Temp/sub` + relative `mkdir foo` →
server created `/Temp/sub/foo`; `memcpy` relative-name round-trip; absolute paths still work; a
relative `mkdir` on `#8`/`#c` was NOT rewritten (server demanded absolute); stock sweep + TASS all
clean. **Known limit (accepted):** cwd inside a mounted disk image → FTP error from the server
(documented, not detected in ROM).

**Fable5 asm review (2026-07-12): GO for HW test, no logic bugs** — every contract invariant held
(C=1 on all exits, b6c3 carry preservation, the UCI drain discipline, and the `cmp #$59` guard vs
`hsh_wlp`'s `$0300` cliff all verified against source + .sym). Two narrow context-correctness risks
flagged; one fixed, one accepted:
- **FIXED — cwd > 63 chars was silently truncated** and prepended (would resolve the relative name
  against a mangled ancestor dir → misplaced file, defeating fail-open). Now `b6_get_path` on a
  buffer-full drains the rest of the reply and returns C=1 → `b6_go` forwards the line UNCHANGED
  (server then applies its absolute-path rule). +9 B in the `$8023` pocket (helper block ends
  `$80E1`, ~30 B margin).
- **ACCEPTED (nit) — device gate reads `$cf2a` raw**, which is lazily normalized (garbage→'8' only
  on the first `#`/pwd/cd). A cold boot whose uninitialized `$cf2a` happens to be T/F/H/U/V (~2%)
  *and* a `mkdir`/`memcpy` typed before any `#`/pwd/cd would prepend a cwd the user didn't pick.
  Non-crashing, self-heals on first `#x`/pwd/cd, and fail-open makes it create the dir in the ACTUAL
  current DOS dir anyway — so it's a surprise, not a corruption. Documented, no code (keeps the
  pocket lean).

## 27  §16-DEV — device → mount-path binding (✅ HW tested 2026-07-13, all good)

The deferred device→mount-path binding. Typing `#t`/`#f`/`#h`/`#u`/`#v` now, besides selecting the
single UCI drive, auto-issues a UCI DOS1 `CHANGE_DIR` (`$11`) to that drive's fixed mount root, so a
bare `#t` lands you in `/temp` with no manual `cd`. `#u`/`#v` are NEW letters (`/usb0`,`/usb1`).

| letter | mount root |
|---|---|
| `#t` | `/temp` |
| `#f` | `/flash` |
| `#h` | `/sd/home` |
| `#u` | `/usb0`  (NEW) |
| `#v` | `/usb1`  (NEW) |

**Why bank3 had to be touched (bank6-only was impossible).** The frozen bank3 `#`-handler
(`hsh_dispatch`) tests `$02a7=='#'` FIRST and consumes the whole `#`-family before the bank5/6/4
dispatch chain: `#t/#f/#h` returned locally (`hd_local` = silent `sta $cf2a`) and `#u/#v` fell to
`hsh_body` (AI) — neither ever reached `b6_disp`. So the `#`-family cannot be intercepted downstream
without a bank3 edit. Confirmed by read-only research.

**Design — minimal in-place bank3/bank4 edits (NO code shift) + all real logic in the bank6 pockets:**
- **bank3 `hd_setdev` (frozen body, in-place):** `H/T/F` `beq hd_local` → `beq hd_hook`; the old
  fall-through `jmp hsh_body` → `jmp hsh_ck_b5` (labelled `hd_hook`). `U/V` + any unknown `#x` already
  fall to that jmp. So H/T/F/U/V/unknown all enter the bank5→bank6 chain; `8/9/S` still `hd_local`,
  `C/N` still `hd_fwd`. **5 operand bytes changed, no size change.**
- **bank6 `b6_disp` head:** `lda $02a7 / cmp #$23 / bne b6_ac_no / jmp b6_autocd`. A leading `#`
  hands off to `b6_autocd`; mkdir/memcpy (non-`#`) fall through unchanged (+7 B, shifts b6_disp's own
  body inside the `$9E00` pocket only — self-contained, pin still lands `$9E9D`).
- **bank6 `b6_autocd` (`$9F58` pocket, after `b6c3`):** fold `$02a7+1`; search a 5-entry letter table
  (`T F H U V`); miss → `sec/rts` (C=1 → unknown `#x` still falls through bank4 to `hsh_body`/AI,
  identical to before). Hit → `sta $cf2a` + issue `$01,$11,<path>` to the UCI via the existing
  `b6c3`/`B3_IDLE`/`B3_PUSH`/`B3_FIN` machinery (clone of the step-21 `b6_get_path` pattern). Paths are
  a packed NUL-terminated blob + parallel offset table (PETSCII-uppercase — exactly what typing
  `cd /temp` sends, proven to resolve since step 15c). C=0 handled; **CHANGE_DIR push-fail is silent
  (fail-soft)** — device stays selected, cwd just didn't move, visible on the next `pwd`/`ll`.
- **`#u`/`#v` as first-class letters, WITHOUT growing frozen validators (the range/remap trick):**
  - **bank3 `hd_norm_cur` (bare `#` display):** default `lda #$38/sta $cf2a` → `jmp hd_nc_ext`+2 NOP
    (in-place, `hd_ncok` stays put). `hd_nc_ext` (annex tail `$97F0`, +14 B in the fill) accepts
    `U`/`V` as-is (so bare `#` shows the letter) else defaults `'8'`.
  - **bank4 `b4_curdev` (pwd/cd/ll routing):** default → `jmp b4_cd_ext`+2 NOP (in-place, `b4_ncok`
    stays put). `b4_cd_ext` (in the `$9E9D` reserve fill, +17 B) **remaps `U`/`V` → `'T'`** so
    `b4_is_htf` treats them as UCI and every command routes correctly to the single UCI drive; `$cf2a`
    is left `'U'`/`'V'` for display. `b4_is_htf` UNCHANGED. `pwd` on `#u` prints `/usb0` (the drive's
    current path after the auto-cd) — correct and consistent (one UCI drive).

**Byte-diff (vs the committed step-21 image):** bank3 24 B (`$97F0-$97FD` hd_nc_ext; `$99BE/$99C2/$99C6`
H/T/F operands; `$99D0-$99D1` hd_hook jmp; `$9C03-$9C07` hd_norm_cur redirect), bank4 22 B
(`$9DAF-$9DB3` b4_curdev redirect; `$9E51-$9E61` b4_cd_ext), bank6 264 B (`$9E03-$9E9C` = b6_disp head
+ its within-pocket shift; `$9F7D-$9FF6` = b6_autocd + tables). **Banks 0/1/2/5/7 byte-identical; both
`.crt` md5 = `52c5f8ad6c683cbdd21c618aecdd39a5`.** All new paths disassembly-verified (da65).

**✅ HW tested 2026-07-13 (Honza, server up) — all good.** `#t/#f/#h/#u/#v` auto-cd to their mount
roots; the NEW `#u`/`#v` select+navigate; bare `#`, pwd/cd/ll/mkdir routing, silent `#8/#9/#s`, `#c/#n`
forward and the unknown-`#x`→AI fall-through all behave as designed; stock sweep + TASS clean. What was
tested:
- `#t` → prompt lands in `/temp` (verify: `pwd` prints `/temp`, `ll` lists it); same for `#f`→`/flash`,
  `#h`→`/sd/home`, and the NEW `#u`→`/usb0`, `#v`→`/usb1`.
- After `#u`: bare `#` prints `U`; `pwd`/`ll`/`cd sub`/`mkdir foo`/`memcpy` all operate under `/usb0`.
- Re-typing `#t` after a manual `cd sub` re-roots to `/temp` (every switch re-cds).
- `#8`/`#9`/`#s` still silent-select (no cd); `#c`/`#n` still eager-forward; an unknown `#z` still → AI.
- Stock sweep + TASS launch/exit + freeze→resume unchanged.
- **Verify path casing on real HW:** paths are sent uppercase (`/TEMP` …). If the Ultimate rejects a
  root by case (unlikely — `cd /temp` worked since step 15c), adjust the `b6_ac_paths` blob.
- **Known fail-soft:** if a mount root doesn't exist (e.g. no USB stick in usb1), the auto-cd silently
  leaves you where you were; `pwd` reveals it. No hang, no error.

## 28  Auto-arming epic — Step 1: rename HONDANI→HDN + local-only instant arm (built+byte-verified, awaiting HW test)

New epic (from `TODO.md` "automatic arming"). Goal (Honza, 2026-07-14): **arming must be
automatic on boot** and the manual command **renamed HONDANI→HDN**, doing a **pure local
instant arm — NO server round-trip** (bare HONDANI used to send an empty request that
stalled ~seconds until it timed out). The auto disarm-on-program-launch (`$9D` self-disarm,
§17) is KEPT. Chosen approach **Alternative A** (boot-arm + manual HDN re-arm), split into
small HW-tested steps; the heavy console keyscan (`cs_modal`) is already on-demand, so the
only always-on piece is the ~71 B detector stub at `$03A0`.

**What "arming" is (for the docs):** typing the keyword runs `cs_install` (bank2), which
copies the CINV IRQ stub to `$03A0`, copies the 1..7 digit table to `$03F0`, and points
KERNAL's `$0314` IRQ vector at the stub. That hook is what lets **C=+CTRL+1..7** open the
server consoles. Without it those keys do nothing. The stub **self-disarms in program mode**
(`$9D`==0) so a fastloaded program that reuses the tape buffer can't run the clobbered stub
and crash (§17). So after running a program you are disarmed and re-arm with `HDN`.

### Step 1 changes (this step)
- **bank1 (frozen) — 5 data bytes only.** `hondani_word` "HONDANI",0 → "HDN",0 at `$9E04`.
  The bank1 match loop is **length-agnostic** (scans to the `$00` terminator, derives the
  TXTPTR advance from `Y` — `bank01.asm:4229`), so no logic edit; the 4-byte shrink is
  absorbed by the existing `.fill $9E10 - *` pad → all downstream bank1 byte-identical.
  Byte-diff vs HEAD: `$9E05 4F→44`, `$9E07 44→00`, `$9E08 41→00`, `$9E09 4E→00`, `$9E0A 49→00`
  (`$9E06`='N'=$4E unchanged coincidentally). `HDNx` (trailing letter) still falls through to
  the stock scanner via the existing `cmp #$41/bcs` guard; `HDN <junk>` arms and ignores the
  rest (no bank1 cost to reject it — documented).
- **bank2 — 3 bytes IN PLACE (zero shift).** `hondani_net` was `sei / jsr cs_install /
  <network round-trip>`. Overwrote the first dead instruction `lda $df1d` (`AD 1D DF` @
  `$9922`) with `cli / rts / nop` (`58 60 EA`), so HDN arms then returns straight to
  `$E37B READY`. The network block below is now dead for the keyword path but is kept
  **byte-identical** — `hondani_err`'s auto-dispatch still calls the shared helpers
  (`hn_push/hn_fin/hn_wdav/hn_close/hn_hdr/hn_ip`). Chose in-place overwrite over an insert
  specifically so NOTHING shifts (an insert bumped every helper caller's operand = 531 B of
  noise); this way only 3 bytes change.

**Verification:** build clean; `.errorif` pins all hold. Symbols unmoved: `hondani_net=$991E`,
`cs_install=$9C41`, `hondani_err=$9B2E`, `console_switch=$9CB7`, `hn_push=$9A71`, `hn_ip=$9B14`.
Patched entry disassembles `78 20 41 9C 58 60 EA` = `sei / jsr $9C41 / cli / rts / nop`. Diff
vs HEAD: **bank1 = 5 bytes, bank2 = 3 bytes; banks 0/3/4/5/6/7 byte-identical** (unchanged
sources).

**HW test expectation (Step 1):**
- Type `HDN` ↵ → returns to `READY.` **instantly** (no multi-second stall, works with the
  server down). Then **C=+CTRL+1..7** opens the server consoles (arming worked).
- `HONDANI` ↵ is **no longer recognized** → stock `?SYNTAX ERROR` / AI auto-dispatch (whatever
  an unknown line does today), NOT the arm.
- Regression: after `HDN`, running a program still self-disarms (F1/RUN as documented);
  console switch, pwd/cd/ll, `#`-family, status/time/menu, stock sweep + TASS all unchanged.
- **Boot is NOT yet auto-armed** — that is Step 2. After a cold boot you must type `HDN` once.

### Next
- **Step 2 — boot-arm:** call `cs_install` once at boot, at a point where `$9D`=$80 (BASIC
  direct mode) so the first IRQ can't self-disarm it. Then the first `READY` is already armed.
- **Step 3 — docs:** rename HONDANI→HDN across `docs/user_manual/*`, add the "what/why of
  arming" explainer, document boot-arm + re-arm-after-programs.

## 29  F1 macro `%0:*`→`/0:*`, RUN/STOP macro disabled (built+byte-verified, awaiting HW test)

**Request (Honza, 2026-07-14):** pressing F1 (RR fastload-first-file) types `%0:*` on screen;
change it to `/0:*`. Follow-up during review: also remove the C=+RUN/STOP macro (Honza only
ever triggers it by mistake).

**Where:** `bank01_data_88A8` (`$88A8`), the function-key macro table found while investigating
this — 7 key codes (F1,F2,F5,F7,F3,F8,RUN/STOP=`$83`) followed by parallel `$00`-terminated
strings typed into the keyboard buffer. F1's string was `$25,$30,$3A,$2A,$00` (`%0:*`, no CR);
F2's was already `$2F,$30,$3A,$2A,$00` (`/0:*`, no CR). There is a SECOND, independent encoding
of the same `%`/`/` choice at `bank01_sub_87EA` (`$87F8-$8805`): a quote-context fallback (cursor
sits right after an unclosed `"` in the input line) that hardcodes `lda #$25`/`#$2f` rather than
reading the table — both had to change for F1 to be consistently `/` everywhere.

**Changes (all in-place, zero byte-shift, zero size change):**
- `$88B0`: F1's table string first byte `$25`→`$2F` (now byte-identical to F2's `/0:*`).
- `$87F8` (`lda #$25`→`lda #$2f`): F1's quote-context fallback now also emits `/`.
- `bank01_sub_87AD` (`$87AD`, `ldx #$07`→`ldx #$06`): the dispatch loop that matches a pressed
  key's code against the 7 table slots (`cmp $88a7,x` for `x=7..1`) now only scans `x=6..1`
  (F8,F3,F7,F5,F2,F1) — slot `x=7` (RUN/STOP, `$88AE`=`$83`) is never compared, so RUN/STOP can
  no longer match. The `$83` key code and its `%0:*` string **stay physically in the table,
  untouched** — disabling the mapping this way (narrowing the scan bound) avoids touching table
  layout/size at all, so nothing downstream shifts. A RUN/STOP press now falls through to
  whatever any other non-macro key already does at this point (`cmp #$0d`/`#$8d` then
  `bank01_sub_873F`, i.e. normal input-line character handling — same as typing an ordinary key).

**Cross-reference:** §23 investigated a DIFFERENT bug involving this same F1 `%0:*` string (armed
console-switch hook + F1 fastload-autorun garbles the screen, because `%0:*` bypasses `RUN`/`LOAD`
so the `$9D` self-disarm never fires). That bug is orthogonal to the `%`→`/` character itself —
`/0:*` bypasses `RUN`/`LOAD` exactly the same way `%0:*` did, so the §23 workaround (launch
autostart programs with `LOAD"*",8,1`+`RUN` while armed, not F1) still applies unchanged.

**Verification:** build clean, all `.errorif` pins hold (bank1 unshifted downstream of the table,
confirmed by rebuilding and reading the raw bytes at `$88A8` back out of the built image). Diff vs
HEAD: **bank1 = 3 bytes changed** (`$87F8`, `$87AD`+1, `$88B0`); all other banks byte-identical.

**HW test expectation:**
- Press **F1** on a disk with a program on it → screen shows `/0:*` (not `%0:*`), fastload+autorun
  still works exactly as before.
- Press **F2** → unchanged, still types `/0:*`.
- Press **C=+RUN/STOP** → no longer types anything special; behaves like an ordinary/no-op key
  press in that context (confirm it does NOT still type `%0:*`, and confirm nothing looks visually
  broken — e.g. no stray character echoed).
- Regression: F5/F7/F3/F8 macros (directory shortcuts, monitor) unchanged; stock sweep; TASS.

## 30  Modifier-key mapping — forward raw SHFLAG, swap server-side (built+byte-verified 2026-07-14)

**Request (Honza, 2026-07-14):** fix the long-standing `key_send` modifier bug — the wedge sends
`modifiers=0` for every forwarded console keystroke, so console apps that use explicit **C=/CTRL
chords** never see the modifier. Concretely: **C=+< / C=+>** (page up/down) and C=+cursor
(word left/right) in the server-side file editor did nothing. A second, related defect: the C=
and CTRL bits are **swapped** between the C64 SHFLAG and the server's `ModifierFlags`.

**Analysis.** Two facts set the design:
1. **`key_send` lives in bank2, which is FULL** — the routine ends at `$9E7E` with the data wall
   at `$9E80` = exactly **1 free byte**. A read-mask-remap (table swap of b1↔b2) needs 8–14 bytes
   and does not fit. So the SHFLAG→ModifierFlags remap **cannot** live in the cartridge.
2. **The bit layouts** are: C64 SHFLAG `$028D` = `{b0 SHIFT, b1 C=, b2 CTRL}`; server-canonical
   `ModifierFlags` = `{b0 SHIFT, b1 CTRL, b2 COMMODORE}` — i.e. **b1↔b2 swapped**, b0 shared.
   Basic typing is unaffected either way: GETIN already folds SHIFT/C= into the PETSCII code and
   CTRL chords arrive as control codes; the modifier byte only drives explicit chords in apps.

**Design (Honza approved "efficient solution, server-side if need be"):** the cartridge forwards
the **raw SHFLAG byte** verbatim (costs exactly the 1 free bank2 byte), and the remap lives
**server-side**, applied **once on ingest** so every console app speaks one canonical convention.

**Cartridge change — 1 byte (bank2 `key_send`, `$9E6E`):**
- `lda #$00` (`A9 00`) → `lda $028d` (`AD 8D 02`). The following `sta $df1d` is unchanged.
- Net +1 byte: the `bcs ks_done` operand at `$9E4F` bumps `2E→2F` (target moved down 1), the
  routine tail shifts down 1, `rts` lands at `$9E7F` (the former fill byte), and `$9E80` (real
  data band `dec $01/lda ($bb),y/…`) is **untouched**. Byte-diff vs the pre-edit baseline is
  exactly these bytes; **banks 0/1/3–7 byte-identical** (only `bank02.asm` changed). Build clean,
  `.errorif ($9E80)` wall pin holds. Archive `build/archive-KM-shflag.bin`.
- No mask needed — SHFLAG's upper bits are always 0.

**Server changes (`cloud/`, pytest-covered):**
- `sdk/command_handler.py`: new `swap_c64_modifiers(raw)` = `(raw&1) | ((raw>>1)&2) | ((raw<<1)&4)`
  (swap b1↔b2, keep SHIFT). Applied at both keypress ingest points — `handle_keypress` (logging)
  and `handle_console_keypress` (the app-facing path, before `ConsoleManager.handle_keypress`).
- `server-apps/file_editor_console.py`: its 7 C= chord tests were written against the raw-SHFLAG
  position (`mod & 0x02`); post-swap C= is canonical `MOD_COMMODORE` (0x04), so all 7 became
  `mod & MOD_COMMODORE`. Uncommented the `MOD_*` constants; corrected two stale comments
  (`# CTRL modifier` → `CBM+HOME`; the `mod=0x02` wire note → `mod=MOD_COMMODORE`).
- **Other apps already canonical:** `telegram_chat` uses `mod & MOD_COMMODORE` (0x04) ✓;
  `wiki_browser.MOD_CTRL=0x02` is an unused constant; `rss_reader` tests no bits. No changes.
- Tests: `test_cloud.py::test_swap_c64_modifiers` (8-way truth table) + new
  `test_file_editor_modifiers.py` (C=+< / C=+> page, no-modifier does not page, C=+cursor word
  motion differs from plain). Full cloud suite **165 passed, 1 skipped** (was 161).

**Coherence note (Honza confirmed):** in `cs_modal` we run our own `SCNKEY` then `GETIN` with
IRQs masked, so `$028D` reflects the modifiers held during the scan that produced the key — no
intervening scan desyncs them.

**HW test expectation (server up):**
- In the file editor (console 2), **C=+<** pages up, **C=+>** pages down; C=+cursor jumps by word.
- Normal typing across all consoles unchanged (SHIFT/C= folding, CTRL control codes) — no
  stray/duplicated characters.
- Full regression: console switch (C=+CTRL+1..7), pwd/cd/ll, `#`-family, stock sweep, TASS/TMP.

> **Note on the flashed build:** this cartridge bundles §28 (HDN rename + instant arm), §29 (F1
> macro `/0:*` + RUN/STOP off) and §30 together — all bank1/bank2 in-place, no code shift. Byte
> deltas are independent and each verified separately vs the pre-change baseline.

## 31  Boot-banner change — VIABILITY ANALYSIS (2026-07-14)

**Task:** change the cold-boot screen so it shows the HDN identity + detected REU size + Ultimate
DOS version, à la the old ROM-shell / `wedge-latest-not-working` (`**** COMMODORE 64 SHELL V1 ****`
+ `16M REU ULTIMATE-II DOS V1.2, HONDANI`). Question posed: is this viable given free cartridge
space? **Verdict: YES for the second (cartridge) line, at low risk; the first (KERNAL) line is a
separate, higher-risk job we chose NOT to do.**

### What actually prints the boot screen today (working tree)

Cold start runs in **bank01** (`bank01_api_00`, `$8081`+). Two independent prints:

1. `jsr $e422` at **bank01.asm:350** → **KERNAL ROM** prints `**** COMMODORE 64 BASIC V2 ****` +
   `38911 BASIC BYTES FREE`. **This text is in the KERNAL, not the cartridge.**
2. `jsr bank01_sub_9F51` + inline arg `$8048` (bank01.asm:352-353) → the RR cross-bank call gadget
   maps **bank03** and calls its API `$8048 → $9FC8` (`bank03_api_21`), which prints the cartridge's
   own line: `   CYBERPUNX RETRO REPLAY 64KB - 3.8P` (**bank03.asm:3979-3983**).

So the screen is:
```
    **** COMMODORE 64 BASIC V2 ****     <- KERNAL $e422   (line 1)
 38911 BASIC BYTES FREE                 <- KERNAL $e422
   CYBERPUNX RETRO REPLAY 64KB - 3.8P   <- cartridge bank03 $9FC8  (line 2)
READY.
```

### Line 2 (`CYBERPUNX RETRO REPLAY …`) → REU + UCI + RR — VIABLE, LOW RISK ✅

The cartridge **already** owns and prints this line (`bank03_api_21` @ `$9FC8`). We just rewrite what
it prints. No frozen-bank1 edit; same discipline as every step so far.

- **Static text budget (in-place):** the current string is 41 B (`$9FCB-$9FF3`) + `rts`/`brk`, then
  `$9FF5-$9FFF` = 11 B stock-zero slack. The new literal fragments (` REU  UCI `, `  RR 3.8P`,
  leading CR/spaces) are ~20 B — **fits in-place** in bank03, well under the old 41 B.
- **New CODE needed (does NOT fit bank03 — it is full):**
  - **REU size probe** — **must be the NON-DESTRUCTIVE read-save-restore probe** (the
    `wedge-latest-not-working` round-10 `reu_detect`). The TMP/TASS payload lives *in the REU*;
    the naïve probe that writes a byte to every 64 KB bank corrupts it (documented cause of
    "TASS-after-reset dies into the freeze menu"). Non-destructive probe ≈ 60-80 B.
  - **Short-version parse** — `st_identify` (bank03 `status`) already fetches the full
    `ULTIMATE-II DOS V1.2` reply; printing only `V1.2` = scan to `'V'`, print to end. ≈ 15-20 B.
  - **Decimal MB print** for the REU size (`print_dec_byte` equivalent). ≈ 15-20 B.
  - Total ≈ **100-120 B of new code** → lands in a **bank5/bank6 reserve pocket** (bank5 `$9E00`
    157 B / `$9F58` 168 B; bank6 `$8023-$80FF` 221 B / `$9E00` / `$9F58`), reached from `api_21`
    via the existing `call_bankX` RAM trampoline. api_21 runs with bank03 mapped inside the RR
    gadget's `sei` window, so a nested bank-switch to a reserve pocket is the exact pattern steps
    17/21 already use — **but at COLD-BOOT timing**, which the trampolines have not been exercised
    at before (they self-heal per call from ROM into the datassette buffer, which is free at cold
    start — expected safe, to be proved with a border-flash probe first, per 15-pre discipline).
- **Cold-boot UCI availability:** IDENTIFY is read-only and bounded (`hsh_widl/push/wdav/fin`); the
  not-working tree did a boot-time `dos_simple_print` successfully. If the Command Interface is off /
  no Ultimate, the bounded loop must fall through and just skip the `UCI Vx.y` part (print REU + RR
  only) — never hang. Same for "no REU": probe returns carry-clear → omit the ` REU` field.

**Decision (Honza, 2026-07-14):** line-2 content = **REU size + SHORT UCI version + keep `RR 3.8P`**
(e.g. `16M REU  UCI V1.2  RR 3.8P`). REU probing accepted → **non-destructive probe mandatory.**

### Line 1 (`COMMODORE 64 BASIC V2` → `SHELL V1`) — VIABLE but HIGHER RISK — NOT DOING ❌

That text is the KERNAL's. Changing it means replacing `jsr $e422` (bank01.asm:350) — a 3-byte
in-place patch (no shift) in **FROZEN bank01** — and then **reimplementing** everything `$e422` does
(screen clear, banner, `BYTES FREE`, screen pointers), the exact path `wedge-latest-not-working` took
(its bank01.asm:342 `jsr boot_hook`; boot_banner in its bank05). bank01 is our highest-risk frozen
bank and that tree is the broken one. **Decision (Honza, 2026-07-14): scope = LINE 2 ONLY.** The
stock `COMMODORE 64 BASIC V2` banner stays. (Note: the `SHELL V1` first line described in
`docs/user_manual/installation_alternative.md` is the *old ROM-replacement* product; the RR-wedge
keeps BASIC's banner by design.)

### BB-pre — BUILT + byte-verified 2026-07-14 (awaiting HW test)

Implements the trampoline + pocket, printing the SAME line text so the screen is unchanged
except a deliberate border flash. **Diff vs pre-BB baseline (`build/archive/baseline-preBB.bin`)
= bank3 + bank5 ONLY** (banks 0/1/2/4/6/7 byte-identical):

- **bank3 `api_21` (`$9FC8`)** — was `jsr bank03_sub_8362` + the 41-byte "CYBERPUNX RETRO REPLAY"
  string. Now: heal a 14-byte `bb_tramp` into `$0378` (`A9 88 / 8D 00 DE / 20 23 80 / A9 18 /
  8D 00 DE / 60`), `jsr $0378`, `rts`. The trampoline maps bank5 (`$88`), `jsr $8023` (bb_entry),
  restores bank3 (`$18`). 43 diff bytes `$9FC8-$9FF3`; rest zero-filled to the stock `$9FF5` data.
  **Why safe in every caller:** api_21 is the shared version-line printer ($8048), entered by the
  bank01 BASIC cold-start (via the `$9F51` RR gadget), and the bank00/bank02 boot paths. Its code
  only *executes* when bank3 is mapped, so restoring `$18` is always correct; the nested bank5
  excursion + restore is self-consistent. Side effect: the border flash + pocket-printed line now
  occur wherever api_21 runs (e.g. a RUN/STOP-RESTORE that reprints the version line) — cosmetic.
- **bank5 `bb_entry` (`$8023`)** — in the dead, not-installer-copied `$8023-$80FF` pocket (bank5
  copies `$8100-$9DFF` only; verified stock-zero; symmetric with bank6's proven `b6_helpers`).
  `inc $d020` (border = "pocket ran") + a `$ffd2` CHROUT loop over the same 40-byte text + `rts`.
  55 diff bytes `$8023-$805A`; `.fill` to `$8100`; TMP payload resumes byte-exact (`$8100 = 4C B7 80`).

**What a green HW test proves (all three at once):** (1) the `call_bank5` trampoline works at
COLD-BOOT timing; (2) writing/executing bank5 `$8023-$80FF` does NOT corrupt the TMP/TASS REU image
(→ the pocket TASS-passes); (3) `$ffd2` CHROUT works from a mapped pocket — the exact print path BB1
needs. If the border shifts but the text is garbled → trampoline OK, CHROUT-from-pocket needs the
bank3 route (BB1 adjusts). If TASS breaks → the bank5 pocket is unsafe (revert). **BB1 is gated on
this pass** (its REU probe both prints via this path and must not corrupt the REU image — no point
stacking it on an unproven foundation; also its scratch bytes want HW confirmation).

### BB-pre — HW TESTED 2026-07-15 ✅ (all good)

Border shifted to grey (`inc $d020` ran), the RETRO REPLAY line prints from the bank5 pocket, and
TASS/stock sweep all passed. All three foundations proven: cold-boot `call_bank5` trampoline, the
bank5 `$8023-$80FF` dead pocket is TASS-safe, and `$ffd2` CHROUT works from a mapped pocket.

### BB1 — HW TESTED 2026-07-15 ✅ (all good)

Boot line 2 read `16M REU  RR 3.8P` (REU correctly probed as 16 MB = 256 banks) and TASS/TMP
launch+exit + the stock sweep all passed — the non-destructive probe leaves the REU/TMP image
intact. Details of the build below.

### BB1 — BUILT + byte-verified 2026-07-15

Boot line 2 becomes `<n>M REU  RR 3.8P` (e.g. `16M REU  RR 3.8P`). **bank3 api_21 trampoline is
UNCHANGED from BB-pre** (byte-identical); the whole step is bank5 pocket content. Diff vs pre-BB
baseline = bank3 `$9FC8-$9FF3` (BB-pre trampoline) + bank5 `$8023-$80FD` (207 B); banks
0/1/2/4/6/7 byte-identical; TMP payload `$8100` (`4C B7 80`) + everything `$8100+` byte-identical.

- **`reu_detect` (non-destructive size probe)** — ladder of banks `0,1,2,4,…128` at offset 0.
  SAVE all 9 bytes → `reu_save` ($0201-$0209); MARK bank0 = `$AA`; PROBE rungs 1..8 writing `$55`
  until bank0 aliases (wrapped = size); RESTORE all 9 saved bytes (bank0 last). Returns A = bank
  count (`0` = 256 banks = 16 MB). Because every touched REU byte is read+saved+written-back, the
  net REU change is zero — the TMP/TASS image survives (**the HW test must confirm TASS still
  launches**). `reu_xfer` (A=bank, X=cmd `$90` write/`$91` read) does a 1-byte `$0200`↔REU DMA and
  preserves Y (the loop index). REU regs `$DF01-$DF08`; scratch `$0200` staging + `$0201-$0209` +
  `$FB`. All bank-independent, so it runs correctly with bank5 mapped.
- **Print** — `print_num` (0-99 decimal, leading-zero-suppressed) for the MB value, then the fixed
  `msg_line` "M REU  RR 3.8P"+CR. MB = banks/16 (`0`→16). **UCI version comes in BB2.**
- **Scope cut to fit the 221 B pocket:** assumes a REU is present (the C64U always emulates one);
  graceful "no REU" (skip the field) is deferred to BB2. Three byte-trims got it to 219 B: dropped a
  redundant `cmp #$00` (reu_detect's final `lda` sets Z), a redundant `$0200` pre-clear before the
  read-back DMA, and a reordered `reu_xfer` reusing `A=0` for `LENGTH_HI`.
- **Known limits (BB1):** sub-1 MB REUs would print `0M REU` (MB = banks/16 truncates); the C64U is
  16 MB so this is moot until BB2 generalises. The probe also runs wherever api_21 runs (bank00/02
  boot paths, possible RUN/STOP-RESTORE) — harmless (non-destructive) but repeats the DMA dance.

### BB2-pre — open bank7 (BUILT + byte-verified 2026-07-15, awaiting HW test)

**Why a new bank:** after BB1, every proven pocket is nearly full — bank5 `$8023-$80FF` = 2 B free,
bank6 `$8023-$80FF` = 30 B, the `$9E00`/`$9F58` pockets ≤ 11 B each. BB2's UCI IDENTIFY + read +
version-scan + print is ~90-110 B and fits nowhere; bank5 (where the line lived) can't even hold a
trampoline to reach a helper. **bank7 is pristine** (`bank7 == stock`; three dead pockets
`$8023-$80FF` + `$9E00-$9E9C` + `$9F58-$9FFF` = **546 B**, all zero, all outside the installer's
`$8100-$9DFF` copy map — installer copies bank7 `$8100-$9DFF` → `$B200-$CEFF`; select value `$98`).

**What BB2-pre does (Honza chose the "all boot-line code in bank7" clean architecture):**
- **bank3 api_21 trampoline:** one byte — the map operand `$88` (bank5) → `$98` (bank7). Everything
  else identical; still heals 14 B into `$0378`, `jsr`s it, `rts`. Diff region unchanged (`$9FC8-$9FF3`).
- **bank7 `bb_main` @ `$8023`:** the BB1 boot-line (REU probe + `print_num` + "M REU  RR 3.8P"),
  **byte-identical logic**, relocated here (207 B, `$8023-$80FD`). All bank-independent (REU/`$0200`/
  CHROUT), so it runs correctly with bank7 mapped. No trampolines (bank7 is self-contained).
- **bank5 reverted to stock** (`git checkout` — BB-pre/BB1 removed); identical to the pre-BB baseline.

**Diff vs pre-BB baseline = bank3 `$9FC8-$9FF3` + bank7 `$8023-$80FD` ONLY**; banks 0/1/2/4/5/6
byte-identical; bank7 TMP payload `$8100+` byte-identical. **HW test = the proof bank7 is safe:** boot
line 2 must read `16M REU  RR 3.8P` (now from bank7) AND TASS/TMP must still launch+exit (proves
mapping bank7 at cold boot + writing/executing its `$8023-$80FF` pocket leaves the REU image intact).
Then BB2 fills bank7's `$9E00`/`$9F58` pockets with the UCI-version block (same-bank `jsr`).

### BB2-pre — HW TESTED 2026-07-15 ✅ (all good)

Boot line 2 = `16M REU  RR 3.8P` printed from bank7; TASS/stock intact. bank7 maps safely at cold
boot and its `$8023-$80FF` pocket is TASS-safe. Bank7 opened for BB2.

### BB2 — UCI version (BUILT + byte-verified 2026-07-15, awaiting HW test)

Boot line 2 becomes `<n>M REU UCI Vx.y RR 3.8P` (e.g. `16M REU UCI V1.2 RR 3.8P`). All in **bank7**,
across its three dead pockets, reached by same-bank `jsr` (bank7 is mapped for the whole excursion) —
**no b7c3 trampoline needed** since the UCI command registers `$df1c-$df1f` are bank-independent.

- **bank7 `$8023` pocket:** `bb_main` + `reu_detect` + `print_num` + `msg_reu`("M REU ") +
  `msg_rr`("RR 3.8P"+CR). `bb_main` prints CR → REU MB → "M REU " → `jsr uci_ver` → "RR 3.8P".
- **bank7 `$9E00` pocket:** `reu_xfer` (relocated from `$8023` for room) + `uv_txt` ("UCI ").
- **bank7 `$9F58` pocket:** `uci_ver` (130 B) — self-contained UCI DOS1 IDENTIFY replicating the
  bank3 `hsh_*` logic: `$0E` reset → write TARGET_DOS1 `$01` + cmd `$01` to `$df1d` → PUSH
  (`$df1c |= $01`) → error-check → **bounded** wait DATA_AV → print "UCI " → read `$df1e`, scan for
  the first `V`, CHROUT from there → trailing space → drain data + drain status (`$df1f`) +
  `DATA_ACC` (`$df1c |= $02`, leaves UCI idle). Every wait is a 16-bit counter (never hangs).
  **Fails open:** state error / no DATA_AV → nothing printed, line stays `<n>M REU RR 3.8P`.
  Disassembly-verified byte-for-byte (all branches land correctly; accept leaves UCI idle so the
  `status` command still works after boot).

**Diff vs pre-BB baseline = bank3 `$9FC8-$9FF3` (unchanged from BB2-pre) + bank7 `$8023-$9FD9`
(350 B, 3 pockets)**; banks 0/1/2/4/5/6 identical; bank7 TMP payloads `$8100-$9DFF` and `$9E9D+`
byte-identical. **Trims to fit** (bank7 pockets are 221/157/168 B, not one contiguous run): dropped
the idle-wait loop for a single `$0E` reset, and dropped the separate command-busy wait (the
DATA_AV wait covers it) — both safe because the C64U leaves the UCI idle at boot and any later
command re-syncs. Spacing is single-spaced both ways (uci_ver prints a trailing space; on no-UCI it
prints nothing, so `M REU ` + `RR` reads cleanly).

### BB2 — HW test 2026-07-15: REU + CPX/RR shown, **UCI field missing** → BB2b fix

BB2 HW result: boot line = `16M REU RR 3.8P` — the REU size + RR are correct, but `uci_ver` printed
nothing. Root cause: `status` (which shows `ULTIMATE-II DOS V1.2` fine at the prompt) does a full
`uci_idle_kick` first, but my trimmed `uci_ver` pushed IDENTIFY **without waiting for UCI idle**. At
the prompt the UCI is already idle so it would work; at **boot** it is not, so the PUSH landed on a
non-idle UCI, the command never executed, DATA_AV never arrived → bounded timeout → nothing printed.

**BB2b (built+byte-verified 2026-07-15):** restored the two waits so `uci_ver` matches the proven
`status` path — added `uv_widl` (bounded wait-idle, in the `$9E00` pocket) and call it before the
header (with an `$0E` abort+retry if still not idle), plus the command **busy-wait** after PUSH.
`uci_ver` grew to 160 B (fits the 168 B `$9F58` pocket). Also, per Honza, `RR 3.8P` → **`CPX RR 3.8P`**
(the CyberPunX branding). Line now: `16M REU UCI Vx.y CPX RR 3.8P` (UCI field omitted, still bounded,
if the Ultimate doesn't reply). Diff vs baseline = bank3 tramp (unchanged) + bank7 `$8023-$9FF7`
(401 B, 3 pockets); banks 0/1/2/4/5/6 identical; bank7 TMP payloads byte-identical; `uci_ver`
disassembly-verified end-to-end.

### Proposed step split (small, HW-tested — awaiting go-ahead)

- **BB-pre** — prove a reserve pocket is reachable from `api_21` **at cold boot**: a throwaway
  border-flash stub (`inc $d020`) `jsr`'d from api_21 through the `call_bankX` trampoline, printed
  after the RETRO REPLAY line. Cold boot → border colour shifted; stock sweep + TASS/TMP intact.
- **BB1** — non-destructive `reu_detect` ported into the reserve pocket + decimal-MB print; api_21
  prints `<n>M REU` before the RR line (identify not yet touched). Verify size on real REU + TASS/TMP.
- **BB2** — short UCI-version parse; final line `<n>M REU  UCI Vx.y  RR 3.8P`; graceful fall-through
  when no UCI / no REU. Full stock sweep + TASS/TMP.
- **BB3** — docs: reconcile `installation_alternative.md` "Verify it works" to the actual RR-wedge
  screen (line 1 stays `BASIC V2`).

## 32  BB-L1 — line 1 banner text (`BASIC V2` → `SHELL V1`), 2026-07-15

Reopens §31's "NOT DOING" call on line 1, at Honza's request. Grilled first (per task instructions):
confirmed Honza wanted the full-reimplementation *visual* result (any text, not just a same-length
swap) but, once the actual mechanics were disassembled, the safest way to deliver that turned out to
require **zero bank1 changes at all** — a materially different (better) plan than either option
originally posed, re-confirmed with Honza before building.

### 32.1 What `$e422` actually does (disassembled from `data/roms/kernal`, not guessed)

Earlier text ("changing it needs reimplementing screen clear, banner, BYTES FREE, screen pointers")
was speculation, never disassembled. The real routine (KERNAL `$E422`, offset `$422` in the 8 KB
KERNAL ROM image):
```
$E422: lda $2B / ldy $2C        ; A/Y = VARTAB
       jsr $A408                 ; reset TXTPTR (stock BASIC-ROM sub)
       lda #$73 / ldy #$E4
       jsr $AB1E                 ; print null-terminated string at $E473 (stock BASIC-ROM sub,
                                  ; generic "print string at A/Y" -- not $e422-specific)
       lda $37 / sec / sbc $2B / tax   ; bytes-free = MEMSIZ - VARTAB
       lda $38 / sbc $2C
       jsr $BDCD                 ; print unsigned decimal in A/X (stock BASIC-ROM sub)
       lda #$60 / ldy #$E4
       jsr $AB1E                 ; print string at $E460
       jmp $A644                  ; stock continuation
```
ROM string data (`xxd data/roms/kernal`, offset = addr - `$E000`):
```
$E473: 93 0D 20 20 20 20 2A2A2A2A 20 "COMMODORE" 20 "64" 20 "BASIC" 20 "V2" 20 2A2A2A2A 0D 0D 20 00
       (CLR)(CR)(4 margin spaces)(****)( )(COMMODORE)( )(64)( )(BASIC)( )(V2)( )(****)(CR)(CR)( )NUL
$E460: 20 "BASIC" 20 "BYTES" 20 "FREE" 0D 00
       ( )(BASIC)( )(BYTES)( )(FREE)(CR)NUL
```
So: **screen clear and BASIC-pointer setup are NOT part of `$e422`** — the clear is a single `$93`
byte baked into the banner string itself, and `$A408`/`$AB1E`/`$BDCD`/`$A644` are generic, reusable,
untouched KERNAL/BASIC-ROM entry points at fixed `$A000-$FFFF` addresses — always mapped, unaffected
by which of our cartridge's 8 banks (`$8000-$9FFF`) is currently switched in. The visible "**** COMMODORE
64 BASIC V2 ****" text (31 chars: 4 margin spaces are separate, not counted) lands at a **fixed,
deterministic screen position**: default screen base `$0400`, row 1 (second row, 0-indexed), starting
column 4 → screen address **`$042C`**. This only holds because CINT (`jsr $ff5b`, called *before*
`$e422` in `bank01_api_00`) has already set the default screen/VIC state and nothing in the wedge or
RR touches screen base before this point.

### 32.2 Why hooking bank1's `jsr $e422` directly doesn't work as an in-place patch

`jsr $e422` lives at bank1 `$8074` (confirmed: only one `20 22 E4` occurrence in bank1, byte-diffed
directly against `build/rr38p-tmp12reu.rebuilt.bin`). A same-size 3-byte patch (`jsr $e422` →
`jsr <somewhere>`) is trivial *if* `<somewhere>` already contains valid code the instant this runs.
But every RAM trampoline in this project (`call_bank3`/`4`/`5`, `bb_tramp`) is **self-healed**: the
*calling* ROM code copies a template into RAM immediately before every use. That healing loop itself
needs a handful of bytes in the calling bank — and **bank1 has zero free bytes** (established fact,
`next_steps.md` "Hard constraint discovered: bank2 is FULL" era and reconfirmed since). There is
nowhere in bank1 to put a heal-loop, so a bank1-triggered trampoline would require bank1 to *grow*,
breaking the in-place/zero-growth safety property every step before this one has relied on — a
materially bigger, riskier change than anything done so far in this frozen bank. (A theoretical
alternative — reusing the existing `bank01_sub_9F51` "far call" gadget already invoked twice in this
same boot routine — was considered and rejected: its exact addressing convention (a `$DEEE,x` bank
lookup table keyed off byte arithmetic on the *return address*) is RR's own undocumented internal
mechanism; reverse-engineering and repurposing it for an arbitrary new target without a stock
precedent is exactly the kind of "clever but unverified" bank1 surgery this project's discipline
avoids.)

### 32.3 The chosen mechanism — extend the already-proven `api_21` trampoline, bank1 untouched

`bank03_api_21` (`$9FC8`) already runs immediately after `$e422` in the *same* cold-boot instruction
stream (bank01 calls it via the stock `$9F51` RR gadget right after `$e422` returns — see the boot
sequence in `bank01.asm` `bank01_api_00`). It already has a hardware-proven self-healing RAM
trampoline (`$0378`) into cold-boot-safe reserve pockets (BB-pre/BB1 proved bank5 `$8023`; BB2-pre/BB2/
BB2b proved bank7's three pockets). Since `$e422`'s banner is 100% static text (unlike the BYTES FREE
line, which needs the live calculation), all we need is a screen-RAM overwrite of the fixed `$042C`
position — **before the frame is ever actually displayed** (both `$e422` and this extra excursion
finish in a few thousand cycles, far under one TV frame, same "no visible intermediate state"
guarantee BB-pre's border-flash proof already demonstrated).

**Design:** reuse the *same* 14-byte `bb_tramp` template and the *same* `$0378` RAM home for **two**
sequential excursions instead of one, live-patching a single byte (the healed copy's bank-select
immediate, at `$0379`) between them:
```
bank03_api_21:
    ldx #bb_tramp_end - bb_tramp - 1   ; heal bb_tramp -> $0378 (UNCHANGED from BB2b)
bbp_cp:
    lda bb_tramp,x
    sta $0378,x
    dex
    bpl bbp_cp
    lda #$88                ; NEW: retarget the healed copy -> bank5 ($88)
    sta $0379                ; NEW: patches the live `lda #$98` at $0378/$0379 in place
    jsr $0378                 ; NEW: bank5 excursion -> l1_poke (line-1 banner overwrite)
    lda #$98                  ; NEW: retarget back -> bank7 ($98), stock value
    sta $0379                  ; NEW
    jsr $0378                   ; UNCHANGED: bank7 excursion -> bb_main (line 2, exactly as BB2b)
    rts                          ; UNCHANGED
bb_tramp:                        ; UNCHANGED template (still maps bank7 by default when healed)
    .byte $A9, $98, $8D, $00, $DE, $20, $23, $80, $A9, $18, $8D, $00, $DE, $60
bb_tramp_end:
```
13 new bytes (`lda#/sta/jsr/lda#/sta` = 2+3+3+2+3). `bb_tramp_end` moves from `$9FE5` to `$9FF2`,
still `<= $9FF5` (the existing `.errorif` guard), using 13 of the 16 B slack with 3 B to spare — no
other byte in bank3 moves. Both excursions land back in bank3 (`$18`) via the template's own
unchanged internal restore before the next step runs, so there is no concurrent/nested bank state —
strictly two sequential, self-contained, already-proven-shaped excursions.

**`l1_poke` in bank5's `$8023` pocket** (fully reverted to stock since BB2-pre, unused since — 222 B
free, and this exact pocket was individually HW-proven cold-boot-safe + TASS-safe by BB-pre/BB1):
```
l1_poke:
    ldx #$1e                  ; 31 bytes, index 30..0
l1_lp:
    lda l1_text,x
    sta $042c,x                ; screen row 1, col 4 (default screen base $0400)
    dex
    bpl l1_lp
    rts
l1_text:                        ; "**** COMMODORE 64 SHELL V1 ****" in C64 screen codes
                                 ; (screen RAM uses screen codes, NOT PETSCII: uppercase
                                 ; A-Z = petscii-$40; digits/space/'*' are identical to petscii)
    .byte $2a,$2a,$2a,$2a,$20                          // "**** "
    .byte $03,$0f,$0d,$0d,$0f,$04,$0f,$12,$05,$20      // "COMMODORE "
    .byte $36,$34,$20                                   // "64 "
    .byte $13,$08,$05,$0c,$0c,$20                       // "SHELL "
    .byte $16,$31,$20                                    // "V1 "
    .byte $2a,$2a,$2a,$2a                                 // "****"
```
~41 bytes total, comfortably inside the 222 B pocket. `l1_poke` writes the **whole** 31-char span
(not just the 7 changed characters) — simpler, self-contained, and no more risky, since this screen
region holds only boot text at the moment it runs, never user content.

**What this achieves:** bank1 and the real KERNAL `$e422` are **100% untouched** — `$e422` still runs
exactly as stock (screen clear, BYTES FREE calc, all of it, byte-for-byte identical), and only the
*result* it already painted onto a known, fixed screen address gets overwritten immediately
afterward. Same accepted cosmetic caveat as line 2: if `api_21` re-runs later (e.g. RUN/STOP-RESTORE),
line 1 gets reprinted too — already an accepted, documented side effect for line 2, not a new risk
category.

### 32.4 Verification plan

Byte-diff vs the BB2b baseline should show **only**: bank3 `$9FC8-$9FF3` region (13 new bytes, same
43 B window BB-pre/BB1/BB2/BB2b already touch — `bb_tramp_end` moves within the existing `.errorif`
budget) + bank5 `$8023-...` (previously all-zero, now `l1_poke` + `l1_text`, ~41 B). Banks 0/1/2/4/6/7
byte-identical to BB2b (bank1 completely untouched — the KERNAL `$e422` call site is never patched).
HW test: cold boot line 1 reads `**** COMMODORE 64 SHELL V1 ****`; line 2 (`16M REU UCI Vx.y CPX RR
3.8P`) and the `BASIC BYTES FREE` line unchanged; full stock sweep + TASS/TMP launch+exit (proves the
bank5 `$8023` pocket write still doesn't corrupt the REU image, same guarantee BB-pre/BB1 already
established for that exact pocket).

### 32.5 BB-L1 — BUILT + byte-verified 2026-07-15

One transcription slip caught during the build: bank5's `$8023-$80FF` pocket is **not** the whole of
bank5's dead space — bank5 also carries the unrelated `mnt`/`umnt` (step 17) code in its `$9E00`/`$9F58`
pockets, still live. Editing the `$8023` region's source lines by hand initially dropped 3 real TMP-
payload bytes (`4C B7 80`, the `jmp $80B7` at `$8100-$8102`, bundled in the same source row as the
padding) — caught immediately by the `b5_disp not at $9E00` `.errorif` on the first build attempt
(exactly the kind of guard these `.errorif` pins exist for). Fixed by restoring the 3-byte row
explicitly between the `.fill` and the resumed TMP payload; rebuild succeeded clean.

**Byte-diff vs `build/archive/BB2b.bin`:**
- **bank3 `$9FCB-$9FF1`** (30 B): the two-call retarget sequence inserted after the heal-loop, plus
  `bb_tramp`'s 14-byte table sliding down 13 bytes to make room (its *content* is byte-identical, just
  relocated). `bb_tramp_end` now `$9FF2`, 3 B inside the existing `.errorif (* > $9FF5)` budget.
- **bank5 `$8023-$804D`** (43 B): `l1_poke` (9 B: `ldx #$1e / lda l1_text,x / sta $042c,x / dex / bpl / rts`)
  + `l1_text` (31 B, the screen-code table) — replacing what was, and beyond it remains, all-zero
  pocket. Real TMP payload from `$8100` on is confirmed byte-identical to baseline.
- **Banks 0/1/2/4/6/7 byte-identical** to `BB2b.bin` — bank1 explicitly diffed and confirmed
  byte-for-byte unchanged (the KERNAL `$e422` call site was never touched, as designed).

**Manual disassembly verification** (not just a byte-count match — decoded every instruction from the
built `.bin`):
```
bank3 $9FC8: A2 0D           ldx #$0D
             BD E4 9F        lda bb_tramp,x      ; operand $9FE4 = table's new (shifted) address
             9D 78 03        sta $0378,x
             CA              dex
             10 F7           bpl -9               ; loops back correctly
             A9 88           lda #$88
             8D 79 03        sta $0379
             20 78 03        jsr $0378             ; bank5 excursion
             A9 98           lda #$98
             8D 79 03        sta $0379
             20 78 03        jsr $0378              ; bank7 excursion (unchanged path)
             60              rts
     $9FE4:  A9 98 8D 00 DE 20 23 80 A9 18 8D 00 DE 60   ; bb_tramp, byte-identical content
     $9FF2:  00 00 00                                     ; 3 B fill to $9FF5 (unchanged boundary)

bank5 $8023: A2 1E           ldx #$1E             ; 31, index 30..0
             BD 2F 80        lda l1_text,x         ; operand $802F = l1_text address
             9D 2C 04        sta $042c,x            ; screen row 1 col 4
             CA              dex
             10 F7           bpl -9
             60              rts
     $802F:  2A 2A 2A 2A 20 03 0F 0D 0D 0F 04 0F 12 05 20 36 34 20
             13 08 05 0C 0C 20 16 31 20 2A 2A 2A 2A   ; "**** COMMODORE 64 SHELL V1 ****" screen codes
     $804E:  (zero from here to $80FF, matches diff range end $804D)
```
Every operand, branch offset, and data byte matches the intended design exactly. `build/archive/BB-L1.bin`;
deployed `.crt` md5 `a4aebe00f80d3b0f83a6cfd5b30f5791`. **Awaiting HW test.**

## 33  Auto-arming epic — Step 2 (AA2): boot-arm at cold boot (built+byte-verified, awaiting HW test)

Second half of the auto-arming epic (§28 was AA1: rename HONDANI→HDN + local instant arm). Goal:
**C=+CTRL+1..7 (server consoles) work at the very first READY after a cold boot without typing HDN.**
Approach **Alternative A** (Honza): boot-arm + keep manual `HDN` re-arm + keep the §17 program-mode
self-disarm. Chosen implementation (Honza, after re-analysis of the new boot-banner code): **extend
`bb_main` (bank7) to arm.**

**Why this spot.** After the boot-banner work (§31/§32), `bank03_api_21` ($9FC8) is the confirmed
cold-boot hook and already heals a RAM trampoline at `$0378` to make cross-bank excursions (bank5
line-1, bank7 `bb_main` line-2) — a pattern **proven safe at cold-boot timing**. `cs_install` (the
arm routine: copies the CINV stub → `$03A0`, digit table → `$03F0`, points `$0314`→stub, saves the
prior vector, clears latches) lives in bank2 ($9C41). Reaching it from bank7 needs the same kind of
RAM trampoline. So `bb_main` — which already runs once at cold boot with bank7 mapped and the
banner just printed — is the natural place.

**Design.**
- `bb_done` (end of `bb_main`, `$8055`) now does `jsr bb_arm / rts` (was just `rts`; the `$8023`
  pocket had only ~13 B free so only the call lives here — the arm routine is in the roomy `$9E00`
  pocket).
- `bb_arm` (`$9E3C`, in bank7's `$9E00` dead pocket, ~97 B free after `uw_ok`): `lda #$80/sta $9d`
  (force MSGFLG direct-mode — see below), heals the 14-byte `ba_tramp` into the **idle** call_bank3
  slot `$0360` (NOT the active `$0378` outer trampoline we're running under; `$0360` is re-healed on
  its next real use so clobbering it at boot is safe), `jsr $0360`, `rts`.
- `ba_tramp` (RAM `$0360`): `lda #$10/sta $de00` (map bank2) / `jsr $9c41` (cs_install) /
  `lda #$98/sta $de00` (restore bank7 so `bb_arm`'s continuation is valid) / `rts`.

**Why force `$9D`=$80.** The `$03A0` stub self-disarms on any IRQ while `$9D`==0 (§17: `$9D`=$80 at
the prompt, $00 during a program). This early in cold boot BASIC may not have set `$9D`=$80 yet, and
the zero-page clear at boot leaves it 0 — so a jiffy IRQ firing after the RR cold start's `cli` (but
before BASIC's first `READY`) would self-disarm the freshly installed hook. Interrupts are OFF here
(the cold start's `sei`), so pinning `$9D`=$80 now keeps the "armed ⇒ `$9D`=$80" invariant intact
through to READY; the first post-boot IRQ then keeps the hook live. Benign either way — a mistimed
arm can only fail to stick (degrade to manual `HDN`), never crash (cs_install points `$0314` only
after the stub is fully copied, and self-disarm just restores the saved stock `$EA31`).

**Verification.** Build clean; both pocket `.errorif` bounds hold (`$8023`<`$8100`, `$9E00`<`$9E9D`).
Diff vs committed HEAD: **bank7 only**; banks 0-6 **byte-identical**. Changes confined to bank7's two
dead pockets — the `$8023` pocket (`bb_done`+3 B `jsr`, which shifts `print_num`/`reu_detect`/`rd_banks`
+3 within the pocket and updates `bb_main`'s jsr operands) and the `$9E00` pocket (`bb_arm`+`ba_tramp`,
`$9E3C-$9E5C`). **DANGER-ZONE `$8100-$9E3B` (TMP payload + stock code): 0 diffs** — the installer copy
window `$8100-$9DFF` is untouched, so TASS/TMP image is safe. `bb_main` pinned `$8023` (the trampoline
`jsr $8023` still lands). `bb_arm` disassembly-verified; `ba_tramp` = `A9 10 8D 00 DE 20 41 9C A9 98
8D 00 DE 60`.

**HW test expectation (AA2):**
- **Cold boot → immediately press C=+CTRL+1..7 (no HDN typed) → server consoles open.** That's the
  whole point: armed at the first READY.
- Boot banner (REU size + UCI version + "CPX RR 3.8P", SHELL V1 line) prints exactly as before — the
  arm runs *after* the banner and must not disturb it.
- `HDN` still arms (AA1); F1=`/0:*` load + RUN self-disarm as designed; running a program then
  pressing a console key without re-arming should NOT switch (self-disarmed) — one `HDN` re-arms.
- Regression: console switch, pwd/cd/ll, `#`-family, status/time/menu, stock sweep + TASS launch/exit
  + freeze→resume all unchanged.
- Known fail-soft: if for some reason it doesn't stick at boot (e.g. `$9D` timing on real HW differs),
  the symptom is just "console keys dead until first HDN" — benign; report and we adjust.

### Next
- **AA3 — docs:** rename HONDANI→HDN across `docs/user_manual/*`; add the "what/why of arming"
  explainer; document boot-arm + manual re-arm after programs.

## Step 23 — cwd-frame matcher made table-driven (+`mkdisk`/`del`) 🔨 built, awaiting HW test

**Problem.** The step-21 cwd CONTEXT frame (`\x01<cwd>\x01<line>`, so the server resolves relative
paths) was only prepended for two commands, because `b6_disp`'s matcher (`$9E00` pocket) recognized
only the literal words `"mkdir "`/`"memcpy "` via a hand-coded char-by-char compare chain. The new
server commands `mkdisk`/`del` were never in that chain, so the wedge forwarded them **bare** — the
server saw no `dos_cwd` and (correctly) rejected any relative path with its usage line. HW symptom:
`mkdisk games.d64` / `del ECHO.PRG` → usage text; only absolute paths worked. (`mnt` is unaffected:
it never used the frame — it hands the raw path to the Ultimate's own DOS1 engine, which tracks its
own cwd. So "reuse GET_PATH like mnt" actually means reuse mkdir/memcpy's frame path, which is what
this does.) Server side was already generic — `request_dispatcher` strips the `\x01…\x01` frame for
*any* line — so **no cloud change was needed**; the fix is wedge-only.

**Change (bank6 only).** Replaced the verbose per-command compare chain (`b6_ck_m`/`b6_ck_mkd`, ~118 B)
with a compact table-driven matcher:
- `b6_match` (`$9E11`, 48 B): folds each line char (`b6_fold`) and matches it against `b6_cmdtab`
  entries; a match requires the whole word followed by a space. C=0 → fall into `b6_ctx` (device gate
  + `b6_get_path`/`b6_prepend`, unchanged); C=1 → `sec`/`rts` forward the line unchanged. `B6_MTMP`
  (`$cf66`, free scratch) holds the table letter across the fold+compare; X/Y are the table/line
  indices (`b6_fold` preserves both).
- `b6_cmdtab` (`$9E43`, 25 B): `MKDIR\0 MEMCPY\0 MKDISK\0 DEL\0 \xff`. **Adding a future cwd-frame
  command is now a one-line table edit** — no code change.

**Verification.** Build clean; `$9E00` pocket `.errorif ($9E9D)` bound holds — region now ends `$9E82`,
**27 B free** (was 0). Diff vs prior build: **bank6 only**; banks 0-5,7 **byte-identical**. `b6_match`
disassembly-verified (all branch targets land: `bmi`→`b6_m_no`, `beq`→`b6_m_space`, `bne`→`b6_m_skip`,
loop→`b6_m_char`/`b6_m_entry`; `jsr $8023`=`b6_fold`). `b6_cmdtab` bytes confirmed in the binary. The
`$8023` helper pocket (`b6_get_path`/`b6_prepend`/`b6_fold`) and `$9F58` pocket (`b6c3`/`b6_autocd`)
are untouched.

**HW test expectation.**
- On `#t`/`#f`/`#h`: `mkdisk games.d64` (relative) creates in the current dir; `del ECHO.PRG` /
  `del *.prg` (relative) delete in the current dir. Server log should now show `(cwd=…)` for both.
- Absolute paths (`mkdisk /sd/home/x.d64`, `del /temp/*.tmp`) still work.
- Regression: `mkdir`/`memcpy` relative + absolute unchanged; `#`-autocd, pwd/cd/ll, mnt/umnt,
  status/time/menu, stock sweep + TASS launch/exit all unchanged (matcher only rewrote command
  recognition; `b6_ctx` onward is byte-for-byte the old logic).
- `del` while on `#n`: still forwarded to the server's NetDriveHandler (the `$cf2a` device gate isn't
  a UCI letter on `#n`, so no frame is prepended — bare forward, as before).

## Step 24 — `file` command (+`CP`/`MV` reserved in the cwd table) 🔨 built, awaiting HW test

**Goal.** New server command `file <name>` printing a file's type / size / modification date+time.
Per the step-23 design this is a **one-line table edit** on the wedge plus a server-side handler —
exactly the extension path step 23 opened up.

**Change (bank6 only, 11 B of data).** Appended three words to `b6_cmdtab`:
`FILE\0 CP\0 MV\0` (before the `\xff` terminator). `CP`/`MV` are added **now but inert** — the server
does not implement them until step 25/26 — so that the whole task costs a single flash cycle. A word
in the table only causes the cwd frame to be prepended; an unimplemented command still forwards and
falls through to the server's existing handlers exactly as before.

**Why these words are safe at `$02a7`.** None of `FILE`/`CP`/`MV` is a BASIC V2 keyword and no keyword
is a prefix of them (nothing crunches on `FI`, `CP`, `MV`), so they reach the shadow line as plain
PETSCII letters just like `MKDIR`/`DEL` already do.

**`CP` interaction with the existing one-arg bridge (checked, benign).** `cp <name>` typed on `#t`
while `active_module=="n"` is the documented "upload from /temp" bridge. It now arrives framed
(`\x01<cwd>\x01cp <name>`); `request_dispatcher` strips the frame for *any* line, so NetDriveHandler
sees `cp <name>` byte-identical to before. Only side effect: `dos_cwd` gets populated in session
state, which that path ignores. No behaviour change.

**Verification.** Build clean; `.errorif ($9E9D)` bound holds — region now ends `$9E8D`, **16 B free**
(was 27). Binary diff vs prior build is provably minimal and mechanical:
- `b6_cmdtab` at `$9E5B`: `46 49 4C 45 00 43 50 00 4D 56 00` then the `ff` terminator, which moved
  `$9E5B`→`$9E66` (+11).
- `b6_ctx` onward shifted by exactly +11 and is **byte-identical modulo the shift** (38 B compared).
- One branch operand at `$9E0E` fixed up `$4D`→`$58` (+11).
- Padding `$9E8D-$9E9C` still all-zero. **Zero bytes changed outside the `$9E00-$9E9C` reserve.**
- Banks 0-5,7 **byte-identical** (rebuilt from HEAD and compared).

**Server side (cloud, no wire-protocol change).** `UltimateHandler` claims `file` unconditionally,
like `mkdir`/`mkdisk`/`memcpy`. It stats over **FTP MLSD**, not REST: `rest_api_calls.md` marks
`GET /v1/files/<path>:info` *"Unfinished"* and, as documented, it returns only size+extension — **no
modification time** — so MLSD is the only route that satisfies the spec. MLSD is HW-verified present
on the Ultimate's FTP (`type=dir;size=0;modify=19800101000000; SD`). `network_helper.rest_file_info`
is used best-effort on top and can only *add* fields MLSD didn't cover; it never raises and degrades
to `{}`, so `file` cannot be broken by that unfinished route.

**HW test expectation.**
- On `#t`/`#f`/`#h`: `file game.prg` (relative) → NAME/TYPE/SIZE/MODIFIED block for the file in the
  current dir. Server log should show `(cwd=…)`.
- Absolute (`file /Usb0/game.prg`) and glob (`file *.d64`, capped at 8 matches) both work.
- `file GAME.PRG` vs `file game.prg` — exact match wins, else case-insensitive retry.
- **Open question for this test:** whether real files carry a true mtime. The root pseudo-dirs report
  the `19800101000000` placeholder (shown as `(not set)`). If real files on USB0 also report 1980,
  the Ultimate's FS keeps no mtime and the MODIFIED line is worth reconsidering.
- Regression: `mkdir`/`memcpy`/`mkdisk`/`del` relative+absolute unchanged; `cp` on `#n`/`#c`/`#t`
  unchanged (see the framing note above); `#`-autocd, pwd/cd/ll, mnt/umnt, status/time/menu, stock
  sweep + TASS launch/exit all unchanged (pure data append; `b6_ctx` onward is byte-for-byte the old
  logic, just relocated).

### Step 24 — HW test #1 results ✅ wedge good, 2 server fixes

**Wedge: PASS, no changes needed.** `file echo.prg` (relative, on `#f`) resolved against the cwd and
returned a correct block — the `b6_cmdtab` append works exactly as step 23 predicted. `CP`/`MV` remain
inert-but-armed. **No further asm change for step 24; the flashed .crt stands for steps 25/26.**

**Finding 1 — real mtimes exist (question closed).** `MODIFIED 2026-07-04 15:54:18` on a real file.
So `19800101000000` is a placeholder *only* on the root pseudo-dirs, and the `(not set)` labelling is
right. **MLSD is confirmed sound as the stat source for `cp`/`mv` to build on.**

**Finding 2 — REST `:info` bonus removed (server).** The route is *not* broken as `rest_api_calls.md`
implies — it answered on HW — but it returns only
`{"files": [{"path": "SD/HOME/echo.prg", "filename": "echo.prg", "size": 10387, "extension": "PRG"}]}`:
**every field MLSD already gives, and still no mtime.** The generic "extra fields" printer rendered
that whole list as a junk `FILES +'path': 'SD/HOME/echo.prg'…` line wrapping over 3 rows of the
40-col screen. Empirically the bonus is 100% duplication with zero upside, so `_format_info`'s REST
enrichment **and** `network_helper.rest_file_info` are deleted rather than special-cased — `file` is
now MLSD-only. (Recorded here because the docs' "Unfinished" note is misleading: the route works, it
is just useless for this command.)

**Finding 3 — `file` on `#n` printed the usage line (server bug, fixed).** HW: `#n`, `pwd`=/demos,
`ll` lists `aaa.prg`, but `file aaa.prg` → `Usage: file <name>`. Cause: `#n` is not a UCI device, so
`b6_ctx`'s device gate (correctly) prepends **no** cwd frame → `dos_cwd` is None → `_resolve_abspath`
returns None → usage. `file` had been scoped Ultimate-FS-only (netdrive was deferred to step 25), but
a correct command answering "Usage" is worse than pulling the work forward. Fixed by following the
**`del` precedent exactly**: `UltimateHandler.can_handle` now yields *both* `del` and `file` when
`active_module=="n"`, and `NetDriveHandler` gained `file` (plain `os.stat`, sandboxed via `_resolve`).
`#c` still answers usage for `file` — CSDB has no real filesystem; step 26 addresses it.

**Refactor.** Both handlers must render an identical block, so the formatter moved to `sdk/file_info.py`
(`format_file_info` / `facts_from_stat` / `format_modify` / `type_of`), keyed off an mlsd()-shaped facts
dict. The FTP path passes MLSD's dict straight through; the local path builds the same shape from
`os.stat`. Only "how do I stat this" is device-specific — the seam step 25's cp/mv abstraction extends.

**Tests.** 309 pass. New regression guards: `test_only_mlsd_fields_are_shown` (exact 4-line output —
pins finding 2), `test_yields_to_netdrive_on_n` (pins finding 3), plus a `TestNetDriveFile` class.

## Step 26 — case-insensitive filename args for `mnt` / `cd` / `file` / `del` ✅ HW TESTED 2026-07-17

**Symptom (TODO.md).** `mnt <image>` (and `cd`, `file`) only worked when the disk-image name was
typed in one specific case. Workflow is `ll` (names shown in real case) → retype with `mnt` in front,
which failed unless the case happened to match.

**Root cause — PETSCII SHIFT range, not a filesystem case issue.** A C64 letter key sends the SAME
PETSCII byte regardless of font mode; only SHIFT changes it: unshifted = `$41–$5A`, SHIFTed = `$C1–$DA`.
The Ultimate DOS matches filenames **case-INSENSITIVELY** but only on real ASCII letters
(`$41–$5A`/`$61–$7A`). The SHIFTed codes `$C1–$DA` are **not** ASCII letters, so a SHIFTed name never
matched → the "needs lowercase" feeling (in text font, unshifted looks lowercase). HW-confirmed:
unshifted `mnt games.d64` mounts; SHIFTed `mnt GAMES.D64` silently failed (`ready.` with no mount).

**Two regimes.**
- **UCI-direct commands** (wedge writes path bytes straight to `$df1d`) have no shared chokepoint — each
  needs its own fold. Full set that takes a typed filename: `cd`, `mnt`, `ll`/`dir <pat>`. `ll`/`dir`
  already folded both sides (2026-07-11). Fixed the other two:
  - **`mnt`** (bank05): new 11-byte `b5_fold` in the main-region gap `$9e92–$9e9c` (exact fit); the
    `b5_dm_wr` send loop now `jsr b5_fold` per path byte (+3 B, third region `b5c3_end` `$9ff9→$9ffc`,
    still <`$A000`). Fold is byte-guarded: only `$C1–$DA → $41–$5A`; leaves `.`/digits/`/`/`←`($5F)/
    already-valid letters/`$DB+` graphics untouched. `umnt` unaffected (skips the path write).
  - **`cd`** (bank04): the existing complete `b4_fold` (handles `$C1–$DA` AND `$61–$7A`, guarded) was
    already used for the *keyword*; now also `jsr b4_fold` in the `b4_cd_wr` path loop (+3 B,
    `b4_cd_ext` `$9e51→$9e54`, fits under the `$9E9D` reserve).
- **Server-routed commands** get a single general chokepoint for free: `petscii_to_utf8` at the
  transport boundary (`request_dispatcher.py`) maps unshifted→ASCII-lower and SHIFTed→ASCII-upper, so
  the untranslatable high bytes never reach a handler. Only per-handler *match* policy remained:
  - **`file`** already had a case-insensitive fallback (`ultimate_handler._stat_entries` +
    `netdrive_handler._file_info`) → **no change**, HW-verified both cases work.
  - **`del`** was the last gap (`_match_files` used case-sensitive `fnmatch.fnmatch`). Made it mirror
    `file`: case-sensitive first, then case-fold fallback (exact match still wins). 2 new tests
    (`test_del_case_insensitive_fallback`, `test_del_exact_match_wins_over_case_fold`); suites green.
  - **create/duplicate** commands (`mkdir`/`mkdisk`/`cp`/`mv`/`memcpy`) deliberately NOT folded — the
    typed case IS the name being created; folding would silently rename.

**HW test 2026-07-17 ✅** `mnt` (unshifted + SHIFTed + mixed-case `MOJO←SIDE1.D64`) mounts; `umnt` ok;
`cd` unshifted + SHIFTed ok, `cd ..`/`cd /` ok; `file` both cases ok. `del` = server unit-tested.

## Step 27 — lowercase charset after boot (`font_lc`) ✅ HW TESTED 2026-07-17

**Goal (TODO.md).** HDN shell should run in the C64 **lowercase/mixed** font so lowercase letters are
available for typing, while the **boot-banner text stays UPPERCASE** and the iconic `READY.` looks right.

**Grilled first + the hard constraint.** The C64 font is a *single global* VIC setting (`$D018` bit 1:
`$15`=uppercase/graphics, `$17`=lowercase/mixed) applied to the whole screen at once, and screen bytes
are re-interpreted live the instant it flips. BASIC's ROM prints `READY.` (and the banner/BYTES-FREE
line) as *unshifted* PETSCII → in lowercase mode those same bytes render as lowercase `ready.`. Keeping
`READY.` uppercase in lowercase mode would need per-prompt rewriting on the **hot IMAIN idle path** — but
**bank1 is full** (only 8 B free at `$9E51–$9E58`; see §23/§32), so that is the *high-risk* branch
(cross-bank excursion + one-shot flag with no clean cold-boot-zeroed home). Honza's decision (grilled,
3 questions): **safe boot-time flip, accept lowercase `ready.`**, applied every boot/reset.

**Approach (low-risk, one-shot, no hot path, no flag).** Piggyback the existing cold-boot boot-banner
printer. `bb_done` (bank7 `$8023` pocket) now `jsr font_lc` right after `jsr bb_arm` (which already left
bank7 mapped), i.e. once the banner + REU/RR line are on screen, IRQ still off under the RR cold-start
`sei`. New `font_lc` (bank7 `$9E00` pocket, `$9E5D`, ~46 B in the 64 B free after `ba_tramp_end`):
- Walks the top two screen pages `$0400–$05FF` (rows 0–12, clear of the sprite pointers at `$07F8`) and
  ORs `$40` into every uppercase-letter screen code `$01–$1A` → `$41–$5A`, which render as the **same
  uppercase glyphs** in the lowercase charset. Guarded fold (`fl_sh`): `<$01` and `≥$1B` (incl.
  reverse-video `$80+` and already-shifted `$41–$5A`) left untouched; digits/space/`*`/`.` are identical
  in both charsets. So the already-printed boot text keeps looking uppercase after the flip.
- Then `lda $d018 / ora #$02 / sta $d018` — sets only the charset bit, preserves the screen-base bits.

Text printed *after* this (the `READY.` prompt, later shell output) renders lowercase — by design.
One-shot: `bb_done` runs once per cold boot; on RESET the KERNAL restores `$D018`=uppercase and it re-runs.

**Placement / no shift of pinned addrs.** `bb_main` stays pinned at `$8023` (trampoline `jsr $8023`).
The 3-byte `jsr font_lc` shifts only bank7-internal labels (`reu_detect $8088→$808B`, `print_num
$806D→$8070`, `rd_banks $80ED→$80F0`) — all label-resolved, no external hardcode (verified). `.errorif`
guards in both pockets self-check overflow; the `$8023` `.fill $8100` and `$9E00` `.fill $9E9D` absorbed
the growth. Cart size unchanged (65728 B). Only `bank07.asm` touched.

**Risk that was tested.** The single hazard of flipping at boot rather than on first idle: a later
cold-boot step (KERNAL screen re-init/CINT/clear) could reset `$D018` back to uppercase *after* `font_lc`.

**HW test 2026-07-17 ✅** Banner + REU/RR + BYTES-FREE stay uppercase; font comes up lowercase/mixed;
existing commands render cleanly in the new font. The flip stuck (no later `$D018` reset). `READY.` shows
as lowercase `ready.` as accepted. NOT committed (Honza's call).

## Step 28 — scrollback via server memory (`C=+CTRL+F5/F7`) ✅ HW TESTED 2026-07-18

**Goal (TODO.md).** Page back through the whole session's screen history — every line that has
scrolled off the top — persistently across resets/power cycles, stored server-side, like a terminal
scrollback / `.bash_history`. Keys: previous screen / next screen. Searchable + clearable were deferred
by Honza ("I'll request search after hands-on"); v1 is **view-only**.

**Grilled first + two Fable5-advised pivots off Honza's literal request.**
- **Keys `C=+F5`/`C=+F6` → `C=+CTRL+F5`/`C=+CTRL+F7`.** `C=+F5/F6` needs `C=`-*without*-`CTRL`, but the
  71-byte CINV keyscan stub (`$03A0`, §10a/16-fix) is at its hard `.errorif` cap — no room for a second
  modifier branch — and `C=+F6` is physically `C=+SHIFT+F5`, whose `C=+SHIFT` flips the charset (fights
  §27 lowercase boot). Staying in the existing `C=+CTRL` chord family costs ~3 bytes and dodges both.
- **Capture mechanism: `$0326` CHROUT hook → server-side snapshot.** The KERNAL screen editor echoes
  typed characters and executes RETURN via `$E716` *directly*, bypassing the `($0326)` IBSOUT vector —
  so a CHROUT hook would miss every **typed command** scrolling off, which is exactly what Honza wants
  to recover. The server already DMA-reads `$0400` invisibly (that's `scr_save`), so capture moved
  entirely server-side: **near-zero new C64 code and it records typed input.** Honza chose
  boundary-snapshot fidelity (vs continuous polling) — "keep it simple for now".

**Server side (cloud/, no C64 risk; 354 tests green).**
- `sdk/scrollback.py` — `HistoryStore` (plain-ASCII `workspace/.config/.history`, one screen row/line,
  100 KB cap dropping oldest on a `\n` boundary), `total_pages`/`get_page` (page 1 = newest 25 lines,
  higher = older, oldest page top-padded), `render_page(lines)→(1000 B screencodes, 1000 B colour
  $0E)`, and `capture_screen(screen_bytes)` = **overlap-diff**: screencode→ASCII, drop trailing blank
  rows, find the longest suffix of history that equals a prefix of the new frame, append only the
  remainder (so an unchanged/repeated screen appends 0; a scroll-by-N appends N).
- `sdk/command_handler.py` — console-0 COMMAND sub-cmds `SERVER_CMD_SCROLLBACK_PREV=$04` /
  `_NEXT=$05`; a per-session `scrollback_page` cursor (0 = live saved screen, 1..N = history pages);
  PREV clamps at oldest, NEXT at 0 (repaints saved live screen), both DMA-paint via `send_screen_data`;
  RESTORE_SCREEN resets the cursor to 0. **Capture wired at two boundaries**, both best-effort
  (try/except, never block dispatch): the existing `SAVE_SCREEN` (reuses the screen it already read) and
  `handle_text_input` (DMA-reads `$0400` before dispatching, so the just-typed command line is recorded).

**C64 side (bank02 only; byte-tight `$9CB7` `console_switch` segment left BYTE-IDENTICAL).** New code
lives entirely in the roomy reclaimed `$9C41` pocket (~150 B free after `cvr_digits`), so nothing
downstream shifts:
- Table `cvr_digits` += `6, 3` (SFDX F5/F7) → RAM `$03F7/$03F8`; stub scan `ldx #$07→#$09`; `cs_install`
  copy `ldx #$06→#$08`; the CINV stub's `jsr console_switch` → **`jsr csw_guard`** (same 3-byte size).
- `csw_guard` (pocket): `cpx #$07 / bcs csw_scroll / jmp console_switch` — X=0..6 unchanged console
  path, X=7/8 (F5/F7) → scrollback. `console_switch` itself never touched.
- `csw_scroll` + `sb_modal` (pocket): `scr_save` (snapshots live screen + triggers the server
  SAVE_SCREEN capture), initial page cmd `= X-3` ($04/$05) via the existing **`scr_cmd0`** (console-0 +
  ack, reused verbatim), then `sb_modal` — a view-only `cs_modal`-style blocking loop (paced by
  `cs_vsync`, self-scanned via `$FF9F`): `C=+CTRL+F5`→PREV, `C=+CTRL+F7`→NEXT (one page per press via
  `cs_wait_release`, no flood), and **any key with no modifier held → exit** (`scr_restore` repaints the
  live screen; the "exactly one of C=/CTRL held" case is ignored so a half-formed chord can't be
  mistaken for the exit key). Server-unreachable at `scr_save` → abort untouched, stay local.

**Byte delta (isolated: committed-source rebuild vs this build).** 105 bytes, all in `$9B7D..$9C4D`
(stub counter + `jsr` operand, the `6,3` table bytes, `csw_guard`/`csw_scroll`/`sb_modal`, `cs_install`
counter). **Zero bytes changed at/after `console_switch` `$9CB7`** — verified; `cs_modal`/`scr_*`/all
other banks identical. `.errorif` pocket guards ($9C41, $9E80) all hold; cart size unchanged.

**HW test 2026-07-18 ✅** All works properly: `C=+CTRL+F5/F7` page through server-stored history,
any key returns to the live screen with the prompt intact, existing `C=+CTRL+1..7` console switch and
normal shell/BASIC unaffected. Docs added: `docs/user_manual/using-the-shell.md` (Scrollback section) +
`cloud-apps.md` cross-link. NOT committed (Honza's call).

**Deferred (Honza's call):** history `clear`/`search`, background-polling capture (catch >1-screen
bursts / pure-BASIC scroll the boundary snapshot misses), run-a-command-from-a-history-page, and
page-0/page-1 near-duplication polish on scrollback entry.
