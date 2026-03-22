#include <c64/vic.h>
#include <conio.h>
#include <stdio.h>
#include <ultimate_lib.h>

/*
 * HONDANI Analog Clock - Commodore C64 / Ultimate 64
 *
 * Compiled with oscar64. No <math.h>, no float, fully table-driven.
 * Lowercase mode: putchar(0x0e) at startup.
 * Black background, dark grey border: bgcolor(COLOR_BLACK); bordercolor(COLOR_DARK_GREY).
 *
 * LAYOUT (40-column screen):
 *   Row 0:       Cyan title bar "  hondani    ***  petscii clock  ***"
 *   Cols 0-15:   Left panel - poem in COLOR_LT_GREEN, 16 chars wide per row, rows 1-24.
 *   Col 16:      Dark grey vertical divider '|', rows 0-24.
 *   Cols 17-39:  Analog clock face, rows 2-22.
 *
 * CLOCK FACE (centre CX=28, CY=12, RX=9, RY=10):
 *   Ring: 72 precomputed (x,y) points, screen code $5E, COLOR_ORANGE.
 *         All y values in [2..22] (RY=10 ensures CY+RY=22 = CLOCK_Y1).
 *   Hour ticks: 12 precomputed (x,y) points, screen code $5B, COLOR_YELLOW.
 *   Centre: screen code $51, COLOR_YELLOW drawn on top each second.
 *   "hondani" label: COLOR_ORANGE at (CX-3, CY-3).
 *   Date dd/mm/yyyy: COLOR_CYAN at (CX-5, CY+4).
 *   Time hh:mm:ss:  COLOR_WHITE at (CX-4, CY+5).
 *
 * ALL DRAWING uses direct screen/color RAM writes (SCREEN_BASE=$0400, COLOR_BASE=$D800)
 * via xpoke(x,y,sc,color) - NOT putch/KERNAL - to avoid PETSCII translation of
 * high screen codes ($5B, $5E, $60, $A0 etc.).
 * xpoke clips to CLOCK_X0..CLOCK_X1, CLOCK_Y0..CLOCK_Y1.
 *
 * HANDS - flicker-free: static background drawn ONCE; each second only previous
 * hand pixels are erased via restore_bg() which re-checks ring/tick tables.
 * Previous positions stored in old_hx[3][CLOCK_RY], old_hy[3][CLOCK_RY] (signed char).
 *   Second hand: screen code $2E '.', COLOR_RED,    FRAC_SEC=95.
 *   Minute hand: screen code $23 '#', COLOR_YELLOW, FRAC_MIN=85.
 *   Hour hand:   screen code $E0 (solid block), COLOR_WHITE, FRAC_HOU=60.
 *
 * TRIG TABLES: sin60[60], cos60[60] scaled *100 (values -100..100, signed char).
 *   Index 0=3-o-clock, clockwise. Index 45=12-o-clock (sin=-100,cos=0).
 *   Hand index: sec_idx=(45+secs)%60, min_idx=(45+mins)%60,
 *               hou_idx=(45+hrs12*5+mins/12)%60.
 * draw_hand() arithmetic MUST stay 16-bit (oscar64 long=16-bit on 6502):
 *   x = CX + cos60[idx] * (i+1) * frac * RX / (100L * 100 * RY)
 *   y = CY + sin60[idx] * (i+1) * frac        / (100L * 100)
 *   Use 'long' casts and 100L to force 16-bit signed multiply (max value ~95000
 *   overflows! use sin/cos scaled *10 instead if needed).
 *
 * TIME SOURCE: uii_get_time() fills uii_data[] with null-terminated ASCII string.
 *   Actual format (NO leading space): "2026/03/06 21:20:23"
 *   Offsets: [0-3]=year [4]='/' [5-6]=mo [7]='/' [8-9]=dy
 *            [10]=' ' [11-12]=hrs [13]=':' [14-15]=mins [16]=':' [17-18]=secs
 *   Validate with: s[4]=='/' && s[7]=='/' && s[10]==' ' && s[13]==':' && s[16]==':'
 *   Parse with parse2() helper: (s[0]-'0')*10+(s[1]-'0').
 *   Skip frame if secs==last_sec (poll until second changes).
 *   May return empty string until NTP syncs - loop continues silently.
 */

#define CLOCK_CX    28
#define CLOCK_CY    12
#define CLOCK_RX     9
#define CLOCK_RY    10   // keep ring within y=2..22

#define CLOCK_X0    17
#define CLOCK_X1    39
#define CLOCK_Y0     2   // ring top = CY - RY = 12 - 10 = 2
#define CLOCK_Y1    22   // ring bottom = CY + RY = 12 + 10 = 22

#define FRAC_SEC    95
#define FRAC_MIN    85
#define FRAC_HOU    60

// Screen codes (written directly to $0400, bypassing KERNAL translation)
#define SC_SPACE    0x20
#define SC_RING     0x5e   // user-requested ring character
#define SC_TICK     0x5b   // user-requested tick (hour marks)
#define SC_CENTER   0x2a   // filled circle for centre
#define SC_SECOND   0x2e   // '.'
#define SC_MINUTE   0x23   // '#'
#define SC_HOUR     0xE0   // screen code 0xE0 = solid block

#define SCREEN_BASE ((char*)0x0400)
#define COLOR_BASE  ((char*)0xd800)

// ---------------------------------------------------------------- trig tables
// 60-entry sin/cos, full circle, scaled *100. idx 0=3-o-clock, 45=12-o-clock.
static const signed char sin60[60] = {
     0, 10, 21, 31, 41, 50, 59, 67, 74, 81, 87, 91, 95, 98, 99,100,
    99, 98, 95, 91, 87, 81, 74, 67, 59, 50, 41, 31, 21, 10,  0,-10,
   -21,-31,-41,-50,-59,-67,-74,-81,-87,-91,-95,-98,-99,-100,-99,-98,
   -95,-91,-87,-81,-74,-67,-59,-50,-41,-31,-21,-10
};
static const signed char cos60[60] = {
   100, 99, 98, 95, 91, 87, 81, 74, 67, 59, 50, 41, 31, 21, 10,  0,
   -10,-21,-31,-41,-50,-59,-67,-74,-81,-87,-91,-95,-98,-99,-100,-99,
   -98,-95,-91,-87,-81,-74,-67,-59,-50,-41,-31,-21,-10,  0, 10, 21,
    31, 41, 50, 59, 67, 74, 81, 87, 91, 95, 98, 99
};

// ------------------------------------------------ precomputed ring positions
// Computed with CX=28,CY=12,RX=9,RY=10 - all y in [2..22]
#define RING_SAMPLES 72
static const signed char ring_x[RING_SAMPLES] = {
    37,37,37,37,36,36,36,35,35,34,34,33,32,32,31,30,30,29,28,27,26,26,
    25,24,24,23,22,22,21,21,20,20,20,19,19,19,19,19,19,19,20,20,20,21,
    21,22,22,23,23,24,25,26,26,27,28,29,30,30,31,32,32,33,34,34,35,35,
    36,36,36,37,37,37
};
static const signed char ring_y[RING_SAMPLES] = {
    12,13,14,15,15,16,17,18,18,19,20,20,21,21,21,22,22,22,22,22,22,22,
    21,21,21,20,20,19,18,18,17,16,15,15,14,13,12,11,10, 9, 9, 8, 7, 6,
     6, 5, 4, 4, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 6, 6,
     7, 8, 9, 9,10,11
};
// 12 hour tick marks
#define TICK_COUNT 12
static const signed char tick_x[TICK_COUNT] = {28,32,36,37,36,32,28,24,20,19,20,23};
static const signed char tick_y[TICK_COUNT] = { 2, 3, 7,12,17,21,22,21,17,12, 7, 3};

// Previous hand positions for flicker-free erase
static signed char old_hx[3][CLOCK_RY], old_hy[3][CLOCK_RY];
static int old_valid = 0;

// Poem
static const char * const poem[] = {
    " hondani c64    ",
    " ~~~~~~~~~~~~~~",
    "                ",
    " masters of     ",
    " the scene!     ",
    "                ",
    " honza          ",
    "  code wizard   ",
    "                ",
    " dan            ",
    "  sid magick    ",
    "                ",
    " ondra          ",
    "  pixel lord    ",
    "                ",
    " together       ",
    "  we rule       ",
    "  the c64!      ",
    "                ",
    " hondani        ",
    "  forever!      ",
    "                ",
    " fame &         ",
    "  glory is ours!",
    NULL
};

// ------------------------------------------------------------------ helpers

// Write screen code + color directly to screen/color RAM (no KERNAL translation)
static inline void xpoke(int x, int y, int sc, int color)
{
    int ofs;
    if (x < CLOCK_X0 || x > CLOCK_X1 || y < CLOCK_Y0 || y > CLOCK_Y1)
        return;
    ofs = y * 40 + x;
    SCREEN_BASE[ofs] = (char)sc;
    COLOR_BASE[ofs]  = (char)color;
}

static inline int parse2(const char *s)
{
    return (s[0] - '0') * 10 + (s[1] - '0');
}

static void restore_bg(int x, int y)
{
    int i;
    for (i = 0; i < TICK_COUNT; i++) {
        if (tick_x[i] == x && tick_y[i] == y) {
            xpoke(x, y, SC_TICK, COLOR_YELLOW);
            return;
        }
    }
    for (i = 0; i < RING_SAMPLES; i++) {
        if (ring_x[i] == x && ring_y[i] == y) {
            xpoke(x, y, SC_RING, COLOR_ORANGE);
            return;
        }
    }
    xpoke(x, y, SC_SPACE, COLOR_BLACK);
}

// ------------------------------------------------------------------ drawing

static void draw_poem(void)
{
    int row;
    for (row = 1; row <= 24 && poem[row - 1]; row++) {
        gotoxy(0, row);
        textcolor(COLOR_LT_GREEN);
        printf("%.16s", poem[row - 1]);
    }
}

static void draw_divider(void)
{
    int y;
    for (y = 0; y <= 24; y++) {
        gotoxy(16, y);
        textcolor(COLOR_DARK_GREY);
        putch('|');
    }
}

static void draw_clock_bg(void)
{
    int x, y, i;
    for (y = CLOCK_Y0; y <= CLOCK_Y1; y++)
        for (x = CLOCK_X0; x <= CLOCK_X1; x++) {
            int ofs = y * 40 + x;
            SCREEN_BASE[ofs] = SC_SPACE;
            COLOR_BASE[ofs]  = COLOR_BLACK;
        }
    for (i = 0; i < RING_SAMPLES; i++)
        xpoke(ring_x[i], ring_y[i], SC_RING, COLOR_ORANGE);
    for (i = 0; i < TICK_COUNT; i++)
        xpoke(tick_x[i], tick_y[i], SC_TICK, COLOR_YELLOW);
}

// Draw hand using angle index + store positions for next erase
static void draw_hand(int idx, int frac, int sc, int color,
                      signed char *hx, signed char *hy)
{
    int i, x, y;
    long cv = cos60[idx];
    long sv = sin60[idx];
    for (i = 0; i < CLOCK_RY; i++) {
        long t = (long)(i + 1) * frac;
        x = (int)(CLOCK_CX + cv * t * CLOCK_RX / (100L * 100 * CLOCK_RY));
        y = (int)(CLOCK_CY + sv * t / (100L * 100));
        hx[i] = (signed char)x;
        hy[i] = (signed char)y;
        xpoke(x, y, sc, color);
    }
}

// -------------------------------------------------------------------- main

int main(void)
{
    int last_sec = -1;

    putchar(0x0e);       // PETSCII: switch to lowercase character set
    bgcolor(COLOR_BLACK);
    bordercolor(COLOR_DARK_GREY);
    clrscr();
    textcolor(COLOR_WHITE);

    gotoxy(0, 0);
    textcolor(COLOR_CYAN);
    printf("  hondani    ***  petscii clock  ***");

    draw_poem();
    draw_divider();
    draw_clock_bg();

    while (1) {
        uii_get_time();

        // "2026/03/06 21:20:23"
        // [0-3]=year [4]='/' [5-6]=mo [7]='/' [8-9]=dy
        // [10]=' ' [11-12]=hrs [13]=':' [14-15]=mins [16]=':' [17-18]=secs
        const char *s = uii_data;
        if (s[0] == 0 || s[4] != '/' || s[7] != '/' ||
            s[10] != ' ' || s[13] != ':' || s[16] != ':')
            continue;

        int secs = parse2(&s[17]);
        if (secs == last_sec) continue;
        last_sec = secs;

        int mins  = parse2(&s[14]);
        int hrs   = parse2(&s[11]);
        int dy    = parse2(&s[8]);
        int mo    = parse2(&s[5]);
        int yr    = parse2(&s[0]) * 100 + parse2(&s[2]);
        int hrs12 = hrs % 12;

        // Erase old hand pixels
        if (old_valid) {
            int h, i;
            for (h = 0; h < 3; h++)
                for (i = 0; i < CLOCK_RY; i++)
                    restore_bg(old_hx[h][i], old_hy[h][i]);
        }

        // idx 45 = 12-o-clock; clockwise = increasing index
        // sec/min: 1 step per second/minute
        // hour: smooth - 5 steps per hour + 1 step per 12 minutes
        int sec_idx = (45 + secs) % 60;
        int min_idx = (45 + mins) % 60;
        int hou_idx = (45 + hrs12 * 5 + mins / 12) % 60;

        draw_hand(sec_idx, FRAC_SEC, SC_SECOND, COLOR_RED,    old_hx[0], old_hy[0]);
        draw_hand(min_idx, FRAC_MIN, SC_MINUTE, COLOR_YELLOW, old_hx[1], old_hy[1]);
        draw_hand(hou_idx, FRAC_HOU, SC_HOUR,   COLOR_WHITE,  old_hx[2], old_hy[2]);
        old_valid = 1;

        xpoke(CLOCK_CX, CLOCK_CY, SC_CENTER, COLOR_YELLOW);

        // "hondani" label above centre
        gotoxy(CLOCK_CX - 3, CLOCK_CY - 3);
        textcolor(COLOR_ORANGE);
        printf("hondani");

        // date / time below centre
        gotoxy(CLOCK_CX - 5, CLOCK_CY + 4);
        textcolor(COLOR_CYAN);
        printf("%02d/%02d/%04d", dy, mo, yr);

        gotoxy(CLOCK_CX - 4, CLOCK_CY + 5);
        textcolor(COLOR_WHITE);
        printf("%02d:%02d:%02d", hrs, mins, secs);
    }

    return 0;
}
