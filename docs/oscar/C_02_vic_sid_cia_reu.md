# Oscar64 C Compiler — LLM Programming Guide (Part 2/4)
## VIC-II, SID, CIA, REU, and Memory Map

---

## `c64/vic.h` — VIC-II Video Chip

The VIC-II (`vic`) is the C64's video chip at `$D000`. Access it directly via the `vic` macro.

### Direct register access

```c
#define vic  (*((struct VIC *)0xd000))
```

Key registers in `struct VIC`:
```c
struct VIC {
    struct { byte x, y; } spr_pos[8];  // Sprite positions (X:1 byte, Y:1 byte)
    byte spr_msbx;     // MSB (bit 8) of X position for each sprite (bitmask)
    byte ctrl1;        // Control 1: DEN, BMM, ECM, RST8, RSEL (scroll Y)
    byte raster;       // Current raster line (low 8 bits); RST8 is bit 8
    byte lpx, lpy;     // Light pen X/Y
    byte spr_enable;   // Sprite enable bitmask (bit n = sprite n)
    byte ctrl2;        // Control 2: MCM, CSEL (scroll X)
    byte spr_expand_y; // Sprite vertical double-height (bitmask)
    byte memptr;       // Memory pointers for screen/charset
    byte intr_ctrl;    // Interrupt status (write 1 to acknowledge)
    byte intr_enable;  // Interrupt enable mask
    byte spr_priority; // 0=sprite in front, 1=sprite behind background (bitmask)
    byte spr_multi;    // Sprite multicolor mode (bitmask)
    byte spr_expand_x; // Sprite horizontal double-width (bitmask)
    byte spr_sprcol;   // Sprite-sprite collision flags (read only, cleared on read)
    byte spr_backcol;  // Sprite-background collision flags (read only)
    byte color_border; // Border color (0–15)
    byte color_back;   // Background color 0
    byte color_back1;  // Background color 1 (ECM/MCM text)
    byte color_back2;  // Background color 2
    byte color_back3;  // Background color 3 (ECM only)
    byte spr_mcolor0;  // Sprite multicolor 0 (shared by all sprites)
    byte spr_mcolor1;  // Sprite multicolor 1 (shared by all sprites)
    byte spr_color[8]; // Individual sprite colors (0–15 each)
};
```

### ctrl1 flag constants

```c
VIC_CTRL1_RSEL  = 0x08  // Row select: 1=25 rows, 0=24 rows
VIC_CTRL1_DEN   = 0x10  // Display ENable: 1=on, 0=off (blanks video)
VIC_CTRL1_BMM   = 0x20  // Bitmap Mode: 1=hires bitmap, 0=text
VIC_CTRL1_ECM   = 0x40  // Extended Color Mode
VIC_CTRL1_RST8  = 0x80  // Raster compare bit 8 (for raster IRQ line ≥ 256)
```

### ctrl2 flag constants

```c
VIC_CTRL2_CSEL  = 0x08  // Column select: 1=40 cols, 0=38 cols
VIC_CTRL2_MCM   = 0x10  // Multicolor mode (for text)
VIC_CTRL2_RES   = 0x20  // Reserved, keep 1
```

### Interrupt constants

```c
VIC_INTR_RST   = 0x01  // Raster interrupt
VIC_INTR_MBC   = 0x02  // Sprite-background collision
VIC_INTR_MMC   = 0x04  // Sprite-sprite collision
VIC_INTR_ILP   = 0x08  // Light pen
VIC_INTR_IRQ   = 0x80  // Any interrupt occurred (read to check, write to ack all)
```

### VIC display mode setup

```c
enum VicMode {
    VICM_TEXT,       // Standard text mode (40×25 characters)
    VICM_TEXT_MC,    // Multicolor text mode
    VICM_TEXT_ECM,   // Extended color (background) text mode
    VICM_HIRES,      // Hires bitmap 320×200 2-color
    VICM_HIRES_MC    // Multicolor bitmap 160×200 4-color
};

void vic_setmode(VicMode mode, const char * text, const char * font);
// Set video mode and memory locations.
// For VICM_TEXT:    text = screen RAM address, font = charset address
// For VICM_HIRES:   text = color RAM address,  font = bitmap address
// Also sets the VIC bank appropriately.
// Example: vic_setmode(VICM_TEXT, (char*)0x0400, (char*)0x1000);
// Example: vic_setmode(VICM_HIRES, Color, Hires);

void vic_setbank(char bank);
// Set the 16KB VIC bank (0–3):
//   0 = $0000–$3FFF, 1 = $4000–$7FFF
//   2 = $8000–$BFFF, 3 = $C000–$FFFF
// vic_setmode() calls this automatically.
```

### Sprite position helpers

```c
void vic_sprxy(byte s, int x, int y);
// Set sprite s (0-7) to position x (0-511), y (0-255).
// Automatically handles the 9th bit of X in spr_msbx.

int vic_sprgetx(byte s);
// Read sprite s X position as full 9-bit value (0–511).
```

### Raster line waiting (frame synchronization)

```c
void vic_waitBottom(void);
// Block until raster beam reaches bottom of visible area (line ~251).
// Use to synchronize code to the frame.

void vic_waitTop(void);
// Block until raster beam is at top of frame.

void vic_waitFrame(void);
// Wait for top of frame, then wait for bottom. Use for double-buffering.

bool vic_isBottom(void);
// Returns true if raster beam is below the visible area (non-blocking).

void vic_waitFrames(char n);
// Wait for n complete frames (n * ~50ms on PAL, ~60ms on NTSC).

void vic_waitLine(int line);
// Block until raster reaches exactly the given line number.

void vic_waitBelow(int line);
// Block until raster passes below the given line.

void vic_waitRange(char below, char above);
// Block until raster is between below and above (wraps around frame end).
```

### Typical usage: hires bitmap

```c
#include <c64/vic.h>
#include <c64/memmap.h>
#include <gfx/bitmap.h>
#include <string.h>

#define Color  ((char *)0xd800)
#define Hires  ((char *)0xe000)

void init(void) {
    mmap_trampoline();
    mmap_set(MMAP_RAM);       // Turn off ROM so we can use $E000 as bitmap
    memset(Color, 0x01, 1000);
    memset(Hires, 0x00, 8000);
    mmap_set(MMAP_NO_ROM);
    vic_setmode(VICM_HIRES, Color, Hires);
    vic.color_border = VCOL_WHITE;
}
```

---

## `c64/sid.h` — SID Sound Chip

The SID chip at `$D400` has 3 voices, each with oscillator, envelope, and PWM.

```c
#define sid  (*((struct SID *)0xd400))
```

### SID struct

```c
struct SID {
    struct Voice {
        unsigned freq;   // Frequency (use NOTE_* macros or SID_FREQ_PAL())
        unsigned pwm;    // Pulse width (0–4095 in upper 12 bits)
        byte ctrl;       // Control: GATE, SYNC, RING, TEST, TRI, SAW, RECT, NOISE
        byte attdec;     // Attack (high nibble) | Decay (low nibble)
        byte susrel;     // Sustain (high nibble) | Release (low nibble)
    } voices[3];         // voices[0], voices[1], voices[2]

    unsigned ffreq;      // Filter cutoff frequency (low 3 bits in byte 0, high 8 in byte 1)
    byte resfilt;        // Resonance (high nibble) | Filter routing (low nibble)
    byte fmodevol;       // Filter mode (high nibble) | Master volume 0-15 (low nibble)

    byte potx, poty;     // Potentiometer (paddle) values (read only)
    byte random;         // Random number from voice 3 noise (read only)
    byte env3;           // Voice 3 envelope output (read only)
};
```

### Control register bits

```c
SID_CTRL_GATE  = 0x01   // Start note (1) / release (0) — toggle to play
SID_CTRL_SYNC  = 0x02   // Sync voice with voice-1's oscillator
SID_CTRL_RING  = 0x04   // Ring modulation with voice-1
SID_CTRL_TEST  = 0x08   // Reset oscillator (hold high to silence)
SID_CTRL_TRI   = 0x10   // Triangle waveform
SID_CTRL_SAW   = 0x20   // Sawtooth waveform
SID_CTRL_RECT  = 0x40   // Rectangular (pulse) waveform
SID_CTRL_NOISE = 0x80   // Noise waveform
```

### Envelope timing constants

Attack (SID_ATK_*): milliseconds to reach peak, Decay/Release (SID_DKY_*): ms to reach sustain/zero.

```c
// Attack (high nibble of attdec):
SID_ATK_2   = 0x00   // 2ms
SID_ATK_8   = 0x10   // 8ms
SID_ATK_16  = 0x20   // 16ms
SID_ATK_100 = 0x80   // 100ms
SID_ATK_250 = 0x90   // 250ms
SID_ATK_500 = 0xa0   // 500ms
SID_ATK_8000= 0xf0   // 8000ms

// Decay/Release (low nibble of attdec/susrel):
SID_DKY_6    = 0x00  // 6ms
SID_DKY_24   = 0x01  // 24ms
SID_DKY_300  = 0x08  // 300ms
SID_DKY_9000 = 0x0d  // 9000ms (9 seconds)
SID_DKY_24000= 0x0f  // 24 seconds
```

### Note frequency macros

```c
NOTE_C(octave)   // C note in the given octave
NOTE_CS(octave)  // C# note
NOTE_D(octave)   // D note
NOTE_DS(octave)  // D# note
NOTE_E(octave)   // E note
NOTE_F(octave)   // F note
NOTE_FS(octave)  // F# note
NOTE_G(octave)   // G note
NOTE_GS(octave)  // G# note
NOTE_A(octave)   // A note (440 Hz = octave 4 on PAL approximately NOTE_A(4))
NOTE_AS(octave)  // A# note
NOTE_B(octave)   // B note
// Octave range: 0–9. NOTE_A(4) ≈ 440 Hz for PAL.
// These are SID frequency register values pre-calculated for PAL.
```

### Frequency calculation

```c
#define SID_FREQ_PAL(f)   ((unsigned)(((unsigned long)(f) * SID_CLKSCALE_PAL)  >> 16))
#define SID_FREQ_NTSC(f)  ((unsigned)(((unsigned long)(f) * SID_CLKSCALE_NTSC) >> 16))
// Convert Hz to SID frequency register value.
// Example: sid.voices[0].freq = SID_FREQ_PAL(440);  // 440 Hz = A4
```

### Filter mode bits

```c
SID_FILTER_1  = 0x01   // Route voice 1 through filter
SID_FILTER_2  = 0x02   // Route voice 2 through filter
SID_FILTER_3  = 0x04   // Route voice 3 through filter
SID_FILTER_X  = 0x08   // Route external input through filter

SID_FMODE_LP  = 0x10   // Low-pass filter
SID_FMODE_BP  = 0x20   // Band-pass filter
SID_FMODE_HP  = 0x40   // High-pass filter
SID_FMODE_3_OFF= 0x80  // Disconnect voice 3 from output (useful with ring/sync)
```

### Typical usage: play a note

```c
#include <c64/sid.h>

void play_note(void) {
    // Initialize SID volume and clear filter
    sid.fmodevol = 15;            // max volume, no filter

    // Set voice 0 to triangle wave, middle C
    sid.voices[0].freq   = NOTE_C(4);
    sid.voices[0].pwm    = 0;
    sid.voices[0].attdec = SID_ATK_8   | SID_DKY_24;  // fast attack, fast decay
    sid.voices[0].susrel = 0x80        | SID_DKY_300;  // half sustain, 300ms release
    sid.voices[0].ctrl   = SID_CTRL_TRI | SID_CTRL_GATE; // start note

    // ... later, to release the note:
    sid.voices[0].ctrl   = SID_CTRL_TRI; // clear GATE bit → release
}
```

---

## `c64/cia.h` — CIA Timer/I/O Chips

Two CIA chips: `cia1` at `$DC00` (keyboard, joystick), `cia2` at `$DD00` (IEC bus, VIC bank).

```c
#define cia1  (*((struct CIA *)0xdc00))
#define cia2  (*((struct CIA *)0xdd00))

struct CIA {
    byte pra, prb;      // Port A/B data registers (read/write)
    byte ddra, ddrb;    // Data direction for port A/B (1=output, 0=input)
    word ta, tb;        // Timer A/B current value (read) / latch (write)
    byte todt, tods, todm, todh; // Time-of-Day: 1/10s, secs, mins, hours (BCD)
    byte sdr;           // Serial data register
    byte icr;           // Interrupt control register
    byte cra, crb;      // Control register A/B (start/stop timers, etc.)
};

void cia_init(void);
// Initialize CIA chips to default values. Call once at program start.
// Restores keyboard scanning, removes any IRQ side-effects.

extern byte ciaa_pra_def;
// The default value of CIA1 port A (used for keyboard scanning state).
```

**CIA1 usage notes:**
- `cia1.pra` / `cia1.prb` with appropriate directions: keyboard matrix scanning and joystick reading (handled automatically by `keyboard.h` and `joystick.h`).

---

## `c64/memmap.h` — Memory Map Control

The C64's ROM can be paged out to expose underlying RAM. This is required to use areas like `$A000–$BFFF` (BASIC ROM), `$E000–$FFFF` (KERNAL ROM), or `$D000–$DFFF` (character ROM / I/O).

### Memory map constants

```c
MMAP_ROM       = 0x37  // Default: BASIC + I/O + KERNAL (power-on state)
MMAP_NO_BASIC  = 0x36  // I/O + KERNAL (extra RAM at $A000-$BFFF)
MMAP_NO_ROM    = 0x35  // I/O only (I/O at $D000, rest RAM)
MMAP_RAM       = 0x30  // ALL RAM (even I/O area is RAM, you lose VIC/SID access!)
MMAP_CHAR_ROM  = 0x31  // Character ROM at $D000 (no I/O — used to copy charset)
MMAP_ALL_ROM   = 0x33  // All ROM: BASIC + CHAR + KERNAL (no I/O)
```

### Functions

```c
void mmap_trampoline(void);
// Install an IRQ/NMI trampoline in zero-page/low memory.
// REQUIRED if you use mmap_set() with ROM paged out AND raster IRQs.
// The trampoline routes interrupts correctly even when KERNAL ROM is off.
// Call once at startup before changing the memory map.

char mmap_set(char pla);
// Change the memory map configuration. Returns previous state.
// Use the MMAP_* constants above.
// IMPORTANT: After calling mmap_set(MMAP_RAM) you cannot call KERNAL routines.
// Example:
//   mmap_trampoline();
//   mmap_set(MMAP_RAM);  // now $E000-$FFFF is RAM (can store bitmap there)
//   // ... do stuff with that memory ...
//   mmap_set(MMAP_ROM);  // restore to normal
```

### Pattern: using $E000–$FFFF as bitmap memory

```c
mmap_trampoline();
mmap_set(MMAP_RAM);             // page out KERNAL
memset((char*)0xe000, 0, 8000); // zero the hires bitmap area
mmap_set(MMAP_NO_ROM);          // page in I/O (VIC/SID) but not KERNAL
vic_setmode(VICM_HIRES, (char*)0xd000, (char*)0xe000);
// Now the VIC uses $E000 as bitmap data
```

---

## `c64/reu.h` — RAM Expansion Unit (REU)

The REU is an optional expansion (1541 Ultimate, CMD RAMLink, etc.) providing up to 16 MB of fast DMA-accessible RAM. DMA transfers happen without CPU intervention.

```c
#define reu  (*((struct REU *)0xdf00))
```

### REU struct (memory-mapped registers)

```c
struct REU {
    byte status;  // Status: IRQ(7), EOB(6), FAULT(5), SIZE(4), VERSION(3:0)
    byte cmd;     // Command register
    word laddr;   // C64 local address
    word raddr;   // REU bank-relative address  
    byte rbank;   // REU bank (0–255, each bank = 64KB)
    word length;  // Transfer length in bytes
    byte irqmask; // IRQ enable mask
    byte ctrl;    // Address increment control
};
```

### REU transfer functions

```c
void reu_store(unsigned long raddr, const volatile char * sp, unsigned length);
// Copy `length` bytes from C64 address `sp` to REU address `raddr`.
// raddr is a 24-bit address: bank*65536 + offset.
// Example: reu_store(0x000000, screen, 1000); // save screen to REU bank 0

void reu_load(unsigned long raddr, volatile char * dp, unsigned length);
// Copy `length` bytes from REU address `raddr` to C64 address `dp`.
// Example: reu_load(0x000000, screen, 1000); // restore screen from REU

void reu_fill(unsigned long raddr, char c, unsigned length);
// Fill `length` bytes in REU starting at `raddr` with byte value `c`.

void reu_load2d(unsigned long raddr, volatile char * dp, char height, unsigned width, unsigned stride);
// Copy a 2D array region from REU to C64.
// height = number of rows, width = bytes per row to copy,
// stride = distance between rows in REU memory (can be wider than width for sub-images).
// Useful for sprites or tiles stored in REU with padding.

int reu_count_pages(void);
// Count 64KB pages available in the REU. Destructive test — do NOT use
// while important data is in the REU. Returns number of pages (e.g. 32 = 2MB).
```

### Status and command flags

```c
REU_STAT_IRQ    = 0x80  // IRQ triggered
REU_STAT_EOB    = 0x40  // End-of-block (transfer complete)
REU_STAT_FAULT  = 0x20  // Verify mismatch or error

REU_CMD_EXEC    = 0x80  // Execute transfer immediately (set this bit to go)
REU_CMD_STORE   = 0x00  // C64 → REU
REU_CMD_LOAD    = 0x01  // REU → C64
REU_CMD_SWAP    = 0x02  // Exchange C64 and REU contents
REU_CMD_VERIFY  = 0x03  // Compare C64 vs REU
```

---

*Continued in Part 3: Screen, Sprites, Raster IRQ, Keyboard, Joystick, IEC*
