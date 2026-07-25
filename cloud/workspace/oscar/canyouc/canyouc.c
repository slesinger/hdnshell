#include <conio.h>
#include <stdio.h>
#include <petscii.h>
#include <c64/vic.h>

/* VIC-II registers used by this demo. */
#define VIC_RASTER        (*(volatile unsigned char *)0xd012)
#define VIC_BORDER_COLOR  (*(volatile unsigned char *)0xd020)

int main(void)
{
  clrscr();
  printf("hello c64 ultimate\n");

  while (1)
  {
    /*
     * Wait until the raster leaves line 70, then wait for it to reach
     * line 71. That gives us one color change per video frame slice.
     */
    while (VIC_RASTER == 70)
    {
      VIC_BORDER_COLOR = VCOL_WHITE;
    }

    while (VIC_RASTER == 81)
    {
      VIC_BORDER_COLOR = VCOL_BLACK;
    }
  }

  return 0;
}
