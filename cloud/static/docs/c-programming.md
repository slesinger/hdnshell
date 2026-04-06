# C Programming on the C64 with Hondani Shell

## Table of Contents

1. [The Development Environment](#the-development-environment)
   - [Console 2 — File Editor](#console-2--file-editor-c--2)
   - [Console 3 — Coding Agent](#console-3--coding-agent-c--3)
2. [Project Structure](#project-structure)
3. [Your First Program](#your-first-program)
4. [C64 Memory Map](#c64-memory-map)
5. [Types and Variables](#types-and-variables)
6. [Standard Library Reference](#standard-library-reference)
7. [Text Mode Programming](#text-mode-programming)
8. [VIC-II Video Chip](#vic-ii-video-chip)
9. [Sprites](#sprites)
10. [Hires Bitmap Graphics](#hires-bitmap-graphics)
11. [SID Sound Chip](#sid-sound-chip)
12. [Keyboard and Joystick Input](#keyboard-and-joystick-input)
13. [Disk and File I/O](#disk-and-file-io)
14. [Complete Example: Snake Game Skeleton](#complete-example-snake-game-skeleton)
15. [Performance Tips](#performance-tips)
16. [Inline Assembly](#inline-assembly)
17. [Quick Reference: Include Headers](#quick-reference-include-headers)

---

This guide walks you through writing, compiling, and running C programs directly on your Commodore 64 using the tools built into Hondani Shell. You do not need a separate PC-based workflow — the editor, compiler, and deployment pipeline all run through the shell's server-side consoles and the C64 Ultimate cartridge.

**Prerequisites**

- HDN Shell loaded as a ROM (or PRG) via the C64 Ultimate cartridge
- C64 Ultimate connected to the same network as the HDN Shell cloud server
- The cloud server running (see [Cloud Integration](cloud-integration.md))

---

## The Development Environment

Hondani Shell provides two dedicated server-side consoles for C development. Both run on the cloud server and display on your C64's 40×25 screen via the C64 Ultimate DMA service.

### Switching Consoles

Press the **Commodore key** (`C=`) together with a number key to switch consoles:

| Key combo | Console |
|-----------|---------|
| `C=` + `1` | Local HDN Shell |
| `C=` + `2` | **File Editor** — write and edit code |
| `C=` + `3` | **Coding Agent** — AI assistant that writes, compiles, and runs code |

Press `C=` + `1` at any time to return to the shell prompt.

---

## Console 2 — File Editor (`C=` + `2`)

The file editor is a full-featured text editor that renders entirely on the server and pushes the resulting screen to your C64. No editor code runs on the C64 itself.

### Screen Layout

```
 Row  0 │ FILE  EDIT  VIEW  SEARCH  HELP    1/3 │  ← menu bar
 Row  1 │    1 ...text line 1...                │  ← editing area
   ...  │    ...                                │     (23 rows)
 Row 23 │   23 ...text line 23...               │
 Row 24 │ *myfile.c  l42c17  512ln  edt         │  ← status bar
```

- **Menu bar** (row 0) — menus and open-file tab counter (`current/total`).
- **Editing area** (rows 1–23) — 5-character gutter showing line numbers, followed by 35 columns of text. Can be split into two panes.
- **Status bar** (row 24) — `*` = unsaved changes, filename, cursor position (`l`ine / `c`olumn), total lines, current mode.

### Editor Modes

The status bar tail shows the current mode:

| Status | Mode |
|--------|------|
| `edt` | Normal text editing |
| `mnu` | Menu navigation |
| `brw` | File browser |
| `fnd` | Find input |
| `rpl` | Replace input |
| `gto` | Go-to-line input |
| `tab` | Open-file list (tabs) |
| `hlp` | Help screen |
| `sh$` | Embedded console/shell |
| `?`   | Confirm dialog |

### Navigation

| Key | Action |
|-----|--------|
| Cursor keys | Move one character / one line |
| `CTRL` + `←` / `→` | Move one word left / right |
| `CTRL` + `↑` / `↓` | Scroll view without moving cursor |
| `HOME` | Move to beginning of line |
| `SHIFT` + `HOME` | Jump to top of file |
| `CLR` | Jump to end of file |
| `C=` + `<` | Page up |
| `C=` + `>` | Page down |
| `C=` + `G` | Go to line number |

### Editing

| Key | Action |
|-----|--------|
| Printable keys | Insert character at cursor |
| `RETURN` | Insert new line |
| `DEL` | Delete character to the left (backspace) |
| `INS` | Insert a space at cursor |
| `TAB` | Insert 4 spaces |
| `C=` + `Y` | Delete current line |

### File Operations

| Key | Action |
|-----|--------|
| `F1` | New file (new tab) |
| `F2` | Show open-file list |
| `F3` | Open file browser |
| `F5` | Save current file |
| `SHIFT` + `F5` | Save as… (prompts for path) |
| `C=` + `W` | Close current file |

### Block Operations (Cut / Copy / Paste)

Set start and end anchors to mark a block, then cut or copy it. The selected block is highlighted in yellow.

| Key | Action |
|-----|--------|
| `C=` + `B` | Set block start at cursor |
| `C=` + `E` | Set block end at cursor |
| `C=` + `A` | Select entire file |
| `C=` + `X` | Cut selection to clipboard |
| `C=` + `C` | Copy selection to clipboard |
| `C=` + `V` | Paste clipboard at cursor |

### Search and Replace

Search matches are highlighted in red across the entire file. Patterns follow Python regular-expression syntax (case-insensitive).

| Key | Action |
|-----|--------|
| `C=` + `F` | Find — enter a search pattern |
| `C=` + `N` | Find next occurrence |
| `C=` + `R` | Replace all — prompts for pattern then replacement |

### Split Screen

| Key | Action |
|-----|--------|
| `C=` + `1` | Single pane (no split) |
| `C=` + `2` | Split horizontally (top / bottom panes) |
| `C=` + `3` | Split vertically (left / right panes) |

When split, press `F2` to switch the active document between panes.

### Compilation and Run

| Key | Action |
|-----|--------|
| `CTRL` + `E` | Compile active file with Oscar64 |
| `CTRL` + `R` | Compile and upload `.prg` to C64 Ultimate, then run |
| `F7` | Toggle embedded console/shell |
| `F8` | Toggle help screen |
| `ESC` / `RUN/STOP` | Open / close menu bar |

### File Browser

Press **F3** to navigate the server's filesystem. Directories appear in green surrounded by `[ ]`, files in light blue. Press `RETURN` on a directory to enter it, on a file to open it. Press `RUN/STOP` to cancel.

---

## Console 3 — Coding Agent (`C=` + `3`)

The Coding Agent is an AI assistant that speaks plain English. Tell it what you want to build; it writes the C source, compiles it with Oscar64, fixes any errors automatically, and uploads the resulting `.prg` to your C64 Ultimate.

> **Requires:** an LLM API key configured in the server settings. See [Cloud Integration](cloud-integration.md).

### Screen Layout

```
 Row  0 │ [CODING AGENT]  project: myproject     │  ← status bar
 Row  1 │ > hello, write a sprite demo            │  ← chat area
   ...  │   agent: sure! writing sprite.c ...     │     (22 rows)
 Row 22 │   action: compiled ok  12 errors fixed  │
 Row 23 │ ─────────────────────────────────────── │  ← separator
 Row 24 │ > _                                     │  ← input line
```

**Colour coding:**

| Colour | Meaning |
|--------|---------|
| Light blue | Your message |
| Light green | Agent reply |
| Yellow | Agent action (file written, compiled, etc.) |
| Cyan | System message |
| Red | Error |

### Workflow

1. Press `C=` + `3` to open the Coding Agent.
2. Press `F3` to browse the workspace and select a project directory.
3. Type what you want to build and press `RETURN`.
4. The agent writes code, compiles, iterates on errors, and runs the program on your C64.
5. Give feedback in the chat to refine the result.

### Keyboard Reference

| Key | Action |
|-----|--------|
| Type + `RETURN` | Send message to agent |
| `↑` / `↓` | Scroll chat up / down one line |
| `C=` + `<` / `C=` + `>` | Page up / page down through chat |
| `HOME` | Scroll to top of chat |
| `SHIFT` + `HOME` | Scroll to bottom (most recent) |
| `F3` | Open file browser to select project directory |
| `F8` | Toggle help screen |
| `RUN/STOP` | Close help / cancel browser |

### Slash Commands

Type at the input line and press `RETURN`:

| Command | Description |
|---------|-------------|
| `/clear` | Clear the chat history |
| `/files` | List all source files in the current project |
| `/compile [file]` | Compile the project (optionally specify the main `.c` file) |
| `/run` | Upload the last compiled `.prg` to C64 Ultimate and run it |
| `/project` | Show the current working project directory |
| `/help` | Show the in-app help screen |

---

## Project Structure

Oscar64 uses a **one-directory-per-project** convention. The recommended layout is:

```
oscar/projects/
  myprogram/
    myprogram.c       ← main source file
    myprogram.prg     ← generated binary (after compile)
    util.c            ← optional extra source files
    util.h
```

The project directory is relative to the server's working directory. The Coding Agent and File Editor both have their own file browsers to navigate to and select a project folder.

### Compiler Invocation

The server runs the Oscar64 compiler as:

```bash
oscar64 myprogram/myprogram.c
```

This produces `myprogram/myprogram.prg`. You do not need to list all `.c` files — Oscar64 picks up additional files via `#pragma compile(...)` declarations inside the `.h` headers you include.

### From Edit to Running on the C64

1. Write your C source in the **File Editor** (Console 2) and press `CTRL+E` to compile, or `CTRL+R` to compile and run immediately.
2. Alternatively use the **Coding Agent** (Console 3) — it compiles and runs automatically.
3. The server uploads the `.prg` to your C64 Ultimate via DMA write and injects a RUN command into the keyboard buffer.
4. The program starts on the real hardware within a second or two.

---

## Your First Program

Create a new file called `hello/hello.c` in the file editor (press `F1` for a new file, then `SHIFT+F5` to save as).

```c
#include <stdio.h>

int main(void)
{
    printf("HELLO, WORLD!\n");
    return 0;
}
```

Press `CTRL+R` to compile and run. The text appears on the C64 screen. Press `CTRL+E` alone if you only want to check for errors without running.

> **Note:** `printf` outputs to the C64's standard console (the screen). The C64 uses uppercase-only in its default character set, so lowercase letters in string literals are mapped to uppercase on screen.

---

## C64 Memory Map

The C64 has 64 KB of RAM, but ROM overlaps it at startup. Understanding the layout is essential for direct hardware access.

| Address Range | Contents |
|---|---|
| `$0000–$00FF` | Zero page — fastest RAM, used by the compiler for temporaries |
| `$0100–$01FF` | 6502 stack |
| `$0200–$03FF` | Kernal and BASIC OS work area |
| `$0400–$07E7` | Default screen RAM (40×25 = 1000 characters) |
| `$0800–$9FFF` | Typical program area (your code and data) |
| `$C000–$CFFF` | Usable RAM (ROM can be swapped out) |
| `$D000–$D3FF` | VIC-II video chip registers |
| `$D400–$D7FF` | SID sound chip registers |
| `$D800–$DBFF` | Color RAM (one nibble per screen character) |
| `$DC00–$DCFF` | CIA 1 — keyboard matrix, joystick |
| `$DD00–$DDFF` | CIA 2 — IEC serial bus, VIC bank select |
| `$DF00–$DFFF` | REU / C64 Ultimate registers |
| `$E000–$FFFF` | KERNAL ROM (can swap to RAM with `mmap_set`) |

Programs produced by Oscar64 start at `$0801` (with a BASIC stub) by default, so your code and data live roughly in `$0800–$9FFF`.

---

## Types and Variables

Oscar64 defines several type aliases tuned for 6502 efficiency. Always `#include <c64/types.h>` (pulled in automatically by any `c64/` header):

```c
typedef unsigned char   byte;    // 0..255     — maps to one 8-bit register
typedef signed char     sbyte;   // -128..127  — signed 8-bit
typedef unsigned int    word;    // 0..65535   — 16-bit, two bytes
typedef unsigned long   dword;   // 0..4294967295 — 32-bit, four bytes
```

**Prefer `byte` and `sbyte` wherever possible.** The 6502 is an 8-bit CPU; all arithmetic on `byte` values maps directly to single instructions. Using `int` (16-bit) for a loop counter that never exceeds 255 doubles the instruction count.

### Pointers to Hardware Registers

Cast an integer address to a typed pointer to access hardware directly:

```c
byte * const Screen = (byte *)0x0400;   // screen RAM
byte * const Color  = (byte *)0xd800;   // color RAM

// Write character 'A' (screen code 1) in red (color 2) at column 0, row 0:
Screen[0] = 1;
Color[0]  = 2;

// Address a specific cell: column x, row y
Screen[40 * y + x] = ch;
Color [40 * y + x] = color;
```

This is the foundation of all fast text and graphics on the C64.

---

## Standard Library Reference

### `stdlib.h`

```c
// Number conversion
void itoa(int n, char * s, unsigned radix);   // e.g. itoa(42, buf, 10) → "42"
void utoa(unsigned n, char * s, unsigned radix);
int  atoi(const char * s);                    // "123" → 123

// Random numbers
unsigned int rand(void);           // 0..65535
void         srand(unsigned seed); // seed the RNG

// Memory
void * malloc(unsigned int size);  // Returns NULL if no memory
void   free(void * ptr);
unsigned heapfree(void);           // Bytes remaining on heap

// Program flow
void exit(int status);             // Return to BASIC
```

> **Heap caution:** The C64 has very limited RAM. Check `heapfree()` before allocating, and always `free()` what you allocate. Prefer stack-allocated arrays for small fixed-size buffers.

### `string.h`

```c
char *       strcpy(char * dst, const char * src);
char *       strcat(char * dst, const char * src);
signed char  strcmp(const char * a, const char * b);   // returns signed char, not int
int          strlen(const char * s);
char *       strchr(const char * s, int ch);
void *       memset(void * dst, int val, int size);
void *       memcpy(void * dst, const void * src, int size);
void *       memclr(void * dst, int size);              // fast zero-fill (Oscar64 intrinsic)
```

> `strcmp` returns `signed char`, not `int` — compare against 0 as usual, but do not store the result in an `int`.

### `stdio.h`

```c
// Console output
void printf(const char * fmt, ...);  // %d %u %x %c %s supported; use %ld for long
void puts(const char * str);
void putchar(char c);

// Console input
char   getchar(void);                // blocking single key
char * gets_s(char * str, size_t n); // line input, max n-1 chars

// Formatted strings
int sprintf(char * buf, const char * fmt, ...);
int sscanf(const char * str, const char * fmt, ...);

// File I/O — backed by C64 kernal / IEC bus
FILE * fopen(const char * fname, const char * mode);
int    fclose(FILE * fp);
int    fgetc(FILE * stream);                        // returns EOF (-1) at end
char * fgets(char * s, int n, FILE * stream);
int    fputc(int c, FILE * stream);
size_t fread(void * buf, size_t size, size_t count, FILE * stream);
size_t fwrite(const void * buf, size_t size, size_t count, FILE * stream);
```

---

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

## SID Sound Chip

The SID at `$D400` has three voices, each with its own oscillator, pulse-width control, and ADSR envelope.

```c
#include <c64/sid.h>

void play_note(void)
{
    // Set master volume (0–15), no filter:
    sid.fmodevol = 15;

    // Voice 0: triangle wave, middle C (C4), fast attack, medium decay:
    sid.voices[0].freq   = NOTE_C(4);
    sid.voices[0].pwm    = 0;
    sid.voices[0].attdec = SID_ATK_8  | SID_DKY_24;
    sid.voices[0].susrel = 0x80       | SID_DKY_300;
    sid.voices[0].ctrl   = SID_CTRL_TRI | SID_CTRL_GATE;  // start note
}

void release_note(void)
{
    // Clear GATE bit — starts the release phase:
    sid.voices[0].ctrl = SID_CTRL_TRI;
}
```

### Waveform Bits (`ctrl` register)

| Constant | Waveform / Function |
|----------|---------------------|
| `SID_CTRL_GATE`  | Note on (set) / note off (clear) |
| `SID_CTRL_TRI`   | Triangle |
| `SID_CTRL_SAW`   | Sawtooth |
| `SID_CTRL_RECT`  | Pulse (square) |
| `SID_CTRL_NOISE` | Noise |

Waveforms can be combined — triangle+sawtooth gives a bright tone, noise alone gives percussion effects.

### Note Macros

`NOTE_x(octave)` macros produce the correct SID frequency register value for PAL systems:

```c
sid.voices[0].freq = NOTE_A(4);    // A4 ≈ 440 Hz (concert A)
sid.voices[1].freq = NOTE_CS(5);   // C# in octave 5
sid.voices[2].freq = NOTE_G(3);    // G in octave 3
```

Available: `NOTE_C`, `NOTE_CS`, `NOTE_D`, `NOTE_DS`, `NOTE_E`, `NOTE_F`, `NOTE_FS`, `NOTE_G`, `NOTE_GS`, `NOTE_A`, `NOTE_AS`, `NOTE_B`. Octave range 0–9.

### Envelope Constants

**Attack** (`SID_ATK_*`, upper nibble of `attdec`):

| Constant | Attack time |
|----------|------------|
| `SID_ATK_2` | 2 ms |
| `SID_ATK_8` | 8 ms |
| `SID_ATK_16` | 16 ms |
| `SID_ATK_100` | 100 ms |
| `SID_ATK_250` | 250 ms |
| `SID_ATK_500` | 500 ms |

**Decay / Release** (`SID_DKY_*`, lower nibble of `attdec` / `susrel`):

| Constant | Time |
|----------|------|
| `SID_DKY_6` | 6 ms |
| `SID_DKY_24` | 24 ms |
| `SID_DKY_300` | 300 ms |
| `SID_DKY_9000` | 9 s |

**Sustain level** is set in the upper nibble of `susrel` as a 4-bit value (0 = silence, 15 = maximum). Example: `0xF0` = full sustain.

### Playing a Simple Beep on Key Press

```c
#include <c64/sid.h>
#include <c64/charwin.h>

int main(void)
{
    sid.fmodevol = 15;

    CharWin w;
    cwin_init(&w, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&w);
    cwin_putat_string(&w, 0, 0, "PRESS A KEY...", 14);

    while (true)
    {
        int key = cwin_getch();

        // Start note on any key
        sid.voices[0].freq   = NOTE_C(4);
        sid.voices[0].attdec = SID_ATK_8 | SID_DKY_24;
        sid.voices[0].susrel = 0x00       | SID_DKY_300;
        sid.voices[0].ctrl   = SID_CTRL_TRI | SID_CTRL_GATE;

        vic_waitFrames(4);   // hold note for ~4 frames (~80 ms on PAL)

        // Release
        sid.voices[0].ctrl = SID_CTRL_TRI;

        if (key == 3)   // RUN/STOP (PETSCII 3) exits
            break;
    }

    sid.fmodevol = 0;   // silence
    return 0;
}
```

---

## Keyboard and Joystick Input

### Keyboard via CharWin

The simplest approach for interactive programs:

```c
#include <c64/charwin.h>

int key = cwin_getch();      // blocking: waits for a key, returns PETSCII code
int key = cwin_checkch();    // non-blocking: returns -1 if no key pending
```

Common PETSCII codes:

| Code | Key | Code | Key |
|------|-----|------|-----|
| 13 | RETURN | 3 | RUN/STOP |
| 17 | Cursor down | 29 | Cursor right |
| 145 | Cursor up | 157 | Cursor left |
| 20 | DEL | 133–140 | F1–F8 |

For full keyboard scanning (including modifier keys), use `cia1` register access directly — see `c64/cia.h`.

### Joystick

```c
#include <c64/joystick.h>

joy_poll(1);               // read joystick port 1 (or 2) into internal state

if (joy_button(1))         // fire button: port 1
    fire_laser();

if (joy_left(1))           // joystick left: port 1
    player_x--;

if (joy_right(1))
    player_x++;

if (joy_up(1))
    player_y--;

if (joy_down(1))
    player_y++;
```

---

## Disk and File I/O

Files are accessed via the C64's built-in kernal and the IEC serial bus. `fopen` wraps the kernal file open routines.

```c
#include <stdio.h>

// Read a sequential file from disk:
FILE * f = fopen("SCORES,S,R", "r");
if (f)
{
    char buf[40];
    while (fgets(buf, sizeof(buf), f))
        printf("%s", buf);
    fclose(f);
}

// Write a sequential file:
FILE * f = fopen("SCORES,S,W", "w");
if (f)
{
    fputs("1000\n", f);
    fputs("500\n",  f);
    fclose(f);
}
```

**C64 filename format:** `NAME,TYPE,RW`

| Part | Values |
|------|--------|
| Name | up to 16 characters |
| Type | `S` = sequential, `P` = PRG, `U` = user, `L` = relative |
| Direction | `R` = read, `W` = write |

Maximum 8 files open simultaneously (`FOPEN_MAX`). Filename maximum is 16 characters (`FILENAME_MAX`).

---

## Complete Example: Snake Game Skeleton

This is the structure of a simple game following patterns seen in the Oscar64 sample code:

```c
#include <c64/joystick.h>
#include <c64/vic.h>
#include <stdlib.h>
#include <string.h>

// Direct screen / color RAM access
#define Screen ((byte *)0x0400)
#define Color  ((byte *)0xd800)

inline void screen_put(byte x, byte y, char ch, char color)
{
    Screen[40 * y + x] = ch;
    Color [40 * y + x] = color;
}

// Game state
byte  player_x = 20, player_y = 12;
byte  score = 0;
bool  running = true;

void init(void)
{
    memset(Screen, 0x20, 1000);  // clear to spaces
    memset(Color,  14,   1000);  // all light blue
    vic.color_border = 0;
    vic.color_back   = 0;
    srand(42);
}

void update(void)
{
    joy_poll(2);   // port 2 is typical for single-player

    if (joy_left(2)  && player_x > 0)  player_x--;
    if (joy_right(2) && player_x < 39) player_x++;
    if (joy_up(2)    && player_y > 0)  player_y--;
    if (joy_down(2)  && player_y < 24) player_y++;
}

void draw(void)
{
    memset(Screen, 0x20, 1000);
    screen_put(player_x, player_y, 0x51, 5);  // green ball char
}

int main(void)
{
    init();
    while (running)
    {
        vic_waitBottom();  // sync to frame
        update();
        draw();
    }
    return 0;
}
```

---

## Performance Tips

The 6502 is a 1 MHz 8-bit processor with 64 KB RAM. These habits matter:

**Use `byte` / `sbyte` for counters and coordinates.** Every `int` variable doubles the instruction count compared to `byte` for the same operation.

```c
// Bad — 16-bit loop on an 8-bit CPU:
for (int i = 0; i < 40; i++) { ... }

// Good — 8-bit throughout:
for (byte i = 0; i < 40; i++) { ... }
```

**Write directly to screen / color RAM.** Using `printf` or CharWin for inner-loop drawing is expensive. Write to `Screen[]` and `Color[]` directly.

**Avoid `float`.** Floating-point on the 6502 requires software routines and is roughly 100× slower than integer math. Use integer arithmetic and fixed-point instead.

```c
// Fixed-point example: position with 8 fractional bits
int px_fp = 100 << 8;        // 100.0 in 8.8 fixed point
int speed  = 2  << 8;        // 2 pixels per frame
px_fp += speed;
byte px = (byte)(px_fp >> 8);  // integer pixel position
```

**Check memory before `malloc`.** RAM is scarce. Use stack-allocated arrays for small fixed buffers, and call `heapfree()` to verify available space before large allocations.

**Sync drawing to `vic_waitBottom`.** Call it at the start of each frame to eliminate flickering without double-buffering.

**Mark hot helpers `inline`.** The compiler respects `inline` and eliminates function-call overhead for small, frequently called routines:

```c
inline void screen_put(byte x, byte y, char ch, char color)
{
    Screen[40 * y + x] = ch;
    Color [40 * y + x] = color;
}
```

**Use `memset` / `memcpy` for bulk operations.** Oscar64's `memclr` and `memset` are intrinsics — much faster than hand-written loops for clearing screen RAM or copying large buffers.

---

## Inline Assembly

You can embed 6502 assembly instructions directly inside any C function using `__asm { }`. This is useful for timing-critical code, direct hardware pokes, or anything the C compiler cannot express.

### Basic Syntax

```c
__asm {
    lda #$01
    sta $d020
    sta $d021
}
```

The example above loads the value `$01` into the accumulator and stores it to `$D020` (border color) and `$D021` (background color), setting both to white.

A practical wrapper:

```c
#include <c64/vic.h>

void set_border_bg(byte color)
{
    __asm {
        lda color    // load the C local variable 'color' into accumulator
        sta $d020
        sta $d021
    }
}
```

### Accessing C Variables

C local variables, parameters, and global variables can be referenced by name inside `__asm { }`. The compiler maps them to the appropriate zero-page register or absolute address automatically:

```c
byte val = 5;

__asm {
    lda val          // load local variable
    clc
    adc #1
    sta val          // store back
}
```

### Labels and Branches

Define labels with a colon. Use them as branch targets:

```c
__asm {
    ldx #0
loop:
    inx
    cpx #10
    bne loop         // branch back to 'loop' if X != 10
}
```

### Returning a Value from Assembler

Store the result in the zero-page location `accu` and wrap with `return __asm { ... }`:

```c
char read_keyboard(void)
{
    return __asm {
        jsr 0xffcf   // KERNAL GETIN
        sta accu
        lda #0
        sta accu + 1
    };
}
```

### Preventing Optimisation

Oscar64's optimiser may reorder or eliminate `__asm` statements it considers redundant. When the sequence must execute exactly as written (e.g. hardware timing, IRQ critical sections), use `__asm volatile { }`:

```c
__asm volatile {
    lda #$01
    sta $d020
    sta $d021
}
```

You can also disable assembler optimisation for an entire block of C code:

```c
#pragma optimize(noasm)
// ... code here will not have its embedded asm touched by the optimizer
#pragma optimize(default)
```

### Disabling Interrupts

A common use of inline assembly is bracketing code that must not be interrupted:

```c
__asm { sei }   // disable IRQs
// ... critical section ...
__asm { cli }   // re-enable IRQs
```

### Complete Example: Flash the Border

```c
#include <c64/vic.h>

int main(void)
{
    for (byte color = 0; color < 16; color++)
    {
        __asm volatile {
            lda color
            sta $d020    // border
            sta $d021    // background
        }
        vic_waitFrames(3);   // hold each color for ~3 frames
    }
    return 0;
}
```

---

## Quick Reference: Include Headers

| Header | Provides |
|--------|---------|
| `<stdio.h>` | `printf`, `puts`, `fopen`, `fclose`, file I/O |
| `<stdlib.h>` | `malloc`, `free`, `rand`, `itoa`, `atoi`, `heapfree` |
| `<string.h>` | `strcpy`, `memcpy`, `memset`, `strlen`, `strcmp` |
| `<c64/vic.h>` | `vic` struct, `vic_setmode`, `vic_waitBottom`, `vic_sprxy` |
| `<c64/sid.h>` | `sid` struct, `NOTE_*` macros, `SID_CTRL_*`, `SID_ATK_*` |
| `<c64/charwin.h>` | `CharWin`, `cwin_init`, `cwin_getch`, text windows |
| `<c64/sprites.h>` | `spr_init`, `spr_set`, `spr_move`, virtual sprite system |
| `<c64/joystick.h>` | `joy_poll`, `joy_left`, `joy_right`, `joy_up`, `joy_down`, `joy_button` |
| `<c64/memmap.h>` | `mmap_set`, `MMAP_RAM`, `MMAP_NO_ROM` — ROM/RAM bank switching |
| `<c64/rasterirq.h>` | Raster IRQ for mid-frame register changes, color bars |
| `<gfx/bitmap.h>` | `Bitmap`, `bm_init`, `bm_line`, `bm_fill`, shape fills, blitting |
| `<gfx/mcbitmap.h>` | Multicolor bitmap (160×200, 4 colors per cell) |

You do not need to compile the library `.c` files manually — they are picked up automatically via `#pragma compile(...)` inside each header.
