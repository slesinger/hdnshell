# RR 3.8p cartridge space map (living doc)

Created 2026-07-18. Purpose: track where free space remains in the 8×8KB banks
and which stock features can be dropped to reclaim space. Update this doc
whenever a pocket is consumed or a feature is removed.

Method: per-bank audits (full source reads + KickAss symbol dumps +
label-reference counting) followed by a cross-bank verification pass over the
`jsr <stub>` + 2-byte-inline-target calling convention (see analysis.md
"cross-bank call mechanism"). Byte counts are exact where a `.sym`/symbolfile
was used, `~` where estimated.

---

## 1. Headline totals

| Bank | Free now (usable) | Free now (all classes) | Dead-suspect stock code | Droppable-feature bytes |
|---|---:|---:|---:|---|
| 0 | 385 | 393 | 702 high-conf + ~420 med-low | 0 |
| 1 | 16 (inside HDN pocket) | 16 | ~7 (entangled) | ~90-150 printer (entangled) |
| 2 | 102 | 140 | 0 | 0 (FUNPAINT viewer ~460 optional) |
| 3 | 14 | 20 | — (resolved, see §3) | ~535 Silversurfer |
| 4 | 78 | 78 | 3 | 0 |
| 5 | 6 | 6 | 3 | flash util: 0 cleanly recoverable |
| 6 | 54 | 54 | 3 | 0 |
| 7 | 36 | 36 | 3 | 0 |
| **Σ** | **~691** | **~743** | **~1140 pending verification** | **~535 approved-category + optionals** |

Feature-presence summary (the good and bad news):

- **Silversurfer (RS232)**: only real approved-category yield. Lives in bank 3
  (~535 reclaimable bytes after patching one bank-1 call site). See §5.1.
- **RR-Net / ethernet / netboot / codenet**: **not present anywhere** in this
  ROM build. Nothing to drop, zero yield.
- **Tape / turbo-tape**: **not present anywhere**. The `$1800/$1C00/$4001`
  register code in bank 2 is 1541/1571/1581 *drive-side* fast-transfer code for
  the backup engine (must-keep), mislabeled "tape" in an older doc. Zero yield.
- **Printer / screen-dump**: only a ~90-150 byte entangled footprint in bank 1
  (PLIST/SLIST keywords + device-4 OPEN shim + printer-echo toggle). Poor ROI.
- **Flash-write utility ("FLASH UTIL V3.8P")**: present in bank 5 (string at
  `$92AC`, entry ~`$91F3`) but baked inside the opaque pre-linked TMP+REU
  payload that spans banks 4-7 and is REU-staged at runtime. **0 bytes cleanly
  recoverable** without rebuilding the TMP binary from source. Not worth it.
- **AR/Nordic compatibility**: not found in any bank (nothing to decide).

---

## 2. Free space inventory per bank

Classification: (a) verified-free, (b) stock-zero padding, (c) reserve already
earmarked for HDN (slack inside our own pockets).

### Bank 0 — 385 B usable (largest clean reserve in the cartridge)
| Range | Bytes | Class | Notes |
|---|---:|---|---|
| $8077-$807F | 9 | b | pad before "RR38P-COUNT ZERO/CPX-" signature |
| $809A-$80FF | 102 | b | zero field after signature/boot-mode byte |
| $8102-$817E | 125 | b | zero pad up to `bank00_api_00` ($817F) |
| $9DD4-$9E13 | 64 | b | after `bank00_api_08` |
| $9E36-$9E3E | 9 | b | mid page-restore block |
| $9EF7-$9EFF | 9 | b | before cross-bank stub $9F01 |
| $9FB5-$9FF7 | 67 | b | end-of-bank pad |
| ($9FF8-$9FFF) | (8) | low-conf | orphan garbage bytes, likely also free |

The $809A-$817E pair (~227 B near-contiguous) is the single best untouched
pocket left in the whole cartridge. Note bank 0 is freeze-mode core — code
placed here runs in freeze/boot context, not BASIC context.

### Bank 1 — 16 B, all slack inside the HDN pocket ($9D74-$9E59)
$9E08-$9E10 (8) + $9E51-$9E59 (8). No stock padding anywhere else; the bank is
fully packed (DOS wedge, ML monitor, TASS/TMP launcher, F-key macros, HDN hook).

### Bank 2 — 102 B usable + 38 B pinned/stock
| Range | Bytes | Class | Notes |
|---|---:|---|---|
| $9B20-$9B2E | 14 | c | pinned padding — `hondani_err` must stay at $9B2E (bank1 stub hardcodes it) |
| $9C0E-$9C41 | 51 | a | reclaimed pocket up to `cs_install` (pinned at $9C41) |
| $9C84-$9CB7 | 51 | a | vacated old CINV-stub slot, `console_switch` pinned at $9CB7 |
| $9E8F-$9E9D | 14 | b | stock zeros |
| $9EF5-$9EFF | 10 | b | stock zeros |

### Bank 3 — 14 B usable
Only $9FF2-$9FFF (14, class b). Remaining 6 B are 2-byte slack scraps pinned
inside full HDN annexes ($807F preserves the `bit $8080` trick byte — do not
touch). All five original pockets are consumed; new bank-3 space must come from
the Silversurfer removal (§5.1).

### Banks 4-7 — 174 B total, all tails of HDN reserve pockets
| Bank | Ranges | Bytes |
|---|---|---:|
| 4 | $9E65-$9E9D (56) + $9FEA-$A000 (22) | 78 |
| 5 | $80FE-$8100 (2) + $9FFC-$A000 (4) | 6 |
| 6 | $80E2-$8100 (30) + $9E8D-$9E9D (16) + $9FF8-$A000 (8) | 54 |
| 7 | $80F9-$8100 (7) + $9E88-$9E9D (21) + $9FF8-$A000 (8) | 36 |

Everything else in banks 4-7 is the opaque TMP+REU pre-linked payload
($80B4-$9C00 in bank 4 = 6988 B; $8100-$9E00 in banks 5/6/7 = 7424 B each) plus
the stock call-gate mirror/stub ($9E9D-$9F58) and HDN wedge code. Bank 5 is
effectively saturated.

---

## 3. Dead stock code — status after cross-bank verification

### 3.1 Bank 3 $8081-$8264 — RESOLVED: split live/dead (was "SS debug stub")
Cross-bank pass result (2026-07-18):
- **$808A `jmp $8241` + $8241-$8264 (39 B): LIVE, MUST-KEEP.** Bank 1's ML
  monitor calls it: `jsr $9f51` (stub→bank3) + inline target `$808A` at
  bank01.asm:2131 (`bank01_sub_8E50`, reached from the monitor dispatch at
  bank01.asm:1534). It prints the ". ADDR AR XR YR SP 01 NV-BDIZC." register
  header. Never reclaim.
- **$8081-$8089 + $808D-$8240 (~445 B): Silversurfer debugstub — reachable but
  droppable.** Bank 1 calls target `$8087` (→`jmp $808D`) via `jsr $9f51` at
  bank01.asm:413, from a thunk (~$80EF) wired into the single-char command
  handler table (pair `$80EE`-area, bank01.asm:990). Not dead, but it *is* the
  SS feature → counted under §5.1, removable after neutralizing that one bank-1
  dispatch entry.

### 3.2 Bank 0 region A: $8D00-$8FBD (702 B) — HIGH confidence dead, cross-bank CLEAN
Unpacker + PAL/NTSC-detect block. No JSR/JMP/table entry in bank 0, no
cross-bank stub target in any bank lands in $8Dxx-$8Fxx (verified by grep over
all 8 sources, twice: bank-0 agent + merge pass). Residual risk: bank 0 owns
the freeze-NMI trampoline (`jmp ($fff8)` at $9EDA) — static analysis cannot
rule out entry via the freeze path. **Gate: hardware test a freeze-button press
after stubbing the region before reclaiming.**

### 3.3 Bank 0 region B: ~$8348-$84EB (~420 B) — MEDIUM-LOW confidence
Tail of the auto-run search routine whose RAM-copy stub (`bank00_sub_82DA`)
only copies $82F7-$8347 (81 B) to $0500 and executes the copy — the ROM tail
past $8347 appears never executed in place. Cross-bank clean. **Gate: re-derive
the copy boundary with tools/dis.py before trusting the 420-B figure.**

### 3.4 Small/negative results
- Bank 1: only the disabled RUN/STOP F-key macro slot (~7 B, non-contiguous,
  inside a fixed-stride table — not worth it). Zero unreferenced code labels
  otherwise.
- Bank 2: zero dead code (all 509 labels referenced).
- Banks 4-7: only the $8009 cold vectors (3 B each, confirmed dead — reset
  never maps these banks — but not usable contiguous space). Warm-bounce chains
  $800C-$8027 (~23-27 B each) are defensively reachable; bank 0's $9EED
  bank-select table contains no bank-4-7 values, so no stock caller targets
  them, but leave them (tiny yield, boot-path risk).

---

## 4. Cross-bank dependency notes (for whoever does the removals)

- Calling convention: `jsr <bank's $9Fxx stub>` + 2-byte inline target;
  destination bank = stub-operand-indexed lookup in the caller bank's
  $9EED/$9EEE table (mirrored at $DEED/$DEEE). Bank 1: $9F4E→bank0,
  $9F50→bank2, **$9F51→bank3**, $9F52→RAM($20), $9F53→cart-off.
- Inbound SS-region calls (complete list, all from bank 1):
  - bank01.asm:413 → bank3 `$8087` (SS debugstub launch) — **patch when dropping SS**
  - bank01.asm:2131 → bank3 `$808A` (monitor register header) — **keep**
- `SSGET` BASIC keyword (bank 1, handler $85A9) is a 3-byte flag-variant
  prefix falling into `TASS` ($85AC). Likely "get source via Silversurfer".
  Once SS hardware support is dropped it is useless but nearly free to keep;
  removing the keyword itself only pays if the keyword table is repacked
  (entangled, ~10 B, don't bother initially).
- Pinned addresses that must never move (hardcoded cross-bank):
  bank2 `hondani_err`=$9B2E, `cs_install`=$9C41, `console_switch`=$9CB7;
  bank3 leaf helpers B3_IDLE=$9DBB/B3_PUSH=$9B20/B3_FIN=$9B6A/B3_DOS1=$9DCC;
  bank4 `b4_disp`=$9C00; bank5 `rf_loader`=$804E, `b5_disp`=$9E00;
  bank6 `b6_disp`=$9E00; bank7 `bb_main`=$8023; bank3 $8080 (`bit $8080` trick).

---

## 5. Drop candidates, ranked (owner decides case by case)

### 5.1 Silversurfer (RS232) — bank 3, yield ~535 B — RECOMMENDED FIRST
Approved category (C64U-only target; SS silicon can't exist).
Three pieces:
1. **Debugstub + UART driver $8081-$8089, $808D-$8240 (~445 B).** Removal:
   neutralize bank 1's thunk (bank01.asm:413 → point the single-char handler
   at an `rts`, same-size patch), then convert the bank-3 range to a `.fill`
   pocket. Keep $808A-$808C (`jmp $8241`) and $8241-$8264 (monitor header).
   Difficulty: **needs-stub** (one 2-byte retarget in bank 1).
2. **Boot-info SS-detect block $957E-$95DE (96 B → ~90 net).** Inline between
   the REU-compat print and PAL/NTSC detect inside `bank03_api_25` — needs a
   skip-`jmp` patch, not pure deletion; frees the "SILVERSURFER FOUND/NOT
   FOUND" print + $DE01/$DE0F probe. Difficulty: **trivial patch**.
3. (Later, optional) SSGET keyword cleanup — see §4, negligible yield.
Suggested small-step order: (a) retarget bank-1 thunk, hardware test; (b) blank
the debugstub range, hardware test (incl. ML monitor `R` display — proves the
$8241 path survived); (c) skip-patch the boot detect, hardware test boot banner.

### 5.2 Bank 0 dead region A $8D00-$8FBD — yield 702 B — needs 1 hardware gate
Not a "feature", suspected-dead unpacker/PAL-NTSC code. Cheap to try: stub it,
then hardware-test freeze button + boot + fastload. If freeze works, it's the
second-largest single reclaim available. Risk: medium (freeze-NMI path).

### 5.3 Bank 0 dead region B ~$8348-$84EB — yield ~420 B — needs boundary check
Verify the $0500-copy boundary with tools/dis.py first; then same stub-and-test
approach. Risk: medium (cold-boot auto-run path).

### 5.4 FUNPAINT/picture-format viewer — bank 2, yield ~460 B — NOT pre-approved
Freezer screen-viewer extension (format descriptor table $9850-$98A7 + IRQ
split display code ~$9777-$9911). It is *viewer* support for third-party
picture formats, separate from the save/export logic. Dropping it degrades the
must-keep freezer viewer's format coverage — owner call. Difficulty: needs-stub
(reached via bank-2 API slots; entry points must be stubbed, cross-bank callers
verified).

### 5.5 Printer footprint — bank 1, yield ~90-150 B — POOR ROI, not recommended
PLIST/SLIST keywords + handlers, device-4 OPEN shim branch (~13 B of a shared
101-B helper), printer-echo toggle (~25 B). All entangled in keyword/dispatch
tables; removal shifts nothing big and risks the must-keep wedge dispatch.

### 5.6 Zero-yield entries (close these)
- RR-Net: absent from ROM. Tape: absent. AR/Nordic: absent.
- Flash util: bank-5 payload-entangled, 0 B recoverable (would need a TMP+REU
  source rebuild — separate project, not worth it).

---

## 6. Flagged for owner awareness (no action proposed)

- Bank 1 ~$8940-$896F: $AA/$55-signature device-autodetect block (reads
  $9F80/$9F81 via $DE9D, sets current device from $9F83). Unidentified
  purpose; possibly external-ROM hook. Left alone.
- Bank 1 $9C24-$9D14 (~240 B): on-screen/joystick keyboard popup, tangled with
  the freeze-NMI handler. Kept.
- Bank 2 header note: "drive/tape I/O helpers" in older docs is wrong — it is
  drive-side fast-transfer code (1541/1571/1581) for backup. Docs corrected here.

## 7. Maintenance

When a pocket is consumed or a removal lands: update §1 totals, the bank's §2
table, and strike the candidate in §5. Keep pinned-address list in §4 current —
it is the contract every removal must respect.
