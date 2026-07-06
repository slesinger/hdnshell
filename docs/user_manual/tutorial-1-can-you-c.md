# Tutorial 1 — Can You C? Your First C64 Ultimate Program

**Level:** beginner · **Time:** ~20 min · **You build:** a program that prints a
banner and animates the screen border every frame.

This is an **interactive** tutorial. You do the typing; the **Coding Agent**
(console `C=+CTRL+3`) writes hints, snippets, and reviews on request. Every step
gives you an exact prompt to paste — prompts start with `I:` because that is how
you address the agent.

> Reference solution: [`oscar/projects/hello-raster`](../../oscar/projects/hello-raster/).
> Try it yourself first; peek only when stuck.

---

## Before you start

- HDN Shell RR cartridge on your C64 Ultimate — see [Installation](installation.md).
- Cloud server running and on the same network — see [Cloud Integration](cloud-integration.md).
- Read the 2-minute [Coding Agent](coding-agent.md) intro so you know the
  consoles and slash commands.

Switch to the Coding Agent console: **`C=+CTRL+3`**.

---

## Step 1 — Create the project

Type:

```
I: /new-project hello-raster
```

The agent scaffolds `hello-raster.c` and a notes file, and switches to it.

**Expect:** a confirmation naming the two files. If it says the project exists,
pick another name.

---

## Step 2 — Get to "hello"

Ask the agent for the smallest program that proves the toolchain works:

```
I: write a minimal program that clears the screen and prints "hello c64 ultimate", then compile and run it
```

**Expect:** the agent writes the file, compiles, reports success, and runs it on
your C64. You should see the text on screen.

**If the build fails:** paste the error back and ask:

```
I: that failed to compile - explain the first error and fix it
```

**Checkpoint:** you see your text on the real C64. That is the whole
edit → compile → run loop. Everything else is variations on it.

---

## Step 3 — Touch the hardware

The C64's video chip (VIC-II) exposes registers as memory. Let's animate one.

```
I: after printing, loop forever and change the border colour once per frame using the vic raster register. keep it readable and comment it
```

**Expect:** a `for(;;)` loop that waits on `vic.raster` and updates
`vic.color_border`. The border should now cycle through colours.

**Hint — the frame tick:** reading `vic.raster` once per frame gives you a steady
~50/60 Hz clock with no timer. This is the seed of every game loop (Tutorial 2).

If the colour changes too fast to see, ask:

```
I: slow the colour change so it only advances every 8th frame
```

---

## Step 4 — Understand what you wrote

Don't just accept code — interrogate it:

```
I: explain line by line why we use a byte counter and the (tick & 7) test, and what vic.raster == 250 does
```

Key ideas the agent should confirm:
- `unsigned char` wraps at 256 and is the cheapest loop variable on the 6502.
- `(tick & 7) == 0` fires once every 8 frames (a cheap "every Nth frame").
- Waiting for a specific raster line synchronises changes to the display.

---

## Step 5 — Review and commit

Ask for a focused review:

```
I: review this file for correctness and any C64-specific gotchas
```

Then checkpoint your working code with version control (the agent has a `git`
tool):

```
I: initialise git here if needed and commit this working version with a clear message
```

**Expect:** the agent runs `git init` (if needed), stages the file, and commits.
It will only report success if the commit actually succeeded.

---

## Step 6 — Make it yours (challenges)

Pick one and drive it through the agent:

1. **Two colours at once**
   ```
   I: also animate vic.color_back a different colour so border and background differ
   ```
2. **Show the value**
   ```
   I: print the current border colour code on screen each time it changes
   ```
3. **Faster/slower**
   ```
   I: add a way to change the animation speed - advance every 4th frame instead of 8th
   ```

After each change: compile, run, and if it works, commit.

---

## What you learned

- The edit → compile → run loop on real C64 Ultimate hardware.
- Printing text and reading/writing a VIC-II register from C.
- The raster frame tick — the heartbeat of everything that follows.
- Using the agent for hints, explanations, reviews, and git checkpoints.

**Next:** [Tutorial 2 — Sprites and the Game Loop](tutorial-2-sprites.md).

See also the deeper reference: [Programming in C on the C64](c-programming.md).
