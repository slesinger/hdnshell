# Ultimate Audio — Register API

- **Author:** Gideon Zweijtzer (Gideon's Logic Architectures)
- **Version:** 0.2, October 26th 2012
- **Source:** `ultimate_audio_v0.2.pdf`
- **Copyright:** © 2012 Gideon's Logic Architectures. All rights reserved.

## 1. Introduction

### 1.1. Context

'Ultimate Audio' is a feature of the 1541 Ultimate-II module. It implements multi-channel audio
sample playback support from REU memory.

### 1.2. Features

- 7 independent channels
- 8 or 16 bit audio sample playback
- Sample rate up to 48 kHz
- Volume control per channel
- Panning control per channel
- "a-b" looping
- Interrupt generation

### 1.3. Purpose of this document

Describes the register-level programming API for 'Ultimate Audio', accessible from the cartridge
I/O range.

## 2. Registers

### 2.1. Overview

The functional block is mapped into C64 I/O space at `$DF20`–`$DFFF`. Mapping this block into
I/O space is optional and must be enabled in the "C64 and cartridge settings" menu. The I/O
space is only mapped when the selected cartridge emulation allows it — just like the REU
registers. Note: REU registers reside at `$DF00`–`$DF1F` when enabled (so Ultimate Audio and REU
register ranges do not overlap).

For 'Ultimate Audio' to generate output on the stereo jack, the audio output selection must also
be set correctly, in the "Audio settings" menu:
- Left Channel Output → "Sampler Left"
- Right Channel Output → "Sampler Right"

### 2.2. Register Read

Functional registers are **write-only**, just like the SID. Reading the I/O space yields the
interrupt status register or the module version.

| Address | Read Data                    | Default |
|---------|-------------------------------|---------|
| `$DF20` | Interrupt Status register     | `$00`   |
| `$DF21` | 'Ultimate Audio' version reg. | `$10`   |

### 2.3. Register Write

Each of the 7 audio channels occupies 32 consecutive bytes of I/O space:

| Channel | Channel Base Address |
|---------|-----------------------|
| 0       | `$DF20`               |
| 1       | `$DF40`               |
| 2       | `$DF60`               |
| 3       | `$DF80`               |
| 4       | `$DFA0`               |
| 5       | `$DFC0`               |
| 6       | `$DFE0`               |

### 2.4. The Audio Channel

Write-only registers, as offsets from each channel's base address:

| Offset      | Register                 | Default          |
|-------------|---------------------------|------------------|
| `$00`       | Control                   | `$00`            |
| `$01`       | Volume                    | `$3F`            |
| `$02`       | Pan                       | `$07`            |
| `$04`–`$07` | Sample Start Address      | `$01.00.00.00`   |
| `$09`–`$0B` | Sample Length             | `$01.00.00`      |
| `$0E`–`$0F` | Sample Rate               | 283 (`$01.1B`)   |
| `$11`–`$13` | Repeat point A            | `$00.80.00`      |
| `$15`–`$17` | Repeat point B            | `$00.C0.00`      |
| `$1F`       | Interrupt clear           | `$00`            |

**Note:** Multi-byte fields are **big endian** (high byte first), unlike native 6502 16-bit
pointers which are little endian. Since the interface is 8-bit only, this poses no practical
issue — each byte is loaded separately.

#### 2.4.1. Control register (offset `$00`)

| Bit 7 | Bit 6      | Bit 5 | Bit 4 | Bit 3 | Bit 2     | Bit 1  | Bit 0 |
|-------|------------|-------|-------|-------|-----------|--------|-------|
| —     | Interleave | Mode  | Mode  | —     | Interrupt | Repeat | Gate  |

- **Gate / Repeat:**
  - Simple mode (`repeat=0`): sample starts playing from the beginning when `gate` is set to 1,
    plays until the end or until `gate` is cleared. Clearing `gate` stops playback immediately.
  - Repeat mode (`repeat=1`): sample starts playing from the beginning when `gate` is set. When
    it reaches repeat point B while `gate` is still set, it reverts to point A. When `gate` is
    cleared, repeat point B is ignored and the sample plays out to the end — analogous to the
    SID's ADSR release phase.
- **Interrupt:** if set, an IRQ is generated when the end of sample is reached. Each channel has
  its own bit in the interrupt status register.
- **Mode** (format of sample data in memory):

  | Mode | Description               |
  |------|----------------------------|
  | `00` | 8-bit PCM                  |
  | `01` | 16-bit PCM (little endian) |
  | `10` | reserved                   |
  | `11` | reserved                   |

- **Interleave:** when set, the channel skips every other ("odd") sample — used for stereo
  samples stored interleaved in REU memory. A second channel can be programmed to read exactly
  the samples in between, producing a second (e.g. right) channel.

#### 2.4.2. Volume register (offset `$01`)

Output volume per channel, range 0–63. Low volumes might generate some noise (unresolved as of
this doc version).

#### 2.4.3. Pan register (offset `$02`)

Stereo position of the channel:
- `0` → hard left
- `7` or `8` → center
- `15` → hard right

#### 2.4.4. Sample start address register (offset `$04`–`$07`)

4-byte, big endian (MSB first). Holds the start address of the sample in the Ultimate-II's SDRAM
memory. The upper (most significant) byte must always be `$01` — the REU memory base address is
`$01.00.00.00`.

#### 2.4.5. Sample length register (offset `$09`–`$0B`)

Length of the sample in bytes. Max length: 16 MB (the complete REU memory). The length comparison
happens on every sample read. **Important:** for 16-bit samples, the length must be a multiple of
2, otherwise the end condition is never met and the sample plays forever (including garbage past
the intended data).

#### 2.4.6. Sample rate register (offset `$0E`–`$0F`)

A **divider** register. Sample rate is derived from a 6.25 MHz reference clock:
`sample_rate = 6.25 MHz / divider` (approximately).

| Sample rate (Hz) | Divider |
|-------------------|---------|
| 8000               | 781     |
| 11025              | 567     |
| 16000              | 391     |
| 22050              | 281     |
| 32000              | 195     |
| 44100              | 142     |
| 48000              | 130     |

This register can be safely updated while the sample is playing — useful for effects like pitch
modulation.

**Note pitch table** (middle A = 440 Hz sampled at 32 kHz; divider values and resulting error
for playing back at other pitches):

| Note | Divider | Frequency (Hz) | Error |
|------|---------|-----------------|-------|
| A2   | 391     | 219.8           | -0.1% |
| A#2  | 369     | 232.9           | -0.1% |
| B2   | 348     | 246.9           | 0.0%  |
| C3   | 328     | 262.0           | 0.1%  |
| C#3  | 310     | 277.2           | 0.0%  |
| D3   | 293     | 293.3           | -0.1% |
| D#3  | 276     | 311.4           | 0.1%  |
| E3   | 261     | 329.3           | -0.1% |
| F3   | 246     | 349.3           | 0.0%  |
| F#3  | 232     | 370.4           | 0.1%  |
| G3   | 219     | 392.4           | 0.1%  |
| G#3  | 207     | 415.2           | 0.0%  |
| A3   | 195     | 440.7           | 0.2%  |
| A#3  | 184     | 467.1           | 0.2%  |
| B3   | 174     | 493.9           | 0.0%  |
| C4   | 164     | 524.0           | 0.1%  |
| C#4  | 155     | 554.4           | 0.0%  |
| D4   | 146     | 588.6           | 0.2%  |
| D#4  | 138     | 622.7           | 0.1%  |
| E4   | 130     | 661.1           | 0.3%  |
| F4   | 123     | 698.7           | 0.0%  |
| F#4  | 116     | 740.8           | 0.1%  |
| G4   | 110     | 781.3           | -0.3% |
| G#4  | 103     | 834.3           | 0.4%  |
| A4   | 98      | 876.9           | -0.4% |

#### 2.4.7. Sample repeat point registers (offset `$11`–`$17`)

- Repeat point A (`$11`–`$13`): position the sequencer returns to when reaching point B, as long
  as `repeat=1` and `gate=1`.
- Repeat point B (`$15`–`$17`): position at which the sequencer wraps back to point A.

```
0                A          B                          length
o----------------|----------|--------------------------o
                  \___loop back when repeat=1 & gate=1__/
```

#### 2.4.8. Interrupt clear register (offset `$1F`)

Clears the IRQ condition of the channel (set when the sample reaches its end).
- Write `1` to bit 0 → clears the IRQ of **this** channel.
- Write `$FF` → clears the IRQ of **all** channels.
