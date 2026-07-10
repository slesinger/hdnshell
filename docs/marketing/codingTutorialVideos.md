# Coding Tutorial Videos — Scripts & Assets

(A): the real C64 screen feed (primary hero shot).
(B): the Coding Agent console capture (where you type I: prompts and show replies).
(Cam C): optional face-cam (intro/outro or commentary moments).

Four record-ready screencast scripts for the Hondani Shell **coding** story:
watch the Coding Agent write, compile, and run C — a little assembler — and,
in the fourth episode, a whole playable game with the TUIkit library, straight
onto a real C64 Ultimate.

Each video maps 1:1 to an interactive tutorial and a ready-to-build reference
project, so what you demo on camera matches what viewers can follow:

| Video | Tutorial | Reference project |
|---|---|---|
| 1. Can You C? | [tutorial-1](../user_manual/tutorial-1-can-you-c.md) | `oscar/projects/hello-raster` |
| 2. A Ball That Bounces (Sprites) | [tutorial-2](../user_manual/tutorial-2-sprites.md) | `oscar/projects/sprite-bounce` |
| 3. A Classic Effect in Assembler | [tutorial-3](../user_manual/tutorial-3-raster-asm.md) | `oscar/projects/rasterbars` |
| 4. We Built a Whole Game (Counter & Cart) | [tutorial-4](../user_manual/tutorial-4-tuikit-ui.md) (TUIkit basics; this episode goes further) | `oscar/projects/counter-and-cart` (created live in this episode) |

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
- [ ] Teaser frame for Video 4 — "next time, we build a whole game."

---

---

---

## Video 4 — "We Built a Whole Game" (Counter & Cart)

**Logline:** Not a demo this time — a complete, playable shopkeeper-and-trading
game, built end to end with the Coding Agent and the project's own **TUIkit**
library, on a real C64 Ultimate.

**Length:** ~18-20 min. **Feel:** the payoff episode — bigger scope, same
conversational build style, ends with a full playthrough.

**Premise recap (say this on camera, don't just assume the audience read the
docs):** You run a general store in a home town. Each day you either mind the
counter and serve customers, or travel to one of a few nearby towns to buy
stock wholesale. Set your sell prices well, survive random events, and hit a
gold target before the days run out.

**Scope for this episode:** 1 home town + 3 supplier towns, 5 goods, no bank
loans (keep it shippable in one video), keyboard **and** C64 Ultimate USB mouse.

### Beats & script

**0:00 — Cold open (A)**
Show the finished game being played for ~10 seconds, no narration: menu bar,
traveling to a town, buying stock, a customer dialog popping up, gold going up.
> "Hi folks, Honza here. Everything you just saw — the menus, the shop, the
> haggling — we're building all of it, today, from a blank project, live. This
> is the biggest build we've done on this channel: a real, playable game."

**0:45 — Why this matters (Cam C)**
> "Every episode so far has been one idea — a sprite, a raster effect. Today's
> about proving those ideas add up to something real, using our text-UI
> library, TUIkit, and the Coding Agent driving the whole build."

**1:30 — Plan before you type code (B)**
```
I: /plan design a small shop-and-trading game called Counter and Cart. one home
town shop, three supplier towns, five goods, a day counter, and a gold target
to win. list the screens and the TUIkit widgets each one needs
```
> "Notice I didn't say 'write the code.' Plan mode is read-only — it won't
> touch a single file. I want the shape of the game agreed before anything
> compiles."

**Expect on screen:** a plan that lists roughly: main shop screen (menu bar,
status bar, inventory table), travel/market screen (list box + table + text
input), customer dialog, price-setting screen, day-end/event dialog.

**2:30 — Scaffold and turn on the right skill (B)**
```
I: /new-project counter-and-cart
```
```
I: /skill tuikit_ui
```
> "New project, and I bias the agent toward the TUIkit API instead of it
> guessing widget calls."

**3:30 — The shop screen (B → A)**
```
I: build the main shop screen: a menu bar across the top with SHOP, TRAVEL,
PRICES, END DAY, a status bar at the bottom showing gold and day, and a table
in the middle listing our five goods with quantity and current sell price
```
Cut to A as the screen appears.
> "Menu bar, status bar, table — three widgets, one screen, and it's already
> readable."

**5:00 — The TUIkit gotcha (Cam C / title card)**
> "Quick warning, same as our UI tutorial: TUIkit does not copy your label or
> item arrays — it just borrows the pointer. If you build that string array on
> the stack, it'll be garbage the moment the function returns. Every array
> backing a widget has to be `static const`."
```
I: double check every array backing a widget in this file is static const
```

**6:15 — Wire the menu actions (B → A)**
```
I: when TRAVEL is chosen from the menu bar, switch to a travel screen; when
END DAY is chosen, advance the day counter and refresh the status bar
```

**7:30 — Travel and the market table (B → A)**
```
I: build the travel screen: a list box of the three supplier towns, and when a
town is picked, show a table of that town's five goods with buy prices that
differ a bit per town
```
Cut to A: picking a town, table refreshing with different prices.
> "Same table widget as the shop screen, different data — that's the point of
> a fixed widget pool, we're not reinventing this per screen."

**9:00 — Buying stock (B → A)**
```
I: let the player select a good in the table and enter a quantity with a text
input, then buy it if there's enough gold and cart space, updating gold and
inventory
```
Compile, run, buy something on camera. If gold or capacity checks are wrong:
```
I: the game let me buy more than my gold covers - add the check back and show
an error in the status bar
```
> "And that's the loop this whole series is built around — it's wrong, I say
> so in plain English, it gets fixed."

**11:00 — Customers and the haggling dialog (B → A)**
```
I: back at the shop, add a customer dialog: a customer wants one of our goods
at a price, with ACCEPT, HAGGLE, and REFUSE buttons; haggle has a chance to
raise the price a little or annoy the customer
```
Cut to A: dialog popping up over the shop screen, pressing buttons.
> "Same Dialog widget as a confirmation box in any other app — we're just
> giving it game logic behind the buttons."

**13:30 — Setting prices (B → A)**
```
I: add a prices screen reusing the inventory table, where selecting a row and
typing a number sets that item's sell price, and cheap or greedy prices should
nudge how often customers accept
```

**15:00 — Day-end and random events (B → A)**
```
I: at end of day, roll a small chance of a random event - a theft, a price
shock in one town, or a festival that raises demand - and show it in a dialog
before the new day starts
```
Cut to A: an event dialog firing.
> "This is what turns a UI demo into a game — a little unpredictability."

**16:30 — The win/lose condition (B)**
```
I: add a win condition: reaching 500 gold by day 20 shows a WIN dialog, running
out of days without it shows a final score dialog with gold earned
```

**17:15 — Review and commit (B)**
```
I: review counter-and-cart - widget pool sizing, that dialogs are modal so the
shop screen doesn't update underneath them, and that every array is static const
```
```
I: commit with git, message 'counter-and-cart: playable shop and trading game'
```

**17:45 — Full playthrough (A)**
Play a compressed few days on the real hardware: travel, buy, return, sell,
survive an event, hit (or narrowly miss) the gold target. Let this breathe —
it's the payoff shot.

**19:30 — Recap + outro (A + C)**
> "Menu bar, status bar, table, list box, dialog, text input — that's basically
> the whole TUIkit widget catalog, in one game, built by talking to an agent in
> plain English. Full prompt list is in the description. Your turn: ask it to
> add a bank loan, or a reputation meter with the progress bar widget. This was
> Honza of Hondani — go build something that plays."

### On-screen prompt card (pin in description)
`/plan` the screens → `/new-project counter-and-cart` → `/skill tuikit_ui` →
shop screen → travel/market → buying → customer dialog → prices → day-end
events → win condition → review → commit.

### Assets
- [ ] Pre-built finished-game playthrough clip for the cold open.
- [ ] `oscar/projects/counter-and-cart/` opened after recording, committed as
      the new reference project (mirrors the pattern of the other three).
- [ ] Title card: "TUIkit borrows pointers — keep arrays `static const`."
- [ ] Lower-third: "Plan mode: read-only design, no files touched."
- [ ] Description links: this doc, [tutorial-4](../user_manual/tutorial-4-tuikit-ui.md),
      [tuikit-reference.md](../user_manual/tuikit-reference.md),
      [tuikit-widgets.md](../user_manual/tuikit-widgets.md).

---

## Series notes

- **Consistency:** always type prompts with the `I:` prefix on camera; it teaches
  the interaction model without narration.
- **Recover, don't hide:** if a build fails live, keep rolling and let the agent
  fix it. That reliability is the product.
- **End-cards:** each video points to the next; Video 3's teaser frame should
  point directly at Video 4 — "next time, we build a whole game."
- **Descriptions:** link the matching tutorial and the `oscar/projects/` reference
  so viewers can follow along and check their work.
