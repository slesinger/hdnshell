# C64 Ultimate 3D game — chunky-to-multicolor converter design

Date: 2026-07-03
Target: C64 Ultimate, CPU turbo (budgets computed at 48 MHz — official U64 max; scale down if 64 MHz really available)

## Overview

The 3D pipeline's final stage transforms a 160×176 byte-per-pixel logical framebuffer
("the matrix") into VIC-II multicolor bitmap graphics (bitmap + screen RAM + color RAM),
double-buffered at 25 fps. The design avoids per-cell color quantization entirely by
baking palette discipline into the texture format, so the converter is a pure
table-driven packing loop with ordered dithering at zero runtime cost.

## Matrix byte format

```
bit:  7 6 5 4   3 2 1 0
      ramp id   intensity
      (0-15)    (0-15)
```

- **Ramp (material) id** — one of 16 predefined 3-color luminance ramps. Every ramp
  implicitly starts at **black**, which is the global multicolor background ($D021).
  Examples: stone = black→dk.grey→grey→lt.grey, fire = black→red→orange→yellow.
- **Intensity** — brightness 0..15 along the ramp. Levels 0/5/10/15 are the 4 pure
  colors; in-betweens render as ordered 4×4 Bayer blends of the two neighboring ramp
  colors. 16 perceived shades per material.
- **No depth in the byte.** Polygons are sorted back-to-front (painter's / BSP for
  corridors). If per-pixel flags are ever needed, drop to 8 ramps and free bit 7.

### Why this wins

- **Shading (lit / standard / dark tunnel)** is an intensity transform, pre-baked as
  3 texture variants stored in REU. Zero cycles at rasterization and conversion time.
  Low intensity fades to black → depth cueing / tunnel darkness for free.
- **Texel averaging** (from UV sampling): average the intensity nibbles, keep the ramp.
- **Graceful degradation**: the converter picks ONE ramp per 4×8 cell (sampled from a
  center pixel) and writes its 3 colors to screen/color RAM. Wrong-ramp pixels in the
  cell still map by intensity → right luminance, wrong hue — the error the eye forgives
  most (luminance sensitivity ≫ chroma sensitivity at high spatial frequency).
  No branching, constant time, no attribute garbage.

## Matrix layout (load-bearing decision)

Cell-major, page-aligned: cell n at `MATRIX + n*32`, within a cell `offset = row*4 + px`.
880 cells = exactly 110 pages. This lets the converter use static `ldy MATRIX+ofs,x`
addressing with only 32 operand high-bytes patched per 8 cells.

Rasterizer consequence: span stepping is `+1, +1, +1, +29` (offset x&3 wraps every 4 px).
Structure fills as head-pixels / whole-cells-of-4 / tail-pixels. Pixel address:
`rowLo/Hi[y] + xOfsLo/Hi[x]` (tables provided below). No frame clear needed if the
scene always overdraws (floor + ceiling/sky polygons).

## Converter mechanics

- 16 lookup tables of 256 bytes (4 pixel positions × 4 Bayer rows) map a raw matrix
  byte directly to a pre-shifted 2-bit pattern — dither, bit position and code
  collapse into one `ldy buf,x : ora tab,y` = 8 cycles/pixel.
- Per-cell attributes: sample pixel at cell offset 13 (row 3, px 1), look up
  screen-RAM byte (`c1<<4|c2`) and color-RAM byte (`c3`) from 256-byte ramp tables.
- Bit codes: %00 = background (black), %01 = screen hi nibble, %10 = screen lo nibble,
  %11 = color RAM.

**Budget: ~415 cycles/cell × 880 ≈ 380k cycles ≈ 8 ms @48 MHz ≈ 20% of a 25 fps frame.**

## Double buffering

Two bitmap+screen pairs in VIC banks 2 and 3, flipped via $DD00/$D018 at vblank.
Color RAM cannot be double-buffered → converter writes a staging buffer (COLBUF)
that is burst-copied to $D800 right after the flip (~7k cycles, fits in vblank).

Memory map:

```
$1000-$7DFF  MATRIX (28160 B, 110 pages)
$8000-$83FF  SCREEN0            (VIC bank 2)
$8400-$95FF  tables (dither 4KB + attr 512B + helpers)
$A000-$BF3F  BITMAP0            (VIC bank 2)
$C000-$C3FF  SCREEN1            (VIC bank 3)
$C400-$C7FF  COLBUF (color-RAM staging)
$E000-$FF3F  BITMAP1 (under Kernal ROM — write-only, fine)
```

Screens/bitmaps deliberately avoid $9000-$9FFF (char-ROM shadow in VIC bank 2).
Bottom 3 char rows (rows 22-24) of each bitmap/screen are free for a HUD.

## REU usage

- Textures stored as 3 pre-shaded variants (lit/standard/dark = intensity remap,
  optionally hue-shifted); DMA in the set for the current zone at load time.
- **Open item:** verify whether U64 REU DMA speed scales with CPU turbo or stays at
  ~1 byte/µs before relying on DMA in any per-frame path.

## Tuning knobs (assembly-time data, no code changes)

- The 16 ramps (current set is placeholder art direction).
- The Bayer matrix — with 2:1 pixel aspect, a pattern alternating more between
  scanlines than between columns looks smoother.
- Upgrade option: majority-of-4 ramp sampling instead of single-pixel
  (~25 extra cycles/cell, kills edge-cell attribute flicker).

## Code (KickAssembler)

```asm
//============================================================
//  chunky2mc.asm — 160x176 chunky buffer -> VIC-II multicolor
//  C64 Ultimate @ turbo, 25 fps double-buffered
//
//  Matrix byte format: %rrrriiii  (ramp 0-15, intensity 0-15)
//  Matrix layout: cell-major. cell n at MATRIX+n*32,
//                 within cell: offset = row*4 + px
//============================================================

.const MATRIX  = $1000
.const SCREEN0 = $8000
.const BITMAP0 = $a000
.const SCREEN1 = $c000
.const BITMAP1 = $e000
.const COLBUF  = $c400

.const zTmp    = $40        // $40-$47: 8 packed bytes of current cell
.const matPage = $48        // current matrix page (hi byte)
.const pageCnt = $49
.const backBuf = $4a        // 0 or 1: which buffer is being drawn INTO

//------------------------------------------------------------
// Assembly-time tables
//------------------------------------------------------------
.var bayer = List().add(
    List().add( 0, 8, 2,10),
    List().add(12, 4,14, 6),
    List().add( 3,11, 1, 9),
    List().add(15, 7,13, 5))

// 16 ramps: 3 colors each, luminance-ascending. %00 is always black.
// code %01 -> screen hi nibble, %10 -> screen lo nibble, %11 -> color RAM
.var ramps = List()
.eval ramps.add(List().add($b,$c,$f))   //  0 stone   dgrey grey lgrey
.eval ramps.add(List().add($9,$8,$7))   //  1 wood    brown orange yellow
.eval ramps.add(List().add($2,$a,$7))   //  2 flesh   red lred yellow
.eval ramps.add(List().add($6,$e,$3))   //  3 sky     blue lblue cyan
.eval ramps.add(List().add($9,$5,$d))   //  4 moss    brown green lgreen
.eval ramps.add(List().add($6,$4,$a))   //  5 violet  blue purple lred
.eval ramps.add(List().add($b,$c,$1))   //  6 metal   dgrey grey white
.eval ramps.add(List().add($2,$8,$7))   //  7 fire    red orange yellow
.for (var r=8; r<16; r++) .eval ramps.add(List().add($b,$c,$f)) // spare

// intensity(0-15) + Bayer threshold -> 2-bit code 0..3
.function dcode(v, px, row) {
    .var t = bayer.get(row).get(px)
    .return min(floor(v/5.0 + (t+0.5)/16.0), 3)
}

.pc = $8400 "tables"
ditherTabs:                 // 16 x 256B: [px 0-3][bayer row 0-3]
.for (var px=0; px<4; px++) {
    .for (var row=0; row<4; row++) {
        .fill 256, dcode(i&15, px, row) << [6 - px*2]
    }
}
scrTab: .fill 256, [ramps.get(i>>4).get(0)<<4] | ramps.get(i>>4).get(1)
colTab: .fill 256, ramps.get(i>>4).get(2)

// rasterizer helpers: pixel(x,y) = rowLo/Hi[y] + xOfsLo/Hi[x]
// (stepping x by 1: +1, except every 4th pixel: +29)
rowLo:  .fill 176, <[MATRIX + floor(i/8)*1280 + mod(i,8)*4]
rowHi:  .fill 176, >[MATRIX + floor(i/8)*1280 + mod(i,8)*4]
xOfsLo: .fill 160, <[floor(i/4)*32 + mod(i,4)]
xOfsHi: .fill 160, >[floor(i/4)*32 + mod(i,4)]

//------------------------------------------------------------
// Converter: ~415 cycles/cell, ~380k cycles total
//------------------------------------------------------------
.var fetchHiOps = List()    // operand hi-bytes patched per matrix page
.var bmpHiOps   = List()    // sta operand hi-bytes bumped per bitmap page

.pc = $0801 "code"
:BasicUpstart2(demo)

convert:
        jsr initFrame
        lda #>MATRIX
        sta matPage
        lda #110
        sta pageCnt
pageLoop:
        jsr patchMatrixPage         // 32+1 fetch hi-bytes := matPage
        ldx #0                      // X = (cell & 7) * 32
cellLoop:
        // ---- pack 8 bitmap bytes: 8 cycles/pixel, dither included ----
        .for (var s=0; s<8; s++) {
            .for (var j=0; j<4; j++) {
                .eval fetchHiOps.add(*+2)
                ldy MATRIX + s*4 + j, x
                .if (j==0) lda ditherTabs + [j*4 + mod(s,4)]*256, y
                .if (j!=0) ora ditherTabs + [j*4 + mod(s,4)]*256, y
            }
            sta zTmp+s
        }
        // ---- attributes: sample pixel (row 3, px 1) picks the ramp ----
        .eval fetchHiOps.add(*+2)
        ldy MATRIX + 13, x
        lda scrTab,y
scrSta: sta SCREEN0                 // self-mod, ++ per cell
        lda colTab,y
colSta: sta COLBUF                  // self-mod, ++ per cell
        // ---- store to bitmap: cell n -> BITMAP + n*8 ----
bmY:    ldy #0                      // self-mod imm: (cell*8) & $ff
        .for (var s=0; s<8; s++) {
            lda zTmp+s
            .eval bmpHiOps.add(*+2)
            sta BITMAP0 + s, y
        }
        // ---- advance self-modified pointers ----
        inc scrSta+1
        bne !+
        inc scrSta+2
!:      inc colSta+1
        bne !+
        inc colSta+2
!:      lda bmY+1
        clc
        adc #8
        sta bmY+1
        bcc !+
        jsr bumpBmpPage             // every 32 cells
!:      txa
        clc
        adc #32
        tax
        beq pageDone                // 8 cells done -> next matrix page
        jmp cellLoop
pageDone:
        inc matPage
        dec pageCnt
        beq done
        jmp pageLoop
done:   rts

patchMatrixPage:
        lda matPage
        .for (var k=0; k<fetchHiOps.size(); k++) sta fetchHiOps.get(k)
        rts

bumpBmpPage:
        .for (var k=0; k<8; k++) inc bmpHiOps.get(k)
        rts

initFrame:                          // aim all self-mod ops at the back buffer
        lda #0
        sta bmY+1
        sta scrSta+1
        sta colSta+1
        lda #>COLBUF
        sta colSta+2
        lda backBuf
        bne !b1+
        lda #>SCREEN0
        sta scrSta+2
        lda #>BITMAP0
        jmp !set+
!b1:    lda #>SCREEN1
        sta scrSta+2
        lda #>BITMAP1
!set:   .for (var k=0; k<8; k++) sta bmpHiOps.get(k)
        rts

//------------------------------------------------------------
// Flip at vblank + burst color RAM (call after convert)
//------------------------------------------------------------
flip:
        lda #251                    // wait for bottom border
!:      cmp $d012
        bne !-
        lda backBuf                 // show the buffer we just filled
        bne !b1+
        lda #%01                    // VIC bank 2 ($8000)
        ldy #$08                    // screen $8000, bitmap $a000
        jmp !go+
!b1:    lda #%00                    // VIC bank 3 ($c000)
        ldy #$08                    // screen $c000, bitmap $e000
!go:    ora #%10101100              // keep CIA2 upper bits (adjust to yours)
        sta $dd00
        sty $d018
        ldx #0                      // COLBUF -> $d800 (880 bytes)
!:      lda COLBUF,x
        sta $d800,x
        lda COLBUF+$100,x
        sta $d900,x
        lda COLBUF+$200,x
        sta $da00,x
        inx
        bne !-
!:      lda COLBUF+$300,x
        sta $db00,x
        inx
        cpx #112
        bne !-
        lda backBuf                 // swap
        eor #1
        sta backBuf
        rts

demo:   sei
        lda #$3b                    // bitmap mode on
        sta $d011
        lda #$18                    // multicolor on
        sta $d016
        lda #0                      // global background = black
        sta $d021
        sta backBuf
mainLoop:
        // ... 3D render into MATRIX here (25 fps: every 2nd frame) ...
        jsr convert
        jsr flip
        jmp mainLoop
```

## Frame flow

1. Render polygons into MATRIX (painter's order, pre-shaded texel bytes).
2. `jsr convert` — fills back bitmap + back screen + COLBUF.
3. `jsr flip` — waits vblank, switches $DD00/$D018, burst-copies COLBUF→$D800, toggles backBuf.
