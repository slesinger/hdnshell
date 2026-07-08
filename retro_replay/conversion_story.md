# RR38P Retro Replay Wedge — Chronological Conversion Story

This file retells the story from `wedge_3pokus_o_zachranu/wedge-analysis.md` in chronological order. It keeps the technical details, but the narrative is reorganized to follow how the work actually evolved over time.

## Starting Point: what the project is

The base artifact is `rr38p-tmp12reu.bin`, a 65536-byte, 8-bank (8192 bytes per bank) Retro Replay ROM image with a custom CyberPunX firmware build. It includes the freeze menu, machine-code monitor, flash utility, Turbo Macro Pro + REU support, and a BASIC toolkit with a resident command wedge.

The goal of the project was to extend that resident wedge into a custom shell. The very first proof of concept was a `HONDANI` command that incremented the border color. The longer-term goal was a fuller shell that could invoke logic implemented in the separate HDN cloud/server project.

### Files involved at the outset

- `rr38p-tmp12reu.bin` is the pristine stock ROM dump and the diff baseline.
- `rr38p-tmp12reu.bank00.asm` through `rr38p-tmp12reu.bank07.asm` are the live editable Kick Assembler sources, one per 8KB bank.
- `rr38p-tmp12reu.bank00.md` through `rr38p-tmp12reu.bank07.md`, plus `rr38p-tmp12reu.analysis.md`, are reference notes from the original disassembly pass.
- `build.sh` rebuilds all eight banks, concatenates them, and packages a CRT.
- Build output lands in `build/rr38p-tmp12reu.rebuilt.bin` and `build/hdn-rr38p-tmp12reu.crt`.

## Early reverse engineering: how the stock wedge works

Before editing anything, the cartridge’s stock wedge behavior was traced carefully.

There is no classic IGONE-vector wedge at `$0308/$0309`. Instead, bank01 implements its own keyword scanner through IMAIN:

- Bank01 cold start patches `$0302/$0303` (IMAIN, BASIC main-loop vector) to `$DE8F`.
- When BASIC returns to the main loop, execution goes through `$DE8F` into `bank01_api_02` at ROM `$83D0`.
- That path checks `$0313`, then calls `bank01_sub_83e9`, which fetches the current character with CHRGET at `$0073`.
- For non-empty lines, control reaches the scanner at `bank01_sub_8407`.
- The scanner compares the typed line against a keyword table at `$8507` using TXTPTR at `$7A/$7B`.
- Words are PETSCII with bit 7 set on the last character.
- On a match, `word_index * 2` indexes a parallel jump table at `$8572`.

One key quirk was established early: once the first three letters of a stock keyword match, the scanner swallows remaining letters unconditionally if they are alphabetic. That is why typing `TASM` launches the stock `TASS` command.

The stock command table in bank01 was mapped fully:

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
| 11 | `AUTO` | `$86D4` | 25 | `TASS` | `$80E6` |
| 12 | `MONITOR` | `$8997` | 26 | `SSGET` | `$80EE` |
| 13 | `APPEND` | `$822E` | 27 | `TOOL` | `$8104` |

The roles of the banks were also documented:

- Bank00: freeze/reset menu.
- Bank01: BASIC toolkit and wedge, plus fast load/save hooks.
- Bank02: unrelated frozen-game payload.
- Bank03: monitor/debugger.
- Bank04: glue bank.
- Bank05: flash utility.
- Bank06/07: Turbo Macro Pro and REU assembler.

Cross-bank calls were understood as going through fixed trampolines in `$DE00-$DEFF`.

## Early false start: IGONE was ruled out

An early attempt was made conceptually against IGONE, but live VICE memory dumps proved bank01 resets `$0308/$0309` back to stock `$A7E4` on every processed line. An independently-installed IGONE hook could not survive. That permanently set the strategy: integrate into bank01’s own scanner path rather than fighting it.

## Early editing discipline and build discipline

Another critical early discovery was that bank01’s disassembly uses raw hardcoded hex addresses for table lookups. That meant two practical rules:

1. Never shift code before any of those hardcoded references.
2. Only use same-byte-count instruction swaps or fill confirmed free-space pockets without changing surrounding layout.

The first custom hook followed that discipline:

- At `bank01_sub_83e9`, the original `tax` / `bne bank01_sub_8407` sequence was replaced with a same-size `jmp hondani_check`.
- New code was placed in a confirmed zero-filled free run at `$9D74-$9E0F` in bank01.
- The fallback path preserved CHRGET’s carry flag and the original X register behavior so the untouched stock scanner still worked exactly.

The initial `HONDANI` implementation used that pocket, with exact addresses verified in the rebuilt binary:

- Hook jump at ROM `$83FF`.
- `hondani_check` entry at ROM `$9D74`.
- `hword` at ROM `$9DAD`.

The build flow was standardized at the same time:

- Run `./build.sh`.
- Note that `build.sh` intentionally exits with `MISMATCH` once the ROM differs from stock.
- Package manually with `cartconv` when deliberate changes exist.
- Always verify diff localization. The standard check compared the rebuilt ROM byte-for-byte with stock and reported changed banks.

That diff-localization discipline later caught real mistakes, including a bank05 pocket boundary bug.

## Bank switching foundation: `xb_stub` and RR register decoding

The first `HONDANI` command quickly exposed the need to execute substantial logic from bank05 while the hook itself lived in bank01.

That led to the `xb_stub` mechanism:

- The bank-switching logic could not safely live in `$8000-$9FFF`, because writing `$DE00` repages the very ROM window executing the code.
- The solution was to relocate a tiny stub to RAM at `$CF00` and run it from there.
- The stub selected bank05, called `$9012`, restored bank01, and returned.

That in turn led to a full decode of `$DE00` bank-select semantics from the ROM markers in each bank, later cross-checked against official Retro Replay documentation. The bank number was confirmed to be encoded by bits 3, 4, and 7.

The official Retro Replay register documentation was then recorded in the notes:

- `$DE00` and `$DE01` are write-only control registers.
- Reading them returns a status register.
- `$DE00` bit meanings were documented, including GAME, EXROM, bank bits, ROM/RAM select, decartify, and freeze exit.
- `$DE01` documented AllowBank, NoFreeze, REU-compatible mapping, and mirror bank bits.
- Standard, freeze, and REU-compatible mapping modes were summarized.

This validated that `xb_stub` was doing the right thing: just changing bank bits while leaving the cartridge in its normal 8K ROM mode.

## 2026-07-03: first major goal shift, from proof-of-concept command to chat fallback

The next large step was to port the old standalone `hdnsh` cloud behavior into the cartridge wedge.

The goal became: if the user types something BASIC cannot execute and the shell does not recognize as a local command, forward it to the HDN cloud server as chatbot input.

Key design decisions made at this point:

- Do not add another explicit wedge keyword for chat.
- Make it a true fallback at the point BASIC would normally report a direct-mode error.
- Reuse the existing HDN cloud wire protocol unchanged.
- Use the Ultimate Command Interface at `$DF1C-$DF1F`.

The main open question was whether `$DF1C-$DF1F` still worked while this Retro Replay image was actively banked in, because the cartridge claims `$DF00-$DFFF` as part of its own mapping.

### Step 1 on 2026-07-03: minimal cloud round-trip test

Rather than build the full fallback blindly, the `HONDANI` command was repurposed into a dedicated network test.

The bank05 entry routine was rewritten to:

- Connect to a hardcoded cloud host `192.168.1.2:6464`.
- Send a fixed `TEXT_INPUT` packet containing `PING`.
- Print whatever came back using CHROUT.
- Close the socket.
- Flash the border green on protocol success or red on protocol failure.

Important implementation choices:

- No zero-page was used at all.
- Scratch state lived at `$CF20-$CF22`.
- Protocol code was ported from the standalone `hdnsh` implementation.
- Everything fit into the bank05 `$9012-$91FF` pocket.
- Interrupts remained disabled for the entire round trip because `xb_stub` wrapped the whole call in `sei`/`cli`.

### 2026-07-03 hardware result: UCI works inside the wedge

This test was hardware-tested and resolved the core uncertainty.

Typing `HONDANI` produced a green border and `?ERROR` on screen. The server logged `Received: 'ping'` followed by `No handler found for the request.` That was the correct behavior, not a failure, because the dispatcher only routes `