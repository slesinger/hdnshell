// Disassembly for rr38p-tmp12reu.bin bank 0
// Bank file offset: $0000-$1FFF
// Cartridge window: $8000-$9FFF
// Vectors: coldstart=$8009, warmstart=$800C, signature=c3 c2 cd 38 30
// Reachable instructions: 945 bytes decoded as code: 2023
// Entry points: $8009, $800C, $806E, $817F, $8187, $818A, $8760, $8AA5, $8AEB, $8B2A, $8B54, $8FBE, $9C5F, $9DB3
// Jump table from cold start:
//   $8009 -> $817F
//   $800C -> $8187
//   $800F -> $818A
//   $8012 -> $DE3F
//   $8015 -> $DE41
//   $8018 -> $8FBE
//   $801B -> $9C5F
//   $801E -> $8B2A
//   $8021 -> $9DB3
//   $8024 -> $8760
//   $8027 -> $8AEB
//   $802A -> $806E
//   $802D -> $8B54
//   $8030 -> $8AA5
// External branch/jsr/jmp targets: $0060, $0100, $0400, $0500, $454D, $4552, $455A, $4620, $DE3F, $DE41, $DE8D, $DE9D, $DEBA, $DEDE, $E3BF, $E453, $E716, $FDD0, $FF5B, $FFE4, $FFF0

// Symbol table (auto-generated)
//   $8009 bank00_cold_start
//   $800C bank00_warm_start
//   $800F bank00_sub_800F
//   $8012 bank00_sub_8012
//   $8015 bank00_sub_8015
//   $8033 bank00_sub_8033
//   $8042 bank00_sub_8042
//   $804E bank00_sub_804E
//   $8060 bank00_sub_8060
//   $806E bank00_api_11
//   $817F bank00_api_00
//   $8187 bank00_api_01
//   $818A bank00_api_02
//   $81E9 bank00_sub_81E9
//   $81EC bank00_sub_81EC
//   $8214 bank00_sub_8214
//   $821A bank00_sub_821A
//   $8250 bank00_sub_8250
//   $8289 bank00_sub_8289
//   $8293 bank00_sub_8293
//   $8298 bank00_sub_8298
//   $829B bank00_sub_829B
//   $82C1 bank00_sub_82C1
//   $82CB bank00_sub_82CB
//   $82CF bank00_sub_82CF
//   $82DA bank00_sub_82DA
//   $84EC bank00_sub_84EC
//   $84ED bank00_sub_84ED
//   $84FE bank00_sub_84FE
//   $851E bank00_sub_851E
//   $852D bank00_sub_852D
//   $8541 bank00_sub_8541
//   $854B bank00_sub_854B
//   $857B bank00_sub_857B
//   $85EB bank00_sub_85EB
//   $85F5 bank00_sub_85F5
//   $85FA bank00_sub_85FA
//   $8625 bank00_sub_8625
//   $8632 bank00_sub_8632
//   $864D bank00_sub_864D
//   $866B bank00_sub_866B
//   $8671 bank00_sub_8671
//   $868E bank00_sub_868E
//   $8691 bank00_sub_8691
//   $869F bank00_sub_869F
//   $86A0 bank00_sub_86A0
//   $86A3 bank00_sub_86A3
//   $86C8 bank00_sub_86C8
//   $8722 bank00_sub_8722
//   $8724 bank00_sub_8724
//   $8760 bank00_api_09
//   $8763 bank00_sub_8763
//   $8773 bank00_sub_8773
//   $8780 bank00_sub_8780
//   $8788 bank00_sub_8788
//   $8796 bank00_sub_8796
//   $879B bank00_sub_879B
//   $87AD bank00_sub_87AD
//   $87B2 bank00_sub_87B2
//   $87E6 bank00_sub_87E6
//   $87EA bank00_sub_87EA
//   $87F5 bank00_sub_87F5
//   $87F9 bank00_sub_87F9
//   $8811 bank00_sub_8811
//   $8816 bank00_sub_8816
//   $881B bank00_sub_881B
//   $8820 bank00_sub_8820
//   $8AA5 bank00_api_13
//   $8AAA bank00_sub_8AAA
//   $8AB6 bank00_sub_8AB6
//   $8AB9 bank00_sub_8AB9
//   $8ADF bank00_sub_8ADF
//   $8AE9 bank00_sub_8AE9
//   $8AEB bank00_api_10
//   $8AF1 bank00_sub_8AF1
//   $8AF5 bank00_sub_8AF5
//   $8B08 bank00_sub_8B08
//   $8B2A bank00_api_07
//   $8B33 bank00_sub_8B33
//   $8B3D bank00_sub_8B3D
//   $8B3F bank00_sub_8B3F
//   $8B4C bank00_sub_8B4C
//   $8B54 bank00_api_12
//   $8B9D bank00_sub_8B9D
//   $8FBE bank00_api_05
//   $8FDC bank00_sub_8FDC
//   $8FE8 bank00_sub_8FE8
//   $8FF5 bank00_sub_8FF5
//   $9007 bank00_sub_9007
//   $9018 bank00_sub_9018
//   $901E bank00_sub_901E
//   $9037 bank00_sub_9037
//   $9045 bank00_sub_9045
//   $907C bank00_sub_907C
//   $9095 bank00_sub_9095
//   $90A7 bank00_sub_90A7
//   $90B2 bank00_sub_90B2
//   $90C4 bank00_sub_90C4
//   $90D6 bank00_sub_90D6
//   $90F3 bank00_sub_90F3
//   $90F9 bank00_sub_90F9
//   $9107 bank00_sub_9107
//   $911C bank00_sub_911C
//   $9155 bank00_sub_9155
//   $9159 bank00_sub_9159
//   $927A bank00_sub_927A
//   $928B bank00_sub_928B
//   $9295 bank00_sub_9295
//   $9298 bank00_sub_9298
//   $9898 bank00_sub_9898
//   $9941 bank00_sub_9941
//   $995B bank00_sub_995B
//   $995F bank00_sub_995F
//   $9974 bank00_sub_9974
//   $9976 bank00_sub_9976
//   $99ED bank00_sub_99ED
//   $9A05 bank00_sub_9A05
//   $9A0F bank00_sub_9A0F
//   $9A15 bank00_sub_9A15
//   $9A19 bank00_sub_9A19
//   $9A1E bank00_sub_9A1E
//   $9C5F bank00_api_06
//   $9D91 bank00_sub_9D91
//   $9D93 bank00_sub_9D93
//   $9DB3 bank00_api_08
//   $9DBC bank00_sub_9DBC
//   $9DCD bank00_sub_9DCD
//   $9EA9 bank00_sub_9EA9
//   $9F01 bank00_sub_9F01
//   $9F03 bank00_sub_9F03
//   $9F26 bank00_sub_9F26
//   $DE3F bank00_api_03
//   $DE41 bank00_api_04

// External symbol equates
.const bank00_api_03 = $DE3F
.const bank00_api_04 = $DE41

.pc = $8000

bank00_data_8000:
.errorif (* != $8000), "bank00_data_8000 shifted"
    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank00_cold_start:
    jmp bank00_api_00              // 4C 7F 81
bank00_warm_start:
    jmp bank00_api_01              // 4C 87 81
bank00_sub_800F:
    jmp bank00_api_02              // 4C 8A 81
bank00_sub_8012:
    jmp bank00_api_03              // 4C 3F DE
bank00_sub_8015:
    jmp bank00_api_04              // 4C 41 DE
bank00_data_8018:
.errorif (* != $8018), "bank00_data_8018 shifted"
    .byte $4C, $BE, $8F, $4C, $5F, $9C, $4C, $2A, $8B, $4C, $B3, $9D, $4C, $60, $87, $4C    // data $8018
    .byte $EB, $8A, $4C, $6E, $80, $4C, $54, $8B, $4C, $A5, $8A    // data $8028
bank00_sub_8033:
    jsr bank00_sub_8B3D              // 20 3D 8B
    jmp bank00_api_12              // 4C 54 8B
bank00_data_8039:
.errorif (* != $8039), "bank00_data_8039 shifted"
    .byte $20, $54, $8B, $4C, $2A, $8B, $4C, $9E, $8A    // data $8039
bank00_sub_8042:
    jmp bank00_sub_8AF5              // 4C F5 8A
bank00_data_8045:
.errorif (* != $8045), "bank00_data_8045 shifted"
    .byte $4C, $E0, $8A, $4C, $86, $8B, $4C, $E9, $8A    // data $8045
bank00_sub_804E:
    jmp bank00_sub_8AF1              // 4C F1 8A
bank00_data_8051:
.errorif (* != $8051), "bank00_data_8051 shifted"
    .byte $4C, $1A, $8B, $4C, $23, $8B, $4C, $52, $9F, $4C, $62, $9F, $4C, $66, $9F    // data $8051
bank00_sub_8060:
    ldy #$20               // A0 20
    bit $28a0              // 2C A0 28
    bit $30a0              // 2C A0 30
    bit $38a0              // 2C A0 38
    jmp bank00_sub_9D91              // 4C 91 9D
bank00_api_11:
    bcs bank00_warm_start              // B0 9C
    sei                    // 78
    ldx #$fb               // A2 FB
    txs                    // 9A
    jmp bank00_sub_84EC              // 4C EC 84
bank00_data_8077:
.errorif (* != $8077), "bank00_data_8077 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $52, $52, $33, $38, $50, $2D, $43    // data $8077
    .byte $4F, $55, $4E, $54, $20, $5A, $45, $52, $4F, $2F, $43, $50, $58, $2D, $BD, $00    // data $8087
    .byte $42, $30, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8097
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80A7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80B7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80C7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80D7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80E7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $54, $41, $00, $00, $00, $00, $00    // data $80F7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8107
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8117
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8127
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8137
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8147
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8157
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8167
    .byte $00, $00, $00, $00, $00, $00, $00, $00    // data $8177
// --- $817F: main reset entry (api_00). The three entries below select a
// boot mode in A and fall through to common hardware init at $818C.
// The $2C bytes are the classic "BIT abs" skip-2-bytes trick, so the
// disassembler originally hid the $8187/$818A entry points inside
// bogus "bit $02a9 / bit $01a9" instructions.
bank00_api_00:
    lda #$40               // A9 40
    sta $de01              // 8D 01 DE   RR config reg: enable REU mapping
    lda #$00               // A9 00      mode 0 = cold start
    .byte $2C              // 2C         BIT abs: skips following lda
bank00_api_01:
    lda #$02               // A9 02      mode 2 = warm start entry ($800C)
    .byte $2C              // 2C         BIT abs: skips following lda
bank00_api_02:
    lda #$01               // A9 01      mode 1 = entry via $800F
    sta $0200              // 8D 00 02   store boot mode
    sei                    // 78
    ldx #$ff               // A2 FF
    txs                    // 9A
    cld                    // D8
    lda #$7f               // A9 7F
    sta $dc0d              // 8D 0D DC   CIA1 ICR (IRQ control/ack)
    sta $dd0d              // 8D 0D DD   CIA2 ICR (NMI control/ack)
    sta $dc00              // 8D 00 DC   CIA1 port A (keyboard cols / joy2)
    lda #$08               // A9 08
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    sta $dd0e              // 8D 0E DD   CIA2 CRA
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    sta $dd0f              // 8D 0F DD   CIA2 CRB
    ldx #$00               // A2 00
    stx $dc03              // 8E 03 DC   CIA1 DDR B
    stx $dd03              // 8E 03 DD   CIA2 DDR B
    stx $d418              // 8E 18 D4   SID volume/filter mode
    dex                    // CA
    stx $dc02              // 8E 02 DC   CIA1 DDR A
    ldx $0200              // AE 00 02   BASIC input buffer
    beq $81c9              // F0 08
    lda $08d0              // AD D0 08
    and #$fc               // 29 FC
    ora #$07               // 09 07
    bit $07a9              // 2C A9 07
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    jsr $fdd0              // 20 D0 FD
    lda $0200              // AD 00 02   BASIC input buffer
    bne bank00_sub_81EC              // D0 16
    ldx #$00               // A2 00
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    and #$04               // 29 04
    beq bank00_sub_81E9              // F0 0A
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    and #$80               // 29 80
    bne bank00_sub_81EC              // D0 06
    jmp bank00_sub_8289              // 4C 89 82
bank00_sub_81E9:
    jmp bank00_sub_82CF              // 4C CF 82
bank00_sub_81EC:
    jsr bank00_sub_8298              // 20 98 82
    jsr $ff5b              // 20 5B FF   KERNAL CINT guts (video init)
    cli                    // 58
    jsr $e453              // 20 53 E4   BASIC copy vectors to $0300
    jsr $e3bf              // 20 BF E3   BASIC init RAM/CHRGET
    jsr bank00_sub_87B2              // 20 B2 87
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    sta $c0                // 85 C0
    ldx $0200              // AE 00 02   BASIC input buffer
    beq $823a              // F0 33
    jsr bank00_sub_99ED              // 20 ED 99
    dec $0200              // CE 00 02   BASIC input buffer
    bne bank00_sub_8214              // D0 05
    lda $0882              // AD 82 08
    bne bank00_sub_821A              // D0 06
bank00_sub_8214:
    jsr bank00_sub_87F9              // 20 F9 87
    jmp bank00_api_01              // 4C 87 81
bank00_sub_821A:
    // $8763 prints the $00-terminated string that follows the jsr
    jsr bank00_sub_8763              // 20 63 87
    .byte $0D, $0D, $2E, $58, $20, $20, $46, $4F, $52, $20, $4D, $45, $4E, $55, $0D, $0D    // data $821D  text: "..{CR}{CR}.X  FOR MENU{CR}{CR}"
    .byte $0D, $00    // data $822D  text terminator
    ldx $0878              // AE 78 08
    stx $0882              // 8E 82 08
    // $9F01/$9F03 = cross-bank call stub: 2-byte inline arg is the target
    // address in the destination bank (see $9F01 routine below)
    jsr bank00_sub_9F01              // 20 01 9F
    .byte $1E, $80         // inline arg: cross-bank call target $801E
    inx                    // E8
    jsr bank00_sub_8722              // 20 22 87
    jsr bank00_api_08              // 20 B3 9D
    jsr bank00_sub_87B2              // 20 B2 87
    jsr bank00_sub_9F03              // 20 03 9F
    .byte $54, $80         // inline arg: cross-bank call target $8054
    lda #$50               // A9 50
    ldy #$82               // A0 82
    jsr bank00_sub_9898              // 20 98 98
bank00_sub_8250:
    cli                    // 58
    jsr bank00_api_13              // 20 A5 8A
    ldx #$02               // A2 02
    stx $05ff              // 8E FF 05
    cmp #$85               // C9 85
    beq bank00_sub_82CB              // F0 6E
    dex                    // CA
    cmp #$89               // C9 89
    beq bank00_sub_82CB              // F0 69
    dex                    // CA
    cmp #$86               // C9 86
    beq bank00_sub_82CB              // F0 64
    cmp #$87               // C9 87
    beq bank00_sub_8293              // F0 28
    ldy #$00               // A0 00
    sty $05ff              // 8C FF 05
    ldx #$01               // A2 01
    cmp #$8b               // C9 8B
    beq bank00_sub_82CB              // F0 55
    cmp $8098              // CD 98 80
    beq bank00_sub_82CB              // F0 50
    inx                    // E8
    cmp #$8c               // C9 8C
    beq bank00_sub_82CB              // F0 4B
    cmp $8097              // CD 97 80
    beq bank00_sub_82CB              // F0 46
    cmp #$88               // C9 88
    bne bank00_sub_8250              // D0 C7
bank00_sub_8289:
    ldx #$01               // A2 01
    jsr bank00_sub_8722              // 20 22 87
    jsr bank00_sub_9F01              // 20 01 9F
    .byte $09, $80         // inline arg: cross-bank call target $8009
bank00_sub_8293:
    jsr bank00_sub_9F03              // 20 03 9F
    .byte $21, $80         // inline arg: cross-bank call target $8021
bank00_sub_8298:
    lda #$00               // A9 00
    tay                    // A8
bank00_sub_829B:
    sta $0002,y            // 99 02 00
    sta $0201,y            // 99 01 02
    sta $0300,y            // 99 00 03   IERROR vector
    iny                    // C8
    bne bank00_sub_829B              // D0 F4
    ldx #$3c               // A2 3C
    ldy #$03               // A0 03
    stx $b2                // 86 B2
    sty $b3                // 84 B3
    lda #$a0               // A9 A0
    sta $0284              // 8D 84 02
    sta $c2                // 85 C2   I/O start addr hi
    lda #$08               // A9 08
    sta $0282              // 8D 82 02
    lsr                  // 4A
    sta $0288              // 8D 88 02   screen memory page
    ldy #$1f               // A0 1F
bank00_sub_82C1:
    lda $fd30,y            // B9 30 FD
    sta $0314,y            // 99 14 03   CINV IRQ vector
    dey                    // 88
    bpl bank00_sub_82C1              // 10 F7
    rts                    // 60
bank00_sub_82CB:
    bit $c5                // 24 C5   last key
    bvc bank00_sub_82CB              // 50 FC
bank00_sub_82CF:
    stx $02                // 86 02
    ldx #$ff               // A2 FF
    jsr bank00_sub_8722              // 20 22 87
    ldx $02                // A6 02
    ldy #$51               // A0 51
bank00_sub_82DA:
    lda $82f6,y            // B9 F6 82
    sta $04ff,y            // 99 FF 04
    dey                    // 88
    bne bank00_sub_82DA              // D0 F7
    lda $8095              // AD 95 80
    sta $050d              // 8D 0D 05
    lda $8096              // AD 96 80
    sta $0510              // 8D 10 05
    lda #$0b               // A9 0B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    jmp $0500              // 4C 00 05
bank00_data_82F7:
.errorif (* != $82F7), "bank00_data_82F7 shifted"
    sei                    // 78
    inc $01                // E6 01   CPU port: mem banking
    sty $02                // 84 02
    txa                    // 8A
    beq b00_8318           // F0 19
    cmp #$02               // C9 02
    bne $8306              // D0 03
    lda #$bd               // A9 BD
    bit.abs $00a9          // 2C A9 00
b00_8308:
    stx $03                // 86 03
b00_830A:
    sta ($02),y            // 91 02
    iny                    // C8
    bne b00_830A           // D0 FB
b00_830F:
    inx                    // E8
    beq b00_8318           // F0 06
    cpx #$05               // E0 05
    bne b00_8308           // D0 F2
    beq b00_830F           // F0 F7
b00_8318:
    dec $01                // C6 01   CPU port: mem banking
    lda #$55               // A9 55
    sta $a000              // 8D 00 A0   BASIC cold start vec
    stx $d016              // 8E 16 D0   VIC control 2 (XSCROLL, 38/40col)
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr $8298              // 20 98 82
    jsr $fd15              // 20 15 FD   KERNAL set vectors
    lda $05ff              // AD FF 05
    beq b00_8338           // F0 08
    lda #$06               // A9 06
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    jmp $fcfb              // 4C FB FC
b00_8338:
    lda #$00               // A9 00
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    ldx #$01               // A2 01
    jsr $8722              // 20 22 87
    jsr $9f01              // 20 01 9F
    .byte $09, $80         // inline arg: cross-bank call target $8009
    inc $01                // E6 01   CPU port: mem banking
    lda #$01               // A9 01
    sta $fc                // 85 FC
    ldy #$ff               // A0 FF
    sty $fb                // 84 FB
    iny                    // C8
    sty $fd                // 84 FD
    lda $d000              // AD 00 D0
    pha                    // 48
    lda $cfff              // AD FF CF
    eor #$ff               // 49 FF
    sta $d000              // 8D 00 D0
    lda #$3d               // A9 3D
b00_8362:
    sta $fa                // 85 FA
b00_8364:
    sec                    // 38
    tya                    // 98
    adc $fb                // 65 FB
    sta $fb                // 85 FB
    ldx $fc                // A6 FC
    bcc b00_8382           // 90 14
    inx                    // E8
    beq b00_83D7           // F0 66
    cpx $f8                // E4 F8
    bne b00_837A           // D0 05
    inx                    // E8
    lda #$60               // A9 60
    sta $fb                // 85 FB
b00_837A:
    cpx #$d0               // E0 D0
    bne b00_8380           // D0 02
    ldx #$e0               // A2 E0
b00_8380:
    stx $fc                // 86 FC
b00_8382:
    ldy #$1f               // A0 1F
    lda ($fb),y            // B1 FB
b00_8386:
    dey                    // 88
    bmi b00_838F           // 30 06
    cmp ($fb),y            // D1 FB
    bne b00_8364           // D0 D7
    beq b00_8386           // F0 F7
b00_838F:
    ldy $fa                // A4 FA
    beq b00_83BA           // F0 27
b00_8393:
    cmp ($fb),y            // D1 FB
    bne b00_83BA           // D0 23
    dey                    // 88
    cpy #$1f               // C0 1F
    bne b00_8393           // D0 F7
    ldy $fa                // A4 FA
    cpy #$38               // C0 38
    beq b00_83AE           // F0 0C
    sta $3d                // 85 3D
    stx $2c                // 86 2C   BASIC prog start hi
    lda $fb                // A5 FB
    sta $2b                // 85 2B   BASIC prog start lo
    lda #$38               // A9 38
    bne b00_8362           // D0 B4
b00_83AE:
    sta $3e                // 85 3E
    stx $3c                // 86 3C
    lda $fb                // A5 FB
    sta $3b                // 85 3B
    lda #$00               // A9 00
    beq b00_8362           // F0 A8
b00_83BA:
    ldx $fd                // A6 FD
    cpx #$05               // E0 05
    beq b00_83D3           // F0 13
    sta $0c,x              // 95 0C
    inc $fd                // E6 FD
    txa                    // 8A
    asl                    // 0A
    tax                    // AA
    lda $fb                // A5 FB
    sta $02,x              // 95 02
    lda $fc                // A5 FC
    sta $03,x              // 95 03
    ldy #$1f               // A0 1F
    bne b00_8364           // D0 91
b00_83D3:
    lda $fa                // A5 FA
    bne b00_8364           // D0 8D
b00_83D7:
    pla                    // 68
    sta $d000              // 8D 00 D0
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    jsr $9eba              // 20 BA 9E
b00_83E1:
    ldy #$1f               // A0 1F
b00_83E3:
    dec $0109              // CE 09 01
    lda $8000              // AD 00 80
    inc $01                // E6 01   CPU port: mem banking
    sta ($0a),y            // 91 0A
    dec $01                // C6 01   CPU port: mem banking
    dey                    // 88
    bpl b00_83E3           // 10 F1
    dec $010e              // CE 0E 01
    dec $010e              // CE 0E 01
    bne b00_83E1           // D0 E7
    ldy #$38               // A0 38
b00_83FC:
    lda $8002,y            // B9 02 80
    inc $01                // E6 01   CPU port: mem banking
    sta ($3b),y            // 91 3B
    dec $01                // C6 01   CPU port: mem banking
    cpy #$1a               // C0 1A
    bcs b00_840F           // B0 06
    lda $0152,y            // B9 52 01
    sta $0011,y            // 99 11 00
b00_840F:
    dey                    // 88
    bpl b00_83FC           // 10 EA
    jsr $9eb2              // 20 B2 9E
    inc $01                // E6 01   CPU port: mem banking
    ldy #$3d               // A0 3D
b00_8419:
    lda $016c,y            // B9 6C 01
    cmp #$bb               // C9 BB
    bne b00_8428           // D0 08
    dec $0146              // CE 46 01
    ldx $01b8              // AE B8 01
    lda $00,x              // B5 00
b00_8428:
    sta ($2b),y            // 91 2B
    dey                    // 88
    bpl b00_8419           // 10 EC
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
b00_8430:
    ldy #$1f               // A0 1F
    stx $18                // 86 18
    stx $20                // 86 20
b00_8436:
    lda ($0a),y            // B1 0A
    dec $1c                // C6 1C
    sta $00                // 85 00
    lda $10                // A5 10
    sta ($0a),y            // 91 0A
    dey                    // 88
    bpl b00_8436           // 10 F3
    dec $1e                // C6 1E
    dex                    // CA
    dex                    // CA
    bne b00_8430           // D0 E7
    jmp $38a2              // 4C A2 38
b00_844C:
    lda $bbbb,x            // BD BB BB
    sta $02,x              // 95 02
    lda #$bb               // A9 BB
    sta $bbbb,x            // 9D BB BB
    dex                    // CA
    bpl b00_844C           // 10 F3
    inc $01                // E6 01   CPU port: mem banking
    lda #$bb               // A9 BB
b00_845D:
    bit $d011              // 2C 11 D0   VIC control 1 (screen on/off, YSCROLL)
    .byte $BB    // BB  undocumented/illegal at $8460
    .byte $FB    // FB  undocumented/illegal at $8461
    cmp $d012              // CD 12 D0   VIC raster
    bne b00_845D           // D0 F6
    lda #$bb               // A9 BB
    ldx #$bb               // A2 BB
    sta $dd0e              // 8D 0E DD   CIA2 CRA
    stx $dd0f              // 8E 0F DD   CIA2 CRB
    ldy #$3d               // A0 3D
    pha                    // 48
    pla                    // 68
    lda $00                // A5 00
    lda #$bb               // A9 BB
    ldx #$bb               // A2 BB
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    stx $dc0f              // 8E 0F DC   CIA1 CRB
    lda #$bb               // A9 BB
    ldx #$bb               // A2 BB
    jmp $01bb              // 4C BB 01
    .byte $3B, $3C, $3E, $3B, $3C, $F0, $F1, $2E, $2F, $31, $32, $3D, $E7, $E9    // data $8488  ";<>;<.../12=.."
    lda $2b                // A5 2B   BASIC prog start lo
    sta $013f              // 8D 3F 01
    lda $2c                // A5 2C   BASIC prog start hi
    sta $0140              // 8D 40 01
    lda $e4                // A5 E4
    sta $014b              // 8D 4B 01
    lda $e5                // A5 E5
    sta $014d              // 8D 4D 01
    lda $e8                // A5 E8
    cmp #$2f               // C9 2F
    beq b00_84C0           // F0 10
    sta $0145              // 8D 45 01
    lda #$a9               // A9 A9
    sta $0144              // 8D 44 01
    lda #$85               // A9 85
    sta $0146              // 8D 46 01
    sty $0147              // 8C 47 01
b00_84C0:
    jsr $9e8a              // 20 8A 9E
    lda #$81               // A9 81
    sta $ea                // 85 EA
    ldy #$11               // A0 11
b00_84C9:
    lda $013e,y            // B9 3E 01
    sta ($e9),y            // 91 E9
    dey                    // 88
    bpl b00_84C9           // 10 F8
    jmp $9eb2              // 4C B2 9E
b00_84D4:
    sta $bbbb,y            // 99 BB BB
    dey                    // 88
    bpl b00_84D4           // 10 FA
    sty $d019              // 8C 19 D0   VIC IRQ flags
    nop                    // EA
    stx $01                // 86 01   CPU port: mem banking
    ldx #$bb               // A2 BB
    ldy #$bb               // A0 BB
    pla                    // 68
    rti                    // 40
    jsr $85eb              // 20 EB 85
    sec                    // 38
    bcs $84fb              // B0 0F
bank00_sub_84EC:
    cli                    // 58
bank00_sub_84ED:
    bit $c5                // 24 C5   last key
    bvc bank00_sub_84ED              // 50 FC
    jsr bank00_sub_8AE9              // 20 E9 8A
    jsr bank00_sub_85EB              // 20 EB 85
    jsr bank00_sub_86A0              // 20 A0 86
    clc                    // 18
    sei                    // 78
    ldx #$1f               // A2 1F
bank00_sub_84FE:
    lda $08e0,x            // BD E0 08
    sta $e0,x              // 95 E0
    dex                    // CA
    bpl bank00_sub_84FE              // 10 F8
    ror $f3                // 66 F3
    lda $083e              // AD 3E 08
    sta $f0                // 85 F0
    lda $083f              // AD 3F 08
    sta $f1                // 85 F1
    lda $086c              // AD 6C 08
    sta $ed                // 85 ED
    sec                    // 38
    sbc #$13               // E9 13
    bcs bank00_sub_851E              // B0 02
    lda #$eb               // A9 EB
bank00_sub_851E:
    sta $e9                // 85 E9
    ldy $0872              // AC 72 08
    cpy #$d0               // C0 D0
    bcc bank00_sub_852D              // 90 06
    cpy #$e0               // C0 E0
    bcs bank00_sub_852D              // B0 02
    ldy #$fd               // A0 FD
bank00_sub_852D:
    sty $f8                // 84 F8
    ldx #$00               // A2 00
    lda #$40               // A9 40
    sta $2b                // 85 2B   BASIC prog start lo
    sty $2c                // 84 2C   BASIC prog start hi
    sec                    // 38
    adc #$3d               // 69 3D
    sta $3b                // 85 3B
    sty $3c                // 84 3C
    sec                    // 38
    adc #$38               // 69 38
bank00_sub_8541:
    sta $02,x              // 95 02
    sty $03,x              // 94 03
    clc                    // 18
    adc #$20               // 69 20
    bcc bank00_sub_854B              // 90 01
    iny                    // C8
bank00_sub_854B:
    inx                    // E8
    inx                    // E8
    cpx #$0e               // E0 0E
    bne bank00_sub_8541              // D0 F0
    lda #$20               // A9 20
    sta $0c                // 85 0C
    sta $0d                // 85 0D
    sta $0e                // 85 0E
    sta $0f                // 85 0F
    sta $10                // 85 10
    sta $3d                // 85 3D
    sta $3e                // 85 3E
    jsr bank00_sub_8033              // 20 33 80
    lda #$47               // A9 47
    ldy #$83               // A0 83
    jsr bank00_sub_8AF5              // 20 F5 8A
    lda #$de               // A9 DE
    ldy #$83               // A0 83
    jsr bank00_sub_8AF5              // 20 F5 8A
    lda #$96               // A9 96
    ldy #$84               // A0 84
    jsr bank00_sub_8AF5              // 20 F5 8A
    ldx #$70               // A2 70
bank00_sub_857B:
    lda $8586,x            // BD 86 85
    sta $60,x              // 95 60
    dex                    // CA
    bpl bank00_sub_857B              // 10 F8
    jmp $0060              // 4C 60 00
bank00_data_8586:
.errorif (* != $8586), "bank00_data_8586 shifted"
    jsr $9e8a              // 20 8A 9E
    ldx #$25               // A2 25
b00_858B:
    lda $803a,x            // BD 3A 80
    sta $3a,x              // 95 3A
    dex                    // CA
    bne b00_858B           // D0 F8
b00_8593:
    lda $8100,x            // BD 00 81
    sta $0100,x            // 9D 00 01
    dex                    // CA
    bne b00_8593           // D0 F7
    ldx $ed                // A6 ED
    txs                    // 9A
    pla                    // 68
    pla                    // 68
    pla                    // 68
    pla                    // 68
    ldx #$00               // A2 00
b00_85A5:
    lda $e0,x              // B5 E0
    pha                    // 48
    inx                    // E8
    cpx #$04               // E0 04
    bne b00_85A5           // D0 F8
    bit $f3                // 24 F3
    bmi b00_85D7           // 30 26
    lda $dc08              // AD 08 DC
    asl $ec                // 06 EC
    bmi b00_85BB           // 30 03
    sta $dc08              // 8D 08 DC
b00_85BB:
    lda $dd08              // AD 08 DD
    asl $ec                // 06 EC
    bmi b00_85C5           // 30 03
    sta $dd08              // 8D 08 DD
b00_85C5:
    lda $e8                // A5 E8
    sta $00                // 85 00
    lda $eb                // A5 EB
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda #$34               // A9 34
    sta $01                // 85 01   CPU port: mem banking
    ldx #$0a               // A2 0A
    jmp $0011              // 4C 11 00
b00_85D7:
    ldx #$00               // A2 00
b00_85D9:
    lda $0100,x            // BD 00 01
    sta $8100,x            // 9D 00 81
    inx                    // E8
    bne b00_85D9           // D0 F7
    jsr $9eb2              // 20 B2 9E
    ldx #$fb               // A2 FB
    txs                    // 9A
    jmp $8c0c              // 4C 0C 8C
bank00_sub_85EB:
    ldx #$00               // A2 00
    lda $08eb              // AD EB 08
    cmp #$06               // C9 06
    beq bank00_sub_85F5              // F0 01
    inx                    // E8
bank00_sub_85F5:
    jsr bank00_sub_8722              // 20 22 87
    ldx #$03               // A2 03
bank00_sub_85FA:
    ldy $0837,x            // BC 37 08
    lda $08c4,x            // BD C4 08
    sta $0837,x            // 9D 37 08
    tya                    // 98
    sta $08c4,x            // 9D C4 08
    ldy $0833,x            // BC 33 08
    lda $08d4,x            // BD D4 08
    sta $0833,x            // 9D 33 08
    tya                    // 98
    sta $08d4,x            // 9D D4 08
    cpx #$03               // E0 03
    bcs bank00_sub_8632              // B0 1A
    lda $082d,x            // BD 2D 08
    cmp #$ff               // C9 FF
    bne bank00_sub_8625              // D0 06
    lda $08dd,x            // BD DD 08
    sta $082d,x            // 9D 2D 08
bank00_sub_8625:
    lda $0830,x            // BD 30 08
    cmp #$ff               // C9 FF
    bne bank00_sub_8632              // D0 06
    lda $08cd,x            // BD CD 08
    sta $0830,x            // 9D 30 08
bank00_sub_8632:
    dex                    // CA
    bpl bank00_sub_85FA              // 10 C5
    lda #$7f               // A9 7F
    sta $08cd              // 8D CD 08
    sta $08dd              // 8D DD 08
    lda #$10               // A9 10
    sta $08ce              // 8D CE 08
    sta $08cf              // 8D CF 08
    sta $08de              // 8D DE 08
    sta $08df              // 8D DF 08
    ldx #$0e               // A2 0E
bank00_sub_864D:
    lda $082d,x            // BD 2D 08
    sta $2d,x              // 95 2D   BASIC vars start lo
    dex                    // CA
    bpl bank00_sub_864D              // 10 F8
    lda $082e              // AD 2E 08
    sta $0833              // 8D 33 08
    lda $082f              // AD 2F 08
    sta $0834              // 8D 34 08
    ldy #$31               // A0 31
    ldx #$c4               // A2 C4
    jsr bank00_sub_866B              // 20 6B 86
    iny                    // C8
    ldx #$d4               // A2 D4
bank00_sub_866B:
    jsr bank00_sub_8671              // 20 71 86
    iny                    // C8
    inx                    // E8
    inx                    // E8
bank00_sub_8671:
    lda $0800,y            // B9 00 08
    and #$41               // 29 41
    lsr                  // 4A
    bne bank00_sub_8691              // D0 18
    bcc bank00_sub_8691              // 90 16
    lda $0800,x            // BD 00 08
    adc $083c              // 6D 3C 08
    sta $0800,x            // 9D 00 08
    lda $0801,x            // BD 01 08
    adc $083d              // 6D 3D 08
    bcc bank00_sub_868E              // 90 02
    lda #$ff               // A9 FF
bank00_sub_868E:
    sta $0801,x            // 9D 01 08
bank00_sub_8691:
    lda $0800,x            // BD 00 08
    clc                    // 18
    adc #$08               // 69 08
    sta $0800,x            // 9D 00 08
    bcc bank00_sub_869F              // 90 03
    inc $0801,x            // FE 01 08
bank00_sub_869F:
    rts                    // 60
bank00_sub_86A0:
    sei                    // 78
    ldx #$00               // A2 00
bank00_sub_86A3:
    lda $08c0,x            // BD C0 08
    sta $dc00,x            // 9D 00 DC   CIA1 port A (keyboard cols / joy2)
    lda $08d0,x            // BD D0 08
    sta $dd00,x            // 9D 00 DD   CIA2 port A (VIC bank, IEC lines)
    inx                    // E8
    cpx #$10               // E0 10
    bne bank00_sub_86A3              // D0 EF
    lda #$1f               // A9 1F
    sta $d418              // 8D 18 D4   SID volume/filter mode
    jsr bank00_sub_8AB6              // 20 B6 8A
    lda $08aa              // AD AA 08
    sta $d01a              // 8D 1A D0   VIC IRQ enable
    lda $08a1              // AD A1 08
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
bank00_sub_86C8:
    bit $d011              // 2C 11 D0   VIC control 1 (screen on/off, YSCROLL)
    bpl bank00_sub_86C8              // 10 FB
    ldx #$00               // A2 00
    ldy #$01               // A0 01
    lda $33                // A5 33
    sta $dd04              // 8D 04 DD
    lda $34                // A5 34
    sty $dd0e              // 8C 0E DD   CIA2 CRA
    sta $dd05              // 8D 05 DD
    stx $dd0e              // 8E 0E DD   CIA2 CRA
    lda $35                // A5 35
    sta $dd06              // 8D 06 DD
    lda $36                // A5 36
    sty $dd0f              // 8C 0F DD   CIA2 CRB
    sta $dd07              // 8D 07 DD
    stx $dd0f              // 8E 0F DD   CIA2 CRB
    lda $37                // A5 37   BASIC mem top lo
    sta $dc04              // 8D 04 DC   CIA1 timer A lo
    lda $38                // A5 38   BASIC mem top hi
    sty $dc0e              // 8C 0E DC   CIA1 CRA
    sta $dc05              // 8D 05 DC   CIA1 timer A hi
    stx $dc0e              // 8E 0E DC   CIA1 CRA
    lda $39                // A5 39
    sta $dc06              // 8D 06 DC
    lda $3a                // A5 3A
    sty $dc0f              // 8C 0F DC   CIA1 CRB
    sta $dc07              // 8D 07 DC
    stx $dc0f              // 8E 0F DC   CIA1 CRB
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    lda $2d                // A5 2D   BASIC vars start lo
    sta $dd0d              // 8D 0D DD   CIA2 ICR (NMI control/ack)
    lda $30                // A5 30
    sta $dc0d              // 8D 0D DC   CIA1 ICR (IRQ control/ack)
    rts                    // 60
bank00_sub_8722:
    ldy #$2e               // A0 2E
bank00_sub_8724:
    lda $8731,y            // B9 31 87
    sta $03ff,y            // 99 FF 03
    dey                    // 88
    bne bank00_sub_8724              // D0 F7
    ldy #$14               // A0 14
    jmp $0400              // 4C 00 04   screen RAM
bank00_data_8732:
.errorif (* != $8732), "bank00_data_8732 shifted"
    .byte $A9, $23, $8D, $00, $DE, $B9, $00, $FE, $99, $00, $9E, $C8, $C0, $F8, $D0, $F5    // data $8732
    .byte $A0, $14, $8A, $99, $00, $9E, $88, $10, $FA, $A0, $07, $8A, $30, $07, $F0, $08    // data $8742
    .byte $A0, $00, $AD, $14, $FE, $99, $F8, $9E, $88, $10, $FA, $4C, $B2, $9E    // data $8752
bank00_api_09:
    jsr bank00_sub_9941              // 20 41 99
bank00_sub_8763:
    sty $24                // 84 24
    pla                    // 68
    sta $22                // 85 22
    pla                    // 68
    sta $23                // 85 23
    stx $8d                // 86 8D
    lda $d6                // A5 D6
    sta $25                // 85 25
    ldy #$00               // A0 00
bank00_sub_8773:
    iny                    // C8
    lda ($22),y            // B1 22
    beq bank00_sub_879B              // F0 23
    cmp #$01               // C9 01
    bne bank00_sub_8788              // D0 0C
    iny                    // C8
    lda ($22),y            // B1 22
    tax                    // AA
bank00_sub_8780:
    jsr bank00_sub_87AD              // 20 AD 87
    dex                    // CA
    bne bank00_sub_8780              // D0 FA
    beq bank00_sub_8773              // F0 EB
bank00_sub_8788:
    cmp #$2a               // C9 2A
    bne bank00_sub_8796              // D0 0A
    jsr bank00_sub_87AD              // 20 AD 87
    lda #$2d               // A9 2D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$20               // A9 20
bank00_sub_8796:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    bcc bank00_sub_8773              // 90 D8
bank00_sub_879B:
    tya                    // 98
    clc                    // 18
    adc $22                // 65 22
    tay                    // A8
    lda $23                // A5 23
    adc #$00               // 69 00
    pha                    // 48
    tya                    // 98
    pha                    // 48
    ldy $24                // A4 24
    ldx $8d                // A6 8D
    clc                    // 18
    rts                    // 60
bank00_sub_87AD:
    lda #$20               // A9 20
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
bank00_sub_87B2:
    jsr bank00_sub_8B9D              // 20 9D 8B
    jsr bank00_sub_8763              // 20 63 87
    .byte $93, $01, $09, $43, $59, $42, $45, $52, $50, $55, $4E, $58, $20, $52, $45, $54    // data $87B8  text: "...CYBERPUNX RET"
    .byte $52, $4F, $20, $52, $45, $50, $4C, $41, $59, $0D, $01, $0E, $42, $59, $20, $43    // data $87C8  text: "RO REPLAY...BY C"
    .byte $4F, $55, $4E, $54, $20, $5A, $45, $52, $4F, $0D, $0D, $0D, $00    // data $87D8  text: "OUNT ZERO...."
bank00_data_87E5:
.errorif (* != $87E5), "bank00_data_87E5 shifted"
    .byte $18    // data $87E5
bank00_sub_87E6:
    ldx #$25               // A2 25
    lda #$63               // A9 63
bank00_sub_87EA:
    sta $0479,x            // 9D 79 04
    bcc bank00_sub_87F5              // 90 06
    sta $04f1,x            // 9D F1 04
    sta $0631,x            // 9D 31 06
bank00_sub_87F5:
    dex                    // CA
    bpl bank00_sub_87EA              // 10 F2
    rts                    // 60
bank00_sub_87F9:
    lda #$87               // A9 87
    ldy #$81               // A0 81
    jsr bank00_sub_9898              // 20 98 98
    jsr bank00_sub_9F03              // 20 03 9F
    .byte $57, $80         // inline arg: cross-bank call target $8057
    sec                    // 38
    jsr bank00_sub_87E6              // 20 E6 87
    lda #$00               // A9 00
    sta $0882              // 8D 82 08
    jsr bank00_sub_927A              // 20 7A 92
bank00_sub_8811:
    jsr bank00_api_13              // 20 A5 8A
    ldx #$0f               // A2 0F
bank00_sub_8816:
    cmp $8835,x            // DD 35 88
    beq bank00_sub_8820              // F0 05
bank00_sub_881B:
    dex                    // CA
    bpl bank00_sub_8816              // 10 F8
    bmi bank00_sub_8811              // 30 F1
bank00_sub_8820:
    stx $3f                // 86 3F
    txa                    // 8A
    asl                  // 0A
    tax                    // AA
    lda $8846,x            // BD 46 88
    pha                    // 48
    lda $8845,x            // BD 45 88
    pha                    // 48
    php                    // 08
    jsr $de9d              // 20 9D DE
    jsr bank00_sub_9974              // 20 74 99
    rti                    // 40
// --- $8835: freeze-menu key dispatch table -------------------------------
// 15 keys followed by 15 handler addresses (lo/hi pairs, same order):
//   F1=$85 -> $84E6   F3=$86 -> $84EC   F7=$88 -> $8B65
//   M -> $822F   E -> $9769   D -> $8A90   T -> $9A27   P -> $92A9
//   V -> $8863   S -> $92FF   K -> $91CB   L -> $9179   X -> $88AE
//   C -> $8871 ("EDIT MODE" prompt)   Z -> $9299
bank00_data_8835:
.errorif (* != $8835), "bank00_data_8835 shifted"
    .byte $85, $86, $88, $4D, $45, $44, $54, $50, $56, $53, $4B, $4C, $58, $43, $5A, $00    // data $8835  keys: F1 F3 F7 "MEDTPVSKLXCZ"
    .byte $E6, $84, $EC, $84, $65, $8B, $2F, $82, $69, $97, $90, $8A, $27, $9A, $A9, $92    // data $8845  handler addr lo/hi pairs
    .byte $63, $88, $FF, $92, $CB, $91, $79, $91, $AE, $88, $71, $88, $99, $92    // data $8855  ... continued (15 pairs total)
// --- $8863: 'V' key handler
    lda $def1              // AD F1 DE   RR status reg mirror
    sta $02f2              // 8D F2 02
    jsr $9f03              // 20 03 9F
    .byte $4B, $80         // inline arg: cross-bank call target $804B
    jmp $800c              // 4C 0C 80
    jsr $8763              // 20 63 87
    .byte $45, $44, $49, $54, $20, $4D, $4F, $44, $45, $3A, $0D, $0D, $20, $20, $41, $2A    // data $8874  text: "EDIT MODE:..  A*"
    .byte $31, $58, $31, $0D, $20, $20, $42, $2A, $31, $58, $32, $0D, $20, $20, $43, $2A    // data $8884  text: "1X1.  B*1X2.  C*"
    .byte $32, $58, $31, $0D, $20, $20, $44, $2A, $32, $58, $32, $0D, $00    // data $8894  text: "2X1.  D*2X2.."
    ldx #$44               // A2 44
    jsr $9947              // 20 47 99
    jsr $9f03              // 20 03 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    jmp $800c              // 4C 0C 80
    jsr b00_89A5           // 20 A5 89
    ldx #$00               // A2 00
    stx $f9                // 86 F9
    stx $f8                // 86 F8
    lda $0900              // AD 00 09
    cmp #$aa               // C9 AA
    bne b00_88C1           // D0 03
    jmp b00_89AE           // 4C AE 89
b00_88C1:
    jsr $8763              // 20 63 87
    .byte $0D, $48, $4F, $57, $20, $4D, $41, $4E, $59, $20, $4C, $49, $56, $45, $53, $20    // data $88C4  text: ".HOW MANY LIVES "
    .byte $4E, $4F, $57, $20, $3F, $20, $00    // data $88D4  text: "NOW ? ."
    cli                    // 58
    ldx #$15               // A2 15
    ldy #$19               // A0 19
    jsr $805d              // 20 5D 80
    jsr $0079              // 20 79 00
    beq b00_88EF           // F0 07
    jsr $b79e              // 20 9E B7
    cpx #$00               // E0 00
    bne b00_88F0           // D0 01
b00_88EF:
    rts                    // 60
b00_88F0:
    stx $c4                // 86 C4
    ldx #$02               // A2 02
    stx $fc                // 86 FC
    lda #$a6               // A9 A6
    sta $fb                // 85 FB
    ldy #$00               // A0 00
b00_88FC:
    lda #$fb               // A9 FB
    sta $02b7              // 8D B7 02
b00_8901:
    inc $fb                // E6 FB
    bne b00_8909           // D0 04
    inc $fc                // E6 FC
    beq b00_8957           // F0 4E
b00_8909:
    jsr $02b3              // 20 B3 02
    bpl b00_8901           // 10 F3
    cmp #$ce               // C9 CE
    beq b00_891F           // F0 0D
    cmp #$de               // C9 DE
    beq b00_891F           // F0 09
    cmp #$c6               // C9 C6
    beq b00_891E           // F0 04
    cmp #$d6               // C9 D6
    bne b00_8901           // D0 E3
b00_891E:
    clc                    // 18
b00_891F:
    php                    // 08
    iny                    // C8
    jsr $02b3              // 20 B3 02
    sta $fd                // 85 FD
    iny                    // C8
    jsr $02b3              // 20 B3 02
    ldy #$00               // A0 00
    plp                    // 28
    bcs b00_8930           // B0 01
    tya                    // 98
b00_8930:
    sta $fe                // 85 FE
    lda #$fd               // A9 FD
    sta $02b7              // 8D B7 02
    jsr $02b3              // 20 B3 02
    sta $ff                // 85 FF
    cmp $c4                // C5 C4
    beq b00_894E           // F0 0E
    sec                    // 38
    sbc #$01               // E9 01
    cmp $c4                // C5 C4
    beq b00_894E           // F0 07
    sec                    // 38
    sbc #$2f               // E9 2F
    cmp $c4                // C5 C4
    bne b00_88FC           // D0 AE
b00_894E:
    jsr b00_8A69           // 20 69 8A
    jsr b00_8A2A           // 20 2A 8A
    jmp b00_88FC           // 4C FC 88
b00_8957:
    tya                    // 98
    beq b00_89D1           // F0 77
b00_895A:
    jsr $8763              // 20 63 87
    .byte $0D, $41, $42, $4F, $52, $54, $45, $44, $00    // data $895D  text: ".ABORTED."
b00_8966:
    lda #$00               // A9 00
    beq b00_8998           // F0 2E
b00_896A:
    jsr $8763              // 20 63 87
    .byte $0D, $4C, $4F, $53, $45, $20, $41, $20, $4C, $49, $46, $45, $20, $41, $4E, $44    // data $896D  text: ".LOSE A LIFE AND"
    .byte $20, $52, $45, $46, $52, $45, $45, $5A, $45, $0D, $3C, $52, $2F, $53, $3E, $20    // data $897D  text: " REFREEZE.<R/S> "
    .byte $54, $4F, $20, $41, $42, $4F, $52, $54, $00    // data $898D  text: "TO ABORT."
    lda #$aa               // A9 AA
b00_8998:
    sta $0900              // 8D 00 09
    jsr $9f03              // 20 03 9F
    .byte $3F, $80         // inline arg: cross-bank call target $803F
    bcc b00_89A5           // 90 03
    sta $0900              // 8D 00 09
b00_89A5:
    ldx #$01               // A2 01
    lda #$99               // A9 99
    ldy #$09               // A0 09
    jmp $8012              // 4C 12 80
b00_89AE:
    sty $fa                // 84 FA
b00_89B0:
    ldx $f8                // A6 F8
    jsr b00_8A7F           // 20 7F 8A
    stx $f8                // 86 F8
    beq b00_89D1           // F0 18
    dec $ff                // C6 FF
    lda #$fd               // A9 FD
    sta $02b7              // 8D B7 02
    jsr $02b3              // 20 B3 02
    cmp $ff                // C5 FF
    bne b00_89B0           // D0 E9
    jsr b00_8A69           // 20 69 8A
    jsr b00_8A2A           // 20 2A 8A
    inc $fa                // E6 FA
    bne b00_89B0           // D0 DF
b00_89D1:
    ldx $f9                // A6 F9
    beq b00_895A           // F0 85
    sta $0902,x            // 9D 02 09
    sta $0903,x            // 9D 03 09
    dex                    // CA
    dex                    // CA
    dex                    // CA
    lda $0902,x            // BD 02 09
    sta $fd                // 85 FD
    lda $0903,x            // BD 03 09
    sta $fe                // 85 FE
b00_89E8:
    txa                    // 8A
    sec                    // 38
    sbc #$05               // E9 05
    tax                    // AA
    bcc b00_8A00           // 90 11
    lda $fe                // A5 FE
    cmp $0903,x            // DD 03 09
    bne b00_89FD           // D0 07
    lda $fd                // A5 FD
    cmp $0902,x            // DD 02 09
    beq b00_89E8           // F0 EB
b00_89FD:
    jmp b00_896A           // 4C 6A 89
b00_8A00:
    ldx #$00               // A2 00
b00_8A02:
    jsr b00_8A7F           // 20 7F 8A
    beq b00_8A19           // F0 12
    lda #$fb               // A9 FB
    sta $02b7              // 8D B7 02
    sta $02ae              // 8D AE 02
    jsr $02b3              // 20 B3 02
    eor #$63               // 49 63
    jsr $02a7              // 20 A7 02
    bne b00_8A02           // D0 E9
b00_8A19:
    jsr $8763              // 20 63 87
    .byte $0D, $41, $43, $54, $49, $56, $41, $54, $45, $44, $00    // data $8A1C  text: ".ACTIVATED."
    jmp b00_8966           // 4C 66 89
b00_8A2A:
    jsr $8763              // 20 63 87
    .byte $0D, $50, $4F, $4B, $45, $20, $00    // data $8A2D  text: ".POKE ."
    lda $fc                // A5 FC
    ldx $fb                // A6 FB
    jsr $bdcd              // 20 CD BD
    lda #$2c               // A9 2C
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    ldy #$00               // A0 00
    lda #$fb               // A9 FB
    sta $02b7              // 8D B7 02
    jsr $02b3              // 20 B3 02
    eor #$63               // 49 63
    tax                    // AA
    pha                    // 48
    lda #$00               // A9 00
    jsr $bdcd              // 20 CD BD
    inc $d3                // E6 D3
    inc $d3                // E6 D3
    lda $fc                // A5 FC
    jsr $9c92              // 20 92 9C
    lda $fb                // A5 FB
    jsr $9c92              // 20 92 9C
    inc $d3                // E6 D3
    pla                    // 68
    ldy #$00               // A0 00
    jmp $9c92              // 4C 92 9C
b00_8A69:
    ldx $f9                // A6 F9
    ldy #$fb               // A0 FB
b00_8A6D:
    lda $0000,y            // B9 00 00
    sta $0902,x            // 9D 02 09
    inx                    // E8
    bne b00_8A79           // D0 03
    inc $d020              // EE 20 D0   VIC border color
b00_8A79:
    iny                    // C8
    bne b00_8A6D           // D0 F1
    stx $f9                // 86 F9
    rts                    // 60
b00_8A7F:
    ldy #$fb               // A0 FB
b00_8A81:
    lda $0902,x            // BD 02 09
    sta $0000,y            // 99 00 00
    inx                    // E8
    iny                    // C8
    bne b00_8A81           // D0 F6
    lda $fb                // A5 FB
    ora $fc                // 05 FC
    rts                    // 60
    lda #$08               // A9 08
    cmp $0877              // CD 77 08
    bcc b00_8A99           // 90 02
    sta $ba                // 85 BA   current device
b00_8A99:
    jsr $9f02              // 20 02 9F
    .byte $21, $80         // inline arg: cross-bank call target $8021
    jsr $9f03              // 20 03 9F
    .byte $3F, $80         // inline arg: cross-bank call target $803F
    bne $8aaf              // D0 0A
bank00_api_13:
    lda #$00               // A9 00
    sta $c6                // 85 C6   keyboard buffer count
    cli                    // 58
bank00_sub_8AAA:
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    beq bank00_sub_8AAA              // F0 FB
    cmp #$03               // C9 03
    bne bank00_sub_8ADF              // D0 2C
    jmp ($0334)            // 6C 34 03
bank00_sub_8AB6:
    sei                    // 78
    ldx #$2e               // A2 2E
bank00_sub_8AB9:
    lda $0890,x            // BD 90 08
    sta $d000,x            // 9D 00 D0
    dex                    // CA
    bpl bank00_sub_8AB9              // 10 F7
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$fc               // 29 FC
    ora $08d0              // 0D D0 08
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $08a1              // AD A1 08
    ora #$10               // 09 10
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    lda #$f0               // A9 F0
    sta $d01a              // 8D 1A D0   VIC IRQ enable
    lda #$0f               // A9 0F
    sta $d019              // 8D 19 D0   VIC IRQ flags
bank00_sub_8ADF:
    rts                    // 60
bank00_data_8AE0:
.errorif (* != $8AE0), "bank00_data_8AE0 shifted"
    .byte $20, $B6, $8A, $20, $3D, $8B, $20, $5D, $8B    // data $8AE0
bank00_sub_8AE9:
    ldx #$d8               // A2 D8
bank00_api_10:
    lda #$af               // A9 AF
    ldy #$8b               // A0 8B
    bne bank00_sub_8AF5              // D0 04
bank00_sub_8AF1:
    lda #$df               // A9 DF
    ldy #$8b               // A0 8B
bank00_sub_8AF5:
    sta $0100              // 8D 00 01
    lda $a9                // A5 A9
    pha                    // 48
    lda $aa                // A5 AA
    pha                    // 48
    lda $0100              // AD 00 01
    sta $a9                // 85 A9
    sty $aa                // 84 AA
    sei                    // 78
    ldy #$d2               // A0 D2
bank00_sub_8B08:
    dey                    // 88
    lda ($a9),y            // B1 A9
    sta $0100,y            // 99 00 01
    tya                    // 98
    bne bank00_sub_8B08              // D0 F7
    pla                    // 68
    sta $aa                // 85 AA
    pla                    // 68
    sta $a9                // 85 A9
    jmp $0100              // 4C 00 01
bank00_data_8B1A:
.errorif (* != $8B1A), "bank00_data_8B1A shifted"
    .byte $20, $3D, $8B, $A9, $88, $A0, $08, $D0, $2C, $A9, $08, $A0, $88, $20, $4F, $8B    // data $8B1A
bank00_api_07:
    lda #$9f               // A9 9F
    ldy #$08               // A0 08
    jsr bank00_sub_8B4C              // 20 4C 8B
    ldx #$0e               // A2 0E
bank00_sub_8B33:
    lda $08f0,x            // BD F0 08
    sta $082d,x            // 9D 2D 08
    dex                    // CA
    bpl bank00_sub_8B33              // 10 F7
    rts                    // 60
bank00_sub_8B3D:
    ldx #$0e               // A2 0E
bank00_sub_8B3F:
    lda $082d,x            // BD 2D 08
    sta $08f0,x            // 9D F0 08
    dex                    // CA
    bpl bank00_sub_8B3F              // 10 F7
    lda #$08               // A9 08
    ldy #$9f               // A0 9F
bank00_sub_8B4C:
    ldx #$01               // A2 01
    bit $02a2              // 2C A2 02
    jmp bank00_sub_8015              // 4C 15 80
bank00_api_12:
    lda #$02               // A9 02
    ldy #$82               // A0 82
    ldx #$08               // A2 08
    jmp bank00_sub_8012              // 4C 12 80
bank00_data_8B5D:
.errorif (* != $8B5D), "bank00_data_8B5D shifted"
    .byte $A9, $04, $A0, $84, $A2, $06, $D0, $F5, $20, $E0, $8A, $58, $20, $E4, $FF, $F0    // data $8B5D
    .byte $FB, $A2, $00, $C9, $86, $F0, $05, $E8, $C9, $87, $D0, $05, $FE, $20, $D0, $B0    // data $8B6D
    .byte $EB, $C9, $20, $F0, $04, $C9, $03, $D0, $E3, $20, $5D, $8B, $20, $2A, $8B, $A2    // data $8B7D
    .byte $0E, $BD, $20, $D0, $9D, $B0, $08, $CA, $10, $F7, $20, $A3, $FD, $20, $A0, $E5    // data $8B8D
bank00_sub_8B9D:
    jsr bank00_sub_9F03              // 20 03 9F
    .byte $2A, $80         // inline arg: cross-bank call target $802A
    ldx #$06               // A2 06
    ldy #$06               // A0 06
    stx $d020              // 8E 20 D0   VIC border color
    sty $d021              // 8C 21 D0   VIC background color
    jmp bank00_sub_995B              // 4C 5B 99
bank00_data_8BAF:
.errorif (* != $8BAF), "bank00_data_8BAF shifted"
    jsr $9eba              // 20 BA 9E
    stx $0115              // 8E 15 01
    inx                    // E8
    inx                    // E8
    stx $011d              // 8E 1D 01
    ldx #$02               // A2 02
b00_8BBC:
    lda $9700,y            // B9 00 97
    pha                    // 48
    and #$0f               // 29 0F
    sta $d800,y            // 99 00 D8
    pla                    // 68
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    sta $da00,y            // 99 00 DA
    iny                    // C8
    bne b00_8BBC           // D0 EC
    inc $0115              // EE 15 01
    inc $011d              // EE 1D 01
    inc $010f              // EE 0F 01
    dex                    // CA
    bne b00_8BBC           // D0 E0
    jmp $9eb2              // 4C B2 9E
    jsr $9e8a              // 20 8A 9E
    ldy #$00               // A0 00
    ldx #$02               // A2 02
b00_8BE6:
    lda $da00,y            // B9 00 DA
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    sta $0117              // 8D 17 01
    lda $d800,y            // B9 00 D8
    and #$0f               // 29 0F
    ora #$ff               // 09 FF
    sta $9700,y            // 99 00 97
    iny                    // C8
    bne b00_8BE6           // D0 E9
    inc $0109              // EE 09 01
    inc $0113              // EE 13 01
    inc $011a              // EE 1A 01
    dex                    // CA
    bne b00_8BE6           // D0 DD
    jmp $9eb2              // 4C B2 9E
    ldx #$fe               // A2 FE
    stx $92                // 86 92
    lda #$71               // A9 71
    ldy #$8d               // A0 8D
    jsr $8af5              // 20 F5 8A
    ldx #$00               // A2 00
b00_8C19:
    lda $9ca9,x            // BD A9 9C
    sta $0800,x            // 9D 00 08
    lda $00,x              // B5 00
    sta $0900,x            // 9D 00 09
    cpx #$5a               // E0 5A
    bcs b00_8C2E           // B0 06
    lda $86c8,x            // BD C8 86
    sta $0d50,x            // 9D 50 0D
b00_8C2E:
    inx                    // E8
    bne b00_8C19           // D0 E8
    ldx #$15               // A2 15
b00_8C33:
    lda $8080,x            // BD 80 80
    sta $08e9,x            // 9D E9 08
    dex                    // CA
    bpl b00_8C33           // 10 F7
    lda #$97               // A9 97
    ldy #$0b               // A0 0B
    jsr $8b4f              // 20 4F 8B
    lda #$81               // A9 81
    ldy #$0a               // A0 0A
    jsr $8b4c              // 20 4C 8B
    ldx #$7a               // A2 7A
b00_8C4C:
    lda $8d00,x            // BD 00 8D
    sta $0960,x            // 9D 60 09
    dex                    // CA
    bpl b00_8C4C           // 10 F7
    lda $90                // A5 90   KERNAL I/O status
    sta $0961              // 8D 61 09
    lda $91                // A5 91
    sta $0962              // 8D 62 09
    lda #$73               // A9 73
    ldy #$8c               // A0 8C
    jsr $8af5              // 20 F5 8A
    ldx $8e                // A6 8E
    ldy $8f                // A4 8F
    stx $ae                // 86 AE   load end addr lo
    sty $af                // 84 AF   load end addr hi
    jsr $9f03              // 20 03 9F
    .byte $24, $80         // inline arg: cross-bank call target $8024
    inc $01                // E6 01   CPU port: mem banking
    lda #$aa               // A9 AA
    sta $8e                // 85 8E
    lda #$0d               // A9 0D
    sta $8f                // 85 8F
b00_8C7D:
    lda ($90),y            // B1 90
    sta ($8e),y            // 91 8E
    inc $8e                // E6 8E
    bne b00_8C87           // D0 02
    inc $8f                // E6 8F
b00_8C87:
    inc $90                // E6 90   KERNAL I/O status
    bne b00_8C7D           // D0 F2
    inc $91                // E6 91
    bne b00_8C7D           // D0 EE
    lda $8e                // A5 8E
    sec                    // 38
    sbc #$ab               // E9 AB
    sta $081a              // 8D 1A 08
    eor #$ff               // 49 FF
    sta $081f              // 8D 1F 08
    lda $8f                // A5 8F
    sbc #$00               // E9 00
    sta $081d              // 8D 1D 08
    dec $01                // C6 01   CPU port: mem banking
    jsr $9e8a              // 20 8A 9E
    ldx #$4f               // A2 4F
b00_8CAA:
    lda $9f90,x            // BD 90 9F
    sta $0d00,x            // 9D 00 0D
    dex                    // CA
    bpl b00_8CAA           // 10 F7
    lda $9fec              // AD EC 9F
    asl                    // 0A
    ror $0881              // 6E 81 08
    lda $9f6c              // AD 6C 9F
    sta $0834              // 8D 34 08
    lda #$35               // A9 35
    sta $0901              // 8D 01 09
    lda $9fee              // AD EE 9F
    tax                    // AA
    lda $9fef              // AD EF 9F
    tay                    // A8
    ora $9fee              // 0D EE 9F
    beq b00_8CEC           // F0 1A
    stx $09c5              // 8E C5 09
    sty $09c6              // 8C C6 09
    inx                    // E8
    bne b00_8CDC           // D0 01
    iny                    // C8
b00_8CDC:
    stx $09ca              // 8E CA 09
    sty $09cb              // 8C CB 09
    ldx #$08               // A2 08
    lda #$ea               // A9 EA
b00_8CE6:
    sta $08d8,x            // 9D D8 08
    dex                    // CA
    bpl b00_8CE6           // 10 FA
b00_8CEC:
    lda $9fec              // AD EC 9F
    ldx #$8d               // A2 8D
    asl                    // 0A
    bmi b00_8CF7           // 30 03
    stx $09b2              // 8E B2 09
b00_8CF7:
    asl                    // 0A
    bmi b00_8CFD           // 30 03
    stx $09b8              // 8E B8 09
b00_8CFD:
    jmp $9eb2              // 4C B2 9E
    lda $ffff              // AD FF FF
    inc $61                // E6 61
    bne b00_8D09           // D0 02
    inc $62                // E6 62
b00_8D09:
    rts                    // 60
b00_8D0A:
    jsr $0060              // 20 60 00
    tax                    // AA
    jsr $0060              // 20 60 00
b00_8D11:
    sta ($dc),y            // 91 DC
    iny                    // C8
    beq b00_8D42           // F0 2C
    dex                    // CA
    bne b00_8D11           // D0 F8
    beq b00_8D20           // F0 05
b00_8D1B:
    jsr $0060              // 20 60 00
    sta $84                // 85 84
b00_8D20:
    jsr $0060              // 20 60 00
    cmp #$ff               // C9 FF
    beq b00_8D0A           // F0 E3
    sta ($dc),y            // 91 DC
    iny                    // C8
    bne b00_8D20           // D0 F4
    beq b00_8D42           // F0 14
b00_8D2E:
    asl $df                // 06 DF
    bcc b00_8D36           // 90 04
    rol $df                // 26 DF
    dec $97                // C6 97
b00_8D36:
    lsr $ff                // 46 FF
    bcc b00_8D1B           // 90 E1
b00_8D3A:
    jsr $0060              // 20 60 00
    sta ($dc),y            // 91 DC
    iny                    // C8
    bne b00_8D3A           // D0 F8
b00_8D42:
    inc $dd                // E6 DD
    bne b00_8D2E           // D0 E8
    inc $01                // E6 01   CPU port: mem banking
b00_8D48:
    lda $d012              // AD 12 D0   VIC raster
    cmp #$80               // C9 80
    bne b00_8D48           // D0 F9
    lda $dc08              // AD 08 DC
    lda $dc08              // AD 08 DC
    lda $dd08              // AD 08 DD
    lda $dd08              // AD 08 DD
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    dec $01                // C6 01   CPU port: mem banking
    lda #$ff               // A9 FF
    sta.abs $0060          // 8D 60 00
    lda #$ff               // A9 FF
    sta.abs $0060          // 8D 60 00
    ldx #$0a               // A2 0A
    jmp $0011              // 4C 11 00
    lda #$7b               // A9 7B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    inc $01                // E6 01   CPU port: mem banking
    sty $90                // 84 90   KERNAL I/O status
    sty $91                // 84 91
    sty $dc                // 84 DC
    sty $dd                // 84 DD
    lda #$80               // A9 80
    sta $df                // 85 DF
b00_8D84:
    dec $dd                // C6 DD
    lda #$00               // A9 00
b00_8D88:
    clc                    // 18
    adc #$01               // 69 01
    beq b00_8DE2           // F0 55
    dec $01                // C6 01   CPU port: mem banking
    inc $d020              // EE 20 D0   VIC border color
    inc $01                // E6 01   CPU port: mem banking
    ldy #$00               // A0 00
b00_8D96:
    cmp ($dc),y            // D1 DC
    beq b00_8D88           // F0 EE
    iny                    // C8
    bne b00_8D96           // D0 F9
    sta $94                // 85 94
    sty $93                // 84 93
    dey                    // 88
b00_8DA2:
    jsr $018d              // 20 8D 01
b00_8DA5:
    inx                    // E8
    dey                    // 88
    cpy #$ff               // C0 FF
    beq b00_8DAF           // F0 04
    cmp ($dc),y            // D1 DC
    beq b00_8DA5           // F0 F6
b00_8DAF:
    cpx #$01               // E0 01
    beq b00_8DD2           // F0 1F
    cpx #$00               // E0 00
    beq b00_8DC7           // F0 10
    cpx #$04               // E0 04
    bcs b00_8DC7           // B0 0C
    stx $95                // 86 95
b00_8DBD:
    dec $95                // C6 95
    beq b00_8DD2           // F0 11
    jsr $018f              // 20 8F 01
    clc                    // 18
    bcc b00_8DBD           // 90 F6
b00_8DC7:
    ror $93                // 66 93
    txa                    // 8A
    jsr $018f              // 20 8F 01
    lda $94                // A5 94
    jsr $018f              // 20 8F 01
b00_8DD2:
    cpy #$ff               // C0 FF
    bne b00_8DA2           // D0 CC
    lda $93                // A5 93
    beq b00_8DEC           // F0 12
    lda $94                // A5 94
    jsr $018f              // 20 8F 01
    clc                    // 18
    bcc b00_8DEC           // 90 0A
b00_8DE2:
    ldy #$ff               // A0 FF
b00_8DE4:
    jsr $018d              // 20 8D 01
    dey                    // 88
    cpy #$ff               // C0 FF
    bne b00_8DE4           // D0 F8
b00_8DEC:
    rol $e0                // 26 E0
    lsr $df                // 46 DF
    bcc b00_8DF7           // 90 05
    ror $df                // 66 DF
    inc $017c              // EE 7C 01
b00_8DF7:
    dec $92                // C6 92
    bne b00_8D84           // D0 89
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    lda ($dc),y            // B1 DC
    ldx #$00               // A2 00
    cpx $90                // E4 90   KERNAL I/O status
    bne b00_8E08           // D0 02
    dec $91                // C6 91
b00_8E08:
    dec $90                // C6 90   KERNAL I/O status
    sta ($90,x)            // 81 90
    rts                    // 60
    lda $0105,x            // BD 05 01
    sec                    // 38
    sbc #$02               // E9 02
    sta $0105,x            // 9D 05 01
    bcs b00_8E1B           // B0 03
    dec $0106,x            // DE 06 01
b00_8E1B:
    pla                    // 68
    tay                    // A8
    pla                    // 68
    tax                    // AA
    jmp $ee3b              // 4C 3B EE
    txa                    // 8A
    tsx                    // BA
    inc $0103,x            // FE 03 01
    bne b00_8E2C           // D0 03
    inc $0104,x            // FE 04 01
b00_8E2C:
    tax                    // AA
    jmp $ee3b              // 4C 3B EE
    sei                    // 78
    pha                    // 48
    lda #$7f               // A9 7F
    sta $dd0d              // 8D 0D DD   CIA2 ICR (NMI control/ack)
    bne b00_8E3B           // D0 02
    sei                    // 78
    pha                    // 48
b00_8E3B:
    lda $dd0e              // AD 0E DD   CIA2 CRA
    pha                    // 48
    lda $dd0f              // AD 0F DD   CIA2 CRB
    pha                    // 48
    lda #$7c               // A9 7C
    sta $dd0d              // 8D 0D DD   CIA2 ICR (NMI control/ack)
    lda #$00               // A9 00
    sta $dd0e              // 8D 0E DD   CIA2 CRA
    sta $dd0f              // 8D 0F DD   CIA2 CRB
    lda $dc0e              // AD 0E DC   CIA1 CRA
    pha                    // 48
    lda $dc0f              // AD 0F DC   CIA1 CRB
    pha                    // 48
    lda #$00               // A9 00
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    lda $d012              // AD 12 D0   VIC raster
    pha                    // 48
    cld                    // D8
    txa                    // 8A
    pha                    // 48
    tya                    // 98
    pha                    // 48
    lda $00                // A5 00
    pha                    // 48
    lda #$2f               // A9 2F
    sta $00                // 85 00
    lda $d011              // AD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    and #$80               // 29 80
    ora $01                // 05 01   CPU port: mem banking
    pha                    // 48
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    lda $5f                // A5 5F
    pha                    // 48
    ldy #$00               // A0 00
    sty $5f                // 84 5F
    lda $dc08              // AD 08 DC
    pha                    // 48
    lda $dd08              // AD 08 DD
    ldx #$60               // A2 60
b00_8E8C:
    dey                    // 88
    bne b00_8E8C           // D0 FD
    dex                    // CA
    bne b00_8E8C           // D0 FA
    cmp $dd08              // CD 08 DD
    beq b00_8E98           // F0 01
    clc                    // 18
b00_8E98:
    ror $5f                // 66 5F
    pla                    // 68
    cmp $dc08              // CD 08 DC
    beq b00_8EA1           // F0 01
    clc                    // 18
b00_8EA1:
    ror $5f                // 66 5F
    lda $dc0b              // AD 0B DC
    lda $dd0b              // AD 0B DD
    jmp $eebb              // 4C BB EE
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    ldx #$00               // A2 00
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
b00_8EB6:
    dex                    // CA
    bne b00_8EB6           // D0 FD
    tax                    // AA
    rts                    // 60
    ldx $d41b              // AE 1B D4
b00_8EBE:
    iny                    // C8
    cpx $d41b              // EC 1B D4
    sec                    // 38
    bne b00_8EC9           // D0 04
    tya                    // 98
    bne b00_8EBE           // D0 F6
    clc                    // 18
b00_8EC9:
    ror $5f                // 66 5F
    ldx $5f                // A6 5F
    pla                    // 68
    sta $5f                // 85 5F
    txa                    // 8A
    pha                    // 48
    ldx #$00               // A2 00
    stx $d418              // 8E 18 D4   SID volume/filter mode
b00_8ED7:
    dey                    // 88
    bne b00_8ED7           // D0 FD
    dex                    // CA
    bne b00_8ED7           // D0 FA
    lda #$ee               // A9 EE
    pha                    // 48
    lda #$e9               // A9 E9
    pha                    // 48
    lda $fef6              // AD F6 FE
    jmp $eeb1              // 4C B1 EE
    nop                    // EA
    lda #$ee               // A9 EE
    pha                    // 48
    lda #$f6               // A9 F6
    pha                    // 48
    lda $fef4              // AD F4 FE
    jmp $eeb1              // 4C B1 EE
    nop                    // EA
    lda $9e14              // AD 14 9E
    cmp $fe14              // CD 14 FE
    bne b00_8F11           // D0 12
    inc $d020              // EE 20 D0   VIC border color
    nop                    // EA
    nop                    // EA
    nop                    // EA
    lda #$80               // A9 80
    pha                    // 48
    lda #$0b               // A9 0B
    pha                    // 48
    lda $feed              // AD ED FE
    jmp $eeb1              // 4C B1 EE
b00_8F11:
    ldx #$00               // A2 00
b00_8F13:
    lda $00,x              // B5 00
    sta $8000,x            // 9D 00 80
    lda $0100,x            // BD 00 01
    sta $8100,x            // 9D 00 81
    cpx #$f7               // E0 F7
    bcs b00_8F34           // B0 12
    cpx #$13               // E0 13
    bcc b00_8F2C           // 90 06
    lda $fe00,x            // BD 00 FE
    sta $9e00,x            // 9D 00 9E
b00_8F2C:
    cpx #$02               // E0 02
    bcc b00_8F34           // 90 04
    lda #$00               // A9 00
    sta $00,x              // 95 00
b00_8F34:
    inx                    // E8
    bne b00_8F13           // D0 DC
    pla                    // 68
    sta $ec                // 85 EC
    pla                    // 68
    sta $5f                // 85 5F
    and #$7f               // 29 7F
    sta $e7                // 85 E7
    pla                    // 68
    sta $e8                // 85 E8
    pla                    // 68
    sta $e5                // 85 E5
    pla                    // 68
    sta $e4                // 85 E4
    pla                    // 68
    sta $5e                // 85 5E
    pla                    // 68
    sta $cf                // 85 CF
    pla                    // 68
    sta $ce                // 85 CE
    pla                    // 68
    sta $df                // 85 DF
    pla                    // 68
    sta $de                // 85 DE
    tsx                    // BA
    stx $6c                // 86 6C
    pla                    // 68
    sta $e3                // 85 E3
    pla                    // 68
    sta $e2                // 85 E2
    pla                    // 68
    sta $e1                // 85 E1
    pla                    // 68
    sta $e0                // 85 E0
    tsx                    // BA
    stx $e6                // 86 E6
    ldx #$fb               // A2 FB
    txs                    // 9A
    ldy $fef5              // AC F5 FE
    ldx #$00               // A2 00
    lda $9ef8              // AD F8 9E
    cmp $fe14              // CD 14 FE
    bne b00_8F7D           // D0 02
    ldy #$0a               // A0 0A
b00_8F7D:
    sty $eb                // 84 EB
    ldy #$00               // A0 00
b00_8F81:
    ldx #$0f               // A2 0F
b00_8F83:
    lda $9f80,x            // BD 80 9F
    sta $80,x              // 95 80
    tya                    // 98
    sta $9f80,x            // 9D 80 9F
    dex                    // CA
    bpl b00_8F83           // 10 F4
    ldx #$aa               // A2 AA
    lda #$55               // A9 55
    cpx $80                // E4 80
    stx $80                // 86 80
    stx $9f80              // 8E 80 9F
    bne b00_8F81           // D0 E5
    cmp $81                // C5 81
    sta $81                // 85 81
    sta $9f81              // 8D 81 9F
    bne b00_8F81           // D0 DC
    ldx #$1d               // A2 1D
b00_8FA7:
    lda $9f40,x            // BD 40 9F
    sta $40,x              // 95 40
    dex                    // CA
    bpl b00_8FA7           // 10 F8
    lda #$80               // A9 80
    pha                    // 48
    lda #$17               // A9 17
    pha                    // 48
    lda #$02               // A9 02
    ldy #$82               // A0 82
    ldx #$08               // A2 08
    jmp $9e41              // 4C 41 9E
bank00_api_05:
    nop                    // EA
    lda $5f                // A5 5F
    sta $3f                // 85 3F
    lda $5e                // A5 5E
    sta $3e                // 85 3E
    lda #$0e               // A9 0E
    sta $3b                // 85 3B
    ldx #$3a               // A2 3A
    ldy #$03               // A0 03
    lda $3e                // A5 3E
    cmp #$33               // C9 33
    bcs bank00_sub_8FDC              // B0 07
    dec $3b                // C6 3B
    dec $3b                // C6 3B
    dey                    // 88
    ldx #$e4               // A2 E4
bank00_sub_8FDC:
    stx $3c                // 86 3C
    sty $3d                // 84 3D
    ldy #$10               // A0 10
    bit $3f                // 24 3F
    bmi bank00_sub_8FE8              // 30 02
    ldy #$30               // A0 30
bank00_sub_8FE8:
    lda $3e                // A5 3E
    sec                    // 38
    sbc $3b                // E5 3B
    bcs bank00_sub_8FF5              // B0 06
    cpy #$30               // C0 30
    bne bank00_sub_8FF5              // D0 02
    lda #$00               // A9 00
bank00_sub_8FF5:
    ldy #$30               // A0 30
    sta $3e                // 85 3E
    sty $3f                // 84 3F
    ldx #$65               // A2 65
    ldy #$91               // A0 91
    stx $0318              // 8E 18 03   NMINV NMI vector
    sty $0319              // 8C 19 03
    ldx #$2f               // A2 2F
bank00_sub_9007:
    lda $cfff,x            // BD FF CF
    sta $8f,x              // 95 8F
    dex                    // CA
    bne bank00_sub_9007              // D0 F8
    lda $aa                // A5 AA
    stx $d01a              // 8E 1A D0   VIC IRQ enable
    stx $a1                // 86 A1
    stx $a2                // 86 A2
bank00_sub_9018:
    ldy #$ff               // A0 FF
    sty $d019              // 8C 19 D0   VIC IRQ flags
    iny                    // C8
bank00_sub_901E:
    lda $d019              // AD 19 D0   VIC IRQ flags
    lsr                  // 4A
    bcs bank00_sub_9037              // B0 13
    dex                    // CA
    bne bank00_sub_901E              // D0 F7
    dey                    // 88
    bne bank00_sub_901E              // D0 F4
    lda $d011              // AD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    and #$7f               // 29 7F
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    sec                    // 38
    ror $a1                // 66 A1
    bne bank00_sub_9018              // D0 E1
bank00_sub_9037:
    ldx $d012              // AE 12 D0   VIC raster
    lda $d011              // AD 11 D0   VIC control 1 (screen on/off, YSCROLL)
    ora $a1                // 05 A1
    sta $a1                // 85 A1
    stx $a2                // 86 A2
    ldx #$0c               // A2 0C
bank00_sub_9045:
    lda $dc00,x            // BD 00 DC   CIA1 port A (keyboard cols / joy2)
    sta $c0,x              // 95 C0
    lda $dd00,x            // BD 00 DD   CIA2 port A (VIC bank, IEC lines)
    sta $d0,x              // 95 D0
    dex                    // CA
    bpl bank00_sub_9045              // 10 F3
    lda $dc0b              // AD 0B DC
    lda $dd0b              // AD 0B DD
    stx $dc03              // 8E 03 DC   CIA1 DDR B
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    sta $c1                // 85 C1   I/O start addr lo
    stx $dd03              // 8E 03 DD   CIA2 DDR B
    lda $dd01              // AD 01 DD   CIA2 port B (user port)
    sta $d1                // 85 D1
    jsr bank00_sub_911C              // 20 1C 91
    sei                    // 78
    lda #$10               // A9 10
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    sta $dd0e              // 8D 0E DD   CIA2 CRA
    sta $dd0f              // 8D 0F DD   CIA2 CRB
    ldx #$03               // A2 03
bank00_sub_907C:
    lda $c4,x              // B5 C4
    sta $37,x              // 95 37   BASIC mem top lo
    lda $dc04,x            // BD 04 DC   CIA1 timer A lo
    sta $c4,x              // 95 C4
    lda $d4,x              // B5 D4
    sta $33,x              // 95 33
    lda $dd04,x            // BD 04 DD
    sta $d4,x              // 95 D4
    dex                    // CA
    bpl bank00_sub_907C              // 10 EB
    ldx #$02               // A2 02
    ldy #$01               // A0 01
bank00_sub_9095:
    lda #$80               // A9 80
    sta $dc04,x            // 9D 04 DC   CIA1 timer A lo
    lda #$00               // A9 00
    sta $dc05,x            // 9D 05 DC   CIA1 timer A hi
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    lda #$19               // A9 19
    sta $dc0e,y            // 99 0E DC   CIA1 CRA
bank00_sub_90A7:
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    bpl bank00_sub_90B2              // 10 06
    and #$83               // 29 83
    ora $cd                // 05 CD
    sta $cd                // 85 CD
bank00_sub_90B2:
    dec $ff                // C6 FF
    bne bank00_sub_90A7              // D0 F1
    lda #$08               // A9 08
    sta $dc0e,y            // 99 0E DC   CIA1 CRA
    dex                    // CA
    dex                    // CA
    dey                    // 88
    bpl bank00_sub_9095              // 10 D5
    ldx #$02               // A2 02
    ldy #$01               // A0 01
bank00_sub_90C4:
    lda #$80               // A9 80
    sta $dd04,x            // 9D 04 DD
    lda #$00               // A9 00
    sta $dd05,x            // 9D 05 DD
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    lda #$19               // A9 19
    sta $dd0e,y            // 99 0E DD   CIA2 CRA
bank00_sub_90D6:
    dec $ff                // C6 FF
    nop                    // EA
    bne bank00_sub_90D6              // D0 FB
    lda #$08               // A9 08
    sta $dd0e,y            // 99 0E DD   CIA2 CRA
    dex                    // CA
    dex                    // CA
    dey                    // 88
    bpl bank00_sub_90C4              // 10 DF
    ldx #$7f               // A2 7F
    stx $dd0d              // 8E 0D DD   CIA2 ICR (NMI control/ack)
    stx $dc0d              // 8E 0D DC   CIA1 ICR (IRQ control/ack)
    lda $cd                // A5 CD
    bmi bank00_sub_90F3              // 30 02
    stx $cd                // 86 CD
bank00_sub_90F3:
    lda $dd                // A5 DD
    bmi bank00_sub_90F9              // 30 02
    stx $dd                // 86 DD
bank00_sub_90F9:
    lda #$0c               // A9 0C
    sta $7e                // 85 7E
    lda #$80               // A9 80
    sta $7f                // 85 7F
    lda #$0a               // A9 0A
    sta $78                // 85 78
    ldx #$06               // A2 06
bank00_sub_9107:
    dec $2c,x              // D6 2C   BASIC prog start hi
    dex                    // CA
    bne bank00_sub_9107              // D0 FB
    txa                    // 8A
    inx                    // E8
    ldy #$08               // A0 08
    jsr bank00_sub_8015              // 20 15 80
    jsr bank00_sub_804E              // 20 4E 80
    jsr bank00_sub_8B3D              // 20 3D 8B
    jmp bank00_sub_800F              // 4C 0F 80
bank00_sub_911C:
    lda $d0                // A5 D0
    and #$03               // 29 03
    sta $70                // 85 70
    tax                    // AA
    lda $9161,x            // BD 61 91
    sta $71                // 85 71
    lda $a8                // A5 A8
    tay                    // A8
    and #$0e               // 29 0E
    asl                  // 0A
    asl                  // 0A
    ora $71                // 05 71
    sta $74                // 85 74
    tya                    // 98
    and #$f0               // 29 F0
    lsr                  // 4A
    lsr                  // 4A
    ora $71                // 05 71
    sta $72                // 85 72
    tya                    // 98
    and #$08               // 29 08
    asl                  // 0A
    asl                  // 0A
    ora $71                // 05 71
    sta $73                // 85 73   CHRGET
    lda $a6                // A5 A6
    and #$10               // 29 10
    php                    // 08
    ldx #$00               // A2 00
    lda $a1                // A5 A1
    tay                    // A8
    and #$20               // 29 20
    beq bank00_sub_9155              // F0 02
    ldx #$02               // A2 02
bank00_sub_9155:
    plp                    // 28
    beq bank00_sub_9159              // F0 01
    inx                    // E8
bank00_sub_9159:
    stx $75                // 86 75
    tya                    // 98
    and #$40               // 29 40
    sta $76                // 85 76
    rts                    // 60
bank00_data_9161:
.errorif (* != $9161), "bank00_data_9161 shifted"
    cpy #$80               // C0 80
    rti                    // 40
    brk                    // 00
    pha                    // 48
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    bpl b00_9171           // 10 06
    and #$83               // 29 83
    ora $dd                // 05 DD
    sta $dd                // 85 DD
b00_9171:
    pla                    // 68
    rti                    // 40
    jsr $9933              // 20 33 99
    jmp $8763              // 4C 63 87
    jsr $98b9              // 20 B9 98
    bmi b00_91B8           // 30 3A
    sta $0883              // 8D 83 08
    pha                    // 48
    jsr b00_91BB           // 20 BB 91
    pla                    // 68
    sta $ba                // 85 BA   current device
    ldx #$f4               // A2 F4
    stx $0331              // 8E 31 03
    inx                    // E8
    stx $0333              // 8E 33 03
    jsr $9f01              // 20 01 9F
    .byte $24, $80         // inline arg: cross-bank call target $8024
    lda #$0a               // A9 0A
    sta $08eb              // 8D EB 08
    jsr b00_91BB           // 20 BB 91
    jsr $8763              // 20 63 87
    .byte $0D, $0D, $0D, $20, $54, $55, $52, $42, $4F, $4C, $49, $4E, $4B, $45, $52, $20    // data $91A1  text: "... TURBOLINKER "
    .byte $4F, $4B, $0D, $00    // data $91B1  text: "OK.."
    jsr $8a9e              // 20 9E 8A
b00_91B8:
    jmp ($0334)            // 6C 34 03
b00_91BB:
    lda #$83               // A9 83
    ldy #$03               // A0 03
    ldx #$01               // A2 01
    jmp $8012              // 4C 12 80
    inc $8e                // E6 8E
    bne b00_91CA           // D0 02
    inc $8f                // E6 8F
b00_91CA:
    rts                    // 60
    jsr $9f03              // 20 03 9F
    .byte $5A, $80         // inline arg: cross-bank call target $805A
    ldx #$43               // A2 43
    jsr $9947              // 20 47 99
    ldy #$1e               // A0 1E
    sty $a0                // 84 A0
    sty $a1                // 84 A1
    cmp #$00               // C9 00
    beq b00_91EB           // F0 0C
    cmp #$01               // C9 01
    beq b00_91E7           // F0 04
    cmp #$02               // C9 02
    beq b00_91E9           // F0 02
b00_91E7:
    inc $a0                // E6 A0
b00_91E9:
    inc $a1                // E6 A1
b00_91EB:
    ldx #$06               // A2 06
b00_91ED:
    lda $9273,x            // BD 73 92
    sta $4f,x              // 95 4F
    dex                    // CA
    bne b00_91ED           // D0 F8
    stx $8d                // 86 8D
    stx $8e                // 86 8E
    lda #$04               // A9 04
    sta $8f                // 85 8F
    jsr $8ae0              // 20 E0 8A
    lda #$2d               // A9 2D
    ldy #$92               // A0 92
    jsr $8af5              // 20 F5 8A
    jsr $8b86              // 20 86 8B
    lda $8d                // A5 8D
    pha                    // 48
    jsr $8763              // 20 63 87
    .byte $0D, $0D, $4F, $43, $43, $55, $52, $52, $45, $4E, $43, $45, $53, $3A, $20, $00    // data $9210  text: "..OCCURRENCES: ."
    pla                    // 68
    tax                    // AA
    lda #$00               // A9 00
    jsr $bdcd              // 20 CD BD
    jsr $98b4              // 20 B4 98
    jmp $8a9e              // 4C 9E 8A
    lda $01                // A5 01   CPU port: mem banking
    pha                    // 48
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
b00_9234:
    ldy #$01               // A0 01
b00_9236:
    inc $8e                // E6 8E
    bne b00_923E           // D0 04
    inc $8f                // E6 8F
    beq b00_9270           // F0 32
b00_923E:
    lda ($8e),y            // B1 8E
    cmp $a0                // C5 A0
    beq b00_9248           // F0 04
    cmp $a1                // C5 A1
    bne b00_9236           // D0 EE
b00_9248:
    iny                    // C8
    lda ($8e),y            // B1 8E
    cmp #$d0               // C9 D0
    bne b00_9234           // D0 E5
    ldy #$00               // A0 00
    lda ($8e),y            // B1 8E
    ldx #$02               // A2 02
b00_9255:
    cmp $50,x              // D5 50
    beq b00_925E           // F0 05
    dex                    // CA
    bpl b00_9255           // 10 F9
    bmi b00_9234           // 30 D6
b00_925E:
    inc $8d                // E6 8D
    lda $53,x              // B5 53
    sta ($8e),y            // 91 8E
    iny                    // C8
    lda #$00               // A9 00
    sta ($8e),y            // 91 8E
    iny                    // C8
    lda #$ea               // A9 EA
    sta ($8e),y            // 91 8E
    bne b00_9234           // D0 C4
b00_9270:
    pla                    // 68
    sta $01                // 85 01   CPU port: mem banking
    rts                    // 60
    lda $acae              // AD AE AC
    lda #$a2               // A9 A2
    .byte $A0    // A0  undocumented/illegal at $9279
bank00_sub_927A:
    lda $0886              // AD 86 08
    beq bank00_sub_9298              // F0 19
    lda #$1a               // A9 1A
    sta $05f7              // 8D F7 05
    lda #$2d               // A9 2D
    sta $05f9              // 8D F9 05
    ldy #$09               // A0 09
bank00_sub_928B:
    lda $0886,y            // B9 86 08
    and #$3f               // 29 3F
    beq bank00_sub_9295              // F0 03
    sta $05fb,y            // 99 FB 05
bank00_sub_9295:
    dey                    // 88
    bpl bank00_sub_928B              // 10 F3
bank00_sub_9298:
    rts                    // 60
bank00_data_9299:
.errorif (* != $9299), "bank00_data_9299 shifted"
    lda $0886              // AD 86 08
    beq $9298              // F0 FA
    jsr $99da              // 20 DA 99
    jsr $9f01              // 20 01 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    jmp b00_92F6           // 4C F6 92
    jsr $8763              // 20 63 87
    .byte $46, $49, $4C, $45, $4E, $41, $4D, $45, $20, $3A, $20, $00    // data $92AC  text: "FILENAME : ."
    jsr $9f62              // 20 62 9F
    beq b00_92F9           // F0 3C
    lda #$08               // A9 08
    sta $ba                // 85 BA   current device
    ldy #$01               // A0 01
    lda ($bb),y            // B1 BB
    cmp #$2e               // C9 2E
    bne b00_92F9           // D0 30
    dey                    // 88
    lda ($bb),y            // B1 BB
    cmp #$45               // C9 45
    bne b00_92F9           // D0 29
    jsr $99da              // 20 DA 99
    jsr $9f01              // 20 01 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    lda #$00               // A9 00
    sta $b9                // 85 B9   secondary addr
    tax                    // AA
    ldy #$0a               // A0 0A
    jsr $9f01              // 20 01 9F
    .byte $D5, $FF         // inline arg: cross-bank call target $FFD5
    bcs b00_92FC           // B0 16
    ldy #$02               // A0 02
b00_92E8:
    lda ($bb),y            // B1 BB
    sta $0884,y            // 99 84 08
    iny                    // C8
    cpy #$0b               // C0 0B
    beq b00_92F6           // F0 04
    cpy $b7                // C4 B7   filename length
    bne b00_92E8           // D0 F2
b00_92F6:
    jsr $0a00              // 20 00 0A
b00_92F9:
    jmp ($0334)            // 6C 34 03
b00_92FC:
    jmp b00_9446           // 4C 46 94
    jsr $8763              // 20 63 87
    .byte $43, $55, $52, $52, $45, $4E, $54, $20, $53, $43, $52, $45, $45, $4E, $3A, $20    // data $9302  text: "CURRENT SCREEN: "
    .byte $00    // data $9312  text: "."
    lda $08a1              // AD A1 08
    and #$20               // 29 20
    beq b00_9348           // F0 2E
    lda $08a6              // AD A6 08
    and #$10               // 29 10
    beq b00_9337           // F0 16
    jsr $8763              // 20 63 87
    .byte $4D, $55, $4C, $54, $49, $43, $4F, $4C, $4F, $52, $20, $50, $49, $43, $00    // data $9324  text: "MULTICOLOR PIC."
    ldx #$00               // A2 00
    beq b00_937B           // F0 44
b00_9337:
    jsr $8763              // 20 63 87
    .byte $48, $49, $52, $45, $53, $20, $50, $49, $43, $00    // data $933A  text: "HIRES PIC."
    ldx #$01               // A2 01
    bne b00_937B           // D0 33
b00_9348:
    lda $08a6              // AD A6 08
    and #$10               // 29 10
    beq b00_9368           // F0 19
    jsr $8763              // 20 63 87
    .byte $4D, $55, $4C, $54, $49, $43, $4F, $4C, $4F, $52, $20, $53, $43, $52, $45, $45    // data $9352  text: "MULTICOLOR SCREE"
    .byte $4E, $00    // data $9362  text: "N."
    ldx #$02               // A2 02
    bne b00_937B           // D0 13
b00_9368:
    jsr $8763              // 20 63 87
    .byte $4E, $4F, $52, $4D, $41, $4C, $20, $53, $43, $52, $45, $45, $4E, $00    // data $936B  text: "NORMAL SCREEN."
    ldx #$03               // A2 03
b00_937B:
    stx $02                // 86 02
    jsr $9f03              // 20 03 9F
    .byte $45, $80         // inline arg: cross-bank call target $8045
b00_9382:
    ldx #$47               // A2 47
    jsr $9947              // 20 47 99
    sta $3e                // 85 3E
    asl                    // 0A
    tax                    // AA
    lda $9758,x            // BD 58 97
    sta $c3                // 85 C3
    lda $9759,x            // BD 59 97
    sta $c4                // 85 C4
    lda $974a,x            // BD 4A 97
    sta $a9                // 85 A9
    lda $974b,x            // BD 4B 97
    sta $aa                // 85 AA
    ldy #$10               // A0 10
b00_93A1:
    lda ($a9),y            // B1 A9
    sta $004c,y            // 99 4C 00
    dey                    // 88
    bpl b00_93A1           // 10 F8
    lda $08d0              // AD D0 08
    and #$03               // 29 03
    eor #$03               // 49 03
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    sta $42                // 85 42
    sta $44                // 85 44
    lda #$00               // A9 00
    sta $41                // 85 41
    sta $43                // 85 43
    jmp ($00c3)            // 6C C3 00
    ldx $02                // A6 02
    cpx #$02               // E0 02
    bcc b00_9382           // 90 B9
    lda $08a8              // AD A8 08
    and #$0e               // 29 0E
    asl                    // 0A
    asl                    // 0A
    clc                    // 18
    adc $42                // 65 42
    sta $44                // 85 44
    jmp b00_958A           // 4C 8A 95
    ldx $02                // A6 02
    cpx #$01               // E0 01
    beq b00_9382           // F0 A4
    lda $08a8              // AD A8 08
    tax                    // AA
    and #$f0               // 29 F0
    lsr                    // 4A
    lsr                    // 4A
    clc                    // 18
    adc $44                // 65 44
    sta $44                // 85 44
    jmp b00_958A           // 4C 8A 95
    lda #$00               // A9 00
    sta $43                // 85 43
    lda #$d8               // A9 D8
    sta $44                // 85 44
    jmp b00_958A           // 4C 8A 95
    lda $02                // A5 02
    cmp #$02               // C9 02
    bcs b00_9382           // B0 83
    lda $08a8              // AD A8 08
    and #$08               // 29 08
    beq b00_940D           // F0 07
    clc                    // 18
    lda $44                // A5 44
    adc #$20               // 69 20
    sta $44                // 85 44
b00_940D:
    jmp b00_958A           // 4C 8A 95
    lda $02                // A5 02
    beq b00_9417           // F0 03
    jmp b00_9382           // 4C 82 93
b00_9417:
    jsr $989f              // 20 9F 98
    cmp #$ff               // C9 FF
    beq b00_9449           // F0 2B
    ldy #$1c               // A0 1C
b00_9420:
    lda $96c2,y            // B9 C2 96
    sta $0040,y            // 99 40 00
    dey                    // 88
    bpl b00_9420           // 10 F7
    jsr b00_9682           // 20 82 96
    ldx $4f                // A6 4F
    ldy $50                // A4 50
    jsr b00_986A           // 20 6A 98
    bcs b00_9446           // B0 11
    jsr $f68f              // 20 8F F6
    lda #$0b               // A9 0B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    jsr $8ae9              // 20 E9 8A
    jsr b00_9643           // 20 43 96
    jsr b00_94E7           // 20 E7 94
b00_9446:
    jsr b00_988F           // 20 8F 98
b00_9449:
    jmp $91b5              // 4C B5 91
    jsr $9933              // 20 33 99
    jsr $9f02              // 20 02 9F
    .byte $2D, $80         // inline arg: cross-bank call target $802D
    lda $03b0              // AD B0 03
    cmp #$ff               // C9 FF
    bne b00_945E           // D0 03
    jmp $91b8              // 4C B8 91
b00_945E:
    jsr $989f              // 20 9F 98
    cmp #$ff               // C9 FF
    beq b00_9449           // F0 E4
    ldx #$00               // A2 00
    stx $ff                // 86 FF
    lda #$03               // A9 03
    sta $02ca              // 8D CA 02
    ldy #$12               // A0 12
    lda $03b0              // AD B0 03
    beq b00_948B           // F0 16
b00_9475:
    lda $9730,y            // B9 30 97
    sta $004c,y            // 99 4C 00
    dey                    // 88
    bpl b00_9475           // 10 F7
    ldx #$0f               // A2 0F
b00_9480:
    lda $8085,x            // BD 85 80
    sta $03e9,x            // 9D E9 03
    dex                    // CA
    bpl b00_9480           // 10 F7
    bmi b00_9494           // 30 09
b00_948B:
    lda $971f,y            // B9 1F 97
    sta $004c,y            // 99 4C 00
    dey                    // 88
    bpl b00_948B           // 10 F7
b00_9494:
    jsr b00_9682           // 20 82 96
    ldx $4f                // A6 4F
    ldy $50                // A4 50
    jsr b00_986A           // 20 6A 98
    bcs b00_94E4           // B0 44
    jsr $f68f              // 20 8F F6
    lda #$0b               // A9 0B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    jsr $8ae9              // 20 E9 8A
    ldy #$00               // A0 00
b00_94AD:
    ldx $ff                // A6 FF
    lda $03b0,x            // BD B0 03
    sta $008c,y            // 99 8C 00
    inc $ff                // E6 FF
    iny                    // C8
    cpy #$04               // C0 04
    bne b00_94AD           // D0 F1
    lda $8c                // A5 8C
    cmp #$ff               // C9 FF
    beq b00_94D8           // F0 16
    lda $8f                // A5 8F
    cmp #$d8               // C9 D8
    bne $94cb              // D0 03
    lda #$37               // A9 37
    bit $34a9              // 2C A9 34
    sta $4c                // 85 4C
    sta $02d3              // 8D D3 02
    jsr b00_9626           // 20 26 96
    jmp b00_94AD           // 4C AD 94
b00_94D8:
    jsr $995b              // 20 5B 99
    jsr $f63f              // 20 3F F6
    lda $0878              // AD 78 08
    sta $02ca              // 8D CA 02
b00_94E4:
    jmp b00_9446           // 4C 46 94
b00_94E7:
    lda #$40               // A9 40
    cmp $0871              // CD 71 08
    bcc b00_94EF           // 90 01
    lsr                    // 4A
b00_94EF:
    sta $c2                // 85 C2   I/O start addr hi
    sta $af                // 85 AF   load end addr hi
    ldx #$00               // A2 00
    stx $c1                // 86 C1   I/O start addr lo
    stx $ae                // 86 AE   load end addr lo
b00_94F9:
    txa                    // 8A
    asl                    // 0A
    tay                    // A8
    lda #$00               // A9 00
    sta $8e                // 85 8E
    lda $40,x              // B5 40
    jsr b00_9668           // 20 68 96
    sta $8f                // 85 8F
    lda $0045,y            // B9 45 00
    sta $8c                // 85 8C
    lda $0046,y            // B9 46 00
    sta $8d                // 85 8D
    jsr b00_9626           // 20 26 96
    inx                    // E8
    cpx #$03               // E0 03
    bne b00_94F9           // D0 E0
    jsr $995b              // 20 5B 99
    jmp $f63f              // 4C 3F F6
    jsr $9933              // 20 33 99
    jsr $8763              // 20 63 87
    .byte $53, $41, $56, $45, $20, $4D, $45, $4D, $4F, $52, $59, $0D, $0D, $46, $52, $4F    // data $9525  text: "SAVE MEMORY..FRO"
    .byte $4D, $20, $24, $30, $30, $30, $30, $9D, $9D, $9D, $9D, $00    // data $9535  text: "M $0000....."
    ldx #$05               // A2 05
    ldy #$0a               // A0 0A
    jsr $9f66              // 20 66 9F
    ldy #$4f               // A0 4F
    jsr b00_95CC           // 20 CC 95
    bcc b00_9552           // 90 03
    jmp $800c              // 4C 0C 80
b00_9552:
    jsr $8763              // 20 63 87
    .byte $20, $20, $54, $4F, $20, $24, $30, $30, $30, $30, $9D, $9D, $9D, $9D, $00    // data $9555  text: "  TO $0000....."
    ldx #$05               // A2 05
    ldy #$0a               // A0 0A
    jsr $9f66              // 20 66 9F
    ldy #$4d               // A0 4D
    jsr b00_95CC           // 20 CC 95
    bcc b00_9575           // 90 03
    jmp $800c              // 4C 0C 80
b00_9575:
    lda $4e                // A5 4E
    sec                    // 38
    sbc $50                // E5 50
    sta $4e                // 85 4E
    lda $4d                // A5 4D
    sbc $4f                // E5 4F
    sta $4d                // 85 4D
    lda $4f                // A5 4F
    sta $43                // 85 43
    lda $50                // A5 50
    sta $44                // 85 44
b00_958A:
    lda $4c                // A5 4C
    sta $02d3              // 8D D3 02
    jsr $989f              // 20 9F 98
    cmp #$ff               // C9 FF
    beq b00_95C9           // F0 33
    jsr b00_9682           // 20 82 96
    ldx $4f                // A6 4F
    ldy $50                // A4 50
    jsr b00_986A           // 20 6A 98
    bcs b00_95C6           // B0 24
    jsr $f68f              // 20 8F F6
    lda #$0b               // A9 0B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    jsr $8ae9              // 20 E9 8A
    lda $4d                // A5 4D
    sta $8c                // 85 8C
    lda $4e                // A5 4E
    sta $8d                // 85 8D
    lda $43                // A5 43
    sta $8e                // 85 8E
    lda $44                // A5 44
    sta $8f                // 85 8F
    jsr b00_9626           // 20 26 96
    jsr $995b              // 20 5B 99
    jsr $f63f              // 20 3F F6
b00_95C6:
    jsr b00_988F           // 20 8F 98
b00_95C9:
    jmp $91b5              // 4C B5 91
b00_95CC:
    jsr $0079              // 20 79 00
    cmp #$24               // C9 24
    bne $9624              // D0 51
    iny                    // C8
    jsr b00_95E1           // 20 E1 95
    bcs $9624              // B0 4B
    dey                    // 88
    jsr b00_95E1           // 20 E1 95
    bcs $9624              // B0 45
    clc                    // 18
    rts                    // 60
b00_95E1:
    jsr $0073              // 20 73 00
    jsr b00_9612           // 20 12 96
    bcs $9624              // B0 3B
    tax                    // AA
    jsr $0073              // 20 73 00
    jsr b00_9612           // 20 12 96
    bcs $9624              // B0 32
    jsr b00_9608           // 20 08 96
    sta $0000,y            // 99 00 00
    txa                    // 8A
    jsr b00_9608           // 20 08 96
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    ora $0000,y            // 19 00 00
    sta $0000,y            // 99 00 00
    clc                    // 18
    rts                    // 60
b00_9608:
    cmp #$41               // C9 41
    sec                    // 38
    bmi b00_960F           // 30 02
    sbc #$07               // E9 07
b00_960F:
    sbc #$30               // E9 30
    rts                    // 60
b00_9612:
    cmp #$47               // C9 47
    bcs $9624              // B0 0E
    cmp #$41               // C9 41
    bcs b00_9622           // B0 08
    cmp #$3a               // C9 3A
    bcs $9624              // B0 06
    cmp #$30               // C9 30
    bcc $9624              // 90 02
b00_9622:
    clc                    // 18
    bit $38                // 24 38   BASIC mem top hi
    rts                    // 60
b00_9626:
    ldy #$00               // A0 00
    jsr $02b3              // 20 B3 02
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr $91c4              // 20 C4 91
    cpy $8c                // C4 8C
    bne b00_963A           // D0 05
    dec $8d                // C6 8D
    inc $d020              // EE 20 D0   VIC border color
b00_963A:
    dec $8c                // C6 8C
    lda $8d                // A5 8D
    ora $8c                // 05 8C
    bne b00_9626           // D0 E4
    rts                    // 60
b00_9643:
    ldx #$00               // A2 00
    stx $8e                // 86 8E
    inx                    // E8
b00_9648:
    txa                    // 8A
    asl                    // 0A
    tay                    // A8
    lda #$37               // A9 37
    sta $02d3              // 8D D3 02
    lda #$d8               // A9 D8
    clc                    // 18
    adc $004c,y            // 79 4C 00
    bcs b00_9664           // B0 0C
    sta $8f                // 85 8F
    lda $004b,y            // B9 4B 00
    tay                    // A8
    lda $08b0,x            // BD B0 08
    jsr $02a7              // 20 A7 02
b00_9664:
    dex                    // CA
    bpl b00_9648           // 10 E1
    rts                    // 60
b00_9668:
    cmp #$02               // C9 02
    bne b00_9674           // D0 08
    lda #$37               // A9 37
    sta $02d3              // 8D D3 02
    lda #$d8               // A9 D8
    rts                    // 60
b00_9674:
    stx $02                // 86 02
    tax                    // AA
    lda #$34               // A9 34
    sta $02d3              // 8D D3 02
    lda $0872,x            // BD 72 08
    ldx $02                // A6 02
    rts                    // 60
b00_9682:
    jsr $9f52              // 20 52 9F
    lda $b7                // A5 B7   filename length
    bne b00_968C           // D0 03
    jmp $800c              // 4C 0C 80
b00_968C:
    ldx $52                // A6 52
    beq b00_96A3           // F0 13
b00_9690:
    lda $b7                // A5 B7   filename length
    cmp #$10               // C9 10
    bcs b00_9698           // B0 02
    inc $b7                // E6 B7   filename length
b00_9698:
    dec $bb                // C6 BB   filename ptr lo
    ldy #$00               // A0 00
    lda $52,x              // B5 52
    sta ($bb),y            // 91 BB
    dex                    // CA
    bne b00_9690           // D0 ED
b00_96A3:
    ldy $b7                // A4 B7   filename length
    cpy $51                // C4 51
    bcc b00_96AD           // 90 04
    ldy $51                // A4 51
    sty $b7                // 84 B7   filename length
b00_96AD:
    lda $58                // A5 58
    beq b00_96C1           // F0 10
    ldy $b7                // A4 B7   filename length
    ldx #$00               // A2 00
b00_96B5:
    lda $59,x              // B5 59
    sta ($bb),y            // 91 BB
    iny                    // C8
    inc $b7                // E6 B7   filename length
    inx                    // E8
    cpx $58                // E4 58
    bne b00_96B5           // D0 F4
b00_96C1:
    rts                    // 60
b00_96ED:
b00_9721:
// --- $96C2-$9768: screen-save format descriptors --------------------------
// Data records used by the F7/screen-saver: file name suffixes (".PIC",
// ".SCR7", ".COL4", ".BMP4", ".CHR4", ".FLI4") with memory ranges to save,
// followed at $974A by a pointer table into these records and into the
// save routines at $93xx-$95xx. Not code.
    .byte $01, $00, $02, $02, $02, $40, $1F, $E8, $03, $E9, $03, $FF, $FF, $E8, $03, $00    // data $96C2  ".....@.........."
    .byte $60, $0F, $05, $81, $50, $49, $43, $20, $00, $34, $E8, $03, $00, $10, $0C, $00    // data $96D2  "....PIC .4......"
    .byte $00, $00, $00, $00, $00, $04, $2E, $53, $43, $52, $37, $E8, $03, $00, $10, $0C    // data $96E2  ".......SCR7....."
    .byte $00, $00, $00, $00, $00, $00, $04, $2E, $43, $4F, $4C, $34, $40, $1F, $00, $20    // data $96F2  "........COL4@.. "
    .byte $0C, $00, $00, $00, $00, $00, $00, $04, $2E, $42, $4D, $50, $34, $00, $08, $00    // data $9702  ".........BMP4..."
    .byte $20, $0C, $00, $00, $00, $00, $00, $00, $04, $2E, $43, $48, $52, $34, $00, $08    // data $9712  " .........CHR4.."
    .byte $00, $3C, $0C, $00, $00, $00, $00, $00, $00, $04, $2E, $46, $4C, $49, $34, $00    // data $9722  ".<.........FLI4."
    .byte $08, $F0, $3F, $0F, $02, $5E, $5E, $00, $00, $00, $00, $34, $00, $08, $00, $20    // data $9732  "..?..^^....4... "
    .byte $10, $00, $00, $00, $00, $00, $00, $00, $DB, $96, $FD, $96, $0E, $97, $DB, $96    // data $9742  "................"
    .byte $EC, $96, $1F, $97, $3D, $97, $10, $94, $F9, $93, $C3, $93, $D8, $93, $EE, $93    // data $9752  "....=..........."
    .byte $4C, $94, $1F, $95, $6C, $34, $03    // data $9762  "L....4."
    lda #$72               // A9 72
    ldy #$97               // A0 97
    jsr $992c              // 20 2C 99
    bne b00_9778           // D0 06
b00_9772:
    jsr b00_984D           // 20 4D 98
    ldx #$fb               // A2 FB
    txs                    // 9A
b00_9778:
    jsr $8763              // 20 63 87
    .byte $50, $4F, $4B, $45, $20, $00    // data $977B  text: "POKE ."
    ldx #$05               // A2 05
    stx $8d                // 86 8D
    ldy #$10               // A0 10
    jsr $9f66              // 20 66 9F
    jsr $0079              // 20 79 00
    beq $9766              // F0 D7
    ldy #$00               // A0 00
b00_9791:
    lda ($7a),y            // B1 7A
    beq b00_9772           // F0 DD
    cmp #$2c               // C9 2C
    beq b00_979C           // F0 03
    iny                    // C8
    bne b00_9791           // D0 F5
b00_979C:
    cpy #$00               // C0 00
    beq b00_9772           // F0 D2
    sty $02                // 84 02
    ldy #$00               // A0 00
b00_97A4:
    lda ($7a),y            // B1 7A
    bne b00_97AB           // D0 03
    jmp b00_9839           // 4C 39 98
b00_97AB:
    cmp #$24               // C9 24
    beq b00_97B2           // F0 03
    iny                    // C8
    bne b00_97A4           // D0 F2
b00_97B2:
    jsr $0079              // 20 79 00
    cmp #$24               // C9 24
    bne b00_97F0           // D0 37
    ldy $02                // A4 02
    dey                    // 88
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    sta $14                // 85 14
    dey                    // 88
    beq b00_97F6           // F0 30
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    ora $14                // 05 14
    sta $14                // 85 14
    dey                    // 88
    beq b00_97F6           // F0 20
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    sta $15                // 85 15
    dey                    // 88
    beq b00_97F6           // F0 16
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    ora $15                // 05 15
    sta $15                // 85 15
    dey                    // 88
    beq b00_97F6           // F0 06
b00_97F0:
    jsr $ad8a              // 20 8A AD
    jsr $b7f7              // 20 F7 B7
b00_97F6:
    jsr $0079              // 20 79 00
    cmp #$2c               // C9 2C
    beq b00_9804           // F0 07
b00_97FD:
    jsr $0073              // 20 73 00
    cmp #$2c               // C9 2C
    bne b00_97FD           // D0 F9
b00_9804:
    jsr $0073              // 20 73 00
    cmp #$24               // C9 24
    bne b00_9833           // D0 28
    ldy #$01               // A0 01
b00_980D:
    lda ($7a),y            // B1 7A
    beq b00_9819           // F0 08
    iny                    // C8
    cpy #$04               // C0 04
    bne b00_980D           // D0 F7
    jmp b00_9772           // 4C 72 97
b00_9819:
    dey                    // 88
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    sta $02                // 85 02
    dey                    // 88
    beq b00_982F           // F0 0B
    lda ($7a),y            // B1 7A
    jsr b00_9859           // 20 59 98
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    asl                    // 0A
    ora $02                // 05 02
b00_982F:
    tax                    // AA
    jmp b00_983C           // 4C 3C 98
b00_9833:
    jsr $b79e              // 20 9E B7
    jmp b00_983C           // 4C 3C 98
b00_9839:
    jsr $b7eb              // 20 EB B7
b00_983C:
    txa                    // 8A
    ldy $14                // A4 14
    ldx #$00               // A2 00
    stx $8e                // 86 8E
    ldx $15                // A6 15
    stx $8f                // 86 8F
    jsr $02a7              // 20 A7 02
    jmp b00_9778           // 4C 78 97
b00_984D:
    jsr $8763              // 20 63 87
    .byte $45, $52, $52, $4F, $52, $21, $0D, $00    // data $9850  text: "ERROR!.."
    rts                    // 60
b00_9859:
    cmp #$47               // C9 47
    bcc b00_9860           // 90 03
    jmp b00_9772           // 4C 72 97
b00_9860:
    cmp #$41               // C9 41
    sec                    // 38
    bmi b00_9867           // 30 02
    sbc #$07               // E9 07
b00_9867:
    sbc #$30               // E9 30
    rts                    // 60
b00_986A:
    stx $c3                // 86 C3
    sty $c4                // 84 C4
    lda #$61               // A9 61
    sta $b9                // 85 B9   secondary addr
    jsr b00_9889           // 20 89 98
    lda $ba                // A5 BA   current device
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    lda $b9                // A5 B9   secondary addr
    jsr $ff93              // 20 93 FF   KERNAL SECOND
    lda $c3                // A5 C3
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda $c4                // A5 C4
    jmp $ffa8              // 4C A8 FF   KERNAL CIOUT: serial byte out
b00_9889:
    jsr $f3d5              // 20 D5 F3
    bcs b00_988F           // B0 01
    rts                    // 60
b00_988F:
    jsr $98b4              // 20 B4 98
    jsr $9f02              // 20 02 9F
    .byte $24, $80         // inline arg: cross-bank call target $8024
    rts                    // 60
bank00_sub_9898:
    sta $0334              // 8D 34 03
    sty $0335              // 8C 35 03
    rts                    // 60
bank00_data_989F:
.errorif (* != $989F), "bank00_data_989F shifted"
    lda $0877              // AD 77 08
    sta $ba                // 85 BA   current device
    jsr b00_98B9           // 20 B9 98
    cmp #$ff               // C9 FF
    bne b00_98AC           // D0 01
    rts                    // 60
b00_98AC:
    sta $0877              // 8D 77 08
    sta $ba                // 85 BA   current device
    jsr b00_9933           // 20 33 99
    lda #$0d               // A9 0D
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
b00_98B9:
    jsr b00_9933           // 20 33 99
b00_98BC:
    jsr $8763              // 20 63 87
    .byte $20, $53, $50, $41, $43, $45, $2A, $44, $45, $56, $49, $43, $45, $3A, $20, $00    // data $98BF  text: " SPACE*DEVICE: ."
    lda #$00               // A9 00
    ldx $ba                // A6 BA   current device
    cpx #$08               // E0 08
    bcc $98dc              // 90 05
    cpx #$1f               // E0 1F
    bcs $98dc              // B0 01
    bit $08a2              // 2C A2 08
    stx $ba                // 86 BA   current device
    jsr $bdcd              // 20 CD BD
    jsr $8763              // 20 63 87
    .byte $20, $0D, $52, $45, $54, $55, $52, $4E, $2A, $43, $4F, $4E, $54, $49, $4E, $55    // data $98E6  text: " .RETURN*CONTINU"
    .byte $45, $0D, $91, $91, $00    // data $98F6  text: "E...."
b00_98FB:
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    cmp #$20               // C9 20
    beq b00_990D           // F0 0B
    cmp #$0d               // C9 0D
    beq b00_9929           // F0 23
    cmp #$03               // C9 03
    bne b00_98FB           // D0 F1
    lda #$ff               // A9 FF
    rts                    // 60
b00_990D:
    lda $ba                // A5 BA   current device
    cmp #$1e               // C9 1E
    bne b00_9917           // D0 04
    lda #$07               // A9 07
    sta $ba                // 85 BA   current device
b00_9917:
    inc $ba                // E6 BA   current device
    jsr $9f02              // 20 02 9F
    .byte $0C, $80         // inline arg: cross-bank call target $800C
    beq b00_990D           // F0 ED
    jsr $9c9d              // 20 9D 9C
    jsr b00_993D           // 20 3D 99
    jmp b00_98BC           // 4C BC 98
b00_9929:
    lda $ba                // A5 BA   current device
    rts                    // 60
    sta $0300              // 8D 00 03   IERROR vector
    sty $0301              // 8C 01 03
    rts                    // 60
b00_9933:
    ldx #$0f               // A2 0F
b00_9935:
    jsr $e9ff              // 20 FF E9
    inx                    // E8
    cpx #$19               // E0 19
    bne b00_9935           // D0 F8
b00_993D:
    ldx #$0f               // A2 0F
    ldy #$00               // A0 00
bank00_sub_9941:
    clc                    // 18
    jmp $fff0              // 4C F0 FF   KERNAL PLOT: set/get cursor
bank00_data_9945:
.errorif (* != $9945), "bank00_data_9945 shifted"
    .byte $A2, $42, $E8, $86, $3F, $20, $A5, $8A, $C9, $41, $90, $F9, $C5, $3F, $B0, $F5    // data $9945
    .byte $E9, $40, $AA, $86, $3F, $60    // data $9955
bank00_sub_995B:
    lda #$01               // A9 01
    ldy #$00               // A0 00
bank00_sub_995F:
    sta $d800,y            // 99 00 D8
    sta $d900,y            // 99 00 D9
    sta $da00,y            // 99 00 DA
    sta $dae8,y            // 99 E8 DA
    iny                    // C8
    bne bank00_sub_995F              // D0 F1
    lda #$1b               // A9 1B
    sta $d011              // 8D 11 D0   VIC control 1 (screen on/off, YSCROLL)
    rts                    // 60
bank00_sub_9974:
    ldx #$53               // A2 53
bank00_sub_9976:
    lda $9986,x            // BD 86 99
    sta $02a7,x            // 9D A7 02
    dex                    // CA
    bpl bank00_sub_9976              // 10 F7
    lda $0878              // AD 78 08
    sta $02ca              // 8D CA 02
    rts                    // 60
bank00_data_9986:
.errorif (* != $9986), "bank00_data_9986 shifted"
    sta $02e9              // 8D E9 02
    stx $02f7              // 8E F7 02
    ldx #$8e               // A2 8E
    lda #$8d               // A9 8D
    bne b00_9999           // D0 07
    stx $02f7              // 8E F7 02
    ldx #$8e               // A2 8E
    lda #$ad               // A9 AD
b00_9999:
    sta $02ea              // 8D EA 02
    sei                    // 78
    tya                    // 98
    clc                    // 18
    adc $00,x              // 75 00
    sta $02eb              // 8D EB 02
    lda $01,x              // B5 01   CPU port: mem banking
    adc #$00               // 69 00
    cmp #$0a               // C9 0A
    bcs b00_99AE           // B0 02
    adc #$80               // 69 80
b00_99AE:
    sta $02ec              // 8D EC 02
    ldx #$34               // A2 34
    lda #$00               // A9 00
    bcs b00_99C2           // B0 0B
b00_99B7:
    lda $d012              // AD 12 D0   VIC raster
    sbc #$30               // E9 30
    bcs b00_99B7           // B0 F9
    ldx #$37               // A2 37
    lda #$23               // A9 23
b00_99C2:
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    stx $01                // 86 01   CPU port: mem banking
    lda #$ff               // A9 FF
    sta $ffff              // 8D FF FF
    ldx #$37               // A2 37
    stx $01                // 86 01   CPU port: mem banking
    ldx #$00               // A2 00
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    ldx #$ff               // A2 FF
    and #$ff               // 29 FF
    rts                    // 60
    lda $0878              // AD 78 08
    cmp #$0a               // C9 0A
    bne $99f4              // D0 13
    jsr $9a0f              // 20 0F 9A
    jsr $9a1e              // 20 1E 9A
    jsr $9a15              // 20 15 9A
    jmp $99fd              // 4C FD 99
bank00_sub_99ED:
    lda #$0a               // A9 0A
    cmp $0878              // CD 78 08
    beq bank00_sub_9A05              // F0 11
    jsr bank00_sub_9A15              // 20 15 9A
    jsr bank00_sub_9A1E              // 20 1E 9A
    jsr bank00_sub_9A0F              // 20 0F 9A
    lda $0878              // AD 78 08
    eor #$1f               // 49 1F
    sta $0878              // 8D 78 08
bank00_sub_9A05:
    jsr bank00_sub_9974              // 20 74 99
    ldy #$f7               // A0 F7
    ldx #$9e               // A2 9E
    jmp bank00_sub_9EA9              // 4C A9 9E
bank00_sub_9A0F:
    ldx #$06               // A2 06
    lda #$8a               // A9 8A
    bne bank00_sub_9A19              // D0 04
bank00_sub_9A15:
    ldx #$05               // A2 05
    lda #$90               // A9 90
bank00_sub_9A19:
    ldy #$0a               // A0 0A
    jmp bank00_sub_8012              // 4C 12 80
bank00_sub_9A1E:
    lda #$0a               // A9 0A
    ldy #$10               // A0 10
    ldx #$05               // A2 05
    jmp bank00_api_06              // 4C 5F 9C
bank00_data_9A27:
.errorif (* != $9A27), "bank00_data_9A27 shifted"
    lda $0871              // AD 71 08
    sta $8c                // 85 8C
    lda $f7                // A5 F7
    pha                    // 48
    lda $028a              // AD 8A 02   key repeat flag
    pha                    // 48
    lda #$80               // A9 80
    sta $028a              // 8D 8A 02   key repeat flag
    lda #$00               // A9 00
    sta $f7                // 85 F7
    lda $0872              // AD 72 08
    sta $0288              // 8D 88 02   screen memory page
    sta $8d                // 85 8D
    jsr $8045              // 20 45 80
    jsr b00_9C43           // 20 43 9C
    sty $a9                // 84 A9
    jsr $9a76              // 20 76 9A
    sty $ab                // 84 AB
    lda #$27               // A9 27
    sta $aa                // 85 AA
    jsr b00_9A6B           // 20 6B 9A
    jsr b00_9C43           // 20 43 9C
    jsr $804e              // 20 4E 80
    pla                    // 68
    sta $f7                // 85 F7
    pla                    // 68
    sta $028a              // 8D 8A 02   key repeat flag
    jmp $8048              // 4C 48 80
b00_9A68:
    jsr b00_9AA3           // 20 A3 9A
b00_9A6B:
    jsr b00_9C23           // 20 23 9C
    beq b00_9A68           // F0 F8
    cmp #$03               // C9 03
    bne b00_9A68           // D0 F4
b00_9A74:
    sec                    // 38
    bit $18                // 24 18
    ldy $0288              // AC 88 02   screen memory page
    iny                    // C8
    iny                    // C8
    iny                    // C8
    sty $f4                // 84 F4
    lda #$c0               // A9 C0
    sta $f3                // 85 F3
    ldy #$0b               // A0 0B
b00_9A85:
    bcc b00_9A94           // 90 0D
    lda $033c,y            // B9 3C 03
    sta ($f3),y            // 91 F3
    lda $0348,y            // B9 48 03
    sta $dbc0,y            // 99 C0 DB
    bcs b00_9A9F           // B0 0B
b00_9A94:
    lda ($f3),y            // B1 F3
    sta $033c,y            // 99 3C 03
    lda $dbc0,y            // B9 C0 DB
    sta $0348,y            // 99 48 03
b00_9A9F:
    dey                    // 88
    bpl b00_9A85           // 10 E3
b00_9AA2:
    rts                    // 60
b00_9AA3:
    jsr $e8cb              // 20 CB E8
    bpl b00_9AA2           // 10 FA
    jsr b00_9B04           // 20 04 9B
    cpx #$18               // E0 18
    bcc b00_9AB5           // 90 06
    ldy $9f                // A4 9F
    cpy #$0c               // C0 0C
    bcc b00_9AA2           // 90 ED
b00_9AB5:
    lda $f7                // A5 F7
    bne b00_9AA2           // D0 E9
    lda $0286              // AD 86 02   current text color
    pha                    // 48
    lda $d021              // AD 21 D0   VIC background color
    eor #$05               // 49 05
    sta $0286              // 8D 86 02   current text color
    tya                    // 98
    clc                    // 18
    adc $d1                // 65 D1
    pha                    // 48
    lda $d2                // A5 D2
    adc #$00               // 69 00
    and #$03               // 29 03
    ora $8d                // 05 8D
    pha                    // 48
    ldx #$18               // A2 18
    ldy #$00               // A0 00
    jsr $e50c              // 20 0C E5
    jsr b00_9AF3           // 20 F3 9A
    pla                    // 68
    tay                    // A8
    pla                    // 68
    tax                    // AA
    tya                    // 98
    jsr $9c87              // 20 87 9C
    jsr b00_9AFF           // 20 FF 9A
    pla                    // 68
    sta $0286              // 8D 86 02   current text color
    ldx $9e                // A6 9E
    ldy $9f                // A4 9F
    jmp $e50c              // 4C 0C E5
b00_9AF3:
    ldx $9e                // A6 9E
    jsr b00_9AFA           // 20 FA 9A
    ldx $9f                // A6 9F
b00_9AFA:
    lda #$00               // A9 00
    jsr $bdcd              // 20 CD BD
b00_9AFF:
    lda #$20               // A9 20
    jmp $ffd2              // 4C D2 FF   KERNAL CHROUT: print char
b00_9B04:
    ldx $d6                // A6 D6
    cpx #$18               // E0 18
    beq b00_9B16           // F0 0C
    cmp #$93               // C9 93
    beq b00_9B16           // F0 08
    cmp #$04               // C9 04
    beq b00_9B16           // F0 04
    cmp #$09               // C9 09
    bne b00_9B1F           // D0 09
b00_9B16:
    jsr b00_9A74           // 20 74 9A
    jsr b00_9B1F           // 20 1F 9B
    jmp $9a76              // 4C 76 9A
b00_9B1F:
    jsr b00_9B2D           // 20 2D 9B
    ldx $d6                // A6 D6
    ldy $d3                // A4 D3
    stx $9e                // 86 9E
    sty $9f                // 84 9F
    jmp $e50c              // 4C 0C E5
b00_9B2D:
    lda $d7                // A5 D7
    cmp #$94               // C9 94
    beq b00_9B37           // F0 04
    cmp #$14               // C9 14
    bne b00_9B51           // D0 1A
b00_9B37:
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    tya                    // 98
    pha                    // 48
    lda $aa                // A5 AA
    sta $d5                // 85 D5
    lda $d7                // A5 D7
    bmi b00_9B4E           // 30 0A
    ldy $d3                // A4 D3
    cpy $a9                // C4 A9
    bne b00_9B4B           // D0 01
    iny                    // C8
b00_9B4B:
    jmp $e75c              // 4C 5C E7
b00_9B4E:
    jmp $e805              // 4C 05 E8
b00_9B51:
    ldy $d3                // A4 D3
    cmp #$1d               // C9 1D
    bne b00_9B5E           // D0 07
b00_9B57:
    cpy $aa                // C4 AA
    beq b00_9B5D           // F0 02
    inc $d3                // E6 D3
b00_9B5D:
    rts                    // 60
b00_9B5E:
    cmp #$9d               // C9 9D
    bne b00_9B69           // D0 07
    cpy $a9                // C4 A9
    beq b00_9B68           // F0 02
    dec $d3                // C6 D3
b00_9B68:
    rts                    // 60
b00_9B69:
    bit $ab                // 24 AB
    bmi b00_9B78           // 30 0B
    cmp #$20               // C9 20
    bcc b00_9B68           // 90 F7
    cmp #$60               // C9 60
    bcs b00_9B68           // B0 F3
    jmp b00_9BFB           // 4C FB 9B
b00_9B78:
    ldx $d6                // A6 D6
    cmp #$11               // C9 11
    bne b00_9B85           // D0 07
    cpx #$18               // E0 18
    beq b00_9B84           // F0 02
    inc $d6                // E6 D6
b00_9B84:
    rts                    // 60
b00_9B85:
    cmp #$0d               // C9 0D
    bne b00_9B94           // D0 0B
b00_9B89:
    cpx #$18               // E0 18
    beq b00_9B8F           // F0 02
    inc $d6                // E6 D6
b00_9B8F:
    ldy #$00               // A0 00
    sty $d3                // 84 D3
    rts                    // 60
b00_9B94:
    cmp #$8d               // C9 8D
    beq b00_9B89           // F0 F1
    cmp #$91               // C9 91
    bne b00_9BA2           // D0 06
    txa                    // 8A
    beq b00_9BA1           // F0 02
    dec $d6                // C6 D6
b00_9BA1:
    rts                    // 60
b00_9BA2:
    ldx $d6                // A6 D6
    cmp #$04               // C9 04
    bne b00_9BB0           // D0 08
    dex                    // CA
    pha                    // 48
    pha                    // 48
    pha                    // 48
    pha                    // 48
    jmp $e8f8              // 4C F8 E8
b00_9BB0:
    cmp #$09               // C9 09
    bne b00_9BC3           // D0 0F
    jsr $e96c              // 20 6C E9
    ldx #$19               // A2 19
b00_9BB9:
    lda $d9,x              // B5 D9
    ora #$80               // 09 80
    sta $d9,x              // 95 D9
    dex                    // CA
    bpl b00_9BB9           // 10 F7
    rts                    // 60
b00_9BC3:
    cmp #$86               // C9 86
    bne b00_9BCB           // D0 04
    inc $d020              // EE 20 D0   VIC border color
    rts                    // 60
b00_9BCB:
    cmp #$8a               // C9 8A
    bne b00_9BD3           // D0 04
    dec $d020              // CE 20 D0   VIC border color
    rts                    // 60
b00_9BD3:
    cmp #$87               // C9 87
    bne b00_9BDB           // D0 04
    inc $d021              // EE 21 D0   VIC background color
    rts                    // 60
b00_9BDB:
    cmp #$8b               // C9 8B
    bne b00_9BE3           // D0 04
    dec $d021              // CE 21 D0   VIC background color
    rts                    // 60
b00_9BE3:
    cmp #$88               // C9 88
    bne b00_9BF0           // D0 09
    lda $f7                // A5 F7
    eor #$01               // 49 01
    sta $f7                // 85 F7
    jmp b00_9A74           // 4C 74 9A
b00_9BF0:
    cmp #$20               // C9 20
    bcs b00_9BFB           // B0 07
b00_9BF4:
    ldy #$00               // A0 00
    sty $d4                // 84 D4
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
b00_9BFB:
    tay                    // A8
    bmi b00_9C19           // 30 1B
    cmp #$60               // C9 60
    bcc b00_9C06           // 90 04
    and #$df               // 29 DF
    bne b00_9C0E           // D0 08
b00_9C06:
    and #$3f               // 29 3F
b00_9C08:
    ldx $c7                // A6 C7
    beq b00_9C0E           // F0 02
    ora #$80               // 09 80
b00_9C0E:
    ldx $0286              // AE 86 02   current text color
    jsr $ea13              // 20 13 EA
    ldy $d3                // A4 D3
    jmp b00_9B57           // 4C 57 9B
b00_9C19:
    cmp #$a0               // C9 A0
    bcc b00_9BF4           // 90 D7
    and #$7f               // 29 7F
    ora #$40               // 09 40
    bne b00_9C08           // D0 E5
b00_9C23:
    cli                    // 58
b00_9C24:
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    sta $cc                // 85 CC
    beq b00_9C24           // F0 F9
    sei                    // 78
    pha                    // 48
    lda $cf                // A5 CF
    beq b00_9C3D           // F0 0C
    lda $ce                // A5 CE
    ldx $0287              // AE 87 02
    ldy #$00               // A0 00
    sty $cf                // 84 CF
    jsr $ea13              // 20 13 EA
b00_9C3D:
    pla                    // 68
    sta $d7                // 85 D7
    cmp #$0d               // C9 0D
b00_9C42:
    rts                    // 60
b00_9C43:
    ldy $8c                // A4 8C
    bpl b00_9C42           // 10 FB
    lda $08d0              // AD D0 08
    and #$fc               // 29 FC
    ora #$06               // 09 06
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda $8d                // A5 8D
    and #$3f               // 29 3F
    ora #$40               // 09 40
    sta $0288              // 8D 88 02   screen memory page
    tya                    // 98
    ldy #$40               // A0 40
    ldx #$40               // A2 40
bank00_api_06:
    sta $23                // 85 23
    sty $25                // 84 25
    lda #$6a               // A9 6A
    ldy #$9c               // A0 9C
    jmp bank00_sub_8042              // 4C 42 80
bank00_data_9C6A:
.errorif (* != $9C6A), "bank00_data_9C6A shifted"
    sty $22                // 84 22
    sty $24                // 84 24
    inc $01                // E6 01   CPU port: mem banking
b00_9C70:
    lda ($22),y            // B1 22
    pha                    // 48
    lda ($24),y            // B1 24
    sta ($22),y            // 91 22
    pla                    // 68
    sta ($24),y            // 91 24
    iny                    // C8
    bne b00_9C70           // D0 F3
    inc $23                // E6 23
    inc $25                // E6 25
    dex                    // CA
    bne b00_9C70           // D0 EC
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    pha                    // 48
    lda #$24               // A9 24
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    pla                    // 68
    jsr b00_9C92           // 20 92 9C
    txa                    // 8A
b00_9C92:
    .byte $48, $4A, $4A, $4A, $4A, $20    // data $9C92  text: "HJJJJ "
    sta $689c,x            // 9D 9C 68
    and #$0f               // 29 0F
    clc                    // 18
    adc #$30               // 69 30
    cmp #$3a               // C9 3A
    bcc b00_9CA6           // 90 02
    adc #$06               // 69 06
b00_9CA6:
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
    brk                    // 00
    .byte $0B    // 0B  undocumented/illegal at $9CAA
    php                    // 08
    asl                    // 0A
    brk                    // 00
    .byte $9E    // 9E  undocumented/illegal at $9CAE
    .byte $32    // 32  undocumented/illegal at $9CAF
    bmi $9ce8              // 30 36
    and ($00),y            // 31 00
    brk                    // 00
    brk                    // 00
    sei                    // 78
    lda #$7f               // A9 7F
    sta $dd0d              // 8D 0D DD   CIA2 ICR (NMI control/ack)
    lda #$34               // A9 34
    sta $01                // 85 01   CPU port: mem banking
    ldx #$0c               // A2 0C
    ldy #$aa               // A0 AA
b00_9CC4:
    lda $aaaa,y            // B9 AA AA
    sta $ffaa,y            // 99 AA FF
    dey                    // 88
    cpy #$ff               // C0 FF
    bne b00_9CC4           // D0 F5
    dec $0820              // CE 20 08
    dec $081d              // CE 1D 08
    cpx $081d              // EC 1D 08
    bne b00_9CC4           // D0 EA
    inc $01                // E6 01   CPU port: mem banking
    ldx #$e0               // A2 E0
    txs                    // 9A
    iny                    // C8
b00_9CE0:
    lda $0a00,y            // B9 00 0A
    sta $0100,y            // 99 00 01
    lda $0b00,y            // B9 00 0B
    sta $d800,y            // 99 00 D8
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    lsr                    // 4A
    sta $da00,y            // 99 00 DA
    iny                    // C8
    bne b00_9CE0           // D0 EA
    inc $083f              // EE 3F 08
    inc $0842              // EE 42 08
    inc $0849              // EE 49 08
    dec $0839              // CE 39 08
    dec $083c              // CE 3C 08
    bpl b00_9CE0           // 10 D9
    ldx #$0e               // A2 0E
b00_9D09:
    lda #$80               // A9 80
    sta $d402,x            // 9D 02 D4
    sta $d403,x            // 9D 03 D4
    lda #$21               // A9 21
    sta $d404,x            // 9D 04 D4
    lda #$08               // A9 08
    sta $d405,x            // 9D 05 D4
    lda #$80               // A9 80
    sta $d406,x            // 9D 06 D4
    txa                    // 8A
    sec                    // 38
    sbc #$07               // E9 07
    tax                    // AA
    bpl b00_9D09           // 10 E2
    ldy #$0f               // A0 0F
    lda #$00               // A9 00
    asl                    // 0A
    bcc b00_9D45           // 90 17
    ldx #$ff               // A2 FF
    stx $d40e              // 8E 0E D4
    stx $d40f              // 8E 0F D4
    sta $d413              // 8D 13 D4
    ldx #$f0               // A2 F0
    stx $d414              // 8E 14 D4
    ldx #$81               // A2 81
    stx $d412              // 8E 12 D4
    ldy #$1f               // A0 1F
b00_9D45:
    sty $d418              // 8C 18 D4   SID volume/filter mode
    ldy #$02               // A0 02
    lda #$ff               // A9 FF
b00_9D4C:
    sta $dc01,y            // 99 01 DC   CIA1 port B (keyboard rows / joy1)
    sta $dd01,y            // 99 01 DD   CIA2 port B (user port)
    dey                    // 88
    bne b00_9D4C           // D0 F7
b00_9D55:
    cpy #$10               // C0 10
    bcs b00_9D65           // B0 0C
    lda $0d30,y            // B9 30 0D
    sta $dc00,y            // 99 00 DC   CIA1 port A (keyboard cols / joy2)
    lda $0d40,y            // B9 40 0D
    sta $dd00,y            // 99 00 DD   CIA2 port A (VIC bank, IEC lines)
b00_9D65:
    lda $0d00,y            // B9 00 0D
    sta $d000,y            // 99 00 D0
    iny                    // C8
    cpy #$2f               // C0 2F
    bne b00_9D55           // D0 E5
    jsr $0d50              // 20 50 0D
    lda $0330              // AD 30 03   ILOAD vector
    sta $c3                // 85 C3
    lda $0331              // AD 31 03
    sta $c8                // 85 C8
    lda #$20               // A9 20
    ldx #$06               // A2 06
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    sta $defe              // 8D FE DE
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    dec $01                // C6 01   CPU port: mem banking
    ldy #$00               // A0 00
    jmp $008e              // 4C 8E 00
bank00_sub_9D91:
    ldx #$14               // A2 14
bank00_sub_9D93:
    lda $9d9f,x            // BD 9F 9D
    sta $0100,x            // 9D 00 01
    dex                    // CA
    bpl bank00_sub_9D93              // 10 F7
    jmp $0100              // 4C 00 01
bank00_data_9D9F:
.errorif (* != $9D9F), "bank00_data_9D9F shifted"
    .byte $A9, $23, $8D, $00, $DE, $98, $8D, $C5, $9E, $09, $03, $8D, $94, $9E, $A9, $00    // data $9D9F
    .byte $8D, $00, $DE, $60    // data $9DAF
bank00_api_08:
    ldy #$80               // A0 80
    sty $b0                // 84 B0
    sty $b1                // 84 B1
    jsr bank00_sub_8060              // 20 60 80
bank00_sub_9DBC:
    ldy #$00               // A0 00
    lda ($b0),y            // B1 B0
    ldx #$95               // A2 95
    ldy $b0                // A4 B0
    jsr bank00_sub_9EA9              // 20 A9 9E
    inc $b0                // E6 B0
    bne bank00_sub_9DCD              // D0 02
    inc $b1                // E6 B1
bank00_sub_9DCD:
    lda $b0                // A5 B0
    cmp #$80               // C9 80
    bne bank00_sub_9DBC              // D0 E9
    rts                    // 60
bank00_data_9DD4:
.errorif (* != $9DD4), "bank00_data_9DD4 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DD4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DE4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DF4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E04
    bmi $9dbb              // 30 A5
    ora ($8d,x)            // 01 8D
    rol $09de              // 2E DE 09
    .byte $03    // 03  undocumented/illegal at $9E1B
    sta $01                // 85 01   CPU port: mem banking
    lda #$08               // A9 08
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    bit $8080              // 2C 80 80
    bit $8080              // 2C 80 80
    bit $8080              // 2C 80 80
    nop                    // EA
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    lda #$0a               // A9 0A
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
bank00_data_9E36:
.errorif (* != $9E36), "bank00_data_9E36 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E36
    sec                    // 38
    bit $18                // 24 18
    jsr $de7f              // 20 7F DE
    sta $de58              // 8D 58 DE
    sta $de61              // 8D 61 DE
    sty $de5e              // 8C 5E DE
    sty $de65              // 8C 65 DE
    stx $dea5              // 8E A5 DE
    ldy #$00               // A0 00
b00_9E56:
    lda $0000,y            // B9 00 00
    tax                    // AA
    bcc b00_9E63           // 90 07
    lda $0000,y            // B9 00 00
    sta $0000,y            // 99 00 00
    txa                    // 8A
b00_9E63:
    sta $0000,y            // 99 00 00
    iny                    // C8
    bne b00_9E56           // D0 ED
    dec $dea5              // CE A5 DE
    beq $9eb2              // F0 44
    nop                    // EA
    nop                    // EA
    nop                    // EA
    inc $de58              // EE 58 DE
    inc $de61              // EE 61 DE
    inc $de5e              // EE 5E DE
    inc $de65              // EE 65 DE
    bne b00_9E56           // D0 D7
    php                    // 08
    pha                    // 48
    lda #$fb               // A9 FB
b00_9E83:
    cmp $d012              // CD 12 D0   VIC raster
    bne b00_9E83           // D0 FB
    pla                    // 68
    plp                    // 28
    jsr $deba              // 20 BA DE
    pha                    // 48
    lda #$23               // A9 23
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda #$23               // A9 23
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    stx $deb1              // 8E B1 DE
    rts                    // 60
    jsr $deba              // 20 BA DE
    stx $dea5              // 8E A5 DE
    lda $0000,y            // B9 00 00
    jmp $deb2              // 4C B2 DE
bank00_sub_9EA9:
    jsr $deba              // 20 BA DE
    jsr $de8d              // 20 8D DE
    sta $0000,y            // 99 00 00
    pha                    // 48
    lda #$00               // A9 00
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rts                    // 60
// --- $9EBA-$9F00: shared bank-switch trampoline footer --------------------
// The RR hardware mirrors each bank's $9E00-$9EFF page into I/O2 space at
// $DE00-$DEFF, and every bank carries byte-identical code at these offsets.
// That makes `sta $de00` (which instantly repages the very $8000-$9FFF
// window this code lives in) safe: the next instruction fetch lands in the
// NEW bank's identical copy. Callers use the $DExx addresses:
//   $DEBA ($9EBA): switch to bank 4 (value $20), stash A at $DEB4
//   $DED0 ($9ED0): jmp ($fffc) - jump through RESET vector
//   $DEDA ($9EDA): jmp ($fff8) - jump through ultimax NMI vector
//   $DEDE ($9EDE): sta $de00 / pla / rti - cross-bank call gate: RTI jumps
//                  to the exact target address pushed by the $9F01 stub
//   $DEE3 ($9EE3): sta $9e / pla / sta $de00 / lda $9e / rts - switch back
//                  to caller's bank and return
bank00_data_9EBA:
.errorif (* != $9EBA), "bank00_data_9EBA shifted"
    pha                    // 48
    sei                    // 78
    lda #$00               // A9 00
    pha                    // 48
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    sta $deb4              // 8D B4 DE
    pla                    // 68
    rts                    // 60
    nop                    // EA
    nop                    // EA
    nop                    // EA
    jmp ($fffc)            // 6C FC FF
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    jmp ($fff8)            // 6C F8 FF
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rti                    // 40
    nop                    // EA
    sta $9e                // 85 9E
    pla                    // 68
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda $9e                // A5 9E
    rts                    // 60
// $9EED ($DEED): bank-select value table used by the $9F01 stub, indexed by
// stub entry offset. $DE00 values: $00/$08/$10/$18/$20 = banks 0-4
// (bank bits are b3,b4,b7). Trailing bytes incl. this bank's marker.
    .byte $00, $00, $08, $10, $18, $20, $02, $23, $06, $43    // data $9EED  "..... .#.C"
bank00_data_9EF7:
.errorif (* != $9EF7), "bank00_data_9EF7 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9EF7
    nop                    // EA
// --- $9F01: cross-bank call stub ------------------------------------------
// Called as `jsr $9F01`/`jsr $9F03` followed by a 2-byte inline argument =
// target address in the destination bank. The NOPs make both entry points
// fall into the same body; the entry offset (recovered from the pulled
// return address) indexes the $DEED bank-value table to pick the
// destination bank. The stub fixes the return address to skip the inline
// word, pushes a return path through $DEE3 (restore this bank), pushes the
// target address, and jumps through the $DEDE gate (sta $de00 / pla / rti).
// Bank01 has the same stub at $9F51.
bank00_sub_9F01:
    nop                    // EA
    nop                    // EA
bank00_sub_9F03:
    nop                    // EA
    nop                    // EA
    nop                    // EA
    cld                    // D8
    sta $a5                // 85 A5
    stx $a6                // 86 A6
    sty $a7                // 84 A7
    php                    // 08
    pla                    // 68
    sta $a8                // 85 A8
    pla                    // 68
    sta $a9                // 85 A9
    clc                    // 18
    adc #$02               // 69 02
    tax                    // AA
    pla                    // 68
    sta $aa                // 85 AA
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    lda $a9                // A5 A9
    bne bank00_sub_9F26              // D0 02
    dec $aa                // C6 AA
bank00_sub_9F26:
    dec $a9                // C6 A9
    ldy #$00               // A0 00
    lda ($a9),y            // B1 A9
    sec                    // 38
    sbc #$00               // E9 00
    tax                    // AA
    lda #$00               // A9 00
    pha                    // 48
    lda #$de               // A9 DE
    pha                    // 48
    lda #$e2               // A9 E2
    pha                    // 48
    ldy #$03               // A0 03
    lda ($a9),y            // B1 A9
    pha                    // 48
    dey                    // 88
    lda ($a9),y            // B1 A9
    pha                    // 48
    lda $a8                // A5 A8
    pha                    // 48
    lda $a5                // A5 A5
    pha                    // 48
    lda $deee,x            // BD EE DE
    ldx $a6                // A6 A6
    ldy $a7                // A4 A7
    jmp $dede              // 4C DE DE
bank00_data_9F52:
.errorif (* != $9F52), "bank00_data_9F52 shifted"
    jsr $8763              // 20 63 87
    .byte $0D, $46, $49, $4C, $45, $4E, $41, $4D, $45, $20, $3A, $20, $00    // data $9F55  text: ".FILENAME : ."
    ldx #$0b               // A2 0B
    ldy #$19               // A0 19
    stx $a9                // 86 A9
    sty $aa                // 84 AA
    sty $ab                // 84 AB
    ldx #$08               // A2 08
    ldy #$02               // A0 02
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    stx $7a                // 86 7A   TXTPTR lo
    sty $7b                // 84 7B   TXTPTR hi
b00_9F77:
    jsr $9c23              // 20 23 9C
    beq b00_9F81           // F0 05
    jsr $9b1f              // 20 1F 9B
    bpl b00_9F77           // 10 F6
b00_9F81:
    ldx #$00               // A2 00
    ldy $a9                // A4 A9
    dey                    // 88
b00_9F86:
    iny                    // C8
    lda ($d1),y            // B1 D1
    and #$3f               // 29 3F
    beq b00_9F95           // F0 08
    sta $02                // 85 02
    asl $02                // 06 02
    bit $02                // 24 02
    bvs b00_9F97           // 70 02
b00_9F95:
    ora #$40               // 09 40
b00_9F97:
    sta $0208,x            // 9D 08 02
    inx                    // E8
    cpy $aa                // C4 AA
    bne b00_9F86           // D0 E7
b00_9F9F:
    lda $0207,x            // BD 07 02
    cmp #$20               // C9 20
    bne b00_9FA9           // D0 03
    dex                    // CA
    bne b00_9F9F           // D0 F6
b00_9FA9:
    stx $b7                // 86 B7   filename length
    lda #$00               // A9 00
    sta $0208,x            // 9D 08 02
    jsr $98b4              // 20 B4 98
    txa                    // 8A
    rts                    // 60
bank00_data_9FB5:
.errorif (* != $9FB5), "bank00_data_9FB5 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FB5
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FC5
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FD5
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FE5
    .byte $00, $00, $00    // data $9FF5
    .byte $22    // 22  undocumented/illegal at $9FF8
    inc $ee39              // EE 39 EE
    ora $30ee              // 0D EE 30
    .byte $EE    // EE  undocumented/illegal at $9FFF
