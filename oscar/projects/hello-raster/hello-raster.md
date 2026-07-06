# hello-raster

## Overview
First Oscar64 C program for the C64 Ultimate: clears the screen, prints a
banner, then animates the border colour once per frame. Proves the build/run
loop and introduces a VIC-II register and the raster-based frame tick.

## Files
- `hello-raster.c`: the whole program.

## Build Notes
- `bin/oscar64 projects/hello-raster/hello-raster.c`
- No special include path needed (uses stock Oscar64 headers).

## TODO / extensions
- Change the border colour every 4th frame instead of 8th.
- Also animate `vic.color_back`.
- Print the current colour code on screen each change.

Companion tutorial: `docs/user_manual/tutorial-1-can-you-c.md`.
