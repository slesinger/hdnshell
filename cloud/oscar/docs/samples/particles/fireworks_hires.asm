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
080e : 8e 1c 0d STX $0d1c ; (spentry + 0)
0811 : a2 0d __ LDX #$0d
0813 : a0 2f __ LDY #$2f
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 17 __ CPX #$17
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 66 __ CPY #$66
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 fe __ LDA #$fe
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 160, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0880 : a9 36 __ LDA #$36
0882 : 85 01 __ STA $01 
0884 : 20 d4 09 JSR $09d4 ; (mmap_trampoline.s4 + 0)
0887 : a9 00 __ LDA #$00
0889 : 85 0e __ STA P1 
088b : 85 10 __ STA P3 
088d : a9 35 __ LDA #$35
088f : 85 01 __ STA $01 
0891 : a9 03 __ LDA #$03
0893 : 85 0d __ STA P0 
0895 : a9 c8 __ LDA #$c8
0897 : 85 0f __ STA P2 
0899 : a9 e0 __ LDA #$e0
089b : 85 11 __ STA P4 
089d : 20 1e 0a JSR $0a1e ; (vic_setmode.s4 + 0)
08a0 : a9 00 __ LDA #$00
08a2 : 85 0d __ STA P0 
08a4 : 85 0f __ STA P2 
08a6 : a9 e0 __ LDA #$e0
08a8 : 85 0e __ STA P1 
08aa : a9 40 __ LDA #$40
08ac : 85 11 __ STA P4 
08ae : a9 1f __ LDA #$1f
08b0 : 85 12 __ STA P5 
08b2 : a9 10 __ LDA #$10
08b4 : a2 fa __ LDX #$fa
.l6:
08b6 : ca __ __ DEX
08b7 : 9d 00 c8 STA $c800,x 
08ba : 9d fa c8 STA $c8fa,x 
08bd : 9d f4 c9 STA $c9f4,x 
08c0 : 9d ee ca STA $caee,x 
08c3 : d0 f1 __ BNE $08b6 ; (main.l6 + 0)
.s5:
08c5 : 20 70 0a JSR $0a70 ; (memset.s4 + 0)
08c8 : a9 00 __ LDA #$00
08ca : 85 50 __ STA T3 + 0 
08cc : 8d 20 d0 STA $d020 
08cf : 8d 21 d0 STA $d021 
08d2 : 20 94 0a JSR $0a94 ; (particle_init.s4 + 0)
08d5 : a9 f0 __ LDA #$f0
08d7 : 85 4e __ STA T2 + 0 
08d9 : a9 d8 __ LDA #$d8
08db : 85 4f __ STA T2 + 1 
.l7:
08dd : 20 e3 0a JSR $0ae3 ; (particle_move.s4 + 0)
08e0 : a5 50 __ LDA T3 + 0 
08e2 : c9 19 __ CMP #$19
08e4 : b0 2d __ BCS $0913 ; (main.s8 + 0)
.s17:
08e6 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
08e9 : a5 1b __ LDA ACCU + 0 
08eb : 85 4c __ STA T1 + 0 
08ed : a5 1c __ LDA ACCU + 1 
08ef : 85 4d __ STA T1 + 1 
08f1 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
08f4 : 06 4c __ ASL T1 + 0 
08f6 : a9 01 __ LDA #$01
08f8 : 85 0e __ STA P1 
08fa : 26 4d __ ROL T1 + 1 
08fc : a9 00 __ LDA #$00
08fe : 85 0d __ STA P0 
0900 : 69 ff __ ADC #$ff
0902 : 49 ff __ EOR #$ff
0904 : 06 4c __ ASL T1 + 0 
0906 : 26 4d __ ROL T1 + 1 
0908 : 2a __ __ ROL
0909 : a6 4d __ LDX T1 + 1 
090b : 86 11 __ STX P4 
090d : 18 __ __ CLC
090e : 69 01 __ ADC #$01
0910 : 4c 7c 09 JMP $097c ; (main.s15 + 0)
.s8:
0913 : c9 32 __ CMP #$32
0915 : b0 3a __ BCS $0951 ; (main.s9 + 0)
.s16:
0917 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
091a : a5 1b __ LDA ACCU + 0 
091c : 85 4c __ STA T1 + 0 
091e : a5 1c __ LDA ACCU + 1 
0920 : 85 4d __ STA T1 + 1 
0922 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
0925 : 06 4c __ ASL T1 + 0 
0927 : a9 4f __ LDA #$4f
0929 : 85 0e __ STA P1 
092b : 26 4d __ ROL T1 + 1 
092d : a9 00 __ LDA #$00
092f : 85 0d __ STA P0 
0931 : 69 ff __ ADC #$ff
0933 : 49 ff __ EOR #$ff
0935 : 06 4c __ ASL T1 + 0 
0937 : 26 4d __ ROL T1 + 1 
0939 : 2a __ __ ROL
093a : a6 4d __ LDX T1 + 1 
093c : 86 4c __ STX T1 + 0 
093e : 18 __ __ CLC
093f : 69 01 __ ADC #$01
0941 : 85 4d __ STA T1 + 1 
0943 : 38 __ __ SEC
0944 : a9 00 __ LDA #$00
0946 : e5 4c __ SBC T1 + 0 
0948 : 85 11 __ STA P4 
094a : a9 00 __ LDA #$00
094c : e5 4d __ SBC T1 + 1 
094e : 4c 7c 09 JMP $097c ; (main.s15 + 0)
.s9:
0951 : c9 4b __ CMP #$4b
0953 : b0 61 __ BCS $09b6 ; (main.s10 + 0)
.s14:
0955 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
0958 : a5 1b __ LDA ACCU + 0 
095a : 85 4c __ STA T1 + 0 
095c : a5 1c __ LDA ACCU + 1 
095e : 85 4d __ STA T1 + 1 
0960 : 20 ae 0c JSR $0cae ; (rnorm.s4 + 0)
0963 : 06 4c __ ASL T1 + 0 
0965 : a9 28 __ LDA #$28
0967 : 85 0e __ STA P1 
0969 : 26 4d __ ROL T1 + 1 
096b : a9 00 __ LDA #$00
096d : 85 0d __ STA P0 
096f : 69 ff __ ADC #$ff
0971 : 49 ff __ EOR #$ff
0973 : 06 4c __ ASL T1 + 0 
0975 : 26 4d __ ROL T1 + 1 
0977 : 2a __ __ ROL
0978 : a6 4d __ LDX T1 + 1 
097a : 86 11 __ STX P4 
.s15:
097c : 85 12 __ STA P5 
097e : a5 1b __ LDA ACCU + 0 
0980 : 0a __ __ ASL
0981 : 85 4a __ STA T0 + 0 
0983 : a5 1c __ LDA ACCU + 1 
0985 : 2a __ __ ROL
0986 : 85 4b __ STA T0 + 1 
0988 : a9 00 __ LDA #$00
098a : 85 0f __ STA P2 
098c : 69 ff __ ADC #$ff
098e : 49 ff __ EOR #$ff
0990 : 06 4a __ ASL T0 + 0 
0992 : 26 4b __ ROL T0 + 1 
0994 : 2a __ __ ROL
0995 : aa __ __ TAX
0996 : a9 31 __ LDA #$31
0998 : 85 10 __ STA P3 
099a : 18 __ __ CLC
099b : a5 4b __ LDA T0 + 1 
099d : 69 80 __ ADC #$80
099f : 85 4a __ STA T0 + 0 
09a1 : 8a __ __ TXA
09a2 : 69 01 __ ADC #$01
09a4 : 85 4b __ STA T0 + 1 
09a6 : 38 __ __ SEC
09a7 : a9 00 __ LDA #$00
09a9 : e5 4a __ SBC T0 + 0 
09ab : 85 13 __ STA P6 
09ad : a9 00 __ LDA #$00
09af : e5 4b __ SBC T0 + 1 
09b1 : 85 14 __ STA P7 
09b3 : 20 53 0c JSR $0c53 ; (particle_add.s4 + 0)
.s10:
09b6 : e6 50 __ INC T3 + 0 
09b8 : a5 50 __ LDA T3 + 0 
09ba : c9 4b __ CMP #$4b
09bc : d0 04 __ BNE $09c2 ; (main.s11 + 0)
.s13:
09be : a9 00 __ LDA #$00
09c0 : 85 50 __ STA T3 + 0 
.s11:
09c2 : e6 4e __ INC T2 + 0 
09c4 : f0 03 __ BEQ $09c9 ; (main.s18 + 0)
09c6 : 4c dd 08 JMP $08dd ; (main.l7 + 0)
.s18:
09c9 : e6 4f __ INC T2 + 1 
09cb : d0 f9 __ BNE $09c6 ; (main.s11 + 4)
.s12:
09cd : a9 00 __ LDA #$00
09cf : 85 1b __ STA ACCU + 0 
09d1 : 85 1c __ STA ACCU + 1 
.s3:
09d3 : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
09d4 : a9 e9 __ LDA #$e9
09d6 : 8d fa ff STA $fffa 
09d9 : a9 09 __ LDA #$09
09db : 8d fb ff STA $fffb 
09de : a9 07 __ LDA #$07
09e0 : 8d fe ff STA $fffe 
09e3 : a9 0a __ LDA #$0a
09e5 : 8d ff ff STA $ffff 
.s3:
09e8 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
09e9 : 48 __ __ PHA
09ea : 8a __ __ TXA
09eb : 48 __ __ PHA
09ec : a9 0a __ LDA #$0a
09ee : 48 __ __ PHA
09ef : a9 00 __ LDA #$00
09f1 : 48 __ __ PHA
09f2 : ba __ __ TSX
09f3 : bd 05 01 LDA $0105,x 
09f6 : 48 __ __ PHA
09f7 : a6 01 __ LDX $01 
09f9 : a9 36 __ LDA #$36
09fb : 85 01 __ STA $01 
09fd : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0a00 : 86 01 __ STX $01 
0a02 : 68 __ __ PLA
0a03 : aa __ __ TAX
0a04 : 68 __ __ PLA
0a05 : 40 __ __ RTI
0a06 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0a07 : 48 __ __ PHA
0a08 : 8a __ __ TXA
0a09 : 48 __ __ PHA
0a0a : a9 0a __ LDA #$0a
0a0c : 48 __ __ PHA
0a0d : a9 00 __ LDA #$00
0a0f : 48 __ __ PHA
0a10 : ba __ __ TSX
0a11 : bd 05 01 LDA $0105,x 
0a14 : 48 __ __ PHA
0a15 : a6 01 __ LDX $01 
0a17 : a9 36 __ LDA #$36
0a19 : 85 01 __ STA $01 
0a1b : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a1e : a4 0d __ LDY P0 ; (mode + 0)
0a20 : c0 02 __ CPY #$02
0a22 : d0 09 __ BNE $0a2d ; (vic_setmode.s5 + 0)
.s10:
0a24 : a9 5b __ LDA #$5b
0a26 : 8d 11 d0 STA $d011 
.s8:
0a29 : a9 08 __ LDA #$08
0a2b : d0 0c __ BNE $0a39 ; (vic_setmode.s7 + 0)
.s5:
0a2d : b0 36 __ BCS $0a65 ; (vic_setmode.s6 + 0)
.s9:
0a2f : a9 1b __ LDA #$1b
0a31 : 8d 11 d0 STA $d011 
0a34 : 98 __ __ TYA
0a35 : f0 f2 __ BEQ $0a29 ; (vic_setmode.s8 + 0)
.s11:
0a37 : a9 18 __ LDA #$18
.s7:
0a39 : 8d 16 d0 STA $d016 
0a3c : ad 00 dd LDA $dd00 
0a3f : 29 fc __ AND #$fc
0a41 : 85 1b __ STA ACCU + 0 
0a43 : a5 0f __ LDA P2 ; (text + 1)
0a45 : 0a __ __ ASL
0a46 : 2a __ __ ROL
0a47 : 29 01 __ AND #$01
0a49 : 2a __ __ ROL
0a4a : 49 03 __ EOR #$03
0a4c : 05 1b __ ORA ACCU + 0 
0a4e : 8d 00 dd STA $dd00 
0a51 : a5 0f __ LDA P2 ; (text + 1)
0a53 : 29 3c __ AND #$3c
0a55 : 0a __ __ ASL
0a56 : 0a __ __ ASL
0a57 : 85 1b __ STA ACCU + 0 
0a59 : a5 11 __ LDA P4 ; (font + 1)
0a5b : 29 38 __ AND #$38
0a5d : 4a __ __ LSR
0a5e : 4a __ __ LSR
0a5f : 05 1b __ ORA ACCU + 0 
0a61 : 8d 18 d0 STA $d018 
.s3:
0a64 : 60 __ __ RTS
.s6:
0a65 : a9 3b __ LDA #$3b
0a67 : 8d 11 d0 STA $d011 
0a6a : c0 03 __ CPY #$03
0a6c : d0 c9 __ BNE $0a37 ; (vic_setmode.s11 + 0)
0a6e : f0 b9 __ BEQ $0a29 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0a70 : a5 0f __ LDA P2 
0a72 : a6 12 __ LDX P5 
0a74 : f0 0c __ BEQ $0a82 ; (memset.s4 + 18)
0a76 : a0 00 __ LDY #$00
0a78 : 91 0d __ STA (P0),y ; (dst + 0)
0a7a : c8 __ __ INY
0a7b : d0 fb __ BNE $0a78 ; (memset.s4 + 8)
0a7d : e6 0e __ INC P1 ; (dst + 1)
0a7f : ca __ __ DEX
0a80 : d0 f6 __ BNE $0a78 ; (memset.s4 + 8)
0a82 : a4 11 __ LDY P4 
0a84 : f0 05 __ BEQ $0a8b ; (memset.s4 + 27)
0a86 : 88 __ __ DEY
0a87 : 91 0d __ STA (P0),y ; (dst + 0)
0a89 : d0 fb __ BNE $0a86 ; (memset.s4 + 22)
0a8b : a5 0d __ LDA P0 ; (dst + 0)
0a8d : 85 1b __ STA ACCU + 0 
0a8f : a5 0e __ LDA P1 ; (dst + 1)
0a91 : 85 1c __ STA ACCU + 1 
.s3:
0a93 : 60 __ __ RTS
--------------------------------------------------------------------
particle_init: ; particle_init()->void
;  59, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0a94 : a9 e0 __ LDA #$e0
0a96 : a0 00 __ LDY #$00
0a98 : a2 00 __ LDX #$00
.l7:
0a9a : 85 1c __ STA ACCU + 1 
0a9c : 9d 30 0d STA $0d30,x ; (Hirows[0] + 1)
0a9f : 98 __ __ TYA
0aa0 : 9d 2f 0d STA $0d2f,x ; (Hirows[0] + 0)
0aa3 : 18 __ __ CLC
0aa4 : 69 40 __ ADC #$40
0aa6 : a8 __ __ TAY
0aa7 : a5 1c __ LDA ACCU + 1 
0aa9 : 69 01 __ ADC #$01
0aab : e8 __ __ INX
0aac : e8 __ __ INX
0aad : e0 32 __ CPX #$32
0aaf : d0 e9 __ BNE $0a9a ; (particle_init.l7 + 0)
.s5:
0ab1 : a9 00 __ LDA #$00
0ab3 : 8d 61 0d STA $0d61 ; (pfirst + 0)
0ab6 : 8d 62 0d STA $0d62 ; (pfirst + 1)
0ab9 : a9 64 __ LDA #$64
0abb : 85 1b __ STA ACCU + 0 
0abd : 8d 64 17 STA $1764 ; (pfree + 0)
0ac0 : a9 0d __ LDA #$0d
0ac2 : 8d 65 17 STA $1765 ; (pfree + 1)
0ac5 : a2 ff __ LDX #$ff
.l6:
0ac7 : 85 1c __ STA ACCU + 1 
0ac9 : 18 __ __ CLC
0aca : a5 1b __ LDA ACCU + 0 
0acc : 69 0a __ ADC #$0a
0ace : 85 1d __ STA ACCU + 2 
0ad0 : a0 08 __ LDY #$08
0ad2 : 91 1b __ STA (ACCU + 0),y 
0ad4 : a5 1c __ LDA ACCU + 1 
0ad6 : 69 00 __ ADC #$00
0ad8 : c8 __ __ INY
0ad9 : 91 1b __ STA (ACCU + 0),y 
0adb : a4 1d __ LDY ACCU + 2 
0add : 84 1b __ STY ACCU + 0 
0adf : ca __ __ DEX
0ae0 : d0 e5 __ BNE $0ac7 ; (particle_init.l6 + 0)
.s3:
0ae2 : 60 __ __ RTS
--------------------------------------------------------------------
particle_move: ; particle_move()->void
;  97, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0ae3 : ad 62 0d LDA $0d62 ; (pfirst + 1)
0ae6 : 85 47 __ STA T3 + 1 
0ae8 : ad 61 0d LDA $0d61 ; (pfirst + 0)
0aeb : 85 46 __ STA T3 + 0 
0aed : 05 47 __ ORA T3 + 1 
0aef : d0 01 __ BNE $0af2 ; (particle_move.s5 + 0)
.s3:
0af1 : 60 __ __ RTS
.s5:
0af2 : a9 00 __ LDA #$00
0af4 : 85 48 __ STA T4 + 0 
0af6 : 85 49 __ STA T4 + 1 
.l6:
0af8 : a0 00 __ LDY #$00
0afa : b1 46 __ LDA (T3 + 0),y 
0afc : 0a __ __ ASL
0afd : 85 43 __ STA T0 + 0 
0aff : c8 __ __ INY
0b00 : b1 46 __ LDA (T3 + 0),y 
0b02 : 2a __ __ ROL
0b03 : 85 0d __ STA P0 
0b05 : a9 00 __ LDA #$00
0b07 : 69 ff __ ADC #$ff
0b09 : 49 ff __ EOR #$ff
0b0b : 06 43 __ ASL T0 + 0 
0b0d : 26 0d __ ROL P0 
0b0f : 2a __ __ ROL
0b10 : 85 0e __ STA P1 
0b12 : c8 __ __ INY
0b13 : b1 46 __ LDA (T3 + 0),y 
0b15 : 0a __ __ ASL
0b16 : 85 43 __ STA T0 + 0 
0b18 : c8 __ __ INY
0b19 : b1 46 __ LDA (T3 + 0),y 
0b1b : 2a __ __ ROL
0b1c : 85 0f __ STA P2 
0b1e : a9 00 __ LDA #$00
0b20 : 69 ff __ ADC #$ff
0b22 : 49 ff __ EOR #$ff
0b24 : 06 43 __ ASL T0 + 0 
0b26 : 26 0f __ ROL P2 
0b28 : 2a __ __ ROL
0b29 : 85 10 __ STA P3 
0b2b : 20 01 0c JSR $0c01 ; (pix_clr.s4 + 0)
0b2e : 18 __ __ CLC
0b2f : a0 04 __ LDY #$04
0b31 : b1 46 __ LDA (T3 + 0),y 
0b33 : a0 00 __ LDY #$00
0b35 : 71 46 __ ADC (T3 + 0),y 
0b37 : 91 46 __ STA (T3 + 0),y 
0b39 : 85 43 __ STA T0 + 0 
0b3b : a0 05 __ LDY #$05
0b3d : b1 46 __ LDA (T3 + 0),y 
0b3f : a0 01 __ LDY #$01
0b41 : 71 46 __ ADC (T3 + 0),y 
0b43 : 91 46 __ STA (T3 + 0),y 
0b45 : 85 0d __ STA P0 
0b47 : a0 03 __ LDY #$03
0b49 : b1 46 __ LDA (T3 + 0),y 
0b4b : 85 45 __ STA T1 + 1 
0b4d : a0 06 __ LDY #$06
0b4f : b1 46 __ LDA (T3 + 0),y 
0b51 : aa __ __ TAX
0b52 : 18 __ __ CLC
0b53 : a0 02 __ LDY #$02
0b55 : 71 46 __ ADC (T3 + 0),y 
0b57 : 85 44 __ STA T1 + 0 
0b59 : 91 46 __ STA (T3 + 0),y 
0b5b : a0 07 __ LDY #$07
0b5d : b1 46 __ LDA (T3 + 0),y 
0b5f : 85 1c __ STA ACCU + 1 
0b61 : 65 45 __ ADC T1 + 1 
0b63 : 85 0f __ STA P2 
0b65 : a0 03 __ LDY #$03
0b67 : 91 46 __ STA (T3 + 0),y 
0b69 : 8a __ __ TXA
0b6a : 18 __ __ CLC
0b6b : 69 08 __ ADC #$08
0b6d : a0 06 __ LDY #$06
0b6f : 91 46 __ STA (T3 + 0),y 
0b71 : a5 1c __ LDA ACCU + 1 
0b73 : 69 00 __ ADC #$00
0b75 : c8 __ __ INY
0b76 : 91 46 __ STA (T3 + 0),y 
0b78 : a5 0d __ LDA P0 
0b7a : c9 50 __ CMP #$50
0b7c : b0 3e __ BCS $0bbc ; (particle_move.s9 + 0)
.s7:
0b7e : a5 0f __ LDA P2 
0b80 : c9 32 __ CMP #$32
0b82 : b0 38 __ BCS $0bbc ; (particle_move.s9 + 0)
.s8:
0b84 : a5 43 __ LDA T0 + 0 
0b86 : 0a __ __ ASL
0b87 : 26 0d __ ROL P0 
0b89 : 2a __ __ ROL
0b8a : 26 0d __ ROL P0 
0b8c : 29 01 __ AND #$01
0b8e : 2a __ __ ROL
0b8f : 85 0e __ STA P1 
0b91 : a5 44 __ LDA T1 + 0 
0b93 : 0a __ __ ASL
0b94 : 26 0f __ ROL P2 
0b96 : 0a __ __ ASL
0b97 : 26 0f __ ROL P2 
0b99 : a9 00 __ LDA #$00
0b9b : 85 10 __ STA P3 
0b9d : 20 2a 0c JSR $0c2a ; (pix_set.s4 + 0)
0ba0 : a5 46 __ LDA T3 + 0 
0ba2 : 85 48 __ STA T4 + 0 
0ba4 : a5 47 __ LDA T3 + 1 
0ba6 : 85 49 __ STA T4 + 1 
0ba8 : a0 08 __ LDY #$08
0baa : b1 46 __ LDA (T3 + 0),y 
0bac : aa __ __ TAX
0bad : c8 __ __ INY
0bae : b1 46 __ LDA (T3 + 0),y 
0bb0 : 86 46 __ STX T3 + 0 
0bb2 : 85 47 __ STA T3 + 1 
0bb4 : 05 46 __ ORA T3 + 0 
0bb6 : f0 03 __ BEQ $0bbb ; (particle_move.s8 + 55)
0bb8 : 4c f8 0a JMP $0af8 ; (particle_move.l6 + 0)
0bbb : 60 __ __ RTS
.s9:
0bbc : a0 08 __ LDY #$08
0bbe : b1 46 __ LDA (T3 + 0),y 
0bc0 : 85 43 __ STA T0 + 0 
0bc2 : c8 __ __ INY
0bc3 : b1 46 __ LDA (T3 + 0),y 
0bc5 : aa __ __ TAX
0bc6 : a5 48 __ LDA T4 + 0 
0bc8 : 05 49 __ ORA T4 + 1 
0bca : f0 0a __ BEQ $0bd6 ; (particle_move.s10 + 0)
.s12:
0bcc : 8a __ __ TXA
0bcd : 91 48 __ STA (T4 + 0),y 
0bcf : a5 43 __ LDA T0 + 0 
0bd1 : 88 __ __ DEY
0bd2 : 91 48 __ STA (T4 + 0),y 
0bd4 : b0 09 __ BCS $0bdf ; (particle_move.s11 + 0)
.s10:
0bd6 : 8e 62 0d STX $0d62 ; (pfirst + 1)
0bd9 : a5 43 __ LDA T0 + 0 
0bdb : 8d 61 0d STA $0d61 ; (pfirst + 0)
0bde : 88 __ __ DEY
.s11:
0bdf : ad 64 17 LDA $1764 ; (pfree + 0)
0be2 : 91 46 __ STA (T3 + 0),y 
0be4 : ad 65 17 LDA $1765 ; (pfree + 1)
0be7 : a0 09 __ LDY #$09
0be9 : 91 46 __ STA (T3 + 0),y 
0beb : a5 46 __ LDA T3 + 0 
0bed : 8d 64 17 STA $1764 ; (pfree + 0)
0bf0 : a5 47 __ LDA T3 + 1 
0bf2 : 86 47 __ STX T3 + 1 
0bf4 : 8d 65 17 STA $1765 ; (pfree + 1)
0bf7 : a5 43 __ LDA T0 + 0 
0bf9 : 85 46 __ STA T3 + 0 
0bfb : 8a __ __ TXA
0bfc : 05 43 __ ORA T0 + 0 
0bfe : d0 b8 __ BNE $0bb8 ; (particle_move.s8 + 52)
0c00 : 60 __ __ RTS
--------------------------------------------------------------------
pix_clr: ; pix_clr(u16,u16)->void
;  46, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0c01 : a5 0f __ LDA P2 ; (py + 0)
0c03 : 29 f8 __ AND #$f8
0c05 : 4a __ __ LSR
0c06 : 4a __ __ LSR
0c07 : aa __ __ TAX
0c08 : a5 0d __ LDA P0 ; (px + 0)
0c0a : 29 f8 __ AND #$f8
0c0c : 7d 2f 0d ADC $0d2f,x ; (Hirows[0] + 0)
0c0f : 85 1b __ STA ACCU + 0 
0c11 : bd 30 0d LDA $0d30,x ; (Hirows[0] + 1)
0c14 : 65 0e __ ADC P1 ; (px + 1)
0c16 : 85 1c __ STA ACCU + 1 
0c18 : a5 0d __ LDA P0 ; (px + 0)
0c1a : 29 07 __ AND #$07
0c1c : aa __ __ TAX
0c1d : a5 0f __ LDA P2 ; (py + 0)
0c1f : 29 07 __ AND #$07
0c21 : a8 __ __ TAY
0c22 : bd 1d 0d LDA $0d1d,x ; (clrmask[0] + 0)
0c25 : 31 1b __ AND (ACCU + 0),y 
0c27 : 91 1b __ STA (ACCU + 0),y 
.s3:
0c29 : 60 __ __ RTS
--------------------------------------------------------------------
pix_set: ; pix_set(u16,u16)->void
;  32, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0c2a : a5 0f __ LDA P2 ; (py + 0)
0c2c : 29 f8 __ AND #$f8
0c2e : 4a __ __ LSR
0c2f : 4a __ __ LSR
0c30 : aa __ __ TAX
0c31 : a5 0d __ LDA P0 ; (px + 0)
0c33 : 29 f8 __ AND #$f8
0c35 : 7d 2f 0d ADC $0d2f,x ; (Hirows[0] + 0)
0c38 : 85 1b __ STA ACCU + 0 
0c3a : bd 30 0d LDA $0d30,x ; (Hirows[0] + 1)
0c3d : 65 0e __ ADC P1 ; (px + 1)
0c3f : 85 1c __ STA ACCU + 1 
0c41 : a5 0d __ LDA P0 ; (px + 0)
0c43 : 29 07 __ AND #$07
0c45 : aa __ __ TAX
0c46 : a5 0f __ LDA P2 ; (py + 0)
0c48 : 29 07 __ AND #$07
0c4a : a8 __ __ TAY
0c4b : bd 25 0d LDA $0d25,x ; (setmask[0] + 0)
0c4e : 11 1b __ ORA (ACCU + 0),y 
0c50 : 91 1b __ STA (ACCU + 0),y 
.s3:
0c52 : 60 __ __ RTS
--------------------------------------------------------------------
particle_add: ; particle_add(i16,i16,i16,i16)->void
;  75, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0c53 : ad 65 17 LDA $1765 ; (pfree + 1)
0c56 : 85 1c __ STA ACCU + 1 
0c58 : ad 64 17 LDA $1764 ; (pfree + 0)
0c5b : 85 1b __ STA ACCU + 0 
0c5d : 05 1c __ ORA ACCU + 1 
0c5f : f0 4c __ BEQ $0cad ; (particle_add.s3 + 0)
.s5:
0c61 : a0 08 __ LDY #$08
0c63 : b1 1b __ LDA (ACCU + 0),y 
0c65 : 8d 64 17 STA $1764 ; (pfree + 0)
0c68 : c8 __ __ INY
0c69 : b1 1b __ LDA (ACCU + 0),y 
0c6b : 8d 65 17 STA $1765 ; (pfree + 1)
0c6e : a5 0d __ LDA P0 ; (px + 0)
0c70 : a0 00 __ LDY #$00
0c72 : 91 1b __ STA (ACCU + 0),y 
0c74 : a5 0e __ LDA P1 ; (px + 1)
0c76 : c8 __ __ INY
0c77 : 91 1b __ STA (ACCU + 0),y 
0c79 : a5 0f __ LDA P2 ; (py + 0)
0c7b : c8 __ __ INY
0c7c : 91 1b __ STA (ACCU + 0),y 
0c7e : a5 10 __ LDA P3 ; (py + 1)
0c80 : c8 __ __ INY
0c81 : 91 1b __ STA (ACCU + 0),y 
0c83 : a5 11 __ LDA P4 ; (vx + 0)
0c85 : c8 __ __ INY
0c86 : 91 1b __ STA (ACCU + 0),y 
0c88 : a5 12 __ LDA P5 ; (vx + 1)
0c8a : c8 __ __ INY
0c8b : 91 1b __ STA (ACCU + 0),y 
0c8d : a5 13 __ LDA P6 ; (vy + 0)
0c8f : c8 __ __ INY
0c90 : 91 1b __ STA (ACCU + 0),y 
0c92 : a5 14 __ LDA P7 ; (vy + 1)
0c94 : c8 __ __ INY
0c95 : 91 1b __ STA (ACCU + 0),y 
0c97 : ad 61 0d LDA $0d61 ; (pfirst + 0)
0c9a : c8 __ __ INY
0c9b : 91 1b __ STA (ACCU + 0),y 
0c9d : ad 62 0d LDA $0d62 ; (pfirst + 1)
0ca0 : c8 __ __ INY
0ca1 : 91 1b __ STA (ACCU + 0),y 
0ca3 : a5 1b __ LDA ACCU + 0 
0ca5 : 8d 61 0d STA $0d61 ; (pfirst + 0)
0ca8 : a5 1c __ LDA ACCU + 1 
0caa : 8d 62 0d STA $0d62 ; (pfirst + 1)
.s3:
0cad : 60 __ __ RTS
--------------------------------------------------------------------
rnorm: ; rnorm()->i16
; 150, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_hires.c"
.s4:
0cae : 20 f5 0c JSR $0cf5 ; (rand.s4 + 0)
0cb1 : a5 1b __ LDA ACCU + 0 
0cb3 : 85 43 __ STA T1 + 0 
0cb5 : a5 1c __ LDA ACCU + 1 
0cb7 : 29 0f __ AND #$0f
0cb9 : 85 44 __ STA T1 + 1 
0cbb : 20 f5 0c JSR $0cf5 ; (rand.s4 + 0)
0cbe : 18 __ __ CLC
0cbf : a5 1b __ LDA ACCU + 0 
0cc1 : 65 43 __ ADC T1 + 0 
0cc3 : 85 43 __ STA T1 + 0 
0cc5 : a5 1c __ LDA ACCU + 1 
0cc7 : 29 0f __ AND #$0f
0cc9 : 65 44 __ ADC T1 + 1 
0ccb : 85 44 __ STA T1 + 1 
0ccd : 20 f5 0c JSR $0cf5 ; (rand.s4 + 0)
0cd0 : 18 __ __ CLC
0cd1 : a5 1b __ LDA ACCU + 0 
0cd3 : 65 43 __ ADC T1 + 0 
0cd5 : 85 43 __ STA T1 + 0 
0cd7 : a5 1c __ LDA ACCU + 1 
0cd9 : 29 0f __ AND #$0f
0cdb : 65 44 __ ADC T1 + 1 
0cdd : 85 44 __ STA T1 + 1 
0cdf : 20 f5 0c JSR $0cf5 ; (rand.s4 + 0)
0ce2 : 18 __ __ CLC
0ce3 : a5 1b __ LDA ACCU + 0 
0ce5 : 65 43 __ ADC T1 + 0 
0ce7 : 85 1b __ STA ACCU + 0 
0ce9 : a5 1c __ LDA ACCU + 1 
0ceb : 29 0f __ AND #$0f
0ced : 65 44 __ ADC T1 + 1 
0cef : 38 __ __ SEC
0cf0 : e9 20 __ SBC #$20
0cf2 : 85 1c __ STA ACCU + 1 
.s3:
0cf4 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0cf5 : ad 2e 0d LDA $0d2e ; (seed + 1)
0cf8 : 4a __ __ LSR
0cf9 : ad 2d 0d LDA $0d2d ; (seed + 0)
0cfc : 6a __ __ ROR
0cfd : aa __ __ TAX
0cfe : a9 00 __ LDA #$00
0d00 : 6a __ __ ROR
0d01 : 4d 2d 0d EOR $0d2d ; (seed + 0)
0d04 : 85 1b __ STA ACCU + 0 
0d06 : 8a __ __ TXA
0d07 : 4d 2e 0d EOR $0d2e ; (seed + 1)
0d0a : 85 1c __ STA ACCU + 1 
0d0c : 4a __ __ LSR
0d0d : 45 1b __ EOR ACCU + 0 
0d0f : 8d 2d 0d STA $0d2d ; (seed + 0)
0d12 : 85 1b __ STA ACCU + 0 
0d14 : 45 1c __ EOR ACCU + 1 
0d16 : 8d 2e 0d STA $0d2e ; (seed + 1)
0d19 : 85 1c __ STA ACCU + 1 
.s3:
0d1b : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0d1c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
clrmask:
0d1d : __ __ __ BYT 7f bf df ef f7 fb fd fe                         : ........
--------------------------------------------------------------------
setmask:
0d25 : __ __ __ BYT 80 40 20 10 08 04 02 01                         : .@ .....
--------------------------------------------------------------------
seed:
0d2d : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
Hirows:
0d2f : __ __ __ BSS	50
--------------------------------------------------------------------
pfirst:
0d61 : __ __ __ BSS	2
--------------------------------------------------------------------
particles:
0d64 : __ __ __ BSS	2560
--------------------------------------------------------------------
pfree:
1764 : __ __ __ BSS	2
