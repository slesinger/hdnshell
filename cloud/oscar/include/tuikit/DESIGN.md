# TUIkit for C64 Ultimate (Oscar compiler) - concise complete spec

Goal: a reusable text UI toolkit (later tuikit.c + tuikit.h include library) that can build full C64 applications on a 40x25 screen.

Hard constraints:
- Render with raw C64 screencodes by default. PETSCII is only an input/string interchange format where explicitly stated.
- Use only C64 lo/up charset-safe screencodes for default widgets.
- Use color as a primary affordance to save screen space.
- Keyboard-first navigation, fully usable with joystick and mouse. C64 Ultimate USB mouse support is a primary target.
- Redraw only dirty widgets/regions.
- Avoid hidden heap allocation. Applications using the toolkit are RAM constrained.

## 1) Core architecture

Library layers:
1. Screen layer: write screencodes + colors through Oscar `CharWin` raw APIs or direct screen/color RAM helpers.
2. Theme layer: semantic color roles to C64 color values.
3. Widget core: base widget struct, state machine, invalidation.
4. Layout/containers: panel, frame/group, status bar, simple row/column packing.
5. Input/focus: key dispatch, joystick dispatch, mouse dispatch, focus traversal, modal routing.
6. Pointer layer: mouse position, sprite cursor integration, hover/click hit-testing.
7. App loop: poll inputs, dispatch event, update model, repaint dirty regions.

CharWin policy:
- TUIkit should build on Oscar `CharWin` wherever possible instead of reimplementing text window primitives.
- `CharWin` already provides bounded text regions, raw screencode writes, color writes, cursor movement, rectangle fill/get/put, scrolling, and simple editing helpers.
- TUIkit owns widget state, layout, focus, events, colors, and invalidation. `CharWin` owns the low-level character-window drawing mechanics.
- The backend API should be small enough that direct `$0400/$D800` drawing can still be used for hot paths or apps that do not want `CharWin` linked in.
- Use `cwin_putat_char_raw`, `cwin_putat_string_raw`, `cwin_fill_rect_raw`, `cwin_put_rect_raw`, and `cwin_scroll_*` for normal widget drawing.

RAM policy:
- No required heap allocation.
- Widgets live in caller-owned fixed arrays.
- Use byte indices for widget relationships where possible; avoid pointer-heavy trees in the default build.
- Optional features are enabled with C `#define`s so unused widgets, mouse cursor code, and richer controls can compile out.
- Do not require a full 1000-byte shadow screen or 1000-byte shadow color buffer. Provide it only as an optional backend for apps that can afford it.

Widget state model (required):
- can_focus: widget participates in focus order.
- enabled: disabled widgets ignore activation.
- visible: hidden widgets skipped by layout and draw.
- dirty: redraw requested.
- active/selected: pressed, checked, open, etc.
- focused widget is stored in `tui_context_t`, not duplicated per widget unless a build option requests cached focus flags.

Redraw policy:
- Any state/value/theme/focus change sets dirty.
- Parent container becomes dirty when child geometry changes.
- Render pass draws only dirty widgets in fixed order: normal widgets first, then one popup or modal overlay.
- Default dirty tracking is widget-level. Large widgets may keep their own byte-sized dirty row range.
- Generic dirty rectangle lists are optional, not part of the RAM-minimal core.

Mouse cursor policy:
- Toolkit owns logical mouse cursor coordinates and button state.
- Default C64 Ultimate target uses a hardware sprite cursor when mouse support is enabled.
- Character-cell cursor overlay is a fallback backend only; it must save/restore the covered cell or invalidate old/new cells.
- Cursor rendering is an overlay step after widget paint.
- Moving cursor updates hover state and invalidates only widgets whose hover/press state changed.

Z-order policy:
- v1 supports one root screen plus at most one popup or modal overlay at a time.
- No arbitrary stacking or overlapping movable windows in the RAM-minimal core.
- Closing a popup/modal marks the covered parent region or parent widgets dirty instead of storing a full backing buffer by default.
- Movable/stackable panels are a future optional feature and require app-provided backing storage or full repaint.

## 2) Widget catalog and look

All widgets define Idle, Focused, Active/Selected, Disabled visuals.

Structural/container widgets:
- Window/Panel: rectangular container, optional title. Movable/stackable windows are future optional features, not RAM-minimal core behavior.
	- Look: border + title text; optional one-char shadow on right/bottom.
- Frame/Group Box: titled region for related controls.
	- Look: thin border with title embedded in top edge.
- Status Bar: one row at bottom of screen or panel.
	- Look: full-width color band with short hints/mode text.

Navigation widgets:
- Menu Bar: top strip with items separated by spaces.
	- Look: "File  Edit  Options"; focused item uses inverse or focus color.
	- Behavior: each item supports an explicit shortcut key binding.
- Drop-down Menu: temporary overlay list.
	- Look: narrow popup panel below active menu item.
- Drop-down Button: button that opens an attached menu/list.
	- Look: "[ Export v ]"; behaves like a compact menu trigger.
- Combo Box / Drop-down List (future optional widget): collapsed selection + expandable list.
	- Look: "[ English v ]" in collapsed mode, popup list on open.

Interactive controls:
- Push Button: command trigger.
	- Look: "[ OK ]", "[ Cancel ]"; optional one-char shadow for depth.
- Check Box: independent bool.
	- Look: "[ ] label" or "[X] label".
- Radio Button: one-of-many in group.
	- Look: "( ) label" / "(*) label".
- Toggle Button (optional compact control): two-state command.
	- Look: "[ ON ]" / "[OFF]" with strong active color.

List/data widgets:
- List Box / Scroll List: vertical items, one selected row.
	- Look: one item per row, selected row highlighted by color/inverse.
- Table/Grid: fixed columns with clipped text, header bar, one selected row.
	- Look: reverse-video header bar + per-row selection highlight; columns padded to fixed widths with single-cell gutters. Enabled with `TUI_ENABLE_TABLE` (default on).
- Scrollbar (vertical and optional horizontal): track + thumb.
	- Look: track from repeated character, thumb from inverse block/space.

Text/input widgets:
- Label: static text (not focusable).
- Text Input: single-line editable text.
	- Look: bounded field with cursor and optional placeholder.
- Text Area: multi-line editable text with scroll offsets.
	- Look: editor region + optional scrollbars.
- Numeric Field (optional): text input with numeric filter/spin keys.

Utility widgets:
- Separator: horizontal/vertical visual divider.
- Progress Bar: percentage fill by repeated chars/colors.
- Message/Toast line: transient notice, can reuse status style.
- Dialog: modal panel with message + buttons.

## 3) Focus and keyboard behavior

Required keys:
- Up-arrow key (dedicated C64 upward arrow key, not cursor-up): next focus.
- Shift + Up-arrow key: previous focus.
- Return/Space: activate focused control.
- Cursor keys: in lists, menus, text fields.
- RUN/STOP: close popup/dialog, cancel menu/dropdown state.
- Home/Delete: text editing where relevant.

Additional input devices:
- Joystick: directional navigation and primary fire activation.
- Mouse: primary button required; support hover, press, release, hold, and drag where widgets opt in. C64 Ultimate USB mouse is the expected common target.
- Input precedence: modal widgets consume input first, then focused widget, then global handlers.
- Input repeat/debounce must be explicit for keyboard, joystick, and mouse hold handling.

Focus rules:
- Labels/separators cannot focus.
- Disabled widgets are skipped in traversal.
- Modal dialog traps focus until closed.
- Opening dropdown/menu moves focus to popup root.

## 4) Color system and themes

Use semantic roles (tokens), not hardcoded per-widget colors:
- screen_bg
- panel_bg
- border
- text
- focus_text
- focus_bg
- active_text
- active_bg
- disabled_text
- disabled_bg
- selection_text
- selection_bg
- status_info
- status_warn
- status_error

State color policy (space-saving):
- Idle: normal text + panel_bg.
- Focused: swap fg/bg or use strong focus color (cyan/yellow class).
- Active/Selected: dedicated active/selection colors, no extra border needed.
- Disabled: medium gray style text, reduced contrast.

Predefined themes (examples):

Theme selection policy:
- Theme is selected at build time with a C `#define`, for example `TUI_THEME_CLASSIC_BLUE`.
- Only the selected `const tui_theme_t` should be compiled into the binary by default.
- Runtime theme switching is not part of the RAM-minimal core. Demo theme switcher is removed from v1 requirements.
- Apps that need runtime themes can define `TUI_ENABLE_RUNTIME_THEMES` and provide their own theme table.
- Compile-time selection is smaller because unused theme structs, theme-switching UI, and repaint logic for theme cycling can be omitted by the compiler/linker.

Theme A: Classic Blue
- screen_bg=BLUE(6), panel_bg=LIGHT_GRAY(15), border=DARK_GRAY(11), text=BLACK(0)
- focus_bg=CYAN(3), focus_text=BLACK(0)
- selection_bg=LIGHT_BLUE(14), selection_text=BLACK(0)
- disabled_text=GRAY(12)

Theme B: Terminal Green
- screen_bg=BLACK(0), panel_bg=DARK_GRAY(11), border=GRAY(12), text=LIGHT_GREEN(13)
- focus_bg=GREEN(5), focus_text=BLACK(0)
- selection_bg=LIGHT_GREEN(13), selection_text=BLACK(0)
- disabled_text=GRAY(12)

Theme C: Paper UI
- screen_bg=LIGHT_GRAY(15), panel_bg=WHITE(1), border=BLUE(6), text=BLACK(0)
- focus_bg=YELLOW(7), focus_text=BLACK(0)
- selection_bg=CYAN(3), selection_text=BLACK(0)
- disabled_text=DARK_GRAY(11)

## 5) Lo/up-safe screencode set for widget drawing

Notes:
- Reverse form of any code is code + 128 (set bit 7).
- Prefer raw screencode APIs for deterministic rendering.
- Use Oscar screen-code literals (`s"..."`) or raw byte constants for widget labels/art.
- Use PETSCII only for keyboard input or when intentionally passing text through Oscar/conio translation.

Recommended drawing screencodes (default profile):

| Hex | Char | Use |
|---:|---|---|
| 0x20 | space | Fill, padding, clear areas |
| 0x40 | ─ | Horizontal rule, separators |
| 0x78 |   | Strong separator/header underline |
| 0x5D | │ | Vertical separator/border |
| 0x5B | ┼ | Border corners/junctions |
| 0x1B | [ | Button/checkbox left bracket |
| 0x1D | ] | Button/checkbox right bracket |
| 0x28 | ( | Radio left marker |
| 0x29 | ) | Radio right marker |
| 0x2A | * | Radio selected marker |
| 0x7A | ✓ | Checkbox selected marker |
| 0x3E | > | Menu/list active indicator |
| 0x3C | < | Optional left indicator |
| 0x1E | ↑ | Scroll up indicator |
| 0x1F | ← | Back indicator / breadcrumb |
| 0x2E | . | Light track texture |
| 0x66 |   | Strong track/fill texture |

Alternate border/junction profile (recommended for delimiters, group boxes, containers, bordered buttons):

| Hex | Char | Use |
|---:|---|---|
| 0x70 | ┌ | Top-left corner |
| 0x6E | ┐ | Top-right corner |
| 0x6D | └ | Bottom-left corner |
| 0x7D | ┘ | Bottom-right corner |
| 0x40 | ─ | Horizontal edge |
| 0x5D | │ | Vertical edge |
| 0x72 | ┬ | Top T-junction (split columns/panes) |
| 0x71 | ┴ | Bottom T-junction |
| 0x6B | ├ | Left T-junction |
| 0x73 | ┤ | Right T-junction |
| 0x5B | ┼ | Cross-junction |
| 0x6F | ▂ | Heavy delimiter/accent separator |

Guideline:
- Keep the default minimal profile for dense UI and low visual noise.
- Use this alternate profile where explicit grouping helps readability (dialogs, framed panels, bordered controls, column delimiters).

Widget-to-glyph recipe (enhanced border profile):

- Frame/Group Box:
	- Corners: 0x70 (TL), 0x6E (TR), 0x6D (BL), 0x7D (BR)
	- Edges: 0x40 horizontal, 0x5D vertical
	- Title cut-in: replace one top-edge run with spaces/text; optional 0x72/0x6B where title segment rejoins border.
- Dialog/Panel Container:
	- Same rectangle recipe as Frame/Group Box.
	- Optional inner row divider: left 0x6B, fill 0x40, right 0x73.
- Bordered Button:
	- Preferred compact: keep [ ] style (0x1B/0x1D).
	- Optional boxed variant: 3-row mini box using 0x70/0x6E top, 0x6D/0x7D bottom, 0x5D sides, 0x40 top/bottom edges.
	- Focus/pressed state should be color/reverse-video first, glyph change second.
- Column/Table Delimiters:
	- Header separator: left 0x6B, repeated 0x40 with 0x72 at column splits, right 0x73.
	- Mid-table crosspoints: 0x5B when both vertical and horizontal rules cross.
	- Footer separator: use 0x71 at bottom splits.
- Splitter/Pane Junctions:
	- Vertical split attached to top border: 0x72.
	- Vertical split attached to bottom border: 0x71.
	- Horizontal split attached to left/right border: 0x6B / 0x73.
- Strong Delimiter Row:
	- Use 0x6F repeated for section breaks (toolbars, status partitions, modal emphasis).
	- Avoid overuse; reserve for high-priority grouping.

Layout note:
- On 40x25, prefer single-line borders and sparse junctions; rely on theme contrast for most hierarchy.

### Complete list of screencodes useful for rendering gfx

| Screencode | Unicode | Description |
|---:|---:|---:|
| 0x1B | 0x005B | #LEFT SQUARE BRACKET |
| 0x1C | 0x00A3 | #POUND SIGN |
| 0x1D | 0x005D | #RIGHT SQUARE BRACKET |
| 0x1E | 0x2191 | #UPWARDS ARROW |
| 0x1F | 0x2190 | #LEFTWARDS ARROW |
| 0x28 | 0x0028 | #LEFT PARENTHESIS |
| 0x29 | 0x0029 | #RIGHT PARENTHESIS |
| 0x2A | 0x002A | #ASTERISK |
| 0x2B | 0x002B | #PLUS SIGN |
| 0x2D | 0x002D | #HYPHEN-MINUS |
| 0x2E | 0x002E | #FULL STOP |
| 0x2F | 0x002F | #SOLIDUS |
| 0x3A | 0x003A | #COLON |
| 0x3C | 0x003C | #LESS-THAN SIGN |
| 0x3D | 0x003D | #EQUALS SIGN |
| 0x3E | 0x003E | #GREATER-THAN SIGN |
| 0x40 | 0x2500 | #BOX DRAWINGS LIGHT HORIZONTAL |
| 0x5B | 0x253C | #BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL |
| 0x5C | 0xF12E | #LEFT HALF BLOCK MEDIUM SHADE (CUS) |
| 0x5D | 0x2502 | #BOX DRAWINGS LIGHT VERTICAL |
| 0x5E | 0x2592 | #MEDIUM SHADE |
| 0x5F | 0xF139 | #MEDIUM SHADE SLASHED LEFT (CUS) |
| 0x60 | 0x00A0 | #NO-BREAK SPACE |
| 0x61 | 0x258C | #LEFT HALF BLOCK |
| 0x62 | 0x2584 | #LOWER HALF BLOCK |
| 0x63 | 0x2594 | #UPPER ONE EIGHTH BLOCK |
| 0x64 | 0x2581 | #LOWER ONE EIGHTH BLOCK |
| 0x65 | 0x258F | #LEFT ONE EIGHTH BLOCK |
| 0x66 | 0x2592 | #MEDIUM SHADE |
| 0x67 | 0x2595 | #RIGHT ONE EIGHTH BLOCK |
| 0x68 | 0xF12F | #LOWER HALF BLOCK MEDIUM SHADE (CUS) |
| 0x69 | 0xF13A | #MEDIUM SHADE SLASHED RIGHT (CUS) |
| 0x6A | 0xF130 | #RIGHT ONE QUARTER BLOCK (CUS) |
| 0x6B | 0x251C | #BOX DRAWINGS LIGHT VERTICAL AND RIGHT |
| 0x6C | 0x2597 | #QUADRANT LOWER RIGHT |
| 0x6D | 0x2514 | #BOX DRAWINGS LIGHT UP AND RIGHT |
| 0x6E | 0x2510 | #BOX DRAWINGS LIGHT DOWN AND LEFT |
| 0x6F | 0x2582 | #LOWER ONE QUARTER BLOCK |
| 0x70 | 0x250C | #BOX DRAWINGS LIGHT DOWN AND RIGHT |
| 0x71 | 0x2534 | #BOX DRAWINGS LIGHT UP AND HORIZONTAL |
| 0x72 | 0x252C | #BOX DRAWINGS LIGHT DOWN AND HORIZONTAL |
| 0x73 | 0x2524 | #BOX DRAWINGS LIGHT VERTICAL AND LEFT |
| 0x74 | 0x258E | #LEFT ONE QUARTER BLOCK |
| 0x75 | 0x258D | #LEFT THREE EIGTHS BLOCK |
| 0x76 | 0xF131 | #RIGHT THREE EIGHTHS BLOCK (CUS) |
| 0x77 | 0xF132 | #UPPER ONE QUARTER BLOCK (CUS) |
| 0x78 | 0xF133 | #UPPER THREE EIGHTS BLOCK (CUS) |
| 0x79 | 0x2583 | #LOWER THREE EIGHTHS BLOCK |
| 0x7A | 0x2713 | #CHECK MARK |
| 0x7B | 0x2596 | #QUADRANT LOWER LEFT |
| 0x7C | 0x259D | #QUADRANT UPPER RIGHT |
| 0x7D | 0x2518 | #BOX DRAWINGS LIGHT UP AND LEFT |
| 0x7E | 0x2598 | #QUADRANT UPPER LEFT |
| 0x7F | 0x259A | #QUADRANT UPPER LEFT AND LOWER RIGHT |

Reverse-video variants commonly used:
- 160 (0xA0): reverse space for selection and scrollbar thumb.
- Any entry above +128: highlighted variant without changing glyph.

## 6) Demo app requirements (must prove completeness)

The demo should include all of the following screens/features:
1. Main desktop: menu bar + status bar + at least one panel with controls.
2. Form screen: labels, text input, checkbox, radio group, buttons.
3. Data screen: list box with scrollbar and selection handling.
4. Popup behaviors: dropdown menu, drop-down button, and modal dialog.
5. Focus visualizer: clearly show focus traversal and active state.
6. Input parity check: keyboard, joystick, and mouse all operate core flows.
7. Mouse cursor check: visible pointer, click activation, drag/scroll where relevant.
8. Performance check: dirty redraw only; no full-screen redraw per key.

Explicitly out of v1 demo scope:
- Table/grid.
- Combo box.
- Runtime theme switcher.

## 7) Implementation notes

- Default to compact text+color visuals first, then optional richer glyph profile later.
- Keep visual style consistent by driving all colors from theme tokens.
- Keep widget geometry tight for 40x25: avoid decorative empty borders unless functionally needed.
- For selected/focused rows and controls, prefer reverse video and palette contrast over extra characters.
- Use `CharWin` scrolling for text areas, list viewport movement, and window-region scrolling when the widget geometry matches a rectangular text area.
- For list boxes, prefer logical scroll offset plus row redraw over physically scrolling memory unless many rows move and the viewport is large enough to justify it.
- For text areas, `CharWin` helps substantially because cursor movement, insertion/deletion, and scrolling already exist. TUIkit should wrap those behaviors rather than duplicate them.