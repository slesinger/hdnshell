# Oscar64 C examples for the C64 Ultimate

Worked example projects that back the interactive coding tutorials in
[`docs/user_manual`](../docs/user_manual/). Each one is small, commented, and
**compiles as-is** with the bundled Oscar64 compiler.

## Projects

| Project | Teaches | Language | Tutorial |
|---|---|---|---|
| [`projects/hello-raster`](projects/hello-raster/) | build/run loop, printing, a VIC register, the frame tick | C | [tut-01](../docs/user_manual/tutorial-1-can-you-c.md) |
| [`projects/sprite-bounce`](projects/sprite-bounce/) | sprites, the `image = addr/64` rule, the game loop | C | [tut-02](../docs/user_manual/tutorial-2-sprites.md) |
| [`projects/rasterbars`](projects/rasterbars/) | inline 6502 assembler, raster timing, C+asm split | C + asm | [tut-03](../docs/user_manual/tutorial-3-raster-asm.md) |
| [`projects/menu-tuikit`](projects/menu-tuikit/) | interactive UI with the TUIkit library | C + TUIkit | [tut-04](../docs/user_manual/tutorial-4-tuikit-ui.md) |

## Build and run

From the directory that holds the Oscar64 `bin/` and `include/` (the shell
server's `workspace/oscar`, or a checkout of this repo pointed at the compiler):

```sh
# plain C projects
bin/oscar64 projects/hello-raster/hello-raster.c

# the TUIkit project needs the project include tree that ships tuikit
bin/oscar64 -i=include projects/menu-tuikit/menu-tuikit.c
```

This produces `<name>.prg`. Run it on real hardware:
- the coding agent's **run** tool uploads and starts it on the C64 Ultimate, or
- copy the `.prg` to the Ultimate and load it, or
- test in VICE: `x64sc <name>.prg`.

## Using the coding agent with these

The interactive tutorials drive the shell's coding agent. Typical prompts:
- `I: explain what hello-raster.c does line by line`
- `I: my sprite doesn't appear - review sprite-bounce.c for the image index`
- `I: make the rasterbars gradient scroll twice as fast`
- Enable a skill first for focused help, e.g. `/skill performance_c` or
  `/skill tuikit_ui`.

Keep changes small, compile after every edit, and commit working milestones with
the agent's `git` tool.
