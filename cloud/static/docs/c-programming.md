# C Programming on the C64 with Hondani Shell

This guide walks you through writing, compiling, and running C programs directly on your Commodore 64 using the tools built into Hondani Shell. You do not need a separate PC-based workflow — the editor, compiler, and deployment pipeline all run through the shell's server-side consoles and the C64 Ultimate cartridge.

**Prerequisites**

- The HDN Shell RR cartridge attached on your C64 Ultimate (see [Installation](installation.md))
- C64 Ultimate connected to the same network as the HDN Server
- The HDN Server running (see [Server Integration](cloud-integration.md))

> **Prefer to learn by doing?** The [Coding Tutorials](coding-tutorials.md) turn
> this reference into four hands-on, agent-guided projects (first program →
> sprites → assembler raster effect → TUIkit UI), each with a ready-to-build
> example under [`oscar/projects/`](../../oscar/projects/). This page is the
> deeper reference to return to.

## Contents

**This page (language & environment basics):**

1. [The Development Environment](#the-development-environment)
2. [Project Structure](#project-structure)
3. [Your First Program](#your-first-program)
4. [C64 Memory Map](#c64-memory-map)
5. [Types and Variables](#types-and-variables)
6. [Standard Library Reference](#standard-library-reference)
7. [Quick Reference: Include Headers](#quick-reference-include-headers)

**Topic pages:**

- [Graphics and Text Mode](c-graphics.md) — direct screen access, CharWin, VIC-II, sprites, hires bitmap.
- [Sound (SID)](c-sound.md) — the SID sound chip, waveforms, envelopes, notes.
- [Input and File I/O](c-io.md) — keyboard, joystick, and disk file I/O.
- [Performance and Inline Assembly](c-performance.md) — a game skeleton, performance habits, 6502 `__asm`.
- [TUIkit Reference](tuikit-reference.md) — the interactive text-UI toolkit.

---

## The Development Environment

Hondani Shell provides two dedicated server-side consoles for C development, both rendered on your C64's 40×25 screen via the C64 Ultimate DMA service. Switch to them with the **Commodore key together with CTRL** and a number key (`C=+CTRL+1` returns to the shell at any time):

- **`C=+CTRL+2` — File Editor.** A full-featured text editor for writing and editing code; press `CTRL+E` to compile with Oscar64, `CTRL+R` to compile, upload, and run on the C64. See the [File Editor](server-file-editor.md) chapter for its full layout, modes, and keyboard reference.
- **`C=+CTRL+3` — Coding Agent.** An AI assistant that writes the C source, compiles, fixes errors, and runs the result on your C64 from a plain-language description. Requires an LLM API key in the server settings. See the [Coding Agent](coding-agent.md) chapter for modes, skills, and the full command list.

For the complete console map (including the server apps on consoles 4–7), see [Server Apps](cloud-apps.md).

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

For disk-file examples (opening, reading, writing sequential files) see [Input and File I/O](c-io.md).

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

---

**Continue to the topic pages:** [Graphics and Text Mode](c-graphics.md) · [Sound (SID)](c-sound.md) · [Input and File I/O](c-io.md) · [Performance and Inline Assembly](c-performance.md) · [TUIkit Reference](tuikit-reference.md)
