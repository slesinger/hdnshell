# Tutorial 3 — A Classic Effect in Assembler

**Level:** intermediate · **Time:** ~35 min · **You build:** scrolling horizontal
raster colour bars, with the timing loop written in inline 6502 assembler.

Interactive tutorial — you type, the **Coding Agent** (`C=+CTRL+3`) assists.
Prompts start with `I:`.

> Reference solution: [`oscar/projects/rasterbars`](../../oscar/projects/rasterbars/).
> You should be comfortable with the frame loop from Tutorials 1–2.

---

## Why assembler here?

Oscar64 C is fast, but a *raster split* — changing the background colour at an
exact scanline — needs cycle-tight timing. That tiny, timing-critical part is
where a few lines of assembler earn their keep. The rest stays in C. This is the
professional pattern: **the "what" in C, the "when" in asm.**

Turn on the performance skill so the agent optimises with you:

```
I: /skill performance_c
```

---

## Step 1 — New project and the C skeleton

```
I: /new-project rasterbars
```
```
I: write a program that each frame loops 16 times, and at 16 raster lines spaced 8 apart starting at line 60, sets vic.color_back from a 16-entry colour table. leave the raster wait as a placeholder function for now
```

**Expect:** a colour table, a `wait_raster(line)` stub, and a frame loop that
calls it. It won't look right until the wait is real.

---

## Step 2 — Write the timing loop in assembler

Now the core. Ask for the inline-asm wait:

```
I: implement wait_raster(unsigned char line) using Oscar64 inline __asm that busy-waits until $D012 equals line. explain how the C parameter is read in asm
```

**Expect:** something like:

```c
static void wait_raster(unsigned char line) {
    __asm {
        lda line
    wr:
        cmp 0xd012     // vic.raster low byte
        bne wr
    }
}
```

**Understand it — ask:**
```
I: explain how Oscar64 exposes the C variable 'line' to the asm, what $D012 is, and why cmp/bne is a tight poll
```

Key ideas: local params live in zero-page registers accessible by name; `$D012`
is the VIC raster line counter; `cmp`/`bne` spins with minimal cycles so the
colour store lands on the right line.

**Checkpoint:** compile and run — you should see stacked colour bars.

---

## Step 3 — Bring it to life

```
I: add a phase counter that increments each frame and offsets the colour table lookup so the gradient scrolls
```

**Expect:** `bar_colors[(i + phase) & 15]` and `phase++` per frame. The bars now
shimmer/scroll.

**If the bars flicker or tear,** that's the honest limit of a main-loop raster
(no interrupt). Ask:

```
I: explain why there is slight jitter without a raster interrupt, and what a __hwinterrupt version would change
```

---

## Step 4 — Review and commit

```
I: review rasterbars for timing correctness and confirm the asm block is right
```
```
I: commit with git, message "rasterbars: scrolling colour bars with asm timing"
```

---

## Step 5 — Go further (challenges)

1. **Vertical motion**
   ```
   I: move the whole bar block up and down using a small sine table for the start line
   ```
2. **Rock-solid bars** (the real classic technique)
   ```
   I: convert this to a stable raster interrupt using __hwinterrupt so the bars don't jitter
   ```
3. **Split screen**
   ```
   I: show bars on the top half and normal text below
   ```

---

## What you learned

- Mixing C and 6502 assembler with Oscar64 `__asm { }`.
- Reading C parameters/variables from assembler.
- Raster timing via `$D012` and why splits need tight loops.
- When a few lines of asm beat pure C, and where an interrupt goes next.

**Next:** [Tutorial 4 — An Interactive UI with TUIkit](tutorial-4-tuikit-ui.md).

Deeper reference: the [performance and inline-assembly sections of Programming in C](c-programming.md).
