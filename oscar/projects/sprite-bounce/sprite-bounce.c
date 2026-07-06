// sprite-bounce - Tutorial 2: sprites and the game loop.
//
// A single hardware sprite bounces around the screen. This teaches:
//   * placing sprite bitmap data in a VIC-visible bank,
//   * the spr_set image index = data_address / 64 rule (a classic trap),
//   * a fixed-tempo game loop driven by vic_waitFrame().
//
// Build:  bin/oscar64 projects/sprite-bounce/sprite-bounce.c
// Run:    load the .prg on the C64 Ultimate.

#include <c64/vic.h>
#include <c64/sprites.h>
#include <string.h>   // memcpy
#include <conio.h>    // clrscr

// The sprite's 24x21 bitmap: 63 used bytes, padded to 64. A simple filled ball.
static const char ball_image[64] = {
    0x00,0x7e,0x00,
    0x03,0xff,0xc0,
    0x07,0xff,0xe0,
    0x0f,0xff,0xf0,
    0x1f,0xff,0xf8,
    0x1f,0xff,0xf8,
    0x3f,0xff,0xfc,
    0x3f,0xff,0xfc,
    0x3f,0xff,0xfc,
    0x3f,0xff,0xfc,
    0x3f,0xff,0xfc,
    0x3f,0xff,0xfc,
    0x1f,0xff,0xf8,
    0x1f,0xff,0xf8,
    0x0f,0xff,0xf0,
    0x07,0xff,0xe0,
    0x03,0xff,0xc0,
    0x00,0x7e,0x00,
    0x00,0x00,0x00,
    0x00,0x00,0x00,
    0x00,0x00,0x00,
    0x00,             // 64th padding byte
};

// Sprite data must live in the VIC bank (default bank 0 = $0000-$3FFF).
// $2000 is free of screen/colour RAM here.  image index = $2000 / 64 = 128.
#define SPRITE_ADDR   0x2000
#define SPRITE_IMAGE  (SPRITE_ADDR / 64)   // == 128, NOT the sprite number

int main(void)
{
    clrscr();

    // Copy the bitmap into the VIC-visible location the image index points at.
    char * const sprite_mem = (char *)SPRITE_ADDR;
    memcpy(sprite_mem, ball_image, 64);

    // Position (VIC sprite coordinates). x is 9-bit, y is 8-bit.
    int x = 160, y = 120;
    int dx = 2, dy = 1;     // velocity in pixels/frame

    // Enable sprite 0 at the start position with image 128 (= $2000/64).
    spr_set(0, true, x, y, SPRITE_IMAGE, VCOL_WHITE, false, false, false);

    for (;;)
    {
        vic_waitFrame();    // one steady tick per frame

        x += dx;
        y += dy;

        // Bounce inside the visible play area.
        if (x <= 24  || x >= 320) dx = -dx;
        if (y <= 50  || y >= 229) dy = -dy;

        spr_move(0, x, y);
    }

    return 0;
}
