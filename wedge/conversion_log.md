# HONDANI Wedge — Conversion Log (restart, small steps)

Restarted 2026-07-08 after the previous attempt corrupted stock cartridge
functionality. New discipline: every step is a minimal, byte-diff-verified
change, hardware-tested by Honza before the next step begins.

Goal: a `HONDANI` command in the Retro Replay BASIC wedge (bank01 scanner)
whose handler lives in free space in **bank5** and does `inc $d020`.
Stock functionality must remain fully intact.

## Plan

| Step | Change | Hardware test expectation | Status |
|---|---|---|---|
| 0 | Verify sources rebuild byte-identical to stock `rr38p-tmp12reu.bin` | — (local check only) | ✅ done 2026-07-08 |
| 1 | Inert `inc $d020 / rts` routine at bank5 `$9F58`, **no hook** | Cart behaves 100% stock: BASIC toolkit commands, freeze menu, monitor, TMP, fast load all normal; `HONDANI` gives `?SYNTAX ERROR` | ✅ HW tested OK 2026-07-08 |
| 2 | Bank01 scanner hook recognizing `HONDANI`, handler still bank01-local (`inc $d020` in bank01 free space) | `HONDANI` flashes border; all stock commands (esp. `HELP`-adjacent 3-letter-prefix quirk, `OLD`, `FIND`, `MONITOR`, `/`, `$`) still work | 🔶 built, awaiting hardware test |
| 3 | Cross-bank `xb_stub` at `$CF00` RAM: bank01 handler → stub → bank5 `$9F58` → restore bank01 | Same as step 2, but routine provably runs from bank5 | ⬜ |

## Step 0 — clean baseline (2026-07-08)

- `./build.sh` output `build/rr38p-tmp12reu.rebuilt.bin` compared with `cmp`
  against stock `rr38p-tmp12reu.bin`: **byte-identical**. Clean starting point.

## Step 1 — inert bank5 routine (2026-07-08)

### Placement decision — why NOT `$9012` this time

The previous attempt put the bank5 routine at `$9012`. The bank05 source
comments state the region **`$8023-$9EB9` is a payload image** (first pages of
TMP+REU plus the FLASH UTIL V3.8P module) that the **bank04 installer copies
into C64 RAM** — "data at this window address, not runnable here". The
zero-filled run `$9012-$91FF` is *inside* that payload, so bytes written there
get copied into RAM by the TMP/flash installers. That is a plausible cause of
the earlier corruption.

Chosen instead: **`$9F58`**, start of the zero run `$9F58-$9FFF` (168 bytes).
This is *outside* the payload, after the real cross-bank glue code at
`$9F01-$9F57` (`bank05_sub_9F01`/`bank05_sub_9F2B`). Nothing in bank05 (or the
bank05 notes) references `$9F58+`. Also stayed well clear of `$9FFA-$9FFF`
(would be the CPU vectors if the bank were ever mapped in ultimax mode).

### Change

`rr38p-tmp12reu.bank05.asm`: first 4 bytes of the `bank05_data_9F58` zero fill
replaced by:

```
hondani_bank5:            ; ROM $9F58 (bank5 window)
    inc $d020             ; EE 20 D0
    rts                   ; 60
```

Remaining fill shortened to compensate; `.errorif` guards assert no shift.
**No hook exists anywhere** — no code path can reach this routine yet.

### Verification

- Full-image diff vs stock: **exactly 4 bytes** differ, all in bank 5 at file
  offsets `$BF58-$BF5B` (window `$9F58-$9F5B`): `00→EE 20 D0 60`. All other
  banks byte-identical.
- Deployed: `wedge/hdn-rr38p-tmp12reu.crt` + `wedge/rr38p-tmp12reu.crt`
  (identical copies, per build.sh anti-stale-copy rule).

### Hardware test checklist (Honza)

Everything must behave exactly stock:

1. Cold boot to CyberPunX BASIC screen.
2. A few wedge commands: `$` (directory), `FIND`, `AUTO`, `OLD`, `MONITOR`
   (and exit), `OFF` / `ON`.
3. Freeze button → menu → resume.
4. `HONDANI` → must give `?SYNTAX ERROR` (no hook yet).
5. Optional: start TMP (`TASS`) and exit — its installer copies the bank05
   payload; must be unaffected since we didn't touch the payload.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).**

## Step 2 — bank01 scanner hook + bank01-local HONDANI (2026-07-08)

### How the hook integrates

The stock scanner entry (`bank01_sub_83E9`) ends with, at `$83FC`:
`jsr $0073` (CHRGET) / `tax` / `bne $8407` / `stx $0258` / `beq $83D0`.
The 3-byte pair `tax` + `bne $8407` at `$83FF-$8401` is replaced by the
same-size `jmp $9D74` (`4C 74 9D`). Nothing shifts; `.errorif` guards the site.

New code lives in the zero-filled pocket **`$9D74-$9E0F`** (156 bytes, between
two real code blocks in the live wedge bank; verified all-zero in stock, no
references into it).

### `hondani_check` at `$9D74` — state contract

The stock scanner at `$8407` depends on: A = X = current char, **carry from
CHRGET** (`bcs $8457` splits keyword path from numbered-line path), Y = TXTPTR
hi. The checker preserves all of it:

- `tax` first (replicating the removed instruction). A=0 → `jmp $8402` back to
  the stock empty-line path (Z flag still set for the `beq` there).
- Non-zero: `php` + `tya`/`pha`, then compare `($7A),y` for y=0.. against
  zero-terminated PETSCII `"HONDANI"` at `$9DB5`.
- **No match:** `pla`/`tay`, `plp`, `txa`, `jmp $8407` — the stock scanner
  receives byte-identical state to before the patch.
- **Match** additionally requires the char after the word to be non-alphabetic
  (`cmp #$41 / bcs` — the same test stock's swallow-quirk uses), so
  `HONDANIX` falls through to the stock scanner and errors as usual.

### Matched path mimics stock `$848D` exactly

Advance TXTPTR lo onto the last word char (`tya/clc/adc $7A/sta $7A`, stock's
own no-hi-carry quirk included), `jsr $83A9` (stock pre-handler housekeeping —
the `lda #$08` bit-skip entry of `bank01_sub_83A6`), `ldy #0 / sty $B9`, push
`$E3 $7A` so the handler's `rts` continues at `$E37B` (BASIC READY loop, same
continuation every stock wedge command uses), `jsr $0073` to consume the char
after the word — then the action: `inc $d020` / `rts`. Still bank01-local;
step 3 will swap only the action for the cross-bank call to bank5 `$9F58`.

### Verification

- Full-image diff vs stock: **76 bytes**, all expected:
  - bank1 `$83FF-$8401`: `AA D0 05` → `4C 74 9D` (the hook).
  - bank1 `$9D74-$9DBC`: checker + handler + `"HONDANI",0` word (pocket
    tail `$9DBD-$9E0F` still zero).
  - bank5 `$9F58-$9F5B`: step-1 routine (unchanged).
- Hand-decoded the assembled pocket bytes: `jmp $8402`, `jmp $8407`,
  `lda $9DB5,y`, `jsr $83a9`, push `$E3/$7A`, `jsr $0073` all correct.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

1. `HONDANI` → border color increments once, then `READY.`
2. `HONDANI` repeated → border steps through colors.
3. `HONDANIX` → `?SYNTAX ERROR`; `HONDANI 5` / `HONDANI:REM` → executes, rest
   of line ignored (same as stock wedge commands).
4. Stock commands still fine: `$`, `FIND`, `AUTO`, `OLD`, `MONITOR` + exit,
   `OFF`/`ON`, `TASM` still launches TASS (3-letter quirk intact).
5. Numbered-line entry still works: type `10 PRINT"X"` / `LIST` / `RUN`
   (exercises the preserved CHRGET carry path).
6. Empty line (just RETURN) at the `READY.` prompt → no glitch (zero path).
7. Freeze → menu → resume.

**Result: _pending_**
