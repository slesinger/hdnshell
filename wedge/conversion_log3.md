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

Baseline result (Honza, hardware, 2026-07-10): **9 of 10 pass; one regression found.**

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
