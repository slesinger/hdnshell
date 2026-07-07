# C Programming: Graphics and Text Mode

> Part of the [Programming in C on the C64](c-programming.md) reference. Covers screen output: text mode, the VIC-II video chip, sprites, and hires bitmap graphics.

## Text Mode Programming

### Direct Screen Access (fastest)

```c
#include <c64/vic.h>   // pulls in types.h

#define Screen ((byte *)0x0400)
#define Color  ((byte *)0xd800)

// Inline helper (compiled away by optimizer):
inline void screen_put(byte x, byte y, char ch, char color)
{
    Screen[40 * y + x] = ch;
    Color [40 * y + x] = color;
}

// Clear screen to spaces (screen code 0x20) in light blue (14):
void screen_clear(void)
{
    memset(Screen, 0x20,  1000);
    memset(Color,  14,    1000);
}
```

Screen codes differ from ASCII and PETSCII. Letters A–Z map to screen codes `$01`–`$1A`. For string constants use the `s""` prefix which Oscar64 interprets as screen-code strings:

```c
const char msg[] = s"HELLO";   // screen-code string literal
```

Or just pass normal C strings to `puts` / `printf` — Oscar64 handles the mapping automatically.

### CharWin — Text Window API

`CharWin` gives you a scrolling text window with cursor management, useful for building menus, dialogs, or console output areas.

```c
#include <c64/charwin.h>

CharWin mywin;

int main(void)
{
    // Window: full screen, top-left (0,0), 40 wide × 25 tall
    cwin_init(&mywin, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&mywin);

    // Write coloured text at absolute position (no cursor change):
    cwin_putat_string(&mywin, 1, 1, "HONDANI SHELL", 14);  // light blue

    // Write at cursor position and advance cursor:
    cwin_cursor_move(&mywin, 0, 3);
    cwin_put_string(&mywin, "SCORE: ", 7);   // yellow

    char buf[8];
    itoa(1234, buf, 10);
    cwin_put_string(&mywin, buf, 15);        // light grey

    return 0;
}
```

**Key CharWin functions:**

| Function | Description |
|----------|-------------|
| `cwin_init(w, screen, sx, sy, wx, wy)` | Initialise window — does not clear |
| `cwin_clear(w)` | Fill with spaces, color 0 |
| `cwin_fill(w, ch, color)` | Fill with character + color |
| `cwin_cursor_move(w, x, y)` | Move cursor to column x, row y (0-based) |
| `cwin_put_char(w, ch, color)` | Write char, advance cursor |
| `cwin_put_string(w, str, color)` | Write string, advance cursor |
| `cwin_putat_string(w, x, y, str, color)` | Write at position, no cursor change |
| `cwin_fill_rect(w, x, y, w, h, ch, color)` | Fill rectangle |
| `cwin_scroll_up(w, by)` | Scroll contents up by `by` rows |

**Console-style output** (treat window as a scrolling terminal):

```c
cwin_console_write_string(&mywin, "LOADING...\n", 5);  // purple
cwin_console_printf(&mywin, 14, "FREE RAM: %u BYTES\n", heapfree());
```

### Keyboard Input

```c
// Blocking — waits for a key
int ch = cwin_getch();

// Non-blocking — returns -1 if no key waiting
int ch = cwin_checkch();

// Full line input (RETURN terminates):
char buf[32];
cwin_console_edit_string(&mywin, 14);  // user types, result in window
cwin_console_get_string(&mywin, buf, sizeof(buf));
```

For keyboard/joystick input beyond CharWin, see [Input and File I/O](c-io.md).

### TUIkit — Interactive UI Framework

For interactive applications with menus, dialogs, list boxes, and mouse support, **TUIkit** builds on top of CharWin to provide a complete text-UI toolkit. TUIkit manages focus, keyboard/joystick/mouse input dispatch, theme rendering, and dirty-region optimization — all with zero heap allocation. See the [TUIkit Reference](tuikit-reference.md) for the complete API and widget catalog.

---

## VIC-II Video Chip

The VIC-II at `$D000` controls all video output. Access it via the `vic` macro after `#include <c64/vic.h>`.

### Setting Colors

```c
#include <c64/vic.h>

vic.color_border = 0;   // black border
vic.color_back   = 0;   // black background
vic.color_back1  = 1;   // white — used in ECM/multicolor text
```

Standard color indexes (0–15):

| Value | Color | Value | Color |
|-------|-------|-------|-------|
| 0 | Black | 8 | Orange |
| 1 | White | 9 | Brown |
| 2 | Red | 10 | Light Red |
| 3 | Cyan | 11 | Dark Grey |
| 4 | Purple | 12 | Grey |
| 5 | Green | 13 | Light Green |
| 6 | Blue | 14 | Light Blue |
| 7 | Yellow | 15 | Light Grey |

### Screen Modes

```c
// Standard 40×25 text — default at startup
vic_setmode(VICM_TEXT, (char*)0x0400, (char*)0x1000);

// Hires 320×200 bitmap (2 colors per 8×8 cell):
vic_setmode(VICM_HIRES, Color, Hires);

// Multicolor 160×200 bitmap (4 colors per cell):
vic_setmode(VICM_HIRES_MC, Color, Hires);
```

Available modes: `VICM_TEXT`, `VICM_TEXT_MC`, `VICM_TEXT_ECM`, `VICM_HIRES`, `VICM_HIRES_MC`.

### Frame Synchronisation

Always synchronise drawing to the raster beam to avoid visual tearing:

```c
// Wait until raster is below the visible area (line ~251):
vic_waitBottom();
// ... safely update screen RAM here without tearing ...

// Wait for a full frame (bottom then back to top) — use for double-buffering:
vic_waitFrame();

// Wait for specific raster line:
vic_waitLine(50);
```

---

## Sprites

The C64 has 8 hardware sprites (24×21 pixels each, 64 bytes of data per sprite).

### Basic Hardware Sprites

```c
#include <c64/sprites.h>
#include <c64/vic.h>

// Place 64-byte sprite data at bank offset 0x3800 (sprite #0 at image 14):
// spr_init must be called with screen RAM address:
spr_init((char*)0x0400);

// Configure and show sprite 0:
spr_set(0,
    true,           // show
    160, 100,       // X, Y position (9-bit X, 8-bit Y)
    14,             // image index (points to 0x3800 + 14*64 in current VIC bank)
    7,              // color (yellow)
    false,          // not multicolor
    false, false    // no X/Y expand
);

// Move sprite in game loop:
spr_move(0, newx, newy);

// Hide sprite:
spr_show(0, false);
```

For up to 16 simultaneous logical sprites (multiplexed onto 8 hardware sprites), use `vspr_*` functions from the same header — they work via raster IRQs and need a call to `vspr_sort()` and `vspr_update()` each frame.

---

## Hires Bitmap Graphics

For 320×200 pixel graphics you need to swap in RAM at `$E000` (normally Kernal ROM) and set up the VIC for bitmap mode.

```c
#include <c64/vic.h>
#include <c64/memmap.h>
#include <gfx/bitmap.h>
#include <string.h>

#define Color ((char *)0xd800)
#define Hires ((char *)0xe000)

Bitmap Screen;
ClipRect clip = {0, 0, 320, 200};

void init_graphics(void)
{
    mmap_set(MMAP_RAM);           // swap ROM → RAM at $E000
    memset(Color, 0x10, 1000);    // all cells: foreground=1 (white), background=0 (black)
    memset(Hires, 0x00, 8000);    // clear bitmap
    mmap_set(MMAP_NO_ROM);
    vic_setmode(VICM_HIRES, Color, Hires);
    bm_init(&Screen, Hires, 40, 25);
    vic.color_border = 0;
    vic.color_back   = 0;
}
```

### Drawing

```c
// Solid horizontal and diagonal lines:
bmu_line(&Screen, 0, 100, 319, 100, 0xff, LINOP_SET);   // horizontal, solid
bmu_line(&Screen, 0, 0,   319, 199, 0xaa, LINOP_SET);   // diagonal, dashed

// Filled shapes (use 8-byte tile pattern; 0xff = solid fill):
const char solid[8] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff};

bm_circle_fill  (&Screen, &clip, 160, 100, 50, solid);
bm_triangle_fill(&Screen, &clip, 10, 190, 160, 10, 310, 190, solid);
bm_rect_fill    (&Screen, &clip, 50, 50, 100, 60);

// Pixel operations:
bm_set(&Screen, 100, 80);    // set pixel
bm_clr(&Screen, 100, 80);    // clear pixel
bool on = bm_get(&Screen, 100, 80);

// Clear entire bitmap:
bm_fill(&Screen, 0x00);
```

### Blitting

```c
// Copy a 32×32 region from srcBm to Screen with XOR operation:
bm_bitblit(&Screen, &clip,
    160, 100,       // destination top-left
    &srcBm, 0, 0,   // source bitmap and offset
    32, 32,         // width × height
    solid,          // pattern (used only for BLTOP_PATTERN)
    BLTOP_XOR
);
```

Available `BlitOp` values: `BLTOP_SET`, `BLTOP_RESET`, `BLTOP_XOR`, `BLTOP_OR`, `BLTOP_AND`, `BLTOP_NOT`, `BLTOP_COPY`, `BLTOP_NCOPY`, `BLTOP_PATTERN`.

---

Next: [Sound (SID)](c-sound.md) · [Input and File I/O](c-io.md) · [Performance and Inline Assembly](c-performance.md)
