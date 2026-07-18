# HONDANI Wedge — conversion log 2

Split off from `conversion_log.md` (which covers steps 0–10f) to keep the working
doc small. This log tracks the **bank1 per-line self-heal / launch-disarm** work —
the deferred, highest-risk debt item from `next_steps.md` §1.

## Goal (from next_steps.md §1)

> The CINV ($0314) console-switch keyboard hook is armed only by typing `HONDANI`
> and is lost after RUN/LOAD/TASS (must re-type `HONDANI`). The manual's intent is
> that *any* typed line re-arms it, and launch lines disarm it. This needs a small
> **bank1** change — bank1 is FROZEN with a nearly-full pocket, so it is the
> highest-risk remaining item and gets its own careful, hardware-tested steps.

## Ground truth (verified 2026-07-09)

- **IERROR ($0300) hook** — already self-heals per typed line via bank1
  `hondani_nomatch` @ `$9D8B` (step 8): re-copies the `$0340` stub, idempotently
  re-points `$0300`, shadow-copies the line to `$02A7`. This is the pattern to
  mirror.
- **CINV ($0314) hook** — installed ONLY by bank2 `cs_install` (71-byte stub →
  `$03A0`, saved vector → `$03EC/ED`, latch `$03EE`), called from the HONDANI
  keyword path (`hondani_net`). Not touched per line. → dies on RUN/LOAD/TASS.
- **Bank1 free space: ~8 bytes** at `$9E51-$9E58` (zero fill after the 23-byte
  `hd_stub` armed IERROR template at `$9E3A`). Main pocket `$9D74-$9E0F` is FULL.
  Any per-line CINV heal must fit that budget or reclaim bytes elsewhere.

## Cardinal rules (unchanged)

- Never write inside bank5 `$8023-$9EB9` (TMP payload).
- Every changed byte byte-diff-explainable vs stock `rr38p-tmp12reu.bin`.
- One small hardware-tested step at a time; test more often, not less.
- Restore banks with constants, never a `$de00` read-back (10b post-mortem).
- IRQ masked for the whole non-bank1 excursion; restore bank1 before `cli`.

---

## Design decisions (Honza, 2026-07-09)

1. **10f confirmed** on hardware — the bank2 CINV console-switch subsystem is the
   frozen foundation.
2. **Arm on any typed line** — re-install the CINV hook from the existing per-line
   tap (`hondani_nomatch` @ `$9D8B`), mirroring the IERROR self-heal. `HONDANI`
   stops being special for arming.
3. **Keep it live everywhere** — no explicit launch-disarm logic. (In tension with
   the observed wipe on RUN/LOAD/TASS — step D quantifies it before we design.)
4. **Diagnostic first** — measure the actual wipe on hardware before writing any
   bank1 byte.

## Address crib (decimal, for PEEK)

| Addr | Dec | Meaning | Armed value |
|---|---|---|---|
| `$0314/15` | 788 / 789 | CINV vector | `160 3` (→ `$03A0`) |
| `$03A0` | 928 | CINV stub 1st opcode (`lda $028d`) | `173` (`$AD`) |
| `$03EC/ED` | 1004 / 1005 | saved CINV vector (cs_install) | `49 234` (→ `$EA31`) |
| `$03EE` | 1006 | one-shot latch | `0` idle |
| `$0300/01` | 768 / 769 | IERROR vector (already self-heals) | `64 3` (→ `$0340`) |

KERNAL default CINV is `$EA31` = `49 234`; that's the "wiped" signature.

---

## Steps

### Step D — hardware diagnostic: what wipes $0314? (ZERO code change) 🔎

No build, no cartridge change. Honza records PEEKs at each moment on real
hardware and reports the numbers. Goal: learn (a) exactly which actions wipe
`$0314`, and (b) whether the 71-byte stub body at `$03A0` survives (PEEK 928) —
which decides *re-point-only* vs *full stub re-copy* for the bank1 heal.

Record `PRINT PEEK(788);PEEK(789);PEEK(928);PEEK(1004);PEEK(1005)` at:

1. **Cold boot, before HONDANI** — expect `49 234 …` (CINV = stock `$EA31`).
2. **After typing `HONDANI` once** — expect `160 3 173 49 234` (armed).
3. **After a garbage line** (`FOO`, gives HDN/dispatch) — still `160 3 …`?
4. **After `RUN`** a tiny program (`10 PRINT"HI"` then `RUN`) — wiped or not?
5. **After `LOAD`** (e.g. `LOAD"$",8`) — wiped or not?
6. **After launching `TASS` and exiting** — wiped or not? (watch PEEK 928 —
   did the stub body survive, or was the tape buffer scribbled?)

Report the 5 numbers for each of the 6 moments. Then we design the minimal,
space-fitting bank1 heal (only ~8 free bytes at `$9E51-$9E58`).

#### Step D results (Honza, hardware, 2026-07-09)

| # | Moment | 788 789 928 1004 1005 | reading |
|---|---|---|---|
| 1 | cold boot, pre-HONDANI | `49 234 0 0 0` | CINV stock `$EA31`, no stub |
| 2 | after `HONDANI` | `160 3 173 49 234` | **armed** (`$03A0`), saved vec `$EA31` |
| 3 | after `FOO` | `160 3 173 49 234` | unchanged |
| 4 | after `RUN` | `160 3 173 49 234` | **NOT wiped** |
| 5 | after `LOAD"$",8` | `160 3 173 49 234` | **NOT wiped** |
| 6 | after `TASS` + exit | `49 234 173 49 234` | **CINV wiped to `$EA31`; stub body + saved vec SURVIVE** |

**Conclusions — the task is much smaller than billed:**

1. **Only `TASS` (launching another cart/app) wipes `$0314`.** `RUN` and `LOAD`
   do **not** — console switching already survives them. The `next_steps.md`
   "lost after RUN/LOAD/TASS" claim was pessimistic; measured truth is TASS-only.
2. **The wipe resets only the VECTOR** (`$0314`→`$EA31`). The 71-byte stub body at
   `$03A0` **survives** (PEEK 928 = `173`), and the saved-vector `$03EC/ED`
   survives too (`49 234` = the correct KERNAL default to chain to).
3. So the heal is a **pure vector re-point**: force `$0314/15 = $A0/$03`. No stub
   re-copy, no vector re-capture needed. Minimal body = 8 bytes
   (`sta $0315` reusing A=`$03` from the IERROR install / `lda #$a0` / `sta $0314`).
4. **"Keep it live everywhere" is already true** except across a TASS. The fix
   closes exactly that one gap.

**Space reality (measured, 10f build):** bank1 pocket = **5** free bytes (below
`$9E10`), bank1 gap = **8** free (`$9E51-$9E58`), **bank2 = 1** free (full — so the
heal MUST be bank1). The two bank1 free regions are non-contiguous (RR code +
`hd_stub` between them). A called gap-helper needs 9 bytes (8 body + `rts`) — 1
over the gap; an inline pocket re-point needs 8 net — 3 over the pocket. **Either
way we are ~1–3 bytes short and must reclaim a little.**

### Step D2 — one more zero-risk PEEK: does the IERROR stub at $0340 survive TASS?

If `$0340` survives TASS like `$03A0` did, the per-line `hd_stubcopy` re-copy is
**redundant** and can be dropped — freeing ~10 pocket bytes, turning the CINV
re-point into a comfortable, clean fit (and actually simplifying bank1). If it
does NOT survive, we keep `hd_stubcopy` and do a tight, careful byte-reclaim.

After the `TASS`+exit of step D, before typing anything else, run:

```
PRINT PEEK(832);PEEK(833);PEEK(834)
```

Expect the armed stub's first bytes `120 169 16` (`$78 $A9 $10` =
`sei / lda #$10`) if it survived. (My first draft said `108 231 3` — that was the
stale step-8 inert stub; step 9a replaced it with the armed one.)

#### Step D2 result (Honza, hardware): `120 169 16` → **$0340 stub SURVIVED TASS.**

So **both** tape-buffer stubs (`$0340` IERROR, `$03A0` CINV) persist across TASS;
only the page-3 **vectors** are reset. The per-line `hd_stubcopy` re-copy is, for
the TASS case, redundant — though it still guards against non-TASS scribblers
(tape ops, some fastloaders), which we did NOT test, so removing it trades away
belt-and-suspenders robustness.

### Design pivot (Honza, 2026-07-10): manual re-arm is acceptable

Honza: "work most of the time automatically; if an app kills the vectors, just
run a short command to re-install — like typing `HONDANI` did. A 3-letter `HDN`
would be nice. Keep the cartridge change minimal."

Key facts that bear on this:

- **Bare `HONDANI` ALREADY re-arms the hook today** (step 10a: `cs_install` runs at
  the top of `hondani_net`, server up or down). So a manual re-arm command already
  exists — it's `HONDANI` — at the cost of an empty network round-trip (slow / red
  border if the server is down).
- The **automatic per-line re-point** (add ~8 bytes to the existing tap to force
  `$0314/15=$A0/$03` every typed line) would re-arm on ANY line at the READY
  prompt — so after a TASS your very next keystroke-line re-arms it, and a manual
  command would essentially never be needed. It touches OUR step-8 tap (not stock
  RR), byte-diff-verified as always, but needs a ~3-byte reclaim in the full pocket.
- A dedicated local-only `HDN` (instant, no network) needs a NEW keyword matcher;
  bank1 pocket (5 B) is tight and bank2 is full (1 B) — realistically a bank3-era
  addition (step 11+), not cheap today.

### The guard landmine (why auto-heal is bigger than it looks)

Moment-1 PEEK showed `$03A0 = 0` (BRK) at cold boot — the CINV stub only exists
**after** the first `HONDANI`/`cs_install`. So an **unguarded** per-line re-point
`$0314→$03A0` would, on the very first line after a cold boot (before any
HONDANI), aim the keyboard IRQ at `$03A0 = $00` → BRK → warm-start/reset. Broken.

Therefore the re-point **must be guarded**: re-arm only when the stub is installed.
Cheapest safe guard = test the armed-flag `$03ED` (measured: `0` pre-HONDANI,
`$EA` after, and **survives TASS**), preserving `A=$03` by loading into Y
(`ldy $03ed`) so the two stores can reuse `A=$03`.

### Byte budget (measured, exact) — auto-heal is 1 byte over a clean fit

Free bank1: **pocket 5 B**, **gap 8 B** (`$9E51-$9E58`), non-contiguous; bank2 = 1 B.

Best arrangement (guard in pocket, stores in gap via `jsr`, reuse `A=$03`, plus a
shadow-loop restructure that reclaims 4 B by dropping the `$02FF` bound):

```
; pocket @ hd_installed (A=$03, Y free):
    ldy $03ed            ; 3   armed? (survives TASS; 0 pre-HONDANI)
    beq  cinv_skip       ; 2   not armed -> don't aim IRQ at $03A0=BRK
    jsr  cinv_arm        ; 3   (A=$03 preserved into helper)
cinv_skip:
    ldy #$ff             ; 2  \
hd_shadow:               ;     | restructured copy-until-null (was 14 B, now 10 B)
    iny                  ; 1   | -> reclaims 4 B; drops the $02FF safety bound
    lda ($7a),y          ; 2   |
    sta $02a7,y          ; 3   |
    bne hd_shadow        ; 2  /
; gap @ $9E51:
cinv_arm:
    sta $0315            ; 3   CINV hi = $03 (reuse A)
    lda #$a0             ; 2
    sta $0314            ; 3   CINV lo = $A0
    rts                  ; 1   -> helper = 9 B, but gap is 8 B  ❌ ONE BYTE OVER
```

Pocket side fits (net +4 vs 5 free). The **gap helper is 9 B and the gap is 8 B**.
Inline-in-pocket is worse (4 over). The remaining reclaim sources are **off-limits**:

- **IERROR idempotency check must stay** — step 8 relies on the per-line re-save of
  `$0300→$03E7` to chain correctly through MERGE's `$0300` trampoline. Weakening it
  to a low-byte-only test is the only ≥1 B shave available, and it's a real
  behavior change to the frozen tap.
- **Dropping the per-line `hd_stubcopy` frees nothing** — the copy code must remain
  to *establish* the `$0340` stub in the first place; gating it to run once keeps
  the same ~11 B of code.

## DECISION (Honza, 2026-07-10): DEFER auto-heal to the bank3 era

- **No bank1 change now.** Bank1 stays byte-identical to the 10f image. The
  "highest-risk item" is not worth a 1-byte shave of MERGE-sensitive tap logic.
- **Manual re-arm today = `HONDANI`** (already installs the hook via `cs_install`,
  server up or down). Documented for the user; costs one empty network round-trip.
- **Automatic heal + a short local-only `HDN`** move to **step 11+** (see
  `next_steps.md`), where bank3 provides room to do both cleanly: a bank3 helper
  can carry the guarded re-point (and a proper local-only re-arm command) without
  fighting the full bank1 pocket. Everything needed to implement it is captured
  above (guard on `$03ED`, reuse `A=$03`, the exact stores, the shadow reclaim).

**Net outcome of this log: a hardware-characterized problem + a locked design,
zero cartridge risk taken.** conversion_log2.md is complete for now; the build is
unchanged (still the 10f image).
