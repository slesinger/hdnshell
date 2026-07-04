# RR38P Retro Replay Wedge — Analysis & Working Integration

Status as of this writing: **the `HONDANI` keyword is retired.** It served its purpose as a proof of concept (border-flash, then cross-bank calling, then cloud networking — all confirmed working on real hardware) and is no longer part of the design. The wedge now implements a **true fallback**: bank01 shadow-copies every typed line and installs a hook on BASIC's own `IERROR` vector; when BASIC itself can't parse a direct-mode line, that hook forwards the typed text to the cloud chatbot instead of printing `?SYNTAX ERROR` (§8/§9). This is a **diagnostic build** — it fires on *any* direct-mode error (not yet narrowed to just `SYNTAX`) because the exact BASIC error-table index needs hardware confirmation first; it prints that index so the real value can be locked in next. This file is written to be portable — everything needed to understand the cartridge, the mechanism, and how to add more commands is here, independent of any prior chat history.

## 1. What this project is

`rr38p-tmp12reu.bin` is a 65536-byte, 8-bank (8192 bytes/bank) ROM image for a Retro Replay cartridge, running a custom "CyberPunX" firmware build (freeze menu, machine-code monitor, flash utility, Turbo Macro Pro assembler+REU, and a BASIC toolkit with a resident command wedge). The goal of this project is to add custom commands to that resident wedge — starting with `HONDANI` (increments border color, as a proof of concept) and going forward, a fuller set of commands ("hondani shell") that should invoke logic to be developed in a separate project/repository.

### Files in this set
- `rr38p-tmp12reu.bin` — the **original, unmodified** stock ROM dump. Kept as a reference/diff baseline — do not edit.
- `rr38p-tmp12reu.bank00.asm` … `bank07.asm` — Kick Assembler source for each 8KB bank, disassembled from the stock ROM. **These are the live source of truth** — edit these, then rebuild.
- `rr38p-tmp12reu.bank00.md` … `bank07.md` / `rr38p-tmp12reu.analysis.md` — auto-generated symbol tables/notes from the original disassembly pass. Background reference only, not updated as the source evolves.
- `build.sh` — rebuilds all 8 banks with Kick Assembler, concatenates them, and packages a `.crt`. See §5 for its quirks.
- `build/rr38p-tmp12reu.rebuilt.bin` / `.crt` — build output (gitignored-style scratch, regenerate as needed).

## 2. How the cartridge's own wedge works (confirmed by tracing, not guessed)

There is **no classic IGONE-vector wedge** (`$0308/$0309`, the textbook 1541-DOS-Wedge mechanism) in this firmware. Instead, bank01 implements a **generic keyword scanner hooked through IMAIN**:

- Bank01's cold start patches `$0302/$0303` (**IMAIN**, BASIC's main-loop soft vector) to `$DE8F` — a trampoline in the cartridge's I/O2-mapped RAM. Every time BASIC returns to its main loop (i.e. after every submitted line), execution routes through `$DE8F` into `bank01_api_02` (ROM address `$83D0`).
- `bank01_api_02` gates on a flag at `$0313`, then (if set) calls down into `bank01_sub_83e9`, which fetches the current character via CHRGET (`$0073`) and, for a non-empty line, falls into the scanner at `bank01_sub_8407` (ROM `$8407`).
- The scanner walks a keyword table at `$8507`, comparing typed input (via `$7A/$7B` TXTPTR, indirect-indexed) against each stored word. Words are PETSCII with **bit 7 set on the last character** as an end-of-word marker (same convention BASIC ROM's own tokenizer uses). On full match, `word_index * 2` indexes a parallel jump table at `$8572` to find the handler address.
- **Abbreviation quirk:** once the first 3 characters of a word match, the scanner stops requiring an exact match and just swallows further letters (`>= 'A'`) unconditionally. E.g. the stored word `TASS` also fires for `TASX`/`TASM`/etc. — this is how typing `TASM` launches Turbo Macro Pro (canonical command is `TASS`).

### Full existing command table (bank01, `$8507`–`$8571`, cross-referenced against jump table at `$8572`)

| # | Trigger | Handler | # | Trigger | Handler |
|---|---|---|---|---|---|
| 0 | `/` | `$8273` | 14 | `COPY` | `$82EA` |
| 1 | `$` | `$82D1` | 15 | `BOOT` | `$84AE` |
| 2 | `%` | `$8248` | 16 | `ZAP` | `$84C7` |
| 3 | `^` | `$8261` | 17 | `BACKUP` | `$82C9` |
| 4 | `\` | `$9D1C` | 18 | `PLIST"` | `$85AC` |
| 5 | `@` | `$829D` | 19 | `SLIST"` | `$85A9` |
| 6 | `&` | `$8276` | 20 | `ON` | `$82F7` |
| 7 | `OLD` | `$821E` | 21 | `OFF` | `$82F4` |
| 8 | `DELETE` | `$81FD` | 22 | `FIND` | `$80E0` |
| 9 | `LINESAVE` | `$8176` | 23 | `RENUM` | `$8163` |
| 10 | `MERGE` | `$8617` | 24 | `INFO` | `$810C` |
| 11 | `AUTO` | `$86D4` | 25 | `TASS` (matches "TASM") | `$80E6` |
| 12 | `MONITOR` | `$8997` | 26 | `SSGET` | `$80EE` |
| 13 | `APPEND` | `$822E` | 27 | `TOOL` | `$8104` |

Bank-by-bank roles (for orientation, not directly relevant to the wedge):

| Bank | Cold/Warm | Role |
|---|---|---|
| 00 | `$8009/$800C` | Freeze/reset menu ("CYBERPUNX RETRO REPLAY") |
| 01 | `$8009/$800C` | **BASIC toolkit + wedge (this is the one we edit)** — also hooks `$0330/$0331`/`$0332/$0333` (ILOAD/ISAVE) for fast load/save |
| 02 | `$8036/$8039` (different!) | Unrelated bundled frozen-game payload, not part of shared framework |
| 03 | `$8009/$800C` | Machine-code monitor/debugger, F-key driven menu |
| 04 | `$8009/$800C` | Small glue bank |
| 05 | `$8009/$800C` | Flash utility ("FLASH UTIL V3.8P") |
| 06/07 | `$8009/$800C` | Turbo Macro Pro + REU assembler |

Cross-bank calls (from any bank) route through fixed trampolines living in `$DE00-$DEFF` (cartridge I/O2 RAM) — e.g. `$DE3F`, `$DE41`, `$DE8F`, `$DE97`, `$DE9D`, `$DEA9`, `$DEBA`. This lets code call "whatever the currently active bank's routine is" via a fixed address, independent of which 8K bank is paged into `$8000-$9FFF`.

## 3. Why we integrate into bank01 instead of hooking our own vector

**Tried and empirically ruled out:** installing an independent hook on IGONE (`$0308/$0309`) from a standalone program. Confirmed via live memory dumps (VICE monitor) that bank01's own housekeeping resets `$0308/$0309` back to the KERNAL/BASIC stock default (`$A7E4`) on **every single line processed**, including before any user input is even evaluated. An independently-installed IGONE hook cannot survive on this cartridge — it gets wiped before it's ever useful. Do not retry this approach.

The only mechanism that reliably survives is being part of bank01's own scan path itself (since that *is* the thing doing the resetting). This requires editing bank01's ROM source directly and rebuilding — which is exactly what `build.sh` + Kick Assembler lets us do properly.

## 4. Working technique: adding a command via ROM source edit

### The constraint that shapes everything

Bank01's disassembly uses **raw hardcoded hex addresses** for indexed table lookups (e.g. `lda $8507,x`, `lda $8572,x` — not symbolic labels), even though branches/jumps elsewhere mostly use symbols. This means: **never change the total byte length of anything before these references, or any code between them and the file's end** — doing so silently invalidates every hardcoded address after the insertion point, across a ~2500-line file that hasn't been fully audited for every such reference. Two safe patterns only:

1. **Same-byte-count instruction swaps** — replace N bytes of existing code with a different N bytes (e.g. a 3-byte `tax`/`bne` pair with a 3-byte `jmp`). Nothing shifts.
2. **Fill confirmed-zero padding regions** with new code, keeping the *total byte count of the replaced block identical* (pad the remainder with `.byte $00` rows to match). Locate real free space via a raw byte scan of the `.bin` for long runs of `$00` (or `$20`/`$A4`/etc. in other banks) — **not** by trusting "reachable bytes" from a naive disassembler pass, which undercounts free space in banks with complex control flow (e.g. banks 6/7's Turbo Macro Pro).

### The HONDANI implementation (done, built, byte-diff-verified)

1. **Hook point:** `bank01_sub_83e9` (part of the path from `bank01_api_02` → scanner), specifically the 3 bytes `tax` / `bne bank01_sub_8407` at ROM `$83FD`-ish (right after `jsr $0073` / CHRGET). Replaced with `jmp hondani_check` — also exactly 3 bytes. This runs **before** the cartridge's own table scan (`bank01_sub_8407`) even starts.
2. **Free space used:** the confirmed 156-byte zero-padding run at `$9D74`-`$9E0F` in bank01 (found via raw `.bin` byte scan, not disassembler reachability). `hondani_check` occupies the first 64 bytes (`$9D74`-`$9DB3`); the `HONDANI` string data (`hword`) sits at `$9DAD`-`$9DB3`; **92 bytes remain free** at `$9DB4`-`$9E0F` for further commands.
3. **Correctness requirement:** `hondani_check` must exactly replicate the original `tax`/`bne bank01_sub_8407` semantics for every input that ISN'T our new command, since bank01_sub_8407 depends on the **carry flag** left by CHRGET (tests it immediately via `bcs`) and on `X` holding the typed character (for the empty-line case, `stx $0258`). Solved with `php`/`plp` bracketing around our own comparison logic, so flags are restored byte-for-byte before falling through to the untouched original scanner on any non-match. This is the pattern to replicate for additional commands — see §6.
4. **Return path on match:** advance TXTPTR past the matched word, then `jmp ($0302)` (indirect through IMAIN) to cleanly re-enter BASIC's main loop. This is deliberately different from the existing table's own return convention (`bank01_sub_848d` uses an elaborate RTS-trick through `$0073`/CHRGET) — our injected code isn't part of that call-depth, so the simpler IMAIN re-entry is correct and safe.

Exact addresses in the current build (`build/rr38p-tmp12reu.rebuilt.bin`), verified by direct byte search, not estimated:
- `jmp hondani_check` opcode: ROM `$83FF` (bank01)
- `hondani_check` entry: ROM `$9D74` (bank01)
- `hword` (`"HONDANI"` bytes): ROM `$9DAD` (bank01)

Full current source of the routine lives in `rr38p-tmp12reu.bank01.asm` at the `hondani_check:` label (search for it) — read that directly rather than relying on this summary if reimplementing/extending.

**Update:** `hmatched`'s body no longer does `inc $d020` inline — it now relocates a small stub (`xb_stub`) to RAM and calls out to bank05 to do it. See §6a for why and how. This grew the pocket's used footprint from 64 to 93 bytes, leaving **63 bytes free** at the (now later) end of the padding run, still ending at `$9E0F`.

## 5. Build process

```
./build.sh
```

Assembles all 8 banks with Kick Assembler, concatenates them, and **compares the result against the original `rr38p-tmp12reu.bin`**. If they differ (which they will, intentionally, once you've added commands), the script prints `MISMATCH` and exits 1 **before** packaging the `.crt`. This is a safety check for verifying a null round-trip, not a build failure — when you've deliberately changed the ROM, package manually:

```
cartconv -t rr -i build/rr38p-tmp12reu.rebuilt.bin -o build/rr38p-tmp12reu.rebuilt.crt -n "CYBERPUNX RETRO REPLAY"
```

**Always verify the diff is localized** after a change, before flashing/loading:

```python
orig = open('rr38p-tmp12reu.bin','rb').read()
new = open('build/rr38p-tmp12reu.rebuilt.bin','rb').read()
diffs = [i for i in range(len(orig)) if orig[i] != new[i]]
print(len(diffs), "bytes differ; banks touched:", sorted(set(d//0x2000 for d in diffs)))
```

For the original `HONDANI`-inline-in-bank01 change: 66 bytes differed, confined entirely to bank01. After moving the command body to bank05 (§6a): 95 bytes differ total — 91 in bank01 (file range `$83FF`-`$9DD0`, i.e. the hook plus the grown `hondani_check`/`xb_stub`), 4 in bank05 (`$9012`-`$9015`, the new `inc $d020`/`rts`). The extra 29 bytes vs. the original 66 is exactly the copy-loop growth (+11) plus the new `xb_stub` data (+18) — matches by construction, and bytes from `$9E10` onward in bank01 (past the free pocket) are confirmed byte-identical to stock, proving nothing shifted. If a future edit shows differences in banks you didn't intend to touch, a diff that doesn't match this kind of by-construction arithmetic, or changes past a pocket's boundary, stop and investigate before flashing.

## 6. How to add more commands (the "hondani shell" path forward)

Don't hunt for a new hook point per command — reuse the one already wired in (`hondani_check`, entered before the cartridge's own scanner). Generalize it into a small dispatcher:

1. After the existing `HONDANI` check's `nothondani` fails, instead of immediately falling through to `plp`/`jmp bank01_sub_8407`, add another compare block for the next keyword before that fallback — same pattern (`ldy #0` / compare loop / boundary check / branch to its own `matched` label). Keep the **final** fallback (`plp` + `jmp bank01_sub_8407`) as the last thing tried, after all custom keywords have had a chance.
2. Each new "matched" handler can do its own thing directly, or — more likely useful for a "shell" — call out to logic living in bank05 via the `xb_stub` mechanism (§6a). Keep growing small dispatcher logic itself in bank01's pocket (mind the byte budget — check with the free-space scan technique above, don't just assume); put the actual command *bodies* in bank05, which now has ~1200+ bytes of confirmed-free space across several pockets (see §6a) since its stock flash-utility role isn't needed anymore.
3. **Every time**, before flashing: rebuild, run the diff-localization check (§5), and confirm the touched byte count/region matches what you intended. This is the guardrail against silently breaking the raw-hex-address references described in §4.
4. Keep the abbreviation-matching convention in mind if you want it (3-letters-then-swallow-rest, matching the cartridge's own style) — our current `HONDANI` check requires an exact 7-letter match plus a non-letter boundary; it does not implement the abbreviation quirk. Decide per-command whether that's desired.

## 6a. Cross-bank calling: the `xb_stub` mechanism (bank01 → bank05)

**Why this exists:** `hondani_check` runs while bank01 is paged into `$8000-$9FFF`. To run code that lives in bank05 instead, something has to write bank05's select value to `$DE00` — but the instruction that does that write, and everything after it up to the point where we jump into bank05, is *itself* sitting in the very `$8000-$9FFF` window about to be repaged. If that switching code lived in bank01's ROM at, say, `$9D90`, the CPU would fetch the `STA $DE00` fine, but the *next* instruction fetch (still at an address in `$8000-$9FFF`) would now come from bank05's ROM instead of bank01's — the code silently falls into whatever garbage bytes bank05 has at that same address. (This is exactly why the stock firmware's own freeze/NMI handler code near `$9EB0-$9EF0` is byte-identical across every bank — same trick, solved by making the switching code identical wherever it lands.)

Our solution: don't solve it by duplication — relocate the switching code to real C64 RAM at **`$C000-$CFFF`** (specifically `$CF00`), which is untouched by any `$8000-$9FFF`/`$A000-$BFFF` cartridge banking in any standard C64 memory configuration. `hondani_check`'s `hmatched` path copies an 18-byte relocatable stub (`xb_stub`, defined right after `hword` in bank01's pocket) to `$CF00` on every match (cheap, idempotent, no install-once bookkeeping needed), then `jsr $cf00`. The stub itself:
```
sei
pha
lda #$88        ; bank05 select value
sta $de00
jsr $9012       ; bank05 entry point
lda #$08        ; bank01 select value -- restore
sta $de00
pla
cli
rts
```
Because this code runs from `$CF00` (never repaged), the `jsr $9012` executes correctly the instant `$8000-$9FFF` shows bank05's ROM, and when bank05's routine does `rts`, control returns to the still-resident `$CF00` code to switch back. `xb_stub` has no internal branches/relative addressing, so it's safe to relocate byte-for-byte.

**The `$DE00` bank-select bit layout — confirmed against official hardware documentation.** Every one of the 8 banks embeds its own "which bank am I" marker byte in its copy of the shared freeze/NMI trampoline footer (`$9EED` in the disassembly). Reading all 8 gave a self-consistent decode which was later checked against the VICE/hardware reference for cartridge type 36 ("Retro Replay") and matches it exactly — see §7 for the full register documentation and the cross-check. Summary:
| Bank | Marker | Binary | Bank number encoding |
|---|---|---|---|
| 0 | `$00` | `00000000` | bit3=0,bit4=0,bit7=0 |
| 1 | `$08` | `00001000` | bit3=1 |
| 2 | `$10` | `00010000` | bit4=1 |
| 3 | `$18` | `00011000` | bit3=1,bit4=1 |
| 4 | `$80` | `10000000` | bit7=1 |
| 5 | `$88` | `10001000` | bit7=1,bit3=1 |
| 6 | `$90` | `10010000` | bit7=1,bit4=1 |
| 7 | `$98` | `10011000` | bit7=1,bit4=1,bit3=1 |

i.e. **bank number = bit3 (LSB) + bit4×2 + bit7×4**. Per §7, these are documented as "bank-address 13/14/15" — exactly the three bits that select an 8KiB (`2^13`-byte) bank within the cart's ROM/RAM. Bits 0/1 (GAME/EXROM) are left `0` in every marker, which per §7 means GAME deasserted + EXROM asserted — the standard "8K game" mapping (ROM only at `$8000-$9FFF`), matching this cart's own CRT header defaults. Bit 2 (write-disable/decartify) and bit 5 (ROM-vs-RAM select) are `0` — cart stays enabled, ROM (not RAM) is what's being banked. Bit 6 (freeze-exit latch) is irrelevant outside of exiting a freeze. All of this is now **confirmed by the vendor/VICE documentation, not just cross-referenced ROM inference.**

**Bank05 side:** `hondani_shell_entry` (`inc $d020` / `rts`, 4 bytes) lives at ROM `$9012` in bank05, inside a confirmed-zero 494-byte free run at `$9012-$91FF` (found via the same raw-byte-scan technique as §4, freshly re-scanned — not the same numbers as an earlier, less precise pass). Bank05's cold-start vector table, jump table, and all other existing code are **untouched** — this is a minimal, reversible edit, not a wholesale bank takeover. Other confirmed-free pockets in bank05 for future shell commands: `$8022-$8100` (222 bytes), `$9016-$91FF` (490 bytes still free after this edit), `$92D0-$9300` (48 bytes), `$9E00-$9E9D` (157 bytes), `$9F58-$9FFF` (168 bytes) — roughly 1100+ bytes total without touching anything live. If more is ever needed, bank05's stock flash-utility code itself (now unneeded per user direction) is a large additional reserve, but hasn't been touched yet.

**Extending this for more commands:** the `xb_stub` template hardcodes both the bank05 entry address (`$9012`) and the "return to bank01" value (`$08`) — it's a fixed single-purpose call, not yet a generic "call any address in any bank" primitive. Adding a second bank05-backed command means either (a) adding a second small fixed stub the same way, or (b) generalizing `xb_stub` to accept a target address (e.g. via a zero-page vector at `$FB`/`$FC` and an indirect `jmp ($00fb)`, since self-modifying the stub's own operand bytes won't work once it's sitting in RAM — actually it *would* work there since `$CF00` is RAM, unlike the ROM template; either approach is viable). Worth doing once there are 2+ bank05 commands to justify it.

## 7. Reference: official Retro Replay (`$DE00`/`$DE01`) register documentation

This is the authoritative hardware reference (VICE cartridge type 36, "Retro Replay") that confirms the bank-select bit layout derived empirically in §6a. Kept here verbatim (condensed) so this file stays self-contained.

Cartridge config for this ROM: 64KiB (8 banks of 8KiB), **EXROM active/lo (0)**, **GAME inactive/hi (1)**, load address `$8000-$9FFF` — i.e. standard "8K game" mapping, ROM only at `$8000-$9FFF`.

Two write-only registers (`$DE00`, `$DE01`); reading either returns a third, separate status register. `$DE00` resets to `$00` on a hard reset (unless flash-mode jumper is set, then `$02`).

**`$DE00` (write):**
| bit | meaning |
|---|---|
| 0 | GAME line: 1=assert, 0=deassert |
| 1 | EXROM line: 0=assert, 1=deassert |
| 2 | 1 = disable further register writes, force standard C64 memory map (as if no cart installed) |
| 3 | bank-address 13 (ROM/RAM banking) |
| 4 | bank-address 14 (ROM/RAM banking) |
| 5 | 0=ROM, 1=RAM |
| 6 | write 1 once after a successful freeze to restore normal memory map + re-enable bits 0/1; no effect otherwise |
| 7 | bank-address 15 (ROM banking) |

**`$DE01` (write, extended control register):** if not in flash mode, bits 1/2/6 are write-once.
| bit | meaning |
|---|---|
| 0 | enable clockport connector |
| 1 | AllowBank — 1 allows RAM banking in the `$DF00`/`$DE02` mirror area |
| 2 | NoFreeze — 1 disables the freeze button |
| 3 | bank-address 13 (mirror of `$DE00` bit 3) |
| 4 | bank-address 14 (mirror of `$DE00` bit 4) |
| 5 | bank-address 16 (ROM, flash mode only) |
| 6 | REUcomp — 0=standard memory map, 1=REU-compatible memory map |
| 7 | bank-address 15 (mirror of `$DE00` bit 7) |

**Status register (read from either `$DE00` or `$DE01`):**
| bit | meaning |
|---|---|
| 0 | 1=flash-mode jumper set |
| 1 | feedback of AllowBank |
| 2 | 1=freeze button pressed |
| 3 | feedback of banking bit 13 |
| 4 | feedback of banking bit 14 |
| 5 | feedback of banking bit 16 |
| 6 | 1=REU-compatible memory map active |
| 7 | feedback of banking bit 15 |

**Memory maps:**
- **Standard** (what this project uses) — `$DE00`/`$DE01` active; `$DF00-$DFFF` mirrors the last page of the selected bank (ROM or RAM per bit 5); RAM accessible only at `$8000-$9FFF`; ROM maps to `$8000`, `$A000`, or `$E000` depending on GAME/EXROM. If AllowBank is unset, `$DF00-$DFFF` always shows RAM bank 0 (back-compat with older cart images); doesn't affect the ROM mirror there.
- **Freeze** — ROM forced to `$E000-$FFFF`, bank 0, right after freeze; bits 0/1 of `$DE00` have no effect on GAME/EXROM while frozen; should be exited ASAP (write bit 6) since C64 RAM at `$E000` isn't available and GAME/EXROM aren't under program control in this mode.
- **REU-compatible** — same as standard, except `$DE02-$DEFF` mirrors `$9E02-$9EFF` of the selected bank instead of `$DF00-$DFFF`, leaving `$DF00` free for a real 1764 REU.

**Cross-check against this project's usage (§6a):** `xb_stub` writes only bits 3/4/7 (bank-address bits) with bits 0/1/2/5/6 always `0`. Per this table that means: GAME deasserted + EXROM asserted (standard 8K game map, matches the CRT header), registers stay enabled (bit 2=0), ROM selected not RAM (bit 5=0), no freeze-related effect (bit 6=0, not in a freeze). This is exactly the "just switch the ROM bank, leave everything else in its normal running state" operation `xb_stub` is meant to perform — confirmed correct, no implementation changes needed. Also confirms `$C000-$CFFF` (where `xb_stub` relocates itself to survive the bank switch) is never touched by any of the three memory maps above, so it's safe under all of them, not just the one state that happened to be inspected empirically.

## 8. Chatbot fallback command (in progress)

**Goal:** port the "unrecognized command → send to HDN Cloud" behavior from the standalone `hdnsh` project (`src/cmd_unknown.asm`, `src/hdncloud.asm`, `src/c64u_network.asm`, `src/c64u_common.asm` in the repo root, *not* this `wedge/` directory) into the wedge cartridge. User's own natural-language messages, typed at the BASIC prompt, should be forwarded to the same cloud chatbot backend (`cloud/` in the repo root) as free text.

**Key difference from the old `hdnsh` context:** the original code was flashed as a **replacement BASIC ROM** (`Makefile`'s `run-c64u` target FTPs `hdnsh.bin` to `Flash/roms/` and reboots; `run-hdn-vice` uses VICE's `-basic` flag) — it owned the whole machine and had its own command parser, so "unrecognized" simply meant "didn't match any entry in my own command table." Here, stock C64 BASIC is still fully alive underneath the wedge, so "unrecognized" has to mean something more specific: a line that's neither valid BASIC nor one of our own wedge keywords. **Decision (user, 2026-07-03): implement this as a true fallback**, not a new dedicated keyword — i.e., eventually hook the point where BASIC itself would otherwise print `?SYNTAX ERROR`, not another entry in `hondani_check`'s pre-scan table. That hook point hasn't been built yet (see open items below); bank01 doesn't touch the standard `IERROR` vector (`$0300/$0301`) anywhere in its own housekeeping, unlike `IGONE` (§3), so it's a promising candidate — untested so far.

**Decision (user): reuse the existing wire protocol as-is.** Same `HDNCLD_CMD_*` opcodes, same `$FE` packet magic byte, same TCP port 6464, same `cloud/` Python server — no server-side changes planned. The C64 side talks to the cloud over TCP via the **Ultimate Command Interface** at `$DF1C-$DF1F` (`CONTROL_REG`/`STATUS_REG`=`$DF1C`, `CMD_DATA_REG`=`$DF1D`, `RESP_DATA_REG`=`$DF1E`, `STATUS_DATA_REG`=`$DF1F`) — a documented Ultimate64/C64U hardware feature, unrelated to and separate from this cart's own `$DE00`/`$DE01` registers (§7).

**The one big open risk, flagged by the user as unverified: does `$DF1C-$DF1F` work correctly while this RR-style cart is actively banking?** The old `hdnsh` never had to find out, since it replaced BASIC ROM outright and had no competing cartridge claiming `$DF00-$DFFF`. Our wedge cart, per §7, claims that entire address range for its own I/O3 mirror by default (`$DF00-$DFFF` shows the last page of the selected ROM/RAM bank). Whether Ultimate's FPGA gives its own command interface priority at those 3 specific addresses regardless of cartridge I/O3 claims is *believed* likely (Ultimate's own source comment in `src/c64u_common.asm` calls these "Ultimate cartridge registers," implying they're meant to be reachable from within cart contexts) but has **not been confirmed** on this specific hardware/firmware combination. This is the reason for the minimal test below, rather than porting the whole fallback mechanism sight-unseen.

**RESOLVED (user tested on hardware, 2026-07-03): `$DF1C-$DF1F` works correctly while bank05 is paged in via the wedge's own bank-switch.** Typing `HONDANI` flashed the border green and printed `?ERROR` on screen; the cloud server log showed `Received: 'ping'` followed by `No handler found for the request.`. This is the *correct* server response, not a failure — `request_dispatcher.py` only routes text starting with `"I:"` to `ChatHandler` (see `cloud/handlers/chat_handler.py`'s `can_handle`); anything else falls through every handler and gets the literal string `"?ERROR"` (`cloud/request_dispatcher.py`, end of `dispatch()`). Since the connect → write → server-received-and-logged-it → dispatch → response → C64-read-and-printed chain completed end-to-end while bank05 was actively paged in, the hardware risk this whole test existed to check is now closed. **New fact this surfaced for Step 2:** to actually reach the chat/LLM handler, the forwarded text needs to be prefixed with `"I:"` — that's the server's existing routing convention, and the C64 side will need to prepend it (see Step 2 item 2 below), not just forward the raw typed line.

### Step 1 (done, confirmed on hardware 2026-07-03): minimal cloud round-trip test

Rather than build the full IERROR-hook fallback blind, `bank05`'s `hondani_shell_entry` (still reached the exact same way as the already-confirmed-working `HONDANI` command, via bank01's `xb_stub` — see §6a) was rewritten from `inc $d020` into a **self-contained cloud connectivity test**, isolating the one genuinely unverified variable (`$DF1C` reachability) from everything else:
- Connects to the cloud server at a **hardcoded test address (`192.168.1.2:6464`, placeholder — confirm/update `net_test_host` in `rr38p-tmp12reu.bank05.asm` if your `cloud_server.py` runs elsewhere)** via `NET_CMD_TCP_SOCKET_CONNECT`.
- Sends a fixed `TEXT_INPUT` ($02) packet for console 0 containing the literal text `"PING"`.
- Streams whatever comes back straight to the screen via `CHROUT` ($FFD2) — even a "processing error" reply from the LLM dispatcher counts as success here, since the point is proving the wire works, not exercising the chatbot itself.
- Closes the socket.
- Flashes the border **green ($05)** if every protocol step (connect/write/read/close) completed without the Ultimate interface reporting an error, **red ($02)** if any step failed at the protocol level.

Implementation notes:
- Uses **no zero page at all** — all scratch state (`socket_id`, two status bytes) lives in RAM at `$CF20-$CF22`, right after `xb_stub`'s own `$CF00-$CF11`, both safely outside any bank-switched window (§6a). This sidesteps a real open question (see below) about whether the old `hdnsh`'s zero-page choices ($9B/$9C, $C1/$C2, etc. — see `src/constants.asm`) are actually safe to reuse while stock BASIC/KERNAL are alive; that question is deferred, not answered, by avoiding zero page entirely for this test.
- The protocol logic (`net_wait_idle`, `net_wait_not_busy`, `net_push_and_check`, `net_drain_data`, `net_print_data`, `net_read_status`, `net_accept`) is a fairly literal, self-contained port of `src/c64u_common.asm`'s `wait_idle`/`wait_not_busy`/`uii_readdata`/`uii_readstatus`/`uii_accept`/`uii_success`, with the dead `tay`/`tya` round-trip in the original `wait_not_busy` dropped and the callback-pointer indirection (`JSR_INDIRECT_ADDR`) replaced by a direct `jsr $ffd2` since this test always wants CHROUT.
- Lives entirely in the same confirmed-free 494-byte pocket at `$9012-$91FF` in bank05 that `hondani_shell_entry` already occupied. Verified via the same diff-localization technique as before after every change: `$9200` onward in bank05 stays byte-identical to stock — nothing shifted.
- **Known rough edge, not yet addressed:** `xb_stub` wraps the entire call to bank05 in `sei`/`cli` (§6a), so interrupts are disabled for the *entire* network round trip, however long that takes. Harmless to correctness (nothing here depends on IRQ timing) but the machine will appear frozen — no blinking cursor, no keyboard buffer updates — for the duration. Fine for a one-shot hardware test; worth revisiting if/when this becomes the real fallback path, since a slow/unresponsive cloud server would freeze the machine for that whole time.

**Bug #1 found and fixed (2026-07-03) after the first real-chat test:** with `"PING"` (which just got the short literal `"?ERROR"` back), the naive single-shot read worked. Switching the test message to `"I:HELLO"` to trigger a real LLM reply (~70+ characters, multi-line) surfaced a real protocol bug: only **two garbage-looking characters (`$5E`)** printed instead of the actual reply. Root cause: a single `SOCKET_READ` command only drains whatever's queued *at that instant* — it does not wait for or guarantee the full response. The original `src/hdncloud.asm`'s `send_cmd_to_hdn_cloud` handles this with a loop (`!repeat_until_00data:` ... `jsr uii_socketread` ... `bcs !repeat_until_00data-`) that **reissues `SOCKET_READ` until the status queue reports `"00"` (fully drained)** — our first cut of `hondani_shell_entry` skipped that loop entirely and only ever issued one read, so it silently only saw the first (tiny, partial) chunk. Fixed by wrapping the read/print/status/accept sequence in the same kind of loop.

**Bug #2 found and fixed (2026-07-03), same test rerun after bug #1's fix:** border still green (protocol-level success), but now **40 repeated `$5E` characters** and no real text — worse-looking, but actually a more precise clue. `$5E` is `KEY_ARROW_UP` (`src/constants.asm`), and that file also documents (but `src/c64u_common.asm`'s actual `uii_readdata_network` never implements!) a 3-state response framing: `SOCKET_WRITTEN` → first byte is a marker (documented as expecting `$13`), `SOCKET_AFTER_13` → "ignore all `$5e` bytes until next other byte", `SOCKET_READING` → real content follows. Implemented that 3-state machine (`SOCKET_WRITTEN`/`SOCKET_AFTER_13`/`SOCKET_READING` in `cf_socket_status`).

**Bug #3 found (2026-07-03), rerun after bug #2's fix:** partial progress — real content **did** print this time (`Hello Honza! ... What would ... today?`), proving bug #1's retry loop is doing its job. But it was still preceded by **41 unfiltered `$5E` characters and a stray leading `:`** — the 3-state swallow logic did not swallow anything, despite the code looking correct on review (traced through every branch by hand, found nothing wrong on paper). Rather than keep guessing at the exact cause blind (no hardware access to single-step this), **simplified the approach to be more robust regardless of the precise mechanism**: instead of tracking 3 distinct states, `net_read_and_print` now just discards `$13` and `$5E` bytes *anywhere* in the leading run (in any order, any count) via a single `cf_seen_content` flag, and prints unconditionally once the first byte that's neither has been seen. This is a strictly weaker assumption than the 3-state version (doesn't care about exact marker-then-filler ordering) and is simpler code, so less likely to hide the same kind of bug. **Still not hardware-verified** — if `$5E`/`:` still leak through on the next test, the next step is byte-level diagnostics (e.g. printing each response byte's hex value instead of the character) rather than another guess at the framing shape.

**Also addressed in this pass, per user request (2026-07-03):**
- **Slow server responses:** the retry budget is now a 16-bit counter (`cf_retries_lo`/`cf_retries_hi`, ~8000 iterations) instead of a single-byte cap of 255, giving much more headroom for a slow LLM reply before giving up.
- **Animated "waiting" indicator:** `net_spin` prints a small 2-frame blinking indicator (`.`/`:`, overwriting itself in place via cursor-left `$9D`).
- `net_spin` (and its 2-byte `spin_chars` table) didn't fit in the `$9012-$91FF` pocket alongside everything else — it's relocated to a second, separate confirmed-free pocket at `$9E00-$9E9C` in bank05 (157 bytes, previously untouched).

**Bug #4 found and fixed (2026-07-03), rerun after bug #3's fix:** big step forward — the `$5E` filler-discard now worked cleanly (exactly 40, matching between two separate runs), and the real reply text printed correctly after it. But in both runs, there was still **exactly one stray byte** between the filler and the real text — value `'3'` (`$33`) in the first run, `'W'` (`$57`) in the second. Since the value *varies between otherwise-identical requests* while the surrounding filler count and reply text stayed constant, this is not chat content — it's a one-byte length/sequence field in the protocol, consistent with the `uii_readdata_network` code's own (half-finished) comment about a length byte. Fixed: `net_read_and_print` now discards this one byte too (transitions to "print everything" state *without* printing the byte that triggered the transition) instead of printing it. Still not hardware-verified.

**Also, since neither hardware test showed the "waiting" indicator at all:** the LLM's ~1 second latency is most likely being absorbed inside `net_wait_not_busy`'s busy-poll for the `SOCKET_READ` command itself (the Ultimate command interface reports "busy" until the reply is actually ready), not between separate `SOCKET_READ` retries where `net_spin` was originally wired in. Added `net_wait_not_busy_spin` — same busy-wait, but advances the spinner every 256 poll iterations — and switched the `SOCKET_READ` step to use it instead of the plain `net_wait_not_busy` (connect/write/close keep the plain, silent version, since those are normally fast/local). This is the more likely place to actually see the animation during a real wait. Also relocated to the `$9E00` pocket alongside `net_spin` — didn't fit in `$9012` either.

**Retested (2026-07-03) after bug #4's fix — the spinner worked (a `.` briefly visible before each `$5E`, confirming the busy-wait relocation was right), and filler-discard still worked cleanly (37 `$5E`, varying run to run as expected for network-timing-dependent retry counts). But the one-byte field (this time `'G'`) apparently was NOT discarded — described as visibly printed before the real reply text.** Four rounds of fixes based on visual descriptions have each found something real but never fully converged, and by this point it's more efficient to get hard data than to keep guessing:
- The filler-byte count varying every run (40, 41, 40, 37) is expected — it's a function of network/LLM timing (more retries needed some runs than others), not a bug.
- The one "stray" byte's value varying (`'3'`, `'W'`, `'G'`) is *consistent* with a length/sequence field as hypothesized — but whether it's discarded correctly seems to vary too, which points at something more structural than a simple off-by-one: e.g. the response might be split across more than one data-bearing `SOCKET_READ` chunk in some runs but not others, each with its *own* leading field, which a single "discard once globally" flag (as currently implemented) wouldn't handle correctly.
- Rather than guess a 5th time, **`net_read_and_print` was temporarily replaced with an unfiltered hex dump** (`net_print_hex_byte`/`net_print_hex_nibble`): every raw byte from `UII_RESP` printed as two hex digits plus a space, no interpretation at all. The retry loop, 16-bit budget, and spinner were unchanged.

**Response framing CONFIRMED (2026-07-03) from a real hardware hex-dump screenshot — this settles it, no more guessing needed:**
```
[N x $ff idle/filler bytes -- N varies with network/LLM timing]
[2-byte little-endian content length -- e.g. "47 00" = 0x0047 = 71]
[exactly that many content bytes]
```
Verified byte-count-exact: the dump showed `47 00` (length 71) followed by *exactly* 71 bytes that decode to `"Hello Honza!\r\rHow can I help you with your C64 and Hondani Shell today?"` — capital letters as PETSCII `$C1-$DA` (high bit set), lowercase as `$41-$5A`, both printable via `CHROUT` with no further translation needed (they displayed as all-caps only because the test screen was in default/uppercase charset mode — the bytes themselves are correct mixed-case PETSCII). This also retroactively explains every earlier round's symptoms: the varying filler count was always just timing-dependent retry count, and the "one stray byte" from earlier rounds (`'3'`/`'W'`/`'G'`) was actually the *low* byte of this same 2-byte length field — the earlier `$5E`/`$13` marker theory was simply wrong (likely a misreading of an unusual glyph before hex ground truth was available).

`net_read_and_print` now implements this for real: `cf_state` (0=discarding `$ff` filler, first non-`$ff` byte is length-lo; 1=that byte was length-lo, next is length-hi; 2=printing content, counting `cf_msglen_lo`/`cf_msglen_hi` down to zero; 3=content fully printed, discard anything else this response) plus the 16-bit `cf_msglen_lo`/`cf_msglen_hi` countdown. The outer read loop in `hondani_shell_entry` also now exits early once `cf_state` reaches 3 (message fully printed), instead of always waiting for the status queue's `"00"` — no reason to keep polling once the known-length content is fully drained. `net_read_and_print` itself didn't fit in the `$9012` pocket once fully built out — relocated to the `$9E00` pocket alongside `net_spin`/`net_wait_not_busy_spin`. **Not yet re-tested on hardware** — but this is now a confirmed protocol implementation, not another guess, so the expectation bar is "should just work" rather than "let's see what breaks next."

### Step 2 (not started): the real IERROR-based fallback

Now that step 1 has confirmed `$DF1C` works from within the bank-switched wedge context, the remaining work is:
1. Find and hook the actual point where BASIC decides a typed line is unrecognized — likely the `IERROR` vector (`$0300/$0301`), following the same "find a legitimate, purpose-built vector, don't fight the ROM's own housekeeping" principle that made `IMAIN` work over `IGONE` (§3). Needs verification that bank01 (or any other bank) doesn't reset `IERROR` the way it resets `IGONE`, and that hooking it doesn't break BASIC's own normal error reporting for cases that really are just typos.
2. Capture the actual typed line and send it as the `TEXT_INPUT` payload **prefixed with `"I:"`** — confirmed by hardware testing that `request_dispatcher.py`'s `ChatHandler` only claims text starting with `"I:"` (case-insensitive); anything else gets the server's generic `"?ERROR"`. **Done — see §9.**
3. Response printing — **done and hardware-confirmed clean** (§8's length-prefixed framing fix, tested with a real `"I:HELLO"` message, full reply printed correctly).
4. Zero-page safety — still sidestepped, not resolved: all new state (§9) lives in `$CF00+` RAM, none in zero page.
5. Same discipline as always: rebuild, diff-localization check, confirm on hardware before considering it done.

**Step 2 is now implemented — see §9 for the real IERROR-based fallback, replacing `HONDANI` entirely.**

## 9. The real fallback: retiring `HONDANI`, hooking `IERROR` (2026-07-03)

**User decision:** once the cloud round-trip was confirmed clean end-to-end (§8), the `HONDANI` keyword itself was retired — it was always just the vehicle for proving out `xb_stub`/networking, not the intended final UX. The wedge now implements the originally-intended behavior: type anything BASIC doesn't recognize, and it gets forwarded to the cloud chatbot automatically.

**Researched first, since guessing wrong here fails silently (a subagent dug through `docs/inspiration/c64/mapc6411.txt`, the most authoritative local source — a full annotated Commodore 64 memory map):**
- `IERROR` lives at `$0300`/`$0301`, defaulting to `$A43A` (right after the `JMP ($0300)` at the `ERROR` entry, `$A437`).
- BASIC puts the **error-table index** in `X` before `JMP ($0300)` — confirmed both by the local doc and independently by the portable `msbasic` reimplementation's own header comment.
- **The exact index for `SYNTAX` is genuinely uncertain** — the local doc's error-table ordering computes to `$0A`, but common disassembly literature elsewhere says `$0B`. Rather than trust either, this build fires on *any* direct-mode error and prints the index it saw, so the real value gets confirmed from actual hardware (same "diagnostic build, then lock in the real value" strategy that resolved the response-framing bugs in §8).
- **Direct mode detection**: `CURLIN`'s high byte, zero page `$3A`, equals `$FF` in direct/immediate mode. Checking only `$3A` (not also `$39`) is sufficient and standard.
- Bank01 does **not** touch `$0300`/`$0301` anywhere in its own housekeeping (unlike `IGONE`, §3) — but this hasn't been empirically hardware-confirmed to *survive* the way the `IMAIN` patch does, only confirmed by absence-of-reference in the disassembly. Worth watching for.

**Implementation (bank01, `rr38p-tmp12reu.bank01.asm`):**
- `hondani_check` is renamed `line_tap` and completely rewritten. It no longer matches any keyword. On every non-empty typed line it: (1) shadow-copies the raw pre-crunch line text (up to 77 chars) to real RAM at `cf_shadow` (`$CF32`) — this has to happen *before* BASIC's own tokenizer runs, which is exactly what this hook point already gave us for free; (2) idempotently installs an `IERROR` hook (checks if already installed, so warm restarts don't double-patch); (3) **always** falls through to the cart's own scanner (`bank01_sub_8407`) exactly as before — it's a pure tap now, never intercepts.
- `ierror_stub_rom` is the actual hook logic — a small relocatable template, copied once to real RAM at `$CF00` (reusing the address `xb_stub` used to occupy, since `xb_stub`/`hword`/the exact-match logic are all gone). It has to live in RAM, not the `$8000-$9FFF` ROM window, because `IERROR` can fire while *any* cartridge bank happens to be paged in — exactly the same reasoning as `xb_stub` (§6a). On entry (`X` = error index): if `$3A` ≠ `$FF` (not direct mode), `jmp` through the saved original vector, `X` untouched — normal BASIC error reporting for program-mode bugs is completely unaffected. If direct mode: stash `X` into `ie_errcode` (`$CF82`, diagnostic only for now), switch to bank05, call the (renamed-in-purpose) `hondani_shell_entry`, switch back, then `jmp ($0302)` to re-enter BASIC's main loop cleanly — the stock `?SYNTAX ERROR` message never prints for this case.

**Implementation (bank05, `rr38p-tmp12reu.bank05.asm`):**
- `hondani_shell_entry` (still at `$9012`, still reached the identical way) now: (1) prints `ERR=$XX ` first, where `XX` is `ie_errcode` in hex — the diagnostic output that will tell us the real `SYNTAX` index; (2) sends `"I:"` + the shadow-copied line (`cf_shadow`) instead of a fixed test string, null-terminated same as before.
- The fixed `net_test_msg` test string is gone (no longer needed); `net_test_host` (the hardcoded server IP placeholder) is unchanged.
- `diag_hexdigit` (the small hex-nibble-print helper) didn't fit in either of the two pockets already in use, so it's relocated to a **third** confirmed-free pocket at `$8023-$80FF` (222 bytes, first use) in bank05.
- **A real bug was caught during this pass, before shipping**: the `.fill` boundary for that new pocket was miscalculated by hand (`$80F6` instead of the correct `$8100`), which silently shifted the entire rest of bank05 by 10 bytes — the diff-localization check immediately caught it (a 4334-byte diff instead of the expected ~700), and it was fixed before packaging. This is exactly the failure mode §4's methodology exists to catch, and it caught it.

**Verified via the same diff-localization discipline as every prior change:** bank01's tail past the edited pocket (`$9E10` onward) and all three of bank05's gaps between its now-three edited pockets (`$8100-$9012`, `$9200-$92D0`, `$9300-$9E00`, `$9E9D`-end) are byte-identical to stock. Total diff: 736 bytes across bank01 (107) and bank05 (629), all inside confirmed-free space.

**Not yet tested on hardware.** Expect: typing a valid BASIC command still works normally; typing garbage prints `ERR=$XX ` followed by a real chatbot reply instead of `?SYNTAX ERROR`; typing something that causes a *different* direct-mode error (e.g. `PRINT 1/0`) will *also* currently get forwarded to chat, since the trigger isn't narrowed to `SYNTAX` yet — that's expected for this round, not a bug.

## 10. Open items / not yet done

- **The IERROR fallback (§9) has not yet been tested on hardware** — this is the immediate next action. Build is clean, diff is verified localized, packaged `.crt` is up to date in `wedge/rr38p-tmp12reu.crt`.
- Once the real `SYNTAX` error-table index is confirmed from the `ERR=$XX` diagnostic output, narrow `ierror_stub_rom`'s trigger from "any direct-mode error" to just that specific index, and remove the diagnostic `ERR=$XX` print from `hondani_shell_entry`.
- Whether bank01's firmware reliably leaves `$0300`/`$0301` alone across many typed lines (not just the one line that installs it) hasn't been empirically confirmed — watch for this during hardware testing, the same way `IGONE`'s silent-reset behavior was originally discovered.
- The zero-page safety of the old `hdnsh` constants (`src/constants.asm`) under live stock BASIC/KERNAL is an open question, currently sidestepped (not resolved) by keeping all new state in `$CF00+` RAM instead.
- `ierror_stub_rom` (like `xb_stub` before it) holds `SEI` across the entire network round trip — the `net_spin` indicator gives *visible* feedback during a wait, but keyboard/cursor/jiffy-clock are still frozen underneath, and a stuck server would retry for up to ~8000 iterations before giving up. Worth revisiting now that this is the real fallback path, not just a test harness.
