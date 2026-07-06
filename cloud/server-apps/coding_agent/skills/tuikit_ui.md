TUIkit text-UI toolkit

Use this skill when the task is to build an interactive text UI (menus, dialogs, forms, lists) for a C64 Ultimate app. TUIkit is the project's own reusable toolkit — prefer it over hand-rolling screen pokes.

Location and includes (verify paths with the file/list tools before relying on them):
- Headers/sources under the Oscar include tree: `tuikit/tuikit.h` plus `tuikit_core.c`, `tuikit_widgets.c`, `tuikit_input.c`. API reference in `tuikit/API.md`, design rationale in `tuikit/DESIGN.md`.
- Required includes: `#include <c64/types.h>`, `#include <c64/charwin.h>`, then `#include "tuikit.h"`.

Core model (from tuikit.h — do not invent functions; check the header):
- Renders raw C64 screencodes through Oscar's `CharWin`. Redraws only dirty widgets — call `tui_invalidate(w)` when state changes.
- No hidden heap allocation. You provide a fixed widget pool array; sizes are tuned via `TUI_MAX_WIDGETS`, `TUI_MAX_MENU_ITEMS`, etc. (override before including the header).
- Keyboard-first, with joystick and USB-mouse dispatch — the C64 Ultimate USB mouse is a primary target.

Typical app skeleton:
1. `tui_init(ctx, screen, widgets, max_widgets, theme)` — bind a CharWin, a widget pool, and a theme (`TUI_THEME_CLASSIC_BLUE`, `TUI_THEME_TERMINAL_GREEN`, `TUI_THEME_PAPER_UI`).
2. Allocate widgets with `tui_widget_alloc(ctx, type, x, y, w, h, id)`; nest with `tui_add_child`.
3. Configure per-widget: e.g. `tui_button_set_label` / `tui_button_set_action`, `tui_listbox_set_items`, `tui_text_input_set_buffer`, `tui_menu_bar_set_items`, `tui_checkbox_set_value`.
4. Wire focus with `tui_focus_set` / `tui_focus_next` / `tui_focus_prev`.
5. App loop each frame: read input → `tui_dispatch_key` / `tui_dispatch_joystick` / `tui_dispatch_mouse` → `tui_update(ctx)` → `tui_render(ctx)`.

Event handlers return a `byte` (handled/consumed) and receive `(ctx, widget, event)`. Item arrays and label strings are *borrowed* — TUIkit does not copy them, so keep them alive for the widget's lifetime (use `const` static arrays).

When editing TUIkit-based code: confirm the exact signature in `tuikit.h` first, keep the widget pool sized correctly, and invalidate on every state change or the screen will show stale content.
