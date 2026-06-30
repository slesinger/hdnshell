# TUIkit C API Reference (tuikit.h)

This file documents the API currently implemented in `tuikit.h`, `tuikit_core.c`, `tuikit_widgets.c`, and `tuikit_input.c`.

Scope notes:
- Strings and item arrays are borrowed pointers. TUIkit does not copy them.

## 1) Includes and compile-time configuration

Required includes:

```c
#include <c64/types.h>
#include <c64/charwin.h>
#include "tuikit.h"
```

Configuration macros from `tuikit.h` (override before including header if needed):

```c
#define TUI_MAX_WIDGETS              32
#define TUI_MAX_MENU_ITEMS            8
#define TUI_MAX_DIALOG_BUTTONS        3

#define TUI_ENABLE_MOUSE              1
#define TUI_ENABLE_TEXT_INPUT         1
#define TUI_ENABLE_TEXT_AREA          0
#define TUI_ENABLE_DROPDOWN_BUTTON    1

// Default if neither TERMINAL_GREEN nor PAPER_UI is defined.
#define TUI_THEME_CLASSIC_BLUE        1
```

Theme-select defines recognized by code:
- `TUI_THEME_TERMINAL_GREEN`
- `TUI_THEME_PAPER_UI`
- fallback: classic blue (`tui_theme_default`)

Common constants:

```c
#define TUI_NONE              0xff

#define TUI_FLAG_VISIBLE      0x01
#define TUI_FLAG_ENABLED      0x02
#define TUI_FLAG_CAN_FOCUS    0x04
#define TUI_FLAG_DIRTY        0x08
#define TUI_FLAG_ACTIVE       0x10
#define TUI_FLAG_SELECTED     0x20
#define TUI_FLAG_HOVER        0x40

#define TUI_MOD_SHIFT         0x01

#define TUI_KEY_RETURN        13
#define TUI_KEY_SPACE         32
#define TUI_KEY_RUNSTOP       3
#define TUI_KEY_DELETE        20
#define TUI_KEY_HOME          19
#define TUI_KEY_CURSOR_DOWN   17
#define TUI_KEY_CURSOR_UP     145
#define TUI_KEY_CURSOR_RIGHT  29
#define TUI_KEY_CURSOR_LEFT   157
#define TUI_KEY_FOCUS_NEXT    94

#define TUI_MOUSE_LEFT        0x01

#define TUI_SCREEN_W          40
#define TUI_SCREEN_H          25
```

Less intuitive detail:
- Focus next/prev is implemented with `TUI_KEY_FOCUS_NEXT` (`^`) and optional `TUI_MOD_SHIFT` for reverse traversal.

## 2) Core types and lifecycle

Main public structs:
- `tui_theme_t`: semantic palette.
- `tui_event_t`: input event payload.
- `tui_widget_t`: geometry, flags, identity, tree links, handler.
- `tui_context_t`: toolkit runtime state.

Core lifecycle:

```c
void tui_init(tui_context_t * ctx, CharWin * screen, tui_widget_t * widgets,
              byte max_widgets, const tui_theme_t * theme);
void tui_set_theme(tui_context_t * ctx, const tui_theme_t * theme);

void tui_update(tui_context_t * ctx);
void tui_render(tui_context_t * ctx);
```

Argument guidance:
- `ctx`: caller-owned context storage.
- `screen`: initialized Oscar `CharWin`.
- `widgets`: caller-owned array of `tui_widget_t`, typically `TUI_MAX_WIDGETS`.
- `max_widgets`: usable entries in `widgets`; must be `<= TUI_MAX_WIDGETS`.
- `theme`: `NULL` uses `tui_theme_default`.

Behavior notes:
- `tui_init` resets widget count, focus, popup/modal roots, mouse state, and marks full redraw (`dirty_all = 1`).
- `tui_update` currently ensures some focus exists by calling `tui_focus_next` when needed.
- `tui_render` paints only dirty widgets, except full repaint when `dirty_all` is set.
- Render order: normal widgets first, then `popup_root`, then `modal_root`.

## 3) Widget management and hierarchy

```c
byte tui_widget_alloc(tui_context_t * ctx, byte type, byte x, byte y,
                      byte w, byte h, byte id);
void tui_widget_init(tui_widget_t * widget, byte type, byte x, byte y,
                     byte w, byte h, byte id);
void tui_add_child(tui_context_t * ctx, byte parent, byte child);

void tui_set_visible(tui_widget_t * w, byte visible);
void tui_set_enabled(tui_widget_t * w, byte enabled);
void tui_invalidate(tui_widget_t * w);
void tui_invalidate_region(tui_context_t * ctx, byte x, byte y, byte w, byte h);
```

Argument guidance:
- `type`: one of `tui_widget_type_t` values.
- `x, y, w, h`: absolute screen-space character cell geometry.
- `id`: application-defined widget identifier.
- `parent`, `child`: widget indices returned by `tui_widget_alloc`.
- `visible`, `enabled`: use `0` for false, non-zero for true.

Return value:
- `tui_widget_alloc`: allocated widget index, or `TUI_NONE` if too many widgets allocated already.

Behavior notes:
- Allocated widgets are visible, enabled, dirty by default.
- Focusable-by-default types: button, dropdown button, checkbox, radio, menu bar, dropdown, listbox, text input, dialog.
- `tui_add_child` records parent/sibling links; tree links are used by scope checks (for modal focus filtering).

Less intuitive detail:
- `tui_invalidate_region` marks intersecting visible widgets dirty; it does not clip to parent/container bounds.

## 4) Focus and input dispatch

```c
void tui_focus_set(tui_context_t * ctx, byte widget_index);
void tui_focus_next(tui_context_t * ctx);
void tui_focus_prev(tui_context_t * ctx);

byte tui_dispatch_key(tui_context_t * ctx, byte key, byte modifiers);
byte tui_dispatch_joystick(tui_context_t * ctx, byte joy_mask);
byte tui_dispatch_mouse(tui_context_t * ctx, byte x, byte y, byte buttons);
byte tui_dispatch_event(tui_context_t * ctx, const tui_event_t * evt);

void tui_mouse_set_visible(tui_context_t * ctx, byte visible);
void tui_mouse_set_sprite(tui_context_t * ctx, byte sprite_index);
void tui_mouse_move(tui_context_t * ctx, byte x, byte y);
```

Argument guidance:
- `widget_index`: index into `ctx->widgets`; invalid or non-focusable values are ignored.
- `key`: one C64 key code (`TUI_KEY_*` constants are supported by default logic).
- `modifiers`: bit mask; currently `TUI_MOD_SHIFT` is consumed for reverse focus traversal and shortcut matching.
- `joy_mask`: current implementation uses `0x01` (prev focus), `0x02` (next focus), `0x10` (activate).
- `x, y`: mouse char-cell coordinates.
- `buttons`: bitmask; `TUI_MOUSE_LEFT` supported.

Return value semantics:
- Non-zero means event was consumed/handled.
- Zero means not handled.

Behavior notes:
- RUN/STOP handling (`tui_dispatch_key`):
  - If modal is open: closes modal (`tui_dialog_close(..., TUI_NONE)`).
  - Otherwise: closes current popup/menu (`tui_menu_bar_close`).
- `tui_dispatch_key` scans shortcuts on both menu bar and dropdown widgets when no modal is active.
- Mouse release over widget triggers activation.

Less intuitive detail:
- `tui_mouse_set_visible` and `tui_mouse_set_sprite` only update state in `tui_context_t`; this version does not draw/drive a hardware sprite directly.

## 5) Themes

```c
extern const tui_theme_t tui_theme_default;
void tui_set_theme(tui_context_t * ctx, const tui_theme_t * theme);
```

`tui_theme_t` fields:
- `screen_bg`, `panel_bg`, `border`, `text`
- `focus_text`, `focus_bg`
- `active_text`, `active_bg`
- `disabled_text`, `disabled_bg`
- `selection_text`, `selection_bg`
- `status_info`, `status_warn`, `status_error`

Argument guidance:
- All theme values are C64 color indices (`byte`, usually 0..15).
- Pass `NULL` to `tui_set_theme` to restore `tui_theme_default`.

## 6) Widget APIs by widget type

Note on labels/items for all widgets:
- The toolkit stores pointers only. Keep backing storage valid for the widget lifetime.
- Use raw screencodes/screen-code literals (`s"..."`) for deterministic rendering.

### 6.1 Panel / Frame / Label / Separator

No dedicated setters exist for these types. Use generic helpers:

```c
void tui_button_set_label(tui_widget_t * w, const char * label);
```

Supported targets in practice:
- `TUI_WIDGET_PANEL` / `TUI_WIDGET_FRAME`: `label` is frame title text.
- `TUI_WIDGET_LABEL`: `label` is displayed text.
- Also valid for button-like widgets.

Less intuitive detail:
- `tui_button_set_label` is a shared text setter despite its name.

### 6.2 Status Bar

```c
void tui_statusbar_set_text(tui_widget_t * w, const char * text, byte role);
```

Arguments:
- `w`: status bar widget.
- `text`: status line content.
- `role`: severity/color role.
  - `0` -> `theme->status_info`
  - `1` -> `theme->status_warn`
  - `2` -> `theme->status_error`

### 6.3 Button and Dropdown Button

```c
void tui_button_set_label(tui_widget_t * w, const char * label);
void tui_button_set_action(tui_widget_t * w, tui_event_handler_t handler);

void tui_dropdown_button_set_items(tui_widget_t * w, const char * const * items,
                                   byte count);
void tui_dropdown_button_open(tui_context_t * ctx, byte widget_index);
void tui_dropdown_button_close(tui_context_t * ctx);
```

Arguments:
- `handler`: callback that can consume events; return non-zero to stop default handling.
- `items`, `count`: menu entries for dropdown data.
- `widget_index` in `tui_dropdown_button_open`: widget to show as popup root.

Less intuitive details:
- `tui_dropdown_button_open` takes the popup widget index (usually a `TUI_WIDGET_DROPDOWN`), not necessarily the button index.
- `tui_dropdown_button_set_items` stores dropdown data on the given widget, but `TUI_WIDGET_DROPDOWN_BUTTON` rendering uses label style. In common usage, keep items on a separate `TUI_WIDGET_DROPDOWN` popup and open that popup explicitly.

### 6.4 Checkbox and Radio

```c
void tui_checkbox_set_value(tui_widget_t * w, byte checked);
byte tui_checkbox_get_value(const tui_widget_t * w);
void tui_radio_set_group(tui_widget_t * w, byte group_id);
```

Arguments:
- `checked`: `0` unchecked, non-zero checked.
- `group_id`: application-defined radio group number.

Behavior notes:
- Checkbox and radio share internal `checked` storage.
- Radio activation auto-selects one peer in the same parent and same `group_id`.

Less intuitive detail:
- Radio exclusivity is enforced only on activation path; direct manual writes can still create invalid states until next selection event.

### 6.5 Menu Bar and Dropdown Menu

```c
void tui_menu_bar_set_items(tui_widget_t * w, const char * const * labels, byte count);
void tui_menu_bar_set_dropdown(tui_widget_t * menu_bar, byte item_index,
                               byte dropdown_widget_index);
void tui_menu_item_set_shortcut(tui_widget_t * menu_bar, byte item_index,
                                byte key, byte modifiers);
void tui_menu_bar_open(tui_context_t * ctx, byte menu_bar_index, byte item_index);
void tui_menu_bar_close(tui_context_t * ctx);

void tui_dropdown_set_items(tui_widget_t * w, const char * const * labels, byte count);
void tui_dropdown_set_selected(tui_widget_t * w, byte selected);
byte tui_dropdown_get_selected(const tui_widget_t * w);
```

Arguments:
- `labels`, `count`: menu/dropdown entries; `count` should not exceed widget capacity/height and `TUI_MAX_MENU_ITEMS` for shortcut/dropdown mapping features.
- `item_index`: menu item index.
- `dropdown_widget_index`: widget index of popup dropdown for that menu item.
- `key`, `modifiers`: shortcut tuple matched by `tui_dispatch_key`.

Behavior notes:
- `tui_menu_bar_open` sets selected item, opens mapped popup (if any), and moves focus.
- `tui_menu_bar_close` hides popup and triggers full redraw (`dirty_all = 1`).

Less intuitive details:
- Shortcut storage arrays are bounded by `TUI_MAX_MENU_ITEMS`; out-of-range `item_index` is ignored.
- `tui_dropdown_*` functions are wrappers over listbox-style storage/selection behavior.

### 6.6 List Box

```c
void tui_listbox_set_items(tui_widget_t * w, const char * const * items, byte count);
void tui_listbox_set_selected(tui_widget_t * w, byte selected);
byte tui_listbox_get_selected(const tui_widget_t * w);
void tui_listbox_set_scroll(tui_widget_t * w, byte top);
byte tui_listbox_get_scroll(const tui_widget_t * w);
```

Arguments:
- `items`: array of row strings.
- `count`: number of rows.
- `selected`: selected row index (`0..count-1` recommended).
- `top`: first visible row index (`0..count-1` recommended).

Behavior notes:
- `set_selected` auto-adjusts `top` only when selecting above current viewport.
- Arrow key handling adjusts both `selected` and `top` to keep cursor visible.

Less intuitive detail:
- `set_scroll` does not clamp `top`; caller should provide sane values.

### 6.7 Scrollbar

```c
void tui_scrollbar_set_range(tui_widget_t * w, byte total, byte visible, byte top);
void tui_scrollbar_set_value(tui_widget_t * w, byte top);
byte tui_scrollbar_get_value(const tui_widget_t * w);
```

Arguments:
- `total`: total item count in linked viewport.
- `visible`: number of currently visible rows.
- `top`: first visible row index.

Behavior notes:
- Thumb position is computed from `top`, `total`, and `visible`.
- `tui_scrollbar_set_value/get_value` are aliases to listbox scroll storage.

Less intuitive detail:
- Scrollbar is visual/state-only in current code. Caller synchronizes it with listbox manually.

### 6.8 Text Input

```c
void tui_text_input_set_buffer(tui_widget_t * w, char * buf, byte size);
void tui_text_input_set_cursor(tui_widget_t * w, byte cursor);
byte tui_text_input_get_cursor(const tui_widget_t * w);
```

Arguments:
- `buf`: mutable, null-terminated text buffer owned by caller.
- `size`: total buffer size in bytes including terminator.
- `cursor`: insertion index into `buf`.

Behavior notes:
- Editing supports insert, delete, left, right via default key handler.
- Printable insertion accepted for key codes `32..127`.

Less intuitive details:
- Cursor/value setters do not clamp aggressively; keep `cursor <= strlen(buf)` and `cursor < size`.
- Buffer must be at least 2 bytes for editing logic to operate.

### 6.9 Dialog (Modal)

```c
void tui_dialog_set_message(tui_widget_t * w, const char * message);
void tui_dialog_set_buttons(tui_widget_t * w, const char * const * labels, byte count);
void tui_dialog_open(tui_context_t * ctx, byte dialog_index);
void tui_dialog_close(tui_context_t * ctx, byte result_button);
byte tui_dialog_get_result(const tui_widget_t * w);
```

Arguments:
- `message`: message text; `\n` supported for multiple lines.
- `labels`, `count`: button labels and count (render loop limits to `TUI_MAX_DIALOG_BUTTONS`).
- `dialog_index`: widget index of dialog root.
- `result_button`: caller-defined result value stored in dialog state.

Behavior notes:
- Open sets `modal_root`, marks dialog visible/dirty, and focuses it.
- Close hides dialog, stores result, clears `modal_root`, and requests full redraw.

Less intuitive detail:
- Default dialog activation closes with result `0`; RUN/STOP close path passes `TUI_NONE`.

### 6.10 Progress

```c
void tui_progress_set_value(tui_widget_t * w, byte value, byte max);
```

Arguments:
- `value`: current progress amount.
- `max`: scale maximum.

Meaningful values:
- `max = 0`: empty bar (guarded in renderer).
- Typical: `value <= max`; if greater, render saturates at width.

## 7) Event handler contract

Handler type:

```c
typedef byte (*tui_event_handler_t)(tui_context_t * ctx,
                                    tui_widget_t * widget,
                                    const tui_event_t * event);
```

Best-practice usage:
- Return non-zero when event is fully handled.
- Return `0` to allow default widget behavior.
- Keep handlers short and mostly state-based; call `tui_invalidate` when changing data that affects rendering.

`tui_event_t` fields:
- `type`: `tui_event_type_t` code.
- `key`, `modifiers`, `joy_mask`: keyboard/joystick payload.
- `mouse_x`, `mouse_y`, `mouse_buttons`: mouse payload.

## 8) Minimal usage pattern

```c
static CharWin screen;
static tui_context_t tui;
static tui_widget_t widgets[TUI_MAX_WIDGETS];

cwin_init(&screen, (char *)0x0400, 0, 0, 40, 25);
tui_init(&tui, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);

byte btn = tui_widget_alloc(&tui, TUI_WIDGET_BUTTON, 2, 2, 10, 1, 1);
tui_button_set_label(&widgets[btn], s"OK");

for (;;) {
    int key;
    tui_update(&tui);
    tui_render(&tui);
    key = cwin_getch();
    tui_dispatch_key(&tui, (byte)key, 0);
}
```

## 9) Known implementation-level caveats

- The current public API includes `TUI_WIDGET_TEXT_AREA`, but no dedicated text-area rendering/editing behavior is implemented.
- Several compile-time feature macros are present for configuration consistency, but this codebase version does not gate all behavior behind them yet.
- Popup handling supports one active popup (`ctx->popup_root`) and one modal (`ctx->modal_root`).