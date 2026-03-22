# Oscar64 C Compiler — LLM Programming Guide (Part 3/4)
## Text Windows, Sprites, Raster IRQ, Keyboard, Joystick, IEC Bus

---

## `c64/charwin.h` — Character-Based Text Windows

`CharWin` provides a windowed text area anywhere on the C64 screen with cursor management, scrolling, editing, and console features. All coordinates are relative to the window's top-left corner.

### Data structure

```c
struct CharWin {
    char sx, sy;    // Screen position (top-left column, row)
    char wx, wy;    // Window width and height in characters
    char cx, cy;    // Current cursor column, row within window
    char lx, ly;    // Last valid cursor position (used internally)
    char * sp;      // Pointer into screen RAM at cursor
    char * cp;      // Pointer into color RAM at cursor
};
```

### Initialization

```c
void cwin_init(CharWin * win, char * screen, char sx, char sy, char wx, char wy);
// Initialize window. Does NOT clear the screen area.
// screen = base of screen RAM (usually (char*)0x0400)
// sx, sy = top-left corner of window (0-based)
// wx, wy = width and height of window
// Example: cwin_init(&mywin, (char*)0x0400, 2, 2, 36, 20);
```

### Clearing and filling

```c
void cwin_clear(CharWin * win);
// Clear the window to spaces (screen code 0x20) with color 0.

void cwin_fill(CharWin * win, char ch, char color);
// Fill entire window with character ch and color.
```

### Cursor control

```c
void cwin_cursor_show(CharWin * win, bool show);
// Show/hide cursor by toggling the high bit (bit 7) of the character at cursor.

void cwin_cursor_move(CharWin * win, char cx, char cy);
// Move cursor to column cx, row cy within the window (0-based).

bool cwin_cursor_left(CharWin * win);    // Returns true if cursor moved (not at edge)
bool cwin_cursor_right(CharWin * win);
bool cwin_cursor_up(CharWin * win);
bool cwin_cursor_down(CharWin * win);
bool cwin_cursor_forward(CharWin * win);   // Like right but wraps to next line
bool cwin_cursor_backward(CharWin * win);  // Like left but wraps to previous line
bool cwin_cursor_newline(CharWin * win);   // Move to start of next line
```

### Writing text at cursor position (auto-advances cursor)

```c
void cwin_put_char(CharWin * win, char ch, char color);
// Write PETSCII character ch in color, then advance cursor.

void cwin_put_chars(CharWin * win, const char * chars, char num, char color);
// Write num PETSCII characters starting at chars.

char cwin_put_string(CharWin * win, const char * str, char color);
// Write null-terminated PETSCII string. Returns 0 on success.

// "raw" variants use raw screen codes (not PETSCII), e.g. from a custom charset:
void cwin_put_char_raw(CharWin * win, char ch, char color);
void cwin_put_chars_raw(CharWin * win, const char * chars, char num, char color);
char cwin_put_string_raw(CharWin * win, const char * str, char color);
```

### Writing text at absolute position (no cursor change)

```c
void cwin_putat_char(CharWin * win, char x, char y, char ch, char color);
char cwin_putat_string(CharWin * win, char x, char y, const char * str, char color);
// x, y are relative to the window's top-left.

// raw variants for screen codes:
void cwin_putat_char_raw(CharWin * win, char x, char y, char ch, char color);
char cwin_putat_string_raw(CharWin * win, char x, char y, const char * str, char color);
```

### Reading from window

```c
char cwin_getat_char(CharWin * win, char x, char y);
// Get PETSCII character at position x,y.

void cwin_getat_chars(CharWin * win, char x, char y, char * chars, char num);
// Read num PETSCII characters starting at x,y.

char cwin_getat_char_raw(CharWin * win, char x, char y);
void cwin_getat_chars_raw(CharWin * win, char x, char y, char * chars, char num);
// Raw (screen code) variants.

void cwin_read_string(CharWin * win, char * buffer);
// Read the entire window content into a buffer as a string.

void cwin_write_string(CharWin * win, const char * buffer);
// Write buffer to the entire window.
```

### Rectangle operations

```c
void cwin_put_rect(CharWin * win, char x, char y, char w, char h, const char * chars, char color);
// Write a w×h rectangle of PETSCII characters starting at x,y.

void cwin_get_rect(CharWin * win, char x, char y, char w, char h, char * chars);
// Read a w×h rectangle of characters from x,y.

// raw variants:
void cwin_put_rect_raw(CharWin * win, char x, char y, char w, char h, const char * chars, char color);
void cwin_get_rect_raw(CharWin * win, char x, char y, char w, char h, char * chars);
```

### Insertion and deletion

```c
void cwin_insert_char(CharWin * win, char ch, char color);
// Insert character at cursor, shifting remaining chars right.

void cwin_delete_char(CharWin * win);
// Delete character at cursor, shifting remaining chars left.
```

### Keyboard input (blocking)

```c
int cwin_getch(void);
// Wait for a keypress, return PETSCII code. -1 on error.

int cwin_checkch(void);
// Non-blocking: return keypress if available, -1 if none.
```

### Full-window editing

```c
bool cwin_edit_char(CharWin * win, char ch);
// Process one character for editing. Returns true if editing continues.

char cwin_edit(CharWin * win);
// Full interactive edit loop — blocks until user presses RETURN or STOP.
// Returns the key that terminated editing.
```

### Scrolling

```c
void cwin_scroll_left(CharWin * win, char by);   // Scroll window contents left by `by` columns
void cwin_scroll_right(CharWin * win, char by);
void cwin_scroll_up(CharWin * win, char by);     // Scroll up by `by` rows (content moves up)
void cwin_scroll_down(CharWin * win, char by);
```

### Rectangle fill

```c
void cwin_fill_rect(CharWin * win, char x, char y, char w, char h, char ch, char color);
void cwin_fill_rect_raw(CharWin * win, char x, char y, char w, char h, char ch, char color);
// Fill a sub-rectangle of the window with ch/color.
```

### Console mode functions (terminal-like output)

These treat the window as a scrolling console output area:

```c
void cwin_console_write_char(CharWin * win, char ch, char color);
void cwin_console_write_string(CharWin * win, const char * chars, char color);
void cwin_console_newline(CharWin * win);
void cwin_console_scroll_up(CharWin * win);  // Scroll up and clear bottom line
void cwin_console_clear(CharWin * win);

// printf into window:
void cwin_console_printf(CharWin * win, char color, const char * fmt, ...);

// Full-line string input into window:
char cwin_console_edit_string(CharWin * win, char color);
// Returns RETURN or STOP key code.

void cwin_console_get_string(CharWin * win, char * chars, char size);
// Read current line content from window into chars (null-terminated).
```

---

## `c64/sprites.h` — Hardware and Virtual Sprites

The C64 has 8 hardware sprites. This library offers a simple hardware sprite API and an optional 16-sprite virtual sprite multiplexer.

### Hardware sprites (8 sprites, indices 0–7)

```c
void spr_init(char * screen);
// Initialize the sprite system. screen = pointer to screen RAM.
// Sets up pointer bytes at end of screen RAM (offsets 2040–2047).

void spr_set(char sp, bool show, int xpos, int ypos, char image, char color, bool multi, bool xexpand, bool yexpand);
// Configure a complete sprite in one call.
// sp: sprite number 0–7
// show: true to enable, false to hide
// xpos: X position 0–511 (9-bit), ypos: Y position 0–255
// image: sprite image number (index into 64-byte sprite data blocks)
// color: VICColors value 0–15
// multi: true for multicolor mode
// xexpand/yexpand: true to double size in X/Y

void spr_show(char sp, bool show);
// Show or hide sprite sp (modifies spr_enable bitmask).

void spr_move(char sp, int xpos, int ypos);
// Move sprite to position. Handles 9th X bit in spr_msbx.

int spr_posx(char sp);   // Get sprite X position (9-bit int)
int spr_posy(char sp);   // Get sprite Y position

void spr_move16(char sp, int xpos, int ypos);
// Like spr_move but uses 16-bit coords; sprites offscreen (y<0 or too large)
// are moved to y=0 (hidden above visible area).

void spr_image(char sp, char image);
// Change sprite image number. The image number is used as an offset into
// the sprite data area (each sprite is 64 bytes).

void spr_color(char sp, char color);
// Change sprite color (0–15).

void spr_expand(char sp, bool xexpand, bool yexpand);
// Change sprite expansion in X and/or Y.
```

### Virtual sprite multiplexer (16 sprites, indices 0–15)

The virtual sprite system multiplexes 16 logical sprites onto the 8 hardware sprites by updating hardware sprite positions mid-screen using raster IRQs (slots 0–8 in the raster IRQ system).

**Frame rhythm (must be called every frame):**

```c
// In your game loop:
vspr_sort();        // Sort virtual sprites by Y position (before rirq_sort)
// ... other game logic ...
rirq_wait();        // Wait for last raster IRQ to finish
vspr_update();      // Update HW sprite registers for next frame
rirq_sort();        // Resort raster IRQ list if positions changed
```

```c
void vspr_init(char * screen);
// Initialize virtual sprite system. screen = screen RAM pointer.
// Installs raster IRQs for mid-screen sprite switching.

void vspr_shutdown(void);
// Disable the virtual sprite system and free raster IRQ slots.

void vspr_screen(char * screen);
// Change the screen RAM pointer (if you switch screens).

void vspr_set(char sp, int xpos, int ypos, char image, char color);
// Set virtual sprite sp (0–VSPRITES_MAX-1) with full parameters.

void vspr_move(char sp, int xpos, int ypos);
// Move virtual sprite sp to new position.

void vspr_movex(char sp, int xpos);
void vspr_movey(char sp, int ypos);
// Move in only one axis.

void vspr_image(char sp, char image);    // Change image
void vspr_color(char sp, char color);    // Change color

void vspr_hide(char sp);
// Move sprite to y=255 (below visible area, effectively hidden).

void vspr_sort(void);
// Sort virtual sprites by Y position. Call once near bottom of game loop,
// before waiting for raster IRQ.

void vspr_update(void);
// Copy sorted sprite data to hardware registers. Call after rirq_wait().
```

### VSPRITES_MAX

```c
#ifndef VSPRITES_MAX
#define VSPRITES_MAX  16
#endif
// Override before including sprites.h to change max virtual sprites (8–16).
```

---

## `c64/rasterirq.h` — Raster Interrupt System

The raster IRQ system fires interrupts at specific raster lines to change hardware registers mid-frame (for color-bar effects, sprite multiplexing, split screens, etc.). Up to 16 slots (default `NUM_IRQS=16`).

### Core workflow

```c
// 1. Initialize (once)
rirq_init(true);          // true = use kernal IRQ vector

// 2. Build an IRQ operation
RIRQCode myirq;
rirq_build(&myirq, 2);    // 2 = number of write operations
rirq_write(&myirq, 0, &vic.color_border, VCOL_RED);   // op 0: set border
rirq_write(&myirq, 1, &vic.color_back,   VCOL_BLACK); // op 1: set background

// 3. Place it at raster line
rirq_set(0, 100, &myirq); // slot 0, fires at line 100+1

// 4. Sort and start
rirq_sort();
rirq_start();

// 5. Each frame: if you move IRQs, call rirq_sort() again
```

### RIRQCode structures

```c
typedef struct RIRQCode {
    byte size;
    byte code[RIRQ_SIZE]; // Inline 6502 machine code
} RIRQCode;

// Larger variants for more operations per IRQ:
typedef struct RIRQCode10  { RIRQCode c; byte code[...]; } RIRQCode10;  // 10 ops
typedef struct RIRQCode20  { RIRQCode c; byte code[...]; } RIRQCode20;  // 20 ops
```

### Building IRQ operations

```c
void rirq_build(RIRQCode * ic, byte size);
// Initialize an IRQ code block for `size` write operations (up to 5).
// size = number of memory writes this IRQ will perform (not counting wait).

RIRQCode * rirq_alloc(byte size);
// Allocate and initialize an RIRQCode on the heap. Convenience wrapper.

void rirq_write(RIRQCode * ic, byte n, void * addr, byte data);
// Set operation n: write byte `data` to memory address `addr`.
// n is 0-based. Called during setup.

void rirq_call(RIRQCode * ic, byte n, void * addr);
// Set operation n: call function at `addr` (JSR).

void rirq_addr(RIRQCode * ic, byte n, void * addr);
// Change the address of write operation n (for dynamic retargeting).

void rirq_addrhi(RIRQCode * ic, byte n, byte hi);
// Change only the high byte of the address (faster than rirq_addr).

void rirq_data(RIRQCode * ic, byte n, byte data);
// Change the data byte of write operation n (to update value at runtime).

void rirq_delay(RIRQCode * ic, byte cycles);
// Add a delay of 5*cycles clock cycles before this IRQ executes its writes.
// Used for cycle-exact horizontal timing.
```

### Managing slots

```c
void rirq_set(byte n, byte row, RIRQCode * write);
// Assign IRQ code to slot n, firing at raster line `row`+1.
// n = slot 0–(NUM_IRQS-1)
// row = raster line (0–312 PAL, 0–263 NTSC)

void rirq_clear(byte n);
// Remove IRQ from slot n (disables that slot).

void rirq_move(byte n, byte row);
// Change the vertical position of an existing slot.
// Requires rirq_sort() to take effect.
```

### Initialization variants

```c
void rirq_init(bool kernalIRQ);
// true  = use kernal IRQ (safe default, kernal stays active)
// false = use hardware IRQ (kernal not called — faster but no KERNAL during IRQ)

void rirq_init_kernal(void);       // Kernal IRQ, I/O always enabled
void rirq_init_kernal_noio(void);  // Kernal IRQ, I/O not always enabled
void rirq_init_crt(void);          // CRT (ROM/RAM vector), I/O enabled
void rirq_init_crt_noio(void);     // CRT, I/O disabled when possible
void rirq_init_io(void);           // RAM vector only, I/O enabled, ROM off
void rirq_init_memmap(void);       // RAM vector, ROM off, I/O optional
```

### Running and synchronization

```c
void rirq_start(void);
// Activate the raster IRQ system. IRQs begin firing.

void rirq_stop(void);
// Deactivate all raster IRQs.

void rirq_sort(bool inirq = false);
// Re-sort the raster IRQ list by row number. Must be called after any
// rirq_move() or rirq_set()/rirq_clear() for changes to take effect.
// inirq=true if calling from inside an interrupt handler (uses different locking).

void rirq_wait_done(void);
// Block until the last scheduled IRQ code has finished executing.
// Call before rirq_sort() to avoid race conditions.

void rirq_wait(void);
// Wait for the end of active IRQ frame processing (for frame boundary sync).

extern volatile byte rirq_count;
// Incremented each time the full raster IRQ chain completes. Use to
// count frames or detect if a frame was missed.
```

---

## `c64/keyboard.h` — Keyboard Scanning

Low-level keyboard matrix polling. Does not use kernal keyboard routines.

### Polling

```c
void keyb_poll(void);
// Poll the keyboard matrix. Call once per game loop frame.
// Updates keyb_matrix[] and keyb_key.

extern byte keyb_matrix[8];
// Raw keyboard matrix state (8 rows × 8 columns bitmask).
// 0 = key pressed, 1 = not pressed (active low).

extern KeyScanCode keyb_key;
// Current key scan code. Bit 7 (KSCAN_QUAL_DOWN) set = key is pressed.
// Value 0 = no key.

extern const char keyb_codes[128];
// Mapping from scan code to PETSCII character code.
// First 64 entries: unshifted; next 64: shifted.
```

### Key state query

```c
bool key_pressed(KeyScanCode code);
// Returns true if the given scan code key is currently held down.
// Example: if (key_pressed(KSCAN_SPACE)) { ... }

bool key_shift(void);
// Returns true if either SHIFT key is currently pressed.
```

### Key constants

```c
// Cursor keys (PETSCII codes for use with cwin / getche etc.)
KEY_CSR_DOWN   = 17
KEY_CSR_RIGHT  = 29
KEY_CSR_UP     = 17 + 128   // (145)
KEY_CSR_LEFT   = 29 + 128   // (157)
KEY_DEL        = 20
KEY_INST       = 148
KEY_RETURN     = 13
KEY_HOME       = 19
KEY_CLR        = 147
KEY_ESC        = 27
KEY_F1         = 133  ... KEY_F8 = 140

// Scan code qualifier flags:
KSCAN_QUAL_SHIFT = 0x40   // Shifted key variant
KSCAN_QUAL_MASK  = 0x7f   // Mask to get base key (remove down flag)
KSCAN_QUAL_DOWN  = 0x80   // Bit indicating key is pressed
```

### Scan code enum (partial list)

```c
enum KeyScanCode {
    KSCAN_DEL, KSCAN_RETURN, KSCAN_CSR_RIGHT, KSCAN_F7,
    KSCAN_F1, KSCAN_F3, KSCAN_F5, KSCAN_CSR_DOWN,
    // letters A-Z: KSCAN_A through KSCAN_Z
    // digits 0-9: KSCAN_0 through KSCAN_9
    KSCAN_SPACE, KSCAN_COMMODORE, KSCAN_Q, KSCAN_STOP,
    KSCAN_LSHIFT (implied), KSCAN_RSHIFT,
    KSCAN_CONTROL, KSCAN_ARROW_LEFT, KSCAN_ARROW_UP,
    KSCAN_PLUS, KSCAN_MINUS, KSCAN_AT, KSCAN_COLON,
    KSCAN_SEMICOLON, KSCAN_COMMA, KSCAN_DOT, KSCAN_SLASH,
    KSCAN_STAR, KSCAN_POUND, KSCAN_EQUAL, KSCAN_HOME,
    ...
};
```

---

## `c64/joystick.h` — Joystick Input

```c
extern sbyte  joyx[2], joyy[2];
// Joystick X and Y direction after polling.
// -1 = left/up, 0 = center, +1 = right/down.

extern bool   joyb[2];
// Joystick fire button state after polling.
// true = button pressed.

void joy_poll(char n);
// Poll joystick port n (0 or 1) and update joyx[n], joyy[n], joyb[n].
// Call once per frame.
// Example:
//   joy_poll(0);
//   if (joyx[0] > 0) move_right();
//   if (joyb[0]) fire();
```

**Note:** Joystick 1 is in CIA1 port B (controller port 2 on machine), joystick 0 is in CIA1 port A (controller port 1).

---

## `c64/mouse.h` — Mouse/Paddle Input

Supports 1351-compatible proportional mouse via SID potentiometers.

```c
extern sbyte  mouse_dx, mouse_dy;
// Relative mouse movement since last poll.
// Signed: negative = left/up, positive = right/down.

extern bool   mouse_lb, mouse_rb;
// Left and right button state after polling.

void mouse_init(void);
// Initialize the mouse subsystem. Call once.

void mouse_arm(char n);
// Arm the potentiometer input for mouse port n (0 or 1).
// Need to wait ~4ms for potentiometer to stabilize before calling mouse_poll().

void mouse_poll(void);
// Poll mouse. Updates mouse_dx, mouse_dy, mouse_lb, mouse_rb.
// Call mouse_arm() first if not already armed.
```

---

## `c64/kernalio.h` — KERNAL File I/O

Direct use of KERNAL routines for serial disk I/O (slower than flossiec but compatible with all drives).

### Error codes

```c
enum krnioerr {
    KRNIO_OK       = 0x00,
    KRNIO_DIR      = 0x01,  // Reading a directory
    KRNIO_TIMEOUT  = 0x02,  // Device timeout
    KRNIO_SHORT    = 0x04,  // Short block read
    KRNIO_LONG     = 0x08,  // Long block read
    KRNIO_VERIFY   = 0x10,  // Verify error
    KRNIO_CHKSUM   = 0x20,  // Checksum error
    KRNIO_EOF      = 0x40,  // End of file reached
    KRNIO_NODEVICE = 0x80   // No device found
};

extern krnioerr krnio_pstatus[16];
// Per-file-number status array. Check krnio_pstatus[fnum] after operations.
```

### Opening and closing files

```c
void krnio_setnam(const char * name);
// Set filename for next krnio_open(). The string must remain valid until after open.
// C64 uses comma-separated syntax: "FILENAME,TYPE,MODE"
// Types: P=program, S=sequential, R=relative, U=user
// Modes: R=read, W=write, A=append

void krnio_setnam_n(const char * name, char len);
// Like krnio_setnam but with explicit length (for filenames with spaces etc.)

bool krnio_open(char fnum, char device, char channel);
// Open file number fnum (1–15) on device `device` (8=drive 1, 9=drive 2, etc.)
// using secondary channel `channel` (2–14 for files, 0=load, 1=save, 15=command).
// Returns true on success.
// Example: krnio_setnam("DATA,S,R"); krnio_open(2, 8, 2);

void krnio_close(char fnum);
// Close file number fnum.

krnioerr krnio_status(void);
// Return status of last I/O operation.
```

### Stream I/O (channel-based)

```c
bool krnio_chkout(char fnum);
// Select file fnum as the current output stream.

bool krnio_chkin(char fnum);
// Select file fnum as the current input stream.

void krnio_clrchn(void);
// Reset input and output streams to default (keyboard/screen).

bool krnio_chrout(char ch);
// Write one byte to the currently selected output channel.
// Returns false on error.

char krnio_chrin(void);
// Read one byte from the currently selected input channel.
```

### File I/O (by file number)

```c
int krnio_getch(char fnum);
// Read one byte from file fnum. Returns byte value (0–255).
// If last byte: bit 8 (0x0100) is set — check with (result & 0x0100).
// Returns negative on error.

int krnio_putch(char fnum, char ch);
// Write one byte to file fnum. Returns negative on error.

int krnio_write(char fnum, const char * data, int num);
// Write num bytes to file fnum. Returns bytes written, negative on error.

int krnio_puts(char fnum, const char * data);
// Write null-terminated string to file fnum.

int krnio_read(char fnum, char * data, int num);
// Read up to num bytes from file fnum. Returns bytes read, negative on error.

int krnio_gets(char fnum, char * data, int num);
// Read a line (terminated by CR/LF) into data, appends null byte.
// Returns length read, negative on error.

int krnio_read_lzo(char fnum, char * data);
// Read and simultaneously LZO-decompress from file fnum into data.

bool krnio_load(char fnum, char device, char channel);
// Load a file using kernal LOAD. fnum/device/channel as in krnio_open.

bool krnio_save(char device, const char* start, const char* end);
// Save memory range [start, end) to device using kernal SAVE.
```

---

## `c64/iecbus.h` — Raw IEC Bus Access

Low-level direct IEC serial bus control (bypass KERNAL). Used for custom protocols or when KERNAL is not available.

```c
extern IEC_STATUS iec_status;
// Status of last IEC operation:
//   IEC_OK = 0x00  — success
//   IEC_EOF = 0x01 — end of file
//   IEC_QUEUED = 0x02 — data queued
//   IEC_ERROR = 0x80  — general error
//   IEC_TIMEOUT     — device did not respond
//   IEC_DATA_CHECK  — data verification error

bool iec_write(char b);                  // Write one byte to the bus
char iec_read(void);                     // Read one byte from the bus

void iec_atn(char dev, char sec);        // Assert ATN, address device+channel
void iec_talk(char dev, char sec);       // Put device in TALK mode
void iec_untalk(void);                   // Release TALK
void iec_listen(char dev, char sec);     // Put device in LISTEN mode
void iec_unlisten(void);                 // Release LISTEN

void iec_open(char dev, char sec, const char * fname);  // Open file on device
void iec_close(char dev, char sec);                     // Close file on device

int iec_write_bytes(const char * data, int num);  // Write block of bytes
int iec_read_bytes(char * data, int num);         // Read block of bytes
```

---

## `c64/flossiec.h` — Fast Loader (FLOSS IEC)

A software fast-loader for disk loading. Significantly faster than the KERNAL serial routines. Two modes: with or without KERNAL.

### Without KERNAL (direct, fastest)

```c
bool flossiec_init(char drive);
// Install fast loader on the drive (drive = 8, 9, etc.). Sends loader code to drive.
// Returns true on success. Must be called before using flossiec_open etc.

void flossiec_shutdown(void);
// Remove the fast loader from drive.

bool flossiec_open(char track, char sector);
// Open a file by track and sector. You must know the exact start block.
// The entire file must be read before closing.

void flossiec_close(void);
// Close the file.
```

### With KERNAL (easier, slightly slower)

```c
bool flosskio_init(char drive);
bool flosskio_open(char track, char sector);
void flosskio_close(void);
void flosskio_shutdown(void);
```

### Directory mapping

```c
struct floss_blk {
    char track, sector;  // File start position on disk
};

bool flosskio_mapdir(const char * fnames, floss_blk * blks);
bool flossiec_mapdir(const char * fnames, floss_blk * blks);
// Map comma-separated list of filenames to their start T/S positions.
// fnames: "FILE1,FILE2,FILE3"
// blks: array of floss_blk[n] where n = number of filenames.
// Returns true on success. Then use blks[i].track/sector with flossiec_open.
```

### Reading data

```c
bool flossiec_eof(void);
// Returns true when end of file is reached (inline, fast check).

char flossiec_get(void);
// Read one byte. Must check flossiec_eof() before each call.

char flossiec_get_lzo(void);
// Read one byte from an LZO-compressed file. Decompresses on the fly.

char * flossiec_read(char * dp, unsigned size);
// Read up to size bytes into dp. Returns pointer past last written byte.

char * flossiec_read_lzo(char * dp, unsigned size);
// Read and LZO-decompress up to size bytes into dp.
```

---

## `c64/asm6502.h` — Runtime 6502 Code Generation

Allows generating 6502 machine code at runtime into a memory buffer. Useful for self-modifying code or JIT-like techniques.

```c
// Each function emits one instruction into buffer ip and returns byte count.

byte asm_np(byte * ip, AsmIns ins);     // Implied (e.g. ASM_NOP, ASM_RTS, ASM_SEI)
byte asm_ac(byte * ip, AsmIns ins);     // Accumulator (e.g. ASM_ASL for ASL A)
byte asm_zp(byte * ip, AsmIns ins, byte addr);    // Zero page
byte asm_rl(byte * ip, AsmIns ins, sbyte addr);   // Relative branch (signed offset)
byte asm_abs(byte * ip, AsmIns ins, word addr);   // Absolute address
// ... and more addressing modes
```

Key `AsmIns` values (same as 6502 base opcodes):
```c
ASM_LDA, ASM_STA, ASM_LDX, ASM_STX, ASM_LDY, ASM_STY
ASM_ADC, ASM_SBC, ASM_AND, ASM_ORA, ASM_EOR
ASM_JMP (= 0x40 in enum), ASM_JSR (= 0x2c), ASM_RTS (= 0x60), ASM_RTI (= 0x40)
ASM_SEI (= 0x78), ASM_CLI (= 0x58)
ASM_NOP (= 0xea), ASM_BRK (= 0x00)
ASM_BEQ, ASM_BNE, ASM_BCC, ASM_BCS, ASM_BMI, ASM_BPL, ASM_BVC, ASM_BVS
```

---

*Continued in Part 4: Graphics (Bitmap, Multicolor, Font, Vector3D), Audio (SID FX), Ultimate 64 Library*
