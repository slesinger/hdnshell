# Coding Tutorial Videos — Scripts & Assets

Three record-ready screencast scripts for the Hondani Shell **coding** story:
watch the Coding Agent write, compile, and run C — and a little assembler —
straight onto a real C64 Ultimate.

Each video maps 1:1 to an interactive tutorial and a ready-to-build reference
project, so what you demo on camera matches what viewers can follow:

| Video | Tutorial | Reference project |
|---|---|---|
| 1. Can You C? | [tutorial-1](../user_manual/tutorial-1-can-you-c.md) | `oscar/projects/hello-raster` |
| 2. A Ball That Bounces (Sprites) | [tutorial-2](../user_manual/tutorial-2-sprites.md) | `oscar/projects/sprite-bounce` |
| 3. A Classic Effect in Assembler | [tutorial-3](../user_manual/tutorial-3-raster-asm.md) | `oscar/projects/rasterbars` |

Voice: Honza's usual "show and tell" — friendly, unscripted-sounding, honest
about the messy bits. Target length 6–9 min each. 1080p60, capture the **real
C64 screen** (composite/HDMI feed) as the hero shot, with the agent console as an
inset or cutaway.

---

## Shared setup (do once before recording any video)

**Hardware/software checklist**
- [ ] C64 Ultimate with the HDN Shell RR cartridge, powered, on the network.
- [ ] Cloud server running; note the server IP. Do a network rescan so the C64 IP
      is current (`run` tool needs `last_c64_ip`).
- [ ] Coding Agent console reachable at `C=+CTRL+3`.
- [ ] Camera/capture of the C64 display; screen capture of the agent console.
- [ ] Compiler present (`workspace/oscar/bin/oscar64`).

**Capture sources**
- A: real C64 screen (primary).
- B: agent console (you typing `I:` prompts and the agent replying).
- C: optional face-cam for intro/outro.

**Pre-roll safety**: pre-build each reference project once so you know it runs on
your exact hardware. If a live build fails on camera, that's fine — it's a great
moment to show the agent fixing its own error — but know the happy path first.

**Reusable lower-thirds**
- "Hondani Shell — code C on a real C64 Ultimate"
- "Coding Agent · console C=+CTRL+3"
- "Prompts start with `I:`"

---

## Video 1 — "Can You C?"

**Logline:** From nothing to a running C program on a real C64 in five minutes —
you type plain English, the agent writes the C.

**Length:** ~6 min. **Feel:** approachable, "you can do this tonight."

### Beats & script

**0:00 — Cold open (Cam C + A)**
> "Hi folks, this is Honza of Hondani, with another show and tell. BASIC was fun,
> but slow. Today: can you C? We're going to write a real C program and run it on
> this actual breadbin — no PC toolchain, no cross-assembler, just the shell and
> a coding agent."

Show the C64 booting the HDN Shell boot screen. Hold on it 2 seconds.

**0:35 — The setup (A + B)**
> "Everything runs on the server; the C64 is my screen. I press Commodore plus
> CTRL plus 3 to get the Coding Agent. Anything I type starting with `I:` goes to
> the agent."

On screen: switch to console 3.

**1:00 — Create the project (B)**
Type, on camera:
```
I: /new-project hello-raster
```
> "One command scaffolds a project. Now let's get to hello."

**1:20 — First program (B → A)**
```
I: write a minimal program that clears the screen and prints "hello c64 ultimate", then compile and run it
```
Cut to A as the text appears on the real C64.
> "It wrote the C, compiled it with Oscar64, and DMA'd it onto the C64. That's
> the whole loop — edit, compile, run."

**2:30 — Touch the hardware (B → A)**
```
I: after printing, loop forever and change the border colour once per frame using the vic raster register. keep it readable and comment it
```
Cut to A: border animating.
> "That's the video chip. We're changing a hardware register every frame. This
> little raster tick is the heartbeat of every game."

If it's too fast:
```
I: slow the colour change so it only advances every 8th frame
```

**3:40 — Make it explain itself (B)**
```
I: explain line by line why we use a byte counter and the (tick & 7) test
```
> "I don't just want code, I want to understand it. The agent teaches while it
> builds."

**4:30 — Commit it (B)**
```
I: initialise git here if needed and commit this working version with a clear message
```
> "And it version-controls the win. If the next idea breaks things, we can get
> back here."

**5:00 — Challenge + outro (A + C)**
> "Your turn: ask it to also animate the background colour a different shade.
> Link to the full tutorial's in the description. Next time — sprites, and a ball
> that bounces. This was Honza. Stay weird."

### On-screen prompt card (pin in description)
`/new-project hello-raster` → print hello → animate border → explain → commit.

### Assets
- [ ] Boot-screen clip.
- [ ] `oscar/projects/hello-raster/hello-raster.c` open in a tab for the "here's
      the finished code" cutaway.
- [ ] Lower-thirds listed above.
- [ ] Description text with the tutorial link and the prompt card.

---

## Video 2 — "A Ball That Bounces" (Sprites)

**Logline:** Put a hardware sprite on screen and make it bounce — and meet the
one gotcha that trips up every beginner.

**Length:** ~8 min. **Feel:** the first "whoa, I made a thing that moves."

### Beats & script

**0:00 — Cold open (A)**
Show the finished bouncing ball first (pre-built), 3 seconds, no words. Then:
> "Hi folks, Honza here. That ball? Hardware sprite. Let's build it from scratch,
> and I'll show you the mistake literally everyone makes the first time."

**0:40 — New project, reuse the loop (B)**
```
I: /new-project sprite-bounce
```
```
I: start from a program with an empty frame loop using vic_waitFrame(). explain what vic_waitFrame does
```
> "Same frame heartbeat as last time, just the tidy built-in version."

**1:40 — The gotcha, up front (Cam C or title card)**
> "Here's the trap. When you place a sprite, the `image` value is NOT the sprite
> number. It's the data address divided by 64. Put your bitmap at hex 2000, the
> image is 128. Get it wrong and you get… garbage. Watch."

**2:10 — One sprite on screen (B → A)**
```
I: define a simple 24x21 filled-ball sprite bitmap, copy it to $2000, and enable sprite 0 at x=160 y=120 using spr_set. remember image = $2000/64
```
Cut to A: the ball appears.
> "There it is. Notice the agent used 128, not 0 — it knows the rule and it'll
> stop me if I forget."

**3:30 — Deliberately break it (optional, great content) (B → A)**
```
I: what happens if I pass the sprite number instead of the image index? show me
```
Show the garbage, then revert. Honest, memorable.

**4:30 — Make it move (B → A)**
```
I: in the frame loop, give the sprite a velocity and move it each frame with spr_move
```
> "It drifts off screen. That's next."

**5:15 — Bounce (B → A)**
```
I: bounce the sprite inside the visible area by flipping dx or dy at the screen edges. use sprite coordinate limits, not character limits
```
Cut to A: bouncing.

**6:15 — Review + commit (B)**
```
I: review sprite-bounce for the spr_set image-index rule and any off-by-one in the bounce
```
```
I: commit this working version with git, message "sprite-bounce: bouncing ball"
```

**7:00 — Challenge + outro (A + C)**
> "Homework: ask it to read the joystick and let you drive the ball. Full steps
> in the description. Next episode we go old-school — a classic raster effect,
> and we crack open the assembler. Honza, out."

### Assets
- [ ] Pre-built bouncing-ball clip for the cold open.
- [ ] `oscar/projects/sprite-bounce/sprite-bounce.c` for the code cutaway.
- [ ] Title card: "image = data address ÷ 64 (NOT the sprite number)".
- [ ] Joystick b-roll for the challenge tease.

---

## Video 3 — "A Classic Effect in Assembler"

**Logline:** The colour bars that made demos famous — done the professional way:
the "what" in C, the "when" in a few lines of 6502 assembler.

**Length:** ~9 min. **Feel:** the demoscene payoff; a little advanced but earned.

### Beats & script

**0:00 — Cold open (A)**
Full-screen scrolling raster bars (pre-built), 4 seconds, with SID music if you
have a clip. Then:
> "Hi folks, Honza. This effect is older than most of you watching. Colour bars,
> painted by the raster beam. Today we build it — mostly in C, but the timing?
> That's assembler, and I'll show you exactly why."

**1:00 — Turn on the perf skill (B)**
```
I: /skill performance_c
```
> "This biases the agent toward tight, fast code — types, timing, the good
> stuff."

**1:30 — C skeleton first (B)**
```
I: /new-project rasterbars
```
```
I: write a program that each frame loops 16 times, and at 16 raster lines spaced 8 apart starting at line 60, sets vic.color_back from a 16-entry colour table. leave the raster wait as a placeholder for now
```
> "Structure in C. It won't look right until the timing is real — that's the
> whole point."

**3:00 — Why C isn't enough (Cam C / title)**
> "A raster split has to hit an exact scanline. That means a cycle-tight wait —
> and that's where a handful of assembler earns its place."

**3:30 — The asm wait (B → A)**
```
I: implement wait_raster(unsigned char line) using Oscar64 inline __asm that busy-waits until $D012 equals line. explain how the C parameter is read in asm
```
Cut to A: the bars snap into place.
> "There they are. Look at that — `lda line`, compare to D012, branch back. Three
> instructions holding the whole effect together. And the agent explained how the
> C variable reaches the assembler."

**5:30 — Bring it to life (B → A)**
```
I: add a phase counter that increments each frame and offsets the colour table lookup so the gradient scrolls
```
Cut to A: shimmering, scrolling bars.

**6:30 — Be honest about jitter (A)**
```
I: explain why there is slight jitter without a raster interrupt, and what a __hwinterrupt version would change
```
> "See that tiny wobble? That's the truth of doing it in the main loop. The
> rock-solid version uses an interrupt — and that's your next challenge."

**7:30 — Commit (B)**
```
I: commit with git, message "rasterbars: scrolling colour bars with asm timing"
```

**8:00 — Outro (A + C)**
> "So — C for the shape, assembler for the split-second timing. That's how the
> pros did it, and now you can too, on a real machine, with an agent riding
> shotgun. Ask it to make the bars a stable raster interrupt and watch the wobble
> vanish. Tutorial's linked below. This was Honza of Hondani — go make something
> that shouldn't be possible on a 40-year-old computer."

### Assets
- [ ] Pre-built scrolling-bars clip (+ optional SID track, cleared for use).
- [ ] `oscar/projects/rasterbars/rasterbars.c` for the code cutaway.
- [ ] Zoom-in graphic of the 3-line `__asm` block.
- [ ] Title card: "C = what · ASM = when".
- [ ] Teaser frame for the TUIkit episode (see tutorial-4) if you plan a Video 4.

---

## Series notes

- **Consistency:** always type prompts with the `I:` prefix on camera; it teaches
  the interaction model without narration.
- **Recover, don't hide:** if a build fails live, keep rolling and let the agent
  fix it. That reliability is the product.
- **End-cards:** each video points to the next; Video 3 can tease a TUIkit
  "build an app UI" episode built from [tutorial-4](../user_manual/tutorial-4-tuikit-ui.md).
- **Descriptions:** link the matching tutorial and the `oscar/projects/` reference
  so viewers can follow along and check their work.
