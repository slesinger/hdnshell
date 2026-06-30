#include "tuikit_priv.h"

static void tui_put_clipped(tui_context_t * ctx, byte x, byte y, const char * text, byte width, byte color);

static byte tui_text_len(const char * s)
{
	byte n = 0;
	if (!s)
		return 0;
	while (s[n] && s[n] != '\n')
		++n;
	return n;
}

static const char * tui_next_line(const char * s)
{
	while (s && *s && *s != '\n')
		++s;
	if (s && *s == '\n')
		++s;
	return s;
}

static void tui_put_clipped_center(tui_context_t * ctx, byte x, byte y, const char * text, byte width, byte color)
{
	byte len = tui_text_len(text);
	byte start = len < width ? (width - len) >> 1 : 0;
	tui_put_clipped(ctx, x, y, s"", width, color);
	tui_put_clipped(ctx, x + start, y, text, width - start, color);
}

static void tui_put_clipped(tui_context_t * ctx, byte x, byte y, const char * text, byte width, byte color)
{
	byte i = 0;
	while (i < width && text && text[i]) {
		tui_put_raw(ctx, x + i, y, text[i], color);
		++i;
	}
	while (i < width) {
		tui_put_raw(ctx, x + i, y, TUI_SC_SPACE, color);
		++i;
	}
}

static byte tui_fg(tui_context_t * ctx, tui_widget_t * w)
{
	if (!(w->flags & TUI_FLAG_ENABLED))
		return ctx->theme->disabled_text;
	if (tui_widget_index(ctx, w) == ctx->focused)
		return ctx->theme->focus_text;
	if (w->flags & (TUI_FLAG_ACTIVE | TUI_FLAG_SELECTED))
		return ctx->theme->active_text;
	return ctx->theme->text;
}

static byte tui_bg(tui_context_t * ctx, tui_widget_t * w)
{
	if (!(w->flags & TUI_FLAG_ENABLED))
		return ctx->theme->disabled_bg;
	if (tui_widget_index(ctx, w) == ctx->focused)
		return ctx->theme->focus_bg;
	if (w->flags & (TUI_FLAG_ACTIVE | TUI_FLAG_SELECTED))
		return ctx->theme->active_bg;
	return ctx->theme->panel_bg;
}

static byte tui_is_focused(tui_context_t * ctx, tui_widget_t * w)
{
	return tui_widget_index(ctx, w) == ctx->focused;
}

static byte tui_focus_ch(tui_context_t * ctx, tui_widget_t * w, byte ch)
{
	if (tui_is_focused(ctx, w) && ch < 128)
		return ch + 128;
	return ch;
}

static byte tui_reverse_ch(byte ch)
{
	if (ch < 128)
		return ch + 128;
	return ch;
}

static void tui_put_clipped_focus(tui_context_t * ctx, tui_widget_t * w, byte x, byte y, const char * text, byte width, byte color)
{
	byte i = 0;
	while (i < width && text && text[i]) {
		tui_put_raw(ctx, x + i, y, tui_focus_ch(ctx, w, text[i]), color);
		++i;
	}
	while (i < width) {
		tui_put_raw(ctx, x + i, y, tui_focus_ch(ctx, w, TUI_SC_SPACE), color);
		++i;
	}
}

static void tui_draw_button_at(tui_context_t * ctx, tui_widget_t * w, byte x, byte y, byte width, const char * text, byte len, byte bg, byte fg)
{
	byte start = (width > len + 2) ? (width - len) >> 1 : 1;
	byte draw_width;
	tui_fill_rect(ctx, x, y, width, 1, tui_focus_ch(ctx, w, TUI_SC_SPACE), bg);
	tui_put_raw(ctx, x, y, tui_focus_ch(ctx, w, TUI_SC_LEFT_BRACKET), fg);
	tui_put_raw(ctx, x + width - 1, y, tui_focus_ch(ctx, w, TUI_SC_RIGHT_BRACKET), fg);
	if (text && len > 0) {
		draw_width = len;
		if (draw_width > width - start - 1)
			draw_width = width - start - 1;
		tui_put_clipped_focus(ctx, w, x + start, y, text, draw_width, fg);
	}
}

static void tui_draw_button(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte bg = tui_bg(ctx, w);
	byte fg = tui_fg(ctx, w);
	const char * text = d ? d->text : nullptr;
	byte len = 0;
	if (text) {
		while (*text == ' ' || *text == '\t')
			text++;
		len = tui_text_len(text);
		while (len > 0 && (text[len - 1] == ' ' || text[len - 1] == '\t' || text[len - 1] == '\r' || text[len - 1] == '\n'))
			len--;
	}
	if (tui_is_focused(ctx, w))
		fg = ctx->theme->focus_bg;
	if (w->h > 1)
		tui_fill_rect(ctx, w->x, w->y + 1, w->w, w->h - 1, tui_focus_ch(ctx, w, TUI_SC_SPACE), bg);
	tui_draw_button_at(ctx, w, w->x, w->y, w->w, text, len, bg, fg);
}

static void tui_draw_checkbox(tui_context_t * ctx, tui_widget_t * w, byte radio)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte bg = tui_bg(ctx, w);
	byte fg = tui_fg(ctx, w);
	if (tui_is_focused(ctx, w))
		fg = ctx->theme->focus_bg;
	tui_fill_rect(ctx, w->x, w->y, w->w, 1, tui_focus_ch(ctx, w, TUI_SC_SPACE), bg);
	tui_put_raw(ctx, w->x, w->y, tui_focus_ch(ctx, w, radio ? TUI_SC_LEFT_PAREN : TUI_SC_LEFT_BRACKET), fg);
	tui_put_raw(ctx, w->x + 1, w->y, tui_focus_ch(ctx, w, d && d->checked ? (radio ? TUI_SC_STAR : TUI_SC_CHECK) : TUI_SC_SPACE), fg);
	tui_put_raw(ctx, w->x + 2, w->y, tui_focus_ch(ctx, w, radio ? TUI_SC_RIGHT_PAREN : TUI_SC_RIGHT_BRACKET), fg);
	if (d && d->text)
		tui_put_clipped_focus(ctx, w, w->x + 4, w->y, d->text, w->w - 4, fg);
}

static void tui_draw_menu_bar(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte x = w->x;
	byte i, j, width, selected;
	byte color;
	tui_fill_rect(ctx, w->x, w->y, w->w, 1, TUI_SC_SPACE, ctx->theme->status_info);
	if (!d)
		return;
	for (i = 0; i < d->count && i < TUI_MAX_MENU_ITEMS; ++i) {
		selected = i == d->selected && tui_widget_index(ctx, w) == ctx->focused;
		color = selected ? ctx->theme->focus_text : ctx->theme->status_info;
		width = tui_text_len(d->items[i]);
		if (x < w->x + w->w) {
			for (j = 0; j < width && x + j < w->x + w->w; ++j)
				tui_put_raw(ctx, x + j, w->y, selected ? tui_reverse_ch(d->items[i][j]) : d->items[i][j], color);
		}
		x += width + 2;
	}
}

static void tui_draw_listbox(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte row, item, col, color, text_color, selected, ch, text_done;
	tui_draw_frame(ctx, w->x, w->y, w->w, w->h, 0, ctx->theme->border, ctx->theme->panel_bg);
	if (!d || !d->items || w->h < 3)
		return;
	for (row = 0; row < w->h - 2; ++row) {
		item = d->top + row;
		selected = item == d->selected;
		color = selected ? ctx->theme->selection_text : ctx->theme->panel_bg;
		text_color = selected ? ctx->theme->selection_text : ctx->theme->text;
		text_done = 0;
		for (col = 0; col < w->w - 2; ++col) {
			ch = TUI_SC_SPACE;
			if (item < d->count && !text_done) {
				ch = d->items[item][col];
				if (!ch) {
					ch = TUI_SC_SPACE;
					text_done = 1;
				}
			}
			tui_put_raw(ctx, w->x + 1 + col, w->y + 1 + row, selected ? tui_reverse_ch(ch) : ch, item < d->count ? text_color : color);
		}
	}
}

static void tui_draw_scrollbar(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte i, thumb = 0, span;
	tui_fill_rect(ctx, w->x, w->y, 1, w->h, TUI_SC_TRACK, ctx->theme->border);
	if (!d || !d->total || d->total <= d->visible)
		return;
	span = w->h > 1 ? w->h - 1 : 1;
	thumb = (byte)((word)d->top * span / (d->total - d->visible));
	for (i = 0; i < w->h; ++i)
		tui_put_raw(ctx, w->x, w->y + i, i == thumb ? TUI_SC_THUMB : TUI_SC_TRACK, ctx->theme->border);
}

static void tui_draw_text_input(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte bg = tui_bg(ctx, w);
	byte fg = tui_fg(ctx, w);
	byte i;
	if (tui_is_focused(ctx, w))
		fg = ctx->theme->focus_bg;
	tui_fill_rect(ctx, w->x, w->y, w->w, 1, tui_focus_ch(ctx, w, TUI_SC_SPACE), bg);
	tui_put_raw(ctx, w->x, w->y, tui_focus_ch(ctx, w, TUI_SC_LEFT_BRACKET), fg);
	tui_put_raw(ctx, w->x + w->w - 1, w->y, tui_focus_ch(ctx, w, TUI_SC_RIGHT_BRACKET), fg);
	if (d && d->buffer) {
		for (i = 0; i < w->w - 2 && d->buffer[i]; ++i)
			tui_put_raw(ctx, w->x + 1 + i, w->y, tui_focus_ch(ctx, w, d->buffer[i]), fg);
		if (tui_widget_index(ctx, w) == ctx->focused && d->cursor < w->w - 2)
			tui_put_raw(ctx, w->x + 1 + d->cursor, w->y, d->buffer[d->cursor] ? d->buffer[d->cursor] + 128 : TUI_SC_THUMB, ctx->theme->focus_text);
	}
}

static void tui_draw_dropdown(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte i, col, color, text_color, selected, ch, text_done, key_x;
	tui_draw_frame(ctx, w->x, w->y, w->w, w->h, 0, ctx->theme->border, ctx->theme->panel_bg);
	if (!d)
		return;
	for (i = 0; i < d->count && i < w->h - 2; ++i) {
		selected = i == d->selected;
		color = selected ? ctx->theme->selection_text : ctx->theme->panel_bg;
		text_color = selected ? ctx->theme->selection_text : ctx->theme->text;
		text_done = 0;
		for (col = 0; col < w->w - 2; ++col) {
			ch = TUI_SC_SPACE;
			if (!text_done) {
				ch = d->items[i][col];
				if (!ch) {
					ch = TUI_SC_SPACE;
					text_done = 1;
				}
			}
			tui_put_raw(ctx, w->x + 1 + col, w->y + 1 + i, selected ? tui_reverse_ch(ch) : ch, text_color ? text_color : color);
		}
		if (d->shortcut_key[i] && w->w > 4) {
			key_x = w->x + w->w - 3;
			tui_put_raw(ctx, key_x, w->y + 1 + i, selected ? tui_reverse_ch(d->shortcut_key[i]) : d->shortcut_key[i], ctx->theme->active_bg);
		}
	}
}

static void tui_draw_dialog(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	const char * line;
	byte i, bx, by, total_width;
	tui_draw_frame(ctx, w->x, w->y, w->w, w->h, s"DIALOG", ctx->theme->border, ctx->theme->panel_bg);
	if (!d)
		return;
	line = d->message;
	by = w->y + 2;
	while (line && *line && by < w->y + w->h - 3) {
		tui_put_clipped_center(ctx, w->x + 2, by, line, w->w - 4, ctx->theme->text);
		line = tui_next_line(line);
		++by;
	}
	total_width = d->count ? (d->count * 8) + ((d->count - 1) * 2) : 0;
	bx = w->x + ((w->w - total_width) >> 1);
	for (i = 0; i < d->count && i < TUI_MAX_DIALOG_BUTTONS; ++i) {
		tui_draw_button_at(ctx, w, bx, w->y + w->h - 2, 8, d->items[i], tui_text_len(d->items[i]), ctx->theme->active_bg, ctx->theme->active_bg);
		bx += 10;
	}
}

static void tui_draw_progress(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte i, fill = 0;
	tui_fill_rect(ctx, w->x, w->y, w->w, 1, TUI_SC_REMAIN, ctx->theme->border);
	if (d && d->max)
		fill = (byte)((word)d->value * w->w / d->max);
	for (i = 0; i < fill && i < w->w; ++i)
		tui_put_raw(ctx, w->x + i, w->y, TUI_SC_THUMB, ctx->theme->selection_bg);
}

void tui_draw_widget(tui_context_t * ctx, byte index)
{
	tui_widget_t * w;
	tui_widget_data_t * d;
	const char * title;
	byte color;
	if (index >= ctx->widget_count)
		return;
	w = &ctx->widgets[index];
	if (!(w->flags & TUI_FLAG_VISIBLE))
		return;
	if (!(w->flags & TUI_FLAG_DIRTY) && !ctx->dirty_all)
		return;
	d = tui_data_get(w);
	switch (w->type) {
		case TUI_WIDGET_PANEL:
		case TUI_WIDGET_FRAME:
			title = nullptr;
			if (d)
				title = d->text;
			tui_draw_frame(ctx, w->x, w->y, w->w, w->h, title, ctx->theme->border, ctx->theme->panel_bg);
			break;
		case TUI_WIDGET_STATUSBAR:
			color = d && d->role == 2 ? ctx->theme->status_error : d && d->role == 1 ? ctx->theme->status_warn : ctx->theme->status_info;
			tui_fill_rect(ctx, w->x, w->y, w->w, 1, TUI_SC_SPACE, color);
			if (d && d->text)
				tui_put_clipped(ctx, w->x, w->y, d->text, w->w, color);
			break;
		case TUI_WIDGET_LABEL:
			if (d && d->text)
				tui_put_clipped(ctx, w->x, w->y, d->text, w->w, ctx->theme->text);
			break;
		case TUI_WIDGET_BUTTON:
		case TUI_WIDGET_DROPDOWN_BUTTON:
			tui_draw_button(ctx, w);
			break;
		case TUI_WIDGET_CHECKBOX:
			tui_draw_checkbox(ctx, w, 0);
			break;
		case TUI_WIDGET_RADIO:
			tui_draw_checkbox(ctx, w, 1);
			break;
		case TUI_WIDGET_MENU_BAR:
			tui_draw_menu_bar(ctx, w);
			break;
		case TUI_WIDGET_DROPDOWN:
			tui_draw_dropdown(ctx, w);
			break;
		case TUI_WIDGET_LISTBOX:
			tui_draw_listbox(ctx, w);
			break;
		case TUI_WIDGET_SCROLLBAR:
			tui_draw_scrollbar(ctx, w);
			break;
		case TUI_WIDGET_TEXT_INPUT:
			tui_draw_text_input(ctx, w);
			break;
		case TUI_WIDGET_DIALOG:
			tui_draw_dialog(ctx, w);
			break;
		case TUI_WIDGET_SEPARATOR:
			tui_fill_rect(ctx, w->x, w->y, w->w, 1, TUI_SC_HLINE, ctx->theme->border);
			break;
		case TUI_WIDGET_PROGRESS:
			tui_draw_progress(ctx, w);
			break;
	}
	w->flags &= ~TUI_FLAG_DIRTY;
}

void tui_button_set_label(tui_widget_t * w, const char * label)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->text = label;
	tui_invalidate(w);
}

void tui_button_set_action(tui_widget_t * w, tui_event_handler_t handler)
{
	w->handler = handler;
}

void tui_checkbox_set_value(tui_widget_t * w, byte checked)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->checked = checked;
	if (checked)
		w->flags |= TUI_FLAG_SELECTED;
	else
		w->flags &= ~TUI_FLAG_SELECTED;
	tui_invalidate(w);
}

byte tui_checkbox_get_value(const tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	return d ? d->checked : 0;
}

void tui_radio_set_group(tui_widget_t * w, byte group_id)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->group = group_id;
}

void tui_listbox_set_items(tui_widget_t * w, const char * const * items, byte count)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->items = items;
		d->count = count;
		d->total = count;
	}
	tui_invalidate(w);
}

void tui_listbox_set_selected(tui_widget_t * w, byte selected)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->selected = selected;
		if (selected < d->top)
			d->top = selected;
	}
	tui_invalidate(w);
}

byte tui_listbox_get_selected(const tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	return d ? d->selected : 0;
}

void tui_listbox_set_scroll(tui_widget_t * w, byte top)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->top = top;
	tui_invalidate(w);
}

byte tui_listbox_get_scroll(const tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	return d ? d->top : 0;
}

void tui_text_input_set_buffer(tui_widget_t * w, char * buf, byte size)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->buffer = buf;
		d->buffer_size = size;
		d->cursor = 0;
	}
	tui_invalidate(w);
}

void tui_text_input_set_cursor(tui_widget_t * w, byte cursor)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->cursor = cursor;
	tui_invalidate(w);
}

byte tui_text_input_get_cursor(const tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	return d ? d->cursor : 0;
}

void tui_menu_bar_set_items(tui_widget_t * w, const char * const * labels, byte count)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->items = labels;
		d->count = count;
	}
	tui_invalidate(w);
}

void tui_menu_bar_set_dropdown(tui_widget_t * menu_bar, byte item_index, byte dropdown_widget_index)
{
	tui_widget_data_t * d = tui_data_get(menu_bar);
	if (d && item_index < TUI_MAX_MENU_ITEMS)
		d->dropdown[item_index] = dropdown_widget_index;
}

void tui_menu_item_set_shortcut(tui_widget_t * menu_bar, byte item_index, byte key, byte modifiers)
{
	tui_widget_data_t * d = tui_data_get(menu_bar);
	if (d && item_index < TUI_MAX_MENU_ITEMS) {
		d->shortcut_key[item_index] = key;
		d->shortcut_mod[item_index] = modifiers;
	}
}

void tui_menu_bar_open(tui_context_t * ctx, byte menu_bar_index, byte item_index)
{
	tui_widget_data_t * d;
	byte dropdown;
	if (menu_bar_index >= ctx->widget_count)
		return;
	d = tui_data_get(&ctx->widgets[menu_bar_index]);
	if (!d || item_index >= d->count)
		return;
	d->selected = item_index;
	ctx->widgets[menu_bar_index].flags |= TUI_FLAG_DIRTY;
	dropdown = d->dropdown[item_index];
	if (ctx->popup_root != TUI_NONE && ctx->popup_root != dropdown)
		ctx->widgets[ctx->popup_root].flags &= ~TUI_FLAG_VISIBLE;
	if (dropdown != TUI_NONE) {
		ctx->popup_root = dropdown;
		ctx->widgets[dropdown].flags |= TUI_FLAG_VISIBLE | TUI_FLAG_DIRTY;
		tui_focus_set(ctx, dropdown);
	} else {
		ctx->popup_root = TUI_NONE;
		tui_focus_set(ctx, menu_bar_index);
	}
}

void tui_menu_bar_close(tui_context_t * ctx)
{
	if (ctx->popup_root != TUI_NONE)
		ctx->widgets[ctx->popup_root].flags &= ~TUI_FLAG_VISIBLE;
	ctx->popup_root = TUI_NONE;
	ctx->dirty_all = 1;
}

void tui_dropdown_button_set_items(tui_widget_t * w, const char * const * items, byte count)
{
	tui_dropdown_set_items(w, items, count);
}

void tui_dropdown_button_open(tui_context_t * ctx, byte widget_index)
{
	ctx->popup_root = widget_index;
	ctx->widgets[widget_index].flags |= TUI_FLAG_VISIBLE | TUI_FLAG_DIRTY;
}

void tui_dropdown_button_close(tui_context_t * ctx)
{
	if (ctx->popup_root != TUI_NONE)
		ctx->widgets[ctx->popup_root].flags &= ~TUI_FLAG_VISIBLE;
	ctx->popup_root = TUI_NONE;
	ctx->dirty_all = 1;
}

void tui_dropdown_set_items(tui_widget_t * w, const char * const * labels, byte count)
{
	tui_listbox_set_items(w, labels, count);
}

void tui_dropdown_set_selected(tui_widget_t * w, byte selected)
{
	tui_listbox_set_selected(w, selected);
}

byte tui_dropdown_get_selected(const tui_widget_t * w)
{
	return tui_listbox_get_selected(w);
}

void tui_scrollbar_set_range(tui_widget_t * w, byte total, byte visible, byte top)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->total = total;
		d->visible = visible;
		d->top = top;
	}
	tui_invalidate(w);
}

void tui_scrollbar_set_value(tui_widget_t * w, byte top)
{
	tui_listbox_set_scroll(w, top);
}

byte tui_scrollbar_get_value(const tui_widget_t * w)
{
	return tui_listbox_get_scroll(w);
}

void tui_dialog_set_message(tui_widget_t * w, const char * message)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d)
		d->message = message;
	tui_invalidate(w);
}

void tui_dialog_set_buttons(tui_widget_t * w, const char * const * labels, byte count)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->items = labels;
		d->count = count;
	}
	tui_invalidate(w);
}

void tui_dialog_open(tui_context_t * ctx, byte dialog_index)
{
	ctx->modal_root = dialog_index;
	ctx->widgets[dialog_index].flags |= TUI_FLAG_VISIBLE | TUI_FLAG_DIRTY;
	tui_focus_set(ctx, dialog_index);
}

void tui_dialog_close(tui_context_t * ctx, byte result_button)
{
	byte dialog_index = ctx->modal_root;
	tui_widget_data_t * d;
	if (ctx->modal_root != TUI_NONE) {
		d = tui_data_get(&ctx->widgets[ctx->modal_root]);
		if (d)
			d->result = result_button;
		ctx->widgets[ctx->modal_root].flags &= ~TUI_FLAG_VISIBLE;
	}
	ctx->modal_root = TUI_NONE;
	if (ctx->focused == dialog_index)
		ctx->focused = TUI_NONE;
	ctx->dirty_all = 1;
}

byte tui_dialog_get_result(const tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	return d ? d->result : TUI_NONE;
}

void tui_statusbar_set_text(tui_widget_t * w, const char * text, byte role)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->text = text;
		d->role = role;
	}
	tui_invalidate(w);
}

void tui_progress_set_value(tui_widget_t * w, byte value, byte max)
{
	tui_widget_data_t * d = tui_data_get(w);
	if (d) {
		d->value = value;
		d->max = max;
	}
	tui_invalidate(w);
}