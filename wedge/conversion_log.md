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
| 2 | Bank01 scanner hook recognizing `HONDANI`, handler still bank01-local (`inc $d020` in bank01 free space) | `HONDANI` flashes border; all stock commands (esp. `HELP`-adjacent 3-letter-prefix quirk, `OLD`, `FIND`, `MONITOR`, `/`, `$`) still work | ✅ HW tested OK 2026-07-08 |
| 3 | Cross-bank call bank01 → bank5 `$9F58` via the stock `$DEDE` gate (hand-rolled frame; **no** `$CF00` RAM stub needed); bank5 routine now `dec $d020` | `HONDANI` steps border **backward** (proves bank5 code ran); all stock commands still work | ✅ HW tested OK 2026-07-08 |
| 4 | UCI reachability micro-test: read UCI ident register `$DF1D` (expect `$C9`) from the banked-in bank5 context; border green/red verdict, raw byte parked at `$CF20` | `HONDANI` → green border and `PEEK($CF20)`=201 ⇒ UCI visible while RR banked in; red ⇒ it is not | ✅ HW tested OK 2026-07-08: **green**, `PEEK($CF20)`=201, `PEEK($DF1D)`=201 |
| 5a | Move wedge code to its permanent home: bank2 `$991E` (1378-byte free run); relocate the step-4 probe there unchanged, revert bank5 to stock | Same as step 4 (`HONDANI` → green, `PEEK($CF20)`=201) but running from bank2; freezer backup/save must still work (bank2 = freezer tools bank) | ✅ HW tested OK 2026-07-08 (incl. freezer) |
| 5b | Full cloud round-trip in bank2: connect `192.168.1.2:6464`, send `TEXT_INPUT` "PING", CHROUT reply, close, green/red border | `HONDANI` prints server reply then green border (server must be running) | ✅ HW tested OK 2026-07-08 (reply `?ERROR` printed, green; repeats + freeze/monitor fine; server-down → red; **bug found**: freeze on first call after server came back — fixed in 5c) |
| 5c | UCI-state hardening: connect-fail path accepts/drains the transaction; all wait loops bounded ~1 s with `$0E` (ACC\|ABORT\|CLR_ERR) recovery kick — no code path can hang the machine | Server-down → red; **then server up → next `HONDANI` works without reset** (the 5b freeze case); everything else as 5b | ✅ HW tested OK 2026-07-08 |
| 6 | `HONDANI <text>`: send the typed rest-of-line (raw, pre-crunch, via TXTPTR) as the TEXT_INPUT payload instead of hardcoded "PING" | `HONDANI HELP` prints the server help text; `HONDANI STATUS`, `HONDANI : 2+2` work; bare `HONDANI` still round-trips; stock sweep | ✅ HW tested OK 2026-07-08 |
| 7 | Print CR before the reply; read-loop until EOF **or a quiet gap after data** so replies longer than one `$E8` chunk print fully (server holds the connection open — EOF alone never comes) | `HONDANI HELP` prints the *full* multi-line help; `HONDANI I: <question>` prints a long AI answer | ✅ HW tested OK 2026-07-09 |
| 8 | **Inert** line tap: shadow-copy each raw typed line to `$02A7`, install pass-through IERROR stub at `$0340` (only `jmp` to saved vector). Zero behavior change | Everything 100% stock incl. error messages (`FOO` → `?SYNTAX ERROR`), **first line after cold boot**, RUN/STOP+RESTORE then typing, freeze → resume, TASS | ✅ HW tested OK 2026-07-09 |
| 9a | **Arm the stub, no network** (split from 9). Final RAM-stub form: on a direct-mode syntax error (X=$0B, `$3A`=$FF) bank in bank2, call `hondani_err`, bank back; C=0 → print `HDN` marker + re-enter BASIC (IMAIN); any other error → C=1 → fall through to stock. Bank1 frozen after this test. | `FOO` → prints `HDN` then `READY.` (no `?SYNTAX ERROR`); `PRINT 1/0` → `?DIVISION BY ZERO`; `10 FOO`+`RUN` → `?SYNTAX ERROR IN 10`; **first line after cold boot** ok; freeze→resume; `HONDANI HELP` still round-trips; full stock sweep | 🔶 built, awaiting hardware test |
| 9b | Replace the 9a marker in `hondani_err` (bank2 only) with the real dispatch: send the `$02A7` shadow line to the server, print the reply, C=0; server unreachable → C=1 (stock `?SYNTAX ERROR`). No border change (per decision). | `HELLO WORLD` → AI reply then `READY.`; `PRINT 1/0` → stock error; `10 FOO`+`RUN` → stock error; server down → stock `?SYNTAX ERROR` after ≤ ~5 s | ✅ HW tested OK (Honza) |
| 10a | **Console-switch key hook — detect only, no network** (bank2 only, bank1 FROZEN). Typing `HONDANI` installs a CINV (`$0314`) RAM stub at `$03A0`; on each IRQ it checks `SHFLAG` for C=+CTRL and `SFDX` for keys 1..7 and, one-shot per press, writes the digit (1..7) to the border `$D020`, then chains to the original IRQ. No console switch, no packets, no bank switch. | After `HONDANI`: `C=+CTRL+1..7` sets the border to that digit's colour (1=white … 7=yellow); release/other keys leave it; **all stock behaviour + HONDANI/auto-dispatch/freeze/`TASS` still 100% as before** (the persistent IRQ hook must not disturb anything) | ✅ HW tested OK (Honza, 2026-07-09) |
| 10b | **Cross-bank call from the IRQ stub** (bank2 only, bank1 FROZEN). The CINV stub's match path now saves the RR bank bits (`$DE00 & $98`), pages in bank2 (`$10`), `jsr`s a new bank2 `console_switch`, restores the bank, and chains. `console_switch` does the *same* visible thing as 10a (border = digit) but from **bank2 code reached across the IRQ bank switch** — isolating that mechanism before 10c hangs the real switch on it. | Identical to 10a from the user's seat — `C=+CTRL+1..7` sets the border to that digit's colour, machine stays alive, all stock behaviour intact. A hang/crash/wrong colour = the IRQ bank switch is unsound (stop, report). Press at the `READY.` prompt. | 🔶 built, awaiting hardware test |

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

**Result: ✅ hardware tested OK (Honza, 2026-07-08).**

## Step 3 — cross-bank call to bank5 via the stock $DEDE gate (2026-07-08)

### Design change: no `$CF00` RAM stub

The plan originally called for a custom RAM stub. Studying the stock
cross-bank mechanism made it unnecessary — and revealed why a naive reuse
would have failed:

- Every bank's `$9E00-$9EFF` page is mirrored into I/O2 at `$DE00-$DEFF`.
  All stock bank switching runs through this mirror: the `$DEDE` gate
  (`sta $de00 / pla / rti`) and the `$DEE3` restore
  (`nop / sta $9e / pla / sta $de00 / lda $9e / rts`).
- **Byte-compare confirmed `$9EDE-$9EEC` is identical in bank1 and bank5**,
  so instruction flow across the two mid-page bank flips is seamless.
  (The analysis doc's claim that the whole trampoline page is identical in
  all banks is wrong — but the gate/restore window is.)
- **The stock bank01 stub (`$9F4E+`) cannot reach bank5.** Its `$DEEE`
  bank-value table is `00 08 10 18 20 0a 23 80` = banks 0-4 plus special
  modes (`$0A` cart-off, `$20` RAM). `jsr $9F53` would have selected
  *cart off*, not bank5. Banks 5-7 are never *called* by stock code, only
  window-read (TMP payload) — the analysis doc's "$9F51..$9F55 select
  banks 3..7" is also wrong.

So the handler hand-rolls the exact frame the stock stub builds, with the
bank5 value `$88` (bits 3+7, same value the TMP installer writes) loaded
directly instead of from the table:

```
push $08          ; $DEE3's restore value = bank01
push $DE, $E2     ; bank5 routine's rts -> $DEE3
push $9F, $58     ; rti target = hondani_bank5
php, pha          ; flags + A for the gate's rti/pla
lda #$88          ; bank5
jmp $dede         ; sta $de00 / pla / rti
```

Return path: bank5 `rts` → `$DEE3` restores bank01 → its `rts` pops the
`$E3/$7A` continuation already pushed by the handler → `$E37B` READY loop.
No zero-page or RAM is touched beyond `$9E` (clobbered by `$DEE3`, exactly
as every stock cross-bank call clobbers it). IRQ exposure while bank5 is
mapped is identical to any stock cross-bank call (stock doesn't `sei`
either from bank01).

### Change

- `rr38p-tmp12reu.bank01.asm`: HONDANI action `inc $d020 / rts` replaced by
  the 22-byte frame+gate sequence above (pocket still ends well before
  `$9E10`, guards intact).
- `rr38p-tmp12reu.bank05.asm`: `hondani_bank5` changed `inc $d020` →
  **`dec $d020`** so the hardware test distinguishes bank5 execution
  (border steps *backward*) from any stale step-2 behavior (forward).

### Verification

- Full-image diff vs stock: **94 bytes**, all expected:
  - bank1 `$83FF-$8401`: hook (unchanged from tested step 2).
  - bank1 `$9D74-$9DCD`: checker (byte-identical logic to step 2) + new
    action + `"HONDANI",0` word now at `$9DC7` (pocket tail to `$9E0F`
    still zero).
  - bank5 `$9F58-$9F5B`: `ce 20 d0 60` (`dec $d020 / rts`).
- Hand-decoded every changed byte; frame push order verified against the
  stock stub disassembly (pull order at `$DEDE`: pla=A, rti=flags,PC-lo,hi;
  at bank5-rts: `$DEE2+1`; at `$DEE3`: pla=bank value).
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

1. `HONDANI` → border color steps **backward** (e.g. light blue → blue on
   stock boot colors), then `READY.` — backward = bank5 code ran and
   returned. Forward would mean stale image; crash/hang = broken return
   path.
2. `HONDANI` several times → keeps stepping backward, machine stays alive.
3. After `HONDANI`: type `10 PRINT"A"` / `LIST` / `RUN`, then a stock wedge
   command (`$`, `FIND`) — BASIC and wedge fully functional after the
   cross-bank round trip.
4. `HONDANIX` → `?SYNTAX ERROR`; empty RETURN → no glitch.
5. Stock sweep: `OLD`, `MONITOR` + exit, `OFF`/`ON`, `TASM` (TASS launches
   — its installer does cross-bank work near our gate usage).
6. Freeze → menu → resume.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).** Honza additionally ran
`PRINT PEEK($DF1C)` from BASIC direct mode → `0`. That is the plausible
*idle* value of the UCI status register (all state/flag bits clear), read
with the RR cart active in its normal BASIC-mode banking — encouraging, but
not conclusive (an unmapped register could also happen to read 0). The
conclusive probe is the ident register, which is exactly step 4.

## Step 4 — UCI reachability probe from the banked-in context (2026-07-08)

### What it answers

The open question from the design notes: is the Ultimate Command Interface
at `$DF1C-$DF1F` usable while this RR image is banked in? The RR's own
registers sit in IO1 (`$DE00` control + the `$9E00`-page mirror at
`$DE00-$DEFF`); IO2 `$DF00-$DFFF` carries the emulated REU registers
(`$DF00-$DF0A`) on this "tmp12reu" setup, and on the Ultimate the UCI is
deliberately placed at `$DF1C-$DF1F` to coexist with the REU. Whether the
RR core's IO2 claim shadows it is exactly what this step measures — from
the same banked-in bank5 context the step-5 protocol code will run in.

### Change

Only bank5 (`hondani_bank5` at `$9F58`, now 18 bytes; bank1 is
**byte-identical to the step-3 image already hardware-tested**):

```
lda $df1d     ; UCI ident register -- reads $C9 if UCI present
sta $cf20     ; park raw value for PEEK inspection ($CF20-$CF22 = scratch)
ldx #$05      ; green
cmp #$c9
beq sig
ldx #$02      ; red
sig: stx $d020
rts
```

Pure read, no UCI side effects (`$DF1D` read is the ID byte; the FIFO-
popping register is `$DF1E`, deliberately not touched). `$CF20` is plain
RAM above the TMP image top (`$CEFF`), same scratch page the old attempt
used. X clobber is fine — the return lands in the `$E37B` READY loop,
which doesn't care about registers (same as every stock handler).

### Verification

- Full-image diff vs stock: **108 bytes**; bank1 ranges bit-for-bit equal
  to the tested step-3 build; bank5 `$9F58-$9F69` hand-decoded correct.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

1. `HONDANI` → border turns **green** or **red** (either is a pass for the
   *test* — it answers the question; green means step 5 can proceed as
   planned, red means we need the cart-off-during-UCI variant).
2. `PRINT PEEK($CF20)` → `201` expected with green (the `$C9` ident byte
   as read from the banked-in context).
3. For comparison from direct mode: `PRINT PEEK($DF1D)` → also expect 201.
4. Quick stock sanity: `$`, `FIND`, `HONDANIX` → `?SYNTAX ERROR`,
   freeze → resume.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).** Border **green**;
`PRINT PEEK($CF20)` → 201 and `PRINT PEEK($DF1D)` → 201. The UCI is fully
visible at `$DF1C-$DF1F` while the RR image is banked in — the RR core
does not shadow it. Step 5 can talk to the network from ROM context
directly, no cart-off window needed.

## Step 5a — move to the permanent home: bank2 $991E (2026-07-08)

### Why move, and why bank2

The full protocol code needs ~300-500 bytes now and much more later; the
bank5 pocket has only 168. A full-image survey of filler runs plus a
reference audit found **bank2 `$991E-$9E7F`: 1378 contiguous zero bytes**
with *no* reference from anywhere:

- No absolute reads with operands ≥ `$9900` anywhere in banks 2 or 3
  (checked for copy loops / table reads).
- No cross-bank inline call targets into `$99xx-$9Exx` from any bank.
- The bank04 TMP installer reads only window `$8100-$9DFF` of banks 5-7.
- The run sits after bank2's last drive-code blob (`b02_9911` ends `$991D`)
  and before real data at `$9E80+`.
- (The `jmp $99b5` inside bank2 is *relocated payload* — drive-side code
  whose operands are runtime addresses, not window addresses.)

Also surveyed: bank3 `$998B-$9E9C` (1298B, similarly clean — reserve),
bank4 `$9C00-$9E9C` (669B), banks 5/6/7 `$9F58-$9FFF` (168B each).

**Corruption cause of the old attempts now confirmed:** byte-diffs of all
three broken trees (`wedge_2pokus`, `wedge_3pokus`, `wedge-latest-not-
working`) show every one of them wrote its shell module into bank5
`$8023-$91xx` — inside the TMP payload image the bank04 installer copies
to RAM. They overwrote TMP itself. Bank2 `$991E+` shares none of that.

### Change

- `hondani_net` at bank2 `$991E` = the step-4 UCI ident probe, byte-for-
  byte identical logic (18 bytes). Zero new behavior — this step tests
  *placement only*.
- bank5 reverted to stock (whole bank byte-identical again).
- bank01 frame retargeted: push `$99/$1E`, bank value `$88` → `$10`
  (bank2, same value stock's `$DEEE` table uses). Checker/handler logic
  otherwise untouched.

### Verification

- Full-image diff vs stock: **108 bytes** — bank1 hook + pocket (only 3
  frame bytes changed vs the tested step-4 build), bank2 `$991E-$992F`
  (18 bytes, hand-checked = step-4 probe), bank5 clean.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

1. `HONDANI` → **green** border, `PRINT PEEK($CF20)` → 201 (same as step 4,
   now from bank2).
2. **Freezer exercise matters this time** (bank2 = freezer tools bank):
   freeze → try a BACKUP/save-to-disk action if convenient, or at least
   enter/leave several freezer menus → resume. Must be fully stock.
3. Quick stock sanity: `$`, `FIND`, `OLD`, `MONITOR`+exit, `HONDANIX` →
   `?SYNTAX ERROR`, numbered line entry + `RUN`.
4. TMP: launch `TASS` and exit — bank5 is stock again, TMP must be perfect.

**Result: _pending_**

## Step 5b design notes (researched 2026-07-08, build blocked on 5a HW test)

Sources verified: `src-discontinued/c64u_common.asm` (UCI registers, status
bits, accept/drain discipline), `c64u_network.asm` (command sequences),
`docs/inspiration/ultimate_lib.c` (authoritative SOCKET_READ semantics),
`cloud/sdk/command_handler.py` (wire format).

- **Wire request** = raw socket payload `$FE` (magic), `$02` (TEXT_INPUT,
  console 0), then data bytes (`"PING"` as PETSCII `$50 $49 $4E $47`).
  **Wire response** = raw PETSCII bytes, no header/terminator → CHROUT
  directly.
- **UCI commands** (all target `$03` network): connect=`$07` + port LE
  (`$40 $19` = 6464) + `"192.168.1.2",0`; write=`$11` + socket id + payload;
  read=`$10` + socket id + chunk len (`$E8 $00`); close=`$09` + socket id.
  Push = `$DF1C |= $01`, error bit `$08` (clear via write `$08`), busy =
  state bits `$30` == `$10`, drain data (`$80`→`$DF1E`) + status (`$40`→
  `$DF1F`), accept = `$DF1C |= $02` then wait bit clear. Success = status
  begins `"00"`.
- **SOCKET_READ response data** = 2-byte LE length prefix, then payload.
  `$FFFF` = nothing yet (retry, ~256×), `$0000` = EOF.
- **`sei` for the whole round trip** (the old working PING did the same):
  a jiffy IRQ *will* fire during a multi-ms network exchange, and if any
  RR hook expects bank1 in the window it would crash — don't find out.
  CHROUT is polled, works fine with I=1.
- **No zero page.** Scratch: `$CF21` socket id, `$CF22/23` read length,
  `$CF24` retry counter, `$CF25` got-data flag, `$CF30-$CF33` first status
  bytes (PEEKable breadcrumbs on red border). `$CF20` stays the ident byte.
- Estimated ~360 bytes at bank2 `$991E` (run holds 1378) — replaces the 5a
  probe, keeps `hondani_net` entry at `$991E` so bank01 is untouched.
- Known accepted simplification: on a connect that returns a socket id but
  bad status, we don't close the id (no socket exists on refused connect;
  revisit for the real fallback).

## Step 5b — full cloud round-trip (2026-07-08)

Implemented exactly per the design notes above. `hondani_net` at bank2
`$991E` (now `$991E-$9AC1`, 420 bytes incl. data; pocket guard at `$9B0E`,
run holds 1378) replaces the 5a probe. **bank1 untouched** — same entry
`$991E`, same gate frame.

Flow: `sei` → UCI ident check → TCP connect (`$07`, port `$1940` LE,
`"192.168.1.2",0`) → socket id from data queue → write (`$11`, id,
`$FE $02 "PING"`) → read loop (`$10`, id, chunk `$00E8`; 2-byte LE length
prefix: `$FFFF` → retry up to 256×, `$0000` → EOF) → CHROUT the reply
bytes → close (`$09`, id) → border green; any failure → close if a socket
exists → border red → `cli` / `rts` → READY.

Every UCI transaction goes through shared helpers: `hn_hdr` (wait idle,
send target+cmd), `hn_push` (push, state-error check + CLR_ERR, wait
not-busy), `hn_wdav` (DATA_AV with ~64K-poll timeout), `hn_fin` (drain
data queue, capture first 4 status bytes to `$CF30+`, DATA_ACC handshake,
success = status begins `"00"`).

### Verification

- Full-image diff vs stock: **500 bytes** — bank1 ranges bit-identical to
  the hardware-tested 5a build; bank2 `$991E-$9AC1` only.
- Whole routine machine-disassembled from the rebuilt binary and audited
  end-to-end: all branch targets, both fail trampolines (connect-phase →
  no close; post-connect → close first), the `$2C` skip, data tables, and
  the register discipline against `c64u_common.asm` semantics.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

Server side first: HDN cloud server running and reachable at
`192.168.1.2:6464` (same box/port as the old shell tests).

1. `HONDANI` → server reply prints on screen, border **green**, `READY.`
   (machine frozen ~a second is normal — IRQs are off during the exchange).
2. Repeat `HONDANI` a few times — must work repeatedly (socket close
   verified server-side if you can check logs).
3. **Server down test**: stop the server, `HONDANI` → border **red** after
   the retry window (up to ~10 s), machine alive, `READY.` returns. Then
   `PRINT PEEK($CF30)` and `PEEK($CF31)` — tell me the values (status
   breadcrumbs; 48 = '0').
4. Stock sanity: `$`, `FIND`, `MONITOR`+exit, numbered line + `RUN`,
   freeze → resume, `TASS` launch/exit.
5. If red with server up: report `PEEK($CF30)`, `PEEK($CF31)`,
   `PEEK($CF21)` (socket id), `PEEK($CF20)` (ident, expect 201).

**Result: ✅ hardware tested OK (Honza, 2026-07-08).** Reply `?ERROR`
printed + green border (the server's dispatcher doesn't know the command
"PING" — the round trip itself is proven; a friendlier server-side reply
is a server-repo task, not a wedge task). Repeats fine, including freeze/
monitor in between. Server down → red border, machine alive.
**One bug**: with the server back up after a red-border attempt, the next
`HONDANI` froze the machine; after reset everything worked again. Root
cause + fix = step 5c.

## Step 5c — UCI-state hardening (2026-07-08)

### The 5b freeze, root-caused

Connect to a dead server: the UCI completes the `$07` command with an
error *status* but no response *data* (no socket id), so `hn_wdav` timed
out and the connect-phase failure path jumped to the red border **without
draining/accepting the transaction**. The UCI stayed in a data state
(state bits ≠ 00) forever. The *next* `HONDANI` then spun in `hn_hdr`'s
unbounded wait-for-idle → machine frozen (only the C64 side; a reset
cleared it because the Ultimate resets UCI state too).

### Fix (all inside the bank2 routine; bank1 untouched)

1. `hn_jfail` (connect-phase failure) now runs `hn_fin` first — drains
   both queues and performs the DATA_ACC handshake, returning UCI to idle.
2. **Every** wait loop is now bounded to ~64K polls (~1 s): wait-for-idle
   (`hn_widl`), wait-not-busy (in `hn_push`), the DATA_ACC ack wait
   (in `hn_fin`); `hn_wdav` already was.
3. Recovery kick: if idle-wait times out, `hn_hdr` writes `$0E`
   (DATA_ACC|ABORT|CLR_ERR) to `$DF1C` and waits again — this un-wedges a
   stuck transaction from a previous call. Same kick if a pushed command
   stays busy > ~1 s (e.g. connect to an unreachable host): abort it,
   fail red instead of hanging.
4. New scratch byte: `$CF26` (outer poll counter).

No code path can leave the machine frozen now: worst case is a red border
after a few seconds and a recovered-to-idle UCI for the next call.

### Verification

- Routine now `$991E-$9B03` (486 bytes; guard `$9B0E`, 10 spare). Diff vs
  stock: **563 bytes**, bank1 (90, unchanged from tested 5a/5b) + bank2.
- Full machine-disassembly audit of the rebuilt binary: connect-fail path
  goes `jsr hn_fin` → `jmp hn_fail`; all bounded loops and both `$0E`
  kick sites verified; data tables relocated intact (`$9AF2` IP,
  `$9AFE` msg) with matching operands in the send loops.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza) — the 5b regression suite plus:

1. Server up: `HONDANI` → reply + green (as 5b).
2. Server down: `HONDANI` → red after ≤ ~5 s.
3. **The fixed case**: start server, `HONDANI` again → must work, no
   reset needed. Repeat the down/up cycle twice.
4. Quick stock sanity: `$`, freeze → resume, `TASS` launch/exit.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).** Down/up cycles
recover without reset; no hangs.

## Milestone decisions for steps 6-9 (Honza, 2026-07-08)

Target: *any unrecognized command typed at the BASIC prompt goes to the
HDN server* (the manual's "any line that isn't a shell command is sent to
the AI assistant"). Decisions taken:

1. **Trigger scope**: only direct-mode `?SYNTAX ERROR` (error index
   X=`$0B`, `$3A`=`$FF`). All program-mode errors and all other
   direct-mode errors (`?DIVISION BY ZERO`, LOAD errors, …) stay stock.
2. **Offline UX**: if the server is down/unreachable, fall through to the
   stock `?SYNTAX ERROR` after the bounded timeout — a cart with no
   server behaves like a normal RR.
3. **HONDANI keyword stays** as an explicit escape hatch (needed to send
   text that *is* valid BASIC, e.g. `HONDANI LIST ALL FILES`).
4. **RAM homes**: IERROR stub at `$0340` (tape buffer; Honza uses no
   tape), shadow line buffer at `$02A7` — same homes the reference tree
   settled on in its round 6 after `$CFxx` was trampled by loaded
   programs. Freezer resume scribbles `$02A7-$02CA`; harmless, rewritten
   every typed line.

Server wire recap (verified in `cloud/sdk/command_handler.py`,
`cloud/cloud_server.py`, `cloud/request_dispatcher.py`): request = raw
socket payload `$FE $02 <PETSCII line>`; reply = raw PETSCII for CHROUT.
The server dispatches HELP / `:` python / `i:` chat / `c:` CSDB /
NetDrive and answers unknown text with `?ERROR` (ChatHandler claims most
free text). No wedge-side protocol change needed — ship the raw line.

Lessons carried over from `wedge-latest-not-working` (mechanism is
sound; its corruption was the bank5 payload overwrite, already
post-mortemed in step 5a):

- Shadow-copy the line **pre-crunch** — by IERROR time BASIC has
  tokenized the buffer ("STORY" arrives as "ST`<OR>`Y").
- Preserve the CHRGET-derived carry through the line tap (`php` early,
  `plp` right before rejoining the stock scanner) — their round-5 bug
  where the first typed line after boot vanished.
- IERROR stub must run from RAM (bank state at error time is
  unpredictable); direct mode = X bit7 clear *and* `$3A`=`$FF`; X must
  reach the original handler untouched on every fall-through path.
- Unlike the reference tree we do **not** intercept the X-bit7 "print
  READY" pass, don't touch CINV/ILOAD, don't change the boot banner —
  those were their scope creep; ours stays minimal.

## Step 6 — send the typed line instead of "PING" (2026-07-08)

### Change (bank2 only; bank1 byte-identical to the tested 5c image)

Write phase of `hondani_net`: the fixed `hn_msg` table (`$FE $02 "PING"`)
is replaced by sending `$FE $02` immediates followed by a loop copying
the typed rest-of-line into the UCI command buffer:

```
lda ($7a),y / beq done / sta $df1d / iny / cpy #$58 / bne loop
```

Why this works with zero bank1 changes: the bank1 handler already leaves
TXTPTR (`$7A/$7B`) on the first non-space char after the `HONDANI`
keyword (its `jsr $0073`), the scanner runs **pre-crunch** so the buffer
holds raw PETSCII exactly as typed, and BASIC null-terminates the input
line — the `$00` ends the copy. `cpy #$58` (88 = input buffer size) is a
pure safety bound. Zero page is only *read* (no ZP writes anywhere in
the routine — audited). Bare `HONDANI` sends an empty payload; the
server answers (`?ERROR` or AI) and the round trip still completes.
`HONDANI : 2+2` ships ": 2+2" → server python-eval; `HONDANI HELP` →
help handler; free text → AI (slow reply is normal, IRQs off meanwhile).

### Verification

- Routine now `$991E-$9B08` incl. IP-string terminator (guard `$9B0E`,
  6 spare). Full-image diff vs stock: **568 bytes** = 563 (5c) + 5 net
  (+24 new write code, −19 removed PING loop + table). bank1 diff ranges
  byte-identical to the hardware-tested 5c build (source untouched,
  `git diff` confirms only bank02.asm changed).
- Independent machine-disassembly audit of `$991E-$9B08` from the rebuilt
  binary (subagent, no source access): all branch/jsr targets on
  instruction boundaries, new loop's `beq`/`bne` land exactly right, IP
  table operand `$9AFD` matches its new home, no `50 49 4E 47` bytes
  anywhere, only external call is CHROUT `$FFD2`, no ZP writes, `$2C`
  border trick intact, `$9B09-$9B0D` zero.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

Server running at 192.168.1.2:6464.

1. `HONDANI HELP` → the server help text prints (may be cut after ~232
   chars — that's the known single-chunk limit, step 7 fixes it), green.
2. `HONDANI : 2+2` → `4` (python eval), green. `HONDANI STATUS` → status
   line, green.
3. `HONDANI TELL ME A JOKE IN ONE SENTENCE` → AI reply (machine frozen a
   few seconds while the LLM answers — expected), green.
4. Bare `HONDANI` → some reply (`?ERROR` likely) or at minimum green/red
   with machine alive, `READY.` back.
5. `HONDANI` with trailing colon form: `HONDANI:REM X` → sends ":REM X"
   (python eval will error politely) — just confirm no crash, `READY.`.
6. Server down → red ≤ ~5 s, then server up → next `HONDANI HELP` works
   (5c recovery must still hold).
7. Stock sweep: `$`, `FIND`, `OLD`, `MONITOR`+exit, `HONDANIX` →
   `?SYNTAX ERROR`, `10 PRINT"A"`+`LIST`+`RUN`, empty RETURN,
   freeze → resume, `TASS` launch/exit.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).**

## Step 7 — CR before reply + multi-chunk read loop (2026-07-08)

### Design fact that shaped this step

`cloud_server.py`'s `handle_client` recv-loops and never closes the
connection after responding — so the `$0000` EOF the 5b read loop
treated as the terminator **never arrives** after a normal reply; the
wedge itself closes the socket. End-of-reply must be detected the same
way `cloud_test_client.py` does it: long timeout before the first
chunk, short one after ("stop once we have at least one chunk and a
short pause").

### Change (bank2 read phase only; connect/write/close untouched)

- **CR before the reply**: on the first non-empty chunk only, print
  `$0D` and latch the got-data flag `$CF25` (moved up from the old
  post-print position — it now doubles as the CR-once latch).
- **Multi-chunk loop**: after printing a chunk, finish the transaction
  and jump back to `hn_rd` for the next one, with the retry window
  reloaded to `$20` (32 polls ≈ a short pause) instead of the 256 used
  while waiting for the first chunk (which must survive LLM latency —
  HW-proven in step 6).
- **Retry-exhausted split**: window empty *after* data = quiet gap =
  reply complete → green; *without* any data = server never answered →
  red. EOF path unchanged (data → green, no data → red).
- Pocket guard moved `$9B0E` → `$9B2E` (two zero rows absorbed into the
  fill; the free run continues to `$9E7F` regardless).

### Verification

- Diff vs stock: **588 bytes** = 568 (step 6) + 20 (15 CR block + 5
  retry-split), bank2 `$991E-$9B1C` only; banks 0/3-7 byte-identical to
  stock, bank1 source untouched (`git diff`: bank02.asm only).
- Independent machine-disassembly audit (subagent, no source access),
  12/12 claims PASS: CR latch `bne` lands exactly on the print loop,
  post-chunk path jumps *back* to `hn_rd` (`$999B`), `dec $cf24 / bne`
  displacement `$8F` (-113) in range, retry-exhausted split verified
  into the green/red `.byte $2C` trick, no ZP writes, only external
  call CHROUT, tail `$9B1D-$9B2D` zero.
- Deployed to both `wedge/*.crt` names.

### Hardware test checklist (Honza)

Server at 192.168.1.2:6464.

1. `HONDANI HELP` → **full** multi-line help prints (step 6 cut it at
   ~232 chars), starting on a fresh line (the new CR), green border.
2. `HONDANI I: EXPLAIN RASTER INTERRUPTS IN 5 SENTENCES` → long AI
   answer prints completely (several seconds frozen first is normal),
   green. Eyeball the tail — no missing ending = the gap heuristic
   works; a truncated tail mid-sentence would mean the `$20` window is
   too tight (report it, I'll widen).
3. `HONDANI : 2+2` → short reply still fine, green.
4. Repeat a long reply twice in a row (UCI state must stay clean
   across multi-chunk exchanges).
5. Server down → red ≤ ~5 s; server up → next call works (5c
   recovery).
6. Stock sweep: `$`, `FIND`, `MONITOR`+exit, `HONDANIX` →
   `?SYNTAX ERROR`, `10 PRINT"A"`+`RUN`, freeze → resume, `TASS`.

**Result: ✅ hardware tested OK (Honza, 2026-07-08).** Full multi-line
replies print, gap heuristic ends them cleanly.

## Step 8 — inert line tap: shadow copy + pass-through IERROR stub (2026-07-08)

### Pre-work: does stock RR touch `$0300`? (yes — and it's fine)

Grepped all banks. C64-side truth: bank1 redirects IERROR during two
wedge flows (a `$85C9` ROM hook; MERGE's `$0150` RAM trampoline together
with IMAIN) and stock re-runs `$E453` (BASIC vector re-copy) after such
flows; bank0 clears/sets it at boot. The bank2/bank3 "`$0300`" hits are
**relocated 1541 drive code** (operands next to `$1800/$1802` VIA regs —
same false-positive class as the documented `jmp $99b5`). Consequences:
our hook can be wiped at any time → the **per-line reinstall** absorbs
that; and because the stub is a pure `jmp ($03E7)` pass-through, any
interleaving with stock's own redirects behaves exactly stock. The
freezer restores page 3 wholesale from its snapshot, so stub + vector
always come back *consistent*.

### Change (bank1 pocket only; bank2 untouched since step 7)

`hondani_nomatch` (runs on every non-empty, non-HONDANI typed line —
numbered lines included, harmlessly) now does, before the stock-state
restore:

1. Re-copy the 3-byte stub `jmp ($03E7)` to `$0340` every line
   (self-heals tape-buffer scribbles; freezer only touches
   `$0334-$033B`).
2. If `$0300/$0301` ≠ `$0340`: save current vector to `$03E7/$03E8`,
   then point `$0300` at the stub. Idempotent.
3. Shadow-copy the raw pre-crunch line `($7A) → $02A7` including the
   `$00` terminator, store index bounded ≤ `$58` so the worst-case
   write is `$02FF` — never page 3.

Tap clobbers only A/Y (X = scanner char survives; CHRGET carry stays
`php`-protected exactly as before — the reference tree's first-line-
after-boot bug can't recur). `HONDANIX`-style near-misses go through
the tap too (they're future fallback candidates). Pocket now **full**:
155/156 bytes + 1 fill; `"HONDANI",0` word at `$9E04`, stub template at
`$9E0C`.

### Verification

- Diff vs stock: **648 bytes** = 588 (step 7) + 60 (64 new minus 4
  coinciding with stock zeros). bank2 ranges = step-7 build exactly
  (source untouched; per-bank assembly is deterministic); banks 0/3-7
  stock. Build archived as `build/archive-step8.bin` (new habit: keep
  per-step archives for future byte comparisons).
- Independent disassembly audit (subagent, binary only): 8/8 PASS —
  hook bytes, full checker+tap structure opcode-for-opcode, `bcs` of
  the HONDANIX path retargeted to the tap start, X never written in the
  tap, writes confined to `$0340-42/$0300-01/$03E7-E8/$02A7-$02FF`,
  all branch targets on instruction boundaries, `$9E10+` byte-identical
  to stock, **zero** bank1 differences outside the two intended sites.

### Hardware test checklist (Honza) — everything must be 100% stock

1. **First line after cold boot**: boot, immediately type `PRINT 10` →
   prints `10` (this exact case caught the reference tree's carry bug).
2. Errors stock: `FOO` → `?SYNTAX ERROR`; `PRINT 1/0` →
   `?DIVISION BY ZERO`; `10 FOO` then `RUN` → `?SYNTAX ERROR IN 10`.
   Machine normal after each.
3. Observability (proves the tap runs): after any typed line,
   `PRINT PEEK(768);PEEK(769)` → `64 3` (vector → `$0340`);
   `PRINT PEEK(832);PEEK(833);PEEK(834)` → `108 231 3` (the stub);
   `PRINT PEEK(999);PEEK(1000)` → the saved original vector, expect
   `139 227` (`$E38B`); `PRINT PEEK(679)` → `80` — the shadow buffer's
   first char is the `P` of the very PRINT line you typed (per-line
   copy demonstrating itself).
4. Stock sweep: `$`, `FIND`, `AUTO`, `OLD`, `MONITOR`+exit, `OFF`/`ON`,
   `TASM`→TASS+exit, numbered lines+`LIST`+`RUN`, empty RETURN.
5. Freeze → menu → resume, then type a line and re-check the PEEKs of
   item 3. RUN/STOP+RESTORE, then `FOO` → still stock error.
6. If convenient: a MERGE (it redirects `$0300` itself — must work).
7. `HONDANI HELP` still round-trips (match path bypasses the tap).

**Result: ✅ hardware tested OK (Honza, 2026-07-09).**

## Milestone decisions for step 9 (Honza, 2026-07-09)

1. **Border feedback**: auto-dispatch (any typed line → server) is **visually
   invisible** — no green/red flash. The `HONDANI` keyword keeps its green/red
   border feedback; the transparent "type anything" path does not.
2. **Granularity**: step 9 is **split into 9a + 9b**, each hardware-tested.
3. **Fall-through**: a line goes to the stock `?SYNTAX ERROR` **only when the
   server is unreachable**. Any reachable-server reply (even the server's own
   `?ERROR` text) counts as fully handled — no stock error.

## Step 9a — arm the stub (mechanism only, no network) (2026-07-09)

### Why this split

Step 9 arms the previously-inert IERROR stub — the riskiest change. 9a builds
the **final** RAM-stub form and freezes bank1, but routes to a bank2
`hondani_err` that does **no network** — it just proves the trigger + carry +
re-entry mechanics. After 9a passes hardware, **9b touches only bank2**
(swap the marker for the real dispatch), which is the same low-risk,
bank2-only iteration we did in 5b→7.

### Space survey (mandatory, done)

The bank1 main pocket `$9D74-$9E0F` is full (3-byte inert stub only). The
armed stub is 23 bytes, so it moves to the stock zero run **`$9E3A-$9E58`
(31 bytes)**. Survey: **no operand in any bank references `$9E3A-$9E5F`**
(grep of all `lda/sta/jmp/jsr/...` operands) — matches the existing
`.errorif (* != $9E3A)` data guard and real code resuming at `$9E59`. Safe.

### Change

- **bank1** — the 3-byte `hd_stub` template (`jmp ($03e7)`) is removed from
  the pocket (those bytes revert to stock zeros) and re-homed at `$9E3A` as
  the 23-byte armed template:
  `sei; lda #$10/sta $de00 (bank2); jsr $9b2e; lda #$08/sta $de00 (bank1);
  cli; bcs hd_pass; jmp ($0302); hd_pass: jmp ($03e7)`.
  Copied to RAM `$0340` by the existing `hd_stubcopy` loop (its `ldy #N`
  immediate auto-grows 2→22) and **runs there**. Position-independent: every
  absolute operand is a fixed address; only `bcs` is self-relative (stays
  correct at `$0340`). X untouched on every C=1 path (stock handler still
  sees the error index). The `jsr $9b2e` target is **pinned**.
- **bank2** — new `hondani_err` pinned at `$9B2E` (in the `$9B2E-$9E7F` free
  run): `cpx #$0b / bne he_pass`; `lda $3a / cmp #$ff / bne he_pass`
  (direct-mode syntax error only); print CR `"HDN"` CR via CHROUT; `clc`
  (handled). Anything else → `he_pass: sec` (X preserved). Entered
  bank2-mapped with IRQ already off (the stub did `sei`); returns via `rts`,
  and the **stub** restores bank1 then `cli` — so no IRQ can fire while
  bank2 is mapped (the reason `hondani_err` must *not* `cli` itself).

### Verification (Sonnet subagent, build + byte-diff + disassembly)

- `./build.sh`: clean, all `.errorif` guards pass, deployed to both
  `wedge/*.crt`.
- Full-image diff vs stock `rr38p-tmp12reu.bin`: **705 bytes across bank1 +
  bank2 only**; banks 0/3/4/5/6/7 **byte-identical**. Old pocket stub site
  `$9E0C-$9E0E` is back to stock zeros.
- Both new blocks disassembled from the rebuilt binary and matched
  opcode-for-opcode: bank1 stub (`bcs` disp `$03`, `jsr $9b2e`, both `jmp`
  indirect `$6C`), bank2 `hondani_err` (both `bne` land on `he_pass`, five
  `jsr $ffd2`, immediates `0D 48 44 4E 0D`). Trailing fill all zero.

### Hardware test checklist (Honza) — stock behavior is sacred

1. **The new behavior**: `FOO` (garbage) at the `READY.` prompt → prints
   `HDN` on its own line, then `READY.` — and **no** `?SYNTAX ERROR`. Repeat
   a few times; machine stays alive.
2. **Non-syntax errors stay stock**: `PRINT 1/0` → `?DIVISION BY ZERO`;
   `?FOO` typos that aren't syntax errors behave stock.
3. **Program-mode stays stock**: `10 FOO` then `RUN` → `?SYNTAX ERROR IN 10`
   (program mode, not the `HDN` path).
4. **First line after cold boot**: boot, immediately type `PRINT 10` → `10`
   (the reference tree's carry bug case).
5. `HONDANI HELP` still round-trips (server up) — the keyword path is
   independent of the stub.
6. Stock sweep: `$`, `FIND`, `AUTO`, `OLD`, `MONITOR`+exit, `OFF`/`ON`,
   `TASM`→TASS+exit, numbered lines + `LIST` + `RUN`, empty RETURN.
7. Freeze → menu → resume, then `FOO` → still prints `HDN` (stub reinstalled
   per line); RUN/STOP+RESTORE then `FOO` → `HDN`.
8. Observability unchanged from step 8: after any typed line
   `PRINT PEEK(768);PEEK(769)` → `64 3`.

**Result (first build): ✅ mostly — `FOO` prints `HDN`, all stock behavior
correct — but `READY.` never reappeared** after the `HDN` marker (machine
alive, accepting input, just no prompt). Root cause: the handled path used
`jmp ($0302)` (IMAIN = `$A483`), which is BASIC's main *input* loop — the
`READY.` message is printed by the warm-start code *before* that loop, so
entering IMAIN directly skips it.

**Fix**: handled path now `jmp $e37b` (KERNAL BASIC warm start) instead —
the exact continuation every stock wedge command `rts`'s to (step-2 note:
pushing `$E3/$7A`). It resets direct mode, prints `READY.`, and re-enters
the wedge main loop. 3-byte change (`6C 02 03` → `4C 7B E3`), stub still 23
bytes, `bcs` displacement unchanged; rebuilt + re-verified (banks 0/3-7
identical, bank2 unchanged).

**Result (after the `$e37b` fix): ✅ hardware tested OK (Honza, 2026-07-09).**
`FOO` → `HDN` + `READY.`; all stock behavior intact. **Bank1 is now FROZEN**
(9a binary archived as `build/archive-9a.bin`).

## Step 9b — auto-dispatch the typed line to the server (2026-07-09)

### Change (bank2 only; bank1 + `hondani_net` byte-identical to 9a)

`hondani_err` at the pinned `$9B2E` grows from the 9a marker into the real
dispatch. It is **self-contained** — it shares only the pure leaf helpers
(`hn_hdr`, `hn_push`, `hn_fin`, `hn_wdav`, `hn_close`, `hn_ip`), so the
hardware-proven HONDANI path (`hondani_net`) stays **byte-for-byte
untouched** (zero regression risk). Flow mirrors `hondani_net` (connect →
write `$FE $02` + line → multi-chunk read with CR-before-reply → close) with
four deliberate differences:

1. **No `sei`/`cli`** anywhere — the RAM stub owns the IRQ window and
   restores bank1 *before* re-enabling IRQ, so no IRQ can fire while bank2
   is mapped. (`hondani_net` must `sei`/`cli` because it is reached from the
   `$DEDE` rti gate; `hondani_err` must not, or an IRQ would hit bank2.)
2. **Payload from `$02A7`** (`lda $02a7,y`), the step-8 shadow copy — TXTPTR
   is mid-crunched-line at IERROR time, so `($7a)` is unusable.
3. **No border paint** (per the step-9 decision: auto-dispatch is invisible).
4. **Carry return, not `$d020`**: `C=0` = server reachable + reply printed =
   handled (stub warm-starts BASIC, no stock error); `C=1` = fall through to
   stock `?SYNTAX ERROR`. Every `C=1` path except the "not our error class"
   early-out reloads `ldx #$0b` so the stock handler prints the right message
   (`he_pass` alone preserves the caller's X untouched). `C=1` is reached on:
   wrong error class, no UCI (`$DF1D`≠`$C9`), or an unreachable/timed-out
   server — a *reachable* server's reply (even its own `?ERROR`) is handled.

### Verification (Sonnet subagent, build + dual byte-diff + disassembly)

- `./build.sh` clean; deployed to both `wedge/*.crt`. Build archived as
  `build/archive-9b.bin`.
- **Frozen-region proof** vs `build/archive-9a.bin`: bank1 **identical**;
  bank2 `hondani_net` region `$991E-$9B1C` **identical**; banks 0/3-7
  **identical**. The *only* change is bank2 `$9B31-$9C41` (the grown
  `hondani_err`). vs stock: banks 0/3/4/5/6/7 byte-identical.
- Full disassembly audit of `hondani_err` (114 instrs): entry gate
  (`cpx #$0b` / `$3A`=`$FF` / `$DF1D`=`$C9`) correct; **zero `sei`/`cli`**;
  payload load is `lda $02a7,y` (not `($7a),y`); IP load targets the shared
  `hn_ip` (`$9B11`); the three `sec` returns match the `ldx #$0b` contract
  (only `he_pass` bare); handled path `clc`/`rts` after `hn_close`; all
  branches in range and on instruction boundaries; all six `jsr` targets
  sane (`$FFD2` + the five helpers in `$991E-$9B1C`).

### Hardware test checklist (Honza)

Server running at 192.168.1.2:6464 for the "up" cases.

1. **The headline feature**: type free text that isn't a command, e.g.
   `HELLO WORLD` or `WHAT IS THE FASTEST C64 COPIER` → server reply prints
   on a fresh line, then `READY.` — **no** `?SYNTAX ERROR`, **no** border
   change. (LLM latency: machine frozen a few seconds is normal.)
2. `: 2+2` (leading colon → server python-eval) → `4`, then `READY.`.
   `I: EXPLAIN SPRITES IN ONE SENTENCE` → AI reply.
3. **Non-syntax errors stay stock**: `PRINT 1/0` → `?DIVISION BY ZERO`.
4. **Program mode stays stock**: `10 HELLO WORLD` then `RUN` →
   `?SYNTAX ERROR IN 10` (no dispatch).
5. **Server down** → after ≤ ~5 s, stock `?SYNTAX ERROR` appears (fall
   through), machine alive; bring the server back → next line dispatches
   again with no reset (5c recovery still holds).
6. `HONDANI HELP` still works identically (independent path).
7. Stock sweep: `$`, `FIND`, `MONITOR`+exit, numbered lines + `LIST` + `RUN`,
   empty RETURN, freeze → resume, `TASS` launch/exit.
8. First line after cold boot: `PRINT 10` → `10`.

**Result: ✅ hardware tested OK (Honza, 2026-07-09).** Step 9 (any unrecognized
direct-mode line → HDN server) is DONE.

## Milestone decisions for step 10 — console switching (Honza, 2026-07-09)

Target: `C=+CTRL+1..7` switches consoles (manual `docs/user_manual/cloud-apps.md`).
`1` = local shell, `2..7` = server consoles. The **server DMA-paints** the C64
screen (`$0400/$D800`) itself — the wedge never buffers a screen; it detects the
combo, forwards keystrokes, and blocks on acks. Wire format (`$FE`, then
`(console<<4)|cmd`): SAVE_SCREEN `$FE $00 $02`, RESTORE_SCREEN `$FE $00 $03`,
GET_SCREEN `$FE (N<<4)|0 $01`, keypress `$FE (N<<4)|1 <petscii> <mods>`.

Decisions taken (grilled 2026-07-09):

1. **10a = detect + border marker only** (no network) — validate the persistent
   IRQ hook safely before wiring anything.
2. **Modal loop starts minimal** (switch + forward fresh keys, no auto-repeat);
   port the reference's two-stage key-repeat only after the basic path is proven.
3. **A live server console is available** to hardware-test real switches later.
4. **Architecture constraint discovered:** the reference tree installs/heals its
   CINV hook *per typed line from bank1* — but our **bank1 is FROZEN and its
   pocket is FULL**. So 10a arms the hook from the existing bank2 `HONDANI` path
   instead (zero bank1 change). Per-line self-heal + RUN/LOAD-disarm (which
   genuinely need bank1 work) are a deliberately deferred later sub-step; until
   then the hook persists from the moment `HONDANI` is typed until reset.

## Step 10a — CINV key hook: detect C=+CTRL+1..7 → border (2026-07-09)

### Change (bank2 only; bank1 byte-identical to the 9b archive)

- **`cs_install`** (new, in the bank2 free run after `hondani_err`): copies the
  53-byte CINV stub template to RAM `$03A0`, saves the current `$0314` vector to
  `$03EC/$03ED` (with a never-save-ourselves guard), points `$0314` at `$03A0`,
  clears the one-shot latch `$03EE`.
- **`jsr cs_install`** added at the very top of `hondani_net` (right after its
  `sei`, before the UCI ident read). 3 bytes; absorbed by the pad before
  `$9B2E`, so **`hondani_err` stays pinned at `$9B2E`** and the bank1 gate target
  `$991E` is unchanged. The rest of `hondani_net` is byte-identical (just shifted
  3 bytes down within its pocket).
- **`cinv_tmpl`** (CINV IRQ stub, `.pseudopc $03A0`): on each IRQ reads `SHFLAG`
  (`$028D`, bit1=C=, bit2=CTRL), `AND #$06 / CMP #$06`; if both held, scans
  `SFDX` (`$CB`) against the matrix codes `56,59,8,11,16,19,24` (keys 1..7);
  on a fresh match (latch `$03EE` clear) it latches, does `INX` (digit index
  0..6 → 1..7) and `STX $D020` (border = digit), then `JMP ($03EC)`. No match →
  clear latch → chain. Position-independent (all operands fixed RAM/IO; the only
  intra-stub ref `cvr_digits` resolves inside the pseudopc block). Clobbers A/X
  only — the KERNAL dispatcher stacked them and the chained `$EA31` restores
  them; stack stays balanced.

RAM homes (datassette buffer, unused by Honza; clear of the `$0340` IERROR stub
and `$03E7/8` orig vector): stub `$03A0-$03D4`, saved CINV vec `$03EC/ED`, latch
`$03EE`.

### Verification

- `./build.sh` clean; all `.errorif` guards pass (incl. the pins `$991E`,
  `$9B2E`, `$9E80`, and a new guard that the stub ends `≤ $03E7`). Deployed to
  both `wedge/*.crt`.
- Diff vs `build/archive-9b.bin`: **bank1 identical** (FROZEN intact); banks 0/3-7
  identical; the only changes are in bank2 (`$991F-$9CAA` = the 3-byte shift of
  the `hn_*` helpers plus the new `cs_install`+`cinv_tmpl` block). Diff vs stock:
  banks 0/3/4/5/6/7 byte-identical; bank1 = the frozen 8/9a changes only.
- Both new blocks hand-decoded opcode-for-opcode from the rebuilt binary:
  `hondani_net` top (`78 / 20 41 9C / AD 1D DF …`), `cs_install` copy loop +
  hook + guard, and the `$03A0` stub (all branch displacements, `JMP ($03EC)`,
  `STX $D020`, digit table `38 3B 08 0B 10 13 18`).

### Hardware test checklist (Honza) — the persistent IRQ hook must be invisible

Arming: type `HONDANI` once (server up or down — the hook installs regardless;
if the server is down HONDANI just red-borders, that's fine).

1. **Detection**: `C=+CTRL+1` → border **white**; `C=+CTRL+2` → **red**; `3` →
   **cyan**; `4` → **purple**; `5` → **green**; `6` → **blue**; `7` → **yellow**.
   Each is one-shot per press; holding it just keeps that colour.
2. **No false triggers**: plain `C=+1..8` (colour keys) and `C=+SHIFT` (charset
   flip) must behave stock and **not** hit our marker; typing normal text, other
   keys → nothing to the border.
3. **Stock behaviour with the hook live** (the whole point): `$`, `FIND`, `OLD`,
   `MONITOR`+exit, `OFF`/`ON`, `TASM`→TASS+exit, numbered lines + `LIST` + `RUN`,
   empty RETURN — all normal. `FOO` → `HDN`/server dispatch as in step 9; `PRINT
   1/0` → `?DIVISION BY ZERO`. `HONDANI HELP` still round-trips.
4. **Freeze → menu → resume**, then press `C=+CTRL+3` → still cyan (page 3 came
   back with the hook). RUN/STOP+RESTORE, then a combo → still works.
5. First line after cold boot: `PRINT 10` → `10` (unchanged; the hook only arms
   after `HONDANI`).
6. Anything odd — a hang, a wrong colour, a crash after the combo — stop and
   report; a persistent IRQ hook is the riskiest change so far.

**Result: ✅ hardware tested OK (Honza, 2026-07-09).** Border colours change per
digit as expected; all stock behaviour intact. (Bare `HONDANI` logs a harmless
`Packet too short` on the server — the empty `$FE $02` payload — no wedge issue.)

## Step 10b — cross-bank call from the IRQ stub (2026-07-09)

### Why isolate this

10a proved the persistent CINV hook + combo detection are safe. The next new
risk is the **bank switch from inside the IRQ RAM stub**: page in bank2, `jsr`
bank2 code, page back, and chain to the original IRQ — all while the CPU is mid-
interrupt. 10b validates *only* that path, keeping the observable identical to
10a (border = digit) so any regression is obviously the bank-switch mechanism.

### Change (bank2 only; bank1 byte-identical to the 10a/9b archives)

- `cinv_tmpl` match path (RAM stub `$03A0`): replaced the inline `inx / stx
  $d020` with — `lda $de00 / and #$98 / sta $03ef` (save the RR bank-feedback
  bits so we return to whatever was mapped when the IRQ hit) → `lda #$10 / sta
  $de00` (page in bank2, the value the HONDANI gate uses) → `jsr console_switch`
  (X = digit index 0..6, IRQ still masked) → `lda $03ef / sta $de00` (restore)
  → `jmp ($03ec)` (chain). Stub grows 53→71 bytes, `$03A0-$03E6`; `cvr_digits`
  relocates to `$03E0`; still ends exactly below the `$03E7` IERROR vector
  (guarded). New scratch `$03EF` (saved bank bits).
- New bank2 `console_switch` (in the free run after `cinv_tmpl`): `inx / stx
  $d020 / rts` — the 10a marker, now executed from bank2. Legal from RAM: the
  stub runs in RAM so the `sta $de00` page-flip doesn't pull the ground out from
  under the executing code; the `jsr` then fetches from bank2 ROM.

Banking note: the stub saves/restores only the `$98` bank-feedback bits, forcing
cart-on during the excursion (same as the reference). Safe when the combo is
pressed at the `READY.` prompt (cart already banked in, stable); a combo pressed
during a rare cart-off/RAM window is the one edge the modal design will fence off
later. Not a concern for this test.

### Verification

- `./build.sh` clean; all `.errorif` guards pass (pins `$991E`/`$9B2E`/`$9E80`,
  stub `≤ $03E7`). Deployed to both `wedge/*.crt`; archived `build/archive-10b.bin`.
- Diff vs `build/archive-10a.bin`: **bank1 identical** (FROZEN); banks 0/3-7
  identical; only bank2 `$9C42-$9CC1` changed (the grown match path + new
  `console_switch`). vs stock: banks 0/3/4/5/6/7 byte-identical.
- Hand-decoded from the rebuilt binary: match path `AD 00 DE / 29 98 / 8D EF 03
  / A9 10 / 8D 00 DE / 20 BD 9C (jsr console_switch) / AD EF 03 / 8D 00 DE / 6C
  EC 03`; `console_switch` = `E8 8E 20 D0 60`; `cvr_chk` now `DD E0 03`
  (`cmp $03E0,x`); digit table `38 3B 08 0B 10 13 18`.

### Hardware test checklist (Honza)

Arm with `HONDANI` as before, then:

1. `C=+CTRL+1..7` → border shows the digit's colour (**same as 10a**), machine
   stays alive. This time the colour is written by bank2 code reached over the
   IRQ bank switch — so "works exactly like 10a" = the mechanism is sound.
2. Do it many times, mix in other keys / typing — no hang, no stray crash.
3. Stock sweep with the hook live: `$`, `FIND`, `MONITOR`+exit, numbered lines
   + `RUN`, `HONDANI HELP`, `FOO`→dispatch, freeze → resume then a combo.
4. Any hang or crash right after a combo press = the IRQ bank switch is the
   culprit — stop and report (this is the step that de-risks it).

**Result (first build): ❌ bug — first press OK, second press hangs into RR
freezer ROM** (Honza, 2026-07-09: "3 then 1 → LOADING; 1 then 3 → backup menu;
mostly garbled; border changes only the first time, 2nd press hangs before
setting it").

**Root cause:** the match path *saved* the bank with `lda $de00 / and #$98` and
*restored* by writing that back. But the RR **`$DE00` READ returns Action-Replay-
style status, not the control-register value** — stock RR code never reads it for
banking, it always writes known constants (e.g. `lda #$08` at bank01 `$4249`
region). So the restore wrote a bogus control value; the first press limped, and
the second press's `sta $de00 #$10` no longer selected bank2, so `jsr $9CB4` ran
into RR freezer/fastload ROM (→ LOADING / backup menu / garble). The reference
tree had this same read-restore bug.

**Fix:** restore with the **constant `#$08`** (bank1 = the wedge's resident
mapping), exactly what the stock `$DEE3` trampoline writes; dropped the `$03EF`
save entirely. Legal as a plain `sta $de00` because the stub executes from RAM
(`$03A0`), so the bank flip never moves the running code. Rebuilt + re-verified
(bank1 identical to 10a/frozen; banks 0/3-7 = stock; match path decoded
`A9 10 / 8D 00 DE / 20 B4 9C / A9 08 / 8D 00 DE / 6C EC 03`). Same test checklist
above.

**Result: _pending re-test_**

## State snapshot & continuation guide (for the next session)

**Deployed image** = step 9b (`wedge/*.crt`, byte-verified + disassembly-
audited; steps 7, 8, 9a hardware-tested OK 2026-07-09; bank1 FROZEN since
9a). Awaiting the step-9b hardware checklist above — this is the headline
feature (any unrecognized direct-mode line → HDN server). Archives:
`build/archive-9a.bin`, `build/archive-9b.bin`. If 9b passes, step 9 (the
whole "type anything → AI") is DONE. On any failure the breadcrumbs are
`PEEK($CF30/31)` status chars, `PEEK($CF21)` socket id, `PEEK($CF20)` ident
(expect 201).

**Step 9 design notes (space plan):** the main bank1 pocket is FULL.
The armed stub template is ~33 bytes:
`txa/bmi pass; lda $3a/cmp #$ff/bne pass; cpx #$0b/bne pass; sei;
lda #$10/sta $de00; jsr <bank2 error entry>; lda #$08/sta $de00; cli;
jmp ($0302); pass: jmp ($03e7)` — runs from RAM so the mid-stub bank
flips are legal; re-enters BASIC via IMAIN like the reference tree did.
Space: bank1 has a second stock zero run `$9E3A-$9E58` (31 bytes,
**reference survey still required** — check no code/data reads target
it, like the 5a survey did for bank2). 31 < 33, so move the 8-byte
`"HONDANI",0` word (or the 3-byte step-8 stub template) there to free
main-pocket room; keyword-loop `lda <word>,y` operand just retargets.
The bank2 error entry reuses `hondani_net` but must send the `$02A7`
shadow copy instead of `($7A)` (TXTPTR is mid-crunched-line at IERROR
time) and set a flag so failure paths *return with carry set* instead
of painting red, letting the stub fall through to the stock
`?SYNTAX ERROR` per the offline-UX decision. Server-down latency note:
the connect timeout (~1 s kick + retries) happens on EVERY unrecognized
line while offline — acceptable per decision, revisit if annoying.
During-MERGE caveat: `$3A`=`$FF` there too; a syntax error inside a
MERGE would hit the fallback — accepted for now (MERGE errors are rare;
pass-through for non-syntax errors keeps MERGE's own machinery intact).

**Where everything lives:**

- `wedge/rr38p-tmp12reu.bankNN.asm` — byte-exact KickAss sources; build
  with `./build.sh` (assembles, byte-checks anchors via `.errorif`,
  packages `.crt`, deploys to BOTH `wedge/*.crt` names).
- Verify any change by byte-diffing `build/rr38p-tmp12reu.rebuilt.bin`
  against stock `rr38p-tmp12reu.bin` (python, ranges per bank) — every
  diff byte must be explainable.
- bank1 `$83FF`: 3-byte hook (`jmp $9D74`) replacing `tax/bne $8407` in
  the BASIC scanner. bank1 pocket `$9D74-$9E0F` (FULL): `HONDANI`
  keyword check (state-preserving; falls back to stock scanner at
  `$8407`) + step-8 inline line tap at `$9D8B` (stub copy → `$0340`,
  idempotent IERROR install with orig vector saved at `$03E7/8`, raw
  line shadow → `$02A7`) + matched path (mimics stock `$848D`, pushes
  `$E3/$7A` so handlers rts to READY) + cross-bank gate frame → bank2
  `$991E` with `$DE00` value `$10`. Word at `$9E04`, stub template at
  `$9E0C`.
- bank2 `$991E-$9B1C` (`hondani_net`, guard `$9B2E`): the whole network
  routine — see its big header comment for protocol, scratch map
  (`$CF20-$CF33`), and design constraints. Free space continues to
  `$9E7F` (~870 bytes) and bank3 `$998B-$9E9C` (1298) is the reserve.
- Full mechanism docs: `rr38p-tmp12reu.analysis.md` (gate/trampoline,
  corrected `$DEEE` table facts), this file (step history, safety
  surveys, corruption post-mortem of the old attempts).

**Cardinal rules (cost us the previous tree):** never write inside bank5
`$8023-$9EB9` (TMP payload); keep every change byte-diff-explainable; one
small hardware-tested step at a time; stock behavior is sacred.

**Roadmap:** steps 6-9 in the plan table (typed text → multi-chunk
replies → inert IERROR tap → armed syntax-error fallback), per the
milestone-decisions section. Longer term: local command set, screen
save/restore via server DMA (`SERVER_CMD_SAVE_SCREEN` etc. in
`cloud/sdk/command_handler.py`).
