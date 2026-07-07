# TUIkit — Text UI Library Reference

TUIkit is a lightweight text-UI toolkit for 40×25 C64 screens. It provides menus, dialogs, list boxes, checkboxes, text inputs, tables, and more — keyboard, joystick, and C64 Ultimate USB mouse driven. TUIkit renders directly through Oscar's `CharWin`, redraws only "dirty" regions, and does **no hidden heap allocation** (you provide a fixed widget pool).

---

## Table of Contents

**This page (framework):**

1. [Quick Start](#quick-start)
2. [Constants & Macros](#constants-macros)
3. [Data Structures](#data-structures)
4. [Core API](#core-api)
5. [Widget Allocation & Management](#widget-allocation-management)
6. [Focus & Navigation](#focus-navigation)
7. [Input Dispatch](#input-dispatch)
8. [Mouse Support](#mouse-support)
9. [Themes](#themes)
10. [Complete Example](#complete-example)
11. [Tips & Best Practices](#tips-best-practices)

**Widget catalog** (separate page): [Button, Checkbox/Radio, List Box, Text Input, Menu Bar, Dropdown, Dialog, Table, Status Bar & Progress](tuikit-widgets.md).

---

## Quick Start

Include the header and set up a basic app loop:

```c
#include <c64/charwin.h>
#include <tuikit/tuikit.h>

int main(void)
{
    CharWin screen;
    tui_widget_t widgets[TUI_MAX_WIDGETS];
    tui_context_t ctx;

    // Initialize screen and TUIkit
    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);

    // Create a button widget
    byte btn = tui_widget_alloc(&ctx, TUI_WIDGET_BUTTON, 5, 10, 10, 1, 0);
    tui_button_set_label(&ctx.widgets[btn], "CLICK ME");

    // Event loop
    while (1) {
        int key = cwin_checkch();
        if (key >= 0)
            tui_dispatch_key(&ctx, key, 0);

        tui_update(&ctx);
        tui_render(&ctx);
    }

    return 0;
}
```

---

## Constants & Macros

### Widget Limits

```c
#define TUI_MAX_WIDGETS              32    // max widgets in a context
#define TUI_MAX_MENU_ITEMS            8    // max items per menu
#define TUI_MAX_DIALOG_BUTTONS        3    // max buttons per dialog
```

### Feature Flags

These are compile-time toggles (define before including tuikit.h):

```c
#define TUI_ENABLE_MOUSE              1    // USB mouse support
#define TUI_ENABLE_TEXT_INPUT         1    // text input widget
#define TUI_ENABLE_TEXT_AREA          0    // multi-line text area
#define TUI_ENABLE_DROPDOWN_BUTTON    1    // dropdown button widget
#define TUI_ENABLE_TABLE              1    // table widget
```

### Theme Selection

Define one before including tuikit.h:

```c
#define TUI_THEME_CLASSIC_BLUE        1    // default: blue theme
// #define TUI_THEME_TERMINAL_GREEN   1    // green terminal theme
// #define TUI_THEME_PAPER_UI         1    // light paper theme
```

### Widget Flags

Used to query and modify widget state:

```c
#define TUI_FLAG_VISIBLE              0x01 // widget is drawn
#define TUI_FLAG_ENABLED              0x02 // widget accepts input
#define TUI_FLAG_CAN_FOCUS            0x04 // widget can receive focus
#define TUI_FLAG_DIRTY                0x08 // needs redraw
#define TUI_FLAG_ACTIVE               0x10 // actively being used
#define TUI_FLAG_SELECTED             0x20 // item is selected
#define TUI_FLAG_HOVER                0x40 // mouse hovering
```

### Input Keys & Modifiers

```c
#define TUI_KEY_RETURN                13   // RETURN key
#define TUI_KEY_SPACE                 32   // spacebar
#define TUI_KEY_RUNSTOP               3    // RUN/STOP key
#define TUI_KEY_DELETE                20   // DEL key
#define TUI_KEY_HOME                  19   // HOME key
#define TUI_KEY_CURSOR_DOWN           17   // cursor down
#define TUI_KEY_CURSOR_UP             145  // cursor up
#define TUI_KEY_CURSOR_RIGHT          29   // cursor right
#define TUI_KEY_CURSOR_LEFT           157  // cursor left
#define TUI_KEY_FOCUS_NEXT            94   // tab-like key (^)
#define TUI_KEY_FOCUS_PREV            222  // shift+tab-like key

#define TUI_MOD_SHIFT                 0x01 // shift modifier
```

### Mouse & Screen

```c
#define TUI_MOUSE_LEFT                0x01 // left mouse button
#define TUI_SCREEN_W                  40   // screen width
#define TUI_SCREEN_H                  25   // screen height
```

### Special Values

```c
#define TUI_NONE                      0xff // no widget / null index
```

---

## Data Structures

### `tui_theme_t` — Color Palette

Defines all colors used by the UI. Each field is a C64 color index (0–15).

```c
typedef struct {
    byte screen_bg;          // background of entire screen
    byte panel_bg;           // background of panels and widgets
    byte border;             // borders and frames
    byte text;               // normal text color
    
    byte focus_text;         // text color when focused
    byte focus_bg;           // background when focused
    
    byte active_text;        // text color when active/pressed
    byte active_bg;          // background when active
    
    byte disabled_text;      // disabled widget text
    byte disabled_bg;        // disabled widget background
    
    byte selection_text;     // selected item text (list boxes, tables)
    byte selection_bg;       // selected item background
    
    byte status_info;        // status bar info color
    byte status_warn;        // status bar warning color
    byte status_error;       // status bar error color
} tui_theme_t;

extern const tui_theme_t tui_theme_default;
```

Predefined themes:
- `tui_theme_default` — classic blue (default)
- Compile with `TUI_THEME_TERMINAL_GREEN` for green terminal theme
- Compile with `TUI_THEME_PAPER_UI` for light paper theme

### `tui_widget_t` — Widget Structure

```c
typedef struct tui_widget {
    byte type;               // widget type (TUI_WIDGET_*)
    byte x, y, w, h;        // position and size on screen
    byte flags;             // TUI_FLAG_* visibility, enabled state, etc.
    byte id;                // app-defined widget ID
    byte parent;            // parent widget index (TUI_NONE if root)
    byte first_child;       // first child widget index
    byte next_sibling;      // next sibling widget index
    byte data_index;        // internal: widget-specific data storage
    tui_event_handler_t handler;  // optional event callback
} tui_widget_t;
```

### `tui_context_t` — UI Context

```c
typedef struct tui_context {
    tui_widget_t * widgets;      // widget array (you provide)
    byte widget_count;           // number of widgets currently allocated
    byte max_widgets;            // maximum capacity
    byte root;                   // root widget index
    byte focused;                // currently focused widget index
    byte popup_root;             // popup/dropdown root (TUI_NONE if none)
    byte modal_root;             // modal dialog root (TUI_NONE if none)
    const tui_theme_t * theme;   // active color theme
    CharWin * screen;            // screen to render to
    byte mouse_x, mouse_y;       // mouse position
    byte mouse_prev_buttons;     // previous mouse button state
    byte mouse_visible;          // mouse cursor visible flag
    byte mouse_sprite;           // sprite index for mouse cursor
    byte hover;                  // widget index under mouse
    byte dirty_all;              // force full screen redraw
} tui_context_t;
```

### `tui_event_t` — Input Event

```c
typedef struct tui_event {
    byte key;                // key code (if TUI_EVT_KEY)
    byte modifiers;          // TUI_MOD_* flags
    byte joy_mask;           // joystick bits (if TUI_EVT_JOYSTICK)
    byte mouse_x;            // mouse X position
    byte mouse_y;            // mouse Y position
    byte mouse_buttons;      // TUI_MOUSE_LEFT, etc.
    byte type;               // event type (TUI_EVT_*)
} tui_event_t;
```

### Event Types

```c
typedef enum {
    TUI_EVT_NONE,            // no event
    TUI_EVT_KEY,             // keyboard key pressed
    TUI_EVT_JOYSTICK,        // joystick input
    TUI_EVT_MOUSE_POLL,      // mouse state polled
    TUI_EVT_MOUSE_MOVE,      // mouse moved
    TUI_EVT_MOUSE_DOWN,      // mouse button down
    TUI_EVT_MOUSE_UP,        // mouse button up
    TUI_EVT_MOUSE_DRAG,      // mouse drag
    TUI_EVT_FOCUS,           // widget received focus
    TUI_EVT_BLUR,            // widget lost focus
    TUI_EVT_ACTIVATE,        // widget activated (RETURN on button, etc.)
    TUI_EVT_VALUE_CHANGED,   // widget value changed (checkbox, input, etc.)
    TUI_EVT_OPEN,            // dialog/menu opened
    TUI_EVT_CLOSE,           // dialog/menu closed
    TUI_EVT_CANCEL           // dialog cancelled
} tui_event_type_t;
```

### Widget Types

```c
typedef enum {
    TUI_WIDGET_PANEL,        // container / background panel
    TUI_WIDGET_FRAME,        // bordered frame
    TUI_WIDGET_STATUSBAR,    // status bar (often at bottom)
    TUI_WIDGET_LABEL,        // static text label
    TUI_WIDGET_BUTTON,       // clickable button
    TUI_WIDGET_DROPDOWN_BUTTON,  // button with dropdown menu
    TUI_WIDGET_CHECKBOX,     // checkbox
    TUI_WIDGET_RADIO,        // radio button
    TUI_WIDGET_MENU_BAR,     // top menu bar
    TUI_WIDGET_DROPDOWN,     // dropdown list (auto-opened by menu bar)
    TUI_WIDGET_LISTBOX,      // scrollable list
    TUI_WIDGET_SCROLLBAR,    // vertical scrollbar
    TUI_WIDGET_TEXT_INPUT,   // single-line text input
    TUI_WIDGET_TEXT_AREA,    // multi-line text area (if enabled)
    TUI_WIDGET_DIALOG,       // modal dialog box
    TUI_WIDGET_SEPARATOR,    // visual separator line
    TUI_WIDGET_PROGRESS,     // progress bar
    TUI_WIDGET_TABLE         // multi-column table (if enabled)
} tui_widget_type_t;
```

### Event Handler Callback

```c
typedef byte (*tui_event_handler_t)(tui_context_t * ctx, 
                                    tui_widget_t * widget, 
                                    const tui_event_t * event);
```

Return `1` to consume the event, `0` to let other widgets handle it.

---

## Core API

### Initialization

```c
void tui_init(tui_context_t * ctx, 
              CharWin * screen, 
              tui_widget_t * widgets, 
              byte max_widgets, 
              const tui_theme_t * theme);
```

Initialize a TUIkit context. Call once at startup.

**Parameters:**
- `ctx` — context to initialize
- `screen` — CharWin to render to
- `widgets` — array of widget structures you provide
- `max_widgets` — size of the widgets array (typically `TUI_MAX_WIDGETS`)
- `theme` — color theme (usually `&tui_theme_default`)

### Theme Switching

```c
void tui_set_theme(tui_context_t * ctx, const tui_theme_t * theme);
```

Change the active theme. All widgets redraw on the next `tui_render()` call.

### Update & Render

```c
void tui_update(tui_context_t * ctx);
void tui_render(tui_context_t * ctx);
```

- `tui_update()` — process internal state changes and mark widgets for redraw.
- `tui_render()` — render all dirty widgets to the screen.

Call both in your game loop:

```c
while (running) {
    // Read input
    int key = cwin_checkch();
    if (key >= 0)
        tui_dispatch_key(&ctx, key, 0);

    // Update and draw
    tui_update(&ctx);
    tui_render(&ctx);
}
```

---

## Widget Allocation & Management

### Allocate a Widget

```c
byte tui_widget_alloc(tui_context_t * ctx, 
                      byte type, 
                      byte x, byte y, 
                      byte w, byte h, 
                      byte id);
```

Allocate a new widget and return its index. Returns `TUI_NONE` if the pool is full.

**Parameters:**
- `ctx` — context
- `type` — `TUI_WIDGET_*` constant
- `x, y` — screen position
- `w, h` — width and height in characters
- `id` — app-defined ID (for event routing; can be 0)

**Example:**

```c
byte button_idx = tui_widget_alloc(&ctx, TUI_WIDGET_BUTTON, 5, 10, 15, 1, 1);
if (button_idx == TUI_NONE) {
    printf("Too many widgets!");
    return;
}
tui_button_set_label(&ctx.widgets[button_idx], "CLICK ME");
```

### Widget Initialization (Manual)

```c
void tui_widget_init(tui_widget_t * widget, 
                     byte type, 
                     byte x, byte y, 
                     byte w, byte h, 
                     byte id);
```

Manually initialize a widget structure without allocating from the pool. Rarely needed.

### Parent-Child Relationships

```c
void tui_add_child(tui_context_t * ctx, byte parent, byte child);
```

Add `child` widget as a child of `parent`. Used for layout hierarchy and event scoping.

### Visibility & Enabled State

```c
void tui_set_visible(tui_widget_t * w, byte visible);
void tui_set_enabled(tui_widget_t * w, byte enabled);
```

- `tui_set_visible()` — show or hide a widget.
- `tui_set_enabled()` — enable/disable interaction (disabled widgets appear grayed).

### Invalidate (Mark for Redraw)

```c
void tui_invalidate(tui_widget_t * w);
void tui_invalidate_region(tui_context_t * ctx, byte x, byte y, byte w, byte h);
```

- `tui_invalidate()` — mark a single widget as dirty.
- `tui_invalidate_region()` — mark a rectangular screen region as dirty.

The next `tui_render()` call will redraw these areas.

---

## Focus & Navigation

### Set Focus

```c
void tui_focus_set(tui_context_t * ctx, byte widget_index);
```

Move input focus to a widget. Only visible, enabled widgets that have `TUI_FLAG_CAN_FOCUS` can receive focus.

### Focus Navigation

```c
void tui_focus_next(tui_context_t * ctx);
void tui_focus_prev(tui_context_t * ctx);
```

Move focus to the next or previous focusable widget. Useful for TAB / Shift+TAB behavior.

---

## Input Dispatch

### Keyboard Input

```c
byte tui_dispatch_key(tui_context_t * ctx, 
                      byte key, 
                      byte modifiers);
```

Route a keyboard event to widgets. Returns `1` if the key was consumed, `0` otherwise.

**Parameters:**
- `key` — PETSCII key code
- `modifiers` — `TUI_MOD_SHIFT` or 0

**Example:**

```c
int key = cwin_getch();
if (tui_dispatch_key(&ctx, key, 0)) {
    // Key was handled by TUIkit
} else {
    // Your app handles the key
}
```

### Joystick Input

```c
byte tui_dispatch_joystick(tui_context_t * ctx, byte joy_mask);
```

Route joystick input. `joy_mask` is the same format as `joy_poll()` result:

```c
#define JOY_UP      0x01
#define JOY_DOWN    0x02
#define JOY_LEFT    0x04
#define JOY_RIGHT   0x08
#define JOY_FIRE    0x10
```

### Mouse Input

```c
byte tui_dispatch_mouse(tui_context_t * ctx, 
                        byte x, byte y, 
                        byte buttons);
```

Route mouse movement and button state.

### Generic Event Dispatch

```c
byte tui_dispatch_event(tui_context_t * ctx, const tui_event_t * evt);
```

Dispatch a manually constructed event structure.

---

## Mouse Support

### Show/Hide Mouse Cursor

```c
void tui_mouse_set_visible(tui_context_t * ctx, byte visible);
```

Show or hide the mouse cursor sprite.

### Set Mouse Sprite

```c
void tui_mouse_set_sprite(tui_context_t * ctx, byte sprite_index);
```

Assign a hardware sprite for the mouse cursor. Sprite data must be pre-loaded.

### Move Mouse Cursor

```c
void tui_mouse_move(tui_context_t * ctx, byte x, byte y);
```

Move the mouse cursor to a screen position.

**Typical usage with C64 Ultimate USB mouse:**

```c
#include <c64/mousedrv.h>

// In your loop:
mouse_poll();
if (mouse_x != old_mouse_x || mouse_y != old_mouse_y || mouse_buttons != old_buttons) {
    tui_dispatch_mouse(&ctx, mouse_x, mouse_y, mouse_buttons);
    old_mouse_x = mouse_x;
    old_mouse_y = mouse_y;
    old_buttons = mouse_buttons;
}
```

---

> **Widgets:** buttons, checkboxes, radio buttons, list boxes, text inputs, menu bars, dropdowns, dialogs, tables, and status/progress bars each have their own creation and API. They are documented in the [Widget Catalog](tuikit-widgets.md).

---

## Themes

### Using Predefined Themes

```c
// Blue theme (default)
tui_init(&ctx, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);

// Green terminal theme (compile-time)
#define TUI_THEME_TERMINAL_GREEN 1
#include <tuikit/tuikit.h>
tui_init(&ctx, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);

// Light paper theme (compile-time)
#define TUI_THEME_PAPER_UI 1
#include <tuikit/tuikit.h>
tui_init(&ctx, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);
```

### Creating a Custom Theme

```c
static const tui_theme_t my_theme = {
    .screen_bg      = 0,    // black background
    .panel_bg       = 1,    // white panels
    .border         = 2,    // red borders
    .text           = 0,    // black text
    .focus_text     = 1,    // white text when focused
    .focus_bg       = 2,    // red background when focused
    .active_text    = 1,    // white when active
    .active_bg      = 4,    // purple when active
    .disabled_text  = 11,   // dark grey when disabled
    .disabled_bg    = 1,    // white background
    .selection_text = 0,    // black selected text
    .selection_bg   = 3,    // cyan background
    .status_info    = 2,    // red info
    .status_warn    = 7,    // yellow warning
    .status_error   = 2     // red error
};

tui_set_theme(&ctx, &my_theme);
```

C64 color indexes: 0=black, 1=white, 2=red, 3=cyan, 4=purple, 5=green, 6=blue, 7=yellow, 8=orange, 9=brown, 10=light red, 11=dark grey, 12=grey, 13=light green, 14=light blue, 15=light grey.

---

## Complete Example

A full menu-driven application:

```c
#include <stdio.h>
#include <string.h>
#include <c64/charwin.h>
#include <tuikit/tuikit.h>

static const char * MENU_ITEMS[] = {s"FILE", s"EDIT", s"HELP"};
static const char * FILE_OPTIONS[] = {s"NEW", s"SAVE", s"QUIT"};
static const char * DIALOG_BUTTONS[] = {s"OK", s"CANCEL"};

CharWin screen;
tui_widget_t widgets[TUI_MAX_WIDGETS];
tui_context_t ctx;

byte menu_handler(tui_context_t * c, tui_widget_t * w, const tui_event_t * e)
{
    if (e->type == TUI_EVT_ACTIVATE) {
        printf("Menu item selected!\n");
        return 1;
    }
    return 0;
}

int main(void)
{
    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);

    // Menu bar
    byte menu = tui_widget_alloc(&ctx, TUI_WIDGET_MENU_BAR, 0, 0, 40, 1, 1);
    tui_menu_bar_set_items(&ctx.widgets[menu], MENU_ITEMS, 3);
    ctx.widgets[menu].handler = menu_handler;

    // File dropdown
    byte file_dd = tui_widget_alloc(&ctx, TUI_WIDGET_DROPDOWN, 0, 1, 10, 4, 2);
    tui_dropdown_set_items(&ctx.widgets[file_dd], FILE_OPTIONS, 3);
    tui_menu_bar_set_dropdown(&ctx.widgets[menu], 0, file_dd);

    // Dialog
    byte dialog = tui_widget_alloc(&ctx, TUI_WIDGET_DIALOG, 5, 8, 30, 8, 3);
    tui_dialog_set_message(&ctx.widgets[dialog], s"Hello, World!");
    tui_dialog_set_buttons(&ctx.widgets[dialog], DIALOG_BUTTONS, 2);

    // Start with menu focused
    tui_focus_set(&ctx, menu);

    while (1) {
        int key = cwin_checkch();
        if (key == 3) break;  // RUN/STOP
        if (key >= 0)
            tui_dispatch_key(&ctx, key, 0);

        tui_update(&ctx);
        tui_render(&ctx);
    }

    return 0;
}
```

---

## Tips & Best Practices

**Borrowed Pointers:** TUIkit does not copy item arrays (menus, lists, table data). Keep them as `static const` so they outlive the widget.

**Widget Pool:** Pre-allocate your widget array on the stack. TUIkit will not allocate dynamically. If you run out of space, `tui_widget_alloc()` returns `TUI_NONE`.

**Event Handlers:** Assign handlers to widgets to react to `TUI_EVT_ACTIVATE`, `TUI_EVT_VALUE_CHANGED`, etc. Return `1` to consume, `0` to propagate.

**Dirty Regions:** Widgets automatically mark themselves dirty when their state changes. `tui_render()` only redraws dirty areas — it's efficient even on the slow 6502.

**Modal Dialogs:** When a dialog is open, it consumes input and prevents interaction with other widgets. Call `tui_dialog_close()` to return control.

**Performance:** TUIkit works entirely through `CharWin`, which uses direct screen RAM writes. No flickering, no hidden allocations, no surprises.
