# Oscar64 C Compiler — LLM Programming Guide (Part 1/4)
## Overview, Types, and Standard Library

This is the documentation for **oscar64**, a cross-compiler that compiles C/C++ to 6502 machine code for the **Commodore 64**. It is NOT gcc, clang, or any standard compiler. The output is a `.prg` file that runs on a real C64 or emulator (e.g. VICE x64sc).

---

## Compiler Invocation

```sh
oscar64 myprogram.c          # compile, output myprogram.prg
oscar64 myprogram.c -n        # compile without loading address header (bare binary)
```

Library files are pulled in automatically via `#pragma compile("file.c")` declarations in each `.h` file. **You do not need to list all .c files on the command line** — including the `.h` is sufficient.

Include paths use `<>` for library headers and `""` for local files. C64-specific headers are under `c64/`, graphics under `gfx/`, audio under `audio/`, C++ support under `opp/`.

```c
#include <c64/vic.h>        // VIC-II chip
#include <c64/sid.h>        // SID sound chip
#include <gfx/bitmap.h>     // Hires bitmap graphics
#include <stdio.h>          // printf, file I/O
#include <stdlib.h>         // malloc, rand, atoi, etc.
#include <string.h>         // memcpy, strcpy, etc.
```

---

## Important: C64 Memory Layout

The C64 has 64 KB of RAM, but ROM overlaps it at startup. Key addresses:

| Address Range | Default Contents |
|---|---|
| `$0000–$00FF` | Zero page (fast access) |
| `$0400–$07E7` | Default screen RAM (40×25 chars) |
| `$D000–$D3FF` | VIC-II chip registers |
| `$D400–$D7FF` | SID chip registers |
| `$D800–$DBFF` | Color RAM (per-character color) |
| `$DC00–$DCFF` | CIA 1 (keyboard/joystick) |
| `$DD00–$DDFF` | CIA 2 (IEC bus/VIC bank) |
| `$DF00–$DFFF` | REU / cartridge registers |
| `$E000–$FFFF` | KERNAL ROM (or RAM if swapped) |

Programs typically start at `$0801` (BASIC stub) or `$2000`+ depending on build settings.

---

## `c64/types.h` — Basic C64 Type Aliases

Always included transitively through other headers. Defines:

```c
typedef unsigned char  byte;    // 0..255
typedef unsigned int   word;    // 0..65535
typedef unsigned long  dword;   // 0..4294967295
typedef signed char    sbyte;   // -128..127
```

Use `byte` and `sbyte` freely — they map directly to 8-bit 6502 registers and are very efficient.

---

## `stdlib.h` — Standard Library

### Number conversion

```c
void itoa(int n, char * s, unsigned radix);
// Convert signed int to string. radix=10 for decimal, 16 for hex.
// Example: itoa(-42, buf, 10) → buf = "-42"

void utoa(unsigned int n, char * s, unsigned radix);
// Convert unsigned int to string.

void ltoa(long n, char * s, unsigned radix);
void ultoa(unsigned long n, char * s, unsigned radix);
// Long versions of itoa/utoa.

void ftoa(float f, char * s);
// Convert float to string.

int atoi(const char * s);
// Parse decimal string to int. Returns 0 on failure.

long atol(const char * s);
float atof(const char * s);
float strtof(const char *s, const char **endp);

int strtoi(const char *s, const char **endp, char base);
// Parse int with given base (2,8,10,16). endp points past last parsed char.

unsigned strtou(const char *s, const char **endp, char base);
long strtol(const char *s, const char **endp, char base);
unsigned long strtoul(const char *s, const char **endp, char base);
```

### Math

```c
int abs(int n);
long labs(long n);

div_t div(int numer, int denom);
// Returns struct { int quot; int rem; }

ldiv_t ldiv(long int numer, long int denom);
// Returns struct { long int quot; long int rem; }
```

### Random numbers

```c
unsigned int rand(void);
// Returns pseudo-random 0..65535

void srand(unsigned int seed);
// Seed the RNG

unsigned long lrand(void);   // 32-bit random
void lsrand(unsigned long seed);
```

### Memory management (heap)

```c
void * malloc(unsigned int size);
// Allocate size bytes. Returns NULL if no memory available.
// CAUTION: C64 has very limited RAM. Avoid large allocations.

void free(void * ptr);
// Free memory previously allocated by malloc.

void * calloc(int num, int size);
// Allocate num*size bytes, zero-initialized.

void * realloc(void * ptr, unsigned size);
// Resize an allocation.

unsigned heapfree(void);
// Return number of free bytes on the heap.
```

### Program flow

```c
void exit(int status);   // Terminate program, return to BASIC
void abort(void);        // Crash/halt
```

---

## `string.h` — String and Memory Operations

All functions operate on C strings (null-terminated) or raw memory.

```c
char * strcpy(char * dst, const char * src);
// Copy src to dst (including null terminator). Returns dst.

char * strncpy(char * dst, const char * src, int n);
// Copy at most n bytes; pads with zeros if src shorter than n.

signed char strcmp(const char * ptr1, const char * ptr2);
// Compare. Returns 0 if equal, negative if ptr1<ptr2, positive if ptr1>ptr2.
// NOTE: Returns signed char (8-bit), not int as in standard C.

signed char strncmp(const char * ptr1, const char * ptr2, int n);

int strlen(const char * str);
// Returns length not including null terminator.

char * strcat(char * dst, const char * src);
char * strncat(char * dst, const char * src, int n);

char * strchr(const char * str, int ch);
// Find first occurrence of ch in str. Returns pointer or NULL.

char * strrchr(const char * str, int ch);
// Find last occurrence of ch.

char * strstr(const char * str, const char * substr);
// Find first occurrence of substr in str. Returns pointer or NULL.

char * cpycat(char * dst, const char * src);
// Like strcpy but returns pointer to end of copied string (past null).
// Useful for chaining: cpycat(cpycat(buf, "Hello"), " World")

void * memclr(void * dst, int size);
// Zero-fill size bytes starting at dst. Fast intrinsic.

void * memset(void * dst, int value, int size);
// Fill size bytes with value byte.

void * memcpy(void * dst, const void * src, int size);
// Copy size bytes from src to dst. Regions must not overlap.

signed char memcmp(const void * ptr1, const void * ptr2, int size);
// Compare size bytes. Returns 0 if equal.

void * memmove(void * dst, const void * src, int size);
// Copy size bytes, handles overlapping regions.

void * memchr(const void * ptr, int ch, int size);
// Find first occurrence of byte ch in block.
```

---

## `stdio.h` — Console and File I/O

### Console output

```c
void putchar(char c);
// Output one character (PETSCII/ASCII depending on iocharmap setting).

void puts(const char * str);
// Output string followed by newline.

void printf(const char * fmt, ...);
// Formatted output to console. Supports: %d %u %x %c %s %f
// NOTE: %d is int (16-bit). Use %ld for long.

void vprintf(const char * fmt, va_list vlist);
```

### Console input

```c
char getchar(void);
// Read one character from keyboard, blocking.

char * gets(char * str);
// Read line from keyboard into str, blocking. Terminated by RETURN.

char * gets_s(char * str, size_t n);
// Like gets but limits to n-1 chars.
```

### Formatted strings

```c
int sprintf(char * str, const char * fmt, ...);
// Format into buffer str. Returns number of characters written.

int vsprintf(char * str, const char * fmt, va_list vlist);

int scanf(const char * fmt, ...);
// Read formatted input from console.

int sscanf(const char * str, const char * fmt, ...);
// Parse formatted input from string.
```

### File I/O (backed by kernal/IEC)

The FILE system wraps the kernal serial file operations. Max 8 files (`FOPEN_MAX`), filenames max 16 chars (`FILENAME_MAX`).

```c
FILE * fopen(const char * fname, const char * mode);
// Open file. fname is a C64 filename (e.g. "DATA,S,R" for seq read).
// mode: "r" = read, "w" = write, "a" = append.
// Returns NULL on failure.

int fclose(FILE * fp);
// Close file. Returns 0 on success.

int fgetc(FILE * stream);
// Read one byte. Returns byte value or EOF (-1) at end.

char * fgets(char * s, int n, FILE * stream);
// Read up to n-1 bytes as line. Returns s or NULL at EOF.

int fputc(int c, FILE * stream);
// Write one byte. Returns c or EOF on error.

int fputs(const char * s, FILE * stream);
// Write string. Returns non-negative on success.

int feof(FILE * stream);
// Returns non-zero if end-of-file reached.

size_t fread(void * buffer, size_t size, size_t count, FILE * stream);
// Read count items of size bytes each. Returns items read.

size_t fwrite(const void * buffer, size_t size, size_t count, FILE * stream);
// Write count items of size bytes each. Returns items written.

int fprintf(FILE * stream, const char * format, ...);
int fscanf(FILE * stream, const char * format, ...);
```

---

## `math.h` — Floating Point Math

All functions use `float` (32-bit IEEE 754). Floating point is slow on the 6502 — use fixed-point (`fixmath.h`) for performance-critical code.

```c
#define PI  3.141592653

float fabs(float f);     // Absolute value
float floor(float f);    // Round down
float ceil(float f);     // Round up

float sin(float f);      // f in radians
float cos(float f);
float tan(float f);
float asin(float f);     // Returns radians
float acos(float f);
float atan(float f);
float atan2(float p, float q);  // atan2(y, x) → angle in radians

float exp(float f);
float log(float f);      // Natural log
float log10(float f);

float pow(float p, float q);  // p^q
float sqrt(float f);

bool isinf(float f);
bool isfinite(float f);
```

---

## `fixmath.h` — Fast Fixed-Point Arithmetic

These native functions are optimized 6502 routines. Use them instead of float for speed.

### Fixed-point notation
- `12.4` = 12 bits integer, 4 bits fraction (units of 1/16)
- `8.8` = 8 bits integer, 8 bits fraction (units of 1/256)
- `4.12` = 4 bits integer, 12 bits fraction (units of 1/4096)
- `16.16` = 16 bits integer, 16 bits fraction (as `long`)

### Multiplication

```c
unsigned long lmul16u(unsigned x, unsigned y);
// Multiply two unsigned 16-bit numbers → 32-bit result.
// Use for large-number products without overflow.

long lmul16s(int x, int y);
// Signed 16×16 → 32-bit.

int lmul12f4s(int x, int y);
// Multiply two 12.4 fixed-point → 12.4 result.

int lmul8f8s(int x, int y);
// Multiply two 8.8 fixed-point → 8.8 result.

int lmul4f12s(int x, int y);
// Multiply two 4.12 fixed-point → 4.12 result.

unsigned long lsqr4f12s(int x);
// Square a 4.12 signed → 8.24 result.

unsigned long lmul16f16(unsigned long x, unsigned long y);
long lmul16f16s(long x, long y);
// Multiply two 16.16 fixed-point numbers.
```

### Division

```c
unsigned ldiv16u(unsigned long x, unsigned y);
// Divide 32-bit unsigned by 16-bit → 16-bit unsigned.

int ldiv16s(long x, int y);
// Signed version.

int ldiv12f4s(int x, int y);   // 12.4 / 12.4 → 12.4
int ldiv8f8s(int x, int y);    // 8.8  / 8.8  → 8.8
int ldiv4f12s(int x, int y);   // 4.12 / 4.12 → 4.12

unsigned long ldiv16f16(unsigned long x, unsigned long y);
long ldiv16f16s(long x, long y);
// 16.16 / 16.16 → 16.16
```

### Multiply-then-divide (single operation, avoids overflow)

```c
unsigned lmuldiv16u(unsigned a, unsigned b, unsigned c);
// Compute a*b/c as unsigned. Intermediate result uses 32 bits.

int lmuldiv16s(int a, int b, int c);
// Signed version.

unsigned lmuldiv16by8(unsigned a, char b, char c);
// a * b / c where b,c are 8-bit.

unsigned lmuldiv8by8(char a, char b, char c);
// a * b / c all 8-bit inputs → 16-bit result.
```

### Square root

```c
unsigned usqrt(unsigned n);
// Fast integer square root of 16-bit number.
```

---

## `oscar.h` — Compression and Debug

```c
const char * oscar_expand_lzo(char * dp, const char * sp);
// Decompress LZO-compressed data from sp into dp.
// Returns pointer past last written byte in dp.
// Use this to store compressed resources (graphics, etc.) and unpack at runtime.

const char * oscar_expand_rle(char * dp, const char * sp);
// Decompress RLE-compressed data. Same signature as above.

const char * oscar_expand_lzo_buf(char * dp, const char * sp);
// Same as oscar_expand_lzo, but uses 256 bytes of stack instead of
// reading target memory. Use when dp points to write-only memory.

void breakpoint(void);
// Insert a VICE debugger breakpoint at this location. The breakpoint
// is recorded in the .lbl file. Use during development to pause VICE
// at a specific point.

void debugcrash(void);
// Force a crash/halt for debugging.
```

---

## `conio.h` — Low-Level Console I/O

### Character map modes

```c
enum IOCharMap {
    IOCHM_TRANSPARENT,  // No translation (raw PETSCII)
    IOCHM_ASCII,        // Translate CR→LF only
    IOCHM_PETSCII_1,    // Translate ASCII↔PETSCII upper case font
    IOCHM_PETSCII_2     // Translate ASCII↔PETSCII lower case font
};

void iocharmap(IOCharMap chmap);
// Set the character translation mode for all console I/O.
// Default after startup is PETSCII (no translation).
// Use IOCHM_ASCII if you want to type/print ASCII like on a PC.
```

### Low-level character I/O

```c
void putpch(char c);    // Output char with PETSCII translation
char getpch(void);      // Input char with PETSCII translation

void putrch(char c);    // Output raw char (no translation, inline)
char getrch(void);      // Input raw char (no translation, inline)
```

### Standard console functions

```c
char kbhit(void);
// Returns non-zero if a key has been pressed (non-blocking check).

char getche(void);
// Read next key press, block until pressed, echo to screen.

char getch(void);
// Read next key press, block until pressed, no echo.

char getchx(void);
// Read next key if available, returns 0 if no key pressed (non-blocking).

void putch(char c);
// Output one character.

void clrscr(void);
// Clear the screen.

void gotoxy(char x, char y);
// Move cursor to column x (0–39), row y (0–24).

void textcolor(char c);    // Set text color (inline)
void bgcolor(char c);      // Set background color (inline)
void bordercolor(char c);  // Set border color (inline)
// Color values: use ConioColors enum or VCOL_* constants
```

### Color constants (from conio.h and vic.h)

```c
// ConioColors enum (conio.h)        VICColors enum (vic.h)
COLOR_BLACK       = 0              VCOL_BLACK    = 0
COLOR_WHITE       = 1              VCOL_WHITE    = 1
COLOR_RED         = 2              VCOL_RED      = 2
COLOR_CYAN        = 3              VCOL_CYAN     = 3
COLOR_PURPLE      = 4              VCOL_PURPLE   = 4
COLOR_GREEN       = 5              VCOL_GREEN    = 5
COLOR_BLUE        = 6              VCOL_BLUE     = 6
COLOR_YELLOW      = 7              VCOL_YELLOW   = 7
COLOR_ORANGE      = 8              VCOL_ORANGE   = 8
COLOR_BROWN       = 9              VCOL_BROWN    = 9
COLOR_LT_RED      = 10             VCOL_LT_RED   = 10
COLOR_DARK_GREY   = 11             VCOL_DARK_GREY= 11
COLOR_MED_GREY    = 12             VCOL_MED_GREY = 12
COLOR_LT_GREEN    = 13             VCOL_LT_GREEN = 13
COLOR_LT_BLUE     = 14             VCOL_LT_BLUE  = 14
COLOR_LT_GREY     = 15             VCOL_LT_GREY  = 15
```

### PETSCII control codes (for use with putch/printf)

```c
PETSCII_CURSOR_LEFT   = 0x9d
PETSCII_CURSOR_RIGHT  = 0x1d
PETSCII_CURSOR_UP     = 0x91
PETSCII_CURSOR_DOWN   = 0x11
PETSCII_HOME          = 0x13
PETSCII_CLEAR         = 0x94
PETSCII_DEL           = 0x14
PETSCII_RETURN        = 0x0d
PETSCII_F1..F8        = 0x85..0x8c
```

---

## `petscii.h` — PETSCII Character Mapping

```c
#pragma charmap(97, 65, 26)
#pragma charmap(65, 97, 26)
```

Including `petscii.h` swaps the lowercase/uppercase letter mappings so that lowercase ASCII letters render as uppercase PETSCII characters (the default screen font on C64). This is typically included when you want lowercase source strings to appear correctly on screen.

---

*Continued in Part 2: VIC-II, SID, CIA, Memory Map*
