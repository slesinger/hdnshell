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
080e : 8e 53 0d STX $0d53 ; (spentry + 0)
0811 : a2 0d __ LDX #$0d
0813 : a0 66 __ LDY #$66
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 18 __ CPX #$18
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 9c __ CPY #$9c
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
; 163, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0880 : a9 36 __ LDA #$36
0882 : 85 01 __ STA $01 
0884 : 20 f9 09 JSR $09f9 ; (mmap_trampoline.s4 + 0)
0887 : a9 00 __ LDA #$00
0889 : 85 0e __ STA P1 
088b : 85 10 __ STA P3 
088d : a9 35 __ LDA #$35
088f : 85 01 __ STA $01 
0891 : a9 04 __ LDA #$04
0893 : 85 0d __ STA P0 
0895 : a9 c8 __ LDA #$c8
0897 : 85 0f __ STA P2 
0899 : a9 e0 __ LDA #$e0
089b : 85 11 __ STA P4 
089d : 20 43 0a JSR $0a43 ; (vic_setmode.s4 + 0)
08a0 : a9 00 __ LDA #$00
08a2 : 85 0d __ STA P0 
08a4 : 85 0f __ STA P2 
08a6 : a9 e0 __ LDA #$e0
08a8 : 85 0e __ STA P1 
08aa : a9 40 __ LDA #$40
08ac : 85 11 __ STA P4 
08ae : a9 1f __ LDA #$1f
08b0 : 85 12 __ STA P5 
08b2 : a9 78 __ LDA #$78
08b4 : a2 fa __ LDX #$fa
.l6:
08b6 : ca __ __ DEX
08b7 : 9d 00 c8 STA $c800,x 
08ba : 9d fa c8 STA $c8fa,x 
08bd : 9d f4 c9 STA $c9f4,x 
08c0 : 9d ee ca STA $caee,x 
08c3 : d0 f1 __ BNE $08b6 ; (main.l6 + 0)
.s5:
08c5 : a9 0e __ LDA #$0e
08c7 : a2 fa __ LDX #$fa
.l8:
08c9 : ca __ __ DEX
08ca : 9d 00 d8 STA $d800,x 
08cd : 9d fa d8 STA $d8fa,x 
08d0 : 9d f4 d9 STA $d9f4,x 
08d3 : 9d ee da STA $daee,x 
08d6 : d0 f1 __ BNE $08c9 ; (main.l8 + 0)
.s7:
08d8 : 20 95 0a JSR $0a95 ; (memset.s4 + 0)
08db : a9 00 __ LDA #$00
08dd : 85 50 __ STA T3 + 0 
08df : 8d 20 d0 STA $d020 
08e2 : 8d 21 d0 STA $d021 
08e5 : 20 b9 0a JSR $0ab9 ; (particle_init.s4 + 0)
08e8 : a9 f0 __ LDA #$f0
08ea : 85 4e __ STA T2 + 0 
08ec : a9 d8 __ LDA #$d8
08ee : 85 4f __ STA T2 + 1 
.l9:
08f0 : 20 08 0b JSR $0b08 ; (particle_move.s4 + 0)
08f3 : a5 50 __ LDA T3 + 0 
08f5 : c9 19 __ CMP #$19
08f7 : b0 31 __ BCS $092a ; (main.s10 + 0)
.s19:
08f9 : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
08fc : a5 1b __ LDA ACCU + 0 
08fe : 85 4c __ STA T1 + 0 
0900 : a5 1c __ LDA ACCU + 1 
0902 : 85 4d __ STA T1 + 1 
0904 : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
0907 : 06 4c __ ASL T1 + 0 
0909 : a9 01 __ LDA #$01
090b : 85 0e __ STA P1 
090d : a9 55 __ LDA #$55
090f : 85 15 __ STA P8 
0911 : 26 4d __ ROL T1 + 1 
0913 : a9 00 __ LDA #$00
0915 : 85 0d __ STA P0 
0917 : 69 ff __ ADC #$ff
0919 : 49 ff __ EOR #$ff
091b : 06 4c __ ASL T1 + 0 
091d : 26 4d __ ROL T1 + 1 
091f : 2a __ __ ROL
0920 : a6 4d __ LDX T1 + 1 
0922 : 86 11 __ STX P4 
0924 : 18 __ __ CLC
0925 : 69 01 __ ADC #$01
0927 : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s10:
092a : c9 32 __ CMP #$32
092c : b0 3e __ BCS $096c ; (main.s11 + 0)
.s18:
092e : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
0931 : a5 1b __ LDA ACCU + 0 
0933 : 85 4c __ STA T1 + 0 
0935 : a5 1c __ LDA ACCU + 1 
0937 : 85 4d __ STA T1 + 1 
0939 : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
093c : 06 4c __ ASL T1 + 0 
093e : a9 4f __ LDA #$4f
0940 : 85 0e __ STA P1 
0942 : a9 aa __ LDA #$aa
0944 : 85 15 __ STA P8 
0946 : 26 4d __ ROL T1 + 1 
0948 : a9 00 __ LDA #$00
094a : 85 0d __ STA P0 
094c : 69 ff __ ADC #$ff
094e : 49 ff __ EOR #$ff
0950 : 06 4c __ ASL T1 + 0 
0952 : 26 4d __ ROL T1 + 1 
0954 : 2a __ __ ROL
0955 : a6 4d __ LDX T1 + 1 
0957 : 86 4c __ STX T1 + 0 
0959 : 18 __ __ CLC
095a : 69 01 __ ADC #$01
095c : 85 4d __ STA T1 + 1 
095e : 38 __ __ SEC
095f : a9 00 __ LDA #$00
0961 : e5 4c __ SBC T1 + 0 
0963 : 85 11 __ STA P4 
0965 : a9 00 __ LDA #$00
0967 : e5 4d __ SBC T1 + 1 
0969 : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s11:
096c : c9 4b __ CMP #$4b
096e : b0 2e __ BCS $099e ; (main.s12 + 0)
.s16:
0970 : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
0973 : a5 1b __ LDA ACCU + 0 
0975 : 85 4c __ STA T1 + 0 
0977 : a5 1c __ LDA ACCU + 1 
0979 : 85 4d __ STA T1 + 1 
097b : 20 e5 0c JSR $0ce5 ; (rnorm.s4 + 0)
097e : 06 4c __ ASL T1 + 0 
0980 : a9 28 __ LDA #$28
0982 : 85 0e __ STA P1 
0984 : a9 ff __ LDA #$ff
0986 : 85 15 __ STA P8 
0988 : 26 4d __ ROL T1 + 1 
098a : a9 00 __ LDA #$00
098c : 85 0d __ STA P0 
098e : 69 ff __ ADC #$ff
0990 : 49 ff __ EOR #$ff
0992 : 06 4c __ ASL T1 + 0 
0994 : 26 4d __ ROL T1 + 1 
0996 : 2a __ __ ROL
0997 : a6 4d __ LDX T1 + 1 
0999 : 86 11 __ STX P4 
099b : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s12:
099e : e6 50 __ INC T3 + 0 
09a0 : a5 50 __ LDA T3 + 0 
09a2 : c9 4b __ CMP #$4b
09a4 : d0 04 __ BNE $09aa ; (main.s13 + 0)
.s15:
09a6 : a9 00 __ LDA #$00
09a8 : 85 50 __ STA T3 + 0 
.s13:
09aa : e6 4e __ INC T2 + 0 
09ac : f0 03 __ BEQ $09b1 ; (main.s20 + 0)
09ae : 4c f0 08 JMP $08f0 ; (main.l9 + 0)
.s20:
09b1 : e6 4f __ INC T2 + 1 
09b3 : d0 f9 __ BNE $09ae ; (main.s13 + 4)
.s14:
09b5 : a9 00 __ LDA #$00
09b7 : 85 1b __ STA ACCU + 0 
09b9 : 85 1c __ STA ACCU + 1 
.s3:
09bb : 60 __ __ RTS
.s17:
09bc : 85 12 __ STA P5 
09be : a5 1b __ LDA ACCU + 0 
09c0 : 0a __ __ ASL
09c1 : 85 4a __ STA T0 + 0 
09c3 : a5 1c __ LDA ACCU + 1 
09c5 : 2a __ __ ROL
09c6 : 85 4b __ STA T0 + 1 
09c8 : a9 00 __ LDA #$00
09ca : 85 0f __ STA P2 
09cc : 69 ff __ ADC #$ff
09ce : 49 ff __ EOR #$ff
09d0 : 06 4a __ ASL T0 + 0 
09d2 : 26 4b __ ROL T0 + 1 
09d4 : 2a __ __ ROL
09d5 : aa __ __ TAX
09d6 : a9 31 __ LDA #$31
09d8 : 85 10 __ STA P3 
09da : 18 __ __ CLC
09db : a5 4b __ LDA T0 + 1 
09dd : 69 80 __ ADC #$80
09df : 85 4a __ STA T0 + 0 
09e1 : 8a __ __ TXA
09e2 : 69 01 __ ADC #$01
09e4 : 85 4b __ STA T0 + 1 
09e6 : 38 __ __ SEC
09e7 : a9 00 __ LDA #$00
09e9 : e5 4a __ SBC T0 + 0 
09eb : 85 13 __ STA P6 
09ed : a9 00 __ LDA #$00
09ef : e5 4b __ SBC T0 + 1 
09f1 : 85 14 __ STA P7 
09f3 : 20 85 0c JSR $0c85 ; (particle_add.s4 + 0)
09f6 : 4c 9e 09 JMP $099e ; (main.s12 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
09f9 : a9 0e __ LDA #$0e
09fb : 8d fa ff STA $fffa 
09fe : a9 0a __ LDA #$0a
0a00 : 8d fb ff STA $fffb 
0a03 : a9 2c __ LDA #$2c
0a05 : 8d fe ff STA $fffe 
0a08 : a9 0a __ LDA #$0a
0a0a : 8d ff ff STA $ffff 
.s3:
0a0d : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a0e : 48 __ __ PHA
0a0f : 8a __ __ TXA
0a10 : 48 __ __ PHA
0a11 : a9 0a __ LDA #$0a
0a13 : 48 __ __ PHA
0a14 : a9 25 __ LDA #$25
0a16 : 48 __ __ PHA
0a17 : ba __ __ TSX
0a18 : bd 05 01 LDA $0105,x 
0a1b : 48 __ __ PHA
0a1c : a6 01 __ LDX $01 
0a1e : a9 36 __ LDA #$36
0a20 : 85 01 __ STA $01 
0a22 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0a25 : 86 01 __ STX $01 
0a27 : 68 __ __ PLA
0a28 : aa __ __ TAX
0a29 : 68 __ __ PLA
0a2a : 40 __ __ RTI
0a2b : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0a2c : 48 __ __ PHA
0a2d : 8a __ __ TXA
0a2e : 48 __ __ PHA
0a2f : a9 0a __ LDA #$0a
0a31 : 48 __ __ PHA
0a32 : a9 25 __ LDA #$25
0a34 : 48 __ __ PHA
0a35 : ba __ __ TSX
0a36 : bd 05 01 LDA $0105,x 
0a39 : 48 __ __ PHA
0a3a : a6 01 __ LDX $01 
0a3c : a9 36 __ LDA #$36
0a3e : 85 01 __ STA $01 
0a40 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a43 : a4 0d __ LDY P0 ; (mode + 0)
0a45 : c0 02 __ CPY #$02
0a47 : d0 09 __ BNE $0a52 ; (vic_setmode.s5 + 0)
.s10:
0a49 : a9 5b __ LDA #$5b
0a4b : 8d 11 d0 STA $d011 
.s8:
0a4e : a9 08 __ LDA #$08
0a50 : d0 0c __ BNE $0a5e ; (vic_setmode.s7 + 0)
.s5:
0a52 : b0 36 __ BCS $0a8a ; (vic_setmode.s6 + 0)
.s9:
0a54 : a9 1b __ LDA #$1b
0a56 : 8d 11 d0 STA $d011 
0a59 : 98 __ __ TYA
0a5a : f0 f2 __ BEQ $0a4e ; (vic_setmode.s8 + 0)
.s11:
0a5c : a9 18 __ LDA #$18
.s7:
0a5e : 8d 16 d0 STA $d016 
0a61 : ad 00 dd LDA $dd00 
0a64 : 29 fc __ AND #$fc
0a66 : 85 1b __ STA ACCU + 0 
0a68 : a5 0f __ LDA P2 ; (text + 1)
0a6a : 0a __ __ ASL
0a6b : 2a __ __ ROL
0a6c : 29 01 __ AND #$01
0a6e : 2a __ __ ROL
0a6f : 49 03 __ EOR #$03
0a71 : 05 1b __ ORA ACCU + 0 
0a73 : 8d 00 dd STA $dd00 
0a76 : a5 0f __ LDA P2 ; (text + 1)
0a78 : 29 3c __ AND #$3c
0a7a : 0a __ __ ASL
0a7b : 0a __ __ ASL
0a7c : 85 1b __ STA ACCU + 0 
0a7e : a5 11 __ LDA P4 ; (font + 1)
0a80 : 29 38 __ AND #$38
0a82 : 4a __ __ LSR
0a83 : 4a __ __ LSR
0a84 : 05 1b __ ORA ACCU + 0 
0a86 : 8d 18 d0 STA $d018 
.s3:
0a89 : 60 __ __ RTS
.s6:
0a8a : a9 3b __ LDA #$3b
0a8c : 8d 11 d0 STA $d011 
0a8f : c0 03 __ CPY #$03
0a91 : d0 c9 __ BNE $0a5c ; (vic_setmode.s11 + 0)
0a93 : f0 b9 __ BEQ $0a4e ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0a95 : a5 0f __ LDA P2 
0a97 : a6 12 __ LDX P5 
0a99 : f0 0c __ BEQ $0aa7 ; (memset.s4 + 18)
0a9b : a0 00 __ LDY #$00
0a9d : 91 0d __ STA (P0),y ; (dst + 0)
0a9f : c8 __ __ INY
0aa0 : d0 fb __ BNE $0a9d ; (memset.s4 + 8)
0aa2 : e6 0e __ INC P1 ; (dst + 1)
0aa4 : ca __ __ DEX
0aa5 : d0 f6 __ BNE $0a9d ; (memset.s4 + 8)
0aa7 : a4 11 __ LDY P4 
0aa9 : f0 05 __ BEQ $0ab0 ; (memset.s4 + 27)
0aab : 88 __ __ DEY
0aac : 91 0d __ STA (P0),y ; (dst + 0)
0aae : d0 fb __ BNE $0aab ; (memset.s4 + 22)
0ab0 : a5 0d __ LDA P0 ; (dst + 0)
0ab2 : 85 1b __ STA ACCU + 0 
0ab4 : a5 0e __ LDA P1 ; (dst + 1)
0ab6 : 85 1c __ STA ACCU + 1 
.s3:
0ab8 : 60 __ __ RTS
--------------------------------------------------------------------
particle_init: ; particle_init()->void
;  61, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0ab9 : a9 e0 __ LDA #$e0
0abb : a0 00 __ LDY #$00
0abd : a2 00 __ LDX #$00
.l7:
0abf : 85 1c __ STA ACCU + 1 
0ac1 : 9d 67 0d STA $0d67,x ; (Hirows[0] + 1)
0ac4 : 98 __ __ TYA
0ac5 : 9d 66 0d STA $0d66,x ; (Hirows[0] + 0)
0ac8 : 18 __ __ CLC
0ac9 : 69 40 __ ADC #$40
0acb : a8 __ __ TAY
0acc : a5 1c __ LDA ACCU + 1 
0ace : 69 01 __ ADC #$01
0ad0 : e8 __ __ INX
0ad1 : e8 __ __ INX
0ad2 : e0 32 __ CPX #$32
0ad4 : d0 e9 __ BNE $0abf ; (particle_init.l7 + 0)
.s5:
0ad6 : a9 00 __ LDA #$00
0ad8 : 8d 98 0d STA $0d98 ; (pfirst + 0)
0adb : 8d 99 0d STA $0d99 ; (pfirst + 1)
0ade : a9 9a __ LDA #$9a
0ae0 : 85 1b __ STA ACCU + 0 
0ae2 : 8d 9a 18 STA $189a ; (pfree + 0)
0ae5 : a9 0d __ LDA #$0d
0ae7 : 8d 9b 18 STA $189b ; (pfree + 1)
0aea : a2 ff __ LDX #$ff
.l6:
0aec : 85 1c __ STA ACCU + 1 
0aee : 18 __ __ CLC
0aef : a5 1b __ LDA ACCU + 0 
0af1 : 69 0b __ ADC #$0b
0af3 : 85 1d __ STA ACCU + 2 
0af5 : a0 09 __ LDY #$09
0af7 : 91 1b __ STA (ACCU + 0),y 
0af9 : a5 1c __ LDA ACCU + 1 
0afb : 69 00 __ ADC #$00
0afd : c8 __ __ INY
0afe : 91 1b __ STA (ACCU + 0),y 
0b00 : a4 1d __ LDY ACCU + 2 
0b02 : 84 1b __ STY ACCU + 0 
0b04 : ca __ __ DEX
0b05 : d0 e5 __ BNE $0aec ; (particle_init.l6 + 0)
.s3:
0b07 : 60 __ __ RTS
--------------------------------------------------------------------
particle_move: ; particle_move()->void
; 100, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0b08 : ad 99 0d LDA $0d99 ; (pfirst + 1)
0b0b : 85 47 __ STA T3 + 1 
0b0d : ad 98 0d LDA $0d98 ; (pfirst + 0)
0b10 : 85 46 __ STA T3 + 0 
0b12 : 05 47 __ ORA T3 + 1 
0b14 : d0 01 __ BNE $0b17 ; (particle_move.s5 + 0)
.s3:
0b16 : 60 __ __ RTS
.s5:
0b17 : a9 00 __ LDA #$00
0b19 : 85 48 __ STA T4 + 0 
0b1b : 85 49 __ STA T4 + 1 
.l6:
0b1d : a0 00 __ LDY #$00
0b1f : b1 46 __ LDA (T3 + 0),y 
0b21 : 0a __ __ ASL
0b22 : 85 43 __ STA T0 + 0 
0b24 : c8 __ __ INY
0b25 : b1 46 __ LDA (T3 + 0),y 
0b27 : 2a __ __ ROL
0b28 : 85 0d __ STA P0 
0b2a : a9 00 __ LDA #$00
0b2c : 69 ff __ ADC #$ff
0b2e : 49 ff __ EOR #$ff
0b30 : 06 43 __ ASL T0 + 0 
0b32 : 26 0d __ ROL P0 
0b34 : 2a __ __ ROL
0b35 : 85 0e __ STA P1 
0b37 : c8 __ __ INY
0b38 : b1 46 __ LDA (T3 + 0),y 
0b3a : 0a __ __ ASL
0b3b : 85 43 __ STA T0 + 0 
0b3d : c8 __ __ INY
0b3e : b1 46 __ LDA (T3 + 0),y 
0b40 : 2a __ __ ROL
0b41 : 85 0f __ STA P2 
0b43 : a9 00 __ LDA #$00
0b45 : 69 ff __ ADC #$ff
0b47 : 49 ff __ EOR #$ff
0b49 : 06 43 __ ASL T0 + 0 
0b4b : 26 0f __ ROL P2 
0b4d : 2a __ __ ROL
0b4e : 85 10 __ STA P3 
0b50 : 20 2b 0c JSR $0c2b ; (pix_clr.s4 + 0)
0b53 : 18 __ __ CLC
0b54 : a0 04 __ LDY #$04
0b56 : b1 46 __ LDA (T3 + 0),y 
0b58 : a0 00 __ LDY #$00
0b5a : 71 46 __ ADC (T3 + 0),y 
0b5c : 91 46 __ STA (T3 + 0),y 
0b5e : 85 43 __ STA T0 + 0 
0b60 : a0 05 __ LDY #$05
0b62 : b1 46 __ LDA (T3 + 0),y 
0b64 : a0 01 __ LDY #$01
0b66 : 71 46 __ ADC (T3 + 0),y 
0b68 : 91 46 __ STA (T3 + 0),y 
0b6a : 85 0d __ STA P0 
0b6c : a0 03 __ LDY #$03
0b6e : b1 46 __ LDA (T3 + 0),y 
0b70 : 85 45 __ STA T1 + 1 
0b72 : a0 06 __ LDY #$06
0b74 : b1 46 __ LDA (T3 + 0),y 
0b76 : aa __ __ TAX
0b77 : 18 __ __ CLC
0b78 : a0 02 __ LDY #$02
0b7a : 71 46 __ ADC (T3 + 0),y 
0b7c : 85 44 __ STA T1 + 0 
0b7e : 91 46 __ STA (T3 + 0),y 
0b80 : a0 07 __ LDY #$07
0b82 : b1 46 __ LDA (T3 + 0),y 
0b84 : 85 1c __ STA ACCU + 1 
0b86 : 65 45 __ ADC T1 + 1 
0b88 : 85 0f __ STA P2 
0b8a : a0 03 __ LDY #$03
0b8c : 91 46 __ STA (T3 + 0),y 
0b8e : 8a __ __ TXA
0b8f : 18 __ __ CLC
0b90 : 69 08 __ ADC #$08
0b92 : a0 06 __ LDY #$06
0b94 : 91 46 __ STA (T3 + 0),y 
0b96 : a5 1c __ LDA ACCU + 1 
0b98 : 69 00 __ ADC #$00
0b9a : c8 __ __ INY
0b9b : 91 46 __ STA (T3 + 0),y 
0b9d : a5 0d __ LDA P0 
0b9f : c9 50 __ CMP #$50
0ba1 : b0 43 __ BCS $0be6 ; (particle_move.s9 + 0)
.s7:
0ba3 : a5 0f __ LDA P2 
0ba5 : c9 32 __ CMP #$32
0ba7 : b0 3d __ BCS $0be6 ; (particle_move.s9 + 0)
.s8:
0ba9 : c8 __ __ INY
0baa : b1 46 __ LDA (T3 + 0),y 
0bac : 85 11 __ STA P4 
0bae : a5 43 __ LDA T0 + 0 
0bb0 : 0a __ __ ASL
0bb1 : 26 0d __ ROL P0 
0bb3 : 2a __ __ ROL
0bb4 : 26 0d __ ROL P0 
0bb6 : 29 01 __ AND #$01
0bb8 : 2a __ __ ROL
0bb9 : 85 0e __ STA P1 
0bbb : a5 44 __ LDA T1 + 0 
0bbd : 0a __ __ ASL
0bbe : 26 0f __ ROL P2 
0bc0 : 0a __ __ ASL
0bc1 : 26 0f __ ROL P2 
0bc3 : a9 00 __ LDA #$00
0bc5 : 85 10 __ STA P3 
0bc7 : 20 57 0c JSR $0c57 ; (pix_set.s4 + 0)
0bca : a5 46 __ LDA T3 + 0 
0bcc : 85 48 __ STA T4 + 0 
0bce : a5 47 __ LDA T3 + 1 
0bd0 : 85 49 __ STA T4 + 1 
0bd2 : a0 09 __ LDY #$09
0bd4 : b1 46 __ LDA (T3 + 0),y 
0bd6 : aa __ __ TAX
0bd7 : c8 __ __ INY
0bd8 : b1 46 __ LDA (T3 + 0),y 
0bda : 86 46 __ STX T3 + 0 
0bdc : 85 47 __ STA T3 + 1 
0bde : 05 46 __ ORA T3 + 0 
0be0 : f0 03 __ BEQ $0be5 ; (particle_move.s8 + 60)
0be2 : 4c 1d 0b JMP $0b1d ; (particle_move.l6 + 0)
0be5 : 60 __ __ RTS
.s9:
0be6 : a0 09 __ LDY #$09
0be8 : b1 46 __ LDA (T3 + 0),y 
0bea : 85 43 __ STA T0 + 0 
0bec : c8 __ __ INY
0bed : b1 46 __ LDA (T3 + 0),y 
0bef : aa __ __ TAX
0bf0 : a5 48 __ LDA T4 + 0 
0bf2 : 05 49 __ ORA T4 + 1 
0bf4 : f0 0a __ BEQ $0c00 ; (particle_move.s10 + 0)
.s12:
0bf6 : 8a __ __ TXA
0bf7 : 91 48 __ STA (T4 + 0),y 
0bf9 : a5 43 __ LDA T0 + 0 
0bfb : 88 __ __ DEY
0bfc : 91 48 __ STA (T4 + 0),y 
0bfe : b0 09 __ BCS $0c09 ; (particle_move.s11 + 0)
.s10:
0c00 : 8e 99 0d STX $0d99 ; (pfirst + 1)
0c03 : a5 43 __ LDA T0 + 0 
0c05 : 8d 98 0d STA $0d98 ; (pfirst + 0)
0c08 : 88 __ __ DEY
.s11:
0c09 : ad 9a 18 LDA $189a ; (pfree + 0)
0c0c : 91 46 __ STA (T3 + 0),y 
0c0e : ad 9b 18 LDA $189b ; (pfree + 1)
0c11 : a0 0a __ LDY #$0a
0c13 : 91 46 __ STA (T3 + 0),y 
0c15 : a5 46 __ LDA T3 + 0 
0c17 : 8d 9a 18 STA $189a ; (pfree + 0)
0c1a : a5 47 __ LDA T3 + 1 
0c1c : 86 47 __ STX T3 + 1 
0c1e : 8d 9b 18 STA $189b ; (pfree + 1)
0c21 : a5 43 __ LDA T0 + 0 
0c23 : 85 46 __ STA T3 + 0 
0c25 : 8a __ __ TXA
0c26 : 05 43 __ ORA T0 + 0 
0c28 : d0 b8 __ BNE $0be2 ; (particle_move.s8 + 57)
0c2a : 60 __ __ RTS
--------------------------------------------------------------------
pix_clr: ; pix_clr(u16,u16)->void
;  47, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0c2b : a5 0f __ LDA P2 ; (py + 0)
0c2d : 29 f8 __ AND #$f8
0c2f : 4a __ __ LSR
0c30 : 4a __ __ LSR
0c31 : aa __ __ TAX
0c32 : a5 0d __ LDA P0 ; (px + 0)
0c34 : 29 f8 __ AND #$f8
0c36 : 7d 66 0d ADC $0d66,x ; (Hirows[0] + 0)
0c39 : 85 1b __ STA ACCU + 0 
0c3b : bd 67 0d LDA $0d67,x ; (Hirows[0] + 1)
0c3e : 65 0e __ ADC P1 ; (px + 1)
0c40 : 85 1c __ STA ACCU + 1 
0c42 : a5 0d __ LDA P0 ; (px + 0)
0c44 : 29 07 __ AND #$07
0c46 : aa __ __ TAX
0c47 : a5 0f __ LDA P2 ; (py + 0)
0c49 : 29 06 __ AND #$06
0c4b : a8 __ __ TAY
0c4c : bd 54 0d LDA $0d54,x ; (clrmask[0] + 0)
0c4f : 31 1b __ AND (ACCU + 0),y 
0c51 : 91 1b __ STA (ACCU + 0),y 
0c53 : c8 __ __ INY
0c54 : 91 1b __ STA (ACCU + 0),y 
.s3:
0c56 : 60 __ __ RTS
--------------------------------------------------------------------
pix_set: ; pix_set(u16,u16,u8)->void
;  33, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0c57 : a5 0f __ LDA P2 ; (py + 0)
0c59 : 29 f8 __ AND #$f8
0c5b : 4a __ __ LSR
0c5c : 4a __ __ LSR
0c5d : aa __ __ TAX
0c5e : a5 0d __ LDA P0 ; (px + 0)
0c60 : 29 f8 __ AND #$f8
0c62 : 7d 66 0d ADC $0d66,x ; (Hirows[0] + 0)
0c65 : 85 1b __ STA ACCU + 0 
0c67 : bd 67 0d LDA $0d67,x ; (Hirows[0] + 1)
0c6a : 65 0e __ ADC P1 ; (px + 1)
0c6c : 85 1c __ STA ACCU + 1 
0c6e : a5 0d __ LDA P0 ; (px + 0)
0c70 : 29 07 __ AND #$07
0c72 : aa __ __ TAX
0c73 : a5 0f __ LDA P2 ; (py + 0)
0c75 : 29 06 __ AND #$06
0c77 : a8 __ __ TAY
0c78 : a5 11 __ LDA P4 ; (pat + 0)
0c7a : 3d 5c 0d AND $0d5c,x ; (setmask[0] + 0)
0c7d : 11 1b __ ORA (ACCU + 0),y 
0c7f : 91 1b __ STA (ACCU + 0),y 
0c81 : c8 __ __ INY
0c82 : 91 1b __ STA (ACCU + 0),y 
.s3:
0c84 : 60 __ __ RTS
--------------------------------------------------------------------
particle_add: ; particle_add(i16,i16,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0c85 : ad 9b 18 LDA $189b ; (pfree + 1)
0c88 : 85 1c __ STA ACCU + 1 
0c8a : ad 9a 18 LDA $189a ; (pfree + 0)
0c8d : 85 1b __ STA ACCU + 0 
0c8f : 05 1c __ ORA ACCU + 1 
0c91 : f0 51 __ BEQ $0ce4 ; (particle_add.s3 + 0)
.s5:
0c93 : a0 09 __ LDY #$09
0c95 : b1 1b __ LDA (ACCU + 0),y 
0c97 : 8d 9a 18 STA $189a ; (pfree + 0)
0c9a : c8 __ __ INY
0c9b : b1 1b __ LDA (ACCU + 0),y 
0c9d : 8d 9b 18 STA $189b ; (pfree + 1)
0ca0 : a5 0d __ LDA P0 ; (px + 0)
0ca2 : a0 00 __ LDY #$00
0ca4 : 91 1b __ STA (ACCU + 0),y 
0ca6 : a5 0e __ LDA P1 ; (px + 1)
0ca8 : c8 __ __ INY
0ca9 : 91 1b __ STA (ACCU + 0),y 
0cab : a5 0f __ LDA P2 ; (py + 0)
0cad : c8 __ __ INY
0cae : 91 1b __ STA (ACCU + 0),y 
0cb0 : a5 10 __ LDA P3 ; (py + 1)
0cb2 : c8 __ __ INY
0cb3 : 91 1b __ STA (ACCU + 0),y 
0cb5 : a5 11 __ LDA P4 ; (vx + 0)
0cb7 : c8 __ __ INY
0cb8 : 91 1b __ STA (ACCU + 0),y 
0cba : a5 12 __ LDA P5 ; (vx + 1)
0cbc : c8 __ __ INY
0cbd : 91 1b __ STA (ACCU + 0),y 
0cbf : a5 13 __ LDA P6 ; (vy + 0)
0cc1 : c8 __ __ INY
0cc2 : 91 1b __ STA (ACCU + 0),y 
0cc4 : a5 14 __ LDA P7 ; (vy + 1)
0cc6 : c8 __ __ INY
0cc7 : 91 1b __ STA (ACCU + 0),y 
0cc9 : a5 15 __ LDA P8 ; (pat + 0)
0ccb : c8 __ __ INY
0ccc : 91 1b __ STA (ACCU + 0),y 
0cce : ad 98 0d LDA $0d98 ; (pfirst + 0)
0cd1 : c8 __ __ INY
0cd2 : 91 1b __ STA (ACCU + 0),y 
0cd4 : ad 99 0d LDA $0d99 ; (pfirst + 1)
0cd7 : c8 __ __ INY
0cd8 : 91 1b __ STA (ACCU + 0),y 
0cda : a5 1b __ LDA ACCU + 0 
0cdc : 8d 98 0d STA $0d98 ; (pfirst + 0)
0cdf : a5 1c __ LDA ACCU + 1 
0ce1 : 8d 99 0d STA $0d99 ; (pfirst + 1)
.s3:
0ce4 : 60 __ __ RTS
--------------------------------------------------------------------
rnorm: ; rnorm()->i16
; 153, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_ptr.c"
.s4:
0ce5 : 20 2c 0d JSR $0d2c ; (rand.s4 + 0)
0ce8 : a5 1b __ LDA ACCU + 0 
0cea : 85 43 __ STA T1 + 0 
0cec : a5 1c __ LDA ACCU + 1 
0cee : 29 0f __ AND #$0f
0cf0 : 85 44 __ STA T1 + 1 
0cf2 : 20 2c 0d JSR $0d2c ; (rand.s4 + 0)
0cf5 : 18 __ __ CLC
0cf6 : a5 1b __ LDA ACCU + 0 
0cf8 : 65 43 __ ADC T1 + 0 
0cfa : 85 43 __ STA T1 + 0 
0cfc : a5 1c __ LDA ACCU + 1 
0cfe : 29 0f __ AND #$0f
0d00 : 65 44 __ ADC T1 + 1 
0d02 : 85 44 __ STA T1 + 1 
0d04 : 20 2c 0d JSR $0d2c ; (rand.s4 + 0)
0d07 : 18 __ __ CLC
0d08 : a5 1b __ LDA ACCU + 0 
0d0a : 65 43 __ ADC T1 + 0 
0d0c : 85 43 __ STA T1 + 0 
0d0e : a5 1c __ LDA ACCU + 1 
0d10 : 29 0f __ AND #$0f
0d12 : 65 44 __ ADC T1 + 1 
0d14 : 85 44 __ STA T1 + 1 
0d16 : 20 2c 0d JSR $0d2c ; (rand.s4 + 0)
0d19 : 18 __ __ CLC
0d1a : a5 1b __ LDA ACCU + 0 
0d1c : 65 43 __ ADC T1 + 0 
0d1e : 85 1b __ STA ACCU + 0 
0d20 : a5 1c __ LDA ACCU + 1 
0d22 : 29 0f __ AND #$0f
0d24 : 65 44 __ ADC T1 + 1 
0d26 : 38 __ __ SEC
0d27 : e9 20 __ SBC #$20
0d29 : 85 1c __ STA ACCU + 1 
.s3:
0d2b : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0d2c : ad 65 0d LDA $0d65 ; (seed + 1)
0d2f : 4a __ __ LSR
0d30 : ad 64 0d LDA $0d64 ; (seed + 0)
0d33 : 6a __ __ ROR
0d34 : aa __ __ TAX
0d35 : a9 00 __ LDA #$00
0d37 : 6a __ __ ROR
0d38 : 4d 64 0d EOR $0d64 ; (seed + 0)
0d3b : 85 1b __ STA ACCU + 0 
0d3d : 8a __ __ TXA
0d3e : 4d 65 0d EOR $0d65 ; (seed + 1)
0d41 : 85 1c __ STA ACCU + 1 
0d43 : 4a __ __ LSR
0d44 : 45 1b __ EOR ACCU + 0 
0d46 : 8d 64 0d STA $0d64 ; (seed + 0)
0d49 : 85 1b __ STA ACCU + 0 
0d4b : 45 1c __ EOR ACCU + 1 
0d4d : 8d 65 0d STA $0d65 ; (seed + 1)
0d50 : 85 1c __ STA ACCU + 1 
.s3:
0d52 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0d53 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
clrmask:
0d54 : __ __ __ BYT 3f 3f cf cf f3 f3 fc fc                         : ??......
--------------------------------------------------------------------
setmask:
0d5c : __ __ __ BYT c0 c0 30 30 0c 0c 03 03                         : ..00....
--------------------------------------------------------------------
seed:
0d64 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
Hirows:
0d66 : __ __ __ BSS	50
--------------------------------------------------------------------
pfirst:
0d98 : __ __ __ BSS	2
--------------------------------------------------------------------
particles:
0d9a : __ __ __ BSS	2816
--------------------------------------------------------------------
pfree:
189a : __ __ __ BSS	2
