# C Programming: Input and File I/O

> Part of the [Programming in C on the C64](c-programming.md) reference. Covers keyboard/joystick input and disk file I/O.

## Keyboard and Joystick Input

### Keyboard via CharWin

The simplest approach for interactive programs:

```c
#include <c64/charwin.h>

int key = cwin_getch();      // blocking: waits for a key, returns PETSCII code
int key = cwin_checkch();    // non-blocking: returns -1 if no key pending
```

Common PETSCII codes:

| Code | Key | Code | Key |
|------|-----|------|-----|
| 13 | RETURN | 3 | RUN/STOP |
| 17 | Cursor down | 29 | Cursor right |
| 145 | Cursor up | 157 | Cursor left |
| 20 | DEL | 133–140 | F1–F8 |

For full keyboard scanning (including modifier keys), use `cia1` register access directly — see `c64/cia.h`.

### Joystick

```c
#include <c64/joystick.h>

joy_poll(1);               // read joystick port 1 (or 2) into internal state

if (joy_button(1))         // fire button: port 1
    fire_laser();

if (joy_left(1))           // joystick left: port 1
    player_x--;

if (joy_right(1))
    player_x++;

if (joy_up(1))
    player_y--;

if (joy_down(1))
    player_y++;
```

---

## Disk and File I/O

Files are accessed via the C64's built-in kernal and the IEC serial bus. `fopen` wraps the kernal file open routines.

```c
#include <stdio.h>

// Read a sequential file from disk:
FILE * f = fopen("SCORES,S,R", "r");
if (f)
{
    char buf[40];
    while (fgets(buf, sizeof(buf), f))
        printf("%s", buf);
    fclose(f);
}

// Write a sequential file:
FILE * f = fopen("SCORES,S,W", "w");
if (f)
{
    fputs("1000\n", f);
    fputs("500\n",  f);
    fclose(f);
}
```

**C64 filename format:** `NAME,TYPE,RW`

| Part | Values |
|------|--------|
| Name | up to 16 characters |
| Type | `S` = sequential, `P` = PRG, `U` = user, `L` = relative |
| Direction | `R` = read, `W` = write |

Maximum 8 files open simultaneously (`FOPEN_MAX`). Filename maximum is 16 characters (`FILENAME_MAX`).

---

Next: [Performance and Inline Assembly](c-performance.md)
