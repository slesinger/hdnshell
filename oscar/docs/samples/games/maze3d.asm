; Compiled with 1.32.268
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 16 2d STX $2d16 ; (spentry + 0)
0811 : a2 35 __ LDX #$35
0813 : a0 49 __ LDY #$49
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 35 __ CPX #$35
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 e7 __ CPY #$e7
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 ec __ LDA #$ec
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 372, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s1:
0880 : a2 04 __ LDX #$04
0882 : b5 53 __ LDA T1 + 0,x 
0884 : 9d ee 9f STA $9fee,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 4a 0a JSR $0a4a ; (mmap_trampoline.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 85 11 __ STA P4 
0891 : 85 0d __ STA P0 
0893 : a9 30 __ LDA #$30
0895 : 85 01 __ STA $01 
0897 : a9 08 __ LDA #$08
0899 : 85 12 __ STA P5 
089b : a9 2d __ LDA #$2d
089d : 85 10 __ STA P3 
089f : a9 d0 __ LDA #$d0
08a1 : 85 0e __ STA P1 
08a3 : a9 17 __ LDA #$17
08a5 : 85 0f __ STA P2 
08a7 : 20 94 0a JSR $0a94 ; (memcpy.s4 + 0)
08aa : a9 00 __ LDA #$00
08ac : 85 0d __ STA P0 
08ae : 85 10 __ STA P3 
08b0 : 85 0e __ STA P1 
08b2 : a9 36 __ LDA #$36
08b4 : 85 01 __ STA $01 
08b6 : a9 d0 __ LDA #$d0
08b8 : 85 11 __ STA P4 
08ba : a9 c8 __ LDA #$c8
08bc : 85 0f __ STA P2 
08be : 20 c3 0a JSR $0ac3 ; (vic_setmode.s4 + 0)
08c1 : a9 00 __ LDA #$00
08c3 : 8d 20 d0 STA $d020 
08c6 : 20 15 0b JSR $0b15 ; (rirq_init_kernal.s4 + 0)
08c9 : a9 01 __ LDA #$01
08cb : 85 0f __ STA P2 
08cd : a9 35 __ LDA #$35
08cf : 85 0e __ STA P1 
08d1 : a9 9e __ LDA #$9e
08d3 : 85 0d __ STA P0 
08d5 : 20 b1 0b JSR $0bb1 ; (rirq_build.s4 + 0)
08d8 : a9 5a __ LDA #$5a
08da : 8d 49 35 STA $3549 ; (rasterIRQRows[0] + 0)
08dd : a9 00 __ LDA #$00
08df : 8d a0 35 STA $35a0 ; (center.code[0] + 1)
08e2 : a9 21 __ LDA #$21
08e4 : 8d a9 35 STA $35a9 ; (center.code[0] + 10)
08e7 : a9 d0 __ LDA #$d0
08e9 : 8d aa 35 STA $35aa ; (center.code[0] + 11)
08ec : a9 9f __ LDA #$9f
08ee : 8d 7d 35 STA $357d ; (rasterIRQLow[0] + 0)
08f1 : a9 35 __ LDA #$35
08f3 : 8d 8d 35 STA $358d ; (rasterIRQHigh[0] + 0)
08f6 : a9 be __ LDA #$be
08f8 : 85 0d __ STA P0 
08fa : a9 35 __ LDA #$35
08fc : 85 0e __ STA P1 
08fe : 20 b1 0b JSR $0bb1 ; (rirq_build.s4 + 0)
0901 : a9 fa __ LDA #$fa
0903 : 8d 4a 35 STA $354a ; (rasterIRQRows[0] + 1)
0906 : a9 01 __ LDA #$01
0908 : 8d c0 35 STA $35c0 ; (bottom.code[0] + 1)
090b : a9 21 __ LDA #$21
090d : 8d c9 35 STA $35c9 ; (bottom.code[0] + 10)
0910 : a9 d0 __ LDA #$d0
0912 : 8d ca 35 STA $35ca ; (bottom.code[0] + 11)
0915 : a9 bf __ LDA #$bf
0917 : 8d 7e 35 STA $357e ; (rasterIRQLow[0] + 1)
091a : a9 35 __ LDA #$35
091c : 8d 8e 35 STA $358e ; (rasterIRQHigh[0] + 1)
091f : a9 00 __ LDA #$00
0921 : 20 55 0c JSR $0c55 ; (rirq_sort.s4 + 0)
0924 : 20 de 0c JSR $0cde ; (rirq_start.s4 + 0)
0927 : 20 f0 0c JSR $0cf0 ; (screen_flip.s4 + 0)
092a : a9 3b __ LDA #$3b
092c : 85 12 __ STA P5 
092e : a9 35 __ LDA #$35
0930 : 85 13 __ STA P6 
0932 : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
0935 : 20 f0 0c JSR $0cf0 ; (screen_flip.s4 + 0)
.l5:
0938 : a9 00 __ LDA #$00
.l19:
093a : 85 57 __ STA T6 + 0 
.l6:
093c : a9 00 __ LDA #$00
093e : 20 c7 11 JSR $11c7 ; (joy_poll.s4 + 0)
0941 : ad e1 35 LDA $35e1 ; (joyy[0] + 0)
0944 : d0 5d __ BNE $09a3 ; (main.s14 + 0)
.s7:
0946 : a5 57 __ LDA T6 + 0 
0948 : f0 07 __ BEQ $0951 ; (main.s8 + 0)
.s13:
094a : ad e3 35 LDA $35e3 ; (joyx[0] + 0)
094d : d0 ed __ BNE $093c ; (main.l6 + 0)
094f : f0 e7 __ BEQ $0938 ; (main.l5 + 0)
.s8:
0951 : ad e3 35 LDA $35e3 ; (joyx[0] + 0)
0954 : c9 01 __ CMP #$01
0956 : f0 28 __ BEQ $0980 ; (main.s12 + 0)
.s9:
0958 : c9 ff __ CMP #$ff
095a : d0 e0 __ BNE $093c ; (main.l6 + 0)
.s10:
095c : ad 17 35 LDA $3517 ; (dx + 0)
095f : 85 43 __ STA T0 + 0 
0961 : ad 18 35 LDA $3518 ; (dy + 0)
0964 : 8d 17 35 STA $3517 ; (dx + 0)
0967 : a9 00 __ LDA #$00
0969 : e5 43 __ SBC T0 + 0 
096b : 8d 18 35 STA $3518 ; (dy + 0)
096e : a9 3b __ LDA #$3b
0970 : 85 12 __ STA P5 
0972 : a9 35 __ LDA #$35
0974 : 85 13 __ STA P6 
0976 : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
0979 : 20 7f 1f JSR $1f7f ; (screen_right.s4 + 0)
.s11:
097c : a9 01 __ LDA #$01
097e : d0 ba __ BNE $093a ; (main.l19 + 0)
.s12:
0980 : ad 18 35 LDA $3518 ; (dy + 0)
0983 : 85 43 __ STA T0 + 0 
0985 : ad 17 35 LDA $3517 ; (dx + 0)
0988 : 8d 18 35 STA $3518 ; (dy + 0)
098b : a9 00 __ LDA #$00
098d : e5 43 __ SBC T0 + 0 
098f : 8d 17 35 STA $3517 ; (dx + 0)
0992 : a9 3b __ LDA #$3b
0994 : 85 12 __ STA P5 
0996 : a9 35 __ LDA #$35
0998 : 85 13 __ STA P6 
099a : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
099d : 20 07 12 JSR $1207 ; (screen_left.s4 + 0)
09a0 : 4c 7c 09 JMP $097c ; (main.s11 + 0)
.s14:
09a3 : 85 03 __ STA WORK + 0 
09a5 : 29 80 __ AND #$80
09a7 : 10 02 __ BPL $09ab ; (main.s14 + 8)
09a9 : a9 ff __ LDA #$ff
09ab : 85 44 __ STA T0 + 1 
09ad : 85 04 __ STA WORK + 1 
09af : ad 17 35 LDA $3517 ; (dx + 0)
09b2 : 85 1b __ STA ACCU + 0 
09b4 : 29 80 __ AND #$80
09b6 : 10 02 __ BPL $09ba ; (main.s14 + 23)
09b8 : a9 ff __ LDA #$ff
09ba : 85 1c __ STA ACCU + 1 
09bc : 20 d4 2c JSR $2cd4 ; (mul16 + 0)
09bf : ad 19 35 LDA $3519 ; (px + 0)
09c2 : 38 __ __ SEC
09c3 : e5 05 __ SBC WORK + 2 
09c5 : 85 56 __ STA T4 + 0 
09c7 : 29 80 __ AND #$80
09c9 : 10 02 __ BPL $09cd ; (main.s14 + 42)
09cb : a9 ff __ LDA #$ff
09cd : 85 54 __ STA T1 + 1 
09cf : ad 18 35 LDA $3518 ; (dy + 0)
09d2 : 85 1b __ STA ACCU + 0 
09d4 : 29 80 __ AND #$80
09d6 : 10 02 __ BPL $09da ; (main.s14 + 55)
09d8 : a9 ff __ LDA #$ff
09da : 85 1c __ STA ACCU + 1 
09dc : ad e1 35 LDA $35e1 ; (joyy[0] + 0)
09df : 85 03 __ STA WORK + 0 
09e1 : a5 44 __ LDA T0 + 1 
09e3 : 85 04 __ STA WORK + 1 
09e5 : 20 d4 2c JSR $2cd4 ; (mul16 + 0)
09e8 : ad 1a 35 LDA $351a ; (py + 0)
09eb : 38 __ __ SEC
09ec : e5 05 __ SBC WORK + 2 
09ee : 85 55 __ STA T2 + 0 
09f0 : 0a __ __ ASL
09f1 : aa __ __ TAX
09f2 : bd 1b 35 LDA $351b,x ; (maze[0] + 0)
09f5 : 18 __ __ CLC
09f6 : 65 56 __ ADC T4 + 0 
09f8 : 85 43 __ STA T0 + 0 
09fa : bd 1c 35 LDA $351c,x ; (maze[0] + 1)
09fd : 65 54 __ ADC T1 + 1 
09ff : 85 44 __ STA T0 + 1 
0a01 : a0 00 __ LDY #$00
0a03 : b1 43 __ LDA (T0 + 0),y 
0a05 : c9 23 __ CMP #$23
0a07 : f0 30 __ BEQ $0a39 ; (main.s15 + 0)
.s16:
0a09 : a9 42 __ LDA #$42
0a0b : 85 12 __ STA P5 
0a0d : a9 35 __ LDA #$35
0a0f : 85 13 __ STA P6 
0a11 : 2c e1 35 BIT $35e1 ; (joyy[0] + 0)
0a14 : 30 13 __ BMI $0a29 ; (main.s18 + 0)
.s17:
0a16 : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
0a19 : 20 f0 0c JSR $0cf0 ; (screen_flip.s4 + 0)
0a1c : a5 55 __ LDA T2 + 0 
0a1e : 8d 1a 35 STA $351a ; (py + 0)
0a21 : a5 56 __ LDA T4 + 0 
0a23 : 8d 19 35 STA $3519 ; (px + 0)
0a26 : 4c 39 0a JMP $0a39 ; (main.s15 + 0)
.s18:
0a29 : a5 55 __ LDA T2 + 0 
0a2b : 8d 1a 35 STA $351a ; (py + 0)
0a2e : a5 56 __ LDA T4 + 0 
0a30 : 8d 19 35 STA $3519 ; (px + 0)
0a33 : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
0a36 : 20 f0 0c JSR $0cf0 ; (screen_flip.s4 + 0)
.s15:
0a39 : a9 3b __ LDA #$3b
0a3b : 85 12 __ STA P5 
0a3d : a9 35 __ LDA #$35
0a3f : 85 13 __ STA P6 
0a41 : 20 54 0d JSR $0d54 ; (maze_draw.s1 + 0)
0a44 : 20 f0 0c JSR $0cf0 ; (screen_flip.s4 + 0)
0a47 : 4c 46 09 JMP $0946 ; (main.s7 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0a4a : a9 5f __ LDA #$5f
0a4c : 8d fa ff STA $fffa 
0a4f : a9 0a __ LDA #$0a
0a51 : 8d fb ff STA $fffb 
0a54 : a9 7d __ LDA #$7d
0a56 : 8d fe ff STA $fffe 
0a59 : a9 0a __ LDA #$0a
0a5b : 8d ff ff STA $ffff 
.s3:
0a5e : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a5f : 48 __ __ PHA
0a60 : 8a __ __ TXA
0a61 : 48 __ __ PHA
0a62 : a9 0a __ LDA #$0a
0a64 : 48 __ __ PHA
0a65 : a9 76 __ LDA #$76
0a67 : 48 __ __ PHA
0a68 : ba __ __ TSX
0a69 : bd 05 01 LDA $0105,x 
0a6c : 48 __ __ PHA
0a6d : a6 01 __ LDX $01 
0a6f : a9 36 __ LDA #$36
0a71 : 85 01 __ STA $01 
0a73 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0a76 : 86 01 __ STX $01 
0a78 : 68 __ __ PLA
0a79 : aa __ __ TAX
0a7a : 68 __ __ PLA
0a7b : 40 __ __ RTI
0a7c : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0a7d : 48 __ __ PHA
0a7e : 8a __ __ TXA
0a7f : 48 __ __ PHA
0a80 : a9 0a __ LDA #$0a
0a82 : 48 __ __ PHA
0a83 : a9 76 __ LDA #$76
0a85 : 48 __ __ PHA
0a86 : ba __ __ TSX
0a87 : bd 05 01 LDA $0105,x 
0a8a : 48 __ __ PHA
0a8b : a6 01 __ LDX $01 
0a8d : a9 36 __ LDA #$36
0a8f : 85 01 __ STA $01 
0a91 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0a94 : a6 12 __ LDX P5 
0a96 : f0 10 __ BEQ $0aa8 ; (memcpy.s4 + 20)
0a98 : a0 00 __ LDY #$00
0a9a : b1 0f __ LDA (P2),y 
0a9c : 91 0d __ STA (P0),y ; (dst + 0)
0a9e : c8 __ __ INY
0a9f : d0 f9 __ BNE $0a9a ; (memcpy.s4 + 6)
0aa1 : e6 10 __ INC P3 
0aa3 : e6 0e __ INC P1 ; (dst + 1)
0aa5 : ca __ __ DEX
0aa6 : d0 f2 __ BNE $0a9a ; (memcpy.s4 + 6)
0aa8 : a4 11 __ LDY P4 
0aaa : f0 0e __ BEQ $0aba ; (memcpy.s4 + 38)
0aac : 88 __ __ DEY
0aad : f0 07 __ BEQ $0ab6 ; (memcpy.s4 + 34)
0aaf : b1 0f __ LDA (P2),y 
0ab1 : 91 0d __ STA (P0),y ; (dst + 0)
0ab3 : 88 __ __ DEY
0ab4 : d0 f9 __ BNE $0aaf ; (memcpy.s4 + 27)
0ab6 : b1 0f __ LDA (P2),y 
0ab8 : 91 0d __ STA (P0),y ; (dst + 0)
0aba : a5 0d __ LDA P0 ; (dst + 0)
0abc : 85 1b __ STA ACCU + 0 
0abe : a5 0e __ LDA P1 ; (dst + 1)
0ac0 : 85 1c __ STA ACCU + 1 
.s3:
0ac2 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0ac3 : a4 0d __ LDY P0 ; (mode + 0)
0ac5 : c0 02 __ CPY #$02
0ac7 : d0 09 __ BNE $0ad2 ; (vic_setmode.s5 + 0)
.s10:
0ac9 : a9 5b __ LDA #$5b
0acb : 8d 11 d0 STA $d011 
.s8:
0ace : a9 08 __ LDA #$08
0ad0 : d0 0c __ BNE $0ade ; (vic_setmode.s7 + 0)
.s5:
0ad2 : b0 36 __ BCS $0b0a ; (vic_setmode.s6 + 0)
.s9:
0ad4 : a9 1b __ LDA #$1b
0ad6 : 8d 11 d0 STA $d011 
0ad9 : 98 __ __ TYA
0ada : f0 f2 __ BEQ $0ace ; (vic_setmode.s8 + 0)
.s11:
0adc : a9 18 __ LDA #$18
.s7:
0ade : 8d 16 d0 STA $d016 
0ae1 : ad 00 dd LDA $dd00 
0ae4 : 29 fc __ AND #$fc
0ae6 : 85 1b __ STA ACCU + 0 
0ae8 : a5 0f __ LDA P2 ; (text + 1)
0aea : 0a __ __ ASL
0aeb : 2a __ __ ROL
0aec : 29 01 __ AND #$01
0aee : 2a __ __ ROL
0aef : 49 03 __ EOR #$03
0af1 : 05 1b __ ORA ACCU + 0 
0af3 : 8d 00 dd STA $dd00 
0af6 : a5 0f __ LDA P2 ; (text + 1)
0af8 : 29 3c __ AND #$3c
0afa : 0a __ __ ASL
0afb : 0a __ __ ASL
0afc : 85 1b __ STA ACCU + 0 
0afe : a5 11 __ LDA P4 ; (font + 1)
0b00 : 29 38 __ AND #$38
0b02 : 4a __ __ LSR
0b03 : 4a __ __ LSR
0b04 : 05 1b __ ORA ACCU + 0 
0b06 : 8d 18 d0 STA $d018 
.s3:
0b09 : 60 __ __ RTS
.s6:
0b0a : a9 3b __ LDA #$3b
0b0c : 8d 11 d0 STA $d011 
0b0f : c0 03 __ CPY #$03
0b11 : d0 c9 __ BNE $0adc ; (vic_setmode.s11 + 0)
0b13 : f0 b9 __ BEQ $0ace ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b15 : 20 36 0b JSR $0b36 ; (rirq_init_tables.s4 + 0)
0b18 : 78 __ __ SEI
0b19 : a9 01 __ LDA #$01
0b1b : 8d 1a d0 STA $d01a 
0b1e : a9 54 __ LDA #$54
0b20 : 8d 14 03 STA $0314 
0b23 : a9 0b __ LDA #$0b
0b25 : 8d 15 03 STA $0315 
0b28 : ad 11 d0 LDA $d011 
0b2b : 29 7f __ AND #$7f
0b2d : 8d 11 d0 STA $d011 
0b30 : a9 ff __ LDA #$ff
0b32 : 8d 12 d0 STA $d012 
.s3:
0b35 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0b36 : a2 00 __ LDX #$00
.l5:
0b38 : a9 ff __ LDA #$ff
0b3a : 9d 49 35 STA $3549,x ; (rasterIRQRows[0] + 0)
0b3d : 8a __ __ TXA
0b3e : 9d 5b 35 STA $355b,x ; (rasterIRQIndex[0] + 1)
0b41 : e8 __ __ INX
0b42 : e0 10 __ CPX #$10
0b44 : d0 f2 __ BNE $0b38 ; (rirq_init_tables.l5 + 0)
.s6:
0b46 : 8e 5a 35 STX $355a ; (rasterIRQIndex[0] + 0)
0b49 : a9 ff __ LDA #$ff
0b4b : 8d 7b 35 STA $357b ; (rasterIRQNext[0] + 16)
0b4e : a9 00 __ LDA #$00
0b50 : 8d 59 35 STA $3559 ; (rasterIRQRows[0] + 16)
.s3:
0b53 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0b54 : ad 19 d0 LDA $d019 
0b57 : 10 51 __ BPL $0baa ; (rirq_isr_kernal_io + 86)
0b59 : ae 7c 35 LDX $357c ; (nextIRQ + 0)
0b5c : 30 33 __ BMI $0b91 ; (rirq_isr_kernal_io + 61)
0b5e : bd 6b 35 LDA $356b,x ; (rasterIRQNext[0] + 0)
0b61 : bc 5b 35 LDY $355b,x ; (rasterIRQIndex[0] + 1)
0b64 : be 7d 35 LDX $357d,y ; (rasterIRQLow[0] + 0)
0b67 : 8e 71 0b STX $0b71 ; (rirq_isr_kernal_io + 29)
0b6a : be 8d 35 LDX $358d,y ; (rasterIRQHigh[0] + 0)
0b6d : 8e 72 0b STX $0b72 ; (rirq_isr_kernal_io + 30)
0b70 : 20 00 00 JSR $0000 
0b73 : ee 7c 35 INC $357c ; (nextIRQ + 0)
0b76 : ae 7c 35 LDX $357c ; (nextIRQ + 0)
0b79 : bc 6b 35 LDY $356b,x ; (rasterIRQNext[0] + 0)
0b7c : 0e 19 d0 ASL $d019 
0b7f : c0 ff __ CPY #$ff
0b81 : f0 14 __ BEQ $0b97 ; (rirq_isr_kernal_io + 67)
0b83 : 88 __ __ DEY
0b84 : 88 __ __ DEY
0b85 : 8c 12 d0 STY $d012 
0b88 : 88 __ __ DEY
0b89 : cc 12 d0 CPY $d012 
0b8c : 90 d0 __ BCC $0b5e ; (rirq_isr_kernal_io + 10)
0b8e : 4c 81 ea JMP $ea81 
0b91 : 0e 19 d0 ASL $d019 
0b94 : 4c 81 ea JMP $ea81 
0b97 : ee 9d 35 INC $359d ; (rirq_count + 0)
0b9a : ac 6b 35 LDY $356b ; (rasterIRQNext[0] + 0)
0b9d : 88 __ __ DEY
0b9e : 88 __ __ DEY
0b9f : 8c 12 d0 STY $d012 
0ba2 : a2 00 __ LDX #$00
0ba4 : 8e 7c 35 STX $357c ; (nextIRQ + 0)
0ba7 : 4c 81 ea JMP $ea81 
0baa : ad 0d dc LDA $dc0d 
0bad : 58 __ __ CLI
0bae : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0bb1 : a5 0d __ LDA P0 ; (ic + 0)
0bb3 : 85 1b __ STA ACCU + 0 
0bb5 : a5 0e __ LDA P1 ; (ic + 1)
0bb7 : 85 1c __ STA ACCU + 1 
0bb9 : a9 a0 __ LDA #$a0
0bbb : a0 01 __ LDY #$01
0bbd : 91 0d __ STA (P0),y ; (ic + 0)
0bbf : a9 00 __ LDA #$00
0bc1 : c8 __ __ INY
0bc2 : 91 0d __ STA (P0),y ; (ic + 0)
0bc4 : a9 a2 __ LDA #$a2
0bc6 : c8 __ __ INY
0bc7 : 91 0d __ STA (P0),y ; (ic + 0)
0bc9 : a9 00 __ LDA #$00
0bcb : c8 __ __ INY
0bcc : 91 0d __ STA (P0),y ; (ic + 0)
0bce : a9 cd __ LDA #$cd
0bd0 : c8 __ __ INY
0bd1 : 91 0d __ STA (P0),y ; (ic + 0)
0bd3 : a9 12 __ LDA #$12
0bd5 : c8 __ __ INY
0bd6 : 91 0d __ STA (P0),y ; (ic + 0)
0bd8 : a9 d0 __ LDA #$d0
0bda : c8 __ __ INY
0bdb : 91 0d __ STA (P0),y ; (ic + 0)
0bdd : a9 b0 __ LDA #$b0
0bdf : c8 __ __ INY
0be0 : 91 0d __ STA (P0),y ; (ic + 0)
0be2 : a9 fb __ LDA #$fb
0be4 : c8 __ __ INY
0be5 : 91 0d __ STA (P0),y ; (ic + 0)
0be7 : a9 8c __ LDA #$8c
0be9 : c8 __ __ INY
0bea : 91 0d __ STA (P0),y ; (ic + 0)
0bec : a9 00 __ LDA #$00
0bee : c8 __ __ INY
0bef : 91 0d __ STA (P0),y ; (ic + 0)
0bf1 : c8 __ __ INY
0bf2 : 91 0d __ STA (P0),y ; (ic + 0)
0bf4 : a8 __ __ TAY
0bf5 : a5 0f __ LDA P2 ; (size + 0)
0bf7 : 91 0d __ STA (P0),y ; (ic + 0)
0bf9 : f0 53 __ BEQ $0c4e ; (rirq_build.s5 + 0)
.s6:
0bfb : a0 0d __ LDY #$0d
0bfd : c9 01 __ CMP #$01
0bff : d0 05 __ BNE $0c06 ; (rirq_build.s7 + 0)
.s10:
0c01 : a9 60 __ LDA #$60
0c03 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0c05 : 60 __ __ RTS
.s7:
0c06 : a9 8e __ LDA #$8e
0c08 : 91 0d __ STA (P0),y ; (ic + 0)
0c0a : a9 00 __ LDA #$00
0c0c : c8 __ __ INY
0c0d : 91 0d __ STA (P0),y ; (ic + 0)
0c0f : c8 __ __ INY
0c10 : 91 0d __ STA (P0),y ; (ic + 0)
0c12 : a5 0f __ LDA P2 ; (size + 0)
0c14 : c9 03 __ CMP #$03
0c16 : 90 2a __ BCC $0c42 ; (rirq_build.s8 + 0)
.s9:
0c18 : e9 02 __ SBC #$02
0c1a : aa __ __ TAX
0c1b : 18 __ __ CLC
0c1c : a5 0d __ LDA P0 ; (ic + 0)
0c1e : 69 01 __ ADC #$01
0c20 : 85 1b __ STA ACCU + 0 
0c22 : a5 0e __ LDA P1 ; (ic + 1)
0c24 : 69 00 __ ADC #$00
0c26 : 85 1c __ STA ACCU + 1 
.l11:
0c28 : a9 a9 __ LDA #$a9
0c2a : 91 1b __ STA (ACCU + 0),y 
0c2c : a9 00 __ LDA #$00
0c2e : c8 __ __ INY
0c2f : 91 1b __ STA (ACCU + 0),y 
0c31 : a9 8d __ LDA #$8d
0c33 : c8 __ __ INY
0c34 : 91 1b __ STA (ACCU + 0),y 
0c36 : a9 00 __ LDA #$00
0c38 : c8 __ __ INY
0c39 : 91 1b __ STA (ACCU + 0),y 
0c3b : c8 __ __ INY
0c3c : 91 1b __ STA (ACCU + 0),y 
0c3e : c8 __ __ INY
0c3f : ca __ __ DEX
0c40 : d0 e6 __ BNE $0c28 ; (rirq_build.l11 + 0)
.s8:
0c42 : 98 __ __ TYA
0c43 : 18 __ __ CLC
0c44 : 65 0d __ ADC P0 ; (ic + 0)
0c46 : 85 1b __ STA ACCU + 0 
0c48 : a5 0e __ LDA P1 ; (ic + 1)
0c4a : 69 00 __ ADC #$00
0c4c : 85 1c __ STA ACCU + 1 
.s5:
0c4e : a9 60 __ LDA #$60
0c50 : a0 01 __ LDY #$01
0c52 : 91 1b __ STA (ACCU + 0),y 
0c54 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0c55 : 85 0d __ STA P0 ; (inirq + 0)
0c57 : a9 ff __ LDA #$ff
0c59 : 8d 7c 35 STA $357c ; (nextIRQ + 0)
0c5c : ae 5b 35 LDX $355b ; (rasterIRQIndex[0] + 1)
0c5f : bd 49 35 LDA $3549,x ; (rasterIRQRows[0] + 0)
0c62 : 85 1c __ STA ACCU + 1 
0c64 : a2 02 __ LDX #$02
.l5:
0c66 : bc 5a 35 LDY $355a,x ; (rasterIRQIndex[0] + 0)
0c69 : b9 49 35 LDA $3549,y ; (rasterIRQRows[0] + 0)
0c6c : c5 1c __ CMP ACCU + 1 
0c6e : 90 04 __ BCC $0c74 ; (rirq_sort.s12 + 0)
.s6:
0c70 : 85 1c __ STA ACCU + 1 
0c72 : b0 24 __ BCS $0c98 ; (rirq_sort.s7 + 0)
.s12:
0c74 : 86 1d __ STX ACCU + 2 
0c76 : 84 1e __ STY ACCU + 3 
0c78 : 85 1b __ STA ACCU + 0 
0c7a : bd 59 35 LDA $3559,x ; (rasterIRQRows[0] + 16)
0c7d : 9d 5a 35 STA $355a,x ; (rasterIRQIndex[0] + 0)
0c80 : 90 05 __ BCC $0c87 ; (rirq_sort.l13 + 0)
.s15:
0c82 : 98 __ __ TYA
0c83 : 9d 59 35 STA $3559,x ; (rasterIRQRows[0] + 16)
0c86 : ca __ __ DEX
.l13:
0c87 : a5 1b __ LDA ACCU + 0 
0c89 : bc 58 35 LDY $3558,x ; (rasterIRQRows[0] + 15)
0c8c : d9 49 35 CMP $3549,y ; (rasterIRQRows[0] + 0)
0c8f : 90 f1 __ BCC $0c82 ; (rirq_sort.s15 + 0)
.s14:
0c91 : a5 1e __ LDA ACCU + 3 
0c93 : 9d 59 35 STA $3559,x ; (rasterIRQRows[0] + 16)
0c96 : a6 1d __ LDX ACCU + 2 
.s7:
0c98 : e8 __ __ INX
0c99 : e0 11 __ CPX #$11
0c9b : 90 c9 __ BCC $0c66 ; (rirq_sort.l5 + 0)
.s8:
0c9d : a2 03 __ LDX #$03
.l17:
0c9f : bc 5b 35 LDY $355b,x ; (rasterIRQIndex[0] + 1)
0ca2 : b9 49 35 LDA $3549,y ; (rasterIRQRows[0] + 0)
0ca5 : 9d 6b 35 STA $356b,x ; (rasterIRQNext[0] + 0)
0ca8 : bc 5f 35 LDY $355f,x ; (rasterIRQIndex[0] + 5)
0cab : b9 49 35 LDA $3549,y ; (rasterIRQRows[0] + 0)
0cae : 9d 6f 35 STA $356f,x ; (rasterIRQNext[0] + 4)
0cb1 : bc 63 35 LDY $3563,x ; (rasterIRQIndex[0] + 9)
0cb4 : b9 49 35 LDA $3549,y ; (rasterIRQRows[0] + 0)
0cb7 : 9d 73 35 STA $3573,x ; (rasterIRQNext[0] + 8)
0cba : bc 67 35 LDY $3567,x ; (rasterIRQIndex[0] + 13)
0cbd : b9 49 35 LDA $3549,y ; (rasterIRQRows[0] + 0)
0cc0 : 9d 77 35 STA $3577,x ; (rasterIRQNext[0] + 12)
0cc3 : ca __ __ DEX
0cc4 : 10 d9 __ BPL $0c9f ; (rirq_sort.l17 + 0)
.s18:
0cc6 : a5 0d __ LDA P0 ; (inirq + 0)
0cc8 : f0 06 __ BEQ $0cd0 ; (rirq_sort.s9 + 0)
.s11:
0cca : a9 0f __ LDA #$0f
.s16:
0ccc : 8d 7c 35 STA $357c ; (nextIRQ + 0)
.s3:
0ccf : 60 __ __ RTS
.s9:
0cd0 : ac 6b 35 LDY $356b ; (rasterIRQNext[0] + 0)
0cd3 : c0 ff __ CPY #$ff
0cd5 : f0 f8 __ BEQ $0ccf ; (rirq_sort.s3 + 0)
.s10:
0cd7 : 88 __ __ DEY
0cd8 : 8c 12 d0 STY $d012 
0cdb : 4c cc 0c JMP $0ccc ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0cde : ad 11 d0 LDA $d011 
0ce1 : 29 7f __ AND #$7f
0ce3 : 8d 11 d0 STA $d011 
0ce6 : a9 64 __ LDA #$64
0ce8 : 8d 12 d0 STA $d012 
0ceb : 0e 19 d0 ASL $d019 
0cee : 58 __ __ CLI
.s3:
0cef : 60 __ __ RTS
--------------------------------------------------------------------
screen_flip: ; screen_flip()->void
;  63, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
0cf0 : a9 00 __ LDA #$00
0cf2 : cd de 35 CMP $35de ; (FlipIndex + 0)
0cf5 : 2a __ __ ROL
0cf6 : 85 43 __ STA T3 + 0 
0cf8 : 8d de 35 STA $35de ; (FlipIndex + 0)
.l5:
0cfb : 2c 11 d0 BIT $d011 
0cfe : 10 fb __ BPL $0cfb ; (screen_flip.l5 + 0)
.s6:
0d00 : a9 00 __ LDA #$00
0d02 : 85 0d __ STA P0 
0d04 : 85 10 __ STA P3 
0d06 : a5 43 __ LDA T3 + 0 
0d08 : c9 01 __ CMP #$01
0d0a : a9 d0 __ LDA #$d0
0d0c : 85 11 __ STA P4 
0d0e : a9 00 __ LDA #$00
0d10 : 85 0e __ STA P1 
0d12 : 69 ff __ ADC #$ff
0d14 : 29 04 __ AND #$04
0d16 : 49 c8 __ EOR #$c8
0d18 : 85 0f __ STA P2 
0d1a : 20 c3 0a JSR $0ac3 ; (vic_setmode.s4 + 0)
0d1d : a0 00 __ LDY #$00
.l7:
0d1f : b9 00 c4 LDA $c400,y 
0d22 : 99 00 d8 STA $d800,y 
0d25 : c8 __ __ INY
0d26 : d0 f7 __ BNE $0d1f ; (screen_flip.l7 + 0)
.l8:
0d28 : b9 00 c5 LDA $c500,y 
0d2b : 99 00 d9 STA $d900,y 
0d2e : c8 __ __ INY
0d2f : d0 f7 __ BNE $0d28 ; (screen_flip.l8 + 0)
.l9:
0d31 : b9 00 c6 LDA $c600,y 
0d34 : 99 00 da STA $da00,y 
0d37 : c8 __ __ INY
0d38 : d0 f7 __ BNE $0d31 ; (screen_flip.l9 + 0)
.l10:
0d3a : b9 00 c7 LDA $c700,y 
0d3d : 99 00 db STA $db00,y 
0d40 : c8 __ __ INY
0d41 : d0 f7 __ BNE $0d3a ; (screen_flip.l10 + 0)
.s11:
0d43 : 8c df 35 STY $35df ; (DrawScreen + 0)
0d46 : a5 43 __ LDA T3 + 0 
0d48 : f0 04 __ BEQ $0d4e ; (screen_flip.s12 + 0)
.s13:
0d4a : a9 cc __ LDA #$cc
0d4c : d0 02 __ BNE $0d50 ; (screen_flip.s14 + 0)
.s12:
0d4e : a9 c8 __ LDA #$c8
.s14:
0d50 : 8d e0 35 STA $35e0 ; (DrawScreen + 1)
.s3:
0d53 : 60 __ __ RTS
--------------------------------------------------------------------
maze_draw: ; maze_draw(const u8*)->void
; 263, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s1:
0d54 : a2 04 __ LDX #$04
0d56 : b5 53 __ LDA T10 + 0,x 
0d58 : 9d f7 9f STA $9ff7,x ; (maze_draw@stack + 0)
0d5b : ca __ __ DEX
0d5c : 10 f8 __ BPL $0d56 ; (maze_draw.s1 + 2)
.s4:
0d5e : ad 17 35 LDA $3517 ; (dx + 0)
0d61 : 85 51 __ STA T8 + 0 
0d63 : f0 03 __ BEQ $0d68 ; (maze_draw.s5 + 0)
0d65 : 4c 96 0f JMP $0f96 ; (maze_draw.s42 + 0)
.s5:
0d68 : ad 18 35 LDA $3518 ; (dy + 0)
0d6b : 30 06 __ BMI $0d73 ; (maze_draw.s6 + 0)
.s41:
0d6d : f0 04 __ BEQ $0d73 ; (maze_draw.s6 + 0)
.s40:
0d6f : a9 0f __ LDA #$0f
0d71 : d0 02 __ BNE $0d75 ; (maze_draw.s7 + 0)
.s6:
0d73 : a9 0b __ LDA #$0b
.s7:
0d75 : 85 52 __ STA T9 + 0 
0d77 : a9 0c __ LDA #$0c
0d79 : 85 54 __ STA T11 + 0 
.s46:
0d7b : 85 53 __ STA T10 + 0 
.s8:
0d7d : a9 00 __ LDA #$00
0d7f : 85 55 __ STA T12 + 0 
0d81 : 85 56 __ STA T13 + 0 
0d83 : ad 19 35 LDA $3519 ; (px + 0)
0d86 : 85 45 __ STA T0 + 0 
0d88 : ad 1a 35 LDA $351a ; (py + 0)
0d8b : 85 47 __ STA T1 + 0 
.l9:
0d8d : a5 45 __ LDA T0 + 0 
0d8f : 85 4a __ STA T3 + 0 
0d91 : 29 80 __ AND #$80
0d93 : 10 02 __ BPL $0d97 ; (maze_draw.l9 + 10)
0d95 : a9 ff __ LDA #$ff
0d97 : 85 4b __ STA T3 + 1 
0d99 : a5 47 __ LDA T1 + 0 
0d9b : 0a __ __ ASL
0d9c : aa __ __ TAX
0d9d : bd 1b 35 LDA $351b,x ; (maze[0] + 0)
0da0 : 18 __ __ CLC
0da1 : 65 45 __ ADC T0 + 0 
0da3 : 85 45 __ STA T0 + 0 
0da5 : bd 1c 35 LDA $351c,x ; (maze[0] + 1)
0da8 : 65 4b __ ADC T3 + 1 
0daa : 85 46 __ STA T0 + 1 
0dac : a0 00 __ LDY #$00
0dae : b1 45 __ LDA (T0 + 0),y 
0db0 : c9 23 __ CMP #$23
0db2 : d0 03 __ BNE $0db7 ; (maze_draw.s10 + 0)
0db4 : 4c 60 0f JMP $0f60 ; (maze_draw.s38 + 0)
.s10:
0db7 : a5 55 __ LDA T12 + 0 
0db9 : 85 49 __ STA T2 + 0 
0dbb : a9 14 __ LDA #$14
0dbd : a4 56 __ LDY T13 + 0 
0dbf : 38 __ __ SEC
0dc0 : f1 12 __ SBC (P5),y ; (zxdist + 0)
0dc2 : 85 4d __ STA T5 + 0 
0dc4 : a9 00 __ LDA #$00
0dc6 : e9 00 __ SBC #$00
0dc8 : 85 4e __ STA T5 + 1 
0dca : ad 18 35 LDA $3518 ; (dy + 0)
0dcd : 85 4f __ STA T6 + 0 
0dcf : 29 80 __ AND #$80
0dd1 : 10 02 __ BPL $0dd5 ; (maze_draw.s10 + 30)
0dd3 : a9 ff __ LDA #$ff
0dd5 : 85 50 __ STA T6 + 1 
0dd7 : 18 __ __ CLC
0dd8 : a5 4f __ LDA T6 + 0 
0dda : 65 4a __ ADC T3 + 0 
0ddc : 85 45 __ STA T0 + 0 
0dde : a5 50 __ LDA T6 + 1 
0de0 : 65 4b __ ADC T3 + 1 
0de2 : a8 __ __ TAY
0de3 : a5 47 __ LDA T1 + 0 
0de5 : 85 4c __ STA T4 + 0 
0de7 : 38 __ __ SEC
0de8 : e5 51 __ SBC T8 + 0 
0dea : 0a __ __ ASL
0deb : aa __ __ TAX
0dec : bd 1b 35 LDA $351b,x ; (maze[0] + 0)
0def : 18 __ __ CLC
0df0 : 65 45 __ ADC T0 + 0 
0df2 : 85 47 __ STA T1 + 0 
0df4 : 98 __ __ TYA
0df5 : 7d 1c 35 ADC $351c,x ; (maze[0] + 1)
0df8 : 85 48 __ STA T1 + 1 
0dfa : a0 00 __ LDY #$00
0dfc : b1 47 __ LDA (T1 + 0),y 
0dfe : c9 23 __ CMP #$23
0e00 : d0 03 __ BNE $0e05 ; (maze_draw.s11 + 0)
0e02 : 4c 19 0f JMP $0f19 ; (maze_draw.s31 + 0)
.s11:
0e05 : a5 4e __ LDA T5 + 1 
0e07 : 30 3e __ BMI $0e47 ; (maze_draw.s12 + 0)
.s30:
0e09 : d0 06 __ BNE $0e11 ; (maze_draw.s25 + 0)
.s29:
0e0b : a5 55 __ LDA T12 + 0 
0e0d : c5 4d __ CMP T5 + 0 
0e0f : b0 36 __ BCS $0e47 ; (maze_draw.s12 + 0)
.s25:
0e11 : a5 4d __ LDA T5 + 0 
0e13 : 29 03 __ AND #$03
0e15 : 09 60 __ ORA #$60
0e17 : 85 47 __ STA T1 + 0 
0e19 : a5 55 __ LDA T12 + 0 
0e1b : 85 57 __ STA T14 + 0 
.l26:
0e1d : a5 57 __ LDA T14 + 0 
0e1f : 85 0d __ STA P0 
0e21 : a5 52 __ LDA T9 + 0 
0e23 : 85 0e __ STA P1 
0e25 : 20 c0 10 JSR $10c0 ; (color_column.s4 + 0)
0e28 : a5 4d __ LDA T5 + 0 
0e2a : 85 0e __ STA P1 
0e2c : a5 47 __ LDA T1 + 0 
0e2e : 85 0f __ STA P2 
0e30 : a9 60 __ LDA #$60
0e32 : 85 10 __ STA P3 
0e34 : 85 11 __ STA P4 
0e36 : 20 10 11 JSR $1110 ; (screen_column.s4 + 0)
0e39 : e6 57 __ INC T14 + 0 
0e3b : a5 4e __ LDA T5 + 1 
0e3d : 30 08 __ BMI $0e47 ; (maze_draw.s12 + 0)
.s28:
0e3f : d0 dc __ BNE $0e1d ; (maze_draw.l26 + 0)
.s27:
0e41 : a5 57 __ LDA T14 + 0 
0e43 : c5 0e __ CMP P1 
0e45 : 90 d6 __ BCC $0e1d ; (maze_draw.l26 + 0)
.s12:
0e47 : 38 __ __ SEC
0e48 : a5 4a __ LDA T3 + 0 
0e4a : e5 4f __ SBC T6 + 0 
0e4c : 85 45 __ STA T0 + 0 
0e4e : a5 4b __ LDA T3 + 1 
0e50 : e5 50 __ SBC T6 + 1 
0e52 : a8 __ __ TAY
0e53 : 18 __ __ CLC
0e54 : a5 4c __ LDA T4 + 0 
0e56 : 65 51 __ ADC T8 + 0 
0e58 : 0a __ __ ASL
0e59 : aa __ __ TAX
0e5a : bd 1b 35 LDA $351b,x ; (maze[0] + 0)
0e5d : 18 __ __ CLC
0e5e : 65 45 __ ADC T0 + 0 
0e60 : 85 47 __ STA T1 + 0 
0e62 : 98 __ __ TYA
0e63 : 7d 1c 35 ADC $351c,x ; (maze[0] + 1)
0e66 : 85 48 __ STA T1 + 1 
0e68 : a0 00 __ LDY #$00
0e6a : b1 47 __ LDA (T1 + 0),y 
0e6c : c9 23 __ CMP #$23
0e6e : f0 69 __ BEQ $0ed9 ; (maze_draw.s21 + 0)
.s13:
0e70 : a5 4e __ LDA T5 + 1 
0e72 : 30 3d __ BMI $0eb1 ; (maze_draw.s14 + 0)
.s20:
0e74 : d0 06 __ BNE $0e7c ; (maze_draw.s15 + 0)
.s19:
0e76 : a5 55 __ LDA T12 + 0 
0e78 : c5 4d __ CMP T5 + 0 
0e7a : b0 35 __ BCS $0eb1 ; (maze_draw.s14 + 0)
.s15:
0e7c : a5 4d __ LDA T5 + 0 
0e7e : 29 03 __ AND #$03
0e80 : 09 60 __ ORA #$60
0e82 : 85 47 __ STA T1 + 0 
.l16:
0e84 : a5 52 __ LDA T9 + 0 
0e86 : 85 0e __ STA P1 
0e88 : 38 __ __ SEC
0e89 : a9 27 __ LDA #$27
0e8b : e5 55 __ SBC T12 + 0 
0e8d : 85 0d __ STA P0 
0e8f : 20 c0 10 JSR $10c0 ; (color_column.s4 + 0)
0e92 : a5 4d __ LDA T5 + 0 
0e94 : 85 0e __ STA P1 
0e96 : a5 47 __ LDA T1 + 0 
0e98 : 85 0f __ STA P2 
0e9a : a9 60 __ LDA #$60
0e9c : 85 10 __ STA P3 
0e9e : 85 11 __ STA P4 
0ea0 : 20 10 11 JSR $1110 ; (screen_column.s4 + 0)
0ea3 : e6 55 __ INC T12 + 0 
0ea5 : a5 4e __ LDA T5 + 1 
0ea7 : 30 08 __ BMI $0eb1 ; (maze_draw.s14 + 0)
.s18:
0ea9 : d0 d9 __ BNE $0e84 ; (maze_draw.l16 + 0)
.s17:
0eab : a5 55 __ LDA T12 + 0 
0ead : c5 0e __ CMP P1 
0eaf : 90 d3 __ BCC $0e84 ; (maze_draw.l16 + 0)
.s14:
0eb1 : 18 __ __ CLC
0eb2 : a5 4a __ LDA T3 + 0 
0eb4 : 65 51 __ ADC T8 + 0 
0eb6 : 85 45 __ STA T0 + 0 
0eb8 : 18 __ __ CLC
0eb9 : a5 4c __ LDA T4 + 0 
0ebb : 65 4f __ ADC T6 + 0 
0ebd : 85 47 __ STA T1 + 0 
0ebf : a5 4d __ LDA T5 + 0 
0ec1 : 85 55 __ STA T12 + 0 
0ec3 : e6 56 __ INC T13 + 0 
0ec5 : a5 56 __ LDA T13 + 0 
0ec7 : c9 07 __ CMP #$07
0ec9 : b0 03 __ BCS $0ece ; (maze_draw.s3 + 0)
0ecb : 4c 8d 0d JMP $0d8d ; (maze_draw.l9 + 0)
.s3:
0ece : a2 04 __ LDX #$04
0ed0 : bd f7 9f LDA $9ff7,x ; (maze_draw@stack + 0)
0ed3 : 95 53 __ STA T10 + 0,x 
0ed5 : ca __ __ DEX
0ed6 : 10 f8 __ BPL $0ed0 ; (maze_draw.s3 + 2)
0ed8 : 60 __ __ RTS
.s21:
0ed9 : a5 4e __ LDA T5 + 1 
0edb : 30 d4 __ BMI $0eb1 ; (maze_draw.s14 + 0)
.l24:
0edd : d0 06 __ BNE $0ee5 ; (maze_draw.s22 + 0)
.s23:
0edf : a5 49 __ LDA T2 + 0 
0ee1 : c5 4d __ CMP T5 + 0 
0ee3 : b0 cc __ BCS $0eb1 ; (maze_draw.s14 + 0)
.s22:
0ee5 : a5 54 __ LDA T11 + 0 
0ee7 : 85 0e __ STA P1 
0ee9 : 38 __ __ SEC
0eea : a9 27 __ LDA #$27
0eec : e5 55 __ SBC T12 + 0 
0eee : 85 0d __ STA P0 
0ef0 : 20 c0 10 JSR $10c0 ; (color_column.s4 + 0)
0ef3 : a5 55 __ LDA T12 + 0 
0ef5 : 85 0e __ STA P1 
0ef7 : 29 03 __ AND #$03
0ef9 : 85 45 __ STA T0 + 0 
0efb : a9 60 __ LDA #$60
0efd : 85 10 __ STA P3 
0eff : a9 7d __ LDA #$7d
0f01 : 85 11 __ STA P4 
0f03 : 38 __ __ SEC
0f04 : a9 6b __ LDA #$6b
0f06 : e5 45 __ SBC T0 + 0 
0f08 : 85 0f __ STA P2 
0f0a : 20 10 11 JSR $1110 ; (screen_column.s4 + 0)
0f0d : e6 55 __ INC T12 + 0 
0f0f : a5 55 __ LDA T12 + 0 
0f11 : 85 49 __ STA T2 + 0 
0f13 : a5 4e __ LDA T5 + 1 
0f15 : 10 c6 __ BPL $0edd ; (maze_draw.l24 + 0)
0f17 : 30 98 __ BMI $0eb1 ; (maze_draw.s14 + 0)
.s31:
0f19 : a5 4e __ LDA T5 + 1 
0f1b : 10 03 __ BPL $0f20 ; (maze_draw.s37 + 0)
0f1d : 4c 47 0e JMP $0e47 ; (maze_draw.s12 + 0)
.s37:
0f20 : d0 39 __ BNE $0f5b ; (maze_draw.s47 + 0)
.s36:
0f22 : a5 55 __ LDA T12 + 0 
0f24 : c5 4d __ CMP T5 + 0 
0f26 : b0 f5 __ BCS $0f1d ; (maze_draw.s31 + 4)
.s32:
0f28 : 85 47 __ STA T1 + 0 
.l33:
0f2a : a5 47 __ LDA T1 + 0 
0f2c : 85 0d __ STA P0 
0f2e : a5 53 __ LDA T10 + 0 
0f30 : 85 0e __ STA P1 
0f32 : 20 c0 10 JSR $10c0 ; (color_column.s4 + 0)
0f35 : a5 0d __ LDA P0 
0f37 : 85 0e __ STA P1 
0f39 : 29 03 __ AND #$03
0f3b : 09 64 __ ORA #$64
0f3d : 85 0f __ STA P2 
0f3f : a9 60 __ LDA #$60
0f41 : 85 10 __ STA P3 
0f43 : a9 7c __ LDA #$7c
0f45 : 85 11 __ STA P4 
0f47 : 20 10 11 JSR $1110 ; (screen_column.s4 + 0)
0f4a : e6 47 __ INC T1 + 0 
0f4c : a5 4e __ LDA T5 + 1 
0f4e : 30 cd __ BMI $0f1d ; (maze_draw.s31 + 4)
.s35:
0f50 : d0 d8 __ BNE $0f2a ; (maze_draw.l33 + 0)
.s34:
0f52 : a5 47 __ LDA T1 + 0 
0f54 : c5 4d __ CMP T5 + 0 
0f56 : 90 d2 __ BCC $0f2a ; (maze_draw.l33 + 0)
0f58 : 4c 47 0e JMP $0e47 ; (maze_draw.s12 + 0)
.s47:
0f5b : a5 55 __ LDA T12 + 0 
0f5d : 4c 28 0f JMP $0f28 ; (maze_draw.s32 + 0)
.s38:
0f60 : a9 28 __ LDA #$28
0f62 : e5 55 __ SBC T12 + 0 
0f64 : 85 47 __ STA T1 + 0 
0f66 : a5 55 __ LDA T12 + 0 
0f68 : c5 47 __ CMP T1 + 0 
0f6a : 90 03 __ BCC $0f6f ; (maze_draw.s39 + 0)
0f6c : 4c ce 0e JMP $0ece ; (maze_draw.s3 + 0)
.s39:
0f6f : 85 0d __ STA P0 
0f71 : 29 03 __ AND #$03
0f73 : 09 60 __ ORA #$60
0f75 : 85 0f __ STA P2 
0f77 : a9 60 __ LDA #$60
0f79 : 85 10 __ STA P3 
0f7b : 85 11 __ STA P4 
.l45:
0f7d : a5 52 __ LDA T9 + 0 
0f7f : 85 0e __ STA P1 
0f81 : 20 c0 10 JSR $10c0 ; (color_column.s4 + 0)
0f84 : a5 55 __ LDA T12 + 0 
0f86 : 85 0e __ STA P1 
0f88 : 20 10 11 JSR $1110 ; (screen_column.s4 + 0)
0f8b : e6 0d __ INC P0 
0f8d : a5 0d __ LDA P0 
0f8f : c5 47 __ CMP T1 + 0 
0f91 : 90 ea __ BCC $0f7d ; (maze_draw.l45 + 0)
0f93 : 4c ce 0e JMP $0ece ; (maze_draw.s3 + 0)
.s42:
0f96 : a9 0c __ LDA #$0c
0f98 : 85 52 __ STA T9 + 0 
0f9a : a9 0f __ LDA #$0f
0f9c : 24 51 __ BIT T8 + 0 
0f9e : 10 09 __ BPL $0fa9 ; (maze_draw.s43 + 0)
.s44:
0fa0 : 85 53 __ STA T10 + 0 
0fa2 : a9 0b __ LDA #$0b
0fa4 : 85 54 __ STA T11 + 0 
0fa6 : 4c 7d 0d JMP $0d7d ; (maze_draw.s8 + 0)
.s43:
0fa9 : 85 54 __ STA T11 + 0 
0fab : a9 0b __ LDA #$0b
0fad : 4c 7b 0d JMP $0d7b ; (maze_draw.s46 + 0)
--------------------------------------------------------------------
0fb0 : __ __ __ BYT 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 : ################
0fc0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0fc1 : __ __ __ BYT 23 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 23 2e 2e 2e 23 : #..........#...#
0fd1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0fd2 : __ __ __ BYT 23 2e 23 23 23 2e 23 23 23 23 2e 23 23 23 2e 23 : #.###.####.###.#
0fe2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0fe3 : __ __ __ BYT 23 2e 2e 2e 2e 2e 2e 2e 2e 23 2e 23 2e 23 2e 23 : #........#.#.#.#
0ff3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0ff4 : __ __ __ BYT 23 23 2e 23 23 23 23 23 2e 23 23 23 2e 23 2e 23 : ##.#####.###.#.#
1004 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1005 : __ __ __ BYT 23 2e 2e 23 2e 2e 2e 2e 2e 2e 23 23 2e 23 2e 23 : #..#......##.#.#
1015 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1016 : __ __ __ BYT 23 2e 23 23 2e 23 23 23 23 2e 2e 2e 2e 2e 2e 23 : #.##.####......#
1026 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1027 : __ __ __ BYT 23 2e 23 2e 2e 2e 2e 2e 23 2e 23 23 23 23 2e 23 : #.#.....#.####.#
1037 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1038 : __ __ __ BYT 23 2e 23 23 23 23 23 2e 23 2e 2e 2e 2e 23 2e 23 : #.#####.#....#.#
1048 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1049 : __ __ __ BYT 23 2e 2e 2e 2e 2e 2e 2e 23 23 23 23 23 23 2e 23 : #.......######.#
1059 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
105a : __ __ __ BYT 23 2e 23 23 2e 23 23 23 23 2e 2e 2e 2e 2e 2e 23 : #.##.####......#
106a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
106b : __ __ __ BYT 23 2e 23 2e 2e 23 23 2e 2e 2e 23 23 23 23 2e 23 : #.#..##...####.#
107b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
107c : __ __ __ BYT 23 2e 23 23 2e 2e 2e 2e 23 2e 2e 2e 2e 23 2e 23 : #.##....#....#.#
108c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
108d : __ __ __ BYT 23 2e 23 23 23 23 23 2e 23 23 23 23 23 23 2e 23 : #.#####.######.#
109d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
109e : __ __ __ BYT 23 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 2e 23 : #..............#
10ae : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
10af : __ __ __ BYT 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 : ################
10bf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
color_column: ; color_column(u8,u8)->void
; 204, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
10c0 : a5 0e __ LDA P1 ; (color + 0)
10c2 : a6 0d __ LDX P0 ; (cx + 0)
10c4 : 9d 00 c4 STA $c400,x 
10c7 : 9d 28 c4 STA $c428,x 
10ca : 9d 50 c4 STA $c450,x 
10cd : 9d 78 c4 STA $c478,x 
10d0 : 9d a0 c4 STA $c4a0,x 
10d3 : 9d c8 c4 STA $c4c8,x 
10d6 : 9d f0 c4 STA $c4f0,x 
10d9 : 9d 18 c5 STA $c518,x 
10dc : 9d 40 c5 STA $c540,x 
10df : 9d 68 c5 STA $c568,x 
10e2 : 9d 90 c5 STA $c590,x 
10e5 : 9d b8 c5 STA $c5b8,x 
10e8 : 9d e0 c5 STA $c5e0,x 
10eb : 9d 08 c6 STA $c608,x 
10ee : 9d 30 c6 STA $c630,x 
10f1 : 9d 58 c6 STA $c658,x 
10f4 : 9d 80 c6 STA $c680,x 
10f7 : 9d a8 c6 STA $c6a8,x 
10fa : 9d d0 c6 STA $c6d0,x 
10fd : 9d f8 c6 STA $c6f8,x 
1100 : 9d 20 c7 STA $c720,x 
1103 : 9d 48 c7 STA $c748,x 
1106 : 9d 70 c7 STA $c770,x 
1109 : 9d 98 c7 STA $c798,x 
110c : 9d c0 c7 STA $c7c0,x 
.s3:
110f : 60 __ __ RTS
--------------------------------------------------------------------
screen_column: ; screen_column(u8,u8,u8,u8,u8)->void
; 215, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
1110 : ad df 35 LDA $35df ; (DrawScreen + 0)
1113 : 18 __ __ CLC
1114 : 65 0d __ ADC P0 ; (cx + 0)
1116 : 85 43 __ STA T1 + 0 
1118 : ad e0 35 LDA $35e0 ; (DrawScreen + 1)
111b : 69 00 __ ADC #$00
111d : 85 44 __ STA T1 + 1 
111f : 38 __ __ SEC
1120 : a9 19 __ LDA #$19
1122 : e5 0e __ SBC P1 ; (sx + 0)
1124 : 85 1b __ STA ACCU + 0 
1126 : a5 0e __ LDA P1 ; (sx + 0)
1128 : 4a __ __ LSR
1129 : 4a __ __ LSR
112a : c5 1b __ CMP ACCU + 0 
112c : 90 1a __ BCC $1148 ; (screen_column.s6 + 0)
.s5:
112e : a9 00 __ LDA #$00
1130 : a4 43 __ LDY T1 + 0 
1132 : 85 43 __ STA T1 + 0 
1134 : a2 19 __ LDX #$19
1136 : 18 __ __ CLC
.l16:
1137 : a9 7e __ LDA #$7e
1139 : 91 43 __ STA (T1 + 0),y 
113b : 98 __ __ TYA
113c : 69 28 __ ADC #$28
113e : a8 __ __ TAY
113f : 90 03 __ BCC $1144 ; (screen_column.s29 + 0)
.s28:
1141 : e6 44 __ INC T1 + 1 
1143 : 18 __ __ CLC
.s29:
1144 : ca __ __ DEX
1145 : d0 f0 __ BNE $1137 ; (screen_column.l16 + 0)
.s3:
1147 : 60 __ __ RTS
.s6:
1148 : 85 1c __ STA ACCU + 1 
114a : aa __ __ TAX
114b : f0 1a __ BEQ $1167 ; (screen_column.s7 + 0)
.s11:
114d : aa __ __ TAX
114e : a5 43 __ LDA T1 + 0 
1150 : a0 00 __ LDY #$00
1152 : 84 43 __ STY T1 + 0 
1154 : a8 __ __ TAY
.l12:
1155 : a9 7e __ LDA #$7e
1157 : 91 43 __ STA (T1 + 0),y 
1159 : 98 __ __ TYA
115a : 69 28 __ ADC #$28
115c : a8 __ __ TAY
115d : 90 03 __ BCC $1162 ; (screen_column.s19 + 0)
.s18:
115f : e6 44 __ INC T1 + 1 
1161 : 18 __ __ CLC
.s19:
1162 : ca __ __ DEX
1163 : d0 f0 __ BNE $1155 ; (screen_column.l12 + 0)
.s13:
1165 : 85 43 __ STA T1 + 0 
.s7:
1167 : a5 0f __ LDA P2 ; (tc + 0)
1169 : a0 00 __ LDY #$00
116b : 91 43 __ STA (T1 + 0),y 
116d : 18 __ __ CLC
116e : a5 43 __ LDA T1 + 0 
1170 : 69 28 __ ADC #$28
1172 : 85 43 __ STA T1 + 0 
1174 : 90 02 __ BCC $1178 ; (screen_column.s21 + 0)
.s20:
1176 : e6 44 __ INC T1 + 1 
.s21:
1178 : a5 1b __ LDA ACCU + 0 
117a : 38 __ __ SEC
117b : e5 1c __ SBC ACCU + 1 
117d : 38 __ __ SEC
117e : e9 02 __ SBC #$02
1180 : f0 1b __ BEQ $119d ; (screen_column.s8 + 0)
.s10:
1182 : aa __ __ TAX
1183 : a5 43 __ LDA T1 + 0 
1185 : 84 43 __ STY T1 + 0 
1187 : a8 __ __ TAY
1188 : 18 __ __ CLC
.l14:
1189 : a5 10 __ LDA P3 ; (mc + 0)
118b : 91 43 __ STA (T1 + 0),y 
118d : 98 __ __ TYA
118e : 69 28 __ ADC #$28
1190 : a8 __ __ TAY
1191 : 90 03 __ BCC $1196 ; (screen_column.s23 + 0)
.s22:
1193 : e6 44 __ INC T1 + 1 
1195 : 18 __ __ CLC
.s23:
1196 : ca __ __ DEX
1197 : d0 f0 __ BNE $1189 ; (screen_column.l14 + 0)
.s15:
1199 : 85 43 __ STA T1 + 0 
119b : a0 00 __ LDY #$00
.s8:
119d : a5 11 __ LDA P4 ; (bc + 0)
119f : 91 43 __ STA (T1 + 0),y 
11a1 : a5 1b __ LDA ACCU + 0 
11a3 : c9 19 __ CMP #$19
11a5 : b0 a0 __ BCS $1147 ; (screen_column.s3 + 0)
.s9:
11a7 : a5 43 __ LDA T1 + 0 
11a9 : 84 43 __ STY T1 + 0 
11ab : 69 28 __ ADC #$28
11ad : a8 __ __ TAY
11ae : 90 03 __ BCC $11b3 ; (screen_column.s25 + 0)
.s24:
11b0 : e6 44 __ INC T1 + 1 
11b2 : 18 __ __ CLC
.s25:
11b3 : a6 1b __ LDX ACCU + 0 
.l17:
11b5 : a9 7e __ LDA #$7e
11b7 : 91 43 __ STA (T1 + 0),y 
11b9 : 98 __ __ TYA
11ba : 69 28 __ ADC #$28
11bc : a8 __ __ TAY
11bd : 90 02 __ BCC $11c1 ; (screen_column.s27 + 0)
.s26:
11bf : e6 44 __ INC T1 + 1 
.s27:
11c1 : e8 __ __ INX
11c2 : e0 19 __ CPX #$19
11c4 : 90 ef __ BCC $11b5 ; (screen_column.l17 + 0)
11c6 : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
11c7 : aa __ __ TAX
11c8 : bd 00 dc LDA $dc00,x 
11cb : a8 __ __ TAY
11cc : 29 10 __ AND #$10
11ce : f0 04 __ BEQ $11d4 ; (joy_poll.s10 + 0)
.s11:
11d0 : a9 00 __ LDA #$00
11d2 : f0 02 __ BEQ $11d6 ; (joy_poll.s12 + 0)
.s10:
11d4 : a9 01 __ LDA #$01
.s12:
11d6 : 9d e5 35 STA $35e5,x ; (joyb[0] + 0)
11d9 : 98 __ __ TYA
11da : 4a __ __ LSR
11db : b0 04 __ BCS $11e1 ; (joy_poll.s9 + 0)
.s5:
11dd : a9 ff __ LDA #$ff
11df : 90 0b __ BCC $11ec ; (joy_poll.s6 + 0)
.s9:
11e1 : 98 __ __ TYA
11e2 : 29 02 __ AND #$02
11e4 : f0 04 __ BEQ $11ea ; (joy_poll.s13 + 0)
.s14:
11e6 : a9 00 __ LDA #$00
11e8 : b0 02 __ BCS $11ec ; (joy_poll.s6 + 0)
.s13:
11ea : a9 01 __ LDA #$01
.s6:
11ec : 9d e1 35 STA $35e1,x ; (joyy[0] + 0)
11ef : 98 __ __ TYA
11f0 : 29 04 __ AND #$04
11f2 : d0 06 __ BNE $11fa ; (joy_poll.s8 + 0)
.s7:
11f4 : a9 ff __ LDA #$ff
.s3:
11f6 : 9d e3 35 STA $35e3,x ; (joyx[0] + 0)
11f9 : 60 __ __ RTS
.s8:
11fa : 98 __ __ TYA
11fb : 29 08 __ AND #$08
11fd : f0 04 __ BEQ $1203 ; (joy_poll.s15 + 0)
.s16:
11ff : a9 00 __ LDA #$00
1201 : f0 f3 __ BEQ $11f6 ; (joy_poll.s3 + 0)
.s15:
1203 : a9 01 __ LDA #$01
1205 : d0 ef __ BNE $11f6 ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
screen_left: ; screen_left()->void
; 186, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
1207 : ad de 35 LDA $35de ; (FlipIndex + 0)
120a : d0 03 __ BNE $120f ; (screen_left.s6 + 0)
.s5:
120c : 4c d5 18 JMP $18d5 ; (screen_left_1.s4 + 0)
.s6:
120f : 4c 12 12 JMP $1212 ; (screen_left_0.s4 + 0)
--------------------------------------------------------------------
screen_left_0: ; screen_left_0()->void
; 116, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
1212 : a9 00 __ LDA #$00
1214 : 85 43 __ STA T7 + 0 
1216 : a9 3a __ LDA #$3a
1218 : 85 0d __ STA P0 
.l5:
121a : a9 00 __ LDA #$00
121c : 85 0e __ STA P1 
121e : 20 bc 18 JSR $18bc ; (vic_waitLine.s4 + 0)
1221 : a2 00 __ LDX #$00
.l6:
1223 : bd 04 c8 LDA $c804,x 
1226 : 9d 00 c8 STA $c800,x 
1229 : bd 04 d8 LDA $d804,x 
122c : 9d 00 d8 STA $d800,x 
122f : e8 __ __ INX
1230 : e0 24 __ CPX #$24
1232 : d0 ef __ BNE $1223 ; (screen_left_0.l6 + 0)
.s7:
1234 : a6 43 __ LDX T7 + 0 
1236 : bd 00 cc LDA $cc00,x 
1239 : 8d 24 c8 STA $c824 
123c : bd 01 cc LDA $cc01,x 
123f : 8d 25 c8 STA $c825 
1242 : bd 02 cc LDA $cc02,x 
1245 : 8d 26 c8 STA $c826 
1248 : bd 03 cc LDA $cc03,x 
124b : 8d 27 c8 STA $c827 
124e : bd 00 c4 LDA $c400,x 
1251 : 8d 24 d8 STA $d824 
1254 : bd 01 c4 LDA $c401,x 
1257 : 8d 25 d8 STA $d825 
125a : bd 02 c4 LDA $c402,x 
125d : 8d 26 d8 STA $d826 
1260 : bd 03 c4 LDA $c403,x 
1263 : 8d 27 d8 STA $d827 
1266 : a0 00 __ LDY #$00
.l8:
1268 : b9 2c c8 LDA $c82c,y 
126b : 99 28 c8 STA $c828,y 
126e : b9 2c d8 LDA $d82c,y 
1271 : 99 28 d8 STA $d828,y 
1274 : c8 __ __ INY
1275 : c0 24 __ CPY #$24
1277 : d0 ef __ BNE $1268 ; (screen_left_0.l8 + 0)
.s9:
1279 : bd 28 cc LDA $cc28,x 
127c : 8d 4c c8 STA $c84c 
127f : bd 29 cc LDA $cc29,x 
1282 : 8d 4d c8 STA $c84d 
1285 : bd 2a cc LDA $cc2a,x 
1288 : 8d 4e c8 STA $c84e 
128b : bd 2b cc LDA $cc2b,x 
128e : 8d 4f c8 STA $c84f 
1291 : bd 28 c4 LDA $c428,x 
1294 : 8d 4c d8 STA $d84c 
1297 : bd 29 c4 LDA $c429,x 
129a : 8d 4d d8 STA $d84d 
129d : bd 2a c4 LDA $c42a,x 
12a0 : 8d 4e d8 STA $d84e 
12a3 : bd 2b c4 LDA $c42b,x 
12a6 : 8d 4f d8 STA $d84f 
12a9 : a0 00 __ LDY #$00
.l10:
12ab : b9 54 c8 LDA $c854,y 
12ae : 99 50 c8 STA $c850,y 
12b1 : b9 54 d8 LDA $d854,y 
12b4 : 99 50 d8 STA $d850,y 
12b7 : c8 __ __ INY
12b8 : c0 24 __ CPY #$24
12ba : d0 ef __ BNE $12ab ; (screen_left_0.l10 + 0)
.s11:
12bc : bd 50 cc LDA $cc50,x 
12bf : 8d 74 c8 STA $c874 
12c2 : bd 51 cc LDA $cc51,x 
12c5 : 8d 75 c8 STA $c875 
12c8 : bd 52 cc LDA $cc52,x 
12cb : 8d 76 c8 STA $c876 
12ce : bd 53 cc LDA $cc53,x 
12d1 : 8d 77 c8 STA $c877 
12d4 : bd 50 c4 LDA $c450,x 
12d7 : 8d 74 d8 STA $d874 
12da : bd 51 c4 LDA $c451,x 
12dd : 8d 75 d8 STA $d875 
12e0 : bd 52 c4 LDA $c452,x 
12e3 : 8d 76 d8 STA $d876 
12e6 : bd 53 c4 LDA $c453,x 
12e9 : 8d 77 d8 STA $d877 
12ec : a0 00 __ LDY #$00
.l12:
12ee : b9 7c c8 LDA $c87c,y 
12f1 : 99 78 c8 STA $c878,y 
12f4 : b9 7c d8 LDA $d87c,y 
12f7 : 99 78 d8 STA $d878,y 
12fa : c8 __ __ INY
12fb : c0 24 __ CPY #$24
12fd : d0 ef __ BNE $12ee ; (screen_left_0.l12 + 0)
.s13:
12ff : bd 78 cc LDA $cc78,x 
1302 : 8d 9c c8 STA $c89c 
1305 : bd 79 cc LDA $cc79,x 
1308 : 8d 9d c8 STA $c89d 
130b : bd 7a cc LDA $cc7a,x 
130e : 8d 9e c8 STA $c89e 
1311 : bd 7b cc LDA $cc7b,x 
1314 : 8d 9f c8 STA $c89f 
1317 : bd 78 c4 LDA $c478,x 
131a : 8d 9c d8 STA $d89c 
131d : bd 79 c4 LDA $c479,x 
1320 : 8d 9d d8 STA $d89d 
1323 : bd 7a c4 LDA $c47a,x 
1326 : 8d 9e d8 STA $d89e 
1329 : bd 7b c4 LDA $c47b,x 
132c : 8d 9f d8 STA $d89f 
132f : a0 00 __ LDY #$00
.l14:
1331 : b9 a4 c8 LDA $c8a4,y 
1334 : 99 a0 c8 STA $c8a0,y 
1337 : b9 a4 d8 LDA $d8a4,y 
133a : 99 a0 d8 STA $d8a0,y 
133d : c8 __ __ INY
133e : c0 24 __ CPY #$24
1340 : d0 ef __ BNE $1331 ; (screen_left_0.l14 + 0)
.s15:
1342 : bd a0 cc LDA $cca0,x 
1345 : 8d c4 c8 STA $c8c4 
1348 : bd a1 cc LDA $cca1,x 
134b : 8d c5 c8 STA $c8c5 
134e : bd a2 cc LDA $cca2,x 
1351 : 8d c6 c8 STA $c8c6 
1354 : bd a3 cc LDA $cca3,x 
1357 : 8d c7 c8 STA $c8c7 
135a : bd a0 c4 LDA $c4a0,x 
135d : 8d c4 d8 STA $d8c4 
1360 : bd a1 c4 LDA $c4a1,x 
1363 : 8d c5 d8 STA $d8c5 
1366 : bd a2 c4 LDA $c4a2,x 
1369 : 8d c6 d8 STA $d8c6 
136c : bd a3 c4 LDA $c4a3,x 
136f : 8d c7 d8 STA $d8c7 
1372 : a0 00 __ LDY #$00
.l16:
1374 : b9 cc c8 LDA $c8cc,y 
1377 : 99 c8 c8 STA $c8c8,y 
137a : b9 cc d8 LDA $d8cc,y 
137d : 99 c8 d8 STA $d8c8,y 
1380 : c8 __ __ INY
1381 : c0 24 __ CPY #$24
1383 : d0 ef __ BNE $1374 ; (screen_left_0.l16 + 0)
.s17:
1385 : bd c8 cc LDA $ccc8,x 
1388 : 8d ec c8 STA $c8ec 
138b : bd c9 cc LDA $ccc9,x 
138e : 8d ed c8 STA $c8ed 
1391 : bd ca cc LDA $ccca,x 
1394 : 8d ee c8 STA $c8ee 
1397 : bd cb cc LDA $cccb,x 
139a : 8d ef c8 STA $c8ef 
139d : bd c8 c4 LDA $c4c8,x 
13a0 : 8d ec d8 STA $d8ec 
13a3 : bd c9 c4 LDA $c4c9,x 
13a6 : 8d ed d8 STA $d8ed 
13a9 : bd ca c4 LDA $c4ca,x 
13ac : 8d ee d8 STA $d8ee 
13af : bd cb c4 LDA $c4cb,x 
13b2 : 8d ef d8 STA $d8ef 
13b5 : a0 00 __ LDY #$00
.l18:
13b7 : b9 f4 c8 LDA $c8f4,y 
13ba : 99 f0 c8 STA $c8f0,y 
13bd : b9 f4 d8 LDA $d8f4,y 
13c0 : 99 f0 d8 STA $d8f0,y 
13c3 : c8 __ __ INY
13c4 : c0 24 __ CPY #$24
13c6 : d0 ef __ BNE $13b7 ; (screen_left_0.l18 + 0)
.s19:
13c8 : bd f0 cc LDA $ccf0,x 
13cb : 8d 14 c9 STA $c914 
13ce : bd f1 cc LDA $ccf1,x 
13d1 : 8d 15 c9 STA $c915 
13d4 : bd f2 cc LDA $ccf2,x 
13d7 : 8d 16 c9 STA $c916 
13da : bd f3 cc LDA $ccf3,x 
13dd : 8d 17 c9 STA $c917 
13e0 : bd f0 c4 LDA $c4f0,x 
13e3 : 8d 14 d9 STA $d914 
13e6 : bd f1 c4 LDA $c4f1,x 
13e9 : 8d 15 d9 STA $d915 
13ec : bd f2 c4 LDA $c4f2,x 
13ef : 8d 16 d9 STA $d916 
13f2 : bd f3 c4 LDA $c4f3,x 
13f5 : 8d 17 d9 STA $d917 
13f8 : a0 00 __ LDY #$00
.l20:
13fa : b9 1c c9 LDA $c91c,y 
13fd : 99 18 c9 STA $c918,y 
1400 : b9 1c d9 LDA $d91c,y 
1403 : 99 18 d9 STA $d918,y 
1406 : c8 __ __ INY
1407 : c0 24 __ CPY #$24
1409 : d0 ef __ BNE $13fa ; (screen_left_0.l20 + 0)
.s21:
140b : bd 18 cd LDA $cd18,x 
140e : 8d 3c c9 STA $c93c 
1411 : bd 19 cd LDA $cd19,x 
1414 : 8d 3d c9 STA $c93d 
1417 : bd 1a cd LDA $cd1a,x 
141a : 8d 3e c9 STA $c93e 
141d : bd 1b cd LDA $cd1b,x 
1420 : 8d 3f c9 STA $c93f 
1423 : bd 18 c5 LDA $c518,x 
1426 : 8d 3c d9 STA $d93c 
1429 : bd 19 c5 LDA $c519,x 
142c : 8d 3d d9 STA $d93d 
142f : bd 1a c5 LDA $c51a,x 
1432 : 8d 3e d9 STA $d93e 
1435 : bd 1b c5 LDA $c51b,x 
1438 : 8d 3f d9 STA $d93f 
143b : a0 00 __ LDY #$00
.l22:
143d : b9 44 c9 LDA $c944,y 
1440 : 99 40 c9 STA $c940,y 
1443 : b9 44 d9 LDA $d944,y 
1446 : 99 40 d9 STA $d940,y 
1449 : c8 __ __ INY
144a : c0 24 __ CPY #$24
144c : d0 ef __ BNE $143d ; (screen_left_0.l22 + 0)
.s23:
144e : bd 40 cd LDA $cd40,x 
1451 : 8d 64 c9 STA $c964 
1454 : bd 41 cd LDA $cd41,x 
1457 : 8d 65 c9 STA $c965 
145a : bd 42 cd LDA $cd42,x 
145d : 8d 66 c9 STA $c966 
1460 : bd 43 cd LDA $cd43,x 
1463 : 8d 67 c9 STA $c967 
1466 : bd 40 c5 LDA $c540,x 
1469 : 8d 64 d9 STA $d964 
146c : bd 41 c5 LDA $c541,x 
146f : 8d 65 d9 STA $d965 
1472 : bd 42 c5 LDA $c542,x 
1475 : 8d 66 d9 STA $d966 
1478 : bd 43 c5 LDA $c543,x 
147b : 8d 67 d9 STA $d967 
147e : a0 00 __ LDY #$00
.l24:
1480 : b9 6c c9 LDA $c96c,y 
1483 : 99 68 c9 STA $c968,y 
1486 : b9 6c d9 LDA $d96c,y 
1489 : 99 68 d9 STA $d968,y 
148c : c8 __ __ INY
148d : c0 24 __ CPY #$24
148f : d0 ef __ BNE $1480 ; (screen_left_0.l24 + 0)
.s25:
1491 : bd 68 cd LDA $cd68,x 
1494 : 8d 8c c9 STA $c98c 
1497 : bd 69 cd LDA $cd69,x 
149a : 8d 8d c9 STA $c98d 
149d : bd 6a cd LDA $cd6a,x 
14a0 : 8d 8e c9 STA $c98e 
14a3 : bd 6b cd LDA $cd6b,x 
14a6 : 8d 8f c9 STA $c98f 
14a9 : bd 68 c5 LDA $c568,x 
14ac : 8d 8c d9 STA $d98c 
14af : bd 69 c5 LDA $c569,x 
14b2 : 8d 8d d9 STA $d98d 
14b5 : bd 6a c5 LDA $c56a,x 
14b8 : 8d 8e d9 STA $d98e 
14bb : bd 6b c5 LDA $c56b,x 
14be : 8d 8f d9 STA $d98f 
14c1 : a0 00 __ LDY #$00
.l26:
14c3 : b9 94 c9 LDA $c994,y 
14c6 : 99 90 c9 STA $c990,y 
14c9 : b9 94 d9 LDA $d994,y 
14cc : 99 90 d9 STA $d990,y 
14cf : c8 __ __ INY
14d0 : c0 24 __ CPY #$24
14d2 : d0 ef __ BNE $14c3 ; (screen_left_0.l26 + 0)
.s27:
14d4 : bd 90 cd LDA $cd90,x 
14d7 : 8d b4 c9 STA $c9b4 
14da : bd 91 cd LDA $cd91,x 
14dd : 8d b5 c9 STA $c9b5 
14e0 : bd 92 cd LDA $cd92,x 
14e3 : 8d b6 c9 STA $c9b6 
14e6 : bd 93 cd LDA $cd93,x 
14e9 : 8d b7 c9 STA $c9b7 
14ec : bd 90 c5 LDA $c590,x 
14ef : 8d b4 d9 STA $d9b4 
14f2 : bd 91 c5 LDA $c591,x 
14f5 : 8d b5 d9 STA $d9b5 
14f8 : bd 92 c5 LDA $c592,x 
14fb : 8d b6 d9 STA $d9b6 
14fe : bd 93 c5 LDA $c593,x 
1501 : 8d b7 d9 STA $d9b7 
1504 : a0 00 __ LDY #$00
.l28:
1506 : b9 bc c9 LDA $c9bc,y 
1509 : 99 b8 c9 STA $c9b8,y 
150c : b9 bc d9 LDA $d9bc,y 
150f : 99 b8 d9 STA $d9b8,y 
1512 : c8 __ __ INY
1513 : c0 24 __ CPY #$24
1515 : d0 ef __ BNE $1506 ; (screen_left_0.l28 + 0)
.s29:
1517 : bd b8 cd LDA $cdb8,x 
151a : 8d dc c9 STA $c9dc 
151d : bd b9 cd LDA $cdb9,x 
1520 : 8d dd c9 STA $c9dd 
1523 : bd ba cd LDA $cdba,x 
1526 : 8d de c9 STA $c9de 
1529 : bd bb cd LDA $cdbb,x 
152c : 8d df c9 STA $c9df 
152f : bd b8 c5 LDA $c5b8,x 
1532 : 8d dc d9 STA $d9dc 
1535 : bd b9 c5 LDA $c5b9,x 
1538 : 8d dd d9 STA $d9dd 
153b : bd ba c5 LDA $c5ba,x 
153e : 8d de d9 STA $d9de 
1541 : bd bb c5 LDA $c5bb,x 
1544 : 8d df d9 STA $d9df 
1547 : a0 00 __ LDY #$00
.l30:
1549 : b9 e4 c9 LDA $c9e4,y 
154c : 99 e0 c9 STA $c9e0,y 
154f : b9 e4 d9 LDA $d9e4,y 
1552 : 99 e0 d9 STA $d9e0,y 
1555 : c8 __ __ INY
1556 : c0 24 __ CPY #$24
1558 : d0 ef __ BNE $1549 ; (screen_left_0.l30 + 0)
.s31:
155a : bd e0 cd LDA $cde0,x 
155d : 8d 04 ca STA $ca04 
1560 : bd e1 cd LDA $cde1,x 
1563 : 8d 05 ca STA $ca05 
1566 : bd e2 cd LDA $cde2,x 
1569 : 8d 06 ca STA $ca06 
156c : bd e3 cd LDA $cde3,x 
156f : 8d 07 ca STA $ca07 
1572 : bd e0 c5 LDA $c5e0,x 
1575 : 8d 04 da STA $da04 
1578 : bd e1 c5 LDA $c5e1,x 
157b : 8d 05 da STA $da05 
157e : bd e2 c5 LDA $c5e2,x 
1581 : 8d 06 da STA $da06 
1584 : bd e3 c5 LDA $c5e3,x 
1587 : 8d 07 da STA $da07 
158a : a0 00 __ LDY #$00
.l32:
158c : b9 0c ca LDA $ca0c,y 
158f : 99 08 ca STA $ca08,y 
1592 : b9 0c da LDA $da0c,y 
1595 : 99 08 da STA $da08,y 
1598 : c8 __ __ INY
1599 : c0 24 __ CPY #$24
159b : d0 ef __ BNE $158c ; (screen_left_0.l32 + 0)
.s33:
159d : bd 08 ce LDA $ce08,x 
15a0 : 8d 2c ca STA $ca2c 
15a3 : bd 09 ce LDA $ce09,x 
15a6 : 8d 2d ca STA $ca2d 
15a9 : bd 0a ce LDA $ce0a,x 
15ac : 8d 2e ca STA $ca2e 
15af : bd 0b ce LDA $ce0b,x 
15b2 : 8d 2f ca STA $ca2f 
15b5 : bd 08 c6 LDA $c608,x 
15b8 : 8d 2c da STA $da2c 
15bb : bd 09 c6 LDA $c609,x 
15be : 8d 2d da STA $da2d 
15c1 : bd 0a c6 LDA $c60a,x 
15c4 : 8d 2e da STA $da2e 
15c7 : bd 0b c6 LDA $c60b,x 
15ca : 8d 2f da STA $da2f 
15cd : a0 00 __ LDY #$00
.l34:
15cf : b9 34 ca LDA $ca34,y 
15d2 : 99 30 ca STA $ca30,y 
15d5 : b9 34 da LDA $da34,y 
15d8 : 99 30 da STA $da30,y 
15db : c8 __ __ INY
15dc : c0 24 __ CPY #$24
15de : d0 ef __ BNE $15cf ; (screen_left_0.l34 + 0)
.s35:
15e0 : bd 30 ce LDA $ce30,x 
15e3 : 8d 54 ca STA $ca54 
15e6 : bd 31 ce LDA $ce31,x 
15e9 : 8d 55 ca STA $ca55 
15ec : bd 32 ce LDA $ce32,x 
15ef : 8d 56 ca STA $ca56 
15f2 : bd 33 ce LDA $ce33,x 
15f5 : 8d 57 ca STA $ca57 
15f8 : bd 30 c6 LDA $c630,x 
15fb : 8d 54 da STA $da54 
15fe : bd 31 c6 LDA $c631,x 
1601 : 8d 55 da STA $da55 
1604 : bd 32 c6 LDA $c632,x 
1607 : 8d 56 da STA $da56 
160a : bd 33 c6 LDA $c633,x 
160d : 8d 57 da STA $da57 
1610 : a0 00 __ LDY #$00
.l36:
1612 : b9 5c ca LDA $ca5c,y 
1615 : 99 58 ca STA $ca58,y 
1618 : b9 5c da LDA $da5c,y 
161b : 99 58 da STA $da58,y 
161e : c8 __ __ INY
161f : c0 24 __ CPY #$24
1621 : d0 ef __ BNE $1612 ; (screen_left_0.l36 + 0)
.s37:
1623 : bd 58 ce LDA $ce58,x 
1626 : 8d 7c ca STA $ca7c 
1629 : bd 59 ce LDA $ce59,x 
162c : 8d 7d ca STA $ca7d 
162f : bd 5a ce LDA $ce5a,x 
1632 : 8d 7e ca STA $ca7e 
1635 : bd 5b ce LDA $ce5b,x 
1638 : 8d 7f ca STA $ca7f 
163b : bd 58 c6 LDA $c658,x 
163e : 8d 7c da STA $da7c 
1641 : bd 59 c6 LDA $c659,x 
1644 : 8d 7d da STA $da7d 
1647 : bd 5a c6 LDA $c65a,x 
164a : 8d 7e da STA $da7e 
164d : bd 5b c6 LDA $c65b,x 
1650 : 8d 7f da STA $da7f 
1653 : a0 00 __ LDY #$00
.l38:
1655 : b9 84 ca LDA $ca84,y 
1658 : 99 80 ca STA $ca80,y 
165b : b9 84 da LDA $da84,y 
165e : 99 80 da STA $da80,y 
1661 : c8 __ __ INY
1662 : c0 24 __ CPY #$24
1664 : d0 ef __ BNE $1655 ; (screen_left_0.l38 + 0)
.s39:
1666 : bd 80 ce LDA $ce80,x 
1669 : 8d a4 ca STA $caa4 
166c : bd 81 ce LDA $ce81,x 
166f : 8d a5 ca STA $caa5 
1672 : bd 82 ce LDA $ce82,x 
1675 : 8d a6 ca STA $caa6 
1678 : bd 83 ce LDA $ce83,x 
167b : 8d a7 ca STA $caa7 
167e : bd 80 c6 LDA $c680,x 
1681 : 8d a4 da STA $daa4 
1684 : bd 81 c6 LDA $c681,x 
1687 : 8d a5 da STA $daa5 
168a : bd 82 c6 LDA $c682,x 
168d : 8d a6 da STA $daa6 
1690 : bd 83 c6 LDA $c683,x 
1693 : 8d a7 da STA $daa7 
1696 : a0 00 __ LDY #$00
.l40:
1698 : b9 ac ca LDA $caac,y 
169b : 99 a8 ca STA $caa8,y 
169e : b9 ac da LDA $daac,y 
16a1 : 99 a8 da STA $daa8,y 
16a4 : c8 __ __ INY
16a5 : c0 24 __ CPY #$24
16a7 : d0 ef __ BNE $1698 ; (screen_left_0.l40 + 0)
.s41:
16a9 : bd a8 ce LDA $cea8,x 
16ac : 8d cc ca STA $cacc 
16af : bd a9 ce LDA $cea9,x 
16b2 : 8d cd ca STA $cacd 
16b5 : bd aa ce LDA $ceaa,x 
16b8 : 8d ce ca STA $cace 
16bb : bd ab ce LDA $ceab,x 
16be : 8d cf ca STA $cacf 
16c1 : bd a8 c6 LDA $c6a8,x 
16c4 : 8d cc da STA $dacc 
16c7 : bd a9 c6 LDA $c6a9,x 
16ca : 8d cd da STA $dacd 
16cd : bd aa c6 LDA $c6aa,x 
16d0 : 8d ce da STA $dace 
16d3 : bd ab c6 LDA $c6ab,x 
16d6 : 8d cf da STA $dacf 
16d9 : a0 00 __ LDY #$00
.l42:
16db : b9 d4 ca LDA $cad4,y 
16de : 99 d0 ca STA $cad0,y 
16e1 : b9 d4 da LDA $dad4,y 
16e4 : 99 d0 da STA $dad0,y 
16e7 : c8 __ __ INY
16e8 : c0 24 __ CPY #$24
16ea : d0 ef __ BNE $16db ; (screen_left_0.l42 + 0)
.s43:
16ec : bd d0 ce LDA $ced0,x 
16ef : 8d f4 ca STA $caf4 
16f2 : bd d1 ce LDA $ced1,x 
16f5 : 8d f5 ca STA $caf5 
16f8 : bd d2 ce LDA $ced2,x 
16fb : 8d f6 ca STA $caf6 
16fe : bd d3 ce LDA $ced3,x 
1701 : 8d f7 ca STA $caf7 
1704 : bd d0 c6 LDA $c6d0,x 
1707 : 8d f4 da STA $daf4 
170a : bd d1 c6 LDA $c6d1,x 
170d : 8d f5 da STA $daf5 
1710 : bd d2 c6 LDA $c6d2,x 
1713 : 8d f6 da STA $daf6 
1716 : bd d3 c6 LDA $c6d3,x 
1719 : 8d f7 da STA $daf7 
171c : a0 00 __ LDY #$00
.l44:
171e : b9 fc ca LDA $cafc,y 
1721 : 99 f8 ca STA $caf8,y 
1724 : b9 fc da LDA $dafc,y 
1727 : 99 f8 da STA $daf8,y 
172a : c8 __ __ INY
172b : c0 24 __ CPY #$24
172d : d0 ef __ BNE $171e ; (screen_left_0.l44 + 0)
.s45:
172f : bd f8 ce LDA $cef8,x 
1732 : 8d 1c cb STA $cb1c 
1735 : bd f9 ce LDA $cef9,x 
1738 : 8d 1d cb STA $cb1d 
173b : bd fa ce LDA $cefa,x 
173e : 8d 1e cb STA $cb1e 
1741 : bd fb ce LDA $cefb,x 
1744 : 8d 1f cb STA $cb1f 
1747 : bd f8 c6 LDA $c6f8,x 
174a : 8d 1c db STA $db1c 
174d : bd f9 c6 LDA $c6f9,x 
1750 : 8d 1d db STA $db1d 
1753 : bd fa c6 LDA $c6fa,x 
1756 : 8d 1e db STA $db1e 
1759 : bd fb c6 LDA $c6fb,x 
175c : 8d 1f db STA $db1f 
175f : a0 00 __ LDY #$00
.l46:
1761 : b9 24 cb LDA $cb24,y 
1764 : 99 20 cb STA $cb20,y 
1767 : b9 24 db LDA $db24,y 
176a : 99 20 db STA $db20,y 
176d : c8 __ __ INY
176e : c0 24 __ CPY #$24
1770 : d0 ef __ BNE $1761 ; (screen_left_0.l46 + 0)
.s47:
1772 : bd 20 cf LDA $cf20,x 
1775 : 8d 44 cb STA $cb44 
1778 : bd 21 cf LDA $cf21,x 
177b : 8d 45 cb STA $cb45 
177e : bd 22 cf LDA $cf22,x 
1781 : 8d 46 cb STA $cb46 
1784 : bd 23 cf LDA $cf23,x 
1787 : 8d 47 cb STA $cb47 
178a : bd 20 c7 LDA $c720,x 
178d : 8d 44 db STA $db44 
1790 : bd 21 c7 LDA $c721,x 
1793 : 8d 45 db STA $db45 
1796 : bd 22 c7 LDA $c722,x 
1799 : 8d 46 db STA $db46 
179c : bd 23 c7 LDA $c723,x 
179f : 8d 47 db STA $db47 
17a2 : a0 00 __ LDY #$00
.l48:
17a4 : b9 4c cb LDA $cb4c,y 
17a7 : 99 48 cb STA $cb48,y 
17aa : b9 4c db LDA $db4c,y 
17ad : 99 48 db STA $db48,y 
17b0 : c8 __ __ INY
17b1 : c0 24 __ CPY #$24
17b3 : d0 ef __ BNE $17a4 ; (screen_left_0.l48 + 0)
.s49:
17b5 : bd 48 cf LDA $cf48,x 
17b8 : 8d 6c cb STA $cb6c 
17bb : bd 49 cf LDA $cf49,x 
17be : 8d 6d cb STA $cb6d 
17c1 : bd 4a cf LDA $cf4a,x 
17c4 : 8d 6e cb STA $cb6e 
17c7 : bd 4b cf LDA $cf4b,x 
17ca : 8d 6f cb STA $cb6f 
17cd : bd 48 c7 LDA $c748,x 
17d0 : 8d 6c db STA $db6c 
17d3 : bd 49 c7 LDA $c749,x 
17d6 : 8d 6d db STA $db6d 
17d9 : bd 4a c7 LDA $c74a,x 
17dc : 8d 6e db STA $db6e 
17df : bd 4b c7 LDA $c74b,x 
17e2 : 8d 6f db STA $db6f 
17e5 : a0 00 __ LDY #$00
.l50:
17e7 : b9 74 cb LDA $cb74,y 
17ea : 99 70 cb STA $cb70,y 
17ed : b9 74 db LDA $db74,y 
17f0 : 99 70 db STA $db70,y 
17f3 : c8 __ __ INY
17f4 : c0 24 __ CPY #$24
17f6 : d0 ef __ BNE $17e7 ; (screen_left_0.l50 + 0)
.s51:
17f8 : bd 70 cf LDA $cf70,x 
17fb : 8d 94 cb STA $cb94 
17fe : bd 71 cf LDA $cf71,x 
1801 : 8d 95 cb STA $cb95 
1804 : bd 72 cf LDA $cf72,x 
1807 : 8d 96 cb STA $cb96 
180a : bd 73 cf LDA $cf73,x 
180d : 8d 97 cb STA $cb97 
1810 : bd 70 c7 LDA $c770,x 
1813 : 8d 94 db STA $db94 
1816 : bd 71 c7 LDA $c771,x 
1819 : 8d 95 db STA $db95 
181c : bd 72 c7 LDA $c772,x 
181f : 8d 96 db STA $db96 
1822 : bd 73 c7 LDA $c773,x 
1825 : 8d 97 db STA $db97 
1828 : a0 00 __ LDY #$00
.l52:
182a : b9 9c cb LDA $cb9c,y 
182d : 99 98 cb STA $cb98,y 
1830 : b9 9c db LDA $db9c,y 
1833 : 99 98 db STA $db98,y 
1836 : c8 __ __ INY
1837 : c0 24 __ CPY #$24
1839 : d0 ef __ BNE $182a ; (screen_left_0.l52 + 0)
.s53:
183b : bd 98 cf LDA $cf98,x 
183e : 8d bc cb STA $cbbc 
1841 : bd 99 cf LDA $cf99,x 
1844 : 8d bd cb STA $cbbd 
1847 : bd 9a cf LDA $cf9a,x 
184a : 8d be cb STA $cbbe 
184d : bd 9b cf LDA $cf9b,x 
1850 : 8d bf cb STA $cbbf 
1853 : bd 98 c7 LDA $c798,x 
1856 : 8d bc db STA $dbbc 
1859 : bd 99 c7 LDA $c799,x 
185c : 8d bd db STA $dbbd 
185f : bd 9a c7 LDA $c79a,x 
1862 : 8d be db STA $dbbe 
1865 : bd 9b c7 LDA $c79b,x 
1868 : 8d bf db STA $dbbf 
186b : a0 00 __ LDY #$00
.l54:
186d : b9 c4 cb LDA $cbc4,y 
1870 : 99 c0 cb STA $cbc0,y 
1873 : b9 c4 db LDA $dbc4,y 
1876 : 99 c0 db STA $dbc0,y 
1879 : c8 __ __ INY
187a : c0 24 __ CPY #$24
187c : d0 ef __ BNE $186d ; (screen_left_0.l54 + 0)
.s55:
187e : bd c0 cf LDA $cfc0,x 
1881 : 8d e4 cb STA $cbe4 
1884 : bd c1 cf LDA $cfc1,x 
1887 : 8d e5 cb STA $cbe5 
188a : bd c2 cf LDA $cfc2,x 
188d : 8d e6 cb STA $cbe6 
1890 : bd c3 cf LDA $cfc3,x 
1893 : 8d e7 cb STA $cbe7 
1896 : bd c0 c7 LDA $c7c0,x 
1899 : 8d e4 db STA $dbe4 
189c : bd c1 c7 LDA $c7c1,x 
189f : 8d e5 db STA $dbe5 
18a2 : bd c2 c7 LDA $c7c2,x 
18a5 : 8d e6 db STA $dbe6 
18a8 : bd c3 c7 LDA $c7c3,x 
18ab : 8d e7 db STA $dbe7 
18ae : 8a __ __ TXA
18af : 18 __ __ CLC
18b0 : 69 04 __ ADC #$04
18b2 : 85 43 __ STA T7 + 0 
18b4 : c9 25 __ CMP #$25
18b6 : b0 03 __ BCS $18bb ; (screen_left_0.s3 + 0)
18b8 : 4c 1a 12 JMP $121a ; (screen_left_0.l5 + 0)
.s3:
18bb : 60 __ __ RTS
--------------------------------------------------------------------
vic_waitLine: ; vic_waitLine(i16)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
18bc : 46 0e __ LSR P1 ; (line + 1)
18be : a9 00 __ LDA #$00
18c0 : 6a __ __ ROR
18c1 : 85 1b __ STA ACCU + 0 
18c3 : a4 0d __ LDY P0 ; (line + 0)
.l5:
18c5 : 98 __ __ TYA
.l7:
18c6 : cd 12 d0 CMP $d012 
18c9 : d0 fb __ BNE $18c6 ; (vic_waitLine.l7 + 0)
.s6:
18cb : ad 11 d0 LDA $d011 
18ce : 29 80 __ AND #$80
18d0 : c5 1b __ CMP ACCU + 0 
18d2 : d0 f1 __ BNE $18c5 ; (vic_waitLine.l5 + 0)
.s3:
18d4 : 60 __ __ RTS
--------------------------------------------------------------------
screen_left_1: ; screen_left_1()->void
; 116, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
18d5 : a9 00 __ LDA #$00
18d7 : 85 43 __ STA T7 + 0 
18d9 : a9 3a __ LDA #$3a
18db : 85 0d __ STA P0 
.l5:
18dd : a9 00 __ LDA #$00
18df : 85 0e __ STA P1 
18e1 : 20 bc 18 JSR $18bc ; (vic_waitLine.s4 + 0)
18e4 : a2 00 __ LDX #$00
.l6:
18e6 : bd 04 cc LDA $cc04,x 
18e9 : 9d 00 cc STA $cc00,x 
18ec : bd 04 d8 LDA $d804,x 
18ef : 9d 00 d8 STA $d800,x 
18f2 : e8 __ __ INX
18f3 : e0 24 __ CPX #$24
18f5 : d0 ef __ BNE $18e6 ; (screen_left_1.l6 + 0)
.s7:
18f7 : a6 43 __ LDX T7 + 0 
18f9 : bd 00 c8 LDA $c800,x 
18fc : 8d 24 cc STA $cc24 
18ff : bd 01 c8 LDA $c801,x 
1902 : 8d 25 cc STA $cc25 
1905 : bd 02 c8 LDA $c802,x 
1908 : 8d 26 cc STA $cc26 
190b : bd 03 c8 LDA $c803,x 
190e : 8d 27 cc STA $cc27 
1911 : bd 00 c4 LDA $c400,x 
1914 : 8d 24 d8 STA $d824 
1917 : bd 01 c4 LDA $c401,x 
191a : 8d 25 d8 STA $d825 
191d : bd 02 c4 LDA $c402,x 
1920 : 8d 26 d8 STA $d826 
1923 : bd 03 c4 LDA $c403,x 
1926 : 8d 27 d8 STA $d827 
1929 : a0 00 __ LDY #$00
.l8:
192b : b9 2c cc LDA $cc2c,y 
192e : 99 28 cc STA $cc28,y 
1931 : b9 2c d8 LDA $d82c,y 
1934 : 99 28 d8 STA $d828,y 
1937 : c8 __ __ INY
1938 : c0 24 __ CPY #$24
193a : d0 ef __ BNE $192b ; (screen_left_1.l8 + 0)
.s9:
193c : bd 28 c8 LDA $c828,x 
193f : 8d 4c cc STA $cc4c 
1942 : bd 29 c8 LDA $c829,x 
1945 : 8d 4d cc STA $cc4d 
1948 : bd 2a c8 LDA $c82a,x 
194b : 8d 4e cc STA $cc4e 
194e : bd 2b c8 LDA $c82b,x 
1951 : 8d 4f cc STA $cc4f 
1954 : bd 28 c4 LDA $c428,x 
1957 : 8d 4c d8 STA $d84c 
195a : bd 29 c4 LDA $c429,x 
195d : 8d 4d d8 STA $d84d 
1960 : bd 2a c4 LDA $c42a,x 
1963 : 8d 4e d8 STA $d84e 
1966 : bd 2b c4 LDA $c42b,x 
1969 : 8d 4f d8 STA $d84f 
196c : a0 00 __ LDY #$00
.l10:
196e : b9 54 cc LDA $cc54,y 
1971 : 99 50 cc STA $cc50,y 
1974 : b9 54 d8 LDA $d854,y 
1977 : 99 50 d8 STA $d850,y 
197a : c8 __ __ INY
197b : c0 24 __ CPY #$24
197d : d0 ef __ BNE $196e ; (screen_left_1.l10 + 0)
.s11:
197f : bd 50 c8 LDA $c850,x 
1982 : 8d 74 cc STA $cc74 
1985 : bd 51 c8 LDA $c851,x 
1988 : 8d 75 cc STA $cc75 
198b : bd 52 c8 LDA $c852,x 
198e : 8d 76 cc STA $cc76 
1991 : bd 53 c8 LDA $c853,x 
1994 : 8d 77 cc STA $cc77 
1997 : bd 50 c4 LDA $c450,x 
199a : 8d 74 d8 STA $d874 
199d : bd 51 c4 LDA $c451,x 
19a0 : 8d 75 d8 STA $d875 
19a3 : bd 52 c4 LDA $c452,x 
19a6 : 8d 76 d8 STA $d876 
19a9 : bd 53 c4 LDA $c453,x 
19ac : 8d 77 d8 STA $d877 
19af : a0 00 __ LDY #$00
.l12:
19b1 : b9 7c cc LDA $cc7c,y 
19b4 : 99 78 cc STA $cc78,y 
19b7 : b9 7c d8 LDA $d87c,y 
19ba : 99 78 d8 STA $d878,y 
19bd : c8 __ __ INY
19be : c0 24 __ CPY #$24
19c0 : d0 ef __ BNE $19b1 ; (screen_left_1.l12 + 0)
.s13:
19c2 : bd 78 c8 LDA $c878,x 
19c5 : 8d 9c cc STA $cc9c 
19c8 : bd 79 c8 LDA $c879,x 
19cb : 8d 9d cc STA $cc9d 
19ce : bd 7a c8 LDA $c87a,x 
19d1 : 8d 9e cc STA $cc9e 
19d4 : bd 7b c8 LDA $c87b,x 
19d7 : 8d 9f cc STA $cc9f 
19da : bd 78 c4 LDA $c478,x 
19dd : 8d 9c d8 STA $d89c 
19e0 : bd 79 c4 LDA $c479,x 
19e3 : 8d 9d d8 STA $d89d 
19e6 : bd 7a c4 LDA $c47a,x 
19e9 : 8d 9e d8 STA $d89e 
19ec : bd 7b c4 LDA $c47b,x 
19ef : 8d 9f d8 STA $d89f 
19f2 : a0 00 __ LDY #$00
.l14:
19f4 : b9 a4 cc LDA $cca4,y 
19f7 : 99 a0 cc STA $cca0,y 
19fa : b9 a4 d8 LDA $d8a4,y 
19fd : 99 a0 d8 STA $d8a0,y 
1a00 : c8 __ __ INY
1a01 : c0 24 __ CPY #$24
1a03 : d0 ef __ BNE $19f4 ; (screen_left_1.l14 + 0)
.s15:
1a05 : bd a0 c8 LDA $c8a0,x 
1a08 : 8d c4 cc STA $ccc4 
1a0b : bd a1 c8 LDA $c8a1,x 
1a0e : 8d c5 cc STA $ccc5 
1a11 : bd a2 c8 LDA $c8a2,x 
1a14 : 8d c6 cc STA $ccc6 
1a17 : bd a3 c8 LDA $c8a3,x 
1a1a : 8d c7 cc STA $ccc7 
1a1d : bd a0 c4 LDA $c4a0,x 
1a20 : 8d c4 d8 STA $d8c4 
1a23 : bd a1 c4 LDA $c4a1,x 
1a26 : 8d c5 d8 STA $d8c5 
1a29 : bd a2 c4 LDA $c4a2,x 
1a2c : 8d c6 d8 STA $d8c6 
1a2f : bd a3 c4 LDA $c4a3,x 
1a32 : 8d c7 d8 STA $d8c7 
1a35 : a0 00 __ LDY #$00
.l16:
1a37 : b9 cc cc LDA $cccc,y 
1a3a : 99 c8 cc STA $ccc8,y 
1a3d : b9 cc d8 LDA $d8cc,y 
1a40 : 99 c8 d8 STA $d8c8,y 
1a43 : c8 __ __ INY
1a44 : c0 24 __ CPY #$24
1a46 : d0 ef __ BNE $1a37 ; (screen_left_1.l16 + 0)
.s17:
1a48 : bd c8 c8 LDA $c8c8,x 
1a4b : 8d ec cc STA $ccec 
1a4e : bd c9 c8 LDA $c8c9,x 
1a51 : 8d ed cc STA $cced 
1a54 : bd ca c8 LDA $c8ca,x 
1a57 : 8d ee cc STA $ccee 
1a5a : bd cb c8 LDA $c8cb,x 
1a5d : 8d ef cc STA $ccef 
1a60 : bd c8 c4 LDA $c4c8,x 
1a63 : 8d ec d8 STA $d8ec 
1a66 : bd c9 c4 LDA $c4c9,x 
1a69 : 8d ed d8 STA $d8ed 
1a6c : bd ca c4 LDA $c4ca,x 
1a6f : 8d ee d8 STA $d8ee 
1a72 : bd cb c4 LDA $c4cb,x 
1a75 : 8d ef d8 STA $d8ef 
1a78 : a0 00 __ LDY #$00
.l18:
1a7a : b9 f4 cc LDA $ccf4,y 
1a7d : 99 f0 cc STA $ccf0,y 
1a80 : b9 f4 d8 LDA $d8f4,y 
1a83 : 99 f0 d8 STA $d8f0,y 
1a86 : c8 __ __ INY
1a87 : c0 24 __ CPY #$24
1a89 : d0 ef __ BNE $1a7a ; (screen_left_1.l18 + 0)
.s19:
1a8b : bd f0 c8 LDA $c8f0,x 
1a8e : 8d 14 cd STA $cd14 
1a91 : bd f1 c8 LDA $c8f1,x 
1a94 : 8d 15 cd STA $cd15 
1a97 : bd f2 c8 LDA $c8f2,x 
1a9a : 8d 16 cd STA $cd16 
1a9d : bd f3 c8 LDA $c8f3,x 
1aa0 : 8d 17 cd STA $cd17 
1aa3 : bd f0 c4 LDA $c4f0,x 
1aa6 : 8d 14 d9 STA $d914 
1aa9 : bd f1 c4 LDA $c4f1,x 
1aac : 8d 15 d9 STA $d915 
1aaf : bd f2 c4 LDA $c4f2,x 
1ab2 : 8d 16 d9 STA $d916 
1ab5 : bd f3 c4 LDA $c4f3,x 
1ab8 : 8d 17 d9 STA $d917 
1abb : a0 00 __ LDY #$00
.l20:
1abd : b9 1c cd LDA $cd1c,y 
1ac0 : 99 18 cd STA $cd18,y 
1ac3 : b9 1c d9 LDA $d91c,y 
1ac6 : 99 18 d9 STA $d918,y 
1ac9 : c8 __ __ INY
1aca : c0 24 __ CPY #$24
1acc : d0 ef __ BNE $1abd ; (screen_left_1.l20 + 0)
.s21:
1ace : bd 18 c9 LDA $c918,x 
1ad1 : 8d 3c cd STA $cd3c 
1ad4 : bd 19 c9 LDA $c919,x 
1ad7 : 8d 3d cd STA $cd3d 
1ada : bd 1a c9 LDA $c91a,x 
1add : 8d 3e cd STA $cd3e 
1ae0 : bd 1b c9 LDA $c91b,x 
1ae3 : 8d 3f cd STA $cd3f 
1ae6 : bd 18 c5 LDA $c518,x 
1ae9 : 8d 3c d9 STA $d93c 
1aec : bd 19 c5 LDA $c519,x 
1aef : 8d 3d d9 STA $d93d 
1af2 : bd 1a c5 LDA $c51a,x 
1af5 : 8d 3e d9 STA $d93e 
1af8 : bd 1b c5 LDA $c51b,x 
1afb : 8d 3f d9 STA $d93f 
1afe : a0 00 __ LDY #$00
.l22:
1b00 : b9 44 cd LDA $cd44,y 
1b03 : 99 40 cd STA $cd40,y 
1b06 : b9 44 d9 LDA $d944,y 
1b09 : 99 40 d9 STA $d940,y 
1b0c : c8 __ __ INY
1b0d : c0 24 __ CPY #$24
1b0f : d0 ef __ BNE $1b00 ; (screen_left_1.l22 + 0)
.s23:
1b11 : bd 40 c9 LDA $c940,x 
1b14 : 8d 64 cd STA $cd64 
1b17 : bd 41 c9 LDA $c941,x 
1b1a : 8d 65 cd STA $cd65 
1b1d : bd 42 c9 LDA $c942,x 
1b20 : 8d 66 cd STA $cd66 
1b23 : bd 43 c9 LDA $c943,x 
1b26 : 8d 67 cd STA $cd67 
1b29 : bd 40 c5 LDA $c540,x 
1b2c : 8d 64 d9 STA $d964 
1b2f : bd 41 c5 LDA $c541,x 
1b32 : 8d 65 d9 STA $d965 
1b35 : bd 42 c5 LDA $c542,x 
1b38 : 8d 66 d9 STA $d966 
1b3b : bd 43 c5 LDA $c543,x 
1b3e : 8d 67 d9 STA $d967 
1b41 : a0 00 __ LDY #$00
.l24:
1b43 : b9 6c cd LDA $cd6c,y 
1b46 : 99 68 cd STA $cd68,y 
1b49 : b9 6c d9 LDA $d96c,y 
1b4c : 99 68 d9 STA $d968,y 
1b4f : c8 __ __ INY
1b50 : c0 24 __ CPY #$24
1b52 : d0 ef __ BNE $1b43 ; (screen_left_1.l24 + 0)
.s25:
1b54 : bd 68 c9 LDA $c968,x 
1b57 : 8d 8c cd STA $cd8c 
1b5a : bd 69 c9 LDA $c969,x 
1b5d : 8d 8d cd STA $cd8d 
1b60 : bd 6a c9 LDA $c96a,x 
1b63 : 8d 8e cd STA $cd8e 
1b66 : bd 6b c9 LDA $c96b,x 
1b69 : 8d 8f cd STA $cd8f 
1b6c : bd 68 c5 LDA $c568,x 
1b6f : 8d 8c d9 STA $d98c 
1b72 : bd 69 c5 LDA $c569,x 
1b75 : 8d 8d d9 STA $d98d 
1b78 : bd 6a c5 LDA $c56a,x 
1b7b : 8d 8e d9 STA $d98e 
1b7e : bd 6b c5 LDA $c56b,x 
1b81 : 8d 8f d9 STA $d98f 
1b84 : a0 00 __ LDY #$00
.l26:
1b86 : b9 94 cd LDA $cd94,y 
1b89 : 99 90 cd STA $cd90,y 
1b8c : b9 94 d9 LDA $d994,y 
1b8f : 99 90 d9 STA $d990,y 
1b92 : c8 __ __ INY
1b93 : c0 24 __ CPY #$24
1b95 : d0 ef __ BNE $1b86 ; (screen_left_1.l26 + 0)
.s27:
1b97 : bd 90 c9 LDA $c990,x 
1b9a : 8d b4 cd STA $cdb4 
1b9d : bd 91 c9 LDA $c991,x 
1ba0 : 8d b5 cd STA $cdb5 
1ba3 : bd 92 c9 LDA $c992,x 
1ba6 : 8d b6 cd STA $cdb6 
1ba9 : bd 93 c9 LDA $c993,x 
1bac : 8d b7 cd STA $cdb7 
1baf : bd 90 c5 LDA $c590,x 
1bb2 : 8d b4 d9 STA $d9b4 
1bb5 : bd 91 c5 LDA $c591,x 
1bb8 : 8d b5 d9 STA $d9b5 
1bbb : bd 92 c5 LDA $c592,x 
1bbe : 8d b6 d9 STA $d9b6 
1bc1 : bd 93 c5 LDA $c593,x 
1bc4 : 8d b7 d9 STA $d9b7 
1bc7 : a0 00 __ LDY #$00
.l28:
1bc9 : b9 bc cd LDA $cdbc,y 
1bcc : 99 b8 cd STA $cdb8,y 
1bcf : b9 bc d9 LDA $d9bc,y 
1bd2 : 99 b8 d9 STA $d9b8,y 
1bd5 : c8 __ __ INY
1bd6 : c0 24 __ CPY #$24
1bd8 : d0 ef __ BNE $1bc9 ; (screen_left_1.l28 + 0)
.s29:
1bda : bd b8 c9 LDA $c9b8,x 
1bdd : 8d dc cd STA $cddc 
1be0 : bd b9 c9 LDA $c9b9,x 
1be3 : 8d dd cd STA $cddd 
1be6 : bd ba c9 LDA $c9ba,x 
1be9 : 8d de cd STA $cdde 
1bec : bd bb c9 LDA $c9bb,x 
1bef : 8d df cd STA $cddf 
1bf2 : bd b8 c5 LDA $c5b8,x 
1bf5 : 8d dc d9 STA $d9dc 
1bf8 : bd b9 c5 LDA $c5b9,x 
1bfb : 8d dd d9 STA $d9dd 
1bfe : bd ba c5 LDA $c5ba,x 
1c01 : 8d de d9 STA $d9de 
1c04 : bd bb c5 LDA $c5bb,x 
1c07 : 8d df d9 STA $d9df 
1c0a : a0 00 __ LDY #$00
.l30:
1c0c : b9 e4 cd LDA $cde4,y 
1c0f : 99 e0 cd STA $cde0,y 
1c12 : b9 e4 d9 LDA $d9e4,y 
1c15 : 99 e0 d9 STA $d9e0,y 
1c18 : c8 __ __ INY
1c19 : c0 24 __ CPY #$24
1c1b : d0 ef __ BNE $1c0c ; (screen_left_1.l30 + 0)
.s31:
1c1d : bd e0 c9 LDA $c9e0,x 
1c20 : 8d 04 ce STA $ce04 
1c23 : bd e1 c9 LDA $c9e1,x 
1c26 : 8d 05 ce STA $ce05 
1c29 : bd e2 c9 LDA $c9e2,x 
1c2c : 8d 06 ce STA $ce06 
1c2f : bd e3 c9 LDA $c9e3,x 
1c32 : 8d 07 ce STA $ce07 
1c35 : bd e0 c5 LDA $c5e0,x 
1c38 : 8d 04 da STA $da04 
1c3b : bd e1 c5 LDA $c5e1,x 
1c3e : 8d 05 da STA $da05 
1c41 : bd e2 c5 LDA $c5e2,x 
1c44 : 8d 06 da STA $da06 
1c47 : bd e3 c5 LDA $c5e3,x 
1c4a : 8d 07 da STA $da07 
1c4d : a0 00 __ LDY #$00
.l32:
1c4f : b9 0c ce LDA $ce0c,y 
1c52 : 99 08 ce STA $ce08,y 
1c55 : b9 0c da LDA $da0c,y 
1c58 : 99 08 da STA $da08,y 
1c5b : c8 __ __ INY
1c5c : c0 24 __ CPY #$24
1c5e : d0 ef __ BNE $1c4f ; (screen_left_1.l32 + 0)
.s33:
1c60 : bd 08 ca LDA $ca08,x 
1c63 : 8d 2c ce STA $ce2c 
1c66 : bd 09 ca LDA $ca09,x 
1c69 : 8d 2d ce STA $ce2d 
1c6c : bd 0a ca LDA $ca0a,x 
1c6f : 8d 2e ce STA $ce2e 
1c72 : bd 0b ca LDA $ca0b,x 
1c75 : 8d 2f ce STA $ce2f 
1c78 : bd 08 c6 LDA $c608,x 
1c7b : 8d 2c da STA $da2c 
1c7e : bd 09 c6 LDA $c609,x 
1c81 : 8d 2d da STA $da2d 
1c84 : bd 0a c6 LDA $c60a,x 
1c87 : 8d 2e da STA $da2e 
1c8a : bd 0b c6 LDA $c60b,x 
1c8d : 8d 2f da STA $da2f 
1c90 : a0 00 __ LDY #$00
.l34:
1c92 : b9 34 ce LDA $ce34,y 
1c95 : 99 30 ce STA $ce30,y 
1c98 : b9 34 da LDA $da34,y 
1c9b : 99 30 da STA $da30,y 
1c9e : c8 __ __ INY
1c9f : c0 24 __ CPY #$24
1ca1 : d0 ef __ BNE $1c92 ; (screen_left_1.l34 + 0)
.s35:
1ca3 : bd 30 ca LDA $ca30,x 
1ca6 : 8d 54 ce STA $ce54 
1ca9 : bd 31 ca LDA $ca31,x 
1cac : 8d 55 ce STA $ce55 
1caf : bd 32 ca LDA $ca32,x 
1cb2 : 8d 56 ce STA $ce56 
1cb5 : bd 33 ca LDA $ca33,x 
1cb8 : 8d 57 ce STA $ce57 
1cbb : bd 30 c6 LDA $c630,x 
1cbe : 8d 54 da STA $da54 
1cc1 : bd 31 c6 LDA $c631,x 
1cc4 : 8d 55 da STA $da55 
1cc7 : bd 32 c6 LDA $c632,x 
1cca : 8d 56 da STA $da56 
1ccd : bd 33 c6 LDA $c633,x 
1cd0 : 8d 57 da STA $da57 
1cd3 : a0 00 __ LDY #$00
.l36:
1cd5 : b9 5c ce LDA $ce5c,y 
1cd8 : 99 58 ce STA $ce58,y 
1cdb : b9 5c da LDA $da5c,y 
1cde : 99 58 da STA $da58,y 
1ce1 : c8 __ __ INY
1ce2 : c0 24 __ CPY #$24
1ce4 : d0 ef __ BNE $1cd5 ; (screen_left_1.l36 + 0)
.s37:
1ce6 : bd 58 ca LDA $ca58,x 
1ce9 : 8d 7c ce STA $ce7c 
1cec : bd 59 ca LDA $ca59,x 
1cef : 8d 7d ce STA $ce7d 
1cf2 : bd 5a ca LDA $ca5a,x 
1cf5 : 8d 7e ce STA $ce7e 
1cf8 : bd 5b ca LDA $ca5b,x 
1cfb : 8d 7f ce STA $ce7f 
1cfe : bd 58 c6 LDA $c658,x 
1d01 : 8d 7c da STA $da7c 
1d04 : bd 59 c6 LDA $c659,x 
1d07 : 8d 7d da STA $da7d 
1d0a : bd 5a c6 LDA $c65a,x 
1d0d : 8d 7e da STA $da7e 
1d10 : bd 5b c6 LDA $c65b,x 
1d13 : 8d 7f da STA $da7f 
1d16 : a0 00 __ LDY #$00
.l38:
1d18 : b9 84 ce LDA $ce84,y 
1d1b : 99 80 ce STA $ce80,y 
1d1e : b9 84 da LDA $da84,y 
1d21 : 99 80 da STA $da80,y 
1d24 : c8 __ __ INY
1d25 : c0 24 __ CPY #$24
1d27 : d0 ef __ BNE $1d18 ; (screen_left_1.l38 + 0)
.s39:
1d29 : bd 80 ca LDA $ca80,x 
1d2c : 8d a4 ce STA $cea4 
1d2f : bd 81 ca LDA $ca81,x 
1d32 : 8d a5 ce STA $cea5 
1d35 : bd 82 ca LDA $ca82,x 
1d38 : 8d a6 ce STA $cea6 
1d3b : bd 83 ca LDA $ca83,x 
1d3e : 8d a7 ce STA $cea7 
1d41 : bd 80 c6 LDA $c680,x 
1d44 : 8d a4 da STA $daa4 
1d47 : bd 81 c6 LDA $c681,x 
1d4a : 8d a5 da STA $daa5 
1d4d : bd 82 c6 LDA $c682,x 
1d50 : 8d a6 da STA $daa6 
1d53 : bd 83 c6 LDA $c683,x 
1d56 : 8d a7 da STA $daa7 
1d59 : a0 00 __ LDY #$00
.l40:
1d5b : b9 ac ce LDA $ceac,y 
1d5e : 99 a8 ce STA $cea8,y 
1d61 : b9 ac da LDA $daac,y 
1d64 : 99 a8 da STA $daa8,y 
1d67 : c8 __ __ INY
1d68 : c0 24 __ CPY #$24
1d6a : d0 ef __ BNE $1d5b ; (screen_left_1.l40 + 0)
.s41:
1d6c : bd a8 ca LDA $caa8,x 
1d6f : 8d cc ce STA $cecc 
1d72 : bd a9 ca LDA $caa9,x 
1d75 : 8d cd ce STA $cecd 
1d78 : bd aa ca LDA $caaa,x 
1d7b : 8d ce ce STA $cece 
1d7e : bd ab ca LDA $caab,x 
1d81 : 8d cf ce STA $cecf 
1d84 : bd a8 c6 LDA $c6a8,x 
1d87 : 8d cc da STA $dacc 
1d8a : bd a9 c6 LDA $c6a9,x 
1d8d : 8d cd da STA $dacd 
1d90 : bd aa c6 LDA $c6aa,x 
1d93 : 8d ce da STA $dace 
1d96 : bd ab c6 LDA $c6ab,x 
1d99 : 8d cf da STA $dacf 
1d9c : a0 00 __ LDY #$00
.l42:
1d9e : b9 d4 ce LDA $ced4,y 
1da1 : 99 d0 ce STA $ced0,y 
1da4 : b9 d4 da LDA $dad4,y 
1da7 : 99 d0 da STA $dad0,y 
1daa : c8 __ __ INY
1dab : c0 24 __ CPY #$24
1dad : d0 ef __ BNE $1d9e ; (screen_left_1.l42 + 0)
.s43:
1daf : bd d0 ca LDA $cad0,x 
1db2 : 8d f4 ce STA $cef4 
1db5 : bd d1 ca LDA $cad1,x 
1db8 : 8d f5 ce STA $cef5 
1dbb : bd d2 ca LDA $cad2,x 
1dbe : 8d f6 ce STA $cef6 
1dc1 : bd d3 ca LDA $cad3,x 
1dc4 : 8d f7 ce STA $cef7 
1dc7 : bd d0 c6 LDA $c6d0,x 
1dca : 8d f4 da STA $daf4 
1dcd : bd d1 c6 LDA $c6d1,x 
1dd0 : 8d f5 da STA $daf5 
1dd3 : bd d2 c6 LDA $c6d2,x 
1dd6 : 8d f6 da STA $daf6 
1dd9 : bd d3 c6 LDA $c6d3,x 
1ddc : 8d f7 da STA $daf7 
1ddf : a0 00 __ LDY #$00
.l44:
1de1 : b9 fc ce LDA $cefc,y 
1de4 : 99 f8 ce STA $cef8,y 
1de7 : b9 fc da LDA $dafc,y 
1dea : 99 f8 da STA $daf8,y 
1ded : c8 __ __ INY
1dee : c0 24 __ CPY #$24
1df0 : d0 ef __ BNE $1de1 ; (screen_left_1.l44 + 0)
.s45:
1df2 : bd f8 ca LDA $caf8,x 
1df5 : 8d 1c cf STA $cf1c 
1df8 : bd f9 ca LDA $caf9,x 
1dfb : 8d 1d cf STA $cf1d 
1dfe : bd fa ca LDA $cafa,x 
1e01 : 8d 1e cf STA $cf1e 
1e04 : bd fb ca LDA $cafb,x 
1e07 : 8d 1f cf STA $cf1f 
1e0a : bd f8 c6 LDA $c6f8,x 
1e0d : 8d 1c db STA $db1c 
1e10 : bd f9 c6 LDA $c6f9,x 
1e13 : 8d 1d db STA $db1d 
1e16 : bd fa c6 LDA $c6fa,x 
1e19 : 8d 1e db STA $db1e 
1e1c : bd fb c6 LDA $c6fb,x 
1e1f : 8d 1f db STA $db1f 
1e22 : a0 00 __ LDY #$00
.l46:
1e24 : b9 24 cf LDA $cf24,y 
1e27 : 99 20 cf STA $cf20,y 
1e2a : b9 24 db LDA $db24,y 
1e2d : 99 20 db STA $db20,y 
1e30 : c8 __ __ INY
1e31 : c0 24 __ CPY #$24
1e33 : d0 ef __ BNE $1e24 ; (screen_left_1.l46 + 0)
.s47:
1e35 : bd 20 cb LDA $cb20,x 
1e38 : 8d 44 cf STA $cf44 
1e3b : bd 21 cb LDA $cb21,x 
1e3e : 8d 45 cf STA $cf45 
1e41 : bd 22 cb LDA $cb22,x 
1e44 : 8d 46 cf STA $cf46 
1e47 : bd 23 cb LDA $cb23,x 
1e4a : 8d 47 cf STA $cf47 
1e4d : bd 20 c7 LDA $c720,x 
1e50 : 8d 44 db STA $db44 
1e53 : bd 21 c7 LDA $c721,x 
1e56 : 8d 45 db STA $db45 
1e59 : bd 22 c7 LDA $c722,x 
1e5c : 8d 46 db STA $db46 
1e5f : bd 23 c7 LDA $c723,x 
1e62 : 8d 47 db STA $db47 
1e65 : a0 00 __ LDY #$00
.l48:
1e67 : b9 4c cf LDA $cf4c,y 
1e6a : 99 48 cf STA $cf48,y 
1e6d : b9 4c db LDA $db4c,y 
1e70 : 99 48 db STA $db48,y 
1e73 : c8 __ __ INY
1e74 : c0 24 __ CPY #$24
1e76 : d0 ef __ BNE $1e67 ; (screen_left_1.l48 + 0)
.s49:
1e78 : bd 48 cb LDA $cb48,x 
1e7b : 8d 6c cf STA $cf6c 
1e7e : bd 49 cb LDA $cb49,x 
1e81 : 8d 6d cf STA $cf6d 
1e84 : bd 4a cb LDA $cb4a,x 
1e87 : 8d 6e cf STA $cf6e 
1e8a : bd 4b cb LDA $cb4b,x 
1e8d : 8d 6f cf STA $cf6f 
1e90 : bd 48 c7 LDA $c748,x 
1e93 : 8d 6c db STA $db6c 
1e96 : bd 49 c7 LDA $c749,x 
1e99 : 8d 6d db STA $db6d 
1e9c : bd 4a c7 LDA $c74a,x 
1e9f : 8d 6e db STA $db6e 
1ea2 : bd 4b c7 LDA $c74b,x 
1ea5 : 8d 6f db STA $db6f 
1ea8 : a0 00 __ LDY #$00
.l50:
1eaa : b9 74 cf LDA $cf74,y 
1ead : 99 70 cf STA $cf70,y 
1eb0 : b9 74 db LDA $db74,y 
1eb3 : 99 70 db STA $db70,y 
1eb6 : c8 __ __ INY
1eb7 : c0 24 __ CPY #$24
1eb9 : d0 ef __ BNE $1eaa ; (screen_left_1.l50 + 0)
.s51:
1ebb : bd 70 cb LDA $cb70,x 
1ebe : 8d 94 cf STA $cf94 
1ec1 : bd 71 cb LDA $cb71,x 
1ec4 : 8d 95 cf STA $cf95 
1ec7 : bd 72 cb LDA $cb72,x 
1eca : 8d 96 cf STA $cf96 
1ecd : bd 73 cb LDA $cb73,x 
1ed0 : 8d 97 cf STA $cf97 
1ed3 : bd 70 c7 LDA $c770,x 
1ed6 : 8d 94 db STA $db94 
1ed9 : bd 71 c7 LDA $c771,x 
1edc : 8d 95 db STA $db95 
1edf : bd 72 c7 LDA $c772,x 
1ee2 : 8d 96 db STA $db96 
1ee5 : bd 73 c7 LDA $c773,x 
1ee8 : 8d 97 db STA $db97 
1eeb : a0 00 __ LDY #$00
.l52:
1eed : b9 9c cf LDA $cf9c,y 
1ef0 : 99 98 cf STA $cf98,y 
1ef3 : b9 9c db LDA $db9c,y 
1ef6 : 99 98 db STA $db98,y 
1ef9 : c8 __ __ INY
1efa : c0 24 __ CPY #$24
1efc : d0 ef __ BNE $1eed ; (screen_left_1.l52 + 0)
.s53:
1efe : bd 98 cb LDA $cb98,x 
1f01 : 8d bc cf STA $cfbc 
1f04 : bd 99 cb LDA $cb99,x 
1f07 : 8d bd cf STA $cfbd 
1f0a : bd 9a cb LDA $cb9a,x 
1f0d : 8d be cf STA $cfbe 
1f10 : bd 9b cb LDA $cb9b,x 
1f13 : 8d bf cf STA $cfbf 
1f16 : bd 98 c7 LDA $c798,x 
1f19 : 8d bc db STA $dbbc 
1f1c : bd 99 c7 LDA $c799,x 
1f1f : 8d bd db STA $dbbd 
1f22 : bd 9a c7 LDA $c79a,x 
1f25 : 8d be db STA $dbbe 
1f28 : bd 9b c7 LDA $c79b,x 
1f2b : 8d bf db STA $dbbf 
1f2e : a0 00 __ LDY #$00
.l54:
1f30 : b9 c4 cf LDA $cfc4,y 
1f33 : 99 c0 cf STA $cfc0,y 
1f36 : b9 c4 db LDA $dbc4,y 
1f39 : 99 c0 db STA $dbc0,y 
1f3c : c8 __ __ INY
1f3d : c0 24 __ CPY #$24
1f3f : d0 ef __ BNE $1f30 ; (screen_left_1.l54 + 0)
.s55:
1f41 : bd c0 cb LDA $cbc0,x 
1f44 : 8d e4 cf STA $cfe4 
1f47 : bd c1 cb LDA $cbc1,x 
1f4a : 8d e5 cf STA $cfe5 
1f4d : bd c2 cb LDA $cbc2,x 
1f50 : 8d e6 cf STA $cfe6 
1f53 : bd c3 cb LDA $cbc3,x 
1f56 : 8d e7 cf STA $cfe7 
1f59 : bd c0 c7 LDA $c7c0,x 
1f5c : 8d e4 db STA $dbe4 
1f5f : bd c1 c7 LDA $c7c1,x 
1f62 : 8d e5 db STA $dbe5 
1f65 : bd c2 c7 LDA $c7c2,x 
1f68 : 8d e6 db STA $dbe6 
1f6b : bd c3 c7 LDA $c7c3,x 
1f6e : 8d e7 db STA $dbe7 
1f71 : 8a __ __ TXA
1f72 : 18 __ __ CLC
1f73 : 69 04 __ ADC #$04
1f75 : 85 43 __ STA T7 + 0 
1f77 : c9 25 __ CMP #$25
1f79 : b0 03 __ BCS $1f7e ; (screen_left_1.s3 + 0)
1f7b : 4c dd 18 JMP $18dd ; (screen_left_1.l5 + 0)
.s3:
1f7e : 60 __ __ RTS
--------------------------------------------------------------------
screen_right: ; screen_right()->void
; 195, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
1f7f : ad de 35 LDA $35de ; (FlipIndex + 0)
1f82 : d0 03 __ BNE $1f87 ; (screen_right.s6 + 0)
.s5:
1f84 : 4c 2f 26 JMP $262f ; (screen_right_1.s4 + 0)
.s6:
1f87 : 4c 8a 1f JMP $1f8a ; (screen_right_0.s4 + 0)
--------------------------------------------------------------------
screen_right_0: ; screen_right_0()->void
; 152, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
1f8a : a9 3a __ LDA #$3a
1f8c : 85 0d __ STA P0 
1f8e : a9 28 __ LDA #$28
.l5:
1f90 : 85 43 __ STA T7 + 0 
1f92 : a9 00 __ LDA #$00
1f94 : 85 0e __ STA P1 
1f96 : 20 bc 18 JSR $18bc ; (vic_waitLine.s4 + 0)
1f99 : a2 27 __ LDX #$27
.l6:
1f9b : bd fc c7 LDA $c7fc,x 
1f9e : 9d 00 c8 STA $c800,x 
1fa1 : bd fc d7 LDA $d7fc,x 
1fa4 : 9d 00 d8 STA $d800,x 
1fa7 : ca __ __ DEX
1fa8 : e0 04 __ CPX #$04
1faa : b0 ef __ BCS $1f9b ; (screen_right_0.l6 + 0)
.s7:
1fac : a6 43 __ LDX T7 + 0 
1fae : bd fc cb LDA $cbfc,x 
1fb1 : 8d 00 c8 STA $c800 
1fb4 : bd fd cb LDA $cbfd,x 
1fb7 : 8d 01 c8 STA $c801 
1fba : bd fe cb LDA $cbfe,x 
1fbd : 8d 02 c8 STA $c802 
1fc0 : bd ff cb LDA $cbff,x 
1fc3 : 8d 03 c8 STA $c803 
1fc6 : bd fc c3 LDA $c3fc,x 
1fc9 : 8d 00 d8 STA $d800 
1fcc : bd fd c3 LDA $c3fd,x 
1fcf : 8d 01 d8 STA $d801 
1fd2 : bd fe c3 LDA $c3fe,x 
1fd5 : 8d 02 d8 STA $d802 
1fd8 : bd ff c3 LDA $c3ff,x 
1fdb : 8d 03 d8 STA $d803 
1fde : a0 27 __ LDY #$27
.l8:
1fe0 : b9 24 c8 LDA $c824,y 
1fe3 : 99 28 c8 STA $c828,y 
1fe6 : b9 24 d8 LDA $d824,y 
1fe9 : 99 28 d8 STA $d828,y 
1fec : 88 __ __ DEY
1fed : c0 04 __ CPY #$04
1fef : b0 ef __ BCS $1fe0 ; (screen_right_0.l8 + 0)
.s9:
1ff1 : bd 24 cc LDA $cc24,x 
1ff4 : 8d 28 c8 STA $c828 
1ff7 : bd 25 cc LDA $cc25,x 
1ffa : 8d 29 c8 STA $c829 
1ffd : bd 26 cc LDA $cc26,x 
2000 : 8d 2a c8 STA $c82a 
2003 : bd 27 cc LDA $cc27,x 
2006 : 8d 2b c8 STA $c82b 
2009 : bd 24 c4 LDA $c424,x 
200c : 8d 28 d8 STA $d828 
200f : bd 25 c4 LDA $c425,x 
2012 : 8d 29 d8 STA $d829 
2015 : bd 26 c4 LDA $c426,x 
2018 : 8d 2a d8 STA $d82a 
201b : bd 27 c4 LDA $c427,x 
201e : 8d 2b d8 STA $d82b 
2021 : a0 27 __ LDY #$27
.l10:
2023 : b9 4c c8 LDA $c84c,y 
2026 : 99 50 c8 STA $c850,y 
2029 : b9 4c d8 LDA $d84c,y 
202c : 99 50 d8 STA $d850,y 
202f : 88 __ __ DEY
2030 : c0 04 __ CPY #$04
2032 : b0 ef __ BCS $2023 ; (screen_right_0.l10 + 0)
.s11:
2034 : bd 4c cc LDA $cc4c,x 
2037 : 8d 50 c8 STA $c850 
203a : bd 4d cc LDA $cc4d,x 
203d : 8d 51 c8 STA $c851 
2040 : bd 4e cc LDA $cc4e,x 
2043 : 8d 52 c8 STA $c852 
2046 : bd 4f cc LDA $cc4f,x 
2049 : 8d 53 c8 STA $c853 
204c : bd 4c c4 LDA $c44c,x 
204f : 8d 50 d8 STA $d850 
2052 : bd 4d c4 LDA $c44d,x 
2055 : 8d 51 d8 STA $d851 
2058 : bd 4e c4 LDA $c44e,x 
205b : 8d 52 d8 STA $d852 
205e : bd 4f c4 LDA $c44f,x 
2061 : 8d 53 d8 STA $d853 
2064 : a0 27 __ LDY #$27
.l12:
2066 : b9 74 c8 LDA $c874,y 
2069 : 99 78 c8 STA $c878,y 
206c : b9 74 d8 LDA $d874,y 
206f : 99 78 d8 STA $d878,y 
2072 : 88 __ __ DEY
2073 : c0 04 __ CPY #$04
2075 : b0 ef __ BCS $2066 ; (screen_right_0.l12 + 0)
.s13:
2077 : bd 74 cc LDA $cc74,x 
207a : 8d 78 c8 STA $c878 
207d : bd 75 cc LDA $cc75,x 
2080 : 8d 79 c8 STA $c879 
2083 : bd 76 cc LDA $cc76,x 
2086 : 8d 7a c8 STA $c87a 
2089 : bd 77 cc LDA $cc77,x 
208c : 8d 7b c8 STA $c87b 
208f : bd 74 c4 LDA $c474,x 
2092 : 8d 78 d8 STA $d878 
2095 : bd 75 c4 LDA $c475,x 
2098 : 8d 79 d8 STA $d879 
209b : bd 76 c4 LDA $c476,x 
209e : 8d 7a d8 STA $d87a 
20a1 : bd 77 c4 LDA $c477,x 
20a4 : 8d 7b d8 STA $d87b 
20a7 : a0 27 __ LDY #$27
.l14:
20a9 : b9 9c c8 LDA $c89c,y 
20ac : 99 a0 c8 STA $c8a0,y 
20af : b9 9c d8 LDA $d89c,y 
20b2 : 99 a0 d8 STA $d8a0,y 
20b5 : 88 __ __ DEY
20b6 : c0 04 __ CPY #$04
20b8 : b0 ef __ BCS $20a9 ; (screen_right_0.l14 + 0)
.s15:
20ba : bd 9c cc LDA $cc9c,x 
20bd : 8d a0 c8 STA $c8a0 
20c0 : bd 9d cc LDA $cc9d,x 
20c3 : 8d a1 c8 STA $c8a1 
20c6 : bd 9e cc LDA $cc9e,x 
20c9 : 8d a2 c8 STA $c8a2 
20cc : bd 9f cc LDA $cc9f,x 
20cf : 8d a3 c8 STA $c8a3 
20d2 : bd 9c c4 LDA $c49c,x 
20d5 : 8d a0 d8 STA $d8a0 
20d8 : bd 9d c4 LDA $c49d,x 
20db : 8d a1 d8 STA $d8a1 
20de : bd 9e c4 LDA $c49e,x 
20e1 : 8d a2 d8 STA $d8a2 
20e4 : bd 9f c4 LDA $c49f,x 
20e7 : 8d a3 d8 STA $d8a3 
20ea : a0 27 __ LDY #$27
.l16:
20ec : b9 c4 c8 LDA $c8c4,y 
20ef : 99 c8 c8 STA $c8c8,y 
20f2 : b9 c4 d8 LDA $d8c4,y 
20f5 : 99 c8 d8 STA $d8c8,y 
20f8 : 88 __ __ DEY
20f9 : c0 04 __ CPY #$04
20fb : b0 ef __ BCS $20ec ; (screen_right_0.l16 + 0)
.s17:
20fd : bd c4 cc LDA $ccc4,x 
2100 : 8d c8 c8 STA $c8c8 
2103 : bd c5 cc LDA $ccc5,x 
2106 : 8d c9 c8 STA $c8c9 
2109 : bd c6 cc LDA $ccc6,x 
210c : 8d ca c8 STA $c8ca 
210f : bd c7 cc LDA $ccc7,x 
2112 : 8d cb c8 STA $c8cb 
2115 : bd c4 c4 LDA $c4c4,x 
2118 : 8d c8 d8 STA $d8c8 
211b : bd c5 c4 LDA $c4c5,x 
211e : 8d c9 d8 STA $d8c9 
2121 : bd c6 c4 LDA $c4c6,x 
2124 : 8d ca d8 STA $d8ca 
2127 : bd c7 c4 LDA $c4c7,x 
212a : 8d cb d8 STA $d8cb 
212d : a0 27 __ LDY #$27
.l18:
212f : b9 ec c8 LDA $c8ec,y 
2132 : 99 f0 c8 STA $c8f0,y 
2135 : b9 ec d8 LDA $d8ec,y 
2138 : 99 f0 d8 STA $d8f0,y 
213b : 88 __ __ DEY
213c : c0 04 __ CPY #$04
213e : b0 ef __ BCS $212f ; (screen_right_0.l18 + 0)
.s19:
2140 : bd ec cc LDA $ccec,x 
2143 : 8d f0 c8 STA $c8f0 
2146 : bd ed cc LDA $cced,x 
2149 : 8d f1 c8 STA $c8f1 
214c : bd ee cc LDA $ccee,x 
214f : 8d f2 c8 STA $c8f2 
2152 : bd ef cc LDA $ccef,x 
2155 : 8d f3 c8 STA $c8f3 
2158 : bd ec c4 LDA $c4ec,x 
215b : 8d f0 d8 STA $d8f0 
215e : bd ed c4 LDA $c4ed,x 
2161 : 8d f1 d8 STA $d8f1 
2164 : bd ee c4 LDA $c4ee,x 
2167 : 8d f2 d8 STA $d8f2 
216a : bd ef c4 LDA $c4ef,x 
216d : 8d f3 d8 STA $d8f3 
2170 : a0 27 __ LDY #$27
.l20:
2172 : b9 14 c9 LDA $c914,y 
2175 : 99 18 c9 STA $c918,y 
2178 : b9 14 d9 LDA $d914,y 
217b : 99 18 d9 STA $d918,y 
217e : 88 __ __ DEY
217f : c0 04 __ CPY #$04
2181 : b0 ef __ BCS $2172 ; (screen_right_0.l20 + 0)
.s21:
2183 : bd 14 cd LDA $cd14,x 
2186 : 8d 18 c9 STA $c918 
2189 : bd 15 cd LDA $cd15,x 
218c : 8d 19 c9 STA $c919 
218f : bd 16 cd LDA $cd16,x 
2192 : 8d 1a c9 STA $c91a 
2195 : bd 17 cd LDA $cd17,x 
2198 : 8d 1b c9 STA $c91b 
219b : bd 14 c5 LDA $c514,x 
219e : 8d 18 d9 STA $d918 
21a1 : bd 15 c5 LDA $c515,x 
21a4 : 8d 19 d9 STA $d919 
21a7 : bd 16 c5 LDA $c516,x 
21aa : 8d 1a d9 STA $d91a 
21ad : bd 17 c5 LDA $c517,x 
21b0 : 8d 1b d9 STA $d91b 
21b3 : a0 27 __ LDY #$27
.l22:
21b5 : b9 3c c9 LDA $c93c,y 
21b8 : 99 40 c9 STA $c940,y 
21bb : b9 3c d9 LDA $d93c,y 
21be : 99 40 d9 STA $d940,y 
21c1 : 88 __ __ DEY
21c2 : c0 04 __ CPY #$04
21c4 : b0 ef __ BCS $21b5 ; (screen_right_0.l22 + 0)
.s23:
21c6 : bd 3c cd LDA $cd3c,x 
21c9 : 8d 40 c9 STA $c940 
21cc : bd 3d cd LDA $cd3d,x 
21cf : 8d 41 c9 STA $c941 
21d2 : bd 3e cd LDA $cd3e,x 
21d5 : 8d 42 c9 STA $c942 
21d8 : bd 3f cd LDA $cd3f,x 
21db : 8d 43 c9 STA $c943 
21de : bd 3c c5 LDA $c53c,x 
21e1 : 8d 40 d9 STA $d940 
21e4 : bd 3d c5 LDA $c53d,x 
21e7 : 8d 41 d9 STA $d941 
21ea : bd 3e c5 LDA $c53e,x 
21ed : 8d 42 d9 STA $d942 
21f0 : bd 3f c5 LDA $c53f,x 
21f3 : 8d 43 d9 STA $d943 
21f6 : a0 27 __ LDY #$27
.l24:
21f8 : b9 64 c9 LDA $c964,y 
21fb : 99 68 c9 STA $c968,y 
21fe : b9 64 d9 LDA $d964,y 
2201 : 99 68 d9 STA $d968,y 
2204 : 88 __ __ DEY
2205 : c0 04 __ CPY #$04
2207 : b0 ef __ BCS $21f8 ; (screen_right_0.l24 + 0)
.s25:
2209 : bd 64 cd LDA $cd64,x 
220c : 8d 68 c9 STA $c968 
220f : bd 65 cd LDA $cd65,x 
2212 : 8d 69 c9 STA $c969 
2215 : bd 66 cd LDA $cd66,x 
2218 : 8d 6a c9 STA $c96a 
221b : bd 67 cd LDA $cd67,x 
221e : 8d 6b c9 STA $c96b 
2221 : bd 64 c5 LDA $c564,x 
2224 : 8d 68 d9 STA $d968 
2227 : bd 65 c5 LDA $c565,x 
222a : 8d 69 d9 STA $d969 
222d : bd 66 c5 LDA $c566,x 
2230 : 8d 6a d9 STA $d96a 
2233 : bd 67 c5 LDA $c567,x 
2236 : 8d 6b d9 STA $d96b 
2239 : a0 27 __ LDY #$27
.l26:
223b : b9 8c c9 LDA $c98c,y 
223e : 99 90 c9 STA $c990,y 
2241 : b9 8c d9 LDA $d98c,y 
2244 : 99 90 d9 STA $d990,y 
2247 : 88 __ __ DEY
2248 : c0 04 __ CPY #$04
224a : b0 ef __ BCS $223b ; (screen_right_0.l26 + 0)
.s27:
224c : bd 8c cd LDA $cd8c,x 
224f : 8d 90 c9 STA $c990 
2252 : bd 8d cd LDA $cd8d,x 
2255 : 8d 91 c9 STA $c991 
2258 : bd 8e cd LDA $cd8e,x 
225b : 8d 92 c9 STA $c992 
225e : bd 8f cd LDA $cd8f,x 
2261 : 8d 93 c9 STA $c993 
2264 : bd 8c c5 LDA $c58c,x 
2267 : 8d 90 d9 STA $d990 
226a : bd 8d c5 LDA $c58d,x 
226d : 8d 91 d9 STA $d991 
2270 : bd 8e c5 LDA $c58e,x 
2273 : 8d 92 d9 STA $d992 
2276 : bd 8f c5 LDA $c58f,x 
2279 : 8d 93 d9 STA $d993 
227c : a0 27 __ LDY #$27
.l28:
227e : b9 b4 c9 LDA $c9b4,y 
2281 : 99 b8 c9 STA $c9b8,y 
2284 : b9 b4 d9 LDA $d9b4,y 
2287 : 99 b8 d9 STA $d9b8,y 
228a : 88 __ __ DEY
228b : c0 04 __ CPY #$04
228d : b0 ef __ BCS $227e ; (screen_right_0.l28 + 0)
.s29:
228f : bd b4 cd LDA $cdb4,x 
2292 : 8d b8 c9 STA $c9b8 
2295 : bd b5 cd LDA $cdb5,x 
2298 : 8d b9 c9 STA $c9b9 
229b : bd b6 cd LDA $cdb6,x 
229e : 8d ba c9 STA $c9ba 
22a1 : bd b7 cd LDA $cdb7,x 
22a4 : 8d bb c9 STA $c9bb 
22a7 : bd b4 c5 LDA $c5b4,x 
22aa : 8d b8 d9 STA $d9b8 
22ad : bd b5 c5 LDA $c5b5,x 
22b0 : 8d b9 d9 STA $d9b9 
22b3 : bd b6 c5 LDA $c5b6,x 
22b6 : 8d ba d9 STA $d9ba 
22b9 : bd b7 c5 LDA $c5b7,x 
22bc : 8d bb d9 STA $d9bb 
22bf : a0 27 __ LDY #$27
.l30:
22c1 : b9 dc c9 LDA $c9dc,y 
22c4 : 99 e0 c9 STA $c9e0,y 
22c7 : b9 dc d9 LDA $d9dc,y 
22ca : 99 e0 d9 STA $d9e0,y 
22cd : 88 __ __ DEY
22ce : c0 04 __ CPY #$04
22d0 : b0 ef __ BCS $22c1 ; (screen_right_0.l30 + 0)
.s31:
22d2 : bd dc cd LDA $cddc,x 
22d5 : 8d e0 c9 STA $c9e0 
22d8 : bd dd cd LDA $cddd,x 
22db : 8d e1 c9 STA $c9e1 
22de : bd de cd LDA $cdde,x 
22e1 : 8d e2 c9 STA $c9e2 
22e4 : bd df cd LDA $cddf,x 
22e7 : 8d e3 c9 STA $c9e3 
22ea : bd dc c5 LDA $c5dc,x 
22ed : 8d e0 d9 STA $d9e0 
22f0 : bd dd c5 LDA $c5dd,x 
22f3 : 8d e1 d9 STA $d9e1 
22f6 : bd de c5 LDA $c5de,x 
22f9 : 8d e2 d9 STA $d9e2 
22fc : bd df c5 LDA $c5df,x 
22ff : 8d e3 d9 STA $d9e3 
2302 : a0 27 __ LDY #$27
.l32:
2304 : b9 04 ca LDA $ca04,y 
2307 : 99 08 ca STA $ca08,y 
230a : b9 04 da LDA $da04,y 
230d : 99 08 da STA $da08,y 
2310 : 88 __ __ DEY
2311 : c0 04 __ CPY #$04
2313 : b0 ef __ BCS $2304 ; (screen_right_0.l32 + 0)
.s33:
2315 : bd 04 ce LDA $ce04,x 
2318 : 8d 08 ca STA $ca08 
231b : bd 05 ce LDA $ce05,x 
231e : 8d 09 ca STA $ca09 
2321 : bd 06 ce LDA $ce06,x 
2324 : 8d 0a ca STA $ca0a 
2327 : bd 07 ce LDA $ce07,x 
232a : 8d 0b ca STA $ca0b 
232d : bd 04 c6 LDA $c604,x 
2330 : 8d 08 da STA $da08 
2333 : bd 05 c6 LDA $c605,x 
2336 : 8d 09 da STA $da09 
2339 : bd 06 c6 LDA $c606,x 
233c : 8d 0a da STA $da0a 
233f : bd 07 c6 LDA $c607,x 
2342 : 8d 0b da STA $da0b 
2345 : a0 27 __ LDY #$27
.l34:
2347 : b9 2c ca LDA $ca2c,y 
234a : 99 30 ca STA $ca30,y 
234d : b9 2c da LDA $da2c,y 
2350 : 99 30 da STA $da30,y 
2353 : 88 __ __ DEY
2354 : c0 04 __ CPY #$04
2356 : b0 ef __ BCS $2347 ; (screen_right_0.l34 + 0)
.s35:
2358 : bd 2c ce LDA $ce2c,x 
235b : 8d 30 ca STA $ca30 
235e : bd 2d ce LDA $ce2d,x 
2361 : 8d 31 ca STA $ca31 
2364 : bd 2e ce LDA $ce2e,x 
2367 : 8d 32 ca STA $ca32 
236a : bd 2f ce LDA $ce2f,x 
236d : 8d 33 ca STA $ca33 
2370 : bd 2c c6 LDA $c62c,x 
2373 : 8d 30 da STA $da30 
2376 : bd 2d c6 LDA $c62d,x 
2379 : 8d 31 da STA $da31 
237c : bd 2e c6 LDA $c62e,x 
237f : 8d 32 da STA $da32 
2382 : bd 2f c6 LDA $c62f,x 
2385 : 8d 33 da STA $da33 
2388 : a0 27 __ LDY #$27
.l36:
238a : b9 54 ca LDA $ca54,y 
238d : 99 58 ca STA $ca58,y 
2390 : b9 54 da LDA $da54,y 
2393 : 99 58 da STA $da58,y 
2396 : 88 __ __ DEY
2397 : c0 04 __ CPY #$04
2399 : b0 ef __ BCS $238a ; (screen_right_0.l36 + 0)
.s37:
239b : bd 54 ce LDA $ce54,x 
239e : 8d 58 ca STA $ca58 
23a1 : bd 55 ce LDA $ce55,x 
23a4 : 8d 59 ca STA $ca59 
23a7 : bd 56 ce LDA $ce56,x 
23aa : 8d 5a ca STA $ca5a 
23ad : bd 57 ce LDA $ce57,x 
23b0 : 8d 5b ca STA $ca5b 
23b3 : bd 54 c6 LDA $c654,x 
23b6 : 8d 58 da STA $da58 
23b9 : bd 55 c6 LDA $c655,x 
23bc : 8d 59 da STA $da59 
23bf : bd 56 c6 LDA $c656,x 
23c2 : 8d 5a da STA $da5a 
23c5 : bd 57 c6 LDA $c657,x 
23c8 : 8d 5b da STA $da5b 
23cb : a0 27 __ LDY #$27
.l38:
23cd : b9 7c ca LDA $ca7c,y 
23d0 : 99 80 ca STA $ca80,y 
23d3 : b9 7c da LDA $da7c,y 
23d6 : 99 80 da STA $da80,y 
23d9 : 88 __ __ DEY
23da : c0 04 __ CPY #$04
23dc : b0 ef __ BCS $23cd ; (screen_right_0.l38 + 0)
.s39:
23de : bd 7c ce LDA $ce7c,x 
23e1 : 8d 80 ca STA $ca80 
23e4 : bd 7d ce LDA $ce7d,x 
23e7 : 8d 81 ca STA $ca81 
23ea : bd 7e ce LDA $ce7e,x 
23ed : 8d 82 ca STA $ca82 
23f0 : bd 7f ce LDA $ce7f,x 
23f3 : 8d 83 ca STA $ca83 
23f6 : bd 7c c6 LDA $c67c,x 
23f9 : 8d 80 da STA $da80 
23fc : bd 7d c6 LDA $c67d,x 
23ff : 8d 81 da STA $da81 
2402 : bd 7e c6 LDA $c67e,x 
2405 : 8d 82 da STA $da82 
2408 : bd 7f c6 LDA $c67f,x 
240b : 8d 83 da STA $da83 
240e : a0 27 __ LDY #$27
.l40:
2410 : b9 a4 ca LDA $caa4,y 
2413 : 99 a8 ca STA $caa8,y 
2416 : b9 a4 da LDA $daa4,y 
2419 : 99 a8 da STA $daa8,y 
241c : 88 __ __ DEY
241d : c0 04 __ CPY #$04
241f : b0 ef __ BCS $2410 ; (screen_right_0.l40 + 0)
.s41:
2421 : bd a4 ce LDA $cea4,x 
2424 : 8d a8 ca STA $caa8 
2427 : bd a5 ce LDA $cea5,x 
242a : 8d a9 ca STA $caa9 
242d : bd a6 ce LDA $cea6,x 
2430 : 8d aa ca STA $caaa 
2433 : bd a7 ce LDA $cea7,x 
2436 : 8d ab ca STA $caab 
2439 : bd a4 c6 LDA $c6a4,x 
243c : 8d a8 da STA $daa8 
243f : bd a5 c6 LDA $c6a5,x 
2442 : 8d a9 da STA $daa9 
2445 : bd a6 c6 LDA $c6a6,x 
2448 : 8d aa da STA $daaa 
244b : bd a7 c6 LDA $c6a7,x 
244e : 8d ab da STA $daab 
2451 : a0 27 __ LDY #$27
.l42:
2453 : b9 cc ca LDA $cacc,y 
2456 : 99 d0 ca STA $cad0,y 
2459 : b9 cc da LDA $dacc,y 
245c : 99 d0 da STA $dad0,y 
245f : 88 __ __ DEY
2460 : c0 04 __ CPY #$04
2462 : b0 ef __ BCS $2453 ; (screen_right_0.l42 + 0)
.s43:
2464 : bd cc ce LDA $cecc,x 
2467 : 8d d0 ca STA $cad0 
246a : bd cd ce LDA $cecd,x 
246d : 8d d1 ca STA $cad1 
2470 : bd ce ce LDA $cece,x 
2473 : 8d d2 ca STA $cad2 
2476 : bd cf ce LDA $cecf,x 
2479 : 8d d3 ca STA $cad3 
247c : bd cc c6 LDA $c6cc,x 
247f : 8d d0 da STA $dad0 
2482 : bd cd c6 LDA $c6cd,x 
2485 : 8d d1 da STA $dad1 
2488 : bd ce c6 LDA $c6ce,x 
248b : 8d d2 da STA $dad2 
248e : bd cf c6 LDA $c6cf,x 
2491 : 8d d3 da STA $dad3 
2494 : a0 27 __ LDY #$27
.l44:
2496 : b9 f4 ca LDA $caf4,y 
2499 : 99 f8 ca STA $caf8,y 
249c : b9 f4 da LDA $daf4,y 
249f : 99 f8 da STA $daf8,y 
24a2 : 88 __ __ DEY
24a3 : c0 04 __ CPY #$04
24a5 : b0 ef __ BCS $2496 ; (screen_right_0.l44 + 0)
.s45:
24a7 : bd f4 ce LDA $cef4,x 
24aa : 8d f8 ca STA $caf8 
24ad : bd f5 ce LDA $cef5,x 
24b0 : 8d f9 ca STA $caf9 
24b3 : bd f6 ce LDA $cef6,x 
24b6 : 8d fa ca STA $cafa 
24b9 : bd f7 ce LDA $cef7,x 
24bc : 8d fb ca STA $cafb 
24bf : bd f4 c6 LDA $c6f4,x 
24c2 : 8d f8 da STA $daf8 
24c5 : bd f5 c6 LDA $c6f5,x 
24c8 : 8d f9 da STA $daf9 
24cb : bd f6 c6 LDA $c6f6,x 
24ce : 8d fa da STA $dafa 
24d1 : bd f7 c6 LDA $c6f7,x 
24d4 : 8d fb da STA $dafb 
24d7 : a0 27 __ LDY #$27
.l46:
24d9 : b9 1c cb LDA $cb1c,y 
24dc : 99 20 cb STA $cb20,y 
24df : b9 1c db LDA $db1c,y 
24e2 : 99 20 db STA $db20,y 
24e5 : 88 __ __ DEY
24e6 : c0 04 __ CPY #$04
24e8 : b0 ef __ BCS $24d9 ; (screen_right_0.l46 + 0)
.s47:
24ea : bd 1c cf LDA $cf1c,x 
24ed : 8d 20 cb STA $cb20 
24f0 : bd 1d cf LDA $cf1d,x 
24f3 : 8d 21 cb STA $cb21 
24f6 : bd 1e cf LDA $cf1e,x 
24f9 : 8d 22 cb STA $cb22 
24fc : bd 1f cf LDA $cf1f,x 
24ff : 8d 23 cb STA $cb23 
2502 : bd 1c c7 LDA $c71c,x 
2505 : 8d 20 db STA $db20 
2508 : bd 1d c7 LDA $c71d,x 
250b : 8d 21 db STA $db21 
250e : bd 1e c7 LDA $c71e,x 
2511 : 8d 22 db STA $db22 
2514 : bd 1f c7 LDA $c71f,x 
2517 : 8d 23 db STA $db23 
251a : a0 27 __ LDY #$27
.l48:
251c : b9 44 cb LDA $cb44,y 
251f : 99 48 cb STA $cb48,y 
2522 : b9 44 db LDA $db44,y 
2525 : 99 48 db STA $db48,y 
2528 : 88 __ __ DEY
2529 : c0 04 __ CPY #$04
252b : b0 ef __ BCS $251c ; (screen_right_0.l48 + 0)
.s49:
252d : bd 44 cf LDA $cf44,x 
2530 : 8d 48 cb STA $cb48 
2533 : bd 45 cf LDA $cf45,x 
2536 : 8d 49 cb STA $cb49 
2539 : bd 46 cf LDA $cf46,x 
253c : 8d 4a cb STA $cb4a 
253f : bd 47 cf LDA $cf47,x 
2542 : 8d 4b cb STA $cb4b 
2545 : bd 44 c7 LDA $c744,x 
2548 : 8d 48 db STA $db48 
254b : bd 45 c7 LDA $c745,x 
254e : 8d 49 db STA $db49 
2551 : bd 46 c7 LDA $c746,x 
2554 : 8d 4a db STA $db4a 
2557 : bd 47 c7 LDA $c747,x 
255a : 8d 4b db STA $db4b 
255d : a0 27 __ LDY #$27
.l50:
255f : b9 6c cb LDA $cb6c,y 
2562 : 99 70 cb STA $cb70,y 
2565 : b9 6c db LDA $db6c,y 
2568 : 99 70 db STA $db70,y 
256b : 88 __ __ DEY
256c : c0 04 __ CPY #$04
256e : b0 ef __ BCS $255f ; (screen_right_0.l50 + 0)
.s51:
2570 : bd 6c cf LDA $cf6c,x 
2573 : 8d 70 cb STA $cb70 
2576 : bd 6d cf LDA $cf6d,x 
2579 : 8d 71 cb STA $cb71 
257c : bd 6e cf LDA $cf6e,x 
257f : 8d 72 cb STA $cb72 
2582 : bd 6f cf LDA $cf6f,x 
2585 : 8d 73 cb STA $cb73 
2588 : bd 6c c7 LDA $c76c,x 
258b : 8d 70 db STA $db70 
258e : bd 6d c7 LDA $c76d,x 
2591 : 8d 71 db STA $db71 
2594 : bd 6e c7 LDA $c76e,x 
2597 : 8d 72 db STA $db72 
259a : bd 6f c7 LDA $c76f,x 
259d : 8d 73 db STA $db73 
25a0 : a0 27 __ LDY #$27
.l52:
25a2 : b9 94 cb LDA $cb94,y 
25a5 : 99 98 cb STA $cb98,y 
25a8 : b9 94 db LDA $db94,y 
25ab : 99 98 db STA $db98,y 
25ae : 88 __ __ DEY
25af : c0 04 __ CPY #$04
25b1 : b0 ef __ BCS $25a2 ; (screen_right_0.l52 + 0)
.s53:
25b3 : bd 94 cf LDA $cf94,x 
25b6 : 8d 98 cb STA $cb98 
25b9 : bd 95 cf LDA $cf95,x 
25bc : 8d 99 cb STA $cb99 
25bf : bd 96 cf LDA $cf96,x 
25c2 : 8d 9a cb STA $cb9a 
25c5 : bd 97 cf LDA $cf97,x 
25c8 : 8d 9b cb STA $cb9b 
25cb : bd 94 c7 LDA $c794,x 
25ce : 8d 98 db STA $db98 
25d1 : bd 95 c7 LDA $c795,x 
25d4 : 8d 99 db STA $db99 
25d7 : bd 96 c7 LDA $c796,x 
25da : 8d 9a db STA $db9a 
25dd : bd 97 c7 LDA $c797,x 
25e0 : 8d 9b db STA $db9b 
25e3 : a0 27 __ LDY #$27
.l54:
25e5 : b9 bc cb LDA $cbbc,y 
25e8 : 99 c0 cb STA $cbc0,y 
25eb : b9 bc db LDA $dbbc,y 
25ee : 99 c0 db STA $dbc0,y 
25f1 : 88 __ __ DEY
25f2 : c0 04 __ CPY #$04
25f4 : b0 ef __ BCS $25e5 ; (screen_right_0.l54 + 0)
.s55:
25f6 : bd bc cf LDA $cfbc,x 
25f9 : 8d c0 cb STA $cbc0 
25fc : bd bd cf LDA $cfbd,x 
25ff : 8d c1 cb STA $cbc1 
2602 : bd be cf LDA $cfbe,x 
2605 : 8d c2 cb STA $cbc2 
2608 : bd bf cf LDA $cfbf,x 
260b : 8d c3 cb STA $cbc3 
260e : bd bc c7 LDA $c7bc,x 
2611 : 8d c0 db STA $dbc0 
2614 : bd bd c7 LDA $c7bd,x 
2617 : 8d c1 db STA $dbc1 
261a : bd be c7 LDA $c7be,x 
261d : 8d c2 db STA $dbc2 
2620 : bd bf c7 LDA $c7bf,x 
2623 : 8d c3 db STA $dbc3 
2626 : 8a __ __ TXA
2627 : e9 03 __ SBC #$03
2629 : f0 03 __ BEQ $262e ; (screen_right_0.s3 + 0)
262b : 4c 90 1f JMP $1f90 ; (screen_right_0.l5 + 0)
.s3:
262e : 60 __ __ RTS
--------------------------------------------------------------------
screen_right_1: ; screen_right_1()->void
; 152, "/home/honza/projects/c64/projects/oscar64/samples/games/maze3d.c"
.s4:
262f : a9 3a __ LDA #$3a
2631 : 85 0d __ STA P0 
2633 : a9 28 __ LDA #$28
.l5:
2635 : 85 43 __ STA T7 + 0 
2637 : a9 00 __ LDA #$00
2639 : 85 0e __ STA P1 
263b : 20 bc 18 JSR $18bc ; (vic_waitLine.s4 + 0)
263e : a2 27 __ LDX #$27
.l6:
2640 : bd fc cb LDA $cbfc,x 
2643 : 9d 00 cc STA $cc00,x 
2646 : bd fc d7 LDA $d7fc,x 
2649 : 9d 00 d8 STA $d800,x 
264c : ca __ __ DEX
264d : e0 04 __ CPX #$04
264f : b0 ef __ BCS $2640 ; (screen_right_1.l6 + 0)
.s7:
2651 : a6 43 __ LDX T7 + 0 
2653 : bd fc c7 LDA $c7fc,x 
2656 : 8d 00 cc STA $cc00 
2659 : bd fd c7 LDA $c7fd,x 
265c : 8d 01 cc STA $cc01 
265f : bd fe c7 LDA $c7fe,x 
2662 : 8d 02 cc STA $cc02 
2665 : bd ff c7 LDA $c7ff,x 
2668 : 8d 03 cc STA $cc03 
266b : bd fc c3 LDA $c3fc,x 
266e : 8d 00 d8 STA $d800 
2671 : bd fd c3 LDA $c3fd,x 
2674 : 8d 01 d8 STA $d801 
2677 : bd fe c3 LDA $c3fe,x 
267a : 8d 02 d8 STA $d802 
267d : bd ff c3 LDA $c3ff,x 
2680 : 8d 03 d8 STA $d803 
2683 : a0 27 __ LDY #$27
.l8:
2685 : b9 24 cc LDA $cc24,y 
2688 : 99 28 cc STA $cc28,y 
268b : b9 24 d8 LDA $d824,y 
268e : 99 28 d8 STA $d828,y 
2691 : 88 __ __ DEY
2692 : c0 04 __ CPY #$04
2694 : b0 ef __ BCS $2685 ; (screen_right_1.l8 + 0)
.s9:
2696 : bd 24 c8 LDA $c824,x 
2699 : 8d 28 cc STA $cc28 
269c : bd 25 c8 LDA $c825,x 
269f : 8d 29 cc STA $cc29 
26a2 : bd 26 c8 LDA $c826,x 
26a5 : 8d 2a cc STA $cc2a 
26a8 : bd 27 c8 LDA $c827,x 
26ab : 8d 2b cc STA $cc2b 
26ae : bd 24 c4 LDA $c424,x 
26b1 : 8d 28 d8 STA $d828 
26b4 : bd 25 c4 LDA $c425,x 
26b7 : 8d 29 d8 STA $d829 
26ba : bd 26 c4 LDA $c426,x 
26bd : 8d 2a d8 STA $d82a 
26c0 : bd 27 c4 LDA $c427,x 
26c3 : 8d 2b d8 STA $d82b 
26c6 : a0 27 __ LDY #$27
.l10:
26c8 : b9 4c cc LDA $cc4c,y 
26cb : 99 50 cc STA $cc50,y 
26ce : b9 4c d8 LDA $d84c,y 
26d1 : 99 50 d8 STA $d850,y 
26d4 : 88 __ __ DEY
26d5 : c0 04 __ CPY #$04
26d7 : b0 ef __ BCS $26c8 ; (screen_right_1.l10 + 0)
.s11:
26d9 : bd 4c c8 LDA $c84c,x 
26dc : 8d 50 cc STA $cc50 
26df : bd 4d c8 LDA $c84d,x 
26e2 : 8d 51 cc STA $cc51 
26e5 : bd 4e c8 LDA $c84e,x 
26e8 : 8d 52 cc STA $cc52 
26eb : bd 4f c8 LDA $c84f,x 
26ee : 8d 53 cc STA $cc53 
26f1 : bd 4c c4 LDA $c44c,x 
26f4 : 8d 50 d8 STA $d850 
26f7 : bd 4d c4 LDA $c44d,x 
26fa : 8d 51 d8 STA $d851 
26fd : bd 4e c4 LDA $c44e,x 
2700 : 8d 52 d8 STA $d852 
2703 : bd 4f c4 LDA $c44f,x 
2706 : 8d 53 d8 STA $d853 
2709 : a0 27 __ LDY #$27
.l12:
270b : b9 74 cc LDA $cc74,y 
270e : 99 78 cc STA $cc78,y 
2711 : b9 74 d8 LDA $d874,y 
2714 : 99 78 d8 STA $d878,y 
2717 : 88 __ __ DEY
2718 : c0 04 __ CPY #$04
271a : b0 ef __ BCS $270b ; (screen_right_1.l12 + 0)
.s13:
271c : bd 74 c8 LDA $c874,x 
271f : 8d 78 cc STA $cc78 
2722 : bd 75 c8 LDA $c875,x 
2725 : 8d 79 cc STA $cc79 
2728 : bd 76 c8 LDA $c876,x 
272b : 8d 7a cc STA $cc7a 
272e : bd 77 c8 LDA $c877,x 
2731 : 8d 7b cc STA $cc7b 
2734 : bd 74 c4 LDA $c474,x 
2737 : 8d 78 d8 STA $d878 
273a : bd 75 c4 LDA $c475,x 
273d : 8d 79 d8 STA $d879 
2740 : bd 76 c4 LDA $c476,x 
2743 : 8d 7a d8 STA $d87a 
2746 : bd 77 c4 LDA $c477,x 
2749 : 8d 7b d8 STA $d87b 
274c : a0 27 __ LDY #$27
.l14:
274e : b9 9c cc LDA $cc9c,y 
2751 : 99 a0 cc STA $cca0,y 
2754 : b9 9c d8 LDA $d89c,y 
2757 : 99 a0 d8 STA $d8a0,y 
275a : 88 __ __ DEY
275b : c0 04 __ CPY #$04
275d : b0 ef __ BCS $274e ; (screen_right_1.l14 + 0)
.s15:
275f : bd 9c c8 LDA $c89c,x 
2762 : 8d a0 cc STA $cca0 
2765 : bd 9d c8 LDA $c89d,x 
2768 : 8d a1 cc STA $cca1 
276b : bd 9e c8 LDA $c89e,x 
276e : 8d a2 cc STA $cca2 
2771 : bd 9f c8 LDA $c89f,x 
2774 : 8d a3 cc STA $cca3 
2777 : bd 9c c4 LDA $c49c,x 
277a : 8d a0 d8 STA $d8a0 
277d : bd 9d c4 LDA $c49d,x 
2780 : 8d a1 d8 STA $d8a1 
2783 : bd 9e c4 LDA $c49e,x 
2786 : 8d a2 d8 STA $d8a2 
2789 : bd 9f c4 LDA $c49f,x 
278c : 8d a3 d8 STA $d8a3 
278f : a0 27 __ LDY #$27
.l16:
2791 : b9 c4 cc LDA $ccc4,y 
2794 : 99 c8 cc STA $ccc8,y 
2797 : b9 c4 d8 LDA $d8c4,y 
279a : 99 c8 d8 STA $d8c8,y 
279d : 88 __ __ DEY
279e : c0 04 __ CPY #$04
27a0 : b0 ef __ BCS $2791 ; (screen_right_1.l16 + 0)
.s17:
27a2 : bd c4 c8 LDA $c8c4,x 
27a5 : 8d c8 cc STA $ccc8 
27a8 : bd c5 c8 LDA $c8c5,x 
27ab : 8d c9 cc STA $ccc9 
27ae : bd c6 c8 LDA $c8c6,x 
27b1 : 8d ca cc STA $ccca 
27b4 : bd c7 c8 LDA $c8c7,x 
27b7 : 8d cb cc STA $cccb 
27ba : bd c4 c4 LDA $c4c4,x 
27bd : 8d c8 d8 STA $d8c8 
27c0 : bd c5 c4 LDA $c4c5,x 
27c3 : 8d c9 d8 STA $d8c9 
27c6 : bd c6 c4 LDA $c4c6,x 
27c9 : 8d ca d8 STA $d8ca 
27cc : bd c7 c4 LDA $c4c7,x 
27cf : 8d cb d8 STA $d8cb 
27d2 : a0 27 __ LDY #$27
.l18:
27d4 : b9 ec cc LDA $ccec,y 
27d7 : 99 f0 cc STA $ccf0,y 
27da : b9 ec d8 LDA $d8ec,y 
27dd : 99 f0 d8 STA $d8f0,y 
27e0 : 88 __ __ DEY
27e1 : c0 04 __ CPY #$04
27e3 : b0 ef __ BCS $27d4 ; (screen_right_1.l18 + 0)
.s19:
27e5 : bd ec c8 LDA $c8ec,x 
27e8 : 8d f0 cc STA $ccf0 
27eb : bd ed c8 LDA $c8ed,x 
27ee : 8d f1 cc STA $ccf1 
27f1 : bd ee c8 LDA $c8ee,x 
27f4 : 8d f2 cc STA $ccf2 
27f7 : bd ef c8 LDA $c8ef,x 
27fa : 8d f3 cc STA $ccf3 
27fd : bd ec c4 LDA $c4ec,x 
2800 : 8d f0 d8 STA $d8f0 
2803 : bd ed c4 LDA $c4ed,x 
2806 : 8d f1 d8 STA $d8f1 
2809 : bd ee c4 LDA $c4ee,x 
280c : 8d f2 d8 STA $d8f2 
280f : bd ef c4 LDA $c4ef,x 
2812 : 8d f3 d8 STA $d8f3 
2815 : a0 27 __ LDY #$27
.l20:
2817 : b9 14 cd LDA $cd14,y 
281a : 99 18 cd STA $cd18,y 
281d : b9 14 d9 LDA $d914,y 
2820 : 99 18 d9 STA $d918,y 
2823 : 88 __ __ DEY
2824 : c0 04 __ CPY #$04
2826 : b0 ef __ BCS $2817 ; (screen_right_1.l20 + 0)
.s21:
2828 : bd 14 c9 LDA $c914,x 
282b : 8d 18 cd STA $cd18 
282e : bd 15 c9 LDA $c915,x 
2831 : 8d 19 cd STA $cd19 
2834 : bd 16 c9 LDA $c916,x 
2837 : 8d 1a cd STA $cd1a 
283a : bd 17 c9 LDA $c917,x 
283d : 8d 1b cd STA $cd1b 
2840 : bd 14 c5 LDA $c514,x 
2843 : 8d 18 d9 STA $d918 
2846 : bd 15 c5 LDA $c515,x 
2849 : 8d 19 d9 STA $d919 
284c : bd 16 c5 LDA $c516,x 
284f : 8d 1a d9 STA $d91a 
2852 : bd 17 c5 LDA $c517,x 
2855 : 8d 1b d9 STA $d91b 
2858 : a0 27 __ LDY #$27
.l22:
285a : b9 3c cd LDA $cd3c,y 
285d : 99 40 cd STA $cd40,y 
2860 : b9 3c d9 LDA $d93c,y 
2863 : 99 40 d9 STA $d940,y 
2866 : 88 __ __ DEY
2867 : c0 04 __ CPY #$04
2869 : b0 ef __ BCS $285a ; (screen_right_1.l22 + 0)
.s23:
286b : bd 3c c9 LDA $c93c,x 
286e : 8d 40 cd STA $cd40 
2871 : bd 3d c9 LDA $c93d,x 
2874 : 8d 41 cd STA $cd41 
2877 : bd 3e c9 LDA $c93e,x 
287a : 8d 42 cd STA $cd42 
287d : bd 3f c9 LDA $c93f,x 
2880 : 8d 43 cd STA $cd43 
2883 : bd 3c c5 LDA $c53c,x 
2886 : 8d 40 d9 STA $d940 
2889 : bd 3d c5 LDA $c53d,x 
288c : 8d 41 d9 STA $d941 
288f : bd 3e c5 LDA $c53e,x 
2892 : 8d 42 d9 STA $d942 
2895 : bd 3f c5 LDA $c53f,x 
2898 : 8d 43 d9 STA $d943 
289b : a0 27 __ LDY #$27
.l24:
289d : b9 64 cd LDA $cd64,y 
28a0 : 99 68 cd STA $cd68,y 
28a3 : b9 64 d9 LDA $d964,y 
28a6 : 99 68 d9 STA $d968,y 
28a9 : 88 __ __ DEY
28aa : c0 04 __ CPY #$04
28ac : b0 ef __ BCS $289d ; (screen_right_1.l24 + 0)
.s25:
28ae : bd 64 c9 LDA $c964,x 
28b1 : 8d 68 cd STA $cd68 
28b4 : bd 65 c9 LDA $c965,x 
28b7 : 8d 69 cd STA $cd69 
28ba : bd 66 c9 LDA $c966,x 
28bd : 8d 6a cd STA $cd6a 
28c0 : bd 67 c9 LDA $c967,x 
28c3 : 8d 6b cd STA $cd6b 
28c6 : bd 64 c5 LDA $c564,x 
28c9 : 8d 68 d9 STA $d968 
28cc : bd 65 c5 LDA $c565,x 
28cf : 8d 69 d9 STA $d969 
28d2 : bd 66 c5 LDA $c566,x 
28d5 : 8d 6a d9 STA $d96a 
28d8 : bd 67 c5 LDA $c567,x 
28db : 8d 6b d9 STA $d96b 
28de : a0 27 __ LDY #$27
.l26:
28e0 : b9 8c cd LDA $cd8c,y 
28e3 : 99 90 cd STA $cd90,y 
28e6 : b9 8c d9 LDA $d98c,y 
28e9 : 99 90 d9 STA $d990,y 
28ec : 88 __ __ DEY
28ed : c0 04 __ CPY #$04
28ef : b0 ef __ BCS $28e0 ; (screen_right_1.l26 + 0)
.s27:
28f1 : bd 8c c9 LDA $c98c,x 
28f4 : 8d 90 cd STA $cd90 
28f7 : bd 8d c9 LDA $c98d,x 
28fa : 8d 91 cd STA $cd91 
28fd : bd 8e c9 LDA $c98e,x 
2900 : 8d 92 cd STA $cd92 
2903 : bd 8f c9 LDA $c98f,x 
2906 : 8d 93 cd STA $cd93 
2909 : bd 8c c5 LDA $c58c,x 
290c : 8d 90 d9 STA $d990 
290f : bd 8d c5 LDA $c58d,x 
2912 : 8d 91 d9 STA $d991 
2915 : bd 8e c5 LDA $c58e,x 
2918 : 8d 92 d9 STA $d992 
291b : bd 8f c5 LDA $c58f,x 
291e : 8d 93 d9 STA $d993 
2921 : a0 27 __ LDY #$27
.l28:
2923 : b9 b4 cd LDA $cdb4,y 
2926 : 99 b8 cd STA $cdb8,y 
2929 : b9 b4 d9 LDA $d9b4,y 
292c : 99 b8 d9 STA $d9b8,y 
292f : 88 __ __ DEY
2930 : c0 04 __ CPY #$04
2932 : b0 ef __ BCS $2923 ; (screen_right_1.l28 + 0)
.s29:
2934 : bd b4 c9 LDA $c9b4,x 
2937 : 8d b8 cd STA $cdb8 
293a : bd b5 c9 LDA $c9b5,x 
293d : 8d b9 cd STA $cdb9 
2940 : bd b6 c9 LDA $c9b6,x 
2943 : 8d ba cd STA $cdba 
2946 : bd b7 c9 LDA $c9b7,x 
2949 : 8d bb cd STA $cdbb 
294c : bd b4 c5 LDA $c5b4,x 
294f : 8d b8 d9 STA $d9b8 
2952 : bd b5 c5 LDA $c5b5,x 
2955 : 8d b9 d9 STA $d9b9 
2958 : bd b6 c5 LDA $c5b6,x 
295b : 8d ba d9 STA $d9ba 
295e : bd b7 c5 LDA $c5b7,x 
2961 : 8d bb d9 STA $d9bb 
2964 : a0 27 __ LDY #$27
.l30:
2966 : b9 dc cd LDA $cddc,y 
2969 : 99 e0 cd STA $cde0,y 
296c : b9 dc d9 LDA $d9dc,y 
296f : 99 e0 d9 STA $d9e0,y 
2972 : 88 __ __ DEY
2973 : c0 04 __ CPY #$04
2975 : b0 ef __ BCS $2966 ; (screen_right_1.l30 + 0)
.s31:
2977 : bd dc c9 LDA $c9dc,x 
297a : 8d e0 cd STA $cde0 
297d : bd dd c9 LDA $c9dd,x 
2980 : 8d e1 cd STA $cde1 
2983 : bd de c9 LDA $c9de,x 
2986 : 8d e2 cd STA $cde2 
2989 : bd df c9 LDA $c9df,x 
298c : 8d e3 cd STA $cde3 
298f : bd dc c5 LDA $c5dc,x 
2992 : 8d e0 d9 STA $d9e0 
2995 : bd dd c5 LDA $c5dd,x 
2998 : 8d e1 d9 STA $d9e1 
299b : bd de c5 LDA $c5de,x 
299e : 8d e2 d9 STA $d9e2 
29a1 : bd df c5 LDA $c5df,x 
29a4 : 8d e3 d9 STA $d9e3 
29a7 : a0 27 __ LDY #$27
.l32:
29a9 : b9 04 ce LDA $ce04,y 
29ac : 99 08 ce STA $ce08,y 
29af : b9 04 da LDA $da04,y 
29b2 : 99 08 da STA $da08,y 
29b5 : 88 __ __ DEY
29b6 : c0 04 __ CPY #$04
29b8 : b0 ef __ BCS $29a9 ; (screen_right_1.l32 + 0)
.s33:
29ba : bd 04 ca LDA $ca04,x 
29bd : 8d 08 ce STA $ce08 
29c0 : bd 05 ca LDA $ca05,x 
29c3 : 8d 09 ce STA $ce09 
29c6 : bd 06 ca LDA $ca06,x 
29c9 : 8d 0a ce STA $ce0a 
29cc : bd 07 ca LDA $ca07,x 
29cf : 8d 0b ce STA $ce0b 
29d2 : bd 04 c6 LDA $c604,x 
29d5 : 8d 08 da STA $da08 
29d8 : bd 05 c6 LDA $c605,x 
29db : 8d 09 da STA $da09 
29de : bd 06 c6 LDA $c606,x 
29e1 : 8d 0a da STA $da0a 
29e4 : bd 07 c6 LDA $c607,x 
29e7 : 8d 0b da STA $da0b 
29ea : a0 27 __ LDY #$27
.l34:
29ec : b9 2c ce LDA $ce2c,y 
29ef : 99 30 ce STA $ce30,y 
29f2 : b9 2c da LDA $da2c,y 
29f5 : 99 30 da STA $da30,y 
29f8 : 88 __ __ DEY
29f9 : c0 04 __ CPY #$04
29fb : b0 ef __ BCS $29ec ; (screen_right_1.l34 + 0)
.s35:
29fd : bd 2c ca LDA $ca2c,x 
2a00 : 8d 30 ce STA $ce30 
2a03 : bd 2d ca LDA $ca2d,x 
2a06 : 8d 31 ce STA $ce31 
2a09 : bd 2e ca LDA $ca2e,x 
2a0c : 8d 32 ce STA $ce32 
2a0f : bd 2f ca LDA $ca2f,x 
2a12 : 8d 33 ce STA $ce33 
2a15 : bd 2c c6 LDA $c62c,x 
2a18 : 8d 30 da STA $da30 
2a1b : bd 2d c6 LDA $c62d,x 
2a1e : 8d 31 da STA $da31 
2a21 : bd 2e c6 LDA $c62e,x 
2a24 : 8d 32 da STA $da32 
2a27 : bd 2f c6 LDA $c62f,x 
2a2a : 8d 33 da STA $da33 
2a2d : a0 27 __ LDY #$27
.l36:
2a2f : b9 54 ce LDA $ce54,y 
2a32 : 99 58 ce STA $ce58,y 
2a35 : b9 54 da LDA $da54,y 
2a38 : 99 58 da STA $da58,y 
2a3b : 88 __ __ DEY
2a3c : c0 04 __ CPY #$04
2a3e : b0 ef __ BCS $2a2f ; (screen_right_1.l36 + 0)
.s37:
2a40 : bd 54 ca LDA $ca54,x 
2a43 : 8d 58 ce STA $ce58 
2a46 : bd 55 ca LDA $ca55,x 
2a49 : 8d 59 ce STA $ce59 
2a4c : bd 56 ca LDA $ca56,x 
2a4f : 8d 5a ce STA $ce5a 
2a52 : bd 57 ca LDA $ca57,x 
2a55 : 8d 5b ce STA $ce5b 
2a58 : bd 54 c6 LDA $c654,x 
2a5b : 8d 58 da STA $da58 
2a5e : bd 55 c6 LDA $c655,x 
2a61 : 8d 59 da STA $da59 
2a64 : bd 56 c6 LDA $c656,x 
2a67 : 8d 5a da STA $da5a 
2a6a : bd 57 c6 LDA $c657,x 
2a6d : 8d 5b da STA $da5b 
2a70 : a0 27 __ LDY #$27
.l38:
2a72 : b9 7c ce LDA $ce7c,y 
2a75 : 99 80 ce STA $ce80,y 
2a78 : b9 7c da LDA $da7c,y 
2a7b : 99 80 da STA $da80,y 
2a7e : 88 __ __ DEY
2a7f : c0 04 __ CPY #$04
2a81 : b0 ef __ BCS $2a72 ; (screen_right_1.l38 + 0)
.s39:
2a83 : bd 7c ca LDA $ca7c,x 
2a86 : 8d 80 ce STA $ce80 
2a89 : bd 7d ca LDA $ca7d,x 
2a8c : 8d 81 ce STA $ce81 
2a8f : bd 7e ca LDA $ca7e,x 
2a92 : 8d 82 ce STA $ce82 
2a95 : bd 7f ca LDA $ca7f,x 
2a98 : 8d 83 ce STA $ce83 
2a9b : bd 7c c6 LDA $c67c,x 
2a9e : 8d 80 da STA $da80 
2aa1 : bd 7d c6 LDA $c67d,x 
2aa4 : 8d 81 da STA $da81 
2aa7 : bd 7e c6 LDA $c67e,x 
2aaa : 8d 82 da STA $da82 
2aad : bd 7f c6 LDA $c67f,x 
2ab0 : 8d 83 da STA $da83 
2ab3 : a0 27 __ LDY #$27
.l40:
2ab5 : b9 a4 ce LDA $cea4,y 
2ab8 : 99 a8 ce STA $cea8,y 
2abb : b9 a4 da LDA $daa4,y 
2abe : 99 a8 da STA $daa8,y 
2ac1 : 88 __ __ DEY
2ac2 : c0 04 __ CPY #$04
2ac4 : b0 ef __ BCS $2ab5 ; (screen_right_1.l40 + 0)
.s41:
2ac6 : bd a4 ca LDA $caa4,x 
2ac9 : 8d a8 ce STA $cea8 
2acc : bd a5 ca LDA $caa5,x 
2acf : 8d a9 ce STA $cea9 
2ad2 : bd a6 ca LDA $caa6,x 
2ad5 : 8d aa ce STA $ceaa 
2ad8 : bd a7 ca LDA $caa7,x 
2adb : 8d ab ce STA $ceab 
2ade : bd a4 c6 LDA $c6a4,x 
2ae1 : 8d a8 da STA $daa8 
2ae4 : bd a5 c6 LDA $c6a5,x 
2ae7 : 8d a9 da STA $daa9 
2aea : bd a6 c6 LDA $c6a6,x 
2aed : 8d aa da STA $daaa 
2af0 : bd a7 c6 LDA $c6a7,x 
2af3 : 8d ab da STA $daab 
2af6 : a0 27 __ LDY #$27
.l42:
2af8 : b9 cc ce LDA $cecc,y 
2afb : 99 d0 ce STA $ced0,y 
2afe : b9 cc da LDA $dacc,y 
2b01 : 99 d0 da STA $dad0,y 
2b04 : 88 __ __ DEY
2b05 : c0 04 __ CPY #$04
2b07 : b0 ef __ BCS $2af8 ; (screen_right_1.l42 + 0)
.s43:
2b09 : bd cc ca LDA $cacc,x 
2b0c : 8d d0 ce STA $ced0 
2b0f : bd cd ca LDA $cacd,x 
2b12 : 8d d1 ce STA $ced1 
2b15 : bd ce ca LDA $cace,x 
2b18 : 8d d2 ce STA $ced2 
2b1b : bd cf ca LDA $cacf,x 
2b1e : 8d d3 ce STA $ced3 
2b21 : bd cc c6 LDA $c6cc,x 
2b24 : 8d d0 da STA $dad0 
2b27 : bd cd c6 LDA $c6cd,x 
2b2a : 8d d1 da STA $dad1 
2b2d : bd ce c6 LDA $c6ce,x 
2b30 : 8d d2 da STA $dad2 
2b33 : bd cf c6 LDA $c6cf,x 
2b36 : 8d d3 da STA $dad3 
2b39 : a0 27 __ LDY #$27
.l44:
2b3b : b9 f4 ce LDA $cef4,y 
2b3e : 99 f8 ce STA $cef8,y 
2b41 : b9 f4 da LDA $daf4,y 
2b44 : 99 f8 da STA $daf8,y 
2b47 : 88 __ __ DEY
2b48 : c0 04 __ CPY #$04
2b4a : b0 ef __ BCS $2b3b ; (screen_right_1.l44 + 0)
.s45:
2b4c : bd f4 ca LDA $caf4,x 
2b4f : 8d f8 ce STA $cef8 
2b52 : bd f5 ca LDA $caf5,x 
2b55 : 8d f9 ce STA $cef9 
2b58 : bd f6 ca LDA $caf6,x 
2b5b : 8d fa ce STA $cefa 
2b5e : bd f7 ca LDA $caf7,x 
2b61 : 8d fb ce STA $cefb 
2b64 : bd f4 c6 LDA $c6f4,x 
2b67 : 8d f8 da STA $daf8 
2b6a : bd f5 c6 LDA $c6f5,x 
2b6d : 8d f9 da STA $daf9 
2b70 : bd f6 c6 LDA $c6f6,x 
2b73 : 8d fa da STA $dafa 
2b76 : bd f7 c6 LDA $c6f7,x 
2b79 : 8d fb da STA $dafb 
2b7c : a0 27 __ LDY #$27
.l46:
2b7e : b9 1c cf LDA $cf1c,y 
2b81 : 99 20 cf STA $cf20,y 
2b84 : b9 1c db LDA $db1c,y 
2b87 : 99 20 db STA $db20,y 
2b8a : 88 __ __ DEY
2b8b : c0 04 __ CPY #$04
2b8d : b0 ef __ BCS $2b7e ; (screen_right_1.l46 + 0)
.s47:
2b8f : bd 1c cb LDA $cb1c,x 
2b92 : 8d 20 cf STA $cf20 
2b95 : bd 1d cb LDA $cb1d,x 
2b98 : 8d 21 cf STA $cf21 
2b9b : bd 1e cb LDA $cb1e,x 
2b9e : 8d 22 cf STA $cf22 
2ba1 : bd 1f cb LDA $cb1f,x 
2ba4 : 8d 23 cf STA $cf23 
2ba7 : bd 1c c7 LDA $c71c,x 
2baa : 8d 20 db STA $db20 
2bad : bd 1d c7 LDA $c71d,x 
2bb0 : 8d 21 db STA $db21 
2bb3 : bd 1e c7 LDA $c71e,x 
2bb6 : 8d 22 db STA $db22 
2bb9 : bd 1f c7 LDA $c71f,x 
2bbc : 8d 23 db STA $db23 
2bbf : a0 27 __ LDY #$27
.l48:
2bc1 : b9 44 cf LDA $cf44,y 
2bc4 : 99 48 cf STA $cf48,y 
2bc7 : b9 44 db LDA $db44,y 
2bca : 99 48 db STA $db48,y 
2bcd : 88 __ __ DEY
2bce : c0 04 __ CPY #$04
2bd0 : b0 ef __ BCS $2bc1 ; (screen_right_1.l48 + 0)
.s49:
2bd2 : bd 44 cb LDA $cb44,x 
2bd5 : 8d 48 cf STA $cf48 
2bd8 : bd 45 cb LDA $cb45,x 
2bdb : 8d 49 cf STA $cf49 
2bde : bd 46 cb LDA $cb46,x 
2be1 : 8d 4a cf STA $cf4a 
2be4 : bd 47 cb LDA $cb47,x 
2be7 : 8d 4b cf STA $cf4b 
2bea : bd 44 c7 LDA $c744,x 
2bed : 8d 48 db STA $db48 
2bf0 : bd 45 c7 LDA $c745,x 
2bf3 : 8d 49 db STA $db49 
2bf6 : bd 46 c7 LDA $c746,x 
2bf9 : 8d 4a db STA $db4a 
2bfc : bd 47 c7 LDA $c747,x 
2bff : 8d 4b db STA $db4b 
2c02 : a0 27 __ LDY #$27
.l50:
2c04 : b9 6c cf LDA $cf6c,y 
2c07 : 99 70 cf STA $cf70,y 
2c0a : b9 6c db LDA $db6c,y 
2c0d : 99 70 db STA $db70,y 
2c10 : 88 __ __ DEY
2c11 : c0 04 __ CPY #$04
2c13 : b0 ef __ BCS $2c04 ; (screen_right_1.l50 + 0)
.s51:
2c15 : bd 6c cb LDA $cb6c,x 
2c18 : 8d 70 cf STA $cf70 
2c1b : bd 6d cb LDA $cb6d,x 
2c1e : 8d 71 cf STA $cf71 
2c21 : bd 6e cb LDA $cb6e,x 
2c24 : 8d 72 cf STA $cf72 
2c27 : bd 6f cb LDA $cb6f,x 
2c2a : 8d 73 cf STA $cf73 
2c2d : bd 6c c7 LDA $c76c,x 
2c30 : 8d 70 db STA $db70 
2c33 : bd 6d c7 LDA $c76d,x 
2c36 : 8d 71 db STA $db71 
2c39 : bd 6e c7 LDA $c76e,x 
2c3c : 8d 72 db STA $db72 
2c3f : bd 6f c7 LDA $c76f,x 
2c42 : 8d 73 db STA $db73 
2c45 : a0 27 __ LDY #$27
.l52:
2c47 : b9 94 cf LDA $cf94,y 
2c4a : 99 98 cf STA $cf98,y 
2c4d : b9 94 db LDA $db94,y 
2c50 : 99 98 db STA $db98,y 
2c53 : 88 __ __ DEY
2c54 : c0 04 __ CPY #$04
2c56 : b0 ef __ BCS $2c47 ; (screen_right_1.l52 + 0)
.s53:
2c58 : bd 94 cb LDA $cb94,x 
2c5b : 8d 98 cf STA $cf98 
2c5e : bd 95 cb LDA $cb95,x 
2c61 : 8d 99 cf STA $cf99 
2c64 : bd 96 cb LDA $cb96,x 
2c67 : 8d 9a cf STA $cf9a 
2c6a : bd 97 cb LDA $cb97,x 
2c6d : 8d 9b cf STA $cf9b 
2c70 : bd 94 c7 LDA $c794,x 
2c73 : 8d 98 db STA $db98 
2c76 : bd 95 c7 LDA $c795,x 
2c79 : 8d 99 db STA $db99 
2c7c : bd 96 c7 LDA $c796,x 
2c7f : 8d 9a db STA $db9a 
2c82 : bd 97 c7 LDA $c797,x 
2c85 : 8d 9b db STA $db9b 
2c88 : a0 27 __ LDY #$27
.l54:
2c8a : b9 bc cf LDA $cfbc,y 
2c8d : 99 c0 cf STA $cfc0,y 
2c90 : b9 bc db LDA $dbbc,y 
2c93 : 99 c0 db STA $dbc0,y 
2c96 : 88 __ __ DEY
2c97 : c0 04 __ CPY #$04
2c99 : b0 ef __ BCS $2c8a ; (screen_right_1.l54 + 0)
.s55:
2c9b : bd bc cb LDA $cbbc,x 
2c9e : 8d c0 cf STA $cfc0 
2ca1 : bd bd cb LDA $cbbd,x 
2ca4 : 8d c1 cf STA $cfc1 
2ca7 : bd be cb LDA $cbbe,x 
2caa : 8d c2 cf STA $cfc2 
2cad : bd bf cb LDA $cbbf,x 
2cb0 : 8d c3 cf STA $cfc3 
2cb3 : bd bc c7 LDA $c7bc,x 
2cb6 : 8d c0 db STA $dbc0 
2cb9 : bd bd c7 LDA $c7bd,x 
2cbc : 8d c1 db STA $dbc1 
2cbf : bd be c7 LDA $c7be,x 
2cc2 : 8d c2 db STA $dbc2 
2cc5 : bd bf c7 LDA $c7bf,x 
2cc8 : 8d c3 db STA $dbc3 
2ccb : 8a __ __ TXA
2ccc : e9 03 __ SBC #$03
2cce : f0 03 __ BEQ $2cd3 ; (screen_right_1.s3 + 0)
2cd0 : 4c 35 26 JMP $2635 ; (screen_right_1.l5 + 0)
.s3:
2cd3 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
2cd4 : a0 00 __ LDY #$00
2cd6 : 84 06 __ STY WORK + 3 
2cd8 : a5 03 __ LDA WORK + 0 
2cda : a6 04 __ LDX WORK + 1 
2cdc : f0 1c __ BEQ $2cfa ; (mul16 + 38)
2cde : 38 __ __ SEC
2cdf : 6a __ __ ROR
2ce0 : 90 0d __ BCC $2cef ; (mul16 + 27)
2ce2 : aa __ __ TAX
2ce3 : 18 __ __ CLC
2ce4 : 98 __ __ TYA
2ce5 : 65 1b __ ADC ACCU + 0 
2ce7 : a8 __ __ TAY
2ce8 : a5 06 __ LDA WORK + 3 
2cea : 65 1c __ ADC ACCU + 1 
2cec : 85 06 __ STA WORK + 3 
2cee : 8a __ __ TXA
2cef : 06 1b __ ASL ACCU + 0 
2cf1 : 26 1c __ ROL ACCU + 1 
2cf3 : 4a __ __ LSR
2cf4 : 90 f9 __ BCC $2cef ; (mul16 + 27)
2cf6 : d0 ea __ BNE $2ce2 ; (mul16 + 14)
2cf8 : a5 04 __ LDA WORK + 1 
2cfa : 4a __ __ LSR
2cfb : 90 0d __ BCC $2d0a ; (mul16 + 54)
2cfd : aa __ __ TAX
2cfe : 18 __ __ CLC
2cff : 98 __ __ TYA
2d00 : 65 1b __ ADC ACCU + 0 
2d02 : a8 __ __ TAY
2d03 : a5 06 __ LDA WORK + 3 
2d05 : 65 1c __ ADC ACCU + 1 
2d07 : 85 06 __ STA WORK + 3 
2d09 : 8a __ __ TXA
2d0a : 06 1b __ ASL ACCU + 0 
2d0c : 26 1c __ ROL ACCU + 1 
2d0e : 4a __ __ LSR
2d0f : b0 ec __ BCS $2cfd ; (mul16 + 41)
2d11 : d0 f7 __ BNE $2d0a ; (mul16 + 54)
2d13 : 84 05 __ STY WORK + 2 
2d15 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
2d16 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
charset:
2d17 : __ __ __ BYT 3c 66 6e 6e 60 62 3c 00 00 00 3c 06 3e 66 3e 00 : <fnn`b<...<.>f>.
2d27 : __ __ __ BYT 00 60 60 7c 66 66 7c 00 00 00 3c 60 60 60 3c 00 : .``|ff|...<```<.
2d37 : __ __ __ BYT 00 06 06 3e 66 66 3e 00 00 00 3c 66 7e 60 3c 00 : ...>ff>...<f~`<.
2d47 : __ __ __ BYT 00 0e 18 3e 18 18 18 00 00 00 3e 66 66 3e 06 7c : ...>......>ff>.|
2d57 : __ __ __ BYT 00 60 60 7c 66 66 66 00 00 18 00 38 18 18 3c 00 : .``|fff....8..<.
2d67 : __ __ __ BYT 00 06 00 06 06 06 06 3c 00 60 60 6c 78 6c 66 00 : .......<.``lxlf.
2d77 : __ __ __ BYT 00 38 18 18 18 18 3c 00 00 00 66 7f 7f 6b 63 00 : .8....<...f..kc.
2d87 : __ __ __ BYT 00 00 7c 66 66 66 66 00 00 00 3c 66 66 66 3c 00 : ..|ffff...<fff<.
2d97 : __ __ __ BYT 00 00 7c 66 66 7c 60 60 00 00 3e 66 66 3e 06 06 : ..|ff|``..>ff>..
2da7 : __ __ __ BYT 00 00 7c 66 60 60 60 00 00 00 3e 60 3c 06 7c 00 : ..|f```...>`<.|.
2db7 : __ __ __ BYT 00 18 7e 18 18 18 0e 00 00 00 66 66 66 66 3e 00 : ..~.......ffff>.
2dc7 : __ __ __ BYT 00 00 66 66 66 3c 18 00 00 00 63 6b 7f 3e 36 00 : ..fff<....ck.>6.
2dd7 : __ __ __ BYT 00 00 66 3c 18 3c 66 00 00 00 66 66 66 3e 0c 78 : ..f<.<f...fff>.x
2de7 : __ __ __ BYT 00 00 7e 0c 18 30 7e 00 3c 30 30 30 30 30 3c 00 : ..~..0~.<00000<.
2df7 : __ __ __ BYT 0c 12 30 7c 30 62 fc 00 3c 0c 0c 0c 0c 0c 3c 00 : ..0|0b..<.....<.
2e07 : __ __ __ BYT 00 18 3c 7e 18 18 18 18 00 10 30 7f 7f 30 10 00 : ..<~......0..0..
2e17 : __ __ __ BYT 00 00 00 00 00 00 00 00 18 18 18 18 00 00 18 00 : ................
2e27 : __ __ __ BYT 66 66 66 00 00 00 00 00 66 66 ff 66 ff 66 66 00 : fff.....ff.f.ff.
2e37 : __ __ __ BYT 18 3e 60 3c 06 7c 18 00 62 66 0c 18 30 66 46 00 : .>`<.|..bf..0fF.
2e47 : __ __ __ BYT 3c 66 3c 38 67 66 3f 00 06 0c 18 00 00 00 00 00 : <f<8gf?.........
2e57 : __ __ __ BYT 0c 18 30 30 30 18 0c 00 30 18 0c 0c 0c 18 30 00 : ..000...0.....0.
2e67 : __ __ __ BYT 00 66 3c ff 3c 66 00 00 00 18 18 7e 18 18 00 00 : .f<.<f.....~....
2e77 : __ __ __ BYT 00 00 00 00 00 18 18 30 00 00 00 7e 00 00 00 00 : .......0...~....
2e87 : __ __ __ BYT 00 00 00 00 00 18 18 00 00 03 06 0c 18 30 60 00 : .............0`.
2e97 : __ __ __ BYT 3c 66 6e 76 66 66 3c 00 18 18 38 18 18 18 7e 00 : <fnvff<...8...~.
2ea7 : __ __ __ BYT 3c 66 06 0c 30 60 7e 00 3c 66 06 1c 06 66 3c 00 : <f..0`~.<f...f<.
2eb7 : __ __ __ BYT 06 0e 1e 66 7f 06 06 00 7e 60 7c 06 06 66 3c 00 : ...f....~`|..f<.
2ec7 : __ __ __ BYT 3c 66 60 7c 66 66 3c 00 7e 66 0c 18 18 18 18 00 : <f`|ff<.~f......
2ed7 : __ __ __ BYT 3c 66 66 3c 66 66 3c 00 3c 66 66 3e 06 66 3c 00 : <ff<ff<.<ff>.f<.
2ee7 : __ __ __ BYT 00 00 18 00 00 18 00 00 00 00 18 00 00 18 18 30 : ...............0
2ef7 : __ __ __ BYT 0e 18 30 60 30 18 0e 00 00 00 7e 00 7e 00 00 00 : ..0`0.....~.~...
2f07 : __ __ __ BYT 70 18 0c 06 0c 18 70 00 3c 66 06 0c 18 00 18 00 : p.....p.<f......
2f17 : __ __ __ BYT 00 00 00 ff ff 00 00 00 18 3c 66 7e 66 66 66 00 : .........<f~fff.
2f27 : __ __ __ BYT 7c 66 66 7c 66 66 7c 00 3c 66 60 60 60 66 3c 00 : |ff|ff|.<f```f<.
2f37 : __ __ __ BYT 78 6c 66 66 66 6c 78 00 7e 60 60 78 60 60 7e 00 : xlffflx.~``x``~.
2f47 : __ __ __ BYT 7e 60 60 78 60 60 60 00 3c 66 60 6e 66 66 3c 00 : ~``x```.<f`nff<.
2f57 : __ __ __ BYT 66 66 66 7e 66 66 66 00 3c 18 18 18 18 18 3c 00 : fff~fff.<.....<.
2f67 : __ __ __ BYT 1e 0c 0c 0c 0c 6c 38 00 66 6c 78 70 78 6c 66 00 : .....l8.flxpxlf.
2f77 : __ __ __ BYT 60 60 60 60 60 60 7e 00 63 77 7f 6b 63 63 63 00 : ``````~.cw.kccc.
2f87 : __ __ __ BYT 66 76 7e 7e 6e 66 66 00 3c 66 66 66 66 66 3c 00 : fv~~nff.<fffff<.
2f97 : __ __ __ BYT 7c 66 66 7c 60 60 60 00 3c 66 66 66 66 3c 0e 00 : |ff|```.<ffff<..
2fa7 : __ __ __ BYT 7c 66 66 7c 78 6c 66 00 3c 66 60 3c 06 66 3c 00 : |ff|xlf.<f`<.f<.
2fb7 : __ __ __ BYT 7e 18 18 18 18 18 18 00 66 66 66 66 66 66 3c 00 : ~.......ffffff<.
2fc7 : __ __ __ BYT 66 66 66 66 66 3c 18 00 63 63 63 6b 7f 77 63 00 : fffff<..ccck.wc.
2fd7 : __ __ __ BYT 66 66 3c 18 3c 66 66 00 66 66 66 3c 18 18 18 00 : ff<.<ff.fff<....
2fe7 : __ __ __ BYT 7e 06 0c 18 30 60 7e 00 18 18 18 ff ff 18 18 18 : ~...0`~.........
2ff7 : __ __ __ BYT c0 c0 30 30 c0 c0 30 30 18 18 18 18 18 18 18 18 : ..00..00........
3007 : __ __ __ BYT 33 33 cc cc 33 33 cc cc 33 99 cc 66 33 99 cc 66 : 33..33..3..f3..f
3017 : __ __ __ BYT ff ff ff ff ff ff ff ff 00 00 ff ff ff ff ff ff : ................
3027 : __ __ __ BYT 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 ff ff : ................
3037 : __ __ __ BYT f0 ff ff ff ff ff ff ff 00 00 f0 ff ff ff ff ff : ................
3047 : __ __ __ BYT 00 00 00 00 f0 ff ff ff 00 00 00 00 00 00 f0 ff : ................
3057 : __ __ __ BYT 00 00 00 00 00 00 0f ff 00 00 00 00 0f ff ff ff : ................
3067 : __ __ __ BYT 00 00 0f ff ff ff ff ff 0f ff ff ff ff ff ff ff : ................
3077 : __ __ __ BYT fe fe fe fe fe fe fe fe 00 00 fe fe fe fe fe fe : ................
3087 : __ __ __ BYT 00 00 00 00 fe fe fe fe 00 00 00 00 00 00 fe fe : ................
3097 : __ __ __ BYT 00 00 00 00 00 00 7f 7f 00 00 00 00 7f 7f 7f 7f : ................
30a7 : __ __ __ BYT 00 00 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f 7f : ................
30b7 : __ __ __ BYT f0 fe fe fe fe fe fe fe 00 00 f0 fe fe fe fe fe : ................
30c7 : __ __ __ BYT 00 00 00 00 f0 fe fe fe 00 00 00 00 00 00 f0 fe : ................
30d7 : __ __ __ BYT 00 00 00 00 00 00 0f 7f 00 00 00 00 0f 7f 7f 7f : ................
30e7 : __ __ __ BYT 00 00 0f 7f 7f 7f 7f 7f 0f 7f 7f 7f 7f 7f 7f 7f : ................
30f7 : __ __ __ BYT ff fe fc f8 f0 e0 c0 80 ff 7f 3f 1f 0f 07 03 01 : ..........?.....
3107 : __ __ __ BYT 00 00 00 00 00 00 00 00 ff ff 00 00 00 00 00 00 : ................
3117 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3127 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3137 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3147 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3157 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3167 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3177 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3187 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3197 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31a7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31b7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31c7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31d7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31e7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31f7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3207 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3217 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3227 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3237 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3247 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3257 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3267 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3277 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3287 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3297 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32a7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32b7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32c7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32d7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32e7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32f7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3307 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3317 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3327 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3337 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3347 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3357 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3367 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3377 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3387 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3397 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33a7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33b7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33c7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33d7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33e7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
33f7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3407 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3417 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3427 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3437 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3447 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3457 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3467 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3477 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3487 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3497 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34a7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34b7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34c7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34d7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34e7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
34f7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3507 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
dx:
3517 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
dy:
3518 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
px:
3519 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
py:
351a : __ __ __ BYT 03                                              : .
--------------------------------------------------------------------
maze:
351b : __ __ __ BYT b0 0f c1 0f d2 0f e3 0f f4 0f 05 10 16 10 27 10 : ..............'.
352b : __ __ __ BYT 38 10 49 10 5a 10 6b 10 7c 10 8d 10 9e 10 af 10 : 8.I.Z.k.|.......
--------------------------------------------------------------------
zxdist0:
353b : __ __ __ BYT 12 06 04 03 02 01 00                            : .......
--------------------------------------------------------------------
zxdist1:
3542 : __ __ __ BYT 09 05 03 02 01 00 00                            : .......
--------------------------------------------------------------------
rasterIRQRows:
3549 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
355a : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
356b : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
357c : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
357d : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
358d : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
359d : __ __ __ BSS	1
--------------------------------------------------------------------
center:
359e : __ __ __ BSS	32
--------------------------------------------------------------------
bottom:
35be : __ __ __ BSS	32
--------------------------------------------------------------------
FlipIndex:
35de : __ __ __ BSS	1
--------------------------------------------------------------------
DrawScreen:
35df : __ __ __ BSS	2
--------------------------------------------------------------------
joyy:
35e1 : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
35e3 : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
35e5 : __ __ __ BSS	2
