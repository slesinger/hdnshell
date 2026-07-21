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
| 3 | ~251 | ~257 | — (resolved, see §3) | ~90 SS boot-detect (§5.1 item 2, remaining) |
| 4 | 161 | 161 | 3 | 0 |
| 5 | ~42 | ~42 | 3 | flash util: 0 cleanly recoverable |
| 6 | 37 | 37 | 3 | 0 |
| 7 | 36 | 36 | 3 | 0 |
| **Σ** | **~772** | **~824** | **~1140 pending verification** | **~535 approved-category + optionals** |

Step 31 (2026-07-21) deltas folded into the totals above: bank 3 +15 B (shell-reserve
tail freed by dropping `#8/#9/#s`), bank 4 +83 B (dead IEC-branch cleanup), bank 6
-17 B (index tables relocated into the `$8023` pocket + `#w` path string added). Σ
carries the prior running total plus this step's net +81 B; it is not a fresh sum
of the column above (that column already had pre-existing rounding/overlap drift
predating this step — not something this pass reconciles).

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

### Bank 3 — ~251 B usable
Reclaimed Silversurfer pocket $80F8-$8241 (§5.1): step 31's `hsh_putc`, step
32's `b3_dos1_read`, and step 34's `b3_wait_pkt` now occupy $80F8-$8155
(93 B), leaving 236 B free at $8155-$8241 (`.errorif`-guarded, kept: $8241
`jmp` + ML monitor register header).
Plus the original 14 B at $9FF2-$9FFF (class b) and 6 B of 2-byte slack scraps
pinned inside full HDN annexes ($807F preserves the `bit $8080` trick byte — do
not touch). All five original pockets are consumed; further bank-3 space must
come from Silversurfer item 2 (§5.1) or the reclaimed pocket's remaining ~280 B.

**Step 31 (2026-07-21) new pocket:** dropping `#8/#9/#s` from `hd_setdev`
(`hd_local`→`hd_bad`, short-circuits to a stock `?SYNTAX ERROR`) and from
`hd_norm_cur` (removed the three now-dead `cmp #$38/#$39/#$53` checks) shrank
the code inside the `$998B-$9E9C` shell reserve by a measured 15 B (confirmed
via `.sym`: `kw_tab` moved from `$9E88`→`$9E79`), opening a new free tail at
**$9E8C-$9E9D (17 B)** — up from ~2 B before the change, previously too small
to itemize. `hd_nc_ext` (the separate `$97xx` annex, U/V two-compare → U/V/W
range-check) stayed byte-identical (`hd_nce_ok` still at $97FD both before and
after) — no yield there, as expected from a same-size compaction. Net bank-3
gain this step: +15 B (headline table's "~29 B" step-31 estimate was high by
~14 B; trust the `.sym`-measured 15).

### Banks 4-7 — 276 B total, all tails of HDN reserve pockets
| Bank | Ranges | Bytes |
|---|---|---:|
| 4 | $9E12-$9E9D (139, was 56 -- step 31 removed the dead `b4_curdev`/`b4_is_htf`/`b4_prnsup`/`b4_nsupmsg` IEC branch code, measured via `b4_cd_uv`'s `rts` ending at $9E11) + $9FEA-$A000 (22) | 161 |
| 5 | $80DA-$8100 (38, was 2 -- step 32 moved rf_read's DOS_CMD_READ_DATA command assembly to bank3, step 34 additionally replaced the two 8-bit-bounded DATA_AV waits with a single state-aware bank3 call) + $9FFC-$A000 (4) | ~42 |
| 6 | $80EE-$8100 (18, was 30 -- step 31 relocated `b6_ac_lets`/`b6_ac_off` here from the $9F58 region) + $9E91-$9E9D (12, was 16 -- `#w`'s extra `cmp`/`beq` in `b6_ctx` cost 4 B) + $9FF9-$A000 (7, was 8 -- the relocated tables freed 10 B but the new "/USB0/HOME" string cost 11 B, net -1) | 37 |
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
  bank3 leaf helpers B3_IDLE=$9DAC/B3_PUSH=$9B1D/B3_WDAV=$9B52/B3_FIN=$9B67/B3_DOS1=$9DBD
  (all re-frozen 2026-07-21, step 31 — the bank3 shell reserve shrank ~15 B when
  `#8/#9/#s` were dropped, shifting every leaf-helper label; old values were
  B3_IDLE=$9DBB/B3_PUSH=$9B20/B3_WDAV=$9B55/B3_FIN=$9B6A/B3_DOS1=$9DCC — see §7)/
  `b3_dos1_read`=$8114 (step 32, hardcoded as `B3_DOS1_READ` in bank05.asm, UNCHANGED
  by step 31 — that $80F8-$8241 pocket was not touched)/
  `b3_wait_pkt`=$812B (step 34, hardcoded as `B3_WAIT_PKT` in bank05.asm, UNCHANGED);
  bank4 `b4_disp`=$9C00; bank5 `rf_loader`=$804E, `b5_disp`=$9E00;
  bank6 `b6_disp`=$9E00; bank7 `bb_main`=$8023; bank3 $8080 (`bit $8080` trick).

---

## 5. Drop candidates, ranked (owner decides case by case)

### 5.1 Silversurfer (RS232) — bank 3, yield ~535 B — item 1 DONE (2026-07-19)
Approved category (C64U-only target; SS silicon can't exist).
**Item 1 LANDED** (conversion_log3 step 3a, commit a00d6a8): the single-char SS-launch command was
neutralized by retargeting the bank1 dispatch table at $85A6 ($EE->$E5, => the $80E6 rts no-op) and
$808D-$8240 (436 B) was blanked. HW-tested (ML monitor R header intact). That pocket is now bank3's
active reserve -- step 3b's /flash/bin `flash_retry`/`prep_flash` occupy $808E-$80F7 (~110 B), leaving
~326 B free there ($80F8-$8240) + the original 14 B at $9FF2. Kept: $808A (jmp $8241) + the ML monitor
register header $8241-$8264. Item 2 (boot-detect $957E-$95DE, ~90 B) remains available (trivial skip-
patch) if more bank3 space is ever needed.
Original three pieces (for reference):
1. **Debugstub + UART driver $8081-$8089, $808D-$8240 (~445 B).** [DONE via bank1-table retarget --
   simpler than the thunk patch below; see step 3a.] Original note: Removal:
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

**2026-07-21 (step 31):** `#8`/`#9`/`#s` IEC device commands removed from the
shell (`hd_setdev`/`hd_norm_cur`, bank 3); bank 4's dead IEC branch code removed
(`b4_curdev`'s 8/9/S checks, `b4_is_htf`, `b4_prnsup`, `b4_nsupmsg` — measured
83 B reclaimed, not the ~87 B originally estimated); `#w` (`/USB0/HOME`) added
across banks 3/4/6, which cost bank 6 a net 17 B (index tables relocated into
the `$8023` pocket, offset by the new path string). Bank 3's leaf helpers
re-frozen (see §4) — measured gain there was 15 B, not the ~29 B estimated.
See §2 bank-3/4/6 entries for the full before/after byte accounting.
