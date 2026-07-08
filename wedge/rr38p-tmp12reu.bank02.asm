// Disassembly for rr38p-tmp12reu.bin bank 2
// Bank file offset: $4000-$5FFF
// Cartridge window: $8000-$9FFF
// Vectors: coldstart=$8036, warmstart=$8039, signature=c3 c2 cd 38 30
// Reachable instructions: 14 bytes decoded as code: 33
// Entry points: $8036, $8039
// Jump table from cold start:
//   $8036 -> $FCEF
// External branch/jsr/jmp targets: $DEE4, $E518, $F6BC, $F6ED, $FCEF, $FDA3, $FE72

// Symbol table (auto-generated)
//   $8036 bank02_cold_start
//   $8039 bank02_warm_start
//   $8044 bank02_sub_8044
//   $FCEF bank02_api_00

// External symbol equates
.const bank02_api_00 = $FCEF

.pc = $8000

// $8000: cartridge header: cold/warm start vectors + CBM80 signature
    .byte $36, $80, $39, $80, $C3, $C2, $CD, $38, $30    // data $8000  cold=$8036 warm=$8039 'CBM80'
// --- $8009: API jump table (called cross-bank from other banks)
    jmp b02_8DE4           // 4C E4 8D
b02_800C:
    jmp b02_8832           // 4C 32 88
    jmp $9f99              // 4C 99 9F
    jmp b02_8A91           // 4C 91 8A
    jmp b02_9F96           // 4C 96 9F
    jmp b02_8A99           // 4C 99 8A
    jmp b02_8A37           // 4C 37 8A
    jmp b02_8232           // 4C 32 82
b02_8021:
    jsr b02_96E0           // 20 E0 96
b02_8024:
    jmp b02_81E7           // 4C E7 81
    jmp b02_8BF8           // 4C F8 8B
    jmp b02_95B7           // 4C B7 95
    jmp b02_9763           // 4C 63 97
    jmp b02_9F52           // 4C 52 9F
    jmp b02_8808           // 4C 08 88
    jmp $fcef              // 4C EF FC
    jsr $f6bc              // 20 BC F6
    jsr $f6ed              // 20 ED F6
    beq b02_8044           // F0 03
    jmp $fe72              // 4C 72 FE
b02_8044:
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr $e518              // 20 18 E5   KERNAL screen init
    lda #$e3               // A9 E3
    pha                    // 48
    lda #$7a               // A9 7A
    pha                    // 48
    lda $deef              // AD EF DE
    pha                    // 48
    jmp $dee4              // 4C E4 DE
    bit $dc01              // 2C 01 DC   CIA1 port B (keyboard rows / joy1)
    bmi b02_8070           // 30 14
    lda $1d                // A5 1D
    and #$03               // 29 03
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    ldx #$80               // A2 80
b02_8065:
    dey                    // 88
    bne b02_8065           // D0 FD
    dex                    // CA
    bne b02_8065           // D0 FA
    lda #$80               // A9 80
    jmp b02_8644           // 4C 44 86
b02_8070:
    rti                    // 40
b02_8071:
    lda #$6f               // A9 6F
b02_8073:
    sta $9e                // 85 9E
    stx $9f                // 86 9F
    ldx #$03               // A2 03
b02_8079:
    lda #$00               // A9 00
    sta $90                // 85 90   KERNAL I/O status
    lda $ba                // A5 BA   current device
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    lda $9e                // A5 9E
    jsr $ff93              // 20 93 FF   KERNAL SECOND
    lda $90                // A5 90   KERNAL I/O status
    asl                    // 0A
    bcc b02_8093           // 90 07
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    dex                    // CA
    bne b02_8079           // D0 E7
    sec                    // 38
b02_8093:
    ldx $9f                // A6 9F
b02_8095:
    rts                    // 60
b02_8096:
    ldy #$af               // A0 AF
    bit $9d                // 24 9D   KERNAL msg mode
    bpl b02_8095           // 10 F9
    lda #$20               // A9 20
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$24               // A9 24
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr b02_80AA           // 20 AA 80
    dey                    // 88
b02_80AA:
    lda $0000,y            // B9 00 00
    .byte $48, $4A, $4A, $4A, $4A, $20    // data $80AD  text: "HJJJJ "
    clv                    // B8
    .byte $80    // 80  undocumented/illegal at $80B4
    pla                    // 68
    and #$0f               // 29 0F
    clc                    // 18
    adc #$30               // 69 30
    cmp #$3a               // C9 3A
    bcc b02_80C1           // 90 02
    adc #$06               // 69 06
b02_80C1:
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
b02_80C4:
    ldy #$93               // A0 93
b02_80C6:
    lda $80e1,y            // B9 E1 80
    sta $00ff,y            // 99 FF 00
    dey                    // 88
    bne b02_80C6           // D0 F7
    sty $90                // 84 90   KERNAL I/O status
    lda $93                // A5 93
    beq b02_80DF           // F0 0A
    lda #$d0               // A9 D0
    sta $017e              // 8D 7E 01
    lda #$08               // A9 08
    sta $017f              // 8D 7F 01
b02_80DF:
    jmp $0100              // 4C 00 01
    jsr $013d              // 20 3D 01
    tay                    // A8
    jsr $013d              // 20 3D 01
    jsr $013d              // 20 3D 01
    dey                    // 88
    dey                    // 88
    tya                    // 98
b02_80EF:
    cmp #$ff               // C9 FF
    beq b02_8109           // F0 16
    sta $24                // 85 24
    ldy #$00               // A0 00
    jsr $0140              // 20 40 01
    tya                    // 98
    clc                    // 18
    adc $ae                // 65 AE   load end addr lo
    sta $ae                // 85 AE   load end addr lo
    bcc b02_8104           // 90 02
    inc $af                // E6 AF   load end addr hi
b02_8104:
    jsr $013d              // 20 3D 01
    bne b02_80EF           // D0 E6
b02_8109:
    asl                    // 0A
    php                    // 08
    lda $b8                // A5 B8   logical file#
    sta $b9                // 85 B9   secondary addr
    jsr $f642              // 20 42 F6
    plp                    // 28
    lda #$00               // A9 00
    ror                    // 6A
    ora $90                // 05 90   KERNAL I/O status
    sta $90                // 85 90   KERNAL I/O status
    ldx $ae                // A6 AE   load end addr lo
    ldy $af                // A4 AF   load end addr hi
    rts                    // 60
    lda #$60               // A9 60
    bit $e6a9              // 2C A9 E6
    sta $017c              // 8D 7C 01
    nop                    // EA
b02_8128:
    ldx $a9                // A6 A9
b02_812A:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_812A           // 50 FB
    sec                    // 38
b02_8130:
    lda $d012              // AD 12 D0   VIC raster
    sbc $aa                // E5 AA
    bcc b02_813B           // 90 04
    and #$07               // 29 07
    beq b02_8130           // F0 F5
b02_813B:
    lda $a8                // A5 A8
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    bit $1f                // 24 1F
    bmi b02_8147           // 30 03
    bit $80                // 24 80
    nop                    // EA
b02_8147:
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    eor $dd00              // 4D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    eor $dd00              // 4D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    eor $dd00              // 4D 00 DD   CIA2 port A (VIC bank, IEC lines)
    stx $dd00              // 8E 00 DD   CIA2 port A (VIC bank, IEC lines)
    eor $a8                // 45 A8
    rts                    // 60
    ora ($91,x)            // 01 91
    ldx $01c6              // AE C6 01
    iny                    // C8
    dec $24                // C6 24
    bne b02_812A           // D0 C1
    rts                    // 60
    eor ($ae),y            // 51 AE
    beq $8162              // F0 F4
    lda #$30               // A9 30
    sta $90                // 85 90   KERNAL I/O status
    bne $8162              // D0 EE
    nop                    // EA
b02_8175:
    ldy #$ff               // A0 FF
b02_8177:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_8177           // 50 FB
    bvs b02_8188           // 70 0A
b02_817E:
    ldy #$00               // A0 00
b02_8180:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_8180           // 50 FB
b02_8185:
    lda ($22),y            // B1 22
    nop                    // EA
b02_8188:
    pha                    // 48
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    tax                    // AA
    sec                    // 38
b02_818F:
    lda $d012              // AD 12 D0   VIC raster
    sbc $aa                // E5 AA
    bcc b02_819A           // 90 04
    and #$07               // 29 07
    beq b02_818F           // F0 F5
b02_819A:
    lda $a8                // A5 A8
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $81c8,x            // BD C8 81
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    and #$f7               // 29 F7
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    pla                    // 68
    and #$0f               // 29 0F
    tax                    // AA
    lda $81c8,x            // BD C8 81
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    and #$f7               // 29 F7
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $a9                // A5 A9
    nop                    // EA
    nop                    // EA
    iny                    // C8
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    bne b02_8185           // D0 BE
    rts                    // 60
    .byte $07, $87, $27, $A7, $47, $C7, $67, $E7, $17, $97, $37, $B7, $57, $D7, $77, $F7    // data $81C8  "..'.G.....7.W..."
b02_81D8:
    lda #$6f               // A9 6F
b02_81DA:
    pha                    // 48
    lda $ba                // A5 BA   current device
    jsr $ffb4              // 20 B4 FF   KERNAL TALK
    pla                    // 68
    jsr $ff96              // 20 96 FF   KERNAL TKSA
    jmp $ffa5              // 4C A5 FF   KERNAL ACPTR: serial byte in
b02_81E7:
    jsr b02_8071           // 20 71 80
    bcs b02_8215           // B0 29
    jsr b02_81D8           // 20 D8 81
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    ldx $ab                // A6 AB
    sta $ab                // 85 AB
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    pha                    // 48
b02_81FE:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    cmp #$0d               // C9 0D
    bne b02_81FE           // D0 F6
    jsr $ffab              // 20 AB FF   KERNAL UNTLK
    pla                    // 68
    and #$0f               // 29 0F
    ora $ab                // 05 AB
    stx $ab                // 86 AB
    cmp #$02               // C9 02
    rts                    // 60
b02_8215:
    lda #$1f               // A9 1F
    ldy #$82               // A0 82
    jsr $ab1e              // 20 1E AB
    jmp $f707              // 4C 07 F7
    .byte $44, $45, $56, $49, $43, $45, $20, $4E, $4F, $54, $20, $50, $52, $45, $53, $45    // data $821F  text: "DEVICE NOT PRESE"
    .byte $4E, $54, $00    // data $822F  text: "NT."
b02_8232:
    dec $8f                // C6 8F
    bpl b02_8264           // 10 2E
    lda $0288              // AD 88 02   screen memory page
b02_8239:
    clc                    // 18
    adc #$04               // 69 04
    sta $23                // 85 23
    sta $25                // 85 25
    lda #$28               // A9 28
    sta $24                // 85 24
    lda #$00               // A9 00
    sta $22                // 85 22
    ldx #$04               // A2 04
    ldy #$bf               // A0 BF
b02_824C:
    dec $23                // C6 23
    dec $25                // C6 25
b02_8250:
    lda ($22),y            // B1 22
    sta ($24),y            // 91 24
    dey                    // 88
    cpy #$ff               // C0 FF
    bne b02_8250           // D0 F7
    dex                    // CA
    bne b02_824C           // D0 F0
    lda #$d8               // A9 D8
    cmp $23                // C5 23
    bne b02_8239           // D0 D7
    inc $8f                // E6 8F
b02_8264:
    ldx $8f                // A6 8F
    rts                    // 60
b02_8267:
    lda $0203              // AD 03 02
    ldx $0202              // AE 02 02
    sta $af                // 85 AF   load end addr hi
    stx $ae                // 86 AE   load end addr lo
b02_8271:
    ldy $b9                // A4 B9   secondary addr
    bne b02_827D           // D0 08
    ldy $c3                // A4 C3
    sty $ae                // 84 AE   load end addr lo
    ldy $c4                // A4 C4
    sty $af                // 84 AF   load end addr hi
b02_827D:
    stx $c3                // 86 C3
    sta $c4                // 85 C4
    lda $af                // A5 AF   load end addr hi
    cmp #$03               // C9 03
    beq b02_8289           // F0 02
    bcs b02_8294           // B0 0B
b02_8289:
    lda $ae                // A5 AE   load end addr lo
    cmp #$34               // C9 34
    bcs b02_8294           // B0 05
    lda #$ff               // A9 FF
    sta $90                // 85 90   KERNAL I/O status
    rts                    // 60
b02_8294:
    lda $0288              // AD 88 02   screen memory page
    pha                    // 48
    lda $0286              // AD 86 02   current text color
    pha                    // 48
    lda $0a                // A5 0A
    sta $0288              // 8D 88 02   screen memory page
    lda $09                // A5 09
    sta $0286              // 8D 86 02   current text color
    jsr $f5d2              // 20 D2 F5
    jsr b02_8096           // 20 96 80
    pla                    // 68
    sta $0286              // 8D 86 02   current text color
    pla                    // 68
    sta $0288              // 8D 88 02   screen memory page
    sec                    // 38
    rts                    // 60
b02_82B6:
    lda #$00               // A9 00
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
b02_82BB:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_82BB           // 50 FB
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_82C8           // 50 03
    bit $80                // 24 80
    nop                    // EA
b02_82C8:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvs b02_82CF           // 70 02
    bit $80                // 24 80
b02_82CF:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvs b02_82D4           // 70 00
b02_82D4:
    ldy #$00               // A0 00
b02_82D6:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvs b02_82DD           // 70 02
    bit $80                // 24 80
b02_82DD:
    nop                    // EA
    bit $80                // 24 80
    cmp #$80               // C9 80
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    nop                    // EA
    nop                    // EA
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $0200,y            // 99 00 02   BASIC input buffer
    cmp #$ea               // C9 EA
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    nop                    // EA
    iny                    // C8
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $0200,y            // 99 00 02   BASIC input buffer
    cmp #$ea               // C9 EA
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    nop                    // EA
    iny                    // C8
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $0200,y            // 99 00 02   BASIC input buffer
    cmp #$ea               // C9 EA
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    nop                    // EA
    iny                    // C8
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lsr                    // 4A
    lsr                    // 4A
    ora $dd00              // 0D 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $0200,y            // 99 00 02   BASIC input buffer
    iny                    // C8
    beq b02_834A           // F0 03
    jmp b02_82D6           // 4C D6 82
b02_834A:
    lda $a9                // A5 A9
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    jsr b02_8128           // 20 28 81
b02_8352:
    eor $0200,y            // 59 00 02   BASIC input buffer
    eor $0280,y            // 59 80 02
    iny                    // C8
    bpl b02_8352           // 10 F7
    cmp #$00               // C9 00
    rts                    // 60
b02_835E:
    ldx $b9                // A6 B9   secondary addr
    jsr $deac              // 20 AC DE
    lda $b8                // A5 B8   logical file#
    jsr b02_8A65           // 20 65 8A
    bcs b02_8380           // B0 16
    lda $b8                // A5 B8   logical file#
    jsr b02_81DA           // 20 DA 81
    sta $ae                // 85 AE   load end addr lo
    lda $90                // A5 90   KERNAL I/O status
    lsr                    // 4A
    lsr                    // 4A
    bcs b02_8380           // B0 09
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $af                // 85 AF   load end addr hi
    stx $b9                // 86 B9   secondary addr
    ldx $ae                // A6 AE   load end addr lo
b02_8380:
    rts                    // 60
b02_8381:
    lda #$12               // A9 12
    ldx #$01               // A2 01
    sta $21                // 85 21
    stx $22                // 86 22
b02_8389:
    bit $1f                // 24 1F
    bmi b02_83C3           // 30 36
    ldx #$00               // A2 00
    jsr b02_9FE9           // 20 E9 9F
b02_8392:
    jsr b02_8095           // 20 95 80
    ldy #$15               // A0 15
    lda #$ff               // A9 FF
b02_8399:
    sta $0114,y            // 99 14 01
    dey                    // 88
    bne b02_8399           // D0 FA
    sty $11                // 84 11
    jsr b02_8128           // 20 28 81
    cmp #$16               // C9 16
    bcs b02_83C2           // B0 1A
    sta $13                // 85 13
b02_83AA:
    jsr b02_8128           // 20 28 81
    cmp #$15               // C9 15
    bcs b02_83BF           // B0 0E
    sta $0c                // 85 0C
    jsr b02_82B6           // 20 B6 82
    beq b02_83B9           // F0 01
    tya                    // 98
b02_83B9:
    jsr b02_83E1           // 20 E1 83
    jmp b02_83AA           // 4C AA 83
b02_83BF:
    lda #$00               // A9 00
    clc                    // 18
b02_83C2:
    rts                    // 60
b02_83C3:
    rts                    // 60
b02_83C4:
    lda #$80               // A9 80
    jsr b02_9FEB           // 20 EB 9F
    jsr b02_8128           // 20 28 81
    bpl b02_83D4           // 10 06
    dec $d020              // CE 20 D0   VIC border color
    jmp $863d              // 4C 3D 86
b02_83D4:
    pha                    // 48
    ldy #$00               // A0 00
b02_83D7:
    jsr b02_8128           // 20 28 81
    sta $0200,y            // 99 00 02   BASIC input buffer
    iny                    // C8
    bne b02_83D7           // D0 F7
    pla                    // 68
b02_83E1:
    sta $24                // 85 24
    bne b02_8401           // D0 1C
    inc $11                // E6 11
    lda $1c                // A5 1C
    bne b02_8401           // D0 16
    ldx $0c                // A6 0C
    cpx $22                // E4 22
    bne b02_8401           // D0 10
    inc $1c                // E6 1C
    jsr b02_8267           // 20 67 82
    lda $ae                // A5 AE   load end addr lo
    sec                    // 38
    sbc #$04               // E9 04
    sta $ae                // 85 AE   load end addr lo
    bcs b02_8401           // B0 02
    dec $af                // C6 AF   load end addr hi
b02_8401:
    ldx $0c                // A6 0C
    cpx #$16               // E0 16
    bcs b02_8417           // B0 10
    lda $0200              // AD 00 02   BASIC input buffer
    and #$7f               // 29 7F
    ora $24                // 05 24
    sta $0115,x            // 9D 15 01
    lda $0201              // AD 01 02
    sta $012a,x            // 9D 2A 01
b02_8417:
    ldy #$00               // A0 00
    sty $0f                // 84 0F
    lda $0c                // A5 0C
    clc                    // 18
    adc $0e                // 65 0E
    sta $10                // 85 10
    jmp $013f              // 4C 3F 01
b02_8425:
    ldy #$ff               // A0 FF
b02_8427:
    iny                    // C8
    sty $12                // 84 12
b02_842A:
    ldy $12                // A4 12
    ldx $22                // A6 22
    lda $0115,x            // BD 15 01
    bpl b02_843F           // 10 0C
    inc $d020              // EE 20 D0   VIC border color
    jsr b02_83C4           // 20 C4 83
    dec $d020              // CE 20 D0   VIC border color
    jmp b02_842A           // 4C 2A 84
b02_843F:
    txa                    // 8A
    sta $0100,y            // 99 00 01
    lda $012a,x            // BD 2A 01
    sta $22                // 85 22
    lda $0115,x            // BD 15 01
    cmp $21                // C5 21
    beq b02_8427           // F0 D8
    sta $21                // 85 21
    tay                    // A8
    beq b02_8457           // F0 03
    jsr b02_9FE9           // 20 E9 9F
b02_8457:
    sty $11                // 84 11
b02_8459:
    ldy $11                // A4 11
    inc $11                // E6 11
    lda $0100,y            // B9 00 01
    tay                    // A8
    clc                    // 18
    adc $0e                // 65 0E
    sta $10                // 85 10
    lda $0115,y            // B9 15 01
    bne b02_8472           // D0 07
    ldx $012a,y            // BE 2A 01
    inx                    // E8
    stx $0187              // 8E 87 01
b02_8472:
    jsr b02_84A2           // 20 A2 84
    sec                    // 38
    sbc $0d                // E5 0D
    jsr b02_8498           // 20 98 84
    lda #$02               // A9 02
    cmp $0d                // C5 0D
    sta $0d                // 85 0D
    bcs b02_8486           // B0 03
    jsr b02_8498           // 20 98 84
b02_8486:
    dec $12                // C6 12
    bpl b02_8459           // 10 CF
    lda $21                // A5 21
    beq b02_8496           // F0 08
    jsr b02_8392           // 20 92 83
    bmi b02_8496           // 30 03
    jmp b02_8425           // 4C 25 84
b02_8496:
    lda #$02               // A9 02
b02_8498:
    clc                    // 18
    adc $ae                // 65 AE   load end addr lo
    sta $ae                // 85 AE   load end addr lo
    bcc b02_84A1           // 90 02
    inc $af                // E6 AF   load end addr hi
b02_84A1:
    rts                    // 60
b02_84A2:
    ldy $0d                // A4 0D
    tax                    // AA
    beq b02_84C3           // F0 1C
    lda $93                // A5 93
    bne b02_84C3           // D0 18
    lda $af                // A5 AF   load end addr hi
    cmp #$e0               // C9 E0
    bcs b02_84BD           // B0 0C
    cmp #$7f               // C9 7F
    bcc b02_84BD           // 90 08
    cmp #$a0               // C9 A0
    bcc b02_84C3           // 90 0A
    cmp #$cf               // C9 CF
    bcs b02_84C0           // B0 03
b02_84BD:
    jmp $0165              // 4C 65 01
b02_84C0:
    jmp $014e              // 4C 4E 01
b02_84C3:
    jmp $0173              // 4C 73 01
b02_84C6:
    sei                    // 78
    jsr $9f00              // 20 00 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    lda #$01               // A9 01
    ldy #$95               // A0 95
    ldx #$02               // A2 02
    jsr $9f00              // 20 00 9F
    .byte $15, $80         // inline arg: cross-bank call target $8015
    jsr b02_9911           // 20 11 99
b02_84DA:
    lda $0002,y            // B9 02 00
    jsr $dea9              // 20 A9 DE
    dey                    // 88
    bpl b02_84DA           // 10 F7
    sei                    // 78
    lda $dc0e              // AD 0E DC   CIA1 CRA
    sta $02                // 85 02
    lda $dc0f              // AD 0F DC   CIA1 CRB
    sta $03                // 85 03
    lda $d015              // AD 15 D0   VIC sprite enable
    sta $04                // 85 04
    lda $d01a              // AD 1A D0   VIC IRQ enable
    sta $05                // 85 05
    lda $0318              // AD 18 03   NMINV NMI vector
    sta $06                // 85 06
    lda $0319              // AD 19 03
    sta $07                // 85 07
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$07               // 29 07
    sta $1d                // 85 1D
    lda $dd02              // AD 02 DD   CIA2 DDR A
    sta $1b                // 85 1B
    lda #$3f               // A9 3F
    sta $dd02              // 8D 02 DD   CIA2 DDR A
    lda #$57               // A9 57
    sta $0318              // 8D 18 03   NMINV NMI vector
    lda #$80               // A9 80
    sta $0319              // 8D 19 03
    lda #$00               // A9 00
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    sta $dd0e              // 8D 0E DD   CIA2 CRA
    sta $dd0f              // 8D 0F DD   CIA2 CRB
    sta $d015              // 8D 15 D0   VIC sprite enable
    sta $d01a              // 8D 1A D0   VIC IRQ enable
    sta $02a1              // 8D A1 02
    sta $a3                // 85 A3
    sta $94                // 85 94
    lda $d019              // AD 19 D0   VIC IRQ flags
    sta $d019              // 8D 19 D0   VIC IRQ flags
    sta $90                // 85 90   KERNAL I/O status
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    lda $d011              // AD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    and #$7f               // 29 7F
    sta $08                // 85 08
    lda $0288              // AD 88 02   screen memory page
    sta $0a                // 85 0A
    lda $0286              // AD 86 02   current text color
    sta $09                // 85 09
    tsx                    // BA
    inx                    // E8
    inx                    // E8
    stx $0b                // 86 0B
    ldx #$ff               // A2 FF
    rts                    // 60
b02_855C:
    sei                    // 78
    jsr $9f00              // 20 00 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    lda $1b                // A5 1B
    sta $dd02              // 8D 02 DD   CIA2 DDR A
    lda $1d                // A5 1D
    and #$03               // 29 03
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $02                // A5 02
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    lda $03                // A5 03
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    lda $04                // A5 04
    sta $d015              // 8D 15 D0   VIC sprite enable
    lda $05                // A5 05
    sta $d01a              // 8D 1A D0   VIC IRQ enable
    lda $06                // A5 06
    sta $0318              // 8D 18 03   NMINV NMI vector
    lda $07                // A5 07
    sta $0319              // 8D 19 03
    lda $08                // A5 08
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    ldx $0b                // A6 0B
    txs                    // 9A
    jsr b02_9911           // 20 11 99
b02_8597:
    jsr b02_9E9D           // 20 9D 9E
    sta $0002,y            // 99 02 00
    dey                    // 88
    bpl b02_8597           // 10 F7
    ldy #$01               // A0 01
    ldx #$02               // A2 02
    lda #$80               // A9 80
    pha                    // 48
    lda #$15               // A9 15
    pha                    // 48
    php                    // 08
    lda #$95               // A9 95
    pha                    // 48
    lda #$00               // A9 00
    jmp b02_9EDE           // 4C DE 9E
    jsr $9f00              // 20 00 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    jsr b02_84C6           // 20 C6 84
    jsr $9f00              // 20 00 9F
    .byte $63, $80         // inline arg: cross-bank call target $8063
    txs                    // 9A
    lda $b7                // A5 B7   filename length
    bne b02_85C8           // D0 03
    jmp $8640              // 4C 40 86
b02_85C8:
    ldy #$00               // A0 00
    jsr $de80              // 20 80 DE
    cmp #$24               // C9 24
    beq $8640              // F0 6F
    jsr b02_8832           // 20 32 88
    beq $8640              // F0 6A
    bpl b02_85FC           // 10 24
b02_85D8:
    jsr b02_835E           // 20 5E 83
    bcs b02_861F           // B0 42
    jsr b02_8271           // 20 71 82
    bcc b02_8646           // 90 64
    ldx #$07               // A2 07
    ldy #$ff               // A0 FF
    bit $1f                // 24 1F
    bmi b02_85EE           // 30 04
    ldx #$00               // A2 00
    ldy #$14               // A0 14
b02_85EE:
    jsr b02_86FA           // 20 FA 86
    jsr b02_80C4           // 20 C4 80
    jsr $9f00              // 20 00 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    jmp b02_855C           // 4C 5C 85
b02_85FC:
    ldx #$de               // A2 DE
    ldy #$f7               // A0 F7
    jsr $de9d              // 20 9D DE
    bne b02_85D8           // D0 D3
    lda #$80               // A9 80
    sta $0e                // 85 0E
    jsr b02_88D7           // 20 D7 88
    jsr $deac              // 20 AC DE
    jsr b02_86DE           // 20 DE 86
    jsr b02_8381           // 20 81 83
    jsr b02_8649           // 20 49 86
    bcc b02_8623           // 90 09
    lda #$62               // A9 62
    jsr b02_8175           // 20 75 81
b02_861F:
    lda #$84               // A9 84
    bne b02_8644           // D0 21
b02_8623:
    lda #$04               // A9 04
    sta $0d                // 85 0D
    jsr b02_8910           // 20 10 89
    lda #$00               // A9 00
    sta $1c                // 85 1C
    jsr b02_8389           // 20 89 83
    bmi $863d              // 30 0A
    lda $90                // A5 90   KERNAL I/O status
    bmi b02_8646           // 30 0F
    jsr b02_8425           // 20 25 84
b02_863A:
    lda #$40               // A9 40
    bit $03a9              // 2C A9 03
    bit $ffa9              // 2C A9 FF
    ora $90                // 05 90   KERNAL I/O status
b02_8644:
    sta $90                // 85 90   KERNAL I/O status
b02_8646:
    jmp b02_855C           // 4C 5C 85
b02_8649:
    ldx #$67               // A2 67
b02_864B:
    lda $8659,x            // BD 59 86
    sta $013f,x            // 9D 3F 01
    dex                    // CA
    bpl b02_864B           // 10 F7
    lda #$01               // A9 01
    jmp $013f              // 4C 3F 01
    ldx #$28               // A2 28
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b02_865E:
    clc                    // 18
    adc $0e                // 65 0E
    sta $10                // 85 10
    lda #$02               // A9 02
    sta $0f                // 85 0F
b02_8667:
    ldy #$03               // A0 03
b02_8669:
    lda $00fd,y            // B9 FD 00
    cmp #$a0               // C9 A0
    bne b02_8674           // D0 04
    cmp ($0f),y            // D1 0F
    beq b02_868B           // F0 17
b02_8674:
    cmp ($0f),y            // D1 0F
    beq b02_8686           // F0 0E
    cmp #$2a               // C9 2A
    beq b02_868B           // F0 0F
    cmp #$3f               // C9 3F
    bne b02_86A5           // D0 25
    lda ($0f),y            // B1 0F
    cmp #$a0               // C9 A0
    beq b02_86A5           // F0 1F
b02_8686:
    iny                    // C8
    cpy #$13               // C0 13
    bne b02_8669           // D0 DE
b02_868B:
    ldy #$1d               // A0 1D
b02_868D:
    lda ($0f),y            // B1 0F
    sta $0020,y            // 99 20 00
    dey                    // 88
    bpl b02_868D           // 10 F8
    tay                    // A8
    bpl b02_86A5           // 10 0D
    and #$0f               // 29 0F
    beq b02_86A5           // F0 09
    cmp #$02               // C9 02
    beq $86b8              // F0 18
    eor $b8                // 45 B8   logical file#
    lsr                    // 4A
    bcc $86b8              // 90 13
b02_86A5:
    lda $0f                // A5 0F
    clc                    // 18
    adc #$20               // 69 20
    sta $0f                // 85 0F
    bcc b02_8667           // 90 B9
    dec $0f                // C6 0F
    ldy #$00               // A0 00
    lda ($0f),y            // B1 0F
    bpl b02_865E           // 10 A8
    sec                    // 38
    bit $18                // 24 18
    ldy #$10               // A0 10
    sty $de00              // 8C 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b02_86BE:
    rts                    // 60
b02_86BF:
    ldx #$45               // A2 45
    bit $52a2              // 2C A2 52
    bit $57a2              // 2C A2 57
    jsr b02_8071           // 20 71 80
    bcs b02_86BE           // B0 F2
    lda #$4d               // A9 4D
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda #$2d               // A9 2D
b02_86D3:
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    txa                    // 8A
    jmp $ffa8              // 4C A8 FF   KERNAL CIOUT: serial byte out
b02_86DA:
    ldy #$ff               // A0 FF
    bne b02_86FA           // D0 1C
b02_86DE:
    bit $1f                // 24 1F
    bmi b02_86F0           // 30 0E
    ldy #$00               // A0 00
    jsr b02_86F8           // 20 F8 86
    bcs b02_86F5           // B0 0C
    lda #$0b               // A9 0B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    bcc b02_86F5           // 90 05
b02_86F0:
    ldx #$1c               // A2 1C
    jsr b02_86DA           // 20 DA 86
b02_86F5:
    inc $1c                // E6 1C
    rts                    // 60
b02_86F8:
    ldx #$00               // A2 00
b02_86FA:
    sty $23                // 84 23
    txa                    // 8A
    bne b02_8719           // D0 1A
    bit $1f                // 24 1F
    bvc b02_8719           // 50 16
    jsr $86c5              // 20 C5 86
    lda #$01               // A9 01
    ldx #$18               // A2 18
    jsr b02_86D3           // 20 D3 86
    lda #$01               // A9 01
    ldx $1e                // A6 1E
    jsr b02_86D3           // 20 D3 86
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    ldx #$00               // A2 00
b02_8719:
    ldy #$00               // A0 00
b02_871B:
    lda $87cc,x            // BD CC 87
    sta $0024,y            // 99 24 00
    inx                    // E8
    iny                    // C8
    cpy #$07               // C0 07
    bne b02_871B           // D0 F4
b02_8727:
    jsr $86c5              // 20 C5 86
    bcs b02_86BE           // B0 92
    lda $26                // A5 26
    ldx $27                // A6 27
    jsr b02_86D3           // 20 D3 86
    lda #$23               // A9 23
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    ldy #$00               // A0 00
b02_873A:
    lda ($24),y            // B1 24
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    inc $26                // E6 26
    bne b02_8745           // D0 02
    inc $27                // E6 27
b02_8745:
    iny                    // C8
    cpy #$23               // C0 23
    bne b02_873A           // D0 F0
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    tya                    // 98
    clc                    // 18
    adc $24                // 65 24
    sta $24                // 85 24
    bcc b02_8757           // 90 02
    inc $25                // E6 25
b02_8757:
    dec $2a                // C6 2A
    bne b02_8727           // D0 CC
    jsr b02_86BF           // 20 BF 86
    lda $28                // A5 28
    ldx $29                // A6 29
    jsr b02_86D3           // 20 D3 86
    ldx $23                // A6 23
    bmi b02_87B3           // 30 4A
    ldy #$00               // A0 00
b02_876B:
    lda $87ef,x            // BD EF 87
    sta $0026,y            // 99 26 00
    inx                    // E8
    iny                    // C8
    cpy #$05               // C0 05
    bne b02_876B           // D0 F4
    lda $28                // A5 28
    ldx $29                // A6 29
    jsr b02_86D3           // 20 D3 86
    lda $2a                // A5 2A
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr b02_87A8           // 20 A8 87
    lda #$dc               // A9 DC
    ldy #$8e               // A0 8E
    ldx #$01               // A2 01
    jsr b02_8797           // 20 97 87
    lda $26                // A5 26
    ldy $27                // A4 27
    ldx $28                // A6 28
    beq b02_87A6           // F0 0F
b02_8797:
    sta $22                // 85 22
    sty $23                // 84 23
    stx $24                // 86 24
b02_879D:
    jsr b02_817E           // 20 7E 81
    inc $23                // E6 23
    dec $24                // C6 24
    bne b02_879D           // D0 F7
b02_87A6:
    clc                    // 18
    rts                    // 60
b02_87A8:
    bit $1f                // 24 1F
    lda #$2c               // A9 2C
    bvc b02_87B0           // 50 02
    lda #$8d               // A9 8D
b02_87B0:
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
b02_87B3:
    ldy #$00               // A0 00
b02_87B5:
    cpy $b7                // C4 B7   filename length
    bcs b02_87C1           // B0 08
    lda ($bb),y            // B1 BB
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    iny                    // C8
    bne b02_87B5           // D0 F4
b02_87C1:
    lda #$a0               // A9 A0
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    jmp b02_8981           // 4C 81 89
    .byte $92    // 92  undocumented/illegal at $87CC
    dey                    // 88
    bvc $87d1              // 50 01
    bvc b02_87D3           // 50 01
    .byte $02    // 02  undocumented/illegal at $87D2
b02_87D3:
    .byte $31, $92, $00, $05, $00, $05, $09, $CC, $92, $9B, $05, $F4, $05, $0C, $CC, $92    // data $87D3  "1..............."
    .byte $9B, $05, $F3, $05, $0C, $31, $92, $00, $05, $46, $05, $09, $DB, $8F, $02, $31    // data $87E3  ".....1...F.....1"
    .byte $03, $6F, $8C, $02, $4F, $04, $1E, $94, $02, $38, $04, $1E, $94, $02, $69, $04    // data $87F3  "....O....8......"
    .byte $DB, $91, $01, $13, $04    // data $8803  "....."
b02_8808:
    lda $ba                // A5 BA   current device
    sta $0202              // 8D 02 02
b02_880D:
    ldx $ba                // A6 BA   current device
    cpx #$08               // E0 08
    bcs b02_8815           // B0 02
    ldx #$07               // A2 07
b02_8815:
    inx                    // E8
    cpx $0202              // EC 02 02
    beq b02_882D           // F0 12
    cpx #$1f               // E0 1F
    bcc b02_8821           // 90 02
    ldx #$08               // A2 08
b02_8821:
    stx $ba                // 86 BA   current device
    jsr b02_800C           // 20 0C 80
    beq b02_880D           // F0 E5
    ldx $ba                // A6 BA   current device
    lda #$00               // A9 00
    rts                    // 60
b02_882D:
    stx $ba                // 86 BA   current device
    lda #$ff               // A9 FF
    rts                    // 60
b02_8832:
    ldy #$00               // A0 00
    sty $1f                // 84 1F
    lda $ba                // A5 BA   current device
    cmp #$08               // C9 08
    bcc b02_886E           // 90 32
    cmp #$1e               // C9 1E
    bcs b02_886E           // B0 2E
    clc                    // 18
    cld                    // D8
    lda #$fe               // A9 FE
    ldy #$ff               // A0 FF
    jsr b02_8871           // 20 71 88
    beq b02_886E           // F0 23
    cmp #$03               // C9 03
    beq b02_886C           // F0 1D
    lda #$01               // A9 01
    ldy #$18               // A0 18
    jsr b02_8871           // 20 71 88
    tay                    // A8
    beq b02_8867           // F0 0E
    and #$df               // 29 DF
    sta $1e                // 85 1E
    iny                    // C8
    beq b02_8867           // F0 07
    tya                    // 98
    and #$78               // 29 78
    cmp #$38               // C9 38
    beq b02_886A           // F0 03
b02_8867:
    sec                    // 38
    ror $1f                // 66 1F
b02_886A:
    ror $1f                // 66 1F
b02_886C:
    ror $1f                // 66 1F
b02_886E:
    lda $1f                // A5 1F
    rts                    // 60
b02_8871:
    pha                    // 48
    jsr $86c2              // 20 C2 86
    pla                    // 68
    bcc b02_887D           // 90 05
    pla                    // 68
    pla                    // 68
    lda #$00               // A9 00
    rts                    // 60
b02_887D:
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    tya                    // 98
    ldx #$01               // A2 01
    jsr b02_86D3           // 20 D3 86
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    jsr b02_81D8           // 20 D8 81
    pha                    // 48
    jsr $ffab              // 20 AB FF   KERNAL UNTLK
    pla                    // 68
    rts                    // 60
    sei                    // 78
    jsr $018f              // 20 8F 01
    lda #$7a               // A9 7A
    sta $1802              // 8D 02 18
    jsr $f5e9              // 20 E9 F5
    jsr $0162              // 20 62 01
    jmp $0300              // 4C 00 03   IERROR vector
    ldy #$00               // A0 00
    lda #$00               // A9 00
    sta $1800              // 8D 00 18
b02_88AB:
    lda $1800              // AD 00 18
    bne b02_88AB           // D0 FB
    php                    // 08
    lda $1800              // AD 00 18
    asl                    // 0A
    plp                    // 28
    eor $1800              // 4D 00 18
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    nop                    // EA
    nop                    // EA
    nop                    // EA
    eor $1800              // 4D 00 18
    asl                    // 0A
    nop                    // EA
    nop                    // EA
    nop                    // EA
    eor $1800              // 4D 00 18
    sta $0300,y            // 99 00 03   IERROR vector
    iny                    // C8
    nop                    // EA
    nop                    // EA
    bne b02_88AB           // D0 DA
    lda #$08               // A9 08
    sta $1800              // 8D 00 18
    rts                    // 60
b02_88D7:
    jsr b02_974C           // 20 4C 97
    ldx #$00               // A2 00
b02_88DC:
    iny                    // C8
    cpy $b7                // C4 B7   filename length
    bcs b02_88F6           // B0 15
    jsr $de80              // 20 80 DE
    cmp #$2c               // C9 2C
    beq b02_88EC           // F0 04
    cmp #$3d               // C9 3D
    bne b02_88EE           // D0 02
b02_88EC:
    lda #$a0               // A9 A0
b02_88EE:
    sta $0100,x            // 9D 00 01
    inx                    // E8
    cpx #$15               // E0 15
    bcc b02_88DC           // 90 E6
b02_88F6:
    lda #$a0               // A9 A0
    sta $0100,x            // 9D 00 01
    cpx #$03               // E0 03
    bcc b02_8910           // 90 11
    lda $0101              // AD 01 01
    cmp #$2a               // C9 2A
    bne b02_8910           // D0 0A
    lda #$3f               // A9 3F
    cmp $0100              // CD 00 01
    bne b02_8910           // D0 03
    sta $0101              // 8D 01 01
b02_8910:
    ldx #$7f               // A2 7F
b02_8912:
    lda $892a,x            // BD 2A 89
    sta $013f,x            // 9D 3F 01
    dex                    // CA
    bpl b02_8912           // 10 F7
    lda $93                // A5 93
    beq b02_8929           // F0 0A
    lda #$d0               // A9 D0
    sta $0181              // 8D 81 01
    lda #$09               // A9 09
    sta $0182              // 8D 82 01
b02_8929:
    rts                    // 60
    lda #$2b               // A9 2B
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b02_892F:
    lda $0200,y            // B9 00 02   BASIC input buffer
    sta ($0f),y            // 91 0F
    iny                    // C8
    bne b02_892F           // D0 F8
    beq b02_8949           // F0 10
    lda #$28               // A9 28
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b02_893E:
    lda ($0f),y            // B1 0F
    inc $01                // E6 01   CPU port: mem banking
    sta ($ae),y            // 91 AE
    dec $01                // C6 01   CPU port: mem banking
    iny                    // C8
    bne b02_893E           // D0 F5
b02_8949:
    lda #$10               // A9 10
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    tya                    // 98
    rts                    // 60
    lda #$28               // A9 28
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b02_8955:
    lda ($0f),y            // B1 0F
    sta ($ae),y            // 91 AE
    iny                    // C8
    bne b02_8955           // D0 F9
    beq b02_8949           // F0 EB
    ldx #$10               // A2 10
b02_8960:
    lda #$28               // A9 28
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda ($0f),y            // B1 0F
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    inc $01                // E6 01   CPU port: mem banking
    sta ($ae),y            // 91 AE
b02_896E:
    dec $01                // C6 01   CPU port: mem banking
    iny                    // C8
    cpy #$00               // C0 00
    bne b02_8960           // D0 EB
    beq b02_8949           // F0 D2
    eor ($ae),y            // 51 AE
    beq b02_896E           // F0 F3
    lda #$30               // A9 30
    sta $90                // 85 90   KERNAL I/O status
    bne b02_896E           // D0 ED
b02_8981:
    sei                    // 78
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$03               // 29 03
    sta $a8                // 85 A8
    ora #$20               // 09 20
    sta $a9                // 85 A9
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $d011              // AD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    and #$07               // 29 07
    clc                    // 18
    adc #$2f               // 69 2F
    sta $aa                // 85 AA
b02_899A:
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvs b02_899A           // 70 FB
    rts                    // 60
    lda $b7                // A5 B7   filename length
    cmp #$03               // C9 03
    bcc b02_89BB           // 90 15
    ldy #$00               // A0 00
    jsr $de80              // 20 80 DE
    cmp #$3f               // C9 3F
    bne b02_89BB           // D0 0C
    iny                    // C8
    jsr $de80              // 20 80 DE
    cmp #$2a               // C9 2A
    bne b02_89BB           // D0 04
    lda #$3f               // A9 3F
    sta ($bb),y            // 91 BB
b02_89BB:
    rts                    // 60
b02_89BC:
    ldy #$00               // A0 00
b02_89BE:
    jsr $de80              // 20 80 DE
    cmp #$3d               // C9 3D
    beq b02_89D2           // F0 0D
    cmp #$2a               // C9 2A
    bne b02_89CD           // D0 04
    lda #$a0               // A9 A0
    sta ($bb),y            // 91 BB
b02_89CD:
    iny                    // C8
    cpy $b7                // C4 B7   filename length
    bne b02_89BE           // D0 EC
b02_89D2:
    rts                    // 60
b02_89D3:
    lda $bb                // A5 BB   filename ptr lo
    clc                    // 18
    adc #$02               // 69 02
    sta $bb                // 85 BB   filename ptr lo
    bcc b02_89DE           // 90 02
    inc $bc                // E6 BC   filename ptr hi
b02_89DE:
    dec $b7                // C6 B7   filename length
    dec $b7                // C6 B7   filename length
b02_89E2:
    rts                    // 60
b02_89E3:
    lda $bb                // A5 BB   filename ptr lo
    sta $7a                // 85 7A   TXTPTR lo
    lda $ba                // A5 BA   current device
    pha                    // 48
    jsr b02_9F01           // 20 01 9F
    clc                    // 18
    .byte $80    // 80  undocumented/illegal at $89EE
    pla                    // 68
    sta $ba                // 85 BA   current device
    txa                    // 8A
    tay                    // A8
    jsr $86c5              // 20 C5 86
    lda #$77               // A9 77
    ldx #$00               // A2 00
    jsr b02_86D3           // 20 D3 86
    lda #$02               // A9 02
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    tya                    // 98
    ora #$40               // 09 40
    tax                    // AA
    tya                    // 98
    ora #$20               // 09 20
    jsr b02_86D3           // 20 D3 86
    sty $ba                // 84 BA   current device
    jmp b02_81E7           // 4C E7 81
b02_8A12:
    cmp #$3d               // C9 3D
    beq b02_89E3           // F0 CD
    cmp #$52               // C9 52
    beq b02_8A32           // F0 18
    cmp #$48               // C9 48
    bne b02_8A63           // D0 45
    jsr b02_974C           // 20 4C 97
    bmi b02_8A63           // 30 40
    jsr b02_89D3           // 20 D3 89
    beq b02_89E2           // F0 BA
    lda #$2c               // A9 2C
    jsr b02_974E           // 20 4E 97
    sty $fe                // 84 FE
    jmp b02_8E4F           // 4C 4F 8E
b02_8A32:
    jsr b02_89BC           // 20 BC 89
    beq b02_8A63           // F0 2C
b02_8A37:
    lda $b7                // A5 B7   filename length
    bne b02_8A3E           // D0 03
    jmp b02_81E7           // 4C E7 81
b02_8A3E:
    ldy #$00               // A0 00
    jsr $de80              // 20 80 DE
    cmp #$53               // C9 53
    bne b02_8A50           // D0 09
    jsr b02_8832           // 20 32 88
    and #$20               // 29 20
    beq b02_8A63           // F0 15
    bne b02_8A63           // D0 13
b02_8A50:
    cmp #$24               // C9 24
    beq b02_8A72           // F0 1E
    cmp #$4b               // C9 4B
    beq b02_8A78           // F0 20
    cmp #$4e               // C9 4E
    bne b02_8A12           // D0 B6
    jsr b02_8832           // 20 32 88
    and #$20               // 29 20
    bne b02_8A6A           // D0 07
b02_8A63:
    lda #$6f               // A9 6F
b02_8A65:
    sta $b9                // 85 B9   secondary addr
    jmp $de87              // 4C 87 DE
b02_8A6A:
    ldy #$0a               // A0 0A
    jsr b02_86F8           // 20 F8 86
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
b02_8A72:
    jsr b02_9FFA           // 20 FA 9F
    jmp b02_8021           // 4C 21 80
b02_8A78:
    jsr b02_8D6E           // 20 6E 8D
    beq b02_8A63           // F0 E6
    ldy #$01               // A0 01
    lda ($bb),y            // B1 BB
    sec                    // 38
    sbc #$2b               // E9 2B
    beq b02_8A8A           // F0 04
    cmp #$02               // C9 02
    bne b02_8A63           // D0 D9
b02_8A8A:
    ldx #$9e               // A2 9E
    ldy #$f7               // A0 F7
    jmp $dea9              // 4C A9 DE
b02_8A91:
    lda $c1                // A5 C1   I/O start addr lo
    sta $c3                // 85 C3
    lda $c2                // A5 C2   I/O start addr hi
    sta $c4                // 85 C4
b02_8A99:
    lda $c2                // A5 C2   I/O start addr hi
    cmp #$03               // C9 03
    bcc b02_8AA8           // 90 09
    ldx #$fe               // A2 FE
    stx $bf                // 86 BF
b02_8AA3:
    jsr b02_8832           // 20 32 88
    bne b02_8AAE           // D0 06
b02_8AA8:
    jsr b02_9F05           // 20 05 9F
    sbc $60f5              // ED F5 60
b02_8AAE:
    lda $b7                // A5 B7   filename length
    beq b02_8AA8           // F0 F6
    jsr b02_9F02           // 20 02 9F
    .byte $1F, $8B         // inline arg: cross-bank call target $8B1F
    jsr $f642              // 20 42 F6
    jsr b02_8D6E           // 20 6E 8D
    bne b02_8AC4           // D0 05
    jsr $9f00              // 20 00 9F
    .byte $54, $80         // inline arg: cross-bank call target $8054
b02_8AC4:
    lda $90                // A5 90   KERNAL I/O status
    cmp #$55               // C9 55
    beq b02_8AE1           // F0 17
    asl                    // 0A
    php                    // 08
    lsr                    // 4A
    plp                    // 28
    bcs b02_8AFF           // B0 2F
    bit $9d                // 24 9D   KERNAL msg mode
    bpl b02_8AFE           // 10 2A
    lda $90                // A5 90   KERNAL I/O status
    beq b02_8AFE           // F0 26
    jsr b02_9FFA           // 20 FA 9F
    jsr b02_8024           // 20 24 80
    jmp b02_8AFE           // 4C FE 8A
b02_8AE1:
    lda #$00               // A9 00
    ldy #$8b               // A0 8B
    jsr $ab1e              // 20 1E AB
    lda #$00               // A9 00
    sta $c6                // 85 C6   keyboard buffer count
b02_8AEC:
    jsr $ea87              // 20 87 EA
    jsr $f142              // 20 42 F1
    cmp #$03               // C9 03
    beq b02_8AFE           // F0 08
    cmp #$41               // C9 41
    beq b02_8AA3           // F0 A9
    cmp #$42               // C9 42
    bne b02_8AEC           // D0 EE
b02_8AFE:
    clc                    // 18
b02_8AFF:
    rts                    // 60
    .byte $0D, $46, $55, $4C, $4C, $3A, $20, $3C, $41, $3E, $20, $54, $52, $59, $20, $41    // data $8B00  text: ".FULL: <A> TRY A"
    .byte $47, $41, $49, $4E, $20, $20, $3C, $42, $3E, $20, $51, $55, $49, $54, $00    // data $8B10  text: "GAIN  <B> QUIT."
    ldy #$01               // A0 01
    jsr $de80              // 20 80 DE
    cmp #$2a               // C9 2A
    beq b02_8B2C           // F0 04
    cmp #$3f               // C9 3F
    bne b02_8B37           // D0 0B
b02_8B2C:
    dey                    // 88
    jsr $de80              // 20 80 DE
    cmp #$3f               // C9 3F
    bne b02_8B37           // D0 03
    jsr b02_89D3           // 20 D3 89
b02_8B37:
    jsr b02_89BC           // 20 BC 89
    jsr b02_974C           // 20 4C 97
    bmi b02_8B5E           // 30 1F
    bit $1f                // 24 1F
    bmi b02_8B5E           // 30 1B
    ldy #$00               // A0 00
    jsr $de80              // 20 80 DE
    cmp #$40               // C9 40
    bne b02_8B5E           // D0 12
    lda #$53               // A9 53
    sta ($bb),y            // 91 BB
    jsr b02_8A63           // 20 63 8A
    ldy #$00               // A0 00
    lda #$40               // A9 40
    sta ($bb),y            // 91 BB
    bcs b02_8B65           // B0 0A
    jsr b02_89D3           // 20 D3 89
b02_8B5E:
    lda #$61               // A9 61
    jsr b02_8A65           // 20 65 8A
    bcc b02_8B6A           // 90 05
b02_8B65:
    lda #$85               // A9 85
b02_8B67:
    sta $90                // 85 90   KERNAL I/O status
    rts                    // 60
b02_8B6A:
    jsr $dea0              // 20 A0 DE
    lda #$61               // A9 61
    jsr b02_8073           // 20 73 80
    jsr b02_86D3           // 20 D3 86
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    lda $90                // A5 90   KERNAL I/O status
    beq b02_8B80           // F0 04
    lda #$0a               // A9 0A
    bne b02_8B67           // D0 E7
b02_8B80:
    jsr b02_8D6E           // 20 6E 8D
    bne b02_8B8A           // D0 05
    jsr $9f00              // 20 00 9F
    .byte $51, $80         // inline arg: cross-bank call target $8051
b02_8B8A:
    jsr b02_84C6           // 20 C6 84
    txs                    // 9A
    jsr b02_8C2D           // 20 2D 8C
    ldy $1f                // A4 1F
    bmi b02_8BCD           // 30 38
    txa                    // 8A
    jsr b02_8175           // 20 75 81
b02_8B99:
    iny                    // C8
    bne b02_8B99           // D0 FD
    bit $dd00              // 2C 00 DD   CIA2 port A (VIC bank, IEC lines)
    bvc b02_8BCD           // 50 2C
    lda #$55               // A9 55
    bne b02_8BC8           // D0 23
    sta $10                // 85 10
    jsr b02_8128           // 20 28 81
    sta $0f                // 85 0F
    lda $ac                // A5 AC
    sta $0c                // 85 0C
    lda $ad                // A5 AD
    sta $0d                // 85 0D
    jsr b02_8DFB           // 20 FB 8D
    bne b02_8BBC           // D0 03
b02_8BB9:
    jsr b02_8D78           // 20 78 8D
b02_8BBC:
    jsr b02_8095           // 20 95 80
    jsr b02_8E36           // 20 36 8E
    dec $12                // C6 12
    bne b02_8BB9           // D0 F3
    lda #$00               // A9 00
b02_8BC8:
    sta $90                // 85 90   KERNAL I/O status
    jmp b02_855C           // 4C 5C 85
b02_8BCD:
    ldx #$04               // A2 04
b02_8BCF:
    jsr b02_8095           // 20 95 80
    jsr $0115              // 20 15 01
    tya                    // 98
    clc                    // 18
    adc $ac                // 65 AC
    sta $ac                // 85 AC
    bcc b02_8BDF           // 90 02
    inc $ad                // E6 AD
b02_8BDF:
    dec $0200              // CE 00 02   BASIC input buffer
    php                    // 08
    jsr b02_817E           // 20 7E 81
    ldx #$02               // A2 02
    plp                    // 28
    bne b02_8BCF           // D0 E4
    lda $ae                // A5 AE   load end addr lo
    sta $ac                // 85 AC
    lda $af                // A5 AF   load end addr hi
    sta $ad                // 85 AD
    lda #$00               // A9 00
    jmp b02_8BC8           // 4C C8 8B
b02_8BF8:
    jsr $fb8e              // 20 8E FB
    sec                    // 38
    lda $ac                // A5 AC
    sbc #$02               // E9 02
    sta $ac                // 85 AC
    bcs b02_8C06           // B0 02
    dec $ad                // C6 AD
b02_8C06:
    ldx #$01               // A2 01
b02_8C08:
    lda $ae                // A5 AE   load end addr lo
    sec                    // 38
    sbc $ac                // E5 AC
    tay                    // A8
    lda $af                // A5 AF   load end addr hi
    sbc $ad                // E5 AD
    beq b02_8C22           // F0 0E
b02_8C14:
    lda $ac                // A5 AC
    clc                    // 18
    adc $bf                // 65 BF
    sta $ac                // 85 AC
    bcc b02_8C1F           // 90 02
    inc $ad                // E6 AD
b02_8C1F:
    inx                    // E8
    bne b02_8C08           // D0 E6
b02_8C22:
    cpy $bf                // C4 BF
    beq b02_8C28           // F0 02
    bcs b02_8C14           // B0 EC
b02_8C28:
    iny                    // C8
    iny                    // C8
    jmp $fb8e              // 4C 8E FB
b02_8C2D:
    ldx #$0e               // A2 0E
    ldy $1f                // A4 1F
    bmi b02_8C37           // 30 04
    ldx #$00               // A2 00
    ldy #$05               // A0 05
b02_8C37:
    jsr b02_86FA           // 20 FA 86
    jsr b02_8BF8           // 20 F8 8B
    stx $0200              // 8E 00 02   BASIC input buffer
    sty $0201              // 8C 01 02
    lda $c3                // A5 C3
    sta $0202              // 8D 02 02
    lda $c4                // A5 C4
    sta $0203              // 8D 03 02
b02_8C4D:
    ldy #$10               // A0 10
b02_8C4F:
    lda $8c5e,y            // B9 5E 8C
    sta $0114,y            // 99 14 01
    dey                    // 88
    bne b02_8C4F           // D0 F7
    sty $22                // 84 22
    lda #$02               // A9 02
    sta $23                // 85 23
    rts                    // 60
    inc $01                // E6 01   CPU port: mem banking
    ldy #$00               // A0 00
b02_8C63:
    lda ($ac),y            // B1 AC
    sta $0200,x            // 9D 00 02   BASIC input buffer
    iny                    // C8
    inx                    // E8
    bne b02_8C63           // D0 F7
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
b02_8C6F:
    lda #$0a               // A9 0A
    sta $32                // 85 32
    lsr                    // 4A
    sta $31                // 85 31
    jsr $03a1              // 20 A1 03
    jsr $0600              // 20 00 06
    jsr $03ac              // 20 AC 03
    lda ($30),y            // B1 30
    bne b02_8C8E           // D0 0B
    ldx $0501              // AE 01 05
    dex                    // CA
    stx $81                // 86 81
    tya                    // 98
    sta $80                // 85 80
    beq b02_8C96           // F0 08
b02_8C8E:
    lda #$02               // A9 02
    jsr $de41              // 20 41 DE
    jsr $f121              // 20 21 F1
b02_8C96:
    ldy #$01               // A0 01
b02_8C98:
    lda $0080,y            // B9 80 00
    sta ($30),y            // 91 30
    dey                    // 88
    bpl b02_8C98           // 10 F8
    jsr $0300              // 20 00 03   IERROR vector
    inc $b6                // E6 B6
    lda $81                // A5 81
    sta $0b                // 85 0B
    lda $80                // A5 80
    cmp $0a                // C5 0A
    beq b02_8C6F           // F0 C0
    sta $0a                // 85 0A
    lda #$01               // A9 01
    bit $03a7              // 2C A7 03
    bpl b02_8CBB           // 10 03
    jmp $99b5              // 4C B5 99
b02_8CBB:
    jmp $f418              // 4C 18 F4
    ldx #$01               // A2 01
    stx $82                // 86 82
    stx $83                // 86 83
    jsr $036c              // 20 6C 03
    tax                    // AA
    ldy $02fc              // AC FC 02
    bne b02_8CDB           // D0 0E
    dex                    // CA
    cpx $02fa              // EC FA 02
    bcc b02_8CDB           // 90 08
    beq b02_8CDB           // F0 06
    sty $1800              // 8C 00 18
    jmp $eb4b              // 4C 4B EB
b02_8CDB:
    jsr $03ac              // 20 AC 03
    lda #$05               // A9 05
    sta $0189              // 8D 89 01
    lda $03a7              // AD A7 03
    asl                    // 0A
    lda #$08               // A9 08
    bcc b02_8CED           // 90 02
    lda #$06               // A9 06
b02_8CED:
    sta $69                // 85 69
    ldx #$74               // A2 74
b02_8CF1:
    lda $f574,x            // BD 74 F5
    bcc b02_8CF9           // 90 03
    lda $9774,x            // BD 74 97
b02_8CF9:
    sta $02ff,x            // 9D FF 02
    lda $0161,x            // BD 61 01
    sta $05ff,x            // 9D FF 05
    dex                    // CA
    bne b02_8CF1           // D0 EC
    lda #$60               // A9 60
    bcs b02_8D0C           // B0 03
    sta $0364              // 8D 64 03
b02_8D0C:
    sta $0374              // 8D 74 03
    jsr $df93              // 20 93 DF
    asl                    // 0A
    tax                    // AA
    lda $06,x              // B5 06
    sta $0a                // 85 0A
    lda $07,x              // B5 07
    sta $0b                // 85 0B
    bit $03a7              // 2C A7 03
    bpl b02_8D30           // 10 0F
    cli                    // 58
    jsr $d048              // 20 48 D0
    lda $0a                // A5 0A
    sta $80                // 85 80
    lda $0b                // A5 0B
    sta $81                // 85 81
    jsr $ef90              // 20 90 EF
b02_8D30:
    lda #$40               // A9 40
    sta $02f9              // 8D F9 02
    lda #$b0               // A9 B0
    ldx #$02               // A2 02
    jsr $0387              // 20 87 03
    jsr $03ac              // 20 AC 03
    cli                    // 58
b02_8D40:
    lda $0a                // A5 0A
    beq b02_8D57           // F0 13
    sta $08                // 85 08
    lda #$e0               // A9 E0
    sta $01                // 85 01   CPU port: mem banking
b02_8D4A:
    lda $01                // A5 01   CPU port: mem banking
    bmi b02_8D4A           // 30 FC
    cmp #$02               // C9 02
    bcc b02_8D40           // 90 EE
    ldx #$02               // A2 02
    jmp $e60a              // 4C 0A E6
b02_8D57:
    ldx #$09               // A2 09
b02_8D59:
    lda $04f5,x            // BD F5 04
    sta $0200,x            // 9D 00 02   BASIC input buffer
    dex                    // CA
    bne b02_8D59           // D0 F7
    jmp $0201              // 4C 01 02
    jsr $dba5              // 20 A5 DB
    jsr $eef4              // 20 F4 EE
    jmp $d227              // 4C 27 D2
b02_8D6E:
    ldx #$9e               // A2 9E
    ldy #$14               // A0 14
    jsr b02_9E9D           // 20 9D 9E
    cmp #$30               // C9 30
    rts                    // 60
b02_8D78:
    ldy $11                // A4 11
    tya                    // 98
    dey                    // 88
    clc                    // 18
    adc $0f                // 65 0F
    cmp $13                // C5 13
    bcc b02_8D94           // 90 11
    cpy #$01               // C0 01
    bne b02_8D8D           // D0 06
    and #$01               // 29 01
    eor #$01               // 49 01
    bpl b02_8D94           // 10 07
b02_8D8D:
    ldx $14                // A6 14
    inc $14                // E6 14
    lda $8e1a,x            // BD 1A 8E
b02_8D94:
    sta $0f                // 85 0F
    bne b02_8DB8           // D0 20
b02_8D98:
    inc $10                // E6 10
    lda $10                // A5 10
    cmp #$12               // C9 12
    beq b02_8D98           // F0 F8
    lda $ac                // A5 AC
    ldx $ad                // A6 AD
    cpy #$01               // C0 01
    bne b02_8DAD           // D0 05
    jsr b02_8DD6           // 20 D6 8D
    beq b02_8DB2           // F0 05
b02_8DAD:
    ldy $13                // A4 13
    jsr b02_8DD2           // 20 D2 8D
b02_8DB2:
    sta $0c                // 85 0C
    stx $0d                // 86 0D
    beq b02_8DFB           // F0 43
b02_8DB8:
    ldx $ad                // A6 AD
    lda $ac                // A5 AC
    cpy #$01               // C0 01
    beq b02_8DD6           // F0 16
    lda $0f                // A5 0F
    lsr                    // 4A
    bcc b02_8DD1           // 90 0C
    adc #$08               // 69 08
    ldx $13                // A6 13
    cpx #$13               // E0 13
    adc #$00               // 69 00
    cpx #$15               // E0 15
    adc #$00               // 69 00
b02_8DD1:
    tay                    // A8
b02_8DD2:
    ldx $0d                // A6 0D
    lda $0c                // A5 0C
b02_8DD6:
    clc                    // 18
    adc #$f0               // 69 F0
    bcc b02_8DDC           // 90 01
    inx                    // E8
b02_8DDC:
    dey                    // 88
    bne b02_8DD6           // D0 F7
    sta $ac                // 85 AC
    stx $ad                // 86 AD
    rts                    // 60
b02_8DE4:
    ldx $10                // A6 10
    lda #$00               // A9 00
    cpx #$12               // E0 12
    adc #$00               // 69 00
    cpx #$19               // E0 19
    adc #$00               // 69 00
    cpx #$1f               // E0 1F
    adc #$00               // 69 00
    tax                    // AA
    lda $8e12,x            // BD 12 8E
    sta $13                // 85 13
    rts                    // 60
b02_8DFB:
    jsr b02_8DE4           // 20 E4 8D
    ldx $0f                // A6 0F
    bne b02_8E0B           // D0 09
    cmp $12                // C5 12
    lda $8e16,x            // BD 16 8E
    ldx #$07               // A2 07
    bcc b02_8E0D           // 90 02
b02_8E0B:
    ldx #$02               // A2 02
b02_8E0D:
    sta $14                // 85 14
    stx $11                // 86 11
    rts                    // 60
    .byte $15, $13, $12, $11, $00, $07, $0E, $15, $01, $02, $03, $04, $05, $06, $00, $02    // data $8E12  "................"
    .byte $04, $06, $01, $03, $05, $00, $03, $06, $02, $05, $01, $04, $00, $04, $01, $05    // data $8E22  "................"
    .byte $02, $06, $03, $00    // data $8E32  "...."
b02_8E36:
    ldy #$00               // A0 00
    sty $22                // 84 22
    sty $15                // 84 15
    sty $2c                // 84 2C   BASIC prog start hi
    iny                    // C8
    sty $23                // 84 23
    lda #$50               // A9 50
    sta $2e                // 85 2E   BASIC vars start hi
    ldy #$be               // A0 BE
    sty $2d                // 84 2D   BASIC vars start lo
    ldy $2c                // A4 2C   BASIC prog start hi
    jmp $0100              // 4C 00 01
b02_8E4E:
    rts                    // 60
b02_8E4F:
    jsr b02_8832           // 20 32 88
    beq b02_8E4E           // F0 FA
    php                    // 08
    lda #$12               // A9 12
    ldx #$90               // A2 90
    plp                    // 28
    bpl b02_8E60           // 10 04
    lda #$28               // A9 28
    ldx #$04               // A2 04
b02_8E60:
    sta $fb                // 85 FB
    stx $fc                // 86 FC
    jsr b02_8ED0           // 20 D0 8E
    lda $bc                // A5 BC   filename ptr hi
    pha                    // 48
    lda $bb                // A5 BB   filename ptr lo
    pha                    // 48
    lda $b7                // A5 B7   filename length
    pha                    // 48
    lda $fb                // A5 FB
    ldy #$00               // A0 00
    ldx #$0f               // A2 0F
    stx $fd                // 86 FD
    jsr b02_9F01           // 20 01 9F
    .byte $27    // 27  undocumented/illegal at $8E7B
    .byte $80    // 80  undocumented/illegal at $8E7C
    pla                    // 68
    sta $b7                // 85 B7   filename length
    pla                    // 68
    sta $bb                // 85 BB   filename ptr lo
    pla                    // 68
    sta $bc                // 85 BC   filename ptr hi
    jsr b02_81E7           // 20 E7 81
    bcs b02_8ED0           // B0 45
    ldy #$00               // A0 00
b02_8E8D:
    lda ($bb),y            // B1 BB
    cpy $fe                // C4 FE
    bcs b02_8E97           // B0 04
    cpy $b7                // C4 B7   filename length
    bcc b02_8E99           // 90 02
b02_8E97:
    lda #$a0               // A9 A0
b02_8E99:
    sta ($fc),y            // 91 FC
    iny                    // C8
    cpy #$14               // C0 14
    bne b02_8E8D           // D0 ED
    ldy $fe                // A4 FE
    bmi b02_8EB3           // 30 0F
    iny                    // C8
    lda ($bb),y            // B1 BB
    tax                    // AA
    iny                    // C8
    lda ($bb),y            // B1 BB
    ldy #$13               // A0 13
    sta ($fc),y            // 91 FC
    dey                    // 88
    txa                    // 8A
    sta ($fc),y            // 91 FC
b02_8EB3:
    lda $fb                // A5 FB
    ldy #$00               // A0 00
    ldx #$0f               // A2 0F
    jsr b02_9F01           // 20 01 9F
    rol                    // 2A
    .byte $80    // 80  undocumented/illegal at $8EBD
    lda #$01               // A9 01
    ldx #$ff               // A2 FF
    ldy #$9e               // A0 9E
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    jsr b02_8A37           // 20 37 8A
    jsr $ffc0              // 20 C0 FF   KERNAL OPEN
    jsr $ffc3              // 20 C3 FF   KERNAL CLOSE
b02_8ED0:
    lda #$9a               // A9 9A
    ldy #$0f               // A0 0F
    ldx #$01               // A2 01
    jsr $9f00              // 20 00 9F
    .byte $12, $80         // inline arg: cross-bank call target $8012
    rts                    // 60
    tsx                    // BA
    stx $033d              // 8E 3D 03
    dey                    // 88
    sty $02af              // 8C AF 02
    iny                    // C8
    sty $11                // 84 11
    iny                    // C8
    sty $1c                // 84 1C
    lda #$20               // A9 20
    sta $1c07              // 8D 07 1C
    jsr $c100              // 20 00 C1
    sei                    // 78
    ldx $0205              // AE 05 02
    lda #$04               // A9 04
    sta $0189              // 8D 89 01
b02_8EFB:
    jsr $0162              // 20 62 01
    inc $0189              // EE 89 01
    dex                    // CA
    bne b02_8EFB           // D0 F7
    lda $0208              // AD 08 02
    sta $03a7              // 8D A7 03
    jmp ($0206)            // 6C 06 02
    jsr $05bc              // 20 BC 05
b02_8F10:
    jsr $036c              // 20 6C 03
    bmi b02_8F21           // 30 0C
    sta $026c              // 8D 6C 02
    ldx #$45               // A2 45
    txs                    // 9A
    jsr $03ac              // 20 AC 03
    jmp $c194              // 4C 94 C1
b02_8F21:
    tax                    // AA
    jsr $0371              // 20 71 03
    sta $0e                // 85 0E
    sta $08                // 85 08
    jsr $0371              // 20 71 03
    sta $09                // 85 09
    sta $0f                // 85 0F
    txa                    // 8A
    cmp #$e0               // C9 E0
    bne b02_8F3C           // D0 07
    ldx #$01               // A2 01
    jsr $0387              // 20 87 03
    bcc b02_8F10           // 90 D4
b02_8F3C:
    cmp #$80               // C9 80
    bne b02_8F43           // D0 03
    jmp $060d              // 4C 0D 06
b02_8F43:
    lda #$b0               // A9 B0
    jmp $05ad              // 4C AD 05
    ldy #$00               // A0 00
    sty $0189              // 8C 89 01
    dey                    // 88
    jsr $0164              // 20 64 01
    lda $ff                // A5 FF
    sty $ff                // 84 FF
    rts                    // 60
    sta $0189              // 8D 89 01
    jmp $0162              // 4C 62 01
    lda #$90               // A9 90
    bit $80a9              // 2C A9 80
    ldx #$04               // A2 04
    stx $f9                // 86 F9
    pha                    // 48
    lda $11                // A5 11
    bne b02_8F6F           // D0 05
    lda #$b0               // A9 B0
    jsr $0396              // 20 96 03
b02_8F6F:
    pla                    // 68
    sta $11                // 85 11
    sei                    // 78
    jsr $d57d              // 20 7D D5
    jsr $03ac              // 20 AC 03
    cli                    // 58
    jsr $d599              // 20 99 D5
    sei                    // 78
    lda $1801              // AD 01 18
    and #$df               // 29 DF
b02_8F83:
    sta $1801              // 8D 01 18
    clc                    // 18
    rts                    // 60
    lda #$20               // A9 20
    ora $1801              // 0D 01 18
    bne b02_8F83           // D0 F4
    lda #$00               // A9 00
    bit $ffa9              // 2C A9 FF
    sty $10                // 84 10
    tay                    // A8
    and #$0f               // 29 0F
    tax                    // AA
    tya                    // 98
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    tay                    // A8
    lda $03ef,x            // BD EF 03
    ldx #$00               // A2 00
    stx $1800              // 8E 00 18
b02_8FA8:
    ldx $1800              // AE 00 18
    bne b02_8FA8           // D0 FB
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    lda $03ef,y            // B9 EF 03
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $10                // A4 10
    lda #$08               // A9 08
    iny                    // C8
    sta $1800              // 8D 00 18
    rts                    // 60
    .byte $0F, $07, $0D, $05, $0B, $03, $09, $01, $0E, $06, $0C, $04, $0A, $02, $08, $00    // data $8FCB  "................"
    .byte $20, $A1, $03, $A6, $43, $86, $C3, $A9, $FF    // data $8FDB  " ...C...."
b02_8FE4:
    sta $07df,x            // 9D DF 07
    dex                    // CA
    bne b02_8FE4           // D0 FA
    stx $c2                // 86 C2   I/O start addr hi
    lda $43                // A5 43
    jsr $03b8              // 20 B8 03
b02_8FF1:
    dec $c2                // C6 C2   I/O start addr hi
    bmi b02_8FF8           // 30 03
b02_8FF5:
    jmp $05a7              // 4C A7 05
b02_8FF8:
    ldx #$ff               // A2 FF
    txs                    // 9A
b02_8FFB:
    dex                    // CA
    beq b02_8FF5           // F0 F7
    jsr $f556              // 20 56 F5
b02_9001:
    bvc b02_9001           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    cmp $24                // C5 24
    bne b02_8FFB           // D0 F0
b02_900B:
    bvc b02_900B           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    iny                    // C8
    sta $0700,y            // 99 00 07
    cpy #$03               // C0 03
    bne b02_900B           // D0 F2
    asl                    // 0A
    tax                    // AA
    lda $0702              // AD 02 07
    and #$0f               // 29 0F
    rol                    // 2A
    tay                    // A8
    txa                    // 8A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    tax                    // AA
    lda $f8c0,x            // BD C0 F8
    ora $f8a0,y            // 19 A0 F8
    tax                    // AA
    stx $54                // 86 54
    cpx $43                // E4 43
    bcs b02_8FF1           // B0 BD
    lda $07e0,x            // BD E0 07
    bpl b02_8FF1           // 10 B8
    txa                    // 8A
    sta $07e0,x            // 9D E0 07
    jsr $f556              // 20 56 F5
    ldy #$40               // A0 40
b02_9042:
    bvc b02_9042           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    lsr                    // 4A
    sta $0741,y            // 99 41 07
b02_904C:
    bvc b02_904C           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    ror                    // 6A
    sta $0700,y            // 99 00 07
    and #$1f               // 29 1F
    sta $063d,y            // 99 3D 06
b02_905B:
    bvc b02_905B           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    tax                    // AA
    ror                    // 6A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    sta $0782,y            // 99 82 07
b02_9069:
    bvc b02_9069           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    sta $067e,y            // 99 7E 06
    asl                    // 0A
    txa                    // 8A
    rol                    // 2A
    and #$1f               // 29 1F
    sta $06bf,y            // 99 BF 06
b02_907A:
    bvc b02_907A           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    pha                    // 48
    and #$1f               // 29 1F
    sta $05bf,y            // 99 BF 05
    dey                    // 88
    bpl b02_9042           // 10 B9
    ldx #$ff               // A2 FF
    txs                    // 9A
    ldx #$40               // A2 40
b02_908E:
    lda $0741,x            // BD 41 07
    lsr                    // 4A
    ror $0700,x            // 7E 00 07
    lsr                    // 4A
    sta $0741,x            // 9D 41 07
    lda $0700,x            // BD 00 07
    ror                    // 6A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    sta $0700,x            // 9D 00 07
    lda $067e,x            // BD 7E 06
    lsr                    // 4A
    ror $01bf,x            // 7E BF 01
    lsr                    // 4A
    and #$1f               // 29 1F
    sta $067e,x            // 9D 7E 06
    lda $01bf,x            // BD BF 01
    ror                    // 6A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    pha                    // 48
    dex                    // CA
    bpl b02_908E           // 10 D3
    lda $54                // A5 54
    jsr $03b8              // 20 B8 03
b02_90C0:
    lda $1800              // AD 00 18
    lsr                    // 4A
    bcs b02_90C0           // B0 FA
    lda #$00               // A9 00
    sta $1800              // 8D 00 18
    nop                    // EA
    nop                    // EA
    lda #$08               // A9 08
    sta $1800              // 8D 00 18
    bit $80                // 24 80
    lda #$00               // A9 00
    sta $1800              // 8D 00 18
    nop                    // EA
    lda #$08               // A9 08
    sta $1800              // 8D 00 18
    ldx #$3f               // A2 3F
    lda #$00               // A9 00
    sta $1800              // 8D 00 18
    ldy $0783,x            // BC 83 07
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $063e,x            // BC 3E 06
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $067f,x            // BC 7F 06
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $06c0,x            // BC C0 06
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $05c0,x            // BC C0 05
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $01c0,x            // BC C0 01
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $0700,x            // BC 00 07
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    ldy $0741,x            // BC 41 07
    lda $0618,y            // B9 18 06
    sta $1800              // 8D 00 18
    asl                    // 0A
    and #$0f               // 29 0F
    sta $1800              // 8D 00 18
    lda #$08               // A9 08
    dex                    // CA
    bmi b02_9169           // 30 06
    sta $1800              // 8D 00 18
    jmp $0506              // 4C 06 05
b02_9169:
    sta $1800              // 8D 00 18
    ldx $0782              // AE 82 07
    lda $f8c0,x            // BD C0 F8
    ldx $063d              // AE 3D 06
    ora $f8a0,x            // 1D A0 F8
    jsr $03b8              // 20 B8 03
    dec $c3                // C6 C3
    beq b02_9182           // F0 03
    jmp $041d              // 4C 1D 04
b02_9182:
    jsr $03b6              // 20 B6 03
    jmp $f418              // 4C 18 F4
    jsr $0385              // 20 85 03
    jsr $036c              // 20 6C 03
    sta $8c                // 85 8C
    lda #$00               // A9 00
    sta $0206              // 8D 06 02
    beq b02_91DB           // F0 44
    ldx #$3c               // A2 3C
b02_9199:
    lda $05c8,x            // BD C8 05
    sta $0600,x            // 9D 00 06
    dex                    // CA
    bpl b02_9199           // 10 F7
    rts                    // 60
    inc $0207              // EE 07 02
    jsr $036c              // 20 6C 03
    sta $8d                // 85 8D
    ldx #$03               // A2 03
    jmp $031a              // 4C 1A 03
    jsr $0383              // 20 83 03
    jsr $03b3              // 20 B3 03
    ldy #$00               // A0 00
b02_91B8:
    lda $0700,y            // B9 00 07
    jsr $03b8              // 20 B8 03
    bne b02_91B8           // D0 F8
    jmp $0334              // 4C 34 03
    .byte $FF, $0E, $0F, $07, $FF, $0A, $0B, $03, $FF, $FF, $0D, $05, $FF, $00, $09, $01    // data $91C3  "................"
    .byte $FF, $06, $0C, $04, $FF, $02, $08, $FF    // data $91D3  "........"
b02_91DB:
    nop                    // EA
    nop                    // EA
    nop                    // EA
    lda #$b0               // A9 B0
    jsr $0385              // 20 85 03
    plp                    // 28
    bne b02_91DB           // D0 F5
    lda $0e                // A5 0E
    sta $18                // 85 18
    lda $0f                // A5 0F
    sta $19                // 85 19
    lda $1c07              // AD 07 1C
    ldy #$01               // A0 01
    sty $1c05              // 8C 05 1C
    sta $1c07              // 8D 07 1C
    lda $18                // A5 18
    ldx $19                // A6 19
b02_91FD:
    sta $0e                // 85 0E
    stx $0f                // 86 0F
    jsr $0383              // 20 83 03
    ldy #$ff               // A0 FF
    lda $0700              // AD 00 07
    bne b02_920E           // D0 03
    ldy $0701              // AC 01 07
b02_920E:
    dey                    // 88
    sty $c0                // 84 C0
    tya                    // 98
    jsr $03b8              // 20 B8 03
    ldy #$02               // A0 02
b02_9217:
    lda $0700,y            // B9 00 07
    jsr $03b8              // 20 B8 03
    dec $c0                // C6 C0
    bne b02_9217           // D0 F6
    ldx $0701              // AE 01 07
    lda $0700              // AD 00 07
    bne b02_91FD           // D0 D4
    jsr $03b8              // 20 B8 03
    jsr $03ac              // 20 AC 03
    cli                    // 58
    rts                    // 60
    sei                    // 78
    lda #$d8               // A9 D8
    sta $4001              // 8D 01 40
    lda $4c                // A5 4C
    ldx $028b              // AE 8B 02
b02_923C:
    sta $0b                // 85 0B
    jsr $0536              // 20 36 05
    lda $0300              // AD 00 03   IERROR vector
    bne b02_9249           // D0 03
    ldy $0301              // AC 01 03
b02_9249:
    sty $10                // 84 10
    dey                    // 88
    tya                    // 98
    jsr $0547              // 20 47 05
    ldy #$02               // A0 02
b02_9252:
    lda $0300,y            // B9 00 03   IERROR vector
    jsr $0547              // 20 47 05
    bne b02_9252           // D0 F8
    ldx $0301              // AE 01 03
    lda $0300              // AD 00 03   IERROR vector
    bne b02_923C           // D0 DA
    jsr $0547              // 20 47 05
    cli                    // 58
    rts                    // 60
    stx $0c                // 86 0C
    ldx #$00               // A2 00
    lda #$80               // A9 80
    jsr $ff54              // 20 54 FF
    ldy #$ff               // A0 FF
    lda $02                // A5 02
    cmp #$02               // C9 02
    rts                    // 60
    rts                    // 60
    sty $11                // 84 11
    tay                    // A8
    and #$0f               // 29 0F
    tax                    // AA
    tya                    // 98
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    tay                    // A8
    lda $058b,x            // BD 8B 05
    tax                    // AA
    lda #$d0               // A9 D0
    sta $4001              // 8D 01 40
    lda #$01               // A9 01
b02_928F:
    bit $4001              // 2C 01 40
    bne b02_928F           // D0 FB
    stx $4001              // 8E 01 40
    txa                    // 8A
    asl                    // 0A
    and #$0f               // 29 0F
    pha                    // 48
    pha                    // 48
    sta $4001              // 8D 01 40
    pla                    // 68
    pla                    // 68
    lda $058b,y            // B9 8B 05
    sta $4001              // 8D 01 40
    asl                    // 0A
    and #$0f               // 29 0F
    pha                    // 48
    ldy $11                // A4 11
    iny                    // C8
    sta $4001              // 8D 01 40
    pla                    // 68
    lda #$d8               // A9 D8
    dec $10                // C6 10
    nop                    // EA
    sta $4001              // 8D 01 40
    rts                    // 60
    .byte $0F, $07, $0D, $05, $0B, $03, $09, $01, $0E, $06, $0C, $04, $0A, $02, $08, $00    // data $92BC  "................"
    .byte $A9, $D0, $8D, $01, $40, $A9, $01    // data $92CC  "....@.."
b02_92D3:
    bit $4001              // 2C 01 40
    bne b02_92D3           // D0 FB
    pha                    // 48
    pla                    // 68
    pha                    // 48
    pla                    // 68
    lda $4001              // AD 01 40
    asl                    // 0A
    pha                    // 48
    pla                    // 68
    nop                    // EA
    nop                    // EA
    bit $02                // 24 02
    ora $4001              // 0D 01 40
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    sta $bd                // 85 BD
    pha                    // 48
    pla                    // 68
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    lda $4001              // AD 01 40
    asl                    // 0A
    pha                    // 48
    pla                    // 68
    bit $02                // 24 02
    nop                    // EA
    nop                    // EA
    ora $4001              // 0D 01 40
    and #$0f               // 29 0F
    ora $bd                // 05 BD
    ldx #$d8               // A2 D8
    stx $4001              // 8E 01 40
    rts                    // 60
    ldy #$00               // A0 00
b02_930F:
    jsr $059b              // 20 9B 05
    sta $0400,y            // 99 00 04   screen RAM
    iny                    // C8
    bne b02_930F           // D0 F7
    rts                    // 60
    sei                    // 78
    ldy #$d8               // A0 D8
    sty $4001              // 8C 01 40
b02_931F:
    dey                    // 88
    nop                    // EA
    bne b02_931F           // D0 FC
    rts                    // 60
    rts                    // 60
    jsr $05e8              // 20 E8 05
    lda $a9                // A5 A9
    and #$0f               // 29 0F
    tax                    // AA
    stx $50                // 86 50
    lda $d1,x              // B5 D1
    asl                    // 0A
    tay                    // A8
    lda #$01               // A9 01
    sta $d1,x              // 95 D1
    lda $000b,y            // B9 0B 00
    sta $0d                // 85 0D
    lda $000c,y            // B9 0C 00
    sta $0e                // 85 0E
    lda #$80               // A9 80
    sta $6d                // 85 6D
b02_9345:
    jsr $05dc              // 20 DC 05
    lda $0400              // AD 00 04   screen RAM
    beq b02_937D           // F0 30
    jsr $0660              // 20 60 06
    lda $02a9              // AD A9 02
    bne b02_9358           // D0 03
    dec $02aa              // CE AA 02
b02_9358:
    dec $02a9              // CE A9 02
    ldy $4d                // A4 4D
    sty $0400              // 8C 00 04   screen RAM
    stx $0401              // 8E 01 04
    lda #$90               // A9 90
    ldx #$01               // A2 01
    jsr $ff54              // 20 54 FF
    sty $0d                // 84 0D
    ldx $0401              // AE 01 04
    stx $0e                // 86 0E
    ldx $50                // A6 50
    inc $0249,x            // FE 49 02
    bne b02_9345           // D0 CD
    inc $0250,x            // FE 50 02
    bne b02_9345           // D0 C8
b02_937D:
    lda $0401              // AD 01 04
    sta $bd                // 85 BD
    lda $022b              // AD 2B 02
    sta $19                // 85 19
    sta $1b                // 85 1B
    lda #$90               // A9 90
    sta $09                // 85 09
    sta $0a                // 85 0A
    cli                    // 58
    rts                    // 60
    lda $0d                // A5 0D
    sta $4d                // 85 4D
    lda #$03               // A9 03
    sta $40                // 85 40
b02_9399:
    ldx #$0a               // A2 0A
    lda $4d                // A5 4D
    cmp #$29               // C9 29
    bcc b02_93A4           // 90 03
    sbc #$28               // E9 28
    inx                    // E8
b02_93A4:
    asl                    // 0A
    sta $31                // 85 31
    asl                    // 0A
    adc $31                // 65 31
    adc #$0a               // 69 0A
    sta $31                // 85 31
    stx $32                // 86 32
    ldy #$00               // A0 00
    lda ($31),y            // B1 31
    bne b02_93E8           // D0 32
    lda $4d                // A5 4D
    ldx $022b              // AE 2B 02
    cmp $022b              // CD 2B 02
    beq b02_93D6           // F0 16
    bcc b02_93DB           // 90 19
    inc $4d                // E6 4D
    lda $4d                // A5 4D
    cmp $022c              // CD 2C 02
    bcc b02_9399           // 90 CE
    dex                    // CA
    stx $4d                // 86 4D
    cpx $90                // E4 90   KERNAL I/O status
    bcc b02_93E3           // 90 11
b02_93D2:
    dec $40                // C6 40
    bne b02_9399           // D0 C3
b02_93D6:
    lda #$72               // A9 72
    jsr $ff3f              // 20 3F FF
b02_93DB:
    dec $4d                // C6 4D
    lda $4d                // A5 4D
    cmp $90                // C5 90   KERNAL I/O status
    bcs b02_9399           // B0 B6
b02_93E3:
    inx                    // E8
    stx $4d                // 86 4D
    bne b02_93D2           // D0 EA
b02_93E8:
    iny                    // C8
b02_93E9:
    lda ($31),y            // B1 31
    bne b02_93F7           // D0 0A
    iny                    // C8
    cpy #$06               // C0 06
    bcc b02_93E9           // 90 F7
    lda #$71               // A9 71
    jsr $ff3f              // 20 3F FF
b02_93F7:
    pha                    // 48
    dey                    // 88
    tya                    // 98
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    tax                    // AA
    lda #$01               // A9 01
    sta $4e                // 85 4E
    pla                    // 68
b02_9403:
    lsr                    // 4A
    bcs b02_940B           // B0 05
    asl $4e                // 06 4E
    inx                    // E8
    bne b02_9403           // D0 F8
b02_940B:
    iny                    // C8
    lda ($31),y            // B1 31
    eor $4e                // 45 4E
    sta ($31),y            // 91 31
    stx $4e                // 86 4E
    ldy #$00               // A0 00
    lda ($31),y            // B1 31
    sec                    // 38
    sbc #$01               // E9 01
    sta ($31),y            // 91 31
    rts                    // 60
    jsr $048d              // 20 8D 04
    inc $08                // E6 08
    lda $08                // A5 08
    cmp $06                // C5 06
    bcs b02_942C           // B0 03
    jmp $f978              // 4C 78 F9
b02_942C:
    jmp $f418              // 4C 18 F4
    stx $08                // 86 08
    lda #$24               // A9 24
    sta $06                // 85 06
    lda $0200,y            // B9 00 02   BASIC input buffer
    sta $12                // 85 12
    sta $16                // 85 16
    lda $0201,y            // B9 01 02
    sta $13                // 85 13
    sta $17                // 85 17
    sei                    // 78
    lda $22                // A5 22
    bne b02_944C           // D0 04
    lda #$c0               // A9 C0
    sta $02                // 85 02
b02_944C:
    lda #$e0               // A9 E0
    sta $01                // 85 01   CPU port: mem banking
    cli                    // 58
b02_9451:
    lda $01                // A5 01   CPU port: mem banking
    bmi b02_9451           // 30 FC
    rts                    // 60
    lda #$20               // A9 20
    sta $0208              // 8D 08 02
    jsr $c1e5              // 20 E5 C1
    bne b02_9463           // D0 03
    jmp $c1f3              // 4C F3 C1
b02_9463:
    sty $027a              // 8C 7A 02
    lda #$a0               // A9 A0
    jsr $c268              // 20 68 C2
    jsr $c100              // 20 00 C1
    ldy $027b              // AC 7B 02
    cpy $0274              // CC 74 02
    bne b02_9479           // D0 03
    jmp $ee46              // 4C 46 EE
b02_9479:
    ldx #$00               // A2 00
    stx $07                // 86 07
    inx                    // E8
    jsr $0411              // 20 11 04
    jsr $d042              // 20 42 D0
    jmp $ee56              // 4C 56 EE
    ldx #$64               // A2 64
b02_9489:
    lda $f574,x            // BD 74 F5
    sta $02ff,x            // 9D FF 02
    dex                    // CA
    bne b02_9489           // D0 F7
    lda #$20               // A9 20
    sta $054b              // 8D 4B 05
    lda #$60               // A9 60
    sta $0364              // 8D 64 03
    jsr $036c              // 20 6C 03
    tax                    // AA
    jsr $058b              // 20 8B 05
    ldy #$09               // A0 09
    jsr $0411              // 20 11 04
    jmp $c194              // 4C 94 C1
    lda #$07               // A9 07
    sta $31                // 85 31
    ldy #$00               // A0 00
    tya                    // 98
b02_94B2:
    sta ($30),y            // 91 30
    iny                    // C8
    bne b02_94B2           // D0 FB
    dey                    // 88
    sty $0701              // 8C 01 07
    sty $3a                // 84 3A
    jsr $f78f              // 20 8F F7
    lda #$ce               // A9 CE
    sta $1c0c              // 8D 0C 1C
    lda #$ff               // A9 FF
    sta $1c03              // 8D 03 1C
    sta $1c01              // 8D 01 1C
    lda #$00               // A9 00
    sta $c2                // 85 C2   I/O start addr hi
    sta $c0                // 85 C0
    lda $22                // A5 22
    sta $18                // 85 18
b02_94D7:
    lda $c2                // A5 C2   I/O start addr hi
    sta $19                // 85 19
    eor $16                // 45 16
    eor $17                // 45 17
    eor $18                // 45 18
    sta $1a                // 85 1A
    jsr $f934              // 20 34 F9
    ldx #$00               // A2 00
    ldy $c0                // A4 C0
b02_94EA:
    lda $24,x              // B5 24
    sta $0600,y            // 99 00 06
    iny                    // C8
    inx                    // E8
    cpx #$08               // E0 08
    bne b02_94EA           // D0 F5
    sty $c0                // 84 C0
    inc $c2                // E6 C2   I/O start addr hi
    lda $c2                // A5 C2   I/O start addr hi
    cmp $43                // C5 43
    bne b02_94D7           // D0 D8
    lda #$00               // A9 00
    sta $c0                // 85 C0
b02_9503:
    lda #$ff               // A9 FF
    sta $1c01              // 8D 01 1C
    ldx #$05               // A2 05
b02_950A:
    bvc b02_950A           // 50 FE
    clv                    // B8
    dex                    // CA
    bne b02_950A           // D0 FA
    ldx #$08               // A2 08
    ldy $c0                // A4 C0
b02_9514:
    bvc b02_9514           // 50 FE
    clv                    // B8
    lda $0600,y            // B9 00 06
    sta $1c01              // 8D 01 1C
    iny                    // C8
    dex                    // CA
    bne b02_9514           // D0 F3
    sty $c0                // 84 C0
    ldx #$0b               // A2 0B
b02_9525:
    bvc b02_9525           // 50 FE
    clv                    // B8
    lda #$55               // A9 55
    sta $1c01              // 8D 01 1C
    dex                    // CA
    bne b02_9525           // D0 F5
    ldx #$05               // A2 05
b02_9532:
    bvc b02_9532           // 50 FE
    clv                    // B8
    lda #$ff               // A9 FF
    sta $1c01              // 8D 01 1C
    dex                    // CA
    bne b02_9532           // D0 F5
    ldy #$bb               // A0 BB
b02_953F:
    bvc b02_953F           // 50 FE
    clv                    // B8
    lda $0100,y            // B9 00 01
    sta $1c01              // 8D 01 1C
    iny                    // C8
    bne b02_953F           // D0 F4
b02_954B:
    bvc b02_954B           // 50 FE
    clv                    // B8
    lda ($30),y            // B1 30
    sta $1c01              // 8D 01 1C
    iny                    // C8
    bne b02_954B           // D0 F5
    ldx #$08               // A2 08
b02_9558:
    bvc b02_9558           // 50 FE
    clv                    // B8
    lda #$55               // A9 55
    sta $1c01              // 8D 01 1C
    dex                    // CA
    bne b02_9558           // D0 F5
b02_9563:
    bvc b02_9563           // 50 FE
    dec $c2                // C6 C2   I/O start addr hi
    bne b02_9503           // D0 9A
    jmp $fe00              // 4C 00 FE
    lda $08                // A5 08
    cmp $07                // C5 07
    bne b02_95B6           // D0 44
    lda $43                // A5 43
    sta $c0                // 85 C0
b02_9576:
    jsr $036c              // 20 6C 03
    sta $0a                // 85 0A
    lda #$07               // A9 07
    jsr $037a              // 20 7A 03
    jsr $f5e9              // 20 E9 F5
    sta $3a                // 85 3A
    jsr $f78f              // 20 8F F7
b02_9588:
    lda $0a                // A5 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    tax                    // AA
    jsr $f556              // 20 56 F5
    ldy #$08               // A0 08
b02_9593:
    bvc b02_9593           // 50 FE
    clv                    // B8
    lda $1c01              // AD 01 1C
    cmp $0600,x            // DD 00 06
    bne b02_9588           // D0 EA
    inx                    // E8
    dey                    // 88
    bne b02_9593           // D0 F1
    jsr $0317              // 20 17 03
    dec $c0                // C6 C0
    bne b02_9576           // D0 CD
    jsr $036c              // 20 6C 03
    beq b02_95B2           // F0 04
    bpl b02_95B4           // 10 04
    lda #$24               // A9 24
b02_95B2:
    sta $06                // 85 06
b02_95B4:
    sta $07                // 85 07
b02_95B6:
    rts                    // 60
b02_95B7:
    ldx #$00               // A2 00
b02_95B9:
    lda $95c9,x            // BD C9 95
    sta $0800,x            // 9D 00 08
    lda $96c9,x            // BD C9 96
    sta $0900,x            // 9D 00 09
    inx                    // E8
    bne b02_95B9           // D0 F1
    rts                    // 60
    jsr b02_84C6           // 20 C6 84
    txs                    // 9A
    lda $fa                // A5 FA
    sta $ba                // 85 BA   current device
    lda $51                // A5 51
    sta $50                // 85 50
    lda #$0b               // A9 0B
    sta $0e                // 85 0E
    ldx #$00               // A2 00
    stx $ac                // 86 AC
    ldy #$0f               // A0 0F
    jsr b02_86FA           // 20 FA 86
    lda #$ff               // A9 FF
    bcs b02_9613           // B0 2D
    jsr b02_8C4D           // 20 4D 8C
    ldx $50                // A6 50
    ldy $0351,x            // BC 51 03
    iny                    // C8
    tya                    // 98
    jsr b02_8175           // 20 75 81
b02_95F3:
    ldx $50                // A6 50
    lda $0352,x            // BD 52 03
    sta $10                // 85 10
    pha                    // 48
    jsr b02_8175           // 20 75 81
    pla                    // 68
    bmi b02_9613           // 30 12
    jsr $084d              // 20 4D 08
    inc $50                // E6 50
    lda $0e                // A5 0E
    clc                    // 18
    adc $13                // 65 13
    sta $0e                // 85 0E
    cmp #$eb               // C9 EB
    bcc b02_95F3           // 90 E2
    lda #$00               // A9 00
b02_9613:
    jmp b02_8644           // 4C 44 86
    ldx #$15               // A2 15
    lda #$ff               // A9 FF
b02_961A:
    sta $033c,x            // 9D 3C 03
    dex                    // CA
    bpl b02_961A           // 10 FA
    jsr b02_8DE4           // 20 E4 8D
    ldy #$08               // A0 08
    lda $13                // A5 13
    sta $41                // 85 41
b02_9629:
    cpy $13                // C4 13
    bcc b02_9637           // 90 0A
    tya                    // 98
    tax                    // AA
    ldy #$ff               // A0 FF
b02_9631:
    iny                    // C8
    dex                    // CA
    cpx $13                // E4 13
    bcs b02_9631           // B0 FA
b02_9637:
    lda $033c,y            // B9 3C 03
    bmi b02_9645           // 30 09
    iny                    // C8
    cpy $13                // C4 13
    bcc b02_9637           // 90 F6
    ldy #$00               // A0 00
    bcs b02_9637           // B0 F2
b02_9645:
    tya                    // 98
    sta $033c,y            // 99 3C 03
    pha                    // 48
    pha                    // 48
    clc                    // 18
    adc $0e                // 65 0E
    sta $ad                // 85 AD
    ldx #$00               // A2 00
    jsr $0115              // 20 15 01
    pla                    // 68
    jsr b02_8175           // 20 75 81
    jsr b02_817E           // 20 7E 81
    pla                    // 68
    clc                    // 18
    adc #$07               // 69 07
    tay                    // A8
    dec $41                // C6 41
    bne b02_9629           // D0 C4
    rts                    // 60
    lda #$00               // A9 00
    sta $fe                // 85 FE
    ror                    // 6A
    sta $93                // 85 93
    jsr b02_84C6           // 20 C6 84
    txs                    // 9A
    jsr b02_86DE           // 20 DE 86
    lda #$ff               // A9 FF
    sta $1c                // 85 1C
    ldy #$3f               // A0 3F
b02_967A:
    lda $08f9,y            // B9 F9 08
    sta $013f,y            // 99 3F 01
    dey                    // 88
    bpl b02_967A           // 10 F7
    lda $93                // A5 93
    beq b02_968C           // F0 05
    lda #$24               // A9 24
    sta $0144              // 8D 44 01
b02_968C:
    lda $51                // A5 51
    sta $50                // 85 50
    lda #$0b               // A9 0B
b02_9692:
    sta $0e                // 85 0E
    ldx $50                // A6 50
    inc $50                // E6 50
    lda $0352,x            // BD 52 03
    bmi b02_96BF           // 30 22
    sta $21                // 85 21
    lda #$03               // A9 03
    sta $f3                // 85 F3
b02_96A3:
    lda $21                // A5 21
    ldx #$00               // A2 00
    stx $fd                // 86 FD
    jsr b02_8389           // 20 89 83
    lda $fd                // A5 FD
    beq b02_96B6           // F0 06
    dec $f3                // C6 F3
    bne b02_96A3           // D0 EF
    inc $fe                // E6 FE
b02_96B6:
    lda $0e                // A5 0E
    clc                    // 18
    adc $13                // 65 13
    cmp #$eb               // C9 EB
    bcc b02_9692           // 90 D3
b02_96BF:
    jmp b02_863A           // 4C 3A 86
    inc $01                // E6 01   CPU port: mem banking
b02_96C4:
    lda $0200,y            // B9 00 02   BASIC input buffer
    sta ($0f),y            // 91 0F
    eor ($0f),y            // 51 0F
    beq b02_96D1           // F0 04
    lda #$40               // A9 40
    sta $fd                // 85 FD
b02_96D1:
    iny                    // C8
    bne b02_96C4           // D0 F0
    dec $01                // C6 01   CPU port: mem banking
    ldx $0c                // A6 0C
    lda $0115,x            // BD 15 01
    bpl b02_96DF           // 10 02
    sta $fd                // 85 FD
b02_96DF:
    rts                    // 60
b02_96E0:
    lda #$24               // A9 24
    sta $22                // 85 22
    lda #$01               // A9 01
    ldx #$22               // A2 22
    ldy #$00               // A0 00
    sty $c6                // 84 C6   keyboard buffer count
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    ldy #$60               // A0 60
    ldx $ba                // A6 BA   current device
    cpx #$08               // E0 08
    bcs b02_96F9           // B0 02
    ldx #$08               // A2 08
b02_96F9:
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    jsr $f3d5              // 20 D5 F3
    lda $ba                // A5 BA   current device
    jsr $ffb4              // 20 B4 FF   KERNAL TALK
    lda $b9                // A5 B9   secondary addr
    jsr $ff96              // 20 96 FF   KERNAL TKSA
    ldx #$03               // A2 03
b02_970B:
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $c3                // 85 C3
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $c4                // 85 C4
    ldy $90                // A4 90   KERNAL I/O status
    bne b02_9749           // D0 30
    dex                    // CA
    bne b02_970B           // D0 EF
    ldx $c3                // A6 C3
    tay                    // A8
    jsr $bdcd              // 20 CD BD
    lda #$20               // A9 20
b02_9724:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    ldx $90                // A6 90   KERNAL I/O status
    bne b02_9749           // D0 1E
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    bne b02_9724           // D0 F4
    lda #$0d               // A9 0D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    beq b02_9743           // F0 09
    cmp #$03               // C9 03
    beq b02_9749           // F0 0B
b02_973E:
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    beq b02_973E           // F0 FB
b02_9743:
    ldx #$02               // A2 02
    cmp #$03               // C9 03
    bne b02_970B           // D0 C2
b02_9749:
    jmp $f642              // 4C 42 F6
b02_974C:
    lda #$3a               // A9 3A
b02_974E:
    sta $24                // 85 24
    ldy #$00               // A0 00
b02_9752:
    cpy $b7                // C4 B7   filename length
    bcs b02_9760           // B0 0A
    jsr $de80              // 20 80 DE
    cmp $24                // C5 24
    beq b02_9762           // F0 05
    iny                    // C8
    bne b02_9752           // D0 F2
b02_9760:
    ldy #$ff               // A0 FF
b02_9762:
    rts                    // 60
b02_9763:
    jsr b02_9F03           // 20 03 9F
    eor ($80),y            // 51 80
b02_9768:
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    cmp #$20               // C9 20
    bne b02_9768           // D0 F9
    jsr $9f00              // 20 00 9F
    .byte $45, $80         // inline arg: cross-bank call target $8045
    sei                    // 78
    ldx #$10               // A2 10
b02_9777:
    lda $d011,x            // BD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    sta $0210,x            // 9D 10 02
    dex                    // CA
    bpl b02_9777           // 10 F7
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $0221              // 8D 21 02
    lda #$9a               // A9 9A
    ldx #$98               // A2 98
    sta $0314              // 8D 14 03   CINV IRQ vector
    stx $0315              // 8E 15 03
    lda #$7f               // A9 7F
    sta $dc0d              // 8D 0D DC   CIA1 ICR (IRQ control/ack)
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    lda #$2c               // A9 2C
    sta $d012              // 8D 12 D0   VIC raster
    ldy #$00               // A0 00
    sty $fd                // 84 FD
    sty $fb                // 84 FB
    sty $d015              // 8C 15 D0   VIC sprite enable
    iny                    // C8
    sty $d01a              // 8C 1A D0   VIC IRQ enable
    lda #$19               // A9 19
    sta $fe                // 85 FE
    cli                    // 58
    bne b02_97D6           // D0 25
b02_97B1:
    lda #$ff               // A9 FF
    ldy $fc                // A4 FC
b02_97B5:
    cpy $fc                // C4 FC
    beq b02_97B5           // F0 FC
    cpy #$fe               // C0 FE
    bne b02_97C0           // D0 03
    inc $d021              // EE 21 D0   VIC background color
b02_97C0:
    cpy #$df               // C0 DF
    bne b02_97CA           // D0 06
    eor $fd                // 45 FD
    sta $fd                // 85 FD
    beq b02_97D6           // F0 0C
b02_97CA:
    cpy #$ef               // C0 EF
    bne b02_97E8           // D0 1A
    lda $fe                // A5 FE
    eor #$01               // 49 01
    sta $fe                // 85 FE
    inc $fb                // E6 FB
b02_97D6:
    lda $fb                // A5 FB
    and #$03               // 29 03
    tax                    // AA
    stx $fb                // 86 FB
    lda $9850,x            // BD 50 98
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$88               // 29 88
    sta $d018              // 8D 18 D0   VIC memory setup (screen/charset base)
b02_97E8:
    cpy #$7f               // C0 7F
    bne b02_97F1           // D0 05
    sta $03b0              // 8D B0 03
    beq b02_982D           // F0 3C
b02_97F1:
    cpy #$fd               // C0 FD
    bne b02_97B1           // D0 BC
    ldx #$00               // A2 00
b02_97F7:
    lda $9836,x            // BD 36 98
    sta $0385,x            // 9D 85 03
    lda $d021              // AD 21 D0   VIC background color
    sta $0348,x            // 9D 48 03
    inx                    // E8
    cpx #$64               // E0 64
    bne b02_97F7           // D0 EF
    ldx #$04               // A2 04
b02_980A:
    ldy $fb                // A4 FB
    lda $9858,y            // B9 58 98
    ldy $985c,x            // BC 5C 98
    eor $03b0,y            // 59 B0 03
    sta $03b0,y            // 99 B0 03
    dex                    // CA
    bpl b02_980A           // 10 EF
    lda $fd                // A5 FD
    bne b02_982D           // D0 0E
    stx $03c4              // 8E C4 03
    ldy #$03               // A0 03
b02_9824:
    lda $9854,y            // B9 54 98
    sta $03b0,y            // 99 B0 03
    dey                    // 88
    bpl b02_9824           // 10 F7
b02_982D:
    sei                    // 78
    lda #$31               // A9 31
    ldx #$ea               // A2 EA
    sta $0314              // 8D 14 03   CINV IRQ vector
    stx $0315              // 8E 15 03
    lda $0221              // AD 21 02
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    ldx #$10               // A2 10
b02_9840:
    lda $0210,x            // BD 10 02
    sta $d011,x            // 9D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    dex                    // CA
    bpl b02_9840           // 10 F7
    cli                    // 58
    jsr $9f00              // 20 00 9F
    .byte $48, $80         // inline arg: cross-bank call target $8048
    rts                    // 60
b02_9863:
b02_986B:
    .byte $0A, $08, $82, $80, $00, $04, $00, $D8, $00, $80, $20, $A0, $07, $0F, $13, $1F    // data $9850  ".......... ....."
    .byte $23, $10, $00, $D9, $03, $E8, $03, $00, $40, $10, $00, $E9, $03, $08, $1C, $F8    // data $9860  "#.......@......."
    .byte $43, $40, $1F, $00, $60, $C0, $00, $40, $03, $E8, $03, $00, $D8, $00, $20, $00    // data $9870  "C@.....@...... ."
    .byte $C0, $40, $1F, $00, $E0, $64, $00, $48, $03, $FF, $46, $55, $4E, $50, $41, $49    // data $9880  ".@.....H..FUNPAI"
    .byte $4E, $54, $20, $28, $4D, $54, $29, $20, $00, $FF, $A9, $B1, $8D, $14, $03, $A9    // data $9890  "NT (MT) ........"
    .byte $2E, $8D, $12, $D0, $CE, $19, $D0, $58    // data $98A0  ".......X"
b02_98A8:
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    jmp b02_98A8           // 4C A8 98
    pla                    // 68
    pla                    // 68
    pla                    // 68
    pla                    // 68
    ldx #$1f               // A2 1F
    bit $ea                // 24 EA
    lda $d012              // AD 12 D0   VIC raster
    cmp #$2e               // C9 2E
    beq b02_98C0           // F0 00
b02_98C0:
    pla                    // 68
    pla                    // 68
b02_98C2:
    dex                    // CA
    cpx #$1a               // E0 1A
    bne b02_98C2           // D0 FB
    lda $d018              // AD 18 D0   VIC memory setup (screen/charset base)
    clc                    // 18
    bcc b02_98DC           // 90 0F
b02_98CD:
    adc #$10               // 69 10
    iny                    // C8
    cmp ($ea,x)            // C1 EA
    sta $d018              // 8D 18 D0   VIC memory setup (screen/charset base)
    sty $d011              // 8C 11 D0   VIC control 1 (screen on/off, YSCROLL)
    cpy #$3f               // C0 3F
    bne b02_98CD           // D0 F1
b02_98DC:
    and #$88               // 29 88
    ldy #$38               // A0 38
    dex                    // CA
    bne $98d1              // D0 EE
    lda #$70               // A9 70
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    sta $fc                // 85 FC
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    ldx $fd                // A6 FD
    beq b02_98F9           // F0 05
    eor #$02               // 49 02
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
b02_98F9:
    and #$02               // 29 02
    lsr                    // 4A
    eor $fe                // 45 FE
    sta $d016              // 8D 16 D0   VIC control 2 (XSCROLL, 38/40col)
    lda #$9a               // A9 9A
    sta $0314              // 8D 14 03   CINV IRQ vector
    lda #$2c               // A9 2C
    sta $d012              // 8D 12 D0   VIC raster
    dec $d019              // CE 19 D0   VIC IRQ flags
    jmp $febc              // 4C BC FE
b02_9911:
    sei                    // 78
    lda #$fc               // A9 FC
b02_9914:
    cmp $d012              // CD 12 D0   VIC raster
    bne b02_9914           // D0 FB
    ldx #$9f               // A2 9F
    ldy #$3b               // A0 3B
    rts                    // 60
bank02_data_991E:
.errorif (* != $991E), "bank02_data_991E shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $991E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $992E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $993E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $994E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $995E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $996E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $997E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $998E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $999E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99AE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99BE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99CE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99DE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99EE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99FE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A0E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A1E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A2E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A3E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A4E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A5E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A6E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A7E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A8E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A9E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AAE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ABE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ACE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ADE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AEE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AFE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B0E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B1E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B2E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B3E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B4E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B5E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B6E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B7E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B8E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B9E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BAE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BBE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BCE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BDE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BEE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BFE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C0E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C1E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C2E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C3E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C4E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C5E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C6E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C7E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C8E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C9E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CAE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CBE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CCE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CDE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CEE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CFE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D0E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D1E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D2E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D3E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D4E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D5E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D6E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D7E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D8E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D9E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DAE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DBE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DCE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DDE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DEE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DFE
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E0E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E1E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E2E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E3E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E4E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E5E
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E6E
    .byte $00, $00    // data $9E7E
    dec $01                // C6 01   CPU port: mem banking
    lda ($bb),y            // B1 BB
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    dec $01                // C6 01   CPU port: mem banking
    jsr $f3d5              // 20 D5 F3
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
bank02_data_9E8F:
.errorif (* != $9E8F), "bank02_data_9E8F shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E8F
b02_9E9D:
    jsr $deba              // 20 BA DE
    dec $01                // C6 01   CPU port: mem banking
    jsr $f68f              // 20 8F F6
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    brk                    // 00
    jsr $deba              // 20 BA DE
    dec $01                // C6 01   CPU port: mem banking
    jsr $f5af              // 20 AF F5
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    pla                    // 68
    rts                    // 60
    pha                    // 48
    lda #$10               // A9 10
    sei                    // 78
    pha                    // 48
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    bit $8080              // 2C 80 80
    bit $8080              // 2C 80 80
    pha                    // 48
    lda $def2              // AD F2 DE
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    sta $def7              // 8D F7 DE
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    rts                    // 60
b02_9EDE:
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rti                    // 40
    nop                    // EA
    sta $9e                // 85 9E
    pla                    // 68
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda $9e                // A5 9E
    rts                    // 60
    bpl b02_9EEF           // 10 00
b02_9EEF:
    php                    // 08
    bpl $9f0a              // 10 18
    jsr $0018              // 20 18 00
bank02_data_9EF5:
.errorif (* != $9EF5), "bank02_data_9EF5 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9EF5
    eor #$ea               // 49 EA
b02_9F01:
    nop                    // EA
b02_9F02:
    nop                    // EA
b02_9F03:
    nop                    // EA
    nop                    // EA
b02_9F05:
    nop                    // EA
    cld                    // D8
    sta $a5                // 85 A5
    stx $a6                // 86 A6
    sty $a7                // 84 A7
    php                    // 08
    pla                    // 68
    sta $a8                // 85 A8
    pla                    // 68
    sta $9e                // 85 9E
    clc                    // 18
    adc #$02               // 69 02
    tax                    // AA
    pla                    // 68
    sta $9f                // 85 9F
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    lda $9e                // A5 9E
    bne b02_9F26           // D0 02
    dec $9f                // C6 9F
b02_9F26:
    dec $9e                // C6 9E
    ldy #$00               // A0 00
    lda ($9e),y            // B1 9E
    sec                    // 38
    sbc #$00               // E9 00
    tax                    // AA
    lda #$10               // A9 10
    pha                    // 48
    lda #$de               // A9 DE
    pha                    // 48
    lda #$e3               // A9 E3
    pha                    // 48
    ldy #$03               // A0 03
    lda ($9e),y            // B1 9E
    pha                    // 48
    dey                    // 88
    lda ($9e),y            // B1 9E
    pha                    // 48
    lda $a8                // A5 A8
    pha                    // 48
    lda $a5                // A5 A5
    pha                    // 48
    lda $deee,x            // BD EE DE
    ldx $a6                // A6 A6
    ldy $a7                // A4 A7
    jmp $dede              // 4C DE DE
b02_9F52:
    lda $d5                // A5 D5
    cmp $d3                // C5 D3
    bcs b02_9F5A           // B0 02
    sta $d3                // 85 D3
b02_9F5A:
    lda #$52               // A9 52
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda $0160              // AD 60 01
    cmp #$34               // C9 34
    beq b02_9F6C           // F0 06
    cmp #$37               // C9 37
    beq b02_9F6C           // F0 02
    lda #$37               // A9 37
b02_9F6C:
    eor #$03               // 49 03
    sta $0160              // 8D 60 01
    ldy #$41               // A0 41
    ldx $0167              // AE 67 01
    and #$03               // 29 03
    beq b02_9F7E           // F0 04
    ldy #$4f               // A0 4F
    ldx #$00               // A2 00
b02_9F7E:
    tya                    // 98
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda #$4d               // A9 4D
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda #$2e               // A9 2E
    cpy #$41               // C0 41
    beq b02_9F8F           // F0 02
    ora #$80               // 09 80
b02_9F8F:
    sta $0165              // 8D 65 01
    stx $0163              // 8E 63 01
    rts                    // 60
b02_9F96:
    ldy #$63               // A0 63
    bit $60a0              // 2C A0 60
    sty $b8                // 84 B8   logical file#
    sta $93                // 85 93
    jsr b02_8D6E           // 20 6E 8D
    bne b02_9FC2           // D0 1E
    jsr $9f00              // 20 00 9F
    .byte $51, $80         // inline arg: cross-bank call target $8051
    jsr $9f00              // 20 00 9F
    .byte $63, $80         // inline arg: cross-bank call target $8063
    jsr b02_9FC2           // 20 C2 9F
    pha                    // 48
    php                    // 08
    jsr $9f00              // 20 00 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    jsr $9f00              // 20 00 9F
    .byte $54, $80         // inline arg: cross-bank call target $8054
    plp                    // 28
    pla                    // 68
    jmp b02_9FDB           // 4C DB 9F
b02_9FC2:
    jsr b02_9F02           // 20 02 9F
    .byte $B3, $85         // inline arg: cross-bank call target $85B3
    jsr $9f00              // 20 00 9F
    .byte $21, $80         // inline arg: cross-bank call target $8021
    lda $90                // A5 90   KERNAL I/O status
    cmp #$ff               // C9 FF
    beq b02_9FE0           // F0 0E
    asl                    // 0A
    php                    // 08
    lsr                    // 4A
    plp                    // 28
    bcs b02_9FDB           // B0 03
    jsr b02_8096           // 20 96 80
b02_9FDB:
    ldx $ae                // A6 AE   load end addr lo
    ldy $af                // A4 AF   load end addr hi
    rts                    // 60
b02_9FE0:
    ldx #$80               // A2 80
b02_9FE2:
    dey                    // 88
    bne b02_9FE2           // D0 FD
    dex                    // CA
    bne b02_9FE2           // D0 FA
    rts                    // 60
b02_9FE9:
    lda #$e0               // A9 E0
b02_9FEB:
    stx $0c                // 86 0C
    jsr b02_8175           // 20 75 81
    lda $21                // A5 21
    jsr b02_8175           // 20 75 81
    lda $0c                // A5 0C
    jmp b02_8175           // 4C 75 81
b02_9FFA:
    lda #$0d               // A9 0D
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
    brk                    // 00
