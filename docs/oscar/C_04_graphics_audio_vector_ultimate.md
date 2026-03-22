# Oscar64 C Compiler — LLM Programming Guide (Part 4/4)
## Graphics Libraries, Audio FX, Vector Math, Ultimate 64, and Build Patterns

---

## `gfx/bitmap.h` — Hires Monochrome Bitmap Graphics

320×200 pixels, 2 colors per 8×8 cell (foreground/background). One bit per pixel.

### Data structures

```c
struct Bitmap {
    char *  data;    // Pointer to bitmap pixel data (320*200/8 = 8000 bytes)
    char *  rdata;   // Reserved; same as data usually
    char    cwidth;  // Width in character cells (= width/8, e.g. 40)
    char    cheight; // Height in character cells (= height/8, e.g. 25)
    unsigned width;  // Width in bytes per row (= cwidth, e.g. 40)
};

struct ClipRect {
    int left, top, right, bottom;  // Clipping rectangle in pixels (exclusive)
};
// Example: ClipRect cr = {0, 0, 320, 200};  // full screen
```

### Initialization

```c
void bm_init(Bitmap * bm, char * data, char cw, char ch);
// Initialize bitmap using existing memory.
// data = pointer to bitmap RAM, cw = width/8, ch = height/8.
// Example: bm_init(&Screen, (char*)0xe000, 40, 25);

void bm_alloc(Bitmap * bm, char cw, char ch);
// Allocate bitmap memory (via malloc) and initialize.

void bm_free(Bitmap * bm);
// Free malloc'd bitmap memory.

void bm_fill(const Bitmap * bm, char data);
// Fill entire bitmap with byte value. 0x00 = all black, 0xff = all white.
```

### Pixel operations

```c
void bm_set(const Bitmap * bm, int x, int y);   // Set pixel (x,y) to 1
void bm_clr(const Bitmap * bm, int x, int y);   // Clear pixel (x,y) to 0
bool bm_get(const Bitmap * bm, int x, int y);   // Return true if pixel set
void bm_put(const Bitmap * bm, int x, int y, bool c);  // Set pixel to c
// No bounds checking in these inline functions — caller must ensure x and y are valid.
unsigned bm_usqrt(unsigned n);  // Fast unsigned integer square root
```

### Line drawing

```c
void bmu_line(const Bitmap * bm, int x0, int y0, int x1, int y1, char pattern, LineOp op);
// Draw line from (x0,y0) to (x1,y1), unclipped. 
// pattern: 8-bit repeating pixel pattern (0xff = solid, 0xaa = dashed, 0x00 = erase)
// op: LINOP_SET (draw set bits), LINOP_OR, LINOP_AND, LINOP_XOR

void bm_line(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, char pattern, LineOp op);
// Clipped version.

enum LineOp { LINOP_SET, LINOP_OR, LINOP_AND, LINOP_XOR };
```

### Rectangle operations

```c
// Unclipped:
void bmu_rect_fill(const Bitmap * dbm, int dx, int dy, int w, int h);
// Fill w×h pixel rectangle at (dx,dy) with all 1s.

void bmu_rect_clear(const Bitmap * dbm, int dx, int dy, int w, int h);
// Clear w×h pixel rectangle (all 0s).

void bmu_rect_pattern(const Bitmap * dbm, int dx, int dy, int w, int h, const char * pattern);
// Fill w×h rectangle using 8-byte tiling pattern.

void bmu_rect_copy(const Bitmap * dbm, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h);
// Copy w×h rectangle from source bitmap at (sx,sy) to dest at (dx,dy).

// Clipped (same but with ClipRect * clip parameter):
void bm_rect_fill(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h);
void bm_rect_clear(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h);
void bm_rect_pattern(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h, const char * pattern);
void bm_rect_copy(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h);
```

### Polygon and shape filling

All fill functions use an 8-byte repeating tile pattern:

```c
void bm_circle_fill(const Bitmap * bm, const ClipRect * clip, int x, int y, char r, const char * pat);
// Fill circle centered at (x,y) radius r.

void bm_triangle_fill(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, int x2, int y2, const char * pat);
// Fill triangle with 3 vertex coordinates.

void bm_quad_fill(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, const char * pat);
// Fill quadrilateral with 4 vertices.

void bm_polygon_fill(const Bitmap * bm, const ClipRect * clip, int * x, int * y, char num, const char * pat);
// Fill convex polygon. x[] and y[] are coordinate arrays, num = vertex count.

void bm_polygon_nc_fill(const Bitmap * bm, const ClipRect * clip, int * x, int * y, char num, const char * pat);
// Fill arbitrary (non-convex) polygon. Maximum 16 vertices.

void bm_trapezoid_fill(const Bitmap * bm, const ClipRect * clip, long x0, long x1, long dx0, long dx1, int y0, int y1, const char * pat);
// Fill trapezoid. x0/x1 are 16.16 fixed-point top-left/right; dx0/dx1 are 16.16 per-row delta.
```

### Blitting

```c
enum BlitOp {
    BLTOP_SET,            // Copy: dst = src
    BLTOP_RESET,          // Reset: dst = 0 where src=1
    BLTOP_NOT,            // Not: dst = ~dst
    BLTOP_XOR,            // XOR: dst ^= src
    BLTOP_OR,             // OR: dst |= src
    BLTOP_AND,            // AND: dst &= src
    BLTOP_AND_NOT,        // AND NOT
    BLTOP_COPY,           // Same as SET
    BLTOP_NCOPY,          // Inverted copy: dst = ~src
    BLTOP_PATTERN,        // Tile with pattern
    BLTOP_PATTERN_AND_SRC // Pattern AND'd with source
};

void bmu_bitblit(const Bitmap * dbm, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h, const char * pattern, BlitOp op);
// Unclipped bit blit from sbm(sx,sy) to dbm(dx,dy) of size w×h.

void bm_bitblit(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h, const char * pattern, BlitOp op);
// Clipped version.
```

### Text rendering

```c
int bmu_text(const Bitmap * bm, char lx, const char * str, char len);
// Render text at current horizontal offset `lx`, returns new x offset.

int bmu_text_size(const char * str, char len);
// Calculate pixel width of text run `len` chars.

int bmu_put_chars(const Bitmap * bm, int x, int y, const char * str, char len, BlitOp op);
// Render len characters at (x,y) using the TinyFont (see tinyfont.h).

int bm_put_chars(const Bitmap * bm, const ClipRect * clip, int x, int y, const char * str, char len, BlitOp op);
// Clipped version.

int bm_put_string(const Bitmap * bm, const ClipRect * clip, int x, int y, const char * str, BlitOp op);
// Render null-terminated string at (x,y), clipped.
```

### Transformation

```c
int bm_transform(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h, const Bitmap * sbm, int sx, int sy, int dxx, int dxy, int dyx, int dyy);
// Linear transform of source rect to dest rect using 2×2 matrix [dxx dxy / dyx dyy].
// Matrix values are 8.8 fixed point. dxx=256,dyy=256 = identity (1:1 copy).
// Use for rotation/scaling of bitmap regions.
```

---

## `gfx/mcbitmap.h` — Multicolor Bitmap Graphics

160×200 pixels, 4 colors per 8×8 cell. 2 bits per pixel: colors 0–3.

Colors in multicolor mode:
- Color 0 = `vic.color_back` (background)
- Color 1 = upper nibble of color cell (source bitmap high bit)
- Color 2 = lower nibble of color cell (source bitmap low bits)
- Color 3 = `vic.color_back1` (shared)

### Pixel operations

```c
void bmmc_put(const Bitmap * bm, int x, int y, char c);
// Set pixel at (x,y) to color c (0–3). x is in multicolor pixels (0–159).

char bmmc_get(const Bitmap * bm, int x, int y);
// Get color index (0–3) at pixel (x,y).
```

### Lines

```c
void bmmcu_line(const Bitmap * bm, int x0, int y0, int x1, int y1, char color);
// Unclipped line from (x0,y0) to (x1,y1) in color index.

void bmmc_line(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, char color);
// Clipped version.

void bmmcu_circle(const Bitmap * bm, int x, int y, char r, char color);
void bmmc_circle(const Bitmap * bm, const ClipRect * clip, int x, int y, char r, char color);
// Circle outline.
```

### Rectangle operations

```c
// Unclipped:
void bmmcu_rect_fill(const Bitmap * dbm, int dx, int dy, int w, int h, char color);
void bmmcu_rect_pattern(const Bitmap * dbm, int dx, int dy, int w, int h, const char * pattern);
void bmmcu_rect_copy(const Bitmap * dbm, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h);

// Clipped:
void bmmc_rect_fill(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h, char color);
void bmmc_rect_pattern(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, int w, int h, const char * pattern);
void bmmc_rect_copy(const Bitmap * dbm, const ClipRect * clip, int dx, int dy, const Bitmap * sbm, int sx, int sy, int w, int h);
```

### Shape fills

```c
void bmmc_circle_fill(const Bitmap * bm, const ClipRect * clip, int x, int y, char r, const char * pat);
void bmmc_triangle_fill(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, int x2, int y2, const char * pat);
void bmmc_quad_fill(const Bitmap * bm, const ClipRect * clip, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, const char * pat);
void bmmc_polygon_fill(const Bitmap * bm, const ClipRect * clip, int * x, int * y, char num, const char * pat);
void bmmc_polygon_nc_fill(const Bitmap * bm, const ClipRect * clip, int * x, int * y, char num, const char * pat);
void bmmc_trapezoid_fill(const Bitmap * bm, const ClipRect * clip, long x0, long x1, long dx0, long dx1, int y0, int y1, const char * pat);

void bmmc_flood_fill(const Bitmap * bm, const ClipRect * clip, int x, int y, char color);
// Flood fill starting at (x,y) with color index.
```

### Built-in pattern tables

```c
extern char NineShadesOfGrey[9][8];  // 9 dithered fill patterns from black to white
extern char MixedColors[4][4][8];    // Pre-built 4-color dithered patterns for MC mode
```

---

## `gfx/tinyfont.h` — Built-in Tiny Pixel Font

```c
extern const char TinyFont[];
// The font data used by bmu_put_chars() and bm_put_chars().
// Each character is a variable-width bitmap stored in a compact format.
// You do not manipulate TinyFont directly; it is used automatically
// by the bm_put_chars / bm_put_string text-rendering functions.
```

---

## `gfx/vector3d.h` — 2D, 3D, and 4D Vector/Matrix Math

Float-based linear algebra for 3D graphics. All operations use `float`.

### Structures

```c
struct Vector2 { float v[2]; };    // v[0]=x, v[1]=y
struct Vector3 { float v[3]; };    // v[0]=x, v[1]=y, v[2]=z
struct Vector4 { float v[4]; };    // v[0]=x, v[1]=y, v[2]=z, v[3]=w

struct Matrix2 { float m[4]; };    // Row-major 2×2 matrix
struct Matrix3 { float m[9]; };    // Row-major 3×3 matrix
struct Matrix4 { float m[16]; };   // Row-major 4×4 matrix

// Fixed-point 4.12 variants (integer math, faster on 6502):
struct F12Vector3 { int v[3]; };
struct F12Matrix3 { int m[9]; };
static const int FIX12_ONE = 1 << 12;  // = 4096, represents 1.0
```

### Vector2 operations

```c
void vec2_set(Vector2 * vd, float x, float y);
void vec2_sum(Vector2 * vd, const Vector2 * v1, const Vector2 * v2);   // vd = v1 + v2
void vec2_diff(Vector2 * vd, const Vector2 * v1, const Vector2 * v2);  // vd = v1 - v2
void vec2_add(Vector2 * vd, const Vector2 * vs);    // vd += vs
void vec2_sub(Vector2 * vd, const Vector2 * vs);    // vd -= vs
void vec2_madd(Vector2 * vd, float s, const Vector2 * vs);  // vd += s*vs
void vec2_scale(Vector2 * vd, float s);             // vd *= s
void vec2_lerp(Vector2 * vd, const Vector2 * v1, const Vector2 * v2, float t);  // linear interp
float vec2_vmul(const Vector2 * v1, const Vector2 * v2);  // dot product
float vec2_length(const Vector2 * v);    // Euclidean length (sqrt)
float vec2_qlength(const Vector2 * v);   // Squared length (no sqrt, faster)
void vec2_norm(Vector2 * v);             // Normalize to length 1
float vec2_distance(const Vector2 * v1, const Vector2 * v2);
bool vec2_is_zero(const Vector2 * v);
```

### Vector3 operations

```c
void vec3_set(Vector3 * vd, float x, float y, float z);
void vec3_sum(Vector3 * vd, const Vector3 * v1, const Vector3 * v2);
void vec3_diff(Vector3 * vd, const Vector3 * v1, const Vector3 * v2);
void vec3_add(Vector3 * vd, const Vector3 * vs);
void vec3_sub(Vector3 * vd, const Vector3 * vs);
void vec3_madd(Vector3 * vd, float s, const Vector3 * vs);  // vd += s*vs
void vec3_scale(Vector3 * vd, float s);
void vec3_lerp(Vector3 * vd, const Vector3 * v1, const Vector3 * v2, float t);
float vec3_vmul(const Vector3 * v1, const Vector3 * v2);  // dot product
void vec3_xmul(Vector3 * vd, const Vector3 * v1, const Vector3 * v2); // cross product
float vec3_length(const Vector3 * v);
float vec3_qlength(const Vector3 * v);   // squared length
void vec3_norm(Vector3 * v);
float vec3_distance(const Vector3 * v1, const Vector3 * v2);
bool vec3_is_zero(const Vector3 * v);
void vec3_cmul(Vector3 * vd, const Vector3 * v1, const Vector3 * v2);  // component-wise multiply
void vec3_bend(Vector3 * vd, const Vector3 * vs, float chi1, float chi2); // rotation
// Project 3D point through 4×4 matrix (perspective divide):
void vec3_project(Vector3 * vd, const Matrix4 * m, const Vector3 * vs);
```

### Matrix3 operations

```c
void mat3_ident(Matrix3 * m);           // Set to identity
void mat3_scale(Matrix3 * md, float s); // Scale all elements
void mat3_add(Matrix3 * md, const Matrix3 * ms);
void mat3_mmul(Matrix3 * md, const Matrix3 * ms);   // md = md * ms
void mat3_rmmul(Matrix3 * md, const Matrix3 * ms);  // md = ms * md
void mat3_transpose(Matrix3 * md, const Matrix3 * ms);
float mat3_det(const Matrix3 * ms);
void mat3_invert(Matrix3 * md, const Matrix3 * ms);
void vec3_mmul(Vector3 * vd, const Matrix3 * m, const Vector3 * vs); // vd = m * vs

// Rotation matrices (angle in radians):
void mat3_set_rotate_x(Matrix3 * m, float a);  // Rotation around X axis
void mat3_set_rotate_y(Matrix3 * m, float a);  // Rotation around Y axis
void mat3_set_rotate_z(Matrix3 * m, float a);  // Rotation around Z axis
void mat3_set_rotate(Matrix3 * m, const Vector3 * v, float a); // Rotation around arbitrary axis
```

### Matrix4 operations

```c
void mat4_ident(Matrix4 * m);
void mat4_scale(Matrix4 * md, float s);
void mat4_add(Matrix4 * md, const Matrix4 * ms);
void mat4_mmul(Matrix4 * md, const Matrix4 * ms);    // md = md * ms
void mat4_rmmul(Matrix4 * md, const Matrix4 * ms);   // md = ms * md
float mat4_det(const Matrix4 * m);
void mat4_invert(Matrix4 * md, const Matrix4 * ms);
void vec4_mmul(Vector4 * vd, const Matrix4 * m, const Vector4 * vs);   // 4D transform
void vec3_mmulp(Vector3 * vd, const Matrix4 * m, const Vector3 * vs);  // 3D point transform (uses w)
void vec3_mmuld(Vector3 * vd, const Matrix4 * m, const Vector3 * vs);  // 3D direction transform (w=0)

// Transform setup:
void mat4_set_rotate_x(Matrix4 * m, float a);
void mat4_set_rotate_y(Matrix4 * m, float a);
void mat4_set_rotate_z(Matrix4 * m, float a);
void mat4_set_rotate(Matrix4 * m, const Vector3 * v, float a);
void mat4_set_translate(Matrix4 * m, const Vector3 * v);
void mat4_set_scale(Matrix4 * m, float s);

// Camera setup:
void mat4_make_perspective(Matrix4 * m, float fieldOfViewInRadians, float aspect, float near, float far);
void mat4_make_view(Matrix4 * m, const Vector3 * pos, const Vector3 * target, const Vector3 * up);

// Build matrix from column vectors:
void mat4_from_vec4(Matrix4 * m, const Vector4 * vx, const Vector4 * vy, const Vector4 * vz, const Vector4 * vw);
void mat4_from_vec3(Matrix4 * m, const Vector3 * vx, const Vector3 * vy, const Vector3 * vz, const Vector3 * vw);
```

### Fixed-point 4.12 math (faster on 6502)

```c
// F12Matrix3 operations use 4.12 fixed integers instead of float.
// FIX12_ONE = 4096 = 1.0 in 4.12 notation.
void f12mat3_ident(F12Matrix3 * m);
void f12mat3_mmul(F12Matrix3 * md, const F12Matrix3 * ms);
void f12mat3_rmmul(F12Matrix3 * md, const F12Matrix3 * ms);
void f12mat3_set_rotate_x(F12Matrix3 * m, float a);  // Accepts float angle (radians)
void f12mat3_set_rotate_y(F12Matrix3 * m, float a);
void f12mat3_set_rotate_z(F12Matrix3 * m, float a);
void f12vec3_mmul(F12Vector3 * vd, const F12Matrix3 * m, const F12Vector3 * vs);
// Transform: vd = m * vs using fixed-point multiply (lmul4f12s internally).
```

---

## `audio/sidfx.h` — SID Sound Effects Player

High-level sound effect system on top of raw SID. Plays multi-frame SID parameter sequences on one of the 3 SID voices.

### Data structure

```c
struct SIDFX {
    unsigned freq;      // Starting frequency (use NOTE_* macros or SID_FREQ_PAL)
    unsigned pwm;       // Starting pulse width
    byte ctrl;          // Starting control register (SID_CTRL_* flags)
    byte attdec;        // Envelope attack/decay
    byte susrel;        // Envelope sustain/release
    int  dfreq;         // Frequency delta per frame (signed, for pitch bends)
    int  dpwm;          // PWM delta per frame
    byte time1;         // Frames to keep GATE on (note sustain frames)
    byte time0;         // Frames after GATE off before stopping (release frames)
    byte priority;      // Sound priority (higher = more important, won't be cut)
};
```

### Functions

```c
void sidfx_init(void);
// Initialize the SID FX system. Call once. Silences all SID voices.

bool sidfx_idle(byte chn);
// Returns true if SID channel chn (0–2) is not currently playing.

void sidfx_play(byte chn, const SIDFX * fx, byte cnt);
// Start playing effect `fx` on channel chn.
// cnt = number of SIDFX frames in the array (for multi-note sequences).
// If channel is busy with higher-priority sound, this call is ignored.

void sidfx_stop(byte chn);
// Immediately stop the sound on channel chn.

char sidfx_cnt(byte chn);
// Return number of remaining SIDFX frames for channel chn.

void sidfx_loop(void);
// Advance all 3 SID channels by one frame. Call once per game loop iteration
// (typically once per video frame = 50/60 Hz).
// MUST be called regularly for sounds to progress.

void sidfx_loop_2(void);
// Alternative loop function that advances channels at half speed (useful for slower tempos).
```

### Typical usage

```c
#include <audio/sidfx.h>
#include <c64/sid.h>

// Define a sound effect: laser shoot
static const SIDFX LaserFX = {
    SID_FREQ_PAL(1000),  // start at 1000 Hz
    0,                   // no PWM
    SID_CTRL_SAW | SID_CTRL_GATE,  // sawtooth, gate on
    SID_ATK_2 | SID_DKY_24,        // fast attack/decay
    0x80 | SID_DKY_48,              // sustain 8, release 48ms
    -200,  // pitch down 200 units per frame
    0,     // no PWM change
    8,     // 8 frames gate on
    4,     // 4 frames release
    5      // priority 5
};

void init(void) {
    sidfx_init();
    sid.fmodevol = 15;  // max volume
}

void game_loop(void) {
    sidfx_loop();  // advance sound engine

    if (fire_button_pressed) {
        sidfx_play(0, &LaserFX, 1);  // play on channel 0
    }
}
```

---

## `ultimate_lib.h` — Ultimate 64 / 1541 Ultimate II+ Command Library

Provides access to the Command Interface of the Ultimate 64 or 1541 Ultimate II+ cartridge. Allows file operations, networking, disk mounting, and more.

**Note:** This library is only available when running on hardware with the Ultimate cartridge. Check `uii_success()` after each call.

### Status checking

```c
extern char uii_status[256];   // Status string from last command (null-terminated after reading)
extern char uii_data[1792];    // Data buffer from last command

#define uii_success()  (uii_status[0] == '0' && uii_status[1] == '0')
// Returns true if last command succeeded. Check after every uii_* call.
```

### Target selection

```c
#define TARGET_DOS1    0x01  // Drive 1 (primary)
#define TARGET_DOS2    0x02  // Drive 2
#define TARGET_NETWORK 0x03  // Network interface
#define TARGET_CONTROL 0x04  // System control

void uii_settarget(unsigned char id);
// Select which subsystem subsequent commands go to.
```

### System

```c
void uii_freeze(void);
// Trigger the Ultimate freeze/menu (like pressing the button).

void uii_identify(void);
// Identify the Ultimate firmware. Result in uii_data (e.g. "ultimate-ii dos v1.2").
```

### File operations

```c
void uii_get_path(void);
// Get current directory path. Result in uii_data.

void uii_open_dir(void);
// Open current directory for reading.

void uii_get_dir(void);
// Read next directory entry into uii_data.
// struct DirectoryEntry { unsigned char attributes; unsigned char *filename; };
// Call repeatedly until uii_data is empty.

void uii_change_dir(char * directory);
// Change to directory. Use ".." to go up.

void uii_create_dir(char * directory);

void uii_change_dir_home(void);
// Navigate to the home/root directory.

void uii_open_file(unsigned char attrib, char * filename);
// Open file. attrib: 0x01=read, 0x02=write, 0x06=read/write.

void uii_close_file(void);

void uii_read_file(unsigned char length);
// Read up to length bytes from open file. Data goes into uii_data.

void uii_write_file(unsigned char * data, int length);
// Write length bytes from data to open file.

void uii_delete_file(char * filename);
void uii_rename_file(char * filename, char * newname);
void uii_copy_file(char * sourcefile, char * destfile);
```

### Disk image management

```c
void uii_mount_disk(unsigned char id, char * filename);
// Mount a disk image file on drive id (1 or 2).
// filename is the path to a .d64, .d81, etc. image.

void uii_unmount_disk(unsigned char id);
// Unmount the disk image from drive id.

void uii_swap_disk(unsigned char id);
// Swap to the next disk in a multi-disk set.
```

### Time

```c
// DOS_CMD_GET_TIME / DOS_CMD_SET_TIME commands are available via uii_sendcommand().
// Use for reading RTC from the Ultimate hardware.
```

### Networking (TCP/UDP)

```c
void uii_getipaddress(void);
// Get IP address. uii_data contains: IP(4), netmask(4), gateway(4) bytes.

unsigned char uii_tcpconnect(char * host, unsigned short port);
// Open a TCP connection to host:port. Returns socket ID (0 = failure).

unsigned char uii_udpconnect(char * host, unsigned short port);
// Open a UDP socket. Returns socket ID.

void uii_socketclose(unsigned char socketid);

int uii_socketread(unsigned char socketid, unsigned short length);
// Read up to length bytes from socket. Returns bytes read into uii_data.

void uii_socketwrite(unsigned char socketid, char * data);
// Write null-terminated string to socket.

void uii_socketwritechar(unsigned char socketid, char one_char);

// TCP listener (for server mode):
int uii_tcplistenstart(unsigned short port);
int uii_tcplistenstop(void);
int uii_tcpgetlistenstate(void);
// Listener states: 0x00=not listening, 0x01=listening, 0x02=connected,
//                  0x03=bind error, 0x04=port in use

unsigned char uii_tcpgetlistensocket(void);
// Get socket ID of connected listener.

char uii_tcp_nextchar(unsigned char socketid);
// Read one character from TCP socket (blocking).
```

### Low-level command interface

```c
void uii_sendcommand(unsigned char * bytes, int count);
// Send raw command bytes to the Ultimate command interface.

int uii_readdata(void);
// Read response data into uii_data. Returns bytes read.

int uii_readstatus(void);
// Read status response into uii_status.

void uii_accept(void);
// Acknowledge data received (required after reading to free buffer).

void uii_abort(void);
// Abort current command.

int uii_isdataavailable(void);
// Returns non-zero if data is ready to read.

int uii_isstatusdataavailable(void);
// Returns non-zero if status data is ready.

void uii_echo(void);
// Echo test command (verifies communication working).

void uii_logtext(char * text);
// Log a text string to the Ultimate log (for debugging).
```

---

## Complete Example Programs

### Minimal text mode program

```c
#include <c64/vic.h>
#include <conio.h>
#include <stdio.h>

int main(void)
{
    clrscr();
    textcolor(COLOR_YELLOW);
    bgcolor(COLOR_BLUE);
    bordercolor(COLOR_BLUE);
    
    gotoxy(10, 12);
    printf("HELLO C64!");
    
    getch();  // wait for keypress
    return 0;
}
```

### Hires bitmap demo

```c
#include <c64/vic.h>
#include <c64/memmap.h>
#include <gfx/bitmap.h>
#include <string.h>
#include <conio.h>

char Color[1000];          // Color cells at $D000 (MMAP_NO_ROM)
char Hires[8000];          // Bitmap pixels (can also use fixed address)
Bitmap Screen;

int main(void)
{
    mmap_trampoline();
    mmap_set(MMAP_RAM);

    memset(Color, 0x10, 1000);  // color 1 fg, color 0 bg for each cell
    memset(Hires, 0, 8000);

    mmap_set(MMAP_NO_ROM);
    vic_setmode(VICM_HIRES, Color, Hires);
    vic.color_border = VCOL_BLACK;
    vic.color_back   = VCOL_BLACK;

    bm_init(&Screen, Hires, 40, 25);

    ClipRect cr = {0, 0, 320, 200};
    bm_line(&Screen, &cr, 0, 0, 319, 199, 0xff, LINOP_SET);
    bm_line(&Screen, &cr, 319, 0, 0, 199, 0xff, LINOP_SET);

    getch();

    mmap_set(MMAP_ROM);
    vic_setmode(VICM_TEXT, (char*)0x0400, (char*)0x1000);
    return 0;
}
```

### Joystick-controlled sprite

```c
#include <c64/vic.h>
#include <c64/sprites.h>
#include <c64/joystick.h>

char * const Screen = (char *)0x0400;
int px = 160, py = 100;

int main(void)
{
    spr_init(Screen);
    spr_set(0, true, px, py, 1, VCOL_YELLOW, false, false, false);

    while (1)
    {
        vic_waitBottom();
        joy_poll(0);
        px += joyx[0] * 2;
        py += joyy[0] * 2;
        spr_move(0, px, py);
    }
    return 0;
}
```

### Raster IRQ color bars

```c
#include <c64/vic.h>
#include <c64/rasterirq.h>

RIRQCode bars[16];

int main(void)
{
    rirq_init(true);

    for (int i = 0; i < 15; i++) {
        rirq_build(bars + i, 2);
        rirq_write(bars + i, 0, &vic.color_border, i);
        rirq_write(bars + i, 1, &vic.color_back,   i);
        rirq_set(i, 20 + 12 * i, bars + i);
    }

    rirq_sort();
    rirq_start();

    for (;;) {}   // run forever
    return 0;
}
```

---

## Key Patterns and Pitfalls

### Memory map when using bitmap at $E000

Always call `mmap_trampoline()` before `mmap_set(MMAP_RAM)` to protect IRQ vectors:
```c
mmap_trampoline();      // first!
mmap_set(MMAP_RAM);     // now $E000 is writable
// ... set up bitmap ...
mmap_set(MMAP_NO_ROM);  // I/O back, KERNAL still off
```

### Using VIC color RAM at $D800

Color RAM (`$D800–$DBFF`) is accessible even when `MMAP_NO_ROM` is set (I/O area enabled). Each byte holds the foreground color for one character cell (low 4 bits). Upper 4 bits are don't-care.

### Screen code vs. PETSCII

Screen codes and PETSCII are different:
- Screen code 0 = `@`, screen code 1 = `A`, ..., screen code 27 = `[`
- Screen code 65 = `A` in **lowercase** charset
- `cwin_put_string` uses PETSCII. `cwin_put_string_raw` uses screen codes.
- Use `#include <petscii.h>` when you want lowercase source literals to map to uppercase on screen.

### Sprite image setup

Hardware sprites read image data from the area pointed to by the last 8 bytes of screen RAM (offsets 2040–2047, relative to screen base). Each byte is a sprite number × 64 = address in same 16KB VIC bank.

```c
Screen[2040 + sp] = image_number;  // Set sprite sp to use image at image_number*64
```
`spr_init()` and `spr_set()` handle this automatically.

### SID voice frequency 0

Setting `voices[n].freq = 0` effectively silences the oscillator. Always set a valid frequency before gating on.

### float vs. fixmath performance

On the 6502, `float` operations are **very slow** (10s–100s of cycles each). For real-time game code, prefer:
- `fixmath.h` integer-based fixed-point math
- `F12Vector3` / `F12Matrix3` from `vector3d.h`
- Pre-computed lookup tables for sin/cos (stored as arrays)
