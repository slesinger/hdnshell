# Tutorial 4 — An Interactive UI with TUIkit

**Level:** intermediate · **Time:** ~35 min · **You build:** an application menu
bar that opens a dialog on selection, using the project's **TUIkit** text-UI
library.

Interactive tutorial — you type, the **Coding Agent** (`C=+CTRL+3`) assists.
Prompts start with `I:`.

> Reference solution: [`oscar/projects/menu-tuikit`](../../oscar/projects/menu-tuikit/).

---

## What is TUIkit?

TUIkit is this project's reusable text-UI toolkit for 40×25 C64 screens: menus,
dialogs, list boxes, checkboxes, text inputs — keyboard, joystick, and C64
Ultimate **USB mouse** driven. It renders raw screencodes through Oscar's
`CharWin`, redraws only "dirty" widgets, and does **no hidden heap allocation**
(you hand it a fixed widget pool). Full API in the [TUIkit Reference](tuikit-reference.md).

Turn on the TUIkit skill so the agent works from the real API:

```
I: /skill tuikit_ui
```

---

## Step 1 — New project and orientation

```
I: /new-project menu-tuikit
```
```
I: what functions does tuikit.h expose for a menu bar and a dialog? list the exact signatures
```

**Expect:** the agent looks up the header and lists real functions
(`tui_init`, `tui_widget_alloc`, `tui_menu_bar_set_items`, `tui_dialog_open`, …).
Insist on verified signatures — never invented ones.

---

## Step 2 — The app skeleton

```
I: write the minimal TUIkit app: a static CharWin, a tui_context_t, a widgets[TUI_MAX_WIDGETS] pool, cwin_init at $0400, tui_init with tui_theme_default, then a loop that calls tui_update, tui_render, reads cwin_getch, and dispatches keys. RUN/STOP quits.
```

**Expect:** the poll → dispatch → update → render loop. Compile note: TUIkit needs
the project include tree, so the build uses `-i=include`. If the agent forgets,
say:

```
I: the build can't find tuikit.h - use the project include path
```

**Checkpoint:** it compiles and shows an empty themed screen.

---

## Step 3 — Add the menu bar

```
I: add a menu bar widget with items RUN, BUILD, ABOUT and give it focus
```

**Hint — borrowed strings:** TUIkit does **not** copy your label/item arrays; it
borrows the pointers. Keep them as `static const` so they outlive the widget. Ask
if unsure:

```
I: explain why the menu item array must be static const with TUIkit
```

---

## Step 4 — React to selection

```
I: add a dialog widget and an event handler so selecting a menu item shows a different message in the dialog and opens it
```

**Expect:** an `app_handler` that checks `event->type == TUI_EVT_ACTIVATE`, reads
the selection, calls `tui_dialog_set_message`, then `tui_dialog_open`.

**Checkpoint:** choosing RUN / BUILD / ABOUT pops a matching dialog. Navigate with
cursor keys and RETURN.

---

## Step 5 — Review and commit

```
I: review menu-tuikit - check widget pool sizing, that state changes invalidate, and the quit condition doesn't fire while a modal is open
```
```
I: commit with git, message "menu-tuikit: menu bar with dialog"
```

---

## Step 6 — Build a real screen (challenges)

1. **File list**
   ```
   I: add a listbox of filenames and a status bar showing the current selection
   ```
2. **Options**
   ```
   I: add a checkbox and two radio buttons, and read their values when RUN is chosen
   ```
3. **Mouse**
   ```
   I: enable the C64 Ultimate USB mouse and dispatch mouse events to the widgets
   ```

---

## What you learned

- Structuring a TUIkit app: context, widget pool, theme, event loop.
- Allocating widgets and wiring an event handler.
- Dirty-region rendering and the borrowed-pointer rule.
- Looking up **real** API signatures with the agent instead of guessing.

**Back to:** [Coding Tutorials index](coding-tutorials.md) ·
Deeper reference: [Programming in C on the C64](c-programming.md).
