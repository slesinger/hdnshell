# rasterbars

## Overview
Classic horizontal colour bars, painted by changing the VIC-II background colour
at precise raster lines. The timing primitive (`wait_raster`) is written in
inline 6502 assembler; the composition stays in C. Teaches Oscar64 `__asm { }`,
parameter access from assembler, and why raster splits need cycle-tight polling
of `$D012`.

## Files
- `rasterbars.c`: colour table, the asm `wait_raster`, and the frame loop.

## Build Notes
- `bin/oscar64 projects/rasterbars/rasterbars.c`
- Bars start at raster line 60, spaced 8 lines apart; `phase` scrolls the palette.
- Without a raster IRQ there may be slight jitter; that is expected for this
  intro. A stable-raster IRQ version is a natural follow-up.

## TODO / extensions
- Move the bars vertically with a sine table.
- Convert to a raster interrupt (`__interrupt` / `__hwinterrupt`) for stability.
- Split the screen: bars on top, text below.

Companion tutorial: `docs/user_manual/tutorial-3-raster-asm.md`.
