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
| 5c | UCI-state hardening: connect-fail path accepts/drains the transaction; all wait loops bounded ~1 s with `$0E` (ACC\|ABORT\|CLR_ERR) recovery kick — no code path can hang the machine | Server-down → red; **then server up → next `HONDANI` works without reset** (the 5b freeze case); everything else as 5b | 🔶 built, awaiting hardware test |

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

**Result: _pending_**

## State snapshot & continuation guide (for the next session)

**Deployed image** = step 5c (`wedge/*.crt`, byte-verified, awaiting the
5c hardware checklist above). If Honza reports 5c ✅, mark it in the plan
table and move on; if the freeze persists, the breadcrumbs are
`PEEK($CF30/31)` status chars, `PEEK($CF21)` socket id, `PEEK($CF20)`
ident (expect 201).

**Where everything lives:**

- `wedge/rr38p-tmp12reu.bankNN.asm` — byte-exact KickAss sources; build
  with `./build.sh` (assembles, byte-checks anchors via `.errorif`,
  packages `.crt`, deploys to BOTH `wedge/*.crt` names).
- Verify any change by byte-diffing `build/rr38p-tmp12reu.rebuilt.bin`
  against stock `rr38p-tmp12reu.bin` (python, ranges per bank) — every
  diff byte must be explainable.
- bank1 `$83FF`: 3-byte hook (`jmp $9D74`) replacing `tax/bne $8407` in
  the BASIC scanner. bank1 `$9D74-$9DCD` pocket: `HONDANI` keyword check
  (state-preserving; falls back to stock scanner at `$8407`) + matched
  path (mimics stock `$848D`, pushes `$E3/$7A` so handlers rts to READY)
  + the hand-rolled cross-bank gate frame → bank2 `$991E` with `$DE00`
  value `$10`. Word list at `$9DC7`.
- bank2 `$991E-$9B03` (`hondani_net`): the whole network routine — see
  its big header comment for protocol, scratch map (`$CF20-$CF33`), and
  design constraints. Free space continues to `$9E7F` (~900 bytes) and
  bank3 `$998B-$9E9C` (1298) is the surveyed reserve.
- Full mechanism docs: `rr38p-tmp12reu.analysis.md` (gate/trampoline,
  corrected `$DEEE` table facts), this file (step history, safety
  surveys, corruption post-mortem of the old attempts).

**Cardinal rules (cost us the previous tree):** never write inside bank5
`$8023-$9EB9` (TMP payload); keep every change byte-diff-explainable; one
small hardware-tested step at a time; stock behavior is sacred.

**Roadmap after 5c:**

1. Send the *typed line* instead of hardcoded "PING": read from the BASIC
   input buffer `$0200` (the keyword check already knows TXTPTR), length-
   bounded; still via the `HONDANI <text>` keyword for now.
2. Print a CR before the reply; handle replies > one `$E8` chunk (loop
   until EOF).
3. Move the trigger from the `HONDANI` keyword to the true direct-mode
   error fallback (IERROR path — study how stock prints `?SYNTAX ERROR`
   and hook the direct-mode branch only), so any unrecognized line goes
   to the cloud. This is the "chat fallback" milestone from
   `conversion_story.md`.
4. Longer term: local command set, screen save/restore via server DMA
   (`SERVER_CMD_SAVE_SCREEN` etc. in `cloud/sdk/command_handler.py`).
