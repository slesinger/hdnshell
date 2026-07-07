# C Programming: Sound (SID)

> Part of the [Programming in C on the C64](c-programming.md) reference. Covers the SID sound chip.

## SID Sound Chip

The SID at `$D400` has three voices, each with its own oscillator, pulse-width control, and ADSR envelope.

```c
#include <c64/sid.h>

void play_note(void)
{
    // Set master volume (0–15), no filter:
    sid.fmodevol = 15;

    // Voice 0: triangle wave, middle C (C4), fast attack, medium decay:
    sid.voices[0].freq   = NOTE_C(4);
    sid.voices[0].pwm    = 0;
    sid.voices[0].attdec = SID_ATK_8  | SID_DKY_24;
    sid.voices[0].susrel = 0x80       | SID_DKY_300;
    sid.voices[0].ctrl   = SID_CTRL_TRI | SID_CTRL_GATE;  // start note
}

void release_note(void)
{
    // Clear GATE bit — starts the release phase:
    sid.voices[0].ctrl = SID_CTRL_TRI;
}
```

### Waveform Bits (`ctrl` register)

| Constant | Waveform / Function |
|----------|---------------------|
| `SID_CTRL_GATE`  | Note on (set) / note off (clear) |
| `SID_CTRL_TRI`   | Triangle |
| `SID_CTRL_SAW`   | Sawtooth |
| `SID_CTRL_RECT`  | Pulse (square) |
| `SID_CTRL_NOISE` | Noise |

Waveforms can be combined — triangle+sawtooth gives a bright tone, noise alone gives percussion effects.

### Note Macros

`NOTE_x(octave)` macros produce the correct SID frequency register value for PAL systems:

```c
sid.voices[0].freq = NOTE_A(4);    // A4 ≈ 440 Hz (concert A)
sid.voices[1].freq = NOTE_CS(5);   // C# in octave 5
sid.voices[2].freq = NOTE_G(3);    // G in octave 3
```

Available: `NOTE_C`, `NOTE_CS`, `NOTE_D`, `NOTE_DS`, `NOTE_E`, `NOTE_F`, `NOTE_FS`, `NOTE_G`, `NOTE_GS`, `NOTE_A`, `NOTE_AS`, `NOTE_B`. Octave range 0–9.

### Envelope Constants

**Attack** (`SID_ATK_*`, upper nibble of `attdec`):

| Constant | Attack time |
|----------|------------|
| `SID_ATK_2` | 2 ms |
| `SID_ATK_8` | 8 ms |
| `SID_ATK_16` | 16 ms |
| `SID_ATK_100` | 100 ms |
| `SID_ATK_250` | 250 ms |
| `SID_ATK_500` | 500 ms |

**Decay / Release** (`SID_DKY_*`, lower nibble of `attdec` / `susrel`):

| Constant | Time |
|----------|------|
| `SID_DKY_6` | 6 ms |
| `SID_DKY_24` | 24 ms |
| `SID_DKY_300` | 300 ms |
| `SID_DKY_9000` | 9 s |

**Sustain level** is set in the upper nibble of `susrel` as a 4-bit value (0 = silence, 15 = maximum). Example: `0xF0` = full sustain.

### Playing a Simple Beep on Key Press

```c
#include <c64/sid.h>
#include <c64/charwin.h>

int main(void)
{
    sid.fmodevol = 15;

    CharWin w;
    cwin_init(&w, (char*)0x0400, 0, 0, 40, 25);
    cwin_clear(&w);
    cwin_putat_string(&w, 0, 0, "PRESS A KEY...", 14);

    while (true)
    {
        int key = cwin_getch();

        // Start note on any key
        sid.voices[0].freq   = NOTE_C(4);
        sid.voices[0].attdec = SID_ATK_8 | SID_DKY_24;
        sid.voices[0].susrel = 0x00       | SID_DKY_300;
        sid.voices[0].ctrl   = SID_CTRL_TRI | SID_CTRL_GATE;

        vic_waitFrames(4);   // hold note for ~4 frames (~80 ms on PAL)

        // Release
        sid.voices[0].ctrl = SID_CTRL_TRI;

        if (key == 3)   // RUN/STOP (PETSCII 3) exits
            break;
    }

    sid.fmodevol = 0;   // silence
    return 0;
}
```

---

Next: [Input and File I/O](c-io.md) · [Performance and Inline Assembly](c-performance.md)
