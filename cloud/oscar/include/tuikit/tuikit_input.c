#include "tuikit_priv.h"

byte tui_widget_at(tui_context_t * ctx, byte x, byte y)
{
	byte i = ctx->widget_count;
	while (i) {
		--i;
		if ((ctx->widgets[i].flags & TUI_FLAG_VISIBLE) && x >= ctx->widgets[i].x && y >= ctx->widgets[i].y &&
			x < ctx->widgets[i].x + ctx->widgets[i].w && y < ctx->widgets[i].y + ctx->widgets[i].h)
			return i;
	}
	return TUI_NONE;
}

static byte tui_activate(tui_context_t * ctx, tui_widget_t * w)
{
	tui_event_t evt;
	evt.type = TUI_EVT_ACTIVATE;
	evt.key = 0;
	evt.modifiers = 0;
	evt.joy_mask = 0;
	evt.mouse_x = ctx->mouse_x;
	evt.mouse_y = ctx->mouse_y;
	evt.mouse_buttons = ctx->mouse_prev_buttons;
	if (w->handler && w->handler(ctx, w, &evt))
		return 1;
	return tui_widget_default_event(ctx, w, &evt);
}

static void tui_radio_select(tui_context_t * ctx, tui_widget_t * w)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte i;
	byte parent = w->parent;
	byte group = d ? d->group : 0;
	for (i = 0; i < ctx->widget_count; ++i) {
		tui_widget_t * peer = &ctx->widgets[i];
		tui_widget_data_t * pd;
		if (peer->type != TUI_WIDGET_RADIO || peer->parent != parent)
			continue;
		pd = tui_data_get(peer);
		if ((pd ? pd->group : 0) == group)
			tui_checkbox_set_value(peer, peer == w);
	}
}

static byte tui_radio_focus_peer(tui_context_t * ctx, tui_widget_t * w, byte forward)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte origin = tui_widget_index(ctx, w);
	byte index = origin;
	byte i;
	byte parent = w->parent;
	byte group = d ? d->group : 0;
	for (i = 0; i < ctx->widget_count - 1; ++i) {
		if (forward) {
			++index;
			if (index >= ctx->widget_count)
				index = 0;
		} else if (index) {
			--index;
		} else {
			index = ctx->widget_count - 1;
		}
		if (ctx->widgets[index].type == TUI_WIDGET_RADIO && ctx->widgets[index].parent == parent &&
			tui_widget_is_focusable(&ctx->widgets[index])) {
			tui_widget_data_t * pd = tui_data_get(&ctx->widgets[index]);
			if ((pd ? pd->group : 0) == group) {
				tui_focus_set(ctx, index);
				return 1;
			}
		}
	}
	return 0;
}

static void tui_text_insert(tui_widget_t * w, byte key)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte i, len = 0;
	if (!d || !d->buffer || d->buffer_size < 2)
		return;
	while (len < d->buffer_size - 1 && d->buffer[len])
		++len;
	if (key == TUI_KEY_DELETE) {
		if (d->cursor) {
			--d->cursor;
			for (i = d->cursor; i < len; ++i)
				d->buffer[i] = d->buffer[i + 1];
		}
	} else if (key == TUI_KEY_CURSOR_LEFT) {
		if (d->cursor)
			--d->cursor;
	} else if (key == TUI_KEY_CURSOR_RIGHT) {
		if (d->cursor < len)
			++d->cursor;
	} else if (key >= 32 && key < 128 && len < d->buffer_size - 1) {
		for (i = len + 1; i > d->cursor; --i)
			d->buffer[i] = d->buffer[i - 1];
		d->buffer[d->cursor] = key;
		++d->cursor;
	}
	tui_invalidate(w);
}

byte tui_widget_default_event(tui_context_t * ctx, tui_widget_t * w, const tui_event_t * evt)
{
	tui_widget_data_t * d = tui_data_get(w);
	byte index = tui_widget_index(ctx, w);
	if (evt->type == TUI_EVT_ACTIVATE) {
		switch (w->type) {
			case TUI_WIDGET_MENU_BAR:
				if (d)
					tui_menu_bar_open(ctx, index, d->selected);
				return 1;
			case TUI_WIDGET_CHECKBOX:
				tui_checkbox_set_value(w, d ? !d->checked : 0);
				return 1;
			case TUI_WIDGET_RADIO:
				tui_radio_select(ctx, w);
				return 1;
			case TUI_WIDGET_DROPDOWN_BUTTON:
				ctx->popup_root = index;
				return 1;
			case TUI_WIDGET_DIALOG:
				tui_dialog_close(ctx, 0);
				return 1;
		}
	}
	if (evt->type != TUI_EVT_KEY || !d)
		return 0;
	switch (w->type) {
		case TUI_WIDGET_RADIO:
			if (evt->key == TUI_KEY_CURSOR_RIGHT)
				return tui_radio_focus_peer(ctx, w, 1);
			if (evt->key == TUI_KEY_CURSOR_LEFT)
				return tui_radio_focus_peer(ctx, w, 0);
			break;
		case TUI_WIDGET_MENU_BAR:
			if (evt->key == TUI_KEY_CURSOR_RIGHT && d->selected + 1 < d->count) {
				++d->selected;
				tui_invalidate(w);
				return 1;
			}
			if (evt->key == TUI_KEY_CURSOR_LEFT && d->selected) {
				--d->selected;
				tui_invalidate(w);
				return 1;
			}
			if (evt->key == TUI_KEY_CURSOR_DOWN) {
				tui_menu_bar_open(ctx, index, d->selected);
				return 1;
			}
			break;
		case TUI_WIDGET_LISTBOX:
		case TUI_WIDGET_DROPDOWN:
			if (evt->key == TUI_KEY_CURSOR_DOWN && d->selected + 1 < d->count) {
				++d->selected;
				if (d->selected >= d->top + w->h - 2)
					++d->top;
				tui_invalidate(w);
				return 1;
			}
			if (evt->key == TUI_KEY_CURSOR_UP && d->selected) {
				--d->selected;
				if (d->selected < d->top)
					--d->top;
				tui_invalidate(w);
				return 1;
			}
			break;
		case TUI_WIDGET_TEXT_INPUT:
			tui_text_insert(w, evt->key);
			return 1;
	}
	return 0;
}

byte tui_dispatch_event(tui_context_t * ctx, const tui_event_t * evt)
{
	tui_widget_t * w;
	byte target = ctx->modal_root != TUI_NONE ? ctx->modal_root : ctx->focused;
	if (target == TUI_NONE || target >= ctx->widget_count)
		return 0;
	w = &ctx->widgets[target];
	if (!(w->flags & TUI_FLAG_ENABLED))
		return 0;
	if (w->handler && w->handler(ctx, w, evt))
		return 1;
	return tui_widget_default_event(ctx, w, evt);
}

byte tui_dispatch_key(tui_context_t * ctx, byte key, byte modifiers)
{
	tui_event_t evt;
	byte i, m;
	tui_widget_data_t * d;
	if (key == TUI_KEY_RUNSTOP) {
		if (ctx->modal_root != TUI_NONE)
			tui_dialog_close(ctx, TUI_NONE);
		else
			tui_menu_bar_close(ctx);
		return 1;
	}
	if (ctx->modal_root == TUI_NONE) {
		for (i = 0; i < ctx->widget_count; ++i) {
			if (ctx->widgets[i].type == TUI_WIDGET_MENU_BAR || ctx->widgets[i].type == TUI_WIDGET_DROPDOWN) {
				d = tui_data_get(&ctx->widgets[i]);
				if (d) {
					for (m = 0; m < d->count && m < TUI_MAX_MENU_ITEMS; ++m) {
						if (d->shortcut_key[m] == key && d->shortcut_mod[m] == modifiers) {
							d->selected = m;
							tui_focus_set(ctx, i);
							return tui_activate(ctx, &ctx->widgets[i]);
						}
					}
				}
			}
		}
	}
	if ((key == TUI_KEY_FOCUS_NEXT && modifiers & TUI_MOD_SHIFT) || key == TUI_KEY_FOCUS_PREV) {
		tui_focus_prev(ctx);
		return 1;
	}
	if (key == TUI_KEY_FOCUS_NEXT) {
		tui_focus_next(ctx);
		return 1;
	}
	if (key == TUI_KEY_RETURN || key == TUI_KEY_SPACE) {
		if (ctx->focused != TUI_NONE)
			return tui_activate(ctx, &ctx->widgets[ctx->focused]);
	}
	evt.type = TUI_EVT_KEY;
	evt.key = key;
	evt.modifiers = modifiers;
	evt.joy_mask = 0;
	evt.mouse_x = ctx->mouse_x;
	evt.mouse_y = ctx->mouse_y;
	evt.mouse_buttons = ctx->mouse_prev_buttons;
	return tui_dispatch_event(ctx, &evt);
}

byte tui_dispatch_joystick(tui_context_t * ctx, byte joy_mask)
{
	if (joy_mask & 0x01) {
		tui_focus_prev(ctx);
		return 1;
	}
	if (joy_mask & 0x02) {
		tui_focus_next(ctx);
		return 1;
	}
	if (joy_mask & 0x10 && ctx->focused != TUI_NONE)
		return tui_activate(ctx, &ctx->widgets[ctx->focused]);
	return 0;
}

byte tui_dispatch_mouse(tui_context_t * ctx, byte x, byte y, byte buttons)
{
	tui_event_t evt;
	byte hit = tui_widget_at(ctx, x, y);
	byte pressed = (buttons & TUI_MOUSE_LEFT) && !(ctx->mouse_prev_buttons & TUI_MOUSE_LEFT);
	byte released = !(buttons & TUI_MOUSE_LEFT) && (ctx->mouse_prev_buttons & TUI_MOUSE_LEFT);
	ctx->mouse_x = x;
	ctx->mouse_y = y;
	if (hit != ctx->hover) {
		if (ctx->hover != TUI_NONE)
			ctx->widgets[ctx->hover].flags &= ~TUI_FLAG_HOVER;
		ctx->hover = hit;
		if (hit != TUI_NONE)
			ctx->widgets[hit].flags |= TUI_FLAG_HOVER | TUI_FLAG_DIRTY;
	}
	if (hit != TUI_NONE && tui_widget_is_focusable(&ctx->widgets[hit]))
		tui_focus_set(ctx, hit);
	if (pressed || released) {
		evt.type = pressed ? TUI_EVT_MOUSE_DOWN : TUI_EVT_MOUSE_UP;
		evt.key = 0;
		evt.modifiers = 0;
		evt.joy_mask = 0;
		evt.mouse_x = x;
		evt.mouse_y = y;
		evt.mouse_buttons = buttons;
		ctx->mouse_prev_buttons = buttons;
		if (hit != TUI_NONE && ctx->widgets[hit].handler)
			ctx->widgets[hit].handler(ctx, &ctx->widgets[hit], &evt);
		if (released && hit != TUI_NONE)
			return tui_activate(ctx, &ctx->widgets[hit]);
	}
	ctx->mouse_prev_buttons = buttons;
	return hit != TUI_NONE;
}

void tui_mouse_set_visible(tui_context_t * ctx, byte visible)
{
	ctx->mouse_visible = visible;
}

void tui_mouse_set_sprite(tui_context_t * ctx, byte sprite_index)
{
	ctx->mouse_sprite = sprite_index;
}

void tui_mouse_move(tui_context_t * ctx, byte x, byte y)
{
	tui_dispatch_mouse(ctx, x, y, ctx->mouse_prev_buttons);
}