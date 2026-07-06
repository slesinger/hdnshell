# Coding Tutorials

Hands-on, **interactive** tutorials for writing C (and a little assembler) for
the **C64 Ultimate** with Hondani Shell. You type the code; the
[Coding Agent](coding-agent.md) (console `C=+CTRL+3`) supplies hints, snippets,
explanations, reviews, and git checkpoints on request.

Each tutorial has a matching, ready-to-build reference project under
[`oscar/projects/`](../../oscar/projects/). Try each step yourself first — peek at
the reference only when stuck.

## How these work

- Prompts you paste to the agent start with `I:` (that is how you address it).
- Every tutorial follows the same rhythm: **do a step → compile → run → review →
  commit**, then extend with challenges.
- Two skills sharpen the agent for specific tutorials — enable with
  `/skill performance_c` (Tutorial 3) and `/skill tuikit_ui` (Tutorial 4).
- New to the consoles? Start with the [Coding Agent](coding-agent.md) page and
  [Programming in C on the C64](c-programming.md).

## The path

| # | Tutorial | You build | Key ideas |
|---|----------|-----------|-----------|
| 1 | [Can You C?](tutorial-1-can-you-c.md) | banner + animated border | edit/compile/run loop, a VIC register, the frame tick |
| 2 | [Sprites and the Game Loop](tutorial-2-sprites.md) | a bouncing sprite | sprites, `image = addr/64`, the game loop |
| 3 | [A Classic Effect in Assembler](tutorial-3-raster-asm.md) | scrolling raster bars | inline 6502 asm, raster timing, C+asm split |
| 4 | [An Interactive UI with TUIkit](tutorial-4-tuikit-ui.md) | a menu + dialog app | the TUIkit library, widget/event model |

## Prerequisites (all tutorials)

- HDN Shell RR cartridge on your C64 Ultimate — [Installation](installation.md).
- Cloud server running on the same network — [Cloud Integration](cloud-integration.md).
- Basic familiarity with the [Coding Agent](coding-agent.md) console.

## Reference material

- [Programming in C on the C64](c-programming.md) — the deep reference (memory
  map, types, VIC/SID, sprites, bitmap, I/O, performance, inline asm).
- [`oscar/README.md`](../../oscar/README.md) — how to build and run the example
  projects outside the tutorials.
