#include "tuikit_priv.h"

tui_widget_data_t tui_data[TUI_MAX_WIDGETS];

#if defined(TUI_THEME_TERMINAL_GREEN)
const tui_theme_t tui_theme_default = {0, 11, 12, 13, 0, 5, 0, 13, 12, 11, 0, 13, 13, 7, 2};
#elif defined(TUI_THEME_PAPER_UI)
const tui_theme_t tui_theme_default = {15, 1, 6, 0, 0, 7, 0, 3, 11, 1, 0, 3, 6, 7, 2};
#else
const tui_theme_t tui_theme_default = {6, 15, 11, 0, 0, 3, 0, 14, 12, 15, 0, 14, 3, 7, 2};
#endif

static void tui_data_clear(byte index)
{
	byte i;
	tui_widget_data_t * d = &tui_data[index];
	d->text = nullptr;
	d->message = nullptr;
	d->items = nullptr;
	d->count = 0;
	d->selected = 0;
	d->top = 0;
	d->total = 0;
	d->visible = 0;
	d->value = 0;
	d->max = 0;
	d->role = 0;
	d->checked = 0;
	d->group = 0;
	d->result = TUI_NONE;
	d->buffer = nullptr;
	d->buffer_size = 0;
	d->cursor = 0;
#if TUI_ENABLE_TABLE
	d->headers = nullptr;
	d->col_widths = nullptr;
	d->col_count = 0;
#endif
	for (i = 0; i < TUI_MAX_MENU_ITEMS; ++i) {
		d->dropdown[i] = TUI_NONE;
		d->shortcut_key[i] = 0;
		d->shortcut_mod[i] = 0;
	}
}

tui_widget_data_t * tui_data_get(const tui_widget_t * w)
{
	if (!w || w->data_index == TUI_NONE || w->data_index >= TUI_MAX_WIDGETS)
		return 0;
	return &tui_data[w->data_index];
}

byte tui_widget_index(tui_context_t * ctx, const tui_widget_t * widget)
{
	byte i;
	for (i = 0; i < ctx->widget_count; ++i) {
		if (&ctx->widgets[i] == widget)
			return i;
	}
	return TUI_NONE;
}

byte tui_widget_is_focusable(const tui_widget_t * w)
{
	if (!w)
		return 0;
	return (w->flags & (TUI_FLAG_VISIBLE | TUI_FLAG_ENABLED | TUI_FLAG_CAN_FOCUS)) == (TUI_FLAG_VISIBLE | TUI_FLAG_ENABLED | TUI_FLAG_CAN_FOCUS);
}

static byte tui_widget_in_scope(tui_context_t * ctx, byte widget_index, byte scope)
{
	byte parent;
	if (scope == TUI_NONE)
		return 1;
	if (widget_index == scope)
		return 1;
	parent = ctx->widgets[widget_index].parent;
	while (parent != TUI_NONE && parent < ctx->widget_count) {
		if (parent == scope)
			return 1;
		parent = ctx->widgets[parent].parent;
	}
	return 0;
}

void tui_widget_init(tui_widget_t * widget, byte type, byte x, byte y, byte w, byte h, byte id)
{
	widget->type = type;
	widget->x = x;
	widget->y = y;
	widget->w = w;
	widget->h = h;
	widget->flags = TUI_FLAG_VISIBLE | TUI_FLAG_ENABLED | TUI_FLAG_DIRTY;
	widget->id = id;
	widget->parent = TUI_NONE;
	widget->first_child = TUI_NONE;
	widget->next_sibling = TUI_NONE;
	widget->data_index = TUI_NONE;
	widget->handler = nullptr;
	if (type == TUI_WIDGET_BUTTON || type == TUI_WIDGET_DROPDOWN_BUTTON || type == TUI_WIDGET_CHECKBOX ||
		type == TUI_WIDGET_RADIO || type == TUI_WIDGET_MENU_BAR || type == TUI_WIDGET_DROPDOWN ||
		type == TUI_WIDGET_LISTBOX || type == TUI_WIDGET_TABLE || type == TUI_WIDGET_TEXT_INPUT || type == TUI_WIDGET_DIALOG)
		widget->flags |= TUI_FLAG_CAN_FOCUS;
}

void tui_init(tui_context_t * ctx, CharWin * screen, tui_widget_t * widgets, byte max_widgets, const tui_theme_t * theme)
{
	byte i;
	ctx->widgets = widgets;
	ctx->widget_count = 0;
	ctx->max_widgets = max_widgets;
	ctx->root = TUI_NONE;
	ctx->focused = TUI_NONE;
	ctx->popup_root = TUI_NONE;
	ctx->modal_root = TUI_NONE;
	ctx->theme = theme ? theme : &tui_theme_default;
	ctx->screen = screen;
	ctx->mouse_x = 0;
	ctx->mouse_y = 0;
	ctx->mouse_prev_buttons = 0;
	ctx->mouse_visible = 0;
	ctx->mouse_sprite = 0;
	ctx->hover = TUI_NONE;
	ctx->dirty_all = 1;
	for (i = 0; i < TUI_MAX_WIDGETS; ++i)
		tui_data_clear(i);
}

void tui_set_theme(tui_context_t * ctx, const tui_theme_t * theme)
{
	ctx->theme = theme ? theme : &tui_theme_default;
	ctx->dirty_all = 1;
}

byte tui_widget_alloc(tui_context_t * ctx, byte type, byte x, byte y, byte w, byte h, byte id)
{
	byte index;
	if (ctx->widget_count >= ctx->max_widgets || ctx->widget_count >= TUI_MAX_WIDGETS)
		return TUI_NONE;
	index = ctx->widget_count++;
	tui_widget_init(&ctx->widgets[index], type, x, y, w, h, id);
	ctx->widgets[index].data_index = index;
	tui_data_clear(index);
	if (ctx->root == TUI_NONE)
		ctx->root = index;
	return index;
}

void tui_add_child(tui_context_t * ctx, byte parent, byte child)
{
	byte s;
	if (parent >= ctx->widget_count || child >= ctx->widget_count)
		return;
	ctx->widgets[child].parent = parent;
	if (ctx->widgets[parent].first_child == TUI_NONE) {
		ctx->widgets[parent].first_child = child;
	} else {
		s = ctx->widgets[parent].first_child;
		while (ctx->widgets[s].next_sibling != TUI_NONE)
			s = ctx->widgets[s].next_sibling;
		ctx->widgets[s].next_sibling = child;
	}
	ctx->widgets[parent].flags |= TUI_FLAG_DIRTY;
}

void tui_set_visible(tui_widget_t * w, byte visible)
{
	if (visible)
		w->flags |= TUI_FLAG_VISIBLE;
	else
		w->flags &= ~TUI_FLAG_VISIBLE;
	w->flags |= TUI_FLAG_DIRTY;
}

void tui_set_enabled(tui_widget_t * w, byte enabled)
{
	if (enabled)
		w->flags |= TUI_FLAG_ENABLED;
	else
		w->flags &= ~TUI_FLAG_ENABLED;
	w->flags |= TUI_FLAG_DIRTY;
}

void tui_invalidate(tui_widget_t * w)
{
	w->flags |= TUI_FLAG_DIRTY;
}

void tui_invalidate_region(tui_context_t * ctx, byte x, byte y, byte w, byte h)
{
	byte i;
	byte rx = x + w;
	byte by = y + h;
	for (i = 0; i < ctx->widget_count; ++i) {
		tui_widget_t * wi = &ctx->widgets[i];
		if (!(wi->flags & TUI_FLAG_VISIBLE))
			continue;
		if (wi->x < rx && wi->x + wi->w > x && wi->y < by && wi->y + wi->h > y)
			wi->flags |= TUI_FLAG_DIRTY;
	}
}

void tui_focus_set(tui_context_t * ctx, byte widget_index)
{
	if (widget_index >= ctx->widget_count || !tui_widget_is_focusable(&ctx->widgets[widget_index]))
		return;
	if (ctx->focused != TUI_NONE)
		ctx->widgets[ctx->focused].flags |= TUI_FLAG_DIRTY;
	ctx->focused = widget_index;
	ctx->widgets[widget_index].flags |= TUI_FLAG_DIRTY;
}

void tui_focus_next(tui_context_t * ctx)
{
	byte i, index, scope;
	if (!ctx->widget_count)
		return;
	scope = ctx->modal_root;
	index = ctx->focused == TUI_NONE ? 0 : ctx->focused + 1;
	for (i = 0; i < ctx->widget_count; ++i) {
		if (index >= ctx->widget_count)
			index = 0;
		if (tui_widget_in_scope(ctx, index, scope) && tui_widget_is_focusable(&ctx->widgets[index])) {
			tui_focus_set(ctx, index);
			return;
		}
		++index;
	}
}

void tui_focus_prev(tui_context_t * ctx)
{
	byte i, index, scope;
	if (!ctx->widget_count)
		return;
	scope = ctx->modal_root;
	index = ctx->focused == TUI_NONE ? ctx->widget_count - 1 : ctx->focused - 1;
	for (i = 0; i < ctx->widget_count; ++i) {
		if (index >= ctx->widget_count)
			index = ctx->widget_count - 1;
		if (tui_widget_in_scope(ctx, index, scope) && tui_widget_is_focusable(&ctx->widgets[index])) {
			tui_focus_set(ctx, index);
			return;
		}
		--index;
	}
}

void tui_update(tui_context_t * ctx)
{
	if (ctx->focused == TUI_NONE)
		tui_focus_next(ctx);
}

void tui_put_raw(tui_context_t * ctx, byte x, byte y, byte ch, byte color)
{
	cwin_putat_char_raw(ctx->screen, x, y, ch, color);
}

void tui_fill_rect(tui_context_t * ctx, byte x, byte y, byte w, byte h, byte ch, byte color)
{
	cwin_fill_rect_raw(ctx->screen, x, y, w, h, ch, color);
}

void tui_draw_frame(tui_context_t * ctx, byte x, byte y, byte w, byte h, const char * title, byte color, byte bg)
{
	byte i;
	tui_fill_rect(ctx, x, y, w, h, TUI_SC_SPACE, bg);
	if (w < 2 || h < 2)
		return;
	tui_put_raw(ctx, x, y, TUI_SC_TL, color);
	tui_put_raw(ctx, x + w - 1, y, TUI_SC_TR, color);
	tui_put_raw(ctx, x, y + h - 1, TUI_SC_BL, color);
	tui_put_raw(ctx, x + w - 1, y + h - 1, TUI_SC_BR, color);
	for (i = 1; i < w - 1; ++i) {
		tui_put_raw(ctx, x + i, y, TUI_SC_HLINE, color);
		tui_put_raw(ctx, x + i, y + h - 1, TUI_SC_HLINE, color);
	}
	for (i = 1; i < h - 1; ++i) {
		tui_put_raw(ctx, x, y + i, TUI_SC_VLINE, color);
		tui_put_raw(ctx, x + w - 1, y + i, TUI_SC_VLINE, color);
	}
	if (title)
		cwin_putat_string_raw(ctx->screen, x + 2, y, title, color);
}

void tui_render(tui_context_t * ctx)
{
	byte i;
	if (ctx->dirty_all) {
		cwin_fill_rect_raw(ctx->screen, 0, 0, TUI_SCREEN_W, TUI_SCREEN_H, TUI_SC_SPACE, ctx->theme->screen_bg);
		ctx->dirty_all = 0;
		for (i = 0; i < ctx->widget_count; ++i)
			ctx->widgets[i].flags |= TUI_FLAG_DIRTY;
	}
	for (i = 0; i < ctx->widget_count; ++i) {
		if (i == ctx->popup_root || i == ctx->modal_root)
			continue;
		tui_draw_widget(ctx, i);
	}
	if (ctx->popup_root != TUI_NONE)
		tui_draw_widget(ctx, ctx->popup_root);
	if (ctx->modal_root != TUI_NONE)
		tui_draw_widget(ctx, ctx->modal_root);
}