#ifndef TUIKIT_PRIV_H
#define TUIKIT_PRIV_H

#define TUIKIT_INTERNAL
#include "tuikit.h"

#define TUI_SC_SPACE          0x20
#define TUI_SC_HLINE          0x40
#define TUI_SC_VLINE          0x5d
#define TUI_SC_TL             0x70
#define TUI_SC_TR             0x6e
#define TUI_SC_BL             0x6d
#define TUI_SC_BR             0x7d
#define TUI_SC_LEFT_BRACKET   0x1b
#define TUI_SC_RIGHT_BRACKET  0x1d
#define TUI_SC_LEFT_PAREN     0x28
#define TUI_SC_RIGHT_PAREN    0x29
#define TUI_SC_STAR           0x2a
#define TUI_SC_CHECK          0x7a
#define TUI_SC_RIGHT_ARROW    0x3e
#define TUI_SC_TRACK          0x5c
#define TUI_SC_THUMB          0xa0
#define TUI_SC_REMAIN         0x5f

typedef struct {
	const char * text;
	const char * message;
	const char * const * items;
	byte count;
	byte selected;
	byte top;
	byte total;
	byte visible;
	byte value;
	byte max;
	byte role;
	byte checked;
	byte group;
	byte result;
	char * buffer;
	byte buffer_size;
	byte cursor;
#if TUI_ENABLE_TABLE
	const char * const * headers;
	const byte * col_widths;
	byte col_count;
#endif
	byte dropdown[TUI_MAX_MENU_ITEMS];
	byte shortcut_key[TUI_MAX_MENU_ITEMS];
	byte shortcut_mod[TUI_MAX_MENU_ITEMS];
} tui_widget_data_t;

extern tui_widget_data_t tui_data[TUI_MAX_WIDGETS];

tui_widget_data_t * tui_data_get(const tui_widget_t * w);
byte tui_widget_index(tui_context_t * ctx, const tui_widget_t * widget);
byte tui_widget_at(tui_context_t * ctx, byte x, byte y);
byte tui_widget_is_focusable(const tui_widget_t * w);
byte tui_widget_default_event(tui_context_t * ctx, tui_widget_t * w, const tui_event_t * evt);
void tui_draw_widget(tui_context_t * ctx, byte index);
void tui_draw_frame(tui_context_t * ctx, byte x, byte y, byte w, byte h, const char * title, byte color, byte bg);
void tui_put_raw(tui_context_t * ctx, byte x, byte y, byte ch, byte color);
void tui_fill_rect(tui_context_t * ctx, byte x, byte y, byte w, byte h, byte ch, byte color);

#endif