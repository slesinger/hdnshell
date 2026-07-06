// rasterbars - Tutorial 3: a classic effect mixing C and 6502 assembler.
//
// Horizontal colour bars painted by changing the VIC-II background colour at
// precise raster lines - the effect that made 8-bit demos famous. The timing
// primitive is written in inline assembly; the composition stays in C.
//
// Teaches:
//   * Oscar64 inline assembly with __asm { } and parameter access,
//   * why raster timing needs cycle-tight polling of $D012,
//   * keeping the "what" in C and the "when" in asm.
//
// Build:  bin/oscar64 projects/rasterbars/rasterbars.c
// Run:    load the .prg on the C64 Ultimate.

#include <c64/vic.h>
#include <conio.h>   // clrscr

// A 16-step colour gradient scrolled through each frame (C64 colour codes).
static const unsigned char bar_colors[16] = {
    0,  6,  6, 14, 14,  3,  3,  1,
    1,  3,  3, 14, 14,  6,  6,  0,
};

// Cycle-tight wait until the VIC raster line counter ($D012) equals `line`.
// Written in assembler so the poll is as tight as possible - this is where a
// stable raster split has to be. C variable `line` is read straight from its
// zero-page register.
static void wait_raster(unsigned char line)
{
    __asm {
        lda line
    wr:
        cmp 0xd012     // vic.raster low byte
        bne wr
    }
}

int main(void)
{
    clrscr();
    vic.color_border = VCOL_BLACK;
    vic.color_back   = VCOL_BLACK;

    unsigned char phase = 0;

    for (;;)
    {
        // Paint 16 bars, 8 raster lines apart, starting at line 60.
        for (unsigned char i = 0; i < 16; i++)
        {
            wait_raster(60 + i * 8);
            vic.color_back = bar_colors[(i + phase) & 15];
        }

        // Blank the background below the bars, then wait out the frame.
        wait_raster(60 + 16 * 8);
        vic.color_back = VCOL_BLACK;
        wait_raster(250);

        phase++;   // scroll the gradient for a shimmering motion
    }

    return 0;
}
