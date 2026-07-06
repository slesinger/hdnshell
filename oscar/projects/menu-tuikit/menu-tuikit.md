# menu-tuikit

## Overview
An interactive application menu built with the project's TUIkit text-UI library.
A menu bar with three items opens a dialog on selection. Demonstrates binding a
`CharWin`, a fixed widget pool, and a theme with `tui_init`, allocating widgets,
wiring an event handler, and the poll -> dispatch -> update -> render loop.

## Files
- `menu-tuikit.c`: widget setup, event handler, and the app loop.

## Build Notes
- Needs the project include tree that ships TUIkit:
  `bin/oscar64 -i=include projects/menu-tuikit/menu-tuikit.c`
- Label/item arrays are **borrowed** by TUIkit (not copied) - keep them alive.
- `s"..."` string literals are C64 screencodes.
- RUN/STOP quits when no popup/modal is open.

## TODO / extensions
- Add a listbox of files and a status bar.
- Add checkbox/radio options and read them back.
- Handle joystick and USB-mouse dispatch (`tui_dispatch_joystick/mouse`).

Companion tutorial: `docs/user_manual/tutorial-4-tuikit-ui.md`.
