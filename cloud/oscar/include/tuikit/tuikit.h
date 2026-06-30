#ifndef TUIKIT_H
#define TUIKIT_H

#include <c64/types.h>
#include <c64/charwin.h>

#ifndef TUI_MAX_WIDGETS
#define TUI_MAX_WIDGETS              32
#endif
#ifndef TUI_MAX_MENU_ITEMS
#define TUI_MAX_MENU_ITEMS            8
#endif
#ifndef TUI_MAX_DIALOG_BUTTONS
#define TUI_MAX_DIALOG_BUTTONS        3
#endif

#ifndef TUI_ENABLE_MOUSE
#define TUI_ENABLE_MOUSE              1
#endif
#ifndef TUI_ENABLE_TEXT_INPUT
#define TUI_ENABLE_TEXT_INPUT         1
#endif
#ifndef TUI_ENABLE_TEXT_AREA
#define TUI_ENABLE_TEXT_AREA          0
#endif
#ifndef TUI_ENABLE_DROPDOWN_BUTTON
#define TUI_ENABLE_DROPDOWN_BUTTON    1
#endif

#if !defined(TUI_THEME_TERMINAL_GREEN) && !defined(TUI_THEME_PAPER_UI)
#define TUI_THEME_CLASSIC_BLUE        1
#endif

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
#define TUI_KEY_FOCUS_PREV   222

#define TUI_MOUSE_LEFT        0x01

#define TUI_SCREEN_W          40
#define TUI_SCREEN_H          25

typedef enum {
	TUI_WIDGET_PANEL,
	TUI_WIDGET_FRAME,
	TUI_WIDGET_STATUSBAR,
	TUI_WIDGET_LABEL,
	TUI_WIDGET_BUTTON,
	TUI_WIDGET_DROPDOWN_BUTTON,
	TUI_WIDGET_CHECKBOX,
	TUI_WIDGET_RADIO,
	TUI_WIDGET_MENU_BAR,
	TUI_WIDGET_DROPDOWN,
	TUI_WIDGET_LISTBOX,
	TUI_WIDGET_SCROLLBAR,
	TUI_WIDGET_TEXT_INPUT,
	TUI_WIDGET_TEXT_AREA,
	TUI_WIDGET_DIALOG,
	TUI_WIDGET_SEPARATOR,
	TUI_WIDGET_PROGRESS
} tui_widget_type_t;

typedef enum {
	TUI_STATE_IDLE,
	TUI_STATE_FOCUSED,
	TUI_STATE_ACTIVE,
	TUI_STATE_DISABLED
} tui_state_t;

typedef enum {
	TUI_EVT_NONE,
	TUI_EVT_KEY,
	TUI_EVT_JOYSTICK,
	TUI_EVT_MOUSE_POLL,
	TUI_EVT_MOUSE_MOVE,
	TUI_EVT_MOUSE_DOWN,
	TUI_EVT_MOUSE_UP,
	TUI_EVT_MOUSE_DRAG,
	TUI_EVT_FOCUS,
	TUI_EVT_BLUR,
	TUI_EVT_ACTIVATE,
	TUI_EVT_VALUE_CHANGED,
	TUI_EVT_OPEN,
	TUI_EVT_CLOSE,
	TUI_EVT_CANCEL
} tui_event_type_t;

typedef struct {
	byte screen_bg, panel_bg, border, text;
	byte focus_text, focus_bg;
	byte active_text, active_bg;
	byte disabled_text, disabled_bg;
	byte selection_text, selection_bg;
	byte status_info, status_warn, status_error;
} tui_theme_t;

typedef struct tui_widget tui_widget_t;
typedef struct tui_context tui_context_t;
typedef struct tui_event tui_event_t;

typedef byte (*tui_event_handler_t)(tui_context_t * ctx, tui_widget_t * widget, const tui_event_t * event);

struct tui_event {
	byte key;
	byte modifiers;
	byte joy_mask;
	byte mouse_x;
	byte mouse_y;
	byte mouse_buttons;
	byte type;
};

struct tui_widget {
	byte type;
	byte x, y, w, h;
	byte flags;
	byte id;
	byte parent;
	byte first_child;
	byte next_sibling;
	byte data_index;
	tui_event_handler_t handler;
};

struct tui_context {
	tui_widget_t * widgets;
	byte widget_count;
	byte max_widgets;
	byte root;
	byte focused;
	byte popup_root;
	byte modal_root;
	const tui_theme_t * theme;
	CharWin * screen;
	byte mouse_x;
	byte mouse_y;
	byte mouse_prev_buttons;
	byte mouse_visible;
	byte mouse_sprite;
	byte hover;
	byte dirty_all;
};

extern const tui_theme_t tui_theme_default;

void tui_init(tui_context_t * ctx, CharWin * screen, tui_widget_t * widgets, byte max_widgets, const tui_theme_t * theme);
void tui_set_theme(tui_context_t * ctx, const tui_theme_t * theme);

byte tui_widget_alloc(tui_context_t * ctx, byte type, byte x, byte y, byte w, byte h, byte id);
void tui_widget_init(tui_widget_t * widget, byte type, byte x, byte y, byte w, byte h, byte id);
void tui_add_child(tui_context_t * ctx, byte parent, byte child);
void tui_set_visible(tui_widget_t * w, byte visible);
void tui_set_enabled(tui_widget_t * w, byte enabled);
void tui_invalidate(tui_widget_t * w);
void tui_invalidate_region(tui_context_t * ctx, byte x, byte y, byte w, byte h);

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

void tui_update(tui_context_t * ctx);
void tui_render(tui_context_t * ctx);

void tui_button_set_label(tui_widget_t * w, const char * label);
void tui_button_set_action(tui_widget_t * w, tui_event_handler_t handler);

void tui_checkbox_set_value(tui_widget_t * w, byte checked);
byte tui_checkbox_get_value(const tui_widget_t * w);
void tui_radio_set_group(tui_widget_t * w, byte group_id);

void tui_listbox_set_items(tui_widget_t * w, const char * const * items, byte count);
void tui_listbox_set_selected(tui_widget_t * w, byte selected);
byte tui_listbox_get_selected(const tui_widget_t * w);
void tui_listbox_set_scroll(tui_widget_t * w, byte top);
byte tui_listbox_get_scroll(const tui_widget_t * w);

void tui_text_input_set_buffer(tui_widget_t * w, char * buf, byte size);
void tui_text_input_set_cursor(tui_widget_t * w, byte cursor);
byte tui_text_input_get_cursor(const tui_widget_t * w);

void tui_menu_bar_set_items(tui_widget_t * w, const char * const * labels, byte count);
void tui_menu_bar_set_dropdown(tui_widget_t * menu_bar, byte item_index, byte dropdown_widget_index);
void tui_menu_item_set_shortcut(tui_widget_t * menu_bar, byte item_index, byte key, byte modifiers);
void tui_menu_bar_open(tui_context_t * ctx, byte menu_bar_index, byte item_index);
void tui_menu_bar_close(tui_context_t * ctx);

void tui_dropdown_button_set_items(tui_widget_t * w, const char * const * items, byte count);
void tui_dropdown_button_open(tui_context_t * ctx, byte widget_index);
void tui_dropdown_button_close(tui_context_t * ctx);

void tui_dropdown_set_items(tui_widget_t * w, const char * const * labels, byte count);
void tui_dropdown_set_selected(tui_widget_t * w, byte selected);
byte tui_dropdown_get_selected(const tui_widget_t * w);

void tui_scrollbar_set_range(tui_widget_t * w, byte total, byte visible, byte top);
void tui_scrollbar_set_value(tui_widget_t * w, byte top);
byte tui_scrollbar_get_value(const tui_widget_t * w);

void tui_dialog_set_message(tui_widget_t * w, const char * message);
void tui_dialog_set_buttons(tui_widget_t * w, const char * const * labels, byte count);
void tui_dialog_open(tui_context_t * ctx, byte dialog_index);
void tui_dialog_close(tui_context_t * ctx, byte result_button);
byte tui_dialog_get_result(const tui_widget_t * w);

void tui_statusbar_set_text(tui_widget_t * w, const char * text, byte role);
void tui_progress_set_value(tui_widget_t * w, byte value, byte max);

#ifndef TUIKIT_INTERNAL
#pragma compile("tuikit_core.c")
#pragma compile("tuikit_widgets.c")
#pragma compile("tuikit_input.c")
#endif

#endif