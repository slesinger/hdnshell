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
080e : 8e fa 0b STX $0bfa ; (spentry + 0)
0811 : a2 0c __ LDX #$0c
0813 : a0 10 __ LDY #$10
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0c __ CPX #$0c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 10 __ CPY #$10
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 f4 __ LDA #$f4
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
;  25, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbfixed.c"
.s1:
0880 : a5 53 __ LDA T8 + 0 
0882 : 8d f6 9f STA $9ff6 ; (main@stack + 0)
0885 : a5 54 __ LDA T8 + 1 
0887 : 8d f7 9f STA $9ff7 ; (main@stack + 1)
088a : a5 55 __ LDA T9 + 0 
088c : 8d f8 9f STA $9ff8 ; (main@stack + 2)
.s4:
088f : a9 00 __ LDA #$00
0891 : 85 0f __ STA P2 
0893 : 85 10 __ STA P3 
0895 : a9 a5 __ LDA #$a5
0897 : 8d fa ff STA $fffa 
089a : a9 0a __ LDA #$0a
089c : 8d fb ff STA $fffb 
089f : a9 c3 __ LDA #$c3
08a1 : 8d fe ff STA $fffe 
08a4 : a9 0a __ LDA #$0a
08a6 : 8d ff ff STA $ffff 
08a9 : a9 35 __ LDA #$35
08ab : 85 01 __ STA $01 
08ad : a9 40 __ LDA #$40
08af : 85 11 __ STA P4 
08b1 : a9 1f __ LDA #$1f
08b3 : 85 12 __ STA P5 
08b5 : a9 3b __ LDA #$3b
08b7 : 8d 11 d0 STA $d011 
08ba : a9 18 __ LDA #$18
08bc : 8d 16 d0 STA $d016 
08bf : ad 00 dd LDA $dd00 
08c2 : 29 fc __ AND #$fc
08c4 : 8d 00 dd STA $dd00 
08c7 : a9 28 __ LDA #$28
08c9 : 8d 18 d0 STA $d018 
08cc : a9 00 __ LDA #$00
08ce : 8d 21 d0 STA $d021 
08d1 : 85 0d __ STA P0 
08d3 : a9 e0 __ LDA #$e0
08d5 : 85 0e __ STA P1 
08d7 : 20 da 0a JSR $0ada ; (memset.s4 + 0)
08da : a9 27 __ LDA #$27
08dc : a2 fa __ LDX #$fa
.l6:
08de : ca __ __ DEX
08df : 9d 00 c8 STA $c800,x 
08e2 : 9d fa c8 STA $c8fa,x 
08e5 : 9d f4 c9 STA $c9f4,x 
08e8 : 9d ee ca STA $caee,x 
08eb : d0 f1 __ BNE $08de ; (main.l6 + 0)
.s5:
08ed : a9 03 __ LDA #$03
08ef : a2 fa __ LDX #$fa
.l8:
08f1 : ca __ __ DEX
08f2 : 9d 00 d8 STA $d800,x 
08f5 : 9d fa d8 STA $d8fa,x 
08f8 : 9d f4 d9 STA $d9f4,x 
08fb : 9d ee da STA $daee,x 
08fe : d0 f1 __ BNE $08f1 ; (main.l8 + 0)
.s7:
0900 : a9 00 __ LDA #$00
0902 : 85 4f __ STA T5 + 0 
.l9:
0904 : a9 00 __ LDA #$00
0906 : 85 50 __ STA T6 + 0 
.l10:
0908 : 85 0d __ STA P0 
090a : a9 59 __ LDA #$59
090c : 85 10 __ STA P3 
090e : a9 99 __ LDA #$99
0910 : 85 0f __ STA P2 
0912 : 20 f6 0a JSR $0af6 ; (lmul16s@proxy + 0)
0915 : a5 1c __ LDA ACCU + 1 
0917 : 85 4d __ STA T4 + 0 
0919 : 38 __ __ SEC
091a : a5 1d __ LDA ACCU + 2 
091c : e9 28 __ SBC #$28
091e : 85 4e __ STA T4 + 1 
0920 : a5 4f __ LDA T5 + 0 
0922 : 85 0d __ STA P0 
0924 : a9 62 __ LDA #$62
0926 : 85 10 __ STA P3 
0928 : a9 4d __ LDA #$4d
092a : 85 0f __ STA P2 
092c : 20 f6 0a JSR $0af6 ; (lmul16s@proxy + 0)
092f : 38 __ __ SEC
0930 : a5 1c __ LDA ACCU + 1 
0932 : e9 33 __ SBC #$33
0934 : 85 4b __ STA T3 + 0 
0936 : a5 1d __ LDA ACCU + 2 
0938 : e9 13 __ SBC #$13
093a : 85 4c __ STA T3 + 1 
093c : a9 00 __ LDA #$00
093e : 85 51 __ STA T7 + 0 
0940 : 85 52 __ STA T7 + 1 
0942 : 85 53 __ STA T8 + 0 
0944 : 85 54 __ STA T8 + 1 
0946 : 85 55 __ STA T9 + 0 
.l11:
0948 : a6 51 __ LDX T7 + 0 
094a : a5 52 __ LDA T7 + 1 
094c : 10 0a __ BPL $0958 ; (main.s12 + 0)
.s24:
094e : 38 __ __ SEC
094f : a9 00 __ LDA #$00
0951 : e5 51 __ SBC T7 + 0 
0953 : aa __ __ TAX
0954 : a9 00 __ LDA #$00
0956 : e5 52 __ SBC T7 + 1 
.s12:
0958 : 86 0d __ STX P0 
095a : 86 0f __ STX P2 
095c : 85 0e __ STA P1 
095e : 85 10 __ STA P3 
0960 : 20 53 0b JSR $0b53 ; (lmul16u.s4 + 0)
0963 : a5 1b __ LDA ACCU + 0 
0965 : 85 47 __ STA T2 + 0 
0967 : a5 1c __ LDA ACCU + 1 
0969 : 85 45 __ STA T1 + 0 
096b : a5 1d __ LDA ACCU + 2 
096d : 85 46 __ STA T1 + 1 
096f : a5 1e __ LDA ACCU + 3 
0971 : 85 4a __ STA T2 + 3 
0973 : a6 53 __ LDX T8 + 0 
0975 : a5 54 __ LDA T8 + 1 
0977 : 10 0a __ BPL $0983 ; (main.s13 + 0)
.s23:
0979 : 38 __ __ SEC
097a : a9 00 __ LDA #$00
097c : e5 53 __ SBC T8 + 0 
097e : aa __ __ TAX
097f : a9 00 __ LDA #$00
0981 : e5 54 __ SBC T8 + 1 
.s13:
0983 : 86 0d __ STX P0 
0985 : 86 0f __ STX P2 
0987 : 85 0e __ STA P1 
0989 : 85 10 __ STA P3 
098b : 20 53 0b JSR $0b53 ; (lmul16u.s4 + 0)
098e : 18 __ __ CLC
098f : a5 1b __ LDA ACCU + 0 
0991 : 65 47 __ ADC T2 + 0 
0993 : a5 1c __ LDA ACCU + 1 
0995 : 65 45 __ ADC T1 + 0 
0997 : a5 1d __ LDA ACCU + 2 
0999 : 65 46 __ ADC T1 + 1 
099b : a5 1e __ LDA ACCU + 3 
099d : 65 4a __ ADC T2 + 3 
099f : c9 04 __ CMP #$04
09a1 : 90 4f __ BCC $09f2 ; (main.s14 + 0)
.s22:
09a3 : a5 4f __ LDA T5 + 0 
09a5 : 29 03 __ AND #$03
09a7 : 0a __ __ ASL
09a8 : 85 43 __ STA T0 + 0 
09aa : a5 4f __ LDA T5 + 0 
09ac : 29 7c __ AND #$7c
09ae : 85 45 __ STA T1 + 0 
09b0 : 4a __ __ LSR
09b1 : 4a __ __ LSR
09b2 : 65 45 __ ADC T1 + 0 
09b4 : 4a __ __ LSR
09b5 : 6a __ __ ROR
09b6 : aa __ __ TAX
09b7 : 29 80 __ AND #$80
09b9 : 6a __ __ ROR
09ba : 05 43 __ ORA T0 + 0 
09bc : 85 45 __ STA T1 + 0 
09be : a5 50 __ LDA T6 + 0 
09c0 : 29 fc __ AND #$fc
09c2 : 0a __ __ ASL
09c3 : a8 __ __ TAY
09c4 : 8a __ __ TXA
09c5 : 29 3f __ AND #$3f
09c7 : 69 e0 __ ADC #$e0
09c9 : 85 46 __ STA T1 + 1 
09cb : a5 50 __ LDA T6 + 0 
09cd : 29 03 __ AND #$03
09cf : 0a __ __ ASL
09d0 : aa __ __ TAX
09d1 : bd f3 0b LDA $0bf3,x ; (__shrtab192L + 0)
09d4 : 85 47 __ STA T2 + 0 
09d6 : a5 55 __ LDA T9 + 0 
09d8 : 29 07 __ AND #$07
09da : 0a __ __ ASL
09db : aa __ __ TAX
09dc : bd 00 0c LDA $0c00,x ; (colors[0] + 0)
09df : 25 47 __ AND T2 + 0 
09e1 : 11 45 __ ORA (T1 + 0),y 
09e3 : 91 45 __ STA (T1 + 0),y 
09e5 : bd 01 0c LDA $0c01,x ; (colors[0] + 1)
09e8 : 25 47 __ AND T2 + 0 
09ea : c8 __ __ INY
09eb : 11 45 __ ORA (T1 + 0),y 
09ed : 91 45 __ STA (T1 + 0),y 
09ef : 4c 59 0a JMP $0a59 ; (main.s19 + 0)
.s14:
09f2 : a5 51 __ LDA T7 + 0 
09f4 : 85 0d __ STA P0 
09f6 : a5 52 __ LDA T7 + 1 
09f8 : 85 0e __ STA P1 
09fa : a5 53 __ LDA T8 + 0 
09fc : 85 0f __ STA P2 
09fe : a5 54 __ LDA T8 + 1 
0a00 : 85 10 __ STA P3 
0a02 : a5 4a __ LDA T2 + 3 
0a04 : a2 04 __ LDX #$04
.l15:
0a06 : 4a __ __ LSR
0a07 : 66 46 __ ROR T1 + 1 
0a09 : 66 45 __ ROR T1 + 0 
0a0b : ca __ __ DEX
0a0c : d0 f8 __ BNE $0a06 ; (main.l15 + 0)
.s16:
0a0e : a5 1c __ LDA ACCU + 1 
0a10 : 85 43 __ STA T0 + 0 
0a12 : a5 1d __ LDA ACCU + 2 
0a14 : 85 44 __ STA T0 + 1 
0a16 : a5 1e __ LDA ACCU + 3 
0a18 : a2 04 __ LDX #$04
.l17:
0a1a : 4a __ __ LSR
0a1b : 66 44 __ ROR T0 + 1 
0a1d : 66 43 __ ROR T0 + 0 
0a1f : ca __ __ DEX
0a20 : d0 f8 __ BNE $0a1a ; (main.l17 + 0)
.s18:
0a22 : 38 __ __ SEC
0a23 : a5 45 __ LDA T1 + 0 
0a25 : e5 43 __ SBC T0 + 0 
0a27 : a8 __ __ TAY
0a28 : a5 46 __ LDA T1 + 1 
0a2a : e5 44 __ SBC T0 + 1 
0a2c : aa __ __ TAX
0a2d : 98 __ __ TYA
0a2e : 18 __ __ CLC
0a2f : 65 4d __ ADC T4 + 0 
0a31 : 85 51 __ STA T7 + 0 
0a33 : 8a __ __ TXA
0a34 : 65 4e __ ADC T4 + 1 
0a36 : 85 52 __ STA T7 + 1 
0a38 : 20 7a 0b JSR $0b7a ; (lmul4f12s.s4 + 0)
0a3b : a5 1b __ LDA ACCU + 0 
0a3d : 0a __ __ ASL
0a3e : a8 __ __ TAY
0a3f : a5 1c __ LDA ACCU + 1 
0a41 : 2a __ __ ROL
0a42 : aa __ __ TAX
0a43 : 98 __ __ TYA
0a44 : 18 __ __ CLC
0a45 : 65 4b __ ADC T3 + 0 
0a47 : 85 53 __ STA T8 + 0 
0a49 : 8a __ __ TXA
0a4a : 65 4c __ ADC T3 + 1 
0a4c : 85 54 __ STA T8 + 1 
0a4e : e6 55 __ INC T9 + 0 
0a50 : a5 55 __ LDA T9 + 0 
0a52 : c9 20 __ CMP #$20
0a54 : b0 03 __ BCS $0a59 ; (main.s19 + 0)
0a56 : 4c 48 09 JMP $0948 ; (main.l11 + 0)
.s19:
0a59 : e6 50 __ INC T6 + 0 
0a5b : a5 50 __ LDA T6 + 0 
0a5d : c9 a0 __ CMP #$a0
0a5f : b0 03 __ BCS $0a64 ; (main.s20 + 0)
0a61 : 4c 08 09 JMP $0908 ; (main.l10 + 0)
.s20:
0a64 : e6 4f __ INC T5 + 0 
0a66 : a5 4f __ LDA T5 + 0 
0a68 : c9 64 __ CMP #$64
0a6a : b0 03 __ BCS $0a6f ; (main.s21 + 0)
0a6c : 4c 04 09 JMP $0904 ; (main.l9 + 0)
.s21:
0a6f : a9 36 __ LDA #$36
0a71 : 85 01 __ STA $01 
0a73 : 20 ec 0b JSR $0bec ; (getch.l4 + 0)
0a76 : a9 1b __ LDA #$1b
0a78 : 8d 11 d0 STA $d011 
0a7b : a9 08 __ LDA #$08
0a7d : 8d 16 d0 STA $d016 
0a80 : ad 00 dd LDA $dd00 
0a83 : 29 fc __ AND #$fc
0a85 : 09 03 __ ORA #$03
0a87 : 8d 00 dd STA $dd00 
0a8a : a9 00 __ LDA #$00
0a8c : 85 1b __ STA ACCU + 0 
0a8e : 85 1c __ STA ACCU + 1 
0a90 : a9 14 __ LDA #$14
0a92 : 8d 18 d0 STA $d018 
.s3:
0a95 : ad f6 9f LDA $9ff6 ; (main@stack + 0)
0a98 : 85 53 __ STA T8 + 0 
0a9a : ad f7 9f LDA $9ff7 ; (main@stack + 1)
0a9d : 85 54 __ STA T8 + 1 
0a9f : ad f8 9f LDA $9ff8 ; (main@stack + 2)
0aa2 : 85 55 __ STA T9 + 0 
0aa4 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0aa5 : 48 __ __ PHA
0aa6 : 8a __ __ TXA
0aa7 : 48 __ __ PHA
0aa8 : a9 0a __ LDA #$0a
0aaa : 48 __ __ PHA
0aab : a9 bc __ LDA #$bc
0aad : 48 __ __ PHA
0aae : ba __ __ TSX
0aaf : bd 05 01 LDA $0105,x 
0ab2 : 48 __ __ PHA
0ab3 : a6 01 __ LDX $01 
0ab5 : a9 36 __ LDA #$36
0ab7 : 85 01 __ STA $01 
0ab9 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0abc : 86 01 __ STX $01 
0abe : 68 __ __ PLA
0abf : aa __ __ TAX
0ac0 : 68 __ __ PLA
0ac1 : 40 __ __ RTI
0ac2 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0ac3 : 48 __ __ PHA
0ac4 : 8a __ __ TXA
0ac5 : 48 __ __ PHA
0ac6 : a9 0a __ LDA #$0a
0ac8 : 48 __ __ PHA
0ac9 : a9 bc __ LDA #$bc
0acb : 48 __ __ PHA
0acc : ba __ __ TSX
0acd : bd 05 01 LDA $0105,x 
0ad0 : 48 __ __ PHA
0ad1 : a6 01 __ LDX $01 
0ad3 : a9 36 __ LDA #$36
0ad5 : 85 01 __ STA $01 
0ad7 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0ada : a5 0f __ LDA P2 
0adc : a6 12 __ LDX P5 
0ade : f0 0c __ BEQ $0aec ; (memset.s4 + 18)
0ae0 : a0 00 __ LDY #$00
0ae2 : 91 0d __ STA (P0),y 
0ae4 : c8 __ __ INY
0ae5 : d0 fb __ BNE $0ae2 ; (memset.s4 + 8)
0ae7 : e6 0e __ INC P1 
0ae9 : ca __ __ DEX
0aea : d0 f6 __ BNE $0ae2 ; (memset.s4 + 8)
0aec : a4 11 __ LDY P4 
0aee : f0 05 __ BEQ $0af5 ; (memset.s3 + 0)
0af0 : 88 __ __ DEY
0af1 : 91 0d __ STA (P0),y 
0af3 : d0 fb __ BNE $0af0 ; (memset.s4 + 22)
.s3:
0af5 : 60 __ __ RTS
--------------------------------------------------------------------
lmul16s@proxy: ; lmul16s@proxy
0af6 : a9 00 __ LDA #$00
0af8 : 85 0e __ STA P1 
--------------------------------------------------------------------
lmul16s: ; lmul16s(i16,i16)->i32
;   8, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
0afa : 24 10 __ BIT P3 
0afc : 10 1a __ BPL $0b18 ; (lmul16s.s4 + 30)
0afe : 38 __ __ SEC
0aff : a9 00 __ LDA #$00
0b01 : e5 0f __ SBC P2 
0b03 : 85 0f __ STA P2 
0b05 : a9 00 __ LDA #$00
0b07 : e5 10 __ SBC P3 
0b09 : 85 10 __ STA P3 
0b0b : 38 __ __ SEC
0b0c : a9 00 __ LDA #$00
0b0e : e5 0d __ SBC P0 
0b10 : 85 0d __ STA P0 
0b12 : a9 00 __ LDA #$00
0b14 : e5 0e __ SBC P1 
0b16 : 85 0e __ STA P1 
0b18 : a2 0f __ LDX #$0f
0b1a : a9 00 __ LDA #$00
0b1c : 85 1d __ STA ACCU + 2 
0b1e : 46 0e __ LSR P1 
0b20 : 66 0d __ ROR P0 
0b22 : 90 0b __ BCC $0b2f ; (lmul16s.s4 + 53)
0b24 : a8 __ __ TAY
0b25 : 18 __ __ CLC
0b26 : a5 1d __ LDA ACCU + 2 
0b28 : 65 0f __ ADC P2 
0b2a : 85 1d __ STA ACCU + 2 
0b2c : 98 __ __ TYA
0b2d : 65 10 __ ADC P3 
0b2f : 6a __ __ ROR
0b30 : 66 1d __ ROR ACCU + 2 
0b32 : 66 1c __ ROR ACCU + 1 
0b34 : 66 1b __ ROR ACCU + 0 
0b36 : ca __ __ DEX
0b37 : d0 e5 __ BNE $0b1e ; (lmul16s.s4 + 36)
0b39 : 46 0d __ LSR P0 
0b3b : 90 0c __ BCC $0b49 ; (lmul16s.s4 + 79)
0b3d : a8 __ __ TAY
0b3e : 38 __ __ SEC
0b3f : a5 1d __ LDA ACCU + 2 
0b41 : e5 0f __ SBC P2 
0b43 : 85 1d __ STA ACCU + 2 
0b45 : 98 __ __ TYA
0b46 : e5 10 __ SBC P3 
0b48 : 38 __ __ SEC
0b49 : 6a __ __ ROR
0b4a : 66 1d __ ROR ACCU + 2 
0b4c : 66 1c __ ROR ACCU + 1 
0b4e : 66 1b __ ROR ACCU + 0 
0b50 : 85 1e __ STA ACCU + 3 
.s3:
0b52 : 60 __ __ RTS
--------------------------------------------------------------------
lmul16u: ; lmul16u(u16,u16)->u32
;   5, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
0b53 : a9 00 __ LDA #$00
0b55 : 85 1d __ STA ACCU + 2 
0b57 : 85 1e __ STA ACCU + 3 
0b59 : a2 10 __ LDX #$10
0b5b : 46 0e __ LSR P1 
0b5d : 66 0d __ ROR P0 
0b5f : 90 0d __ BCC $0b6e ; (lmul16u.s4 + 27)
0b61 : 18 __ __ CLC
0b62 : a5 1d __ LDA ACCU + 2 
0b64 : 65 0f __ ADC P2 
0b66 : 85 1d __ STA ACCU + 2 
0b68 : a5 1e __ LDA ACCU + 3 
0b6a : 65 10 __ ADC P3 
0b6c : 85 1e __ STA ACCU + 3 
0b6e : 66 1e __ ROR ACCU + 3 
0b70 : 66 1d __ ROR ACCU + 2 
0b72 : 66 1c __ ROR ACCU + 1 
0b74 : 66 1b __ ROR ACCU + 0 
0b76 : ca __ __ DEX
0b77 : d0 e2 __ BNE $0b5b ; (lmul16u.s4 + 8)
.s3:
0b79 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
0b7a : 38 __ __ SEC
0b7b : a5 0d __ LDA P0 
0b7d : 6a __ __ ROR
0b7e : 85 1b __ STA ACCU + 0 
0b80 : a9 00 __ LDA #$00
0b82 : 85 1c __ STA ACCU + 1 
0b84 : 90 0b __ BCC $0b91 ; (lmul4f12s.s4 + 23)
0b86 : a8 __ __ TAY
0b87 : 18 __ __ CLC
0b88 : a5 1c __ LDA ACCU + 1 
0b8a : 65 0f __ ADC P2 
0b8c : 85 1c __ STA ACCU + 1 
0b8e : 98 __ __ TYA
0b8f : 65 10 __ ADC P3 
0b91 : 6a __ __ ROR
0b92 : 66 1c __ ROR ACCU + 1 
0b94 : 46 1b __ LSR ACCU + 0 
0b96 : 90 f9 __ BCC $0b91 ; (lmul4f12s.s4 + 23)
0b98 : d0 ec __ BNE $0b86 ; (lmul4f12s.s4 + 12)
0b9a : a6 0e __ LDX P1 
0b9c : 86 1b __ STX ACCU + 0 
0b9e : a2 07 __ LDX #$07
0ba0 : 46 1b __ LSR ACCU + 0 
0ba2 : 90 0b __ BCC $0baf ; (lmul4f12s.s4 + 53)
0ba4 : a8 __ __ TAY
0ba5 : 18 __ __ CLC
0ba6 : a5 1c __ LDA ACCU + 1 
0ba8 : 65 0f __ ADC P2 
0baa : 85 1c __ STA ACCU + 1 
0bac : 98 __ __ TYA
0bad : 65 10 __ ADC P3 
0baf : 6a __ __ ROR
0bb0 : 66 1c __ ROR ACCU + 1 
0bb2 : 66 1b __ ROR ACCU + 0 
0bb4 : ca __ __ DEX
0bb5 : d0 eb __ BNE $0ba2 ; (lmul4f12s.s4 + 40)
0bb7 : 90 0a __ BCC $0bc3 ; (lmul4f12s.s4 + 73)
0bb9 : a8 __ __ TAY
0bba : a5 1c __ LDA ACCU + 1 
0bbc : e5 0f __ SBC P2 
0bbe : 85 1c __ STA ACCU + 1 
0bc0 : 98 __ __ TYA
0bc1 : e5 10 __ SBC P3 
0bc3 : 6a __ __ ROR
0bc4 : 66 1c __ ROR ACCU + 1 
0bc6 : 66 1b __ ROR ACCU + 0 
0bc8 : 24 10 __ BIT P3 
0bca : 10 0b __ BPL $0bd7 ; (lmul4f12s.s4 + 93)
0bcc : aa __ __ TAX
0bcd : 38 __ __ SEC
0bce : a5 1c __ LDA ACCU + 1 
0bd0 : e5 0d __ SBC P0 
0bd2 : 85 1c __ STA ACCU + 1 
0bd4 : 8a __ __ TXA
0bd5 : e5 0e __ SBC P1 
0bd7 : 4a __ __ LSR
0bd8 : 66 1c __ ROR ACCU + 1 
0bda : 66 1b __ ROR ACCU + 0 
0bdc : 4a __ __ LSR
0bdd : 66 1c __ ROR ACCU + 1 
0bdf : 66 1b __ ROR ACCU + 0 
0be1 : 4a __ __ LSR
0be2 : 66 1c __ ROR ACCU + 1 
0be4 : 66 1b __ ROR ACCU + 0 
0be6 : 4a __ __ LSR
0be7 : 66 1c __ ROR ACCU + 1 
0be9 : 66 1b __ ROR ACCU + 0 
.s3:
0beb : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->void
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
0bec : 20 e4 ff JSR $ffe4 
0bef : aa __ __ TAX
0bf0 : f0 fa __ BEQ $0bec ; (getch.l4 + 0)
.s3:
0bf2 : 60 __ __ RTS
--------------------------------------------------------------------
__shrtab192L:
0bf3 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
spentry:
0bfa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
colors:
0c00 : __ __ __ BYT ff ff ee bb aa aa 88 22 44 11 55 55 dd 77 33 cc : ......."D.UU.w3.
