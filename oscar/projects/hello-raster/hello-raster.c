// hello-raster - Tutorial 1: your first Oscar64 C program for the C64 Ultimate.
//
// Goals:
//   * prove the build/run loop works,
//   * write text to the screen,
//   * touch a VIC-II hardware register and animate it every frame.
//
// Build:  bin/oscar64 projects/hello-raster/hello-raster.c
// Run:    load the resulting .prg on the C64 Ultimate (the coding agent's
//         run tool does this for you), or in VICE: x64sc hello-raster.prg

#include <c64/vic.h>   // vic.* hardware registers (verified via find_oscar_symbol)
#include <stdio.h>     // printf
#include <conio.h>     // clrscr

int main(void)
{
    clrscr();
    printf("hello c64 ultimate\n");
    printf("built with oscar64 c\n\n");
    printf("watch the border...\n");

    // A byte counter wraps at 256 for free - the cheapest loop variable on 6502.
    unsigned char tick = 0;

    for (;;)
    {
        // Wait for the raster beam to reach the bottom of the screen. Reading
        // vic.raster once per frame gives us a steady ~50/60 Hz tick without a
        // timer. This is the seed of every C64 "game loop".
        while (vic.raster != 250) { }

        // Advance colour every 8th frame so the change is visible, not a blur.
        if ((tick & 7) == 0)
            vic.color_border = (vic.color_border + 1) & 15;  // 16 C64 colours

        tick++;

        // Avoid re-triggering on the same raster line within one frame.
        while (vic.raster == 250) { }
    }

    return 0;
}
