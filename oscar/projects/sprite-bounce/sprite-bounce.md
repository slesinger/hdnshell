# sprite-bounce

## Overview
A single hardware sprite bounces around the screen. Demonstrates placing sprite
bitmap data in a VIC-visible bank, the `spr_set` image-index rule
(`image = data_address / 64`, **not** the sprite number), and a fixed-tempo game
loop via `vic_waitFrame()`.

## Files
- `sprite-bounce.c`: bitmap data, sprite setup, and the bounce loop.

## Build Notes
- `bin/oscar64 projects/sprite-bounce/sprite-bounce.c`
- Sprite data lives at `$2000` (bank 0). `SPRITE_IMAGE = $2000/64 = 128`.

## TODO / extensions
- Add a second sprite with a different velocity.
- Read the joystick and move the sprite under player control.
- Multicolour the sprite (`spr_set` multi flag + `vic.spr_mcolor0/1`).

Companion tutorial: `docs/user_manual/tutorial-2-sprites.md`.
