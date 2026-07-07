# C Programming: Performance and Inline Assembly

> Part of the [Programming in C on the C64](c-programming.md) reference. A worked game skeleton, performance habits, and inline 6502 assembly.

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
