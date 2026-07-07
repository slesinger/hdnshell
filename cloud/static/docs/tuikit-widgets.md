# TUIkit — Widget Catalog

> Part of the [TUIkit Reference](tuikit-reference.md). This page documents each widget type. For setup, context/theme structures, the core update/render loop, input dispatch, mouse support, and themes, see the main [TUIkit Reference](tuikit-reference.md).

## Table of Contents

1. [Button API](#button-api)
2. [Checkbox & Radio Buttons](#checkbox-radio-buttons)
3. [List Box API](#list-box-api)
4. [Text Input API](#text-input-api)
5. [Menu Bar API](#menu-bar-api)
6. [Dropdown Menu API](#dropdown-menu-api)
7. [Dialog API](#dialog-api)
8. [Table API](#table-api)
9. [Status Bar & Progress](#status-bar-progress)

---

## Button API

### Create a Button

```c
byte btn = tui_widget_alloc(&ctx, TUI_WIDGET_BUTTON, 5, 10, 15, 1, 1);
```

Buttons are typically 1 character tall. Width should fit the label text.

### Set Button Label

```c
void tui_button_set_label(tui_widget_t * w, const char * label);
```

Set the button text. Use a `static const` string:

```c
static const char LABEL[] = "SUBMIT";
tui_button_set_label(&ctx.widgets[btn], LABEL);
```

### Handle Button Events

Buttons fire `TUI_EVT_ACTIVATE` when pressed (RETURN or mouse click). Set a handler:

```c
byte my_button_handler(tui_context_t * ctx, tui_widget_t * widget, const tui_event_t * event)
{
    if (event->type == TUI_EVT_ACTIVATE) {
        printf("Button clicked!\n");
        return 1;  // consume event
    }
    return 0;      // let other widgets handle
}

tui_widget_t * btn_widget = &ctx.widgets[btn_idx];
btn_widget->handler = my_button_handler;
```

### Example: Simple Button

```c
static const char LABEL[] = s"OK";

byte my_handler(tui_context_t * ctx, tui_widget_t * w, const tui_event_t * evt)
{
    if (evt->type == TUI_EVT_ACTIVATE) {
        printf("OK pressed\n");
        return 1;
    }
    return 0;
}

int main(void)
{
    CharWin screen;
    tui_widget_t widgets[32];
    tui_context_t ctx;

    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, 32, &tui_theme_default);

    byte btn = tui_widget_alloc(&ctx, TUI_WIDGET_BUTTON, 15, 10, 10, 1, 1);
    tui_button_set_label(&ctx.widgets[btn], LABEL);
    ctx.widgets[btn].handler = my_handler;
    tui_focus_set(&ctx, btn);

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

## Checkbox & Radio Buttons

### Checkbox

```c
byte cb = tui_widget_alloc(&ctx, TUI_WIDGET_CHECKBOX, 5, 5, 20, 1, 2);
tui_checkbox_set_value(&ctx.widgets[cb], 0);  // unchecked
```

**API:**

```c
void tui_checkbox_set_value(tui_widget_t * w, byte checked);
byte tui_checkbox_get_value(const tui_widget_t * w);
```

Checkboxes toggle on SPACE or mouse click, firing `TUI_EVT_VALUE_CHANGED`.

### Radio Button

```c
byte radio1 = tui_widget_alloc(&ctx, TUI_WIDGET_RADIO, 5, 7, 10, 1, 3);
byte radio2 = tui_widget_alloc(&ctx, TUI_WIDGET_RADIO, 5, 8, 10, 1, 4);

tui_radio_set_group(&ctx.widgets[radio1], 1);  // group 1
tui_radio_set_group(&ctx.widgets[radio2], 1);  // same group
```

**API:**

```c
void tui_radio_set_group(tui_widget_t * w, byte group_id);
```

Only one radio button per group can be selected. Clicking selects it and deselects others in the group.

---

## List Box API

### Create a List Box

```c
byte listbox = tui_widget_alloc(&ctx, TUI_WIDGET_LISTBOX, 1, 5, 20, 10, 5);
```

List boxes are typically several rows tall. Width should fit the longest item.

### Set Items

```c
static const char * ITEMS[] = {
    "OPTION A",
    "OPTION B",
    "OPTION C"
};

tui_listbox_set_items(&ctx.widgets[listbox], ITEMS, 3);
```

**Important:** TUIkit borrows the pointer to your array. Keep it as `static const`.

### Get/Set Selection

```c
byte tui_listbox_get_selected(const tui_widget_t * w);
void tui_listbox_set_selected(tui_widget_t * w, byte selected);
```

### Scrolling

```c
void tui_listbox_set_scroll(tui_widget_t * w, byte top);
byte tui_listbox_get_scroll(const tui_widget_t * w);
```

For lists longer than the visible area, control the top-visible item.

### Example: Interactive List

```c
static const char * COLORS[] = {
    "RED",
    "GREEN",
    "BLUE",
    "YELLOW"
};

byte list_handler(tui_context_t * ctx, tui_widget_t * w, const tui_event_t * evt)
{
    if (evt->type == TUI_EVT_ACTIVATE) {
        byte selected = tui_listbox_get_selected(w);
        printf("Selected: %s\n", COLORS[selected]);
        return 1;
    }
    return 0;
}

// In main:
byte list = tui_widget_alloc(&ctx, TUI_WIDGET_LISTBOX, 5, 5, 15, 8, 10);
tui_listbox_set_items(&ctx.widgets[list], COLORS, 4);
ctx.widgets[list].handler = list_handler;
```

---

## Text Input API

### Create a Text Input

```c
byte input = tui_widget_alloc(&ctx, TUI_WIDGET_TEXT_INPUT, 5, 10, 20, 1, 11);
```

Text inputs are 1 row tall. Width is the visible length (max input length set separately).

### Set Buffer

```c
char input_buf[32];
memset(input_buf, 0, sizeof(input_buf));
tui_text_input_set_buffer(&ctx.widgets[input], input_buf, sizeof(input_buf) - 1);
```

The buffer holds the entered text. You provide it; TUIkit doesn't allocate.

### Cursor Position

```c
void tui_text_input_set_cursor(tui_widget_t * w, byte cursor);
byte tui_text_input_get_cursor(const tui_widget_t * w);
```

### Example: Login Form

```c
char username[16];
char password[16];

int main(void)
{
    CharWin screen;
    tui_widget_t widgets[32];
    tui_context_t ctx;

    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, 32, &tui_theme_default);

    // Username input
    cwin_putat_string(&screen, 2, 5, s"USERNAME:", 14);
    byte user_input = tui_widget_alloc(&ctx, TUI_WIDGET_TEXT_INPUT, 15, 5, 20, 1, 20);
    tui_text_input_set_buffer(&ctx.widgets[user_input], username, sizeof(username) - 1);

    // Password input
    cwin_putat_string(&screen, 2, 7, s"PASSWORD:", 14);
    byte pass_input = tui_widget_alloc(&ctx, TUI_WIDGET_TEXT_INPUT, 15, 7, 20, 1, 21);
    tui_text_input_set_buffer(&ctx.widgets[pass_input], password, sizeof(password) - 1);

    tui_focus_set(&ctx, user_input);

    while (1) {
        int key = cwin_checkch();
        if (key == 3) break;  // RUN/STOP
        if (key >= 0)
            tui_dispatch_key(&ctx, key, 0);
        tui_update(&ctx);
        tui_render(&ctx);
    }

    printf("USER: %s\n", username);
    printf("PASS: %s\n", password);
    return 0;
}
```

---

## Menu Bar API

### Create a Menu Bar

```c
byte menu = tui_widget_alloc(&ctx, TUI_WIDGET_MENU_BAR, 0, 0, 40, 1, 30);
```

Menu bars are typically at the top and span the full width.

### Set Menu Items

```c
static const char * MENUS[] = {
    "FILE",
    "EDIT",
    "HELP"
};

tui_menu_bar_set_items(&ctx.widgets[menu], MENUS, 3);
```

Keep the array as `static const`.

### Set Dropdown for Menu Item

```c
// Create a dropdown list
byte dropdown = tui_widget_alloc(&ctx, TUI_WIDGET_DROPDOWN, 0, 1, 15, 5, 31);

static const char * FILE_ITEMS[] = {
    "NEW",
    "OPEN",
    "SAVE"
};
tui_dropdown_set_items(&ctx.widgets[dropdown], FILE_ITEMS, 3);

// Attach dropdown to "FILE" menu item (index 0)
tui_menu_bar_set_dropdown(&ctx.widgets[menu], 0, dropdown);
```

### Set Keyboard Shortcuts

```c
tui_menu_item_set_shortcut(&ctx.widgets[menu], 0, 'N', TUI_MOD_SHIFT);
```

When the shortcut is pressed, opens the menu item's dropdown (if attached).

### Example: File Menu

```c
static const char * MENUS[] = {s"FILE", s"EDIT"};
static const char * FILE_ITEMS[] = {s"NEW", s"OPEN", s"SAVE", s"QUIT"};

int main(void)
{
    CharWin screen;
    tui_widget_t widgets[32];
    tui_context_t ctx;

    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, 32, &tui_theme_default);

    // Menu bar
    byte menu = tui_widget_alloc(&ctx, TUI_WIDGET_MENU_BAR, 0, 0, 40, 1, 30);
    tui_menu_bar_set_items(&ctx.widgets[menu], MENUS, 2);

    // FILE dropdown
    byte file_dd = tui_widget_alloc(&ctx, TUI_WIDGET_DROPDOWN, 0, 1, 12, 5, 31);
    tui_dropdown_set_items(&ctx.widgets[file_dd], FILE_ITEMS, 4);
    tui_menu_bar_set_dropdown(&ctx.widgets[menu], 0, file_dd);

    tui_focus_set(&ctx, menu);

    while (1) {
        int key = cwin_checkch();
        if (key == 3) break;
        if (key >= 0)
            tui_dispatch_key(&ctx, key, 0);
        tui_update(&ctx);
        tui_render(&ctx);
    }
    return 0;
}
```

---

## Dropdown Menu API

Dropdowns are typically created by a menu bar, but can be standalone or used with dropdown buttons.

### Set Items

```c
void tui_dropdown_set_items(tui_widget_t * w, const char * const * labels, byte count);
```

### Get Selection

```c
byte tui_dropdown_get_selected(const tui_widget_t * w);
void tui_dropdown_set_selected(tui_widget_t * w, byte selected);
```

### Dropdown Button

A button that opens a dropdown menu:

```c
byte db = tui_widget_alloc(&ctx, TUI_WIDGET_DROPDOWN_BUTTON, 10, 5, 20, 1, 40);

static const char * OPTS[] = {s"OPTION 1", s"OPTION 2"};
tui_dropdown_button_set_items(&ctx.widgets[db], OPTS, 2);
```

**API:**

```c
void tui_dropdown_button_set_items(tui_widget_t * w, const char * const * items, byte count);
void tui_dropdown_button_open(tui_context_t * ctx, byte widget_index);
void tui_dropdown_button_close(tui_context_t * ctx);
```

---

## Dialog API

### Create a Dialog

```c
byte dlg = tui_widget_alloc(&ctx, TUI_WIDGET_DIALOG, 5, 8, 30, 8, 50);
```

Dialogs are typically centered and several rows tall.

### Set Message

```c
tui_dialog_set_message(&ctx.widgets[dlg], "Are you sure?");
```

### Set Buttons

```c
static const char * BUTTONS[] = {s"YES", s"NO"};
tui_dialog_set_buttons(&ctx.widgets[dlg], BUTTONS, 2);
```

### Open/Close Dialog

```c
tui_dialog_open(&ctx, dlg);       // show and make modal
tui_dialog_close(&ctx, button_index);  // close, store which button was pressed
```

### Get Result

```c
byte button = tui_dialog_get_result(&ctx.widgets[dlg]);
// button is the index of the pressed button, or TUI_NONE if not yet closed
```

### Example: Confirmation Dialog

```c
byte dlg_handler(tui_context_t * ctx, tui_widget_t * w, const tui_event_t * evt)
{
    if (evt->type == TUI_EVT_ACTIVATE) {
        // User pressed a button
        byte button = tui_dialog_get_result(w);
        if (button == 0) {
            printf("Confirmed!\n");
        } else {
            printf("Cancelled.\n");
        }
        tui_dialog_close(ctx, button);
        return 1;
    }
    return 0;
}

// In main:
static const char * CONFIRM_MSG = s"Delete file?";
static const char * BUTTONS[] = {s"YES", s"NO"};

byte dlg = tui_widget_alloc(&ctx, TUI_WIDGET_DIALOG, 5, 8, 30, 8, 50);
tui_dialog_set_message(&ctx.widgets[dlg], CONFIRM_MSG);
tui_dialog_set_buttons(&ctx.widgets[dlg], BUTTONS, 2);
ctx.widgets[dlg].handler = dlg_handler;

// Open dialog when needed:
tui_dialog_open(&ctx, dlg);
```

---

## Table API

Tables display multi-column data (requires `TUI_ENABLE_TABLE = 1`).

### Create a Table

```c
byte table = tui_widget_alloc(&ctx, TUI_WIDGET_TABLE, 1, 3, 38, 15, 60);
```

### Set Columns

```c
static const char * HEADERS[] = {s"NAME", s"AGE", s"SCORE"};
static const byte WIDTHS[] = {15, 5, 8};

tui_table_set_columns(&ctx.widgets[table], HEADERS, WIDTHS, 3);
```

Widths are in characters.

### Set Data

```c
static const char * DATA[] = {
    s"ALICE", s"25", s"9500",
    s"BOB",   s"30", s"8700"
};

tui_table_set_cells(&ctx.widgets[table], DATA, 2);  // 2 rows
```

Data is in row-major order: all columns of row 1, then row 2, etc.

### Selection & Scrolling

```c
void tui_table_set_selected(tui_widget_t * w, byte row);
byte tui_table_get_selected(const tui_widget_t * w);

void tui_table_set_scroll(tui_widget_t * w, byte top);
byte tui_table_get_scroll(const tui_widget_t * w);
```

### Example: Leaderboard

```c
int main(void)
{
    CharWin screen;
    tui_widget_t widgets[32];
    tui_context_t ctx;

    cwin_init(&screen, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&screen);
    tui_init(&ctx, &screen, widgets, 32, &tui_theme_default);

    static const char * HEADERS[] = {s"PLAYER", s"SCORE"};
    static const byte WIDTHS[] = {20, 10};

    static const char * DATA[] = {
        s"ALICE",     s"9500",
        s"BOB",       s"8700",
        s"CHARLIE",   s"7200"
    };

    byte table = tui_widget_alloc(&ctx, TUI_WIDGET_TABLE, 1, 2, 38, 10, 60);
    tui_table_set_columns(&ctx.widgets[table], HEADERS, WIDTHS, 2);
    tui_table_set_cells(&ctx.widgets[table], DATA, 3);

    while (1) {
        int key = cwin_checkch();
        if (key == 3) break;
        if (key >= 0)
            tui_dispatch_key(&ctx, key, 0);
        tui_update(&ctx);
        tui_render(&ctx);
    }
    return 0;
}
```

---

## Status Bar & Progress

### Status Bar

```c
byte status = tui_widget_alloc(&ctx, TUI_WIDGET_STATUSBAR, 0, 24, 40, 1, 70);
tui_statusbar_set_text(&ctx.widgets[status], "Ready", 0);  // role 0 = info
```

**Roles:**

```c
#define TUI_STATUS_INFO    0
#define TUI_STATUS_WARN    1
#define TUI_STATUS_ERROR   2
```

### Progress Bar

```c
byte prog = tui_widget_alloc(&ctx, TUI_WIDGET_PROGRESS, 5, 12, 30, 1, 71);
tui_progress_set_value(&ctx.widgets[prog], 50, 100);  // 50%
```

---

Back to the [TUIkit Reference](tuikit-reference.md) for themes, the complete example, and best practices.
