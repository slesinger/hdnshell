// menu-tuikit - Tutorial 4: build an interactive UI with the TUIkit library.
//
// A small application menu bar. Selecting an item opens a dialog. Shows the
// project's own text-UI toolkit instead of hand-poking screen RAM.
//
// Teaches:
//   * binding a CharWin, a fixed widget pool, and a theme with tui_init,
//   * allocating widgets and wiring an event handler,
//   * the poll -> dispatch -> update -> render app loop.
//
// Build (needs the project include tree that ships tuikit):
//   bin/oscar64 -I=include projects/menu-tuikit/menu-tuikit.c
// Run: load the .prg on the C64 Ultimate. RUN/STOP quits.

#include <tuikit/tuikit.h>

static CharWin        screen;
static tui_context_t  tui;
static tui_widget_t   widgets[TUI_MAX_WIDGETS];

static byte menu_id;
static byte dialog_id;

// Item and button label arrays are BORROWED by TUIkit (not copied): keep them
// alive for the widget lifetime. `s"..."` produces C64 screencode strings.
static const char * const menu_items[]    = { s"RUN", s"BUILD", s"ABOUT" };
static const char * const dialog_buttons[] = { s" OK " };

static const char msg_run[]   = s"launch selected program";
static const char msg_build[] = s"compile current project";
static const char msg_about[] = s"menu-tuikit demo app";

static byte app_handler(tui_context_t * ctx, tui_widget_t * widget,
                        const tui_event_t * event)
{
    if (event->type != TUI_EVT_ACTIVATE)
        return 0;

    if (widget->id == 1) {          // the menu bar
        byte selected = tui_dropdown_get_selected(widget);
        if (selected == 0)
            tui_dialog_set_message(&widgets[dialog_id], msg_run);
        else if (selected == 1)
            tui_dialog_set_message(&widgets[dialog_id], msg_build);
        else
            tui_dialog_set_message(&widgets[dialog_id], msg_about);
        tui_dialog_open(ctx, dialog_id);
        return 1;                   // event handled
    }
    return 0;
}

static void add_widgets(void)
{
    menu_id = tui_widget_alloc(&tui, TUI_WIDGET_MENU_BAR, 0, 0, 40, 1, 1);
    tui_menu_bar_set_items(&widgets[menu_id], menu_items, 3);
    widgets[menu_id].handler = app_handler;

    dialog_id = tui_widget_alloc(&tui, TUI_WIDGET_DIALOG, 9, 8, 22, 7, 2);
    tui_dialog_set_message(&widgets[dialog_id], msg_about);
    tui_dialog_set_buttons(&widgets[dialog_id], dialog_buttons, 1);
}

int main(void)
{
    int key;

    // Screen RAM at $0400, full 40x25 window.
    cwin_init(&screen, (char *)0x0400, 0, 0, 40, 25);
    tui_init(&tui, &screen, widgets, TUI_MAX_WIDGETS, &tui_theme_default);
    add_widgets();
    tui_focus_set(&tui, menu_id);
    tui.dirty_all = 1;              // first frame paints everything

    for (;;) {
        tui_update(&tui);          // recompute state
        tui_render(&tui);          // repaint only dirty widgets

        key = cwin_getch();        // blocking read of one key
        if (key == TUI_KEY_RUNSTOP &&
            tui.popup_root == TUI_NONE && tui.modal_root == TUI_NONE)
            break;                 // quit only when no popup/modal is open

        tui_dispatch_key(&tui, (byte)key, 0);
    }

    return 0;
}
