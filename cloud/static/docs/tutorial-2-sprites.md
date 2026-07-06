# Tutorial 2 — Sprites and the Game Loop

**Level:** beginner+ · **Time:** ~30 min · **You build:** a hardware sprite that
bounces around the screen.

Interactive tutorial — you type, the **Coding Agent** (`C=+CTRL+3`) assists.
Prompts to paste start with `I:`.

> Reference solution: [`oscar/projects/sprite-bounce`](../../oscar/projects/sprite-bounce/).
> Finished [Tutorial 1](tutorial-1-can-you-c.md) first? Good — reuse that frame tick here.

---

## The one trap to know first

The C64 has 8 hardware sprites. In Oscar64 you place them with:

```c
spr_set(sprite_number, show, x, y, image, colour, multi, xexpand, yexpand);
```

The **`image`** argument is **not** the sprite number. It is the sprite data
block index: `data_address / 64`. Put your 64-byte bitmap at `$2000` and the
image is `$2000 / 64 = 128`. Getting this wrong shows garbage or nothing — the
single most common beginner bug. The agent is primed to catch it; you should
recognise it too.

---

## Step 1 — New project, reuse the loop

```
I: /new-project sprite-bounce
```
```
I: start from a program that clears the screen and has an empty frame loop using vic_waitFrame(). explain what vic_waitFrame does
```

**Expect:** a `main` with a `for(;;) { vic_waitFrame(); }` skeleton. `vic_waitFrame`
is the tidy version of the raster wait you wrote by hand in Tutorial 1.

---

## Step 2 — Get one sprite on screen

```
I: define a simple 24x21 filled-ball sprite bitmap, copy it to $2000, and enable sprite 0 at x=160 y=120 using spr_set. remember image = $2000/64
```

**Expect:** a `const char[64]` bitmap, a `memcpy` to `$2000`, and a `spr_set(0,
true, 160, 120, 128, ...)`. A ball appears.

**If nothing shows,** ask the agent to check the classic causes:

```
I: my sprite isn't visible - check the image index, the sprite is enabled, and the data address is in the VIC bank
```

**Checkpoint:** a stationary sprite on screen.

---

## Step 3 — Make it move

```
I: in the frame loop, give the sprite a velocity and move it each frame with spr_move. no bouncing yet
```

**Expect:** `x += dx; y += dy; spr_move(0, x, y);` inside the loop. The ball
drifts off screen — that's expected next.

---

## Step 4 — Bounce off the edges

```
I: bounce the sprite inside the visible area by flipping dx or dy at the screen edges. use sprite coordinate limits, not character limits
```

**Hint — sprite coordinates:** VIC sprite X runs ~24..320 and Y ~50..250 for the
visible area; these are not the same as the 0..39 / 0..24 text grid. Ask the
agent to explain if the limits look arbitrary:

```
I: explain why the bounce limits are 24/320 and 50/229 in sprite coordinates
```

**Checkpoint:** the ball bounces around the border like a screensaver.

---

## Step 5 — Review, then commit

```
I: review sprite-bounce for the spr_set image-index rule and any off-by-one in the bounce
```
```
I: commit this working version with git, message "sprite-bounce: bouncing ball"
```

---

## Step 6 — Level up (challenges)

1. **Player control**
   ```
   I: read joystick port 2 and let the player move the sprite instead of auto-bouncing
   ```
2. **Two sprites**
   ```
   I: add a second sprite with a different colour and speed, both bouncing
   ```
3. **Multicolour ball**
   ```
   I: make the sprite multicolour using the spr_set multi flag and vic.spr_mcolor0/1
   ```

Compile and run after each; commit what works.

---

## What you learned

- Placing sprite bitmap data and the `image = address / 64` rule.
- Enabling and moving sprites with `spr_set` / `spr_move`.
- A steady game loop with `vic_waitFrame()` and per-frame state updates.
- Sprite vs character coordinate spaces.

**Next:** [Tutorial 3 — A Classic Effect in Assembler](tutorial-3-raster-asm.md).
