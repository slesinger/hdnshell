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
080e : 8e 5e 1c STX $1c5e ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 00 __ LDY #$00
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 28 __ CPX #$28
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 9a __ LDA #$9a
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  28, "/home/honza/projects/c64/projects/oscar64/samples/memmap/charsetlo.c"
.s1:
0a00 : a5 53 __ LDA T0 + 0 
0a02 : 8d 9c 9f STA $9f9c ; (main@stack + 0)
.s4:
0a05 : a9 00 __ LDA #$00
0a07 : 85 53 __ STA T0 + 0 
0a09 : 85 0d __ STA P0 
0a0b : 85 0e __ STA P1 
0a0d : a9 04 __ LDA #$04
0a0f : 85 0f __ STA P2 
0a11 : a9 20 __ LDA #$20
0a13 : 85 11 __ STA P4 
0a15 : a9 00 __ LDA #$00
0a17 : 85 10 __ STA P3 
0a19 : 20 47 0a JSR $0a47 ; (vic_setmode.s4 + 0)
.l5:
0a1c : a9 50 __ LDA #$50
0a1e : 8d fc 9f STA $9ffc ; (sstack + 8)
0a21 : a9 17 __ LDA #$17
0a23 : 8d fd 9f STA $9ffd ; (sstack + 9)
0a26 : a5 53 __ LDA T0 + 0 
0a28 : 8d fe 9f STA $9ffe ; (sstack + 10)
0a2b : a9 00 __ LDA #$00
0a2d : 8d ff 9f STA $9fff ; (sstack + 11)
0a30 : 20 99 0a JSR $0a99 ; (printf.s4 + 0)
0a33 : e6 53 __ INC T0 + 0 
0a35 : a5 53 __ LDA T0 + 0 
0a37 : c9 0a __ CMP #$0a
0a39 : 90 e1 __ BCC $0a1c ; (main.l5 + 0)
.s6:
0a3b : a9 00 __ LDA #$00
0a3d : 85 1b __ STA ACCU + 0 
0a3f : 85 1c __ STA ACCU + 1 
.s3:
0a41 : ad 9c 9f LDA $9f9c ; (main@stack + 0)
0a44 : 85 53 __ STA T0 + 0 
0a46 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a47 : a4 0d __ LDY P0 ; (mode + 0)
0a49 : c0 02 __ CPY #$02
0a4b : d0 09 __ BNE $0a56 ; (vic_setmode.s5 + 0)
.s10:
0a4d : a9 5b __ LDA #$5b
0a4f : 8d 11 d0 STA $d011 
.s8:
0a52 : a9 08 __ LDA #$08
0a54 : d0 0c __ BNE $0a62 ; (vic_setmode.s7 + 0)
.s5:
0a56 : b0 36 __ BCS $0a8e ; (vic_setmode.s6 + 0)
.s9:
0a58 : a9 1b __ LDA #$1b
0a5a : 8d 11 d0 STA $d011 
0a5d : 98 __ __ TYA
0a5e : f0 f2 __ BEQ $0a52 ; (vic_setmode.s8 + 0)
.s11:
0a60 : a9 18 __ LDA #$18
.s7:
0a62 : 8d 16 d0 STA $d016 
0a65 : ad 00 dd LDA $dd00 
0a68 : 29 fc __ AND #$fc
0a6a : 85 1b __ STA ACCU + 0 
0a6c : a5 0f __ LDA P2 ; (text + 1)
0a6e : 0a __ __ ASL
0a6f : 2a __ __ ROL
0a70 : 29 01 __ AND #$01
0a72 : 2a __ __ ROL
0a73 : 49 03 __ EOR #$03
0a75 : 05 1b __ ORA ACCU + 0 
0a77 : 8d 00 dd STA $dd00 
0a7a : a5 0f __ LDA P2 ; (text + 1)
0a7c : 29 3c __ AND #$3c
0a7e : 0a __ __ ASL
0a7f : 0a __ __ ASL
0a80 : 85 1b __ STA ACCU + 0 
0a82 : a5 11 __ LDA P4 ; (font + 1)
0a84 : 29 38 __ AND #$38
0a86 : 4a __ __ LSR
0a87 : 4a __ __ LSR
0a88 : 05 1b __ ORA ACCU + 0 
0a8a : 8d 18 d0 STA $d018 
.s3:
0a8d : 60 __ __ RTS
.s6:
0a8e : a9 3b __ LDA #$3b
0a90 : 8d 11 d0 STA $d011 
0a93 : c0 03 __ CPY #$03
0a95 : d0 c9 __ BNE $0a60 ; (vic_setmode.s11 + 0)
0a97 : f0 b9 __ BEQ $0a52 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
0a99 : a9 01 __ LDA #$01
0a9b : 8d fb 9f STA $9ffb ; (sstack + 7)
0a9e : a9 a0 __ LDA #$a0
0aa0 : 8d f5 9f STA $9ff5 ; (sstack + 1)
0aa3 : a9 9f __ LDA #$9f
0aa5 : 8d f6 9f STA $9ff6 ; (sstack + 2)
0aa8 : ad fc 9f LDA $9ffc ; (sstack + 8)
0aab : 8d f7 9f STA $9ff7 ; (sstack + 3)
0aae : ad fd 9f LDA $9ffd ; (sstack + 9)
0ab1 : 8d f8 9f STA $9ff8 ; (sstack + 4)
0ab4 : a9 fe __ LDA #$fe
0ab6 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0ab9 : a9 9f __ LDA #$9f
0abb : 8d fa 9f STA $9ffa ; (sstack + 6)
0abe : 4c c1 0a JMP $0ac1 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
0ac1 : a2 09 __ LDX #$09
0ac3 : b5 53 __ LDA T1 + 0,x 
0ac5 : 9d d2 9f STA $9fd2,x ; (sformat@stack + 0)
0ac8 : ca __ __ DEX
0ac9 : 10 f8 __ BPL $0ac3 ; (sformat.s1 + 2)
.s4:
0acb : ad f7 9f LDA $9ff7 ; (sstack + 3)
0ace : 85 55 __ STA T3 + 0 
0ad0 : a9 00 __ LDA #$00
0ad2 : 85 5b __ STA T6 + 0 
0ad4 : ad f8 9f LDA $9ff8 ; (sstack + 4)
0ad7 : 85 56 __ STA T3 + 1 
0ad9 : ad f5 9f LDA $9ff5 ; (sstack + 1)
0adc : 85 57 __ STA T4 + 0 
0ade : ad f6 9f LDA $9ff6 ; (sstack + 2)
0ae1 : 85 58 __ STA T4 + 1 
.l5:
0ae3 : a0 00 __ LDY #$00
0ae5 : b1 55 __ LDA (T3 + 0),y 
0ae7 : d0 36 __ BNE $0b1f ; (sformat.s10 + 0)
.s6:
0ae9 : a4 5b __ LDY T6 + 0 
0aeb : 91 57 __ STA (T4 + 0),y 
0aed : 98 __ __ TYA
0aee : f0 28 __ BEQ $0b18 ; (sformat.s95 + 0)
.s7:
0af0 : ad fb 9f LDA $9ffb ; (sstack + 7)
0af3 : d0 18 __ BNE $0b0d ; (sformat.s9 + 0)
.s8:
0af5 : 98 __ __ TYA
0af6 : 18 __ __ CLC
0af7 : 65 57 __ ADC T4 + 0 
0af9 : aa __ __ TAX
0afa : a5 58 __ LDA T4 + 1 
0afc : 69 00 __ ADC #$00
.s3:
0afe : 86 1b __ STX ACCU + 0 ; (buff + 1)
0b00 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0b02 : a2 09 __ LDX #$09
0b04 : bd d2 9f LDA $9fd2,x ; (sformat@stack + 0)
0b07 : 95 53 __ STA T1 + 0,x 
0b09 : ca __ __ DEX
0b0a : 10 f8 __ BPL $0b04 ; (sformat.s3 + 6)
0b0c : 60 __ __ RTS
.s9:
0b0d : a5 57 __ LDA T4 + 0 
0b0f : 85 0e __ STA P1 
0b11 : a5 58 __ LDA T4 + 1 
0b13 : 85 0f __ STA P2 
0b15 : 20 02 0f JSR $0f02 ; (puts.l4 + 0)
.s95:
0b18 : a5 58 __ LDA T4 + 1 
0b1a : a6 57 __ LDX T4 + 0 
0b1c : 4c fe 0a JMP $0afe ; (sformat.s3 + 0)
.s10:
0b1f : c9 25 __ CMP #$25
0b21 : f0 3e __ BEQ $0b61 ; (sformat.s15 + 0)
.s11:
0b23 : a4 5b __ LDY T6 + 0 
0b25 : 91 57 __ STA (T4 + 0),y 
0b27 : e6 55 __ INC T3 + 0 
0b29 : d0 02 __ BNE $0b2d ; (sformat.s117 + 0)
.s116:
0b2b : e6 56 __ INC T3 + 1 
.s117:
0b2d : c8 __ __ INY
0b2e : 84 5b __ STY T6 + 0 
0b30 : 98 __ __ TYA
0b31 : c0 28 __ CPY #$28
0b33 : 90 ae __ BCC $0ae3 ; (sformat.l5 + 0)
.s12:
0b35 : 85 43 __ STA T0 + 0 
0b37 : a9 00 __ LDA #$00
0b39 : 85 5b __ STA T6 + 0 
0b3b : ad fb 9f LDA $9ffb ; (sstack + 7)
0b3e : f0 14 __ BEQ $0b54 ; (sformat.s13 + 0)
.s14:
0b40 : a5 57 __ LDA T4 + 0 
0b42 : 85 0e __ STA P1 
0b44 : a5 58 __ LDA T4 + 1 
0b46 : 85 0f __ STA P2 
0b48 : a9 00 __ LDA #$00
0b4a : a4 43 __ LDY T0 + 0 
0b4c : 91 0e __ STA (P1),y 
0b4e : 20 02 0f JSR $0f02 ; (puts.l4 + 0)
0b51 : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s13:
0b54 : 18 __ __ CLC
0b55 : a5 57 __ LDA T4 + 0 
0b57 : 65 43 __ ADC T0 + 0 
0b59 : 85 57 __ STA T4 + 0 
0b5b : 90 86 __ BCC $0ae3 ; (sformat.l5 + 0)
.s118:
0b5d : e6 58 __ INC T4 + 1 
0b5f : b0 82 __ BCS $0ae3 ; (sformat.l5 + 0)
.s15:
0b61 : a5 5b __ LDA T6 + 0 
0b63 : f0 27 __ BEQ $0b8c ; (sformat.s16 + 0)
.s89:
0b65 : 84 5b __ STY T6 + 0 
0b67 : 85 43 __ STA T0 + 0 
0b69 : ad fb 9f LDA $9ffb ; (sstack + 7)
0b6c : f0 13 __ BEQ $0b81 ; (sformat.s90 + 0)
.s91:
0b6e : a5 57 __ LDA T4 + 0 
0b70 : 85 0e __ STA P1 
0b72 : a5 58 __ LDA T4 + 1 
0b74 : 85 0f __ STA P2 
0b76 : 98 __ __ TYA
0b77 : a4 43 __ LDY T0 + 0 
0b79 : 91 0e __ STA (P1),y 
0b7b : 20 02 0f JSR $0f02 ; (puts.l4 + 0)
0b7e : 4c 8c 0b JMP $0b8c ; (sformat.s16 + 0)
.s90:
0b81 : 18 __ __ CLC
0b82 : a5 57 __ LDA T4 + 0 
0b84 : 65 43 __ ADC T0 + 0 
0b86 : 85 57 __ STA T4 + 0 
0b88 : 90 02 __ BCC $0b8c ; (sformat.s16 + 0)
.s115:
0b8a : e6 58 __ INC T4 + 1 
.s16:
0b8c : a9 00 __ LDA #$00
0b8e : 8d e1 9f STA $9fe1 ; (si.sign + 0)
0b91 : 8d e2 9f STA $9fe2 ; (si.left + 0)
0b94 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
0b97 : a0 01 __ LDY #$01
0b99 : b1 55 __ LDA (T3 + 0),y 
0b9b : a2 20 __ LDX #$20
0b9d : 8e dc 9f STX $9fdc ; (si.fill + 0)
0ba0 : a2 00 __ LDX #$00
0ba2 : 8e dd 9f STX $9fdd ; (si.width + 0)
0ba5 : ca __ __ DEX
0ba6 : 8e de 9f STX $9fde ; (si.precision + 0)
0ba9 : a2 0a __ LDX #$0a
0bab : 8e e0 9f STX $9fe0 ; (si.base + 0)
0bae : aa __ __ TAX
0baf : a9 02 __ LDA #$02
0bb1 : d0 07 __ BNE $0bba ; (sformat.l17 + 0)
.s85:
0bb3 : a0 00 __ LDY #$00
0bb5 : b1 55 __ LDA (T3 + 0),y 
0bb7 : aa __ __ TAX
0bb8 : a9 01 __ LDA #$01
.l17:
0bba : 18 __ __ CLC
0bbb : 65 55 __ ADC T3 + 0 
0bbd : 85 55 __ STA T3 + 0 
0bbf : 90 02 __ BCC $0bc3 ; (sformat.s106 + 0)
.s105:
0bc1 : e6 56 __ INC T3 + 1 
.s106:
0bc3 : 8a __ __ TXA
0bc4 : e0 2b __ CPX #$2b
0bc6 : d0 07 __ BNE $0bcf ; (sformat.s18 + 0)
.s88:
0bc8 : a9 01 __ LDA #$01
0bca : 8d e1 9f STA $9fe1 ; (si.sign + 0)
0bcd : d0 e4 __ BNE $0bb3 ; (sformat.s85 + 0)
.s18:
0bcf : c9 30 __ CMP #$30
0bd1 : d0 06 __ BNE $0bd9 ; (sformat.s19 + 0)
.s87:
0bd3 : 8d dc 9f STA $9fdc ; (si.fill + 0)
0bd6 : 4c b3 0b JMP $0bb3 ; (sformat.s85 + 0)
.s19:
0bd9 : c9 23 __ CMP #$23
0bdb : d0 07 __ BNE $0be4 ; (sformat.s20 + 0)
.s86:
0bdd : a9 01 __ LDA #$01
0bdf : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
0be2 : d0 cf __ BNE $0bb3 ; (sformat.s85 + 0)
.s20:
0be4 : c9 2d __ CMP #$2d
0be6 : d0 07 __ BNE $0bef ; (sformat.s21 + 0)
.s84:
0be8 : a9 01 __ LDA #$01
0bea : 8d e2 9f STA $9fe2 ; (si.left + 0)
0bed : d0 c4 __ BNE $0bb3 ; (sformat.s85 + 0)
.s21:
0bef : 85 47 __ STA T2 + 0 
0bf1 : c9 30 __ CMP #$30
0bf3 : 90 3c __ BCC $0c31 ; (sformat.s22 + 0)
.s80:
0bf5 : c9 3a __ CMP #$3a
0bf7 : b0 77 __ BCS $0c70 ; (sformat.s23 + 0)
.s81:
0bf9 : a9 00 __ LDA #$00
0bfb : 85 53 __ STA T1 + 0 
.l82:
0bfd : a5 53 __ LDA T1 + 0 
0bff : 0a __ __ ASL
0c00 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c02 : a9 00 __ LDA #$00
0c04 : 2a __ __ ROL
0c05 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0c07 : 2a __ __ ROL
0c08 : aa __ __ TAX
0c09 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c0b : 65 53 __ ADC T1 + 0 
0c0d : 0a __ __ ASL
0c0e : 18 __ __ CLC
0c0f : 65 47 __ ADC T2 + 0 
0c11 : 38 __ __ SEC
0c12 : e9 30 __ SBC #$30
0c14 : 85 53 __ STA T1 + 0 
0c16 : a0 00 __ LDY #$00
0c18 : b1 55 __ LDA (T3 + 0),y 
0c1a : 85 47 __ STA T2 + 0 
0c1c : e6 55 __ INC T3 + 0 
0c1e : d0 02 __ BNE $0c22 ; (sformat.s114 + 0)
.s113:
0c20 : e6 56 __ INC T3 + 1 
.s114:
0c22 : c9 30 __ CMP #$30
0c24 : 90 04 __ BCC $0c2a ; (sformat.s104 + 0)
.s83:
0c26 : c9 3a __ CMP #$3a
0c28 : 90 d3 __ BCC $0bfd ; (sformat.l82 + 0)
.s104:
0c2a : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0c2c : a6 53 __ LDX T1 + 0 
0c2e : 8e dd 9f STX $9fdd ; (si.width + 0)
.s22:
0c31 : c9 2e __ CMP #$2e
0c33 : d0 3b __ BNE $0c70 ; (sformat.s23 + 0)
.s76:
0c35 : a9 00 __ LDA #$00
0c37 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0c39 : 4c 53 0c JMP $0c53 ; (sformat.l77 + 0)
.s79:
0c3c : a5 43 __ LDA T0 + 0 
0c3e : 0a __ __ ASL
0c3f : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c41 : 98 __ __ TYA
0c42 : 2a __ __ ROL
0c43 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0c45 : 2a __ __ ROL
0c46 : aa __ __ TAX
0c47 : 18 __ __ CLC
0c48 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c4a : 65 43 __ ADC T0 + 0 
0c4c : 0a __ __ ASL
0c4d : 18 __ __ CLC
0c4e : 65 47 __ ADC T2 + 0 
0c50 : 38 __ __ SEC
0c51 : e9 30 __ SBC #$30
.l77:
0c53 : 85 43 __ STA T0 + 0 
0c55 : a0 00 __ LDY #$00
0c57 : b1 55 __ LDA (T3 + 0),y 
0c59 : 85 47 __ STA T2 + 0 
0c5b : e6 55 __ INC T3 + 0 
0c5d : d0 02 __ BNE $0c61 ; (sformat.s108 + 0)
.s107:
0c5f : e6 56 __ INC T3 + 1 
.s108:
0c61 : c9 30 __ CMP #$30
0c63 : 90 04 __ BCC $0c69 ; (sformat.s103 + 0)
.s78:
0c65 : c9 3a __ CMP #$3a
0c67 : 90 d3 __ BCC $0c3c ; (sformat.s79 + 0)
.s103:
0c69 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0c6b : a6 43 __ LDX T0 + 0 
0c6d : 8e de 9f STX $9fde ; (si.precision + 0)
.s23:
0c70 : c9 64 __ CMP #$64
0c72 : f0 0c __ BEQ $0c80 ; (sformat.s75 + 0)
.s24:
0c74 : c9 44 __ CMP #$44
0c76 : f0 08 __ BEQ $0c80 ; (sformat.s75 + 0)
.s25:
0c78 : c9 69 __ CMP #$69
0c7a : f0 04 __ BEQ $0c80 ; (sformat.s75 + 0)
.s26:
0c7c : c9 49 __ CMP #$49
0c7e : d0 07 __ BNE $0c87 ; (sformat.s27 + 0)
.s75:
0c80 : a9 01 __ LDA #$01
.s93:
0c82 : 85 13 __ STA P6 
0c84 : 4c c8 0e JMP $0ec8 ; (sformat.s73 + 0)
.s27:
0c87 : c9 75 __ CMP #$75
0c89 : f0 04 __ BEQ $0c8f ; (sformat.s74 + 0)
.s28:
0c8b : c9 55 __ CMP #$55
0c8d : d0 04 __ BNE $0c93 ; (sformat.s29 + 0)
.s74:
0c8f : a9 00 __ LDA #$00
0c91 : f0 ef __ BEQ $0c82 ; (sformat.s93 + 0)
.s29:
0c93 : c9 78 __ CMP #$78
0c95 : f0 04 __ BEQ $0c9b ; (sformat.s72 + 0)
.s30:
0c97 : c9 58 __ CMP #$58
0c99 : d0 15 __ BNE $0cb0 ; (sformat.s31 + 0)
.s72:
0c9b : a5 47 __ LDA T2 + 0 
0c9d : 29 e0 __ AND #$e0
0c9f : 09 01 __ ORA #$01
0ca1 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ca4 : a9 00 __ LDA #$00
0ca6 : 85 13 __ STA P6 
0ca8 : a9 10 __ LDA #$10
0caa : 8d e0 9f STA $9fe0 ; (si.base + 0)
0cad : 4c c8 0e JMP $0ec8 ; (sformat.s73 + 0)
.s31:
0cb0 : c9 6c __ CMP #$6c
0cb2 : d0 03 __ BNE $0cb7 ; (sformat.s32 + 0)
0cb4 : 4c 39 0e JMP $0e39 ; (sformat.s60 + 0)
.s32:
0cb7 : c9 4c __ CMP #$4c
0cb9 : f0 f9 __ BEQ $0cb4 ; (sformat.s31 + 4)
.s33:
0cbb : c9 66 __ CMP #$66
0cbd : f0 14 __ BEQ $0cd3 ; (sformat.s59 + 0)
.s34:
0cbf : c9 67 __ CMP #$67
0cc1 : f0 10 __ BEQ $0cd3 ; (sformat.s59 + 0)
.s35:
0cc3 : c9 65 __ CMP #$65
0cc5 : f0 0c __ BEQ $0cd3 ; (sformat.s59 + 0)
.s36:
0cc7 : c9 46 __ CMP #$46
0cc9 : f0 08 __ BEQ $0cd3 ; (sformat.s59 + 0)
.s37:
0ccb : c9 47 __ CMP #$47
0ccd : f0 04 __ BEQ $0cd3 ; (sformat.s59 + 0)
.s38:
0ccf : c9 45 __ CMP #$45
0cd1 : d0 5c __ BNE $0d2f ; (sformat.s39 + 0)
.s59:
0cd3 : a5 57 __ LDA T4 + 0 
0cd5 : 85 13 __ STA P6 
0cd7 : a5 58 __ LDA T4 + 1 
0cd9 : 85 14 __ STA P7 
0cdb : a5 47 __ LDA T2 + 0 
0cdd : 29 e0 __ AND #$e0
0cdf : 09 01 __ ORA #$01
0ce1 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ce4 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0ce7 : 85 59 __ STA T5 + 0 
0ce9 : a9 dc __ LDA #$dc
0ceb : 85 11 __ STA P4 
0ced : a9 9f __ LDA #$9f
0cef : 85 12 __ STA P5 
0cf1 : ad fa 9f LDA $9ffa ; (sstack + 6)
0cf4 : 85 5a __ STA T5 + 1 
0cf6 : a0 00 __ LDY #$00
0cf8 : b1 59 __ LDA (T5 + 0),y 
0cfa : 85 15 __ STA P8 
0cfc : c8 __ __ INY
0cfd : b1 59 __ LDA (T5 + 0),y 
0cff : 85 16 __ STA P9 
0d01 : c8 __ __ INY
0d02 : b1 59 __ LDA (T5 + 0),y 
0d04 : 85 17 __ STA P10 
0d06 : c8 __ __ INY
0d07 : b1 59 __ LDA (T5 + 0),y 
0d09 : 85 18 __ STA P11 
0d0b : a5 47 __ LDA T2 + 0 
0d0d : ed df 9f SBC $9fdf ; (si.cha + 0)
0d10 : 18 __ __ CLC
0d11 : 69 61 __ ADC #$61
0d13 : 8d f4 9f STA $9ff4 ; (sstack + 0)
0d16 : 20 dd 11 JSR $11dd ; (nformf.s1 + 0)
0d19 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0d1b : 85 5b __ STA T6 + 0 
0d1d : 18 __ __ CLC
0d1e : a5 59 __ LDA T5 + 0 
0d20 : 69 04 __ ADC #$04
0d22 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0d25 : a5 5a __ LDA T5 + 1 
0d27 : 69 00 __ ADC #$00
0d29 : 8d fa 9f STA $9ffa ; (sstack + 6)
0d2c : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s39:
0d2f : c9 73 __ CMP #$73
0d31 : f0 3b __ BEQ $0d6e ; (sformat.s47 + 0)
.s40:
0d33 : c9 53 __ CMP #$53
0d35 : f0 37 __ BEQ $0d6e ; (sformat.s47 + 0)
.s41:
0d37 : c9 63 __ CMP #$63
0d39 : f0 12 __ BEQ $0d4d ; (sformat.s46 + 0)
.s42:
0d3b : c9 43 __ CMP #$43
0d3d : f0 0e __ BEQ $0d4d ; (sformat.s46 + 0)
.s43:
0d3f : aa __ __ TAX
0d40 : f0 ea __ BEQ $0d2c ; (sformat.s59 + 89)
.s44:
0d42 : a0 00 __ LDY #$00
0d44 : 91 57 __ STA (T4 + 0),y 
.s45:
0d46 : a9 01 __ LDA #$01
.s96:
0d48 : 85 5b __ STA T6 + 0 
0d4a : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s46:
0d4d : ad f9 9f LDA $9ff9 ; (sstack + 5)
0d50 : 85 43 __ STA T0 + 0 
0d52 : ad fa 9f LDA $9ffa ; (sstack + 6)
0d55 : 85 44 __ STA T0 + 1 
0d57 : a0 00 __ LDY #$00
0d59 : b1 43 __ LDA (T0 + 0),y 
0d5b : 91 57 __ STA (T4 + 0),y 
0d5d : a5 43 __ LDA T0 + 0 
0d5f : 69 01 __ ADC #$01
0d61 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0d64 : a5 44 __ LDA T0 + 1 
0d66 : 69 00 __ ADC #$00
0d68 : 8d fa 9f STA $9ffa ; (sstack + 6)
0d6b : 4c 46 0d JMP $0d46 ; (sformat.s45 + 0)
.s47:
0d6e : ad f9 9f LDA $9ff9 ; (sstack + 5)
0d71 : 85 43 __ STA T0 + 0 
0d73 : 69 01 __ ADC #$01
0d75 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0d78 : ad fa 9f LDA $9ffa ; (sstack + 6)
0d7b : 85 44 __ STA T0 + 1 
0d7d : 69 00 __ ADC #$00
0d7f : 8d fa 9f STA $9ffa ; (sstack + 6)
0d82 : a0 00 __ LDY #$00
0d84 : 84 5c __ STY T7 + 0 
0d86 : b1 43 __ LDA (T0 + 0),y 
0d88 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d8a : 85 53 __ STA T1 + 0 
0d8c : c8 __ __ INY
0d8d : b1 43 __ LDA (T0 + 0),y 
0d8f : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d91 : 85 54 __ STA T1 + 1 
0d93 : ad dd 9f LDA $9fdd ; (si.width + 0)
0d96 : f0 0c __ BEQ $0da4 ; (sformat.s48 + 0)
.s100:
0d98 : 88 __ __ DEY
0d99 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d9b : f0 05 __ BEQ $0da2 ; (sformat.s101 + 0)
.l58:
0d9d : c8 __ __ INY
0d9e : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0da0 : d0 fb __ BNE $0d9d ; (sformat.l58 + 0)
.s101:
0da2 : 84 5c __ STY T7 + 0 
.s48:
0da4 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0da7 : 85 59 __ STA T5 + 0 
0da9 : d0 19 __ BNE $0dc4 ; (sformat.s49 + 0)
.s98:
0dab : a6 5c __ LDX T7 + 0 
0dad : ec dd 9f CPX $9fdd ; (si.width + 0)
0db0 : a0 00 __ LDY #$00
0db2 : b0 0c __ BCS $0dc0 ; (sformat.s99 + 0)
.l57:
0db4 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0db7 : 91 57 __ STA (T4 + 0),y 
0db9 : c8 __ __ INY
0dba : e8 __ __ INX
0dbb : ec dd 9f CPX $9fdd ; (si.width + 0)
0dbe : 90 f4 __ BCC $0db4 ; (sformat.l57 + 0)
.s99:
0dc0 : 86 5c __ STX T7 + 0 
0dc2 : 84 5b __ STY T6 + 0 
.s49:
0dc4 : ac fb 9f LDY $9ffb ; (sstack + 7)
0dc7 : d0 48 __ BNE $0e11 ; (sformat.s54 + 0)
.s50:
0dc9 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0dcb : f0 23 __ BEQ $0df0 ; (sformat.s51 + 0)
.s53:
0dcd : 18 __ __ CLC
0dce : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0dd0 : 69 01 __ ADC #$01
0dd2 : 85 43 __ STA T0 + 0 
0dd4 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0dd6 : 69 00 __ ADC #$00
0dd8 : 85 44 __ STA T0 + 1 
0dda : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0ddc : a4 5b __ LDY T6 + 0 
0dde : 91 57 __ STA (T4 + 0),y 
0de0 : e6 5b __ INC T6 + 0 
0de2 : a0 00 __ LDY #$00
0de4 : b1 43 __ LDA (T0 + 0),y 
0de6 : a8 __ __ TAY
0de7 : e6 43 __ INC T0 + 0 
0de9 : d0 02 __ BNE $0ded ; (sformat.s112 + 0)
.s111:
0deb : e6 44 __ INC T0 + 1 
.s112:
0ded : 98 __ __ TYA
0dee : d0 ec __ BNE $0ddc ; (sformat.l92 + 0)
.s51:
0df0 : a5 59 __ LDA T5 + 0 
0df2 : d0 03 __ BNE $0df7 ; (sformat.s97 + 0)
0df4 : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s97:
0df7 : a6 5c __ LDX T7 + 0 
0df9 : ec dd 9f CPX $9fdd ; (si.width + 0)
0dfc : a4 5b __ LDY T6 + 0 
0dfe : b0 0c __ BCS $0e0c ; (sformat.s102 + 0)
.l52:
0e00 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0e03 : 91 57 __ STA (T4 + 0),y 
0e05 : c8 __ __ INY
0e06 : e8 __ __ INX
0e07 : ec dd 9f CPX $9fdd ; (si.width + 0)
0e0a : 90 f4 __ BCC $0e00 ; (sformat.l52 + 0)
.s102:
0e0c : 84 5b __ STY T6 + 0 
0e0e : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s54:
0e11 : a4 5b __ LDY T6 + 0 
0e13 : f0 11 __ BEQ $0e26 ; (sformat.s55 + 0)
.s56:
0e15 : a5 57 __ LDA T4 + 0 
0e17 : 85 0e __ STA P1 
0e19 : a5 58 __ LDA T4 + 1 
0e1b : 85 0f __ STA P2 
0e1d : a9 00 __ LDA #$00
0e1f : 85 5b __ STA T6 + 0 
0e21 : 91 0e __ STA (P1),y 
0e23 : 20 02 0f JSR $0f02 ; (puts.l4 + 0)
.s55:
0e26 : a5 53 __ LDA T1 + 0 
0e28 : 85 0e __ STA P1 
0e2a : a5 54 __ LDA T1 + 1 
0e2c : 85 0f __ STA P2 
0e2e : 20 02 0f JSR $0f02 ; (puts.l4 + 0)
0e31 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0e34 : d0 c1 __ BNE $0df7 ; (sformat.s97 + 0)
0e36 : 4c e3 0a JMP $0ae3 ; (sformat.l5 + 0)
.s60:
0e39 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0e3c : 85 43 __ STA T0 + 0 
0e3e : 69 03 __ ADC #$03
0e40 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0e43 : ad fa 9f LDA $9ffa ; (sstack + 6)
0e46 : 85 44 __ STA T0 + 1 
0e48 : 69 00 __ ADC #$00
0e4a : 8d fa 9f STA $9ffa ; (sstack + 6)
0e4d : a0 00 __ LDY #$00
0e4f : b1 55 __ LDA (T3 + 0),y 
0e51 : aa __ __ TAX
0e52 : e6 55 __ INC T3 + 0 
0e54 : d0 02 __ BNE $0e58 ; (sformat.s110 + 0)
.s109:
0e56 : e6 56 __ INC T3 + 1 
.s110:
0e58 : b1 43 __ LDA (T0 + 0),y 
0e5a : 85 1b __ STA ACCU + 0 ; (buff + 1)
0e5c : 85 11 __ STA P4 
0e5e : a0 01 __ LDY #$01
0e60 : b1 43 __ LDA (T0 + 0),y 
0e62 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0e64 : 85 12 __ STA P5 
0e66 : c8 __ __ INY
0e67 : b1 43 __ LDA (T0 + 0),y 
0e69 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0e6b : 85 13 __ STA P6 
0e6d : c8 __ __ INY
0e6e : b1 43 __ LDA (T0 + 0),y 
0e70 : 85 14 __ STA P7 
0e72 : e0 64 __ CPX #$64
0e74 : f0 0c __ BEQ $0e82 ; (sformat.s71 + 0)
.s61:
0e76 : e0 44 __ CPX #$44
0e78 : f0 08 __ BEQ $0e82 ; (sformat.s71 + 0)
.s62:
0e7a : e0 69 __ CPX #$69
0e7c : f0 04 __ BEQ $0e82 ; (sformat.s71 + 0)
.s63:
0e7e : e0 49 __ CPX #$49
0e80 : d0 1c __ BNE $0e9e ; (sformat.s64 + 0)
.s71:
0e82 : a9 01 __ LDA #$01
.s94:
0e84 : 85 15 __ STA P8 
.s69:
0e86 : a5 57 __ LDA T4 + 0 
0e88 : 85 0f __ STA P2 
0e8a : a5 58 __ LDA T4 + 1 
0e8c : 85 10 __ STA P3 
0e8e : a9 dc __ LDA #$dc
0e90 : 85 0d __ STA P0 
0e92 : a9 9f __ LDA #$9f
0e94 : 85 0e __ STA P1 
0e96 : 20 93 10 JSR $1093 ; (nforml.s4 + 0)
0e99 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e9b : 4c 48 0d JMP $0d48 ; (sformat.s96 + 0)
.s64:
0e9e : e0 75 __ CPX #$75
0ea0 : f0 04 __ BEQ $0ea6 ; (sformat.s70 + 0)
.s65:
0ea2 : e0 55 __ CPX #$55
0ea4 : d0 04 __ BNE $0eaa ; (sformat.s66 + 0)
.s70:
0ea6 : a9 00 __ LDA #$00
0ea8 : f0 da __ BEQ $0e84 ; (sformat.s94 + 0)
.s66:
0eaa : e0 78 __ CPX #$78
0eac : f0 06 __ BEQ $0eb4 ; (sformat.s68 + 0)
.s67:
0eae : 85 1e __ STA ACCU + 3 ; (fps + 0)
0eb0 : e0 58 __ CPX #$58
0eb2 : d0 82 __ BNE $0e36 ; (sformat.s55 + 16)
.s68:
0eb4 : a9 00 __ LDA #$00
0eb6 : 85 15 __ STA P8 
0eb8 : a9 10 __ LDA #$10
0eba : 8d e0 9f STA $9fe0 ; (si.base + 0)
0ebd : 8a __ __ TXA
0ebe : 29 e0 __ AND #$e0
0ec0 : 09 01 __ ORA #$01
0ec2 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ec5 : 4c 86 0e JMP $0e86 ; (sformat.s69 + 0)
.s73:
0ec8 : a5 57 __ LDA T4 + 0 
0eca : 85 0f __ STA P2 
0ecc : a5 58 __ LDA T4 + 1 
0ece : 85 10 __ STA P3 
0ed0 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0ed3 : 85 43 __ STA T0 + 0 
0ed5 : ad fa 9f LDA $9ffa ; (sstack + 6)
0ed8 : 85 44 __ STA T0 + 1 
0eda : a0 00 __ LDY #$00
0edc : b1 43 __ LDA (T0 + 0),y 
0ede : 85 11 __ STA P4 
0ee0 : c8 __ __ INY
0ee1 : b1 43 __ LDA (T0 + 0),y 
0ee3 : 85 12 __ STA P5 
0ee5 : 18 __ __ CLC
0ee6 : a5 43 __ LDA T0 + 0 
0ee8 : 69 02 __ ADC #$02
0eea : 8d f9 9f STA $9ff9 ; (sstack + 5)
0eed : a5 44 __ LDA T0 + 1 
0eef : 69 00 __ ADC #$00
0ef1 : 8d fa 9f STA $9ffa ; (sstack + 6)
0ef4 : a9 dc __ LDA #$dc
0ef6 : 85 0d __ STA P0 
0ef8 : a9 9f __ LDA #$9f
0efa : 85 0e __ STA P1 
0efc : 20 78 0f JSR $0f78 ; (nformi.s4 + 0)
0eff : 4c 48 0d JMP $0d48 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0f02 : a0 00 __ LDY #$00
0f04 : b1 0e __ LDA (P1),y ; (str + 0)
0f06 : d0 01 __ BNE $0f09 ; (puts.s5 + 0)
.s3:
0f08 : 60 __ __ RTS
.s5:
0f09 : e6 0e __ INC P1 ; (str + 0)
0f0b : d0 02 __ BNE $0f0f ; (puts.s7 + 0)
.s6:
0f0d : e6 0f __ INC P2 ; (str + 1)
.s7:
0f0f : 20 15 0f JSR $0f15 ; (putpch.s4 + 0)
0f12 : 4c 02 0f JMP $0f02 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0f15 : 85 0d __ STA P0 ; (c + 0)
0f17 : ad 5f 1c LDA $1c5f ; (giocharmap + 0)
0f1a : f0 32 __ BEQ $0f4e ; (putpch.s5 + 0)
.s6:
0f1c : a5 0d __ LDA P0 ; (c + 0)
0f1e : c9 0a __ CMP #$0a
0f20 : d0 04 __ BNE $0f26 ; (putpch.s7 + 0)
.s18:
0f22 : a9 0d __ LDA #$0d
0f24 : d0 32 __ BNE $0f58 ; (putpch.s15 + 0)
.s7:
0f26 : c9 09 __ CMP #$09
0f28 : f0 36 __ BEQ $0f60 ; (putpch.s16 + 0)
.s8:
0f2a : ad 5f 1c LDA $1c5f ; (giocharmap + 0)
0f2d : c9 02 __ CMP #$02
0f2f : 90 1d __ BCC $0f4e ; (putpch.s5 + 0)
.s9:
0f31 : a5 0d __ LDA P0 ; (c + 0)
0f33 : c9 41 __ CMP #$41
0f35 : 90 17 __ BCC $0f4e ; (putpch.s5 + 0)
.s10:
0f37 : c9 7b __ CMP #$7b
0f39 : b0 13 __ BCS $0f4e ; (putpch.s5 + 0)
.s11:
0f3b : c9 61 __ CMP #$61
0f3d : b0 04 __ BCS $0f43 ; (putpch.s13 + 0)
.s12:
0f3f : c9 5b __ CMP #$5b
0f41 : b0 0b __ BCS $0f4e ; (putpch.s5 + 0)
.s13:
0f43 : 49 20 __ EOR #$20
0f45 : 85 0d __ STA P0 ; (c + 0)
0f47 : ad 5f 1c LDA $1c5f ; (giocharmap + 0)
0f4a : c9 02 __ CMP #$02
0f4c : f0 06 __ BEQ $0f54 ; (putpch.s14 + 0)
.s5:
0f4e : a5 0d __ LDA P0 ; (c + 0)
0f50 : 20 d2 ff JSR $ffd2 
.s3:
0f53 : 60 __ __ RTS
.s14:
0f54 : a5 0d __ LDA P0 ; (c + 0)
0f56 : 29 5f __ AND #$5f
.s15:
0f58 : 85 43 __ STA T0 + 0 
0f5a : a5 43 __ LDA T0 + 0 
0f5c : 20 d2 ff JSR $ffd2 
0f5f : 60 __ __ RTS
.s16:
0f60 : a5 d3 __ LDA $d3 
0f62 : 29 03 __ AND #$03
0f64 : 85 43 __ STA T0 + 0 
0f66 : a9 20 __ LDA #$20
0f68 : 85 44 __ STA T1 + 0 
.l17:
0f6a : a5 44 __ LDA T1 + 0 
0f6c : 20 d2 ff JSR $ffd2 
0f6f : e6 43 __ INC T0 + 0 
0f71 : a5 43 __ LDA T0 + 0 
0f73 : c9 04 __ CMP #$04
0f75 : 90 f3 __ BCC $0f6a ; (putpch.l17 + 0)
0f77 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0f78 : a9 00 __ LDA #$00
0f7a : 85 43 __ STA T5 + 0 
0f7c : a0 04 __ LDY #$04
0f7e : b1 0d __ LDA (P0),y ; (si + 0)
0f80 : 85 44 __ STA T6 + 0 
0f82 : a5 13 __ LDA P6 ; (s + 0)
0f84 : f0 13 __ BEQ $0f99 ; (nformi.s5 + 0)
.s33:
0f86 : 24 12 __ BIT P5 ; (v + 1)
0f88 : 10 0f __ BPL $0f99 ; (nformi.s5 + 0)
.s34:
0f8a : 38 __ __ SEC
0f8b : a9 00 __ LDA #$00
0f8d : e5 11 __ SBC P4 ; (v + 0)
0f8f : 85 11 __ STA P4 ; (v + 0)
0f91 : a9 00 __ LDA #$00
0f93 : e5 12 __ SBC P5 ; (v + 1)
0f95 : 85 12 __ STA P5 ; (v + 1)
0f97 : e6 43 __ INC T5 + 0 
.s5:
0f99 : a9 10 __ LDA #$10
0f9b : 85 45 __ STA T7 + 0 
0f9d : a5 11 __ LDA P4 ; (v + 0)
0f9f : 05 12 __ ORA P5 ; (v + 1)
0fa1 : f0 33 __ BEQ $0fd6 ; (nformi.s6 + 0)
.s28:
0fa3 : a5 11 __ LDA P4 ; (v + 0)
0fa5 : 85 1b __ STA ACCU + 0 
0fa7 : a5 12 __ LDA P5 ; (v + 1)
0fa9 : 85 1c __ STA ACCU + 1 
.l29:
0fab : a5 44 __ LDA T6 + 0 
0fad : 85 03 __ STA WORK + 0 
0faf : a9 00 __ LDA #$00
0fb1 : 85 04 __ STA WORK + 1 
0fb3 : 20 42 1a JSR $1a42 ; (divmod + 0)
0fb6 : a5 05 __ LDA WORK + 2 
0fb8 : c9 0a __ CMP #$0a
0fba : b0 04 __ BCS $0fc0 ; (nformi.s32 + 0)
.s30:
0fbc : a9 30 __ LDA #$30
0fbe : 90 06 __ BCC $0fc6 ; (nformi.s31 + 0)
.s32:
0fc0 : a0 03 __ LDY #$03
0fc2 : b1 0d __ LDA (P0),y ; (si + 0)
0fc4 : e9 0a __ SBC #$0a
.s31:
0fc6 : 18 __ __ CLC
0fc7 : 65 05 __ ADC WORK + 2 
0fc9 : a6 45 __ LDX T7 + 0 
0fcb : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0fce : c6 45 __ DEC T7 + 0 
0fd0 : a5 1b __ LDA ACCU + 0 
0fd2 : 05 1c __ ORA ACCU + 1 
0fd4 : d0 d5 __ BNE $0fab ; (nformi.l29 + 0)
.s6:
0fd6 : a0 02 __ LDY #$02
0fd8 : b1 0d __ LDA (P0),y ; (si + 0)
0fda : c9 ff __ CMP #$ff
0fdc : d0 04 __ BNE $0fe2 ; (nformi.s27 + 0)
.s7:
0fde : a9 0f __ LDA #$0f
0fe0 : d0 05 __ BNE $0fe7 ; (nformi.s39 + 0)
.s27:
0fe2 : 38 __ __ SEC
0fe3 : a9 10 __ LDA #$10
0fe5 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0fe7 : a8 __ __ TAY
0fe8 : c4 45 __ CPY T7 + 0 
0fea : b0 0d __ BCS $0ff9 ; (nformi.s8 + 0)
.s26:
0fec : a9 30 __ LDA #$30
.l40:
0fee : a6 45 __ LDX T7 + 0 
0ff0 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0ff3 : c6 45 __ DEC T7 + 0 
0ff5 : c4 45 __ CPY T7 + 0 
0ff7 : 90 f5 __ BCC $0fee ; (nformi.l40 + 0)
.s8:
0ff9 : a0 07 __ LDY #$07
0ffb : b1 0d __ LDA (P0),y ; (si + 0)
0ffd : f0 1c __ BEQ $101b ; (nformi.s9 + 0)
.s24:
0fff : a5 44 __ LDA T6 + 0 
1001 : c9 10 __ CMP #$10
1003 : d0 16 __ BNE $101b ; (nformi.s9 + 0)
.s25:
1005 : a0 03 __ LDY #$03
1007 : b1 0d __ LDA (P0),y ; (si + 0)
1009 : a8 __ __ TAY
100a : a9 30 __ LDA #$30
100c : a6 45 __ LDX T7 + 0 
100e : ca __ __ DEX
100f : ca __ __ DEX
1010 : 86 45 __ STX T7 + 0 
1012 : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
1015 : 98 __ __ TYA
1016 : 69 16 __ ADC #$16
1018 : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
101b : a9 00 __ LDA #$00
101d : 85 1b __ STA ACCU + 0 
101f : a5 43 __ LDA T5 + 0 
1021 : f0 0c __ BEQ $102f ; (nformi.s10 + 0)
.s23:
1023 : a9 2d __ LDA #$2d
.s22:
1025 : a6 45 __ LDX T7 + 0 
1027 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
102a : c6 45 __ DEC T7 + 0 
102c : 4c 39 10 JMP $1039 ; (nformi.s11 + 0)
.s10:
102f : a0 05 __ LDY #$05
1031 : b1 0d __ LDA (P0),y ; (si + 0)
1033 : f0 04 __ BEQ $1039 ; (nformi.s11 + 0)
.s21:
1035 : a9 2b __ LDA #$2b
1037 : d0 ec __ BNE $1025 ; (nformi.s22 + 0)
.s11:
1039 : a6 45 __ LDX T7 + 0 
103b : a0 06 __ LDY #$06
103d : b1 0d __ LDA (P0),y ; (si + 0)
103f : d0 2b __ BNE $106c ; (nformi.s17 + 0)
.l12:
1041 : 8a __ __ TXA
1042 : 18 __ __ CLC
1043 : a0 01 __ LDY #$01
1045 : 71 0d __ ADC (P0),y ; (si + 0)
1047 : b0 04 __ BCS $104d ; (nformi.s15 + 0)
.s16:
1049 : c9 11 __ CMP #$11
104b : 90 0a __ BCC $1057 ; (nformi.s13 + 0)
.s15:
104d : a0 00 __ LDY #$00
104f : b1 0d __ LDA (P0),y ; (si + 0)
1051 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
1054 : ca __ __ DEX
1055 : b0 ea __ BCS $1041 ; (nformi.l12 + 0)
.s13:
1057 : e0 10 __ CPX #$10
1059 : b0 0e __ BCS $1069 ; (nformi.s41 + 0)
.s14:
105b : 88 __ __ DEY
.l37:
105c : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
105f : 91 0f __ STA (P2),y ; (str + 0)
1061 : c8 __ __ INY
1062 : e8 __ __ INX
1063 : e0 10 __ CPX #$10
1065 : 90 f5 __ BCC $105c ; (nformi.l37 + 0)
.s38:
1067 : 84 1b __ STY ACCU + 0 
.s41:
1069 : a5 1b __ LDA ACCU + 0 
.s3:
106b : 60 __ __ RTS
.s17:
106c : e0 10 __ CPX #$10
106e : b0 1a __ BCS $108a ; (nformi.l18 + 0)
.s20:
1070 : a0 00 __ LDY #$00
.l35:
1072 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
1075 : 91 0f __ STA (P2),y ; (str + 0)
1077 : c8 __ __ INY
1078 : e8 __ __ INX
1079 : e0 10 __ CPX #$10
107b : 90 f5 __ BCC $1072 ; (nformi.l35 + 0)
.s36:
107d : 84 1b __ STY ACCU + 0 
107f : b0 09 __ BCS $108a ; (nformi.l18 + 0)
.s19:
1081 : 88 __ __ DEY
1082 : b1 0d __ LDA (P0),y ; (si + 0)
1084 : a4 1b __ LDY ACCU + 0 
1086 : 91 0f __ STA (P2),y ; (str + 0)
1088 : e6 1b __ INC ACCU + 0 
.l18:
108a : a5 1b __ LDA ACCU + 0 
108c : a0 01 __ LDY #$01
108e : d1 0d __ CMP (P0),y ; (si + 0)
1090 : 90 ef __ BCC $1081 ; (nformi.s19 + 0)
1092 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
1093 : a9 00 __ LDA #$00
1095 : 85 43 __ STA T4 + 0 
1097 : a5 15 __ LDA P8 ; (s + 0)
1099 : f0 1f __ BEQ $10ba ; (nforml.s5 + 0)
.s35:
109b : 24 14 __ BIT P7 ; (v + 3)
109d : 10 1b __ BPL $10ba ; (nforml.s5 + 0)
.s36:
109f : 38 __ __ SEC
10a0 : a9 00 __ LDA #$00
10a2 : e5 11 __ SBC P4 ; (v + 0)
10a4 : 85 11 __ STA P4 ; (v + 0)
10a6 : a9 00 __ LDA #$00
10a8 : e5 12 __ SBC P5 ; (v + 1)
10aa : 85 12 __ STA P5 ; (v + 1)
10ac : a9 00 __ LDA #$00
10ae : e5 13 __ SBC P6 ; (v + 2)
10b0 : 85 13 __ STA P6 ; (v + 2)
10b2 : a9 00 __ LDA #$00
10b4 : e5 14 __ SBC P7 ; (v + 3)
10b6 : 85 14 __ STA P7 ; (v + 3)
10b8 : e6 43 __ INC T4 + 0 
.s5:
10ba : a9 10 __ LDA #$10
10bc : 85 44 __ STA T5 + 0 
10be : a5 14 __ LDA P7 ; (v + 3)
10c0 : f0 03 __ BEQ $10c5 ; (nforml.s31 + 0)
10c2 : 4c 8d 11 JMP $118d ; (nforml.l28 + 0)
.s31:
10c5 : a5 13 __ LDA P6 ; (v + 2)
10c7 : d0 f9 __ BNE $10c2 ; (nforml.s5 + 8)
.s32:
10c9 : a5 12 __ LDA P5 ; (v + 1)
10cb : d0 f5 __ BNE $10c2 ; (nforml.s5 + 8)
.s33:
10cd : c5 11 __ CMP P4 ; (v + 0)
10cf : 90 f1 __ BCC $10c2 ; (nforml.s5 + 8)
.s6:
10d1 : a0 02 __ LDY #$02
10d3 : b1 0d __ LDA (P0),y ; (si + 0)
10d5 : c9 ff __ CMP #$ff
10d7 : d0 04 __ BNE $10dd ; (nforml.s27 + 0)
.s7:
10d9 : a9 0f __ LDA #$0f
10db : d0 05 __ BNE $10e2 ; (nforml.s41 + 0)
.s27:
10dd : 38 __ __ SEC
10de : a9 10 __ LDA #$10
10e0 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
10e2 : a8 __ __ TAY
10e3 : c4 44 __ CPY T5 + 0 
10e5 : b0 0d __ BCS $10f4 ; (nforml.s8 + 0)
.s26:
10e7 : a9 30 __ LDA #$30
.l42:
10e9 : a6 44 __ LDX T5 + 0 
10eb : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
10ee : c6 44 __ DEC T5 + 0 
10f0 : c4 44 __ CPY T5 + 0 
10f2 : 90 f5 __ BCC $10e9 ; (nforml.l42 + 0)
.s8:
10f4 : a0 07 __ LDY #$07
10f6 : b1 0d __ LDA (P0),y ; (si + 0)
10f8 : f0 1d __ BEQ $1117 ; (nforml.s9 + 0)
.s24:
10fa : a0 04 __ LDY #$04
10fc : b1 0d __ LDA (P0),y ; (si + 0)
10fe : c9 10 __ CMP #$10
1100 : d0 15 __ BNE $1117 ; (nforml.s9 + 0)
.s25:
1102 : 88 __ __ DEY
1103 : b1 0d __ LDA (P0),y ; (si + 0)
1105 : a8 __ __ TAY
1106 : a9 30 __ LDA #$30
1108 : a6 44 __ LDX T5 + 0 
110a : ca __ __ DEX
110b : ca __ __ DEX
110c : 86 44 __ STX T5 + 0 
110e : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
1111 : 98 __ __ TYA
1112 : 69 16 __ ADC #$16
1114 : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
1117 : a9 00 __ LDA #$00
1119 : 85 1b __ STA ACCU + 0 
111b : a5 43 __ LDA T4 + 0 
111d : f0 0c __ BEQ $112b ; (nforml.s10 + 0)
.s23:
111f : a9 2d __ LDA #$2d
.s22:
1121 : a6 44 __ LDX T5 + 0 
1123 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
1126 : c6 44 __ DEC T5 + 0 
1128 : 4c 35 11 JMP $1135 ; (nforml.s11 + 0)
.s10:
112b : a0 05 __ LDY #$05
112d : b1 0d __ LDA (P0),y ; (si + 0)
112f : f0 04 __ BEQ $1135 ; (nforml.s11 + 0)
.s21:
1131 : a9 2b __ LDA #$2b
1133 : d0 ec __ BNE $1121 ; (nforml.s22 + 0)
.s11:
1135 : a0 06 __ LDY #$06
1137 : a6 44 __ LDX T5 + 0 
1139 : b1 0d __ LDA (P0),y ; (si + 0)
113b : d0 29 __ BNE $1166 ; (nforml.s17 + 0)
.l12:
113d : 8a __ __ TXA
113e : 18 __ __ CLC
113f : a0 01 __ LDY #$01
1141 : 71 0d __ ADC (P0),y ; (si + 0)
1143 : b0 04 __ BCS $1149 ; (nforml.s15 + 0)
.s16:
1145 : c9 11 __ CMP #$11
1147 : 90 0a __ BCC $1153 ; (nforml.s13 + 0)
.s15:
1149 : a0 00 __ LDY #$00
114b : b1 0d __ LDA (P0),y ; (si + 0)
114d : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
1150 : ca __ __ DEX
1151 : b0 ea __ BCS $113d ; (nforml.l12 + 0)
.s13:
1153 : e0 10 __ CPX #$10
1155 : b0 0e __ BCS $1165 ; (nforml.s3 + 0)
.s14:
1157 : 88 __ __ DEY
.l39:
1158 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
115b : 91 0f __ STA (P2),y ; (str + 0)
115d : c8 __ __ INY
115e : e8 __ __ INX
115f : e0 10 __ CPX #$10
1161 : 90 f5 __ BCC $1158 ; (nforml.l39 + 0)
.s40:
1163 : 84 1b __ STY ACCU + 0 
.s3:
1165 : 60 __ __ RTS
.s17:
1166 : e0 10 __ CPX #$10
1168 : b0 1a __ BCS $1184 ; (nforml.l18 + 0)
.s20:
116a : a0 00 __ LDY #$00
.l37:
116c : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
116f : 91 0f __ STA (P2),y ; (str + 0)
1171 : c8 __ __ INY
1172 : e8 __ __ INX
1173 : e0 10 __ CPX #$10
1175 : 90 f5 __ BCC $116c ; (nforml.l37 + 0)
.s38:
1177 : 84 1b __ STY ACCU + 0 
1179 : b0 09 __ BCS $1184 ; (nforml.l18 + 0)
.s19:
117b : 88 __ __ DEY
117c : b1 0d __ LDA (P0),y ; (si + 0)
117e : a4 1b __ LDY ACCU + 0 
1180 : 91 0f __ STA (P2),y ; (str + 0)
1182 : e6 1b __ INC ACCU + 0 
.l18:
1184 : a5 1b __ LDA ACCU + 0 
1186 : a0 01 __ LDY #$01
1188 : d1 0d __ CMP (P0),y ; (si + 0)
118a : 90 ef __ BCC $117b ; (nforml.s19 + 0)
118c : 60 __ __ RTS
.l28:
118d : a0 04 __ LDY #$04
118f : b1 0d __ LDA (P0),y ; (si + 0)
1191 : 85 03 __ STA WORK + 0 
1193 : a5 11 __ LDA P4 ; (v + 0)
1195 : 85 1b __ STA ACCU + 0 
1197 : a5 12 __ LDA P5 ; (v + 1)
1199 : 85 1c __ STA ACCU + 1 
119b : a5 13 __ LDA P6 ; (v + 2)
119d : 85 1d __ STA ACCU + 2 
119f : a5 14 __ LDA P7 ; (v + 3)
11a1 : 85 1e __ STA ACCU + 3 
11a3 : a9 00 __ LDA #$00
11a5 : 85 04 __ STA WORK + 1 
11a7 : 85 05 __ STA WORK + 2 
11a9 : 85 06 __ STA WORK + 3 
11ab : 20 87 1b JSR $1b87 ; (divmod32 + 0)
11ae : a5 07 __ LDA WORK + 4 
11b0 : c9 0a __ CMP #$0a
11b2 : b0 04 __ BCS $11b8 ; (nforml.s34 + 0)
.s29:
11b4 : a9 30 __ LDA #$30
11b6 : 90 06 __ BCC $11be ; (nforml.s30 + 0)
.s34:
11b8 : a0 03 __ LDY #$03
11ba : b1 0d __ LDA (P0),y ; (si + 0)
11bc : e9 0a __ SBC #$0a
.s30:
11be : 18 __ __ CLC
11bf : 65 07 __ ADC WORK + 4 
11c1 : a6 44 __ LDX T5 + 0 
11c3 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
11c6 : c6 44 __ DEC T5 + 0 
11c8 : a5 1b __ LDA ACCU + 0 
11ca : 85 11 __ STA P4 ; (v + 0)
11cc : a5 1c __ LDA ACCU + 1 
11ce : 85 12 __ STA P5 ; (v + 1)
11d0 : a5 1d __ LDA ACCU + 2 
11d2 : 85 13 __ STA P6 ; (v + 2)
11d4 : a5 1e __ LDA ACCU + 3 
11d6 : 85 14 __ STA P7 ; (v + 3)
11d8 : d0 b3 __ BNE $118d ; (nforml.l28 + 0)
11da : 4c c5 10 JMP $10c5 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
11dd : a2 03 __ LDX #$03
11df : b5 53 __ LDA T7 + 0,x 
11e1 : 9d eb 9f STA $9feb,x ; (nformf@stack + 0)
11e4 : ca __ __ DEX
11e5 : 10 f8 __ BPL $11df ; (nformf.s1 + 2)
.s4:
11e7 : a5 16 __ LDA P9 ; (f + 1)
11e9 : 85 44 __ STA T0 + 1 
11eb : a5 17 __ LDA P10 ; (f + 2)
11ed : 85 45 __ STA T0 + 2 
11ef : a5 18 __ LDA P11 ; (f + 3)
11f1 : 29 7f __ AND #$7f
11f3 : 05 17 __ ORA P10 ; (f + 2)
11f5 : 05 16 __ ORA P9 ; (f + 1)
11f7 : 05 15 __ ORA P8 ; (f + 0)
11f9 : f0 21 __ BEQ $121c ; (nformf.s5 + 0)
.s107:
11fb : 24 18 __ BIT P11 ; (f + 3)
11fd : 10 1d __ BPL $121c ; (nformf.s5 + 0)
.s106:
11ff : a9 2d __ LDA #$2d
1201 : a0 00 __ LDY #$00
1203 : 91 13 __ STA (P6),y ; (str + 0)
1205 : a5 18 __ LDA P11 ; (f + 3)
1207 : 49 80 __ EOR #$80
1209 : 85 10 __ STA P3 
120b : 85 18 __ STA P11 ; (f + 3)
120d : a5 15 __ LDA P8 ; (f + 0)
120f : 85 0d __ STA P0 
1211 : a5 16 __ LDA P9 ; (f + 1)
1213 : 85 0e __ STA P1 
1215 : a5 17 __ LDA P10 ; (f + 2)
1217 : 85 0f __ STA P2 
1219 : 4c 30 17 JMP $1730 ; (nformf.s104 + 0)
.s5:
121c : a5 15 __ LDA P8 ; (f + 0)
121e : 85 0d __ STA P0 
1220 : a5 16 __ LDA P9 ; (f + 1)
1222 : 85 0e __ STA P1 
1224 : a5 17 __ LDA P10 ; (f + 2)
1226 : 85 0f __ STA P2 
1228 : a5 18 __ LDA P11 ; (f + 3)
122a : 85 10 __ STA P3 
122c : a0 05 __ LDY #$05
122e : b1 11 __ LDA (P4),y ; (si + 0)
1230 : f0 09 __ BEQ $123b ; (nformf.s6 + 0)
.s103:
1232 : a9 2b __ LDA #$2b
1234 : a0 00 __ LDY #$00
1236 : 91 13 __ STA (P6),y ; (str + 0)
1238 : 4c 30 17 JMP $1730 ; (nformf.s104 + 0)
.s6:
123b : 20 41 17 JSR $1741 ; (isinf.s4 + 0)
123e : a2 00 __ LDX #$00
1240 : 86 54 __ STX T9 + 0 
1242 : a8 __ __ TAY
1243 : f0 05 __ BEQ $124a ; (nformf.s7 + 0)
.s101:
1245 : a9 02 __ LDA #$02
1247 : 4c 00 17 JMP $1700 ; (nformf.s102 + 0)
.s7:
124a : a5 11 __ LDA P4 ; (si + 0)
124c : 85 4b __ STA T2 + 0 
124e : a5 12 __ LDA P5 ; (si + 1)
1250 : 85 4c __ STA T2 + 1 
1252 : a0 02 __ LDY #$02
1254 : b1 11 __ LDA (P4),y ; (si + 0)
1256 : c9 ff __ CMP #$ff
1258 : d0 02 __ BNE $125c ; (nformf.s100 + 0)
.s8:
125a : a9 06 __ LDA #$06
.s100:
125c : 85 4d __ STA T3 + 0 
125e : 85 52 __ STA T6 + 0 
1260 : a9 00 __ LDA #$00
1262 : 85 4f __ STA T4 + 0 
1264 : 85 50 __ STA T4 + 1 
1266 : a5 18 __ LDA P11 ; (f + 3)
1268 : 85 46 __ STA T0 + 3 
126a : 29 7f __ AND #$7f
126c : 05 17 __ ORA P10 ; (f + 2)
126e : 05 16 __ ORA P9 ; (f + 1)
1270 : a6 15 __ LDX P8 ; (f + 0)
1272 : 86 43 __ STX T0 + 0 
1274 : 05 15 __ ORA P8 ; (f + 0)
1276 : d0 03 __ BNE $127b ; (nformf.s67 + 0)
1278 : 4c af 13 JMP $13af ; (nformf.s9 + 0)
.s67:
127b : a5 18 __ LDA P11 ; (f + 3)
127d : 10 03 __ BPL $1282 ; (nformf.s95 + 0)
127f : 4c 01 13 JMP $1301 ; (nformf.l80 + 0)
.s95:
1282 : c9 44 __ CMP #$44
1284 : d0 0d __ BNE $1293 ; (nformf.l99 + 0)
.s96:
1286 : a5 17 __ LDA P10 ; (f + 2)
1288 : c9 7a __ CMP #$7a
128a : d0 07 __ BNE $1293 ; (nformf.l99 + 0)
.s97:
128c : a5 16 __ LDA P9 ; (f + 1)
128e : d0 03 __ BNE $1293 ; (nformf.l99 + 0)
.s98:
1290 : 8a __ __ TXA
1291 : f0 02 __ BEQ $1295 ; (nformf.l90 + 0)
.l99:
1293 : 90 54 __ BCC $12e9 ; (nformf.s68 + 0)
.l90:
1295 : 18 __ __ CLC
1296 : a5 4f __ LDA T4 + 0 
1298 : 69 03 __ ADC #$03
129a : 85 4f __ STA T4 + 0 
129c : 90 02 __ BCC $12a0 ; (nformf.s121 + 0)
.s120:
129e : e6 50 __ INC T4 + 1 
.s121:
12a0 : a5 43 __ LDA T0 + 0 
12a2 : 85 1b __ STA ACCU + 0 
12a4 : a5 44 __ LDA T0 + 1 
12a6 : 85 1c __ STA ACCU + 1 
12a8 : a5 45 __ LDA T0 + 2 
12aa : 85 1d __ STA ACCU + 2 
12ac : a5 46 __ LDA T0 + 3 
12ae : 85 1e __ STA ACCU + 3 
12b0 : a9 00 __ LDA #$00
12b2 : 85 03 __ STA WORK + 0 
12b4 : 85 04 __ STA WORK + 1 
12b6 : a9 7a __ LDA #$7a
12b8 : 85 05 __ STA WORK + 2 
12ba : a9 44 __ LDA #$44
12bc : 85 06 __ STA WORK + 3 
12be : 20 74 17 JSR $1774 ; (freg + 20)
12c1 : 20 5a 19 JSR $195a ; (crt_fdiv + 0)
12c4 : a5 1b __ LDA ACCU + 0 
12c6 : 85 43 __ STA T0 + 0 
12c8 : a5 1c __ LDA ACCU + 1 
12ca : 85 44 __ STA T0 + 1 
12cc : a6 1d __ LDX ACCU + 2 
12ce : 86 45 __ STX T0 + 2 
12d0 : a5 1e __ LDA ACCU + 3 
12d2 : 85 46 __ STA T0 + 3 
12d4 : 30 13 __ BMI $12e9 ; (nformf.s68 + 0)
.s91:
12d6 : c9 44 __ CMP #$44
12d8 : d0 b9 __ BNE $1293 ; (nformf.l99 + 0)
.s92:
12da : e0 7a __ CPX #$7a
12dc : d0 b5 __ BNE $1293 ; (nformf.l99 + 0)
.s93:
12de : a5 1c __ LDA ACCU + 1 
12e0 : 38 __ __ SEC
12e1 : d0 b0 __ BNE $1293 ; (nformf.l99 + 0)
.s94:
12e3 : a5 1b __ LDA ACCU + 0 
12e5 : f0 ae __ BEQ $1295 ; (nformf.l90 + 0)
12e7 : d0 aa __ BNE $1293 ; (nformf.l99 + 0)
.s68:
12e9 : a5 46 __ LDA T0 + 3 
12eb : 30 14 __ BMI $1301 ; (nformf.l80 + 0)
.s86:
12ed : c9 3f __ CMP #$3f
12ef : d0 0e __ BNE $12ff ; (nformf.s85 + 0)
.s87:
12f1 : a5 45 __ LDA T0 + 2 
12f3 : c9 80 __ CMP #$80
12f5 : d0 08 __ BNE $12ff ; (nformf.s85 + 0)
.s88:
12f7 : a5 44 __ LDA T0 + 1 
12f9 : d0 04 __ BNE $12ff ; (nformf.s85 + 0)
.s89:
12fb : a5 43 __ LDA T0 + 0 
12fd : f0 49 __ BEQ $1348 ; (nformf.s69 + 0)
.s85:
12ff : b0 47 __ BCS $1348 ; (nformf.s69 + 0)
.l80:
1301 : 38 __ __ SEC
1302 : a5 4f __ LDA T4 + 0 
1304 : e9 03 __ SBC #$03
1306 : 85 4f __ STA T4 + 0 
1308 : b0 02 __ BCS $130c ; (nformf.s116 + 0)
.s115:
130a : c6 50 __ DEC T4 + 1 
.s116:
130c : a9 00 __ LDA #$00
130e : 85 1b __ STA ACCU + 0 
1310 : 85 1c __ STA ACCU + 1 
1312 : a9 7a __ LDA #$7a
1314 : 85 1d __ STA ACCU + 2 
1316 : a9 44 __ LDA #$44
1318 : 85 1e __ STA ACCU + 3 
131a : a2 43 __ LDX #$43
131c : 20 64 17 JSR $1764 ; (freg + 4)
131f : 20 92 18 JSR $1892 ; (crt_fmul + 0)
1322 : a5 1b __ LDA ACCU + 0 
1324 : 85 43 __ STA T0 + 0 
1326 : a5 1c __ LDA ACCU + 1 
1328 : 85 44 __ STA T0 + 1 
132a : a6 1d __ LDX ACCU + 2 
132c : 86 45 __ STX T0 + 2 
132e : a5 1e __ LDA ACCU + 3 
1330 : 85 46 __ STA T0 + 3 
1332 : 30 cd __ BMI $1301 ; (nformf.l80 + 0)
.s81:
1334 : c9 3f __ CMP #$3f
1336 : 90 c9 __ BCC $1301 ; (nformf.l80 + 0)
.s122:
1338 : d0 0e __ BNE $1348 ; (nformf.s69 + 0)
.s82:
133a : e0 80 __ CPX #$80
133c : 90 c3 __ BCC $1301 ; (nformf.l80 + 0)
.s123:
133e : d0 08 __ BNE $1348 ; (nformf.s69 + 0)
.s83:
1340 : a5 1c __ LDA ACCU + 1 
1342 : d0 bb __ BNE $12ff ; (nformf.s85 + 0)
.s84:
1344 : a5 1b __ LDA ACCU + 0 
1346 : d0 b7 __ BNE $12ff ; (nformf.s85 + 0)
.s69:
1348 : a5 46 __ LDA T0 + 3 
134a : 30 63 __ BMI $13af ; (nformf.s9 + 0)
.s75:
134c : c9 41 __ CMP #$41
134e : d0 0e __ BNE $135e ; (nformf.l79 + 0)
.s76:
1350 : a5 45 __ LDA T0 + 2 
1352 : c9 20 __ CMP #$20
1354 : d0 08 __ BNE $135e ; (nformf.l79 + 0)
.s77:
1356 : a5 44 __ LDA T0 + 1 
1358 : d0 04 __ BNE $135e ; (nformf.l79 + 0)
.s78:
135a : a5 43 __ LDA T0 + 0 
135c : f0 02 __ BEQ $1360 ; (nformf.l70 + 0)
.l79:
135e : 90 4f __ BCC $13af ; (nformf.s9 + 0)
.l70:
1360 : e6 4f __ INC T4 + 0 
1362 : d0 02 __ BNE $1366 ; (nformf.s119 + 0)
.s118:
1364 : e6 50 __ INC T4 + 1 
.s119:
1366 : a5 43 __ LDA T0 + 0 
1368 : 85 1b __ STA ACCU + 0 
136a : a5 44 __ LDA T0 + 1 
136c : 85 1c __ STA ACCU + 1 
136e : a5 45 __ LDA T0 + 2 
1370 : 85 1d __ STA ACCU + 2 
1372 : a5 46 __ LDA T0 + 3 
1374 : 85 1e __ STA ACCU + 3 
1376 : a9 00 __ LDA #$00
1378 : 85 03 __ STA WORK + 0 
137a : 85 04 __ STA WORK + 1 
137c : a9 20 __ LDA #$20
137e : 85 05 __ STA WORK + 2 
1380 : a9 41 __ LDA #$41
1382 : 85 06 __ STA WORK + 3 
1384 : 20 74 17 JSR $1774 ; (freg + 20)
1387 : 20 5a 19 JSR $195a ; (crt_fdiv + 0)
138a : a5 1b __ LDA ACCU + 0 
138c : 85 43 __ STA T0 + 0 
138e : a5 1c __ LDA ACCU + 1 
1390 : 85 44 __ STA T0 + 1 
1392 : a6 1d __ LDX ACCU + 2 
1394 : 86 45 __ STX T0 + 2 
1396 : a5 1e __ LDA ACCU + 3 
1398 : 85 46 __ STA T0 + 3 
139a : 30 13 __ BMI $13af ; (nformf.s9 + 0)
.s71:
139c : c9 41 __ CMP #$41
139e : d0 be __ BNE $135e ; (nformf.l79 + 0)
.s72:
13a0 : e0 20 __ CPX #$20
13a2 : d0 ba __ BNE $135e ; (nformf.l79 + 0)
.s73:
13a4 : a5 1c __ LDA ACCU + 1 
13a6 : 38 __ __ SEC
13a7 : d0 b5 __ BNE $135e ; (nformf.l79 + 0)
.s74:
13a9 : a5 1b __ LDA ACCU + 0 
13ab : f0 b3 __ BEQ $1360 ; (nformf.l70 + 0)
13ad : d0 af __ BNE $135e ; (nformf.l79 + 0)
.s9:
13af : ad f4 9f LDA $9ff4 ; (sstack + 0)
13b2 : c9 65 __ CMP #$65
13b4 : d0 04 __ BNE $13ba ; (nformf.s11 + 0)
.s10:
13b6 : a9 01 __ LDA #$01
13b8 : d0 02 __ BNE $13bc ; (nformf.s12 + 0)
.s11:
13ba : a9 00 __ LDA #$00
.s12:
13bc : 85 55 __ STA T10 + 0 
13be : a6 4d __ LDX T3 + 0 
13c0 : e8 __ __ INX
13c1 : 86 51 __ STX T5 + 0 
13c3 : ad f4 9f LDA $9ff4 ; (sstack + 0)
13c6 : c9 67 __ CMP #$67
13c8 : d0 13 __ BNE $13dd ; (nformf.s13 + 0)
.s63:
13ca : a5 50 __ LDA T4 + 1 
13cc : 30 08 __ BMI $13d6 ; (nformf.s64 + 0)
.s66:
13ce : d0 06 __ BNE $13d6 ; (nformf.s64 + 0)
.s65:
13d0 : a5 4f __ LDA T4 + 0 
13d2 : c9 04 __ CMP #$04
13d4 : 90 07 __ BCC $13dd ; (nformf.s13 + 0)
.s64:
13d6 : a9 01 __ LDA #$01
13d8 : 85 55 __ STA T10 + 0 
13da : 4c 66 16 JMP $1666 ; (nformf.s53 + 0)
.s13:
13dd : a5 55 __ LDA T10 + 0 
13df : d0 f9 __ BNE $13da ; (nformf.s64 + 4)
.s14:
13e1 : 24 50 __ BIT T4 + 1 
13e3 : 10 43 __ BPL $1428 ; (nformf.s15 + 0)
.s52:
13e5 : a5 43 __ LDA T0 + 0 
13e7 : 85 1b __ STA ACCU + 0 
13e9 : a5 44 __ LDA T0 + 1 
13eb : 85 1c __ STA ACCU + 1 
13ed : a5 45 __ LDA T0 + 2 
13ef : 85 1d __ STA ACCU + 2 
13f1 : a5 46 __ LDA T0 + 3 
13f3 : 85 1e __ STA ACCU + 3 
.l108:
13f5 : a9 00 __ LDA #$00
13f7 : 85 03 __ STA WORK + 0 
13f9 : 85 04 __ STA WORK + 1 
13fb : a9 20 __ LDA #$20
13fd : 85 05 __ STA WORK + 2 
13ff : a9 41 __ LDA #$41
1401 : 85 06 __ STA WORK + 3 
1403 : 20 74 17 JSR $1774 ; (freg + 20)
1406 : 20 5a 19 JSR $195a ; (crt_fdiv + 0)
1409 : 18 __ __ CLC
140a : a5 4f __ LDA T4 + 0 
140c : 69 01 __ ADC #$01
140e : 85 4f __ STA T4 + 0 
1410 : a5 50 __ LDA T4 + 1 
1412 : 69 00 __ ADC #$00
1414 : 85 50 __ STA T4 + 1 
1416 : 30 dd __ BMI $13f5 ; (nformf.l108 + 0)
.s109:
1418 : a5 1e __ LDA ACCU + 3 
141a : 85 46 __ STA T0 + 3 
141c : a5 1d __ LDA ACCU + 2 
141e : 85 45 __ STA T0 + 2 
1420 : a5 1c __ LDA ACCU + 1 
1422 : 85 44 __ STA T0 + 1 
1424 : a5 1b __ LDA ACCU + 0 
1426 : 85 43 __ STA T0 + 0 
.s15:
1428 : 18 __ __ CLC
1429 : a5 4d __ LDA T3 + 0 
142b : 65 4f __ ADC T4 + 0 
142d : 18 __ __ CLC
142e : 69 01 __ ADC #$01
1430 : 85 51 __ STA T5 + 0 
1432 : c9 07 __ CMP #$07
1434 : 90 14 __ BCC $144a ; (nformf.s51 + 0)
.s16:
1436 : ad 78 1c LDA $1c78 ; (fround5[0] + 24)
1439 : 85 47 __ STA T1 + 0 
143b : ad 79 1c LDA $1c79 ; (fround5[0] + 25)
143e : 85 48 __ STA T1 + 1 
1440 : ad 7a 1c LDA $1c7a ; (fround5[0] + 26)
1443 : 85 49 __ STA T1 + 2 
1445 : ad 7b 1c LDA $1c7b ; (fround5[0] + 27)
1448 : b0 15 __ BCS $145f ; (nformf.s17 + 0)
.s51:
144a : 0a __ __ ASL
144b : 0a __ __ ASL
144c : aa __ __ TAX
144d : bd 5c 1c LDA $1c5c,x ; (divmod32 + 213)
1450 : 85 47 __ STA T1 + 0 
1452 : bd 5d 1c LDA $1c5d,x ; (divmod32 + 214)
1455 : 85 48 __ STA T1 + 1 
1457 : bd 5e 1c LDA $1c5e,x ; (spentry + 0)
145a : 85 49 __ STA T1 + 2 
145c : bd 5f 1c LDA $1c5f,x ; (giocharmap + 0)
.s17:
145f : 85 4a __ STA T1 + 3 
1461 : a5 43 __ LDA T0 + 0 
1463 : 85 1b __ STA ACCU + 0 
1465 : a5 44 __ LDA T0 + 1 
1467 : 85 1c __ STA ACCU + 1 
1469 : a5 45 __ LDA T0 + 2 
146b : 85 1d __ STA ACCU + 2 
146d : a5 46 __ LDA T0 + 3 
146f : 85 1e __ STA ACCU + 3 
1471 : a2 47 __ LDX #$47
1473 : 20 64 17 JSR $1764 ; (freg + 4)
1476 : 20 ab 17 JSR $17ab ; (faddsub + 6)
1479 : a5 1c __ LDA ACCU + 1 
147b : 85 16 __ STA P9 ; (f + 1)
147d : a5 1d __ LDA ACCU + 2 
147f : 85 17 __ STA P10 ; (f + 2)
1481 : a6 1b __ LDX ACCU + 0 
1483 : a5 1e __ LDA ACCU + 3 
1485 : 85 18 __ STA P11 ; (f + 3)
1487 : 30 3a __ BMI $14c3 ; (nformf.s18 + 0)
.s46:
1489 : c9 41 __ CMP #$41
148b : d0 0d __ BNE $149a ; (nformf.s50 + 0)
.s47:
148d : a5 17 __ LDA P10 ; (f + 2)
148f : c9 20 __ CMP #$20
1491 : d0 07 __ BNE $149a ; (nformf.s50 + 0)
.s48:
1493 : a5 16 __ LDA P9 ; (f + 1)
1495 : d0 03 __ BNE $149a ; (nformf.s50 + 0)
.s49:
1497 : 8a __ __ TXA
1498 : f0 02 __ BEQ $149c ; (nformf.s45 + 0)
.s50:
149a : 90 27 __ BCC $14c3 ; (nformf.s18 + 0)
.s45:
149c : a9 00 __ LDA #$00
149e : 85 03 __ STA WORK + 0 
14a0 : 85 04 __ STA WORK + 1 
14a2 : a9 20 __ LDA #$20
14a4 : 85 05 __ STA WORK + 2 
14a6 : a9 41 __ LDA #$41
14a8 : 85 06 __ STA WORK + 3 
14aa : 20 74 17 JSR $1774 ; (freg + 20)
14ad : 20 5a 19 JSR $195a ; (crt_fdiv + 0)
14b0 : a5 1c __ LDA ACCU + 1 
14b2 : 85 16 __ STA P9 ; (f + 1)
14b4 : a5 1d __ LDA ACCU + 2 
14b6 : 85 17 __ STA P10 ; (f + 2)
14b8 : a5 1e __ LDA ACCU + 3 
14ba : 85 18 __ STA P11 ; (f + 3)
14bc : a6 4d __ LDX T3 + 0 
14be : ca __ __ DEX
14bf : 86 52 __ STX T6 + 0 
14c1 : a6 1b __ LDX ACCU + 0 
.s18:
14c3 : 38 __ __ SEC
14c4 : a5 51 __ LDA T5 + 0 
14c6 : e5 52 __ SBC T6 + 0 
14c8 : 85 4d __ STA T3 + 0 
14ca : a9 00 __ LDA #$00
14cc : e9 00 __ SBC #$00
14ce : 85 4e __ STA T3 + 1 
14d0 : a9 14 __ LDA #$14
14d2 : c5 51 __ CMP T5 + 0 
14d4 : b0 02 __ BCS $14d8 ; (nformf.s19 + 0)
.s44:
14d6 : 85 51 __ STA T5 + 0 
.s19:
14d8 : a5 4d __ LDA T3 + 0 
14da : d0 08 __ BNE $14e4 ; (nformf.s21 + 0)
.s20:
14dc : a9 30 __ LDA #$30
14de : a4 54 __ LDY T9 + 0 
14e0 : 91 13 __ STA (P6),y ; (str + 0)
14e2 : e6 54 __ INC T9 + 0 
.s21:
14e4 : a9 00 __ LDA #$00
14e6 : 85 56 __ STA T11 + 0 
14e8 : c5 4d __ CMP T3 + 0 
14ea : f0 6f __ BEQ $155b ; (nformf.l43 + 0)
.s23:
14ec : c9 07 __ CMP #$07
14ee : 90 04 __ BCC $14f4 ; (nformf.s24 + 0)
.l42:
14f0 : a9 30 __ LDA #$30
14f2 : b0 55 __ BCS $1549 ; (nformf.l25 + 0)
.s24:
14f4 : 86 1b __ STX ACCU + 0 
14f6 : 86 43 __ STX T0 + 0 
14f8 : a5 16 __ LDA P9 ; (f + 1)
14fa : 85 1c __ STA ACCU + 1 
14fc : 85 44 __ STA T0 + 1 
14fe : a5 17 __ LDA P10 ; (f + 2)
1500 : 85 1d __ STA ACCU + 2 
1502 : 85 45 __ STA T0 + 2 
1504 : a5 18 __ LDA P11 ; (f + 3)
1506 : 85 1e __ STA ACCU + 3 
1508 : 85 46 __ STA T0 + 3 
150a : 20 f4 1a JSR $1af4 ; (f32_to_i16 + 0)
150d : a5 1b __ LDA ACCU + 0 
150f : 85 53 __ STA T7 + 0 
1511 : 20 40 1b JSR $1b40 ; (sint16_to_float + 0)
1514 : a2 43 __ LDX #$43
1516 : 20 64 17 JSR $1764 ; (freg + 4)
1519 : a5 1e __ LDA ACCU + 3 
151b : 49 80 __ EOR #$80
151d : 85 1e __ STA ACCU + 3 
151f : 20 ab 17 JSR $17ab ; (faddsub + 6)
1522 : a9 00 __ LDA #$00
1524 : 85 03 __ STA WORK + 0 
1526 : 85 04 __ STA WORK + 1 
1528 : a9 20 __ LDA #$20
152a : 85 05 __ STA WORK + 2 
152c : a9 41 __ LDA #$41
152e : 85 06 __ STA WORK + 3 
1530 : 20 74 17 JSR $1774 ; (freg + 20)
1533 : 20 92 18 JSR $1892 ; (crt_fmul + 0)
1536 : a5 1c __ LDA ACCU + 1 
1538 : 85 16 __ STA P9 ; (f + 1)
153a : a5 1d __ LDA ACCU + 2 
153c : 85 17 __ STA P10 ; (f + 2)
153e : a5 1e __ LDA ACCU + 3 
1540 : 85 18 __ STA P11 ; (f + 3)
1542 : 18 __ __ CLC
1543 : a5 53 __ LDA T7 + 0 
1545 : 69 30 __ ADC #$30
1547 : a6 1b __ LDX ACCU + 0 
.l25:
1549 : a4 54 __ LDY T9 + 0 
154b : 91 13 __ STA (P6),y ; (str + 0)
154d : e6 54 __ INC T9 + 0 
154f : e6 56 __ INC T11 + 0 
1551 : a5 56 __ LDA T11 + 0 
1553 : c5 51 __ CMP T5 + 0 
1555 : b0 14 __ BCS $156b ; (nformf.s26 + 0)
.s22:
1557 : c5 4d __ CMP T3 + 0 
1559 : d0 91 __ BNE $14ec ; (nformf.s23 + 0)
.l43:
155b : a9 2e __ LDA #$2e
155d : a4 54 __ LDY T9 + 0 
155f : 91 13 __ STA (P6),y ; (str + 0)
1561 : e6 54 __ INC T9 + 0 
1563 : a5 56 __ LDA T11 + 0 
1565 : c9 07 __ CMP #$07
1567 : 90 8b __ BCC $14f4 ; (nformf.s24 + 0)
1569 : b0 85 __ BCS $14f0 ; (nformf.l42 + 0)
.s26:
156b : a5 55 __ LDA T10 + 0 
156d : f0 66 __ BEQ $15d5 ; (nformf.s27 + 0)
.s38:
156f : a0 03 __ LDY #$03
1571 : b1 4b __ LDA (T2 + 0),y 
1573 : 69 03 __ ADC #$03
1575 : a4 54 __ LDY T9 + 0 
1577 : 91 13 __ STA (P6),y ; (str + 0)
1579 : c8 __ __ INY
157a : 84 54 __ STY T9 + 0 
157c : 24 50 __ BIT T4 + 1 
157e : 30 06 __ BMI $1586 ; (nformf.s41 + 0)
.s39:
1580 : a9 2b __ LDA #$2b
1582 : 91 13 __ STA (P6),y ; (str + 0)
1584 : d0 11 __ BNE $1597 ; (nformf.s40 + 0)
.s41:
1586 : a9 2d __ LDA #$2d
1588 : 91 13 __ STA (P6),y ; (str + 0)
158a : 38 __ __ SEC
158b : a9 00 __ LDA #$00
158d : e5 4f __ SBC T4 + 0 
158f : 85 4f __ STA T4 + 0 
1591 : a9 00 __ LDA #$00
1593 : e5 50 __ SBC T4 + 1 
1595 : 85 50 __ STA T4 + 1 
.s40:
1597 : e6 54 __ INC T9 + 0 
1599 : a5 4f __ LDA T4 + 0 
159b : 85 1b __ STA ACCU + 0 
159d : a5 50 __ LDA T4 + 1 
159f : 85 1c __ STA ACCU + 1 
15a1 : a9 0a __ LDA #$0a
15a3 : 85 03 __ STA WORK + 0 
15a5 : a9 00 __ LDA #$00
15a7 : 85 04 __ STA WORK + 1 
15a9 : 20 08 1a JSR $1a08 ; (divs16 + 0)
15ac : 18 __ __ CLC
15ad : a5 1b __ LDA ACCU + 0 
15af : 69 30 __ ADC #$30
15b1 : a4 54 __ LDY T9 + 0 
15b3 : 91 13 __ STA (P6),y ; (str + 0)
15b5 : e6 54 __ INC T9 + 0 
15b7 : a5 4f __ LDA T4 + 0 
15b9 : 85 1b __ STA ACCU + 0 
15bb : a5 50 __ LDA T4 + 1 
15bd : 85 1c __ STA ACCU + 1 
15bf : a9 0a __ LDA #$0a
15c1 : 85 03 __ STA WORK + 0 
15c3 : a9 00 __ LDA #$00
15c5 : 85 04 __ STA WORK + 1 
15c7 : 20 c7 1a JSR $1ac7 ; (mods16 + 0)
15ca : 18 __ __ CLC
15cb : a5 05 __ LDA WORK + 2 
15cd : 69 30 __ ADC #$30
15cf : a4 54 __ LDY T9 + 0 
15d1 : 91 13 __ STA (P6),y ; (str + 0)
15d3 : e6 54 __ INC T9 + 0 
.s27:
15d5 : a5 54 __ LDA T9 + 0 
15d7 : a0 01 __ LDY #$01
15d9 : d1 11 __ CMP (P4),y ; (si + 0)
15db : b0 6d __ BCS $164a ; (nformf.s3 + 0)
.s28:
15dd : a0 06 __ LDY #$06
15df : b1 11 __ LDA (P4),y ; (si + 0)
15e1 : f0 04 __ BEQ $15e7 ; (nformf.s29 + 0)
.s110:
15e3 : a6 54 __ LDX T9 + 0 
15e5 : 90 70 __ BCC $1657 ; (nformf.l36 + 0)
.s29:
15e7 : a5 54 __ LDA T9 + 0 
15e9 : f0 40 __ BEQ $162b ; (nformf.s30 + 0)
.s35:
15eb : e9 00 __ SBC #$00
15ed : a8 __ __ TAY
15ee : a9 00 __ LDA #$00
15f0 : e9 00 __ SBC #$00
15f2 : aa __ __ TAX
15f3 : 98 __ __ TYA
15f4 : 18 __ __ CLC
15f5 : 65 13 __ ADC P6 ; (str + 0)
15f7 : 85 47 __ STA T1 + 0 
15f9 : 8a __ __ TXA
15fa : 65 14 __ ADC P7 ; (str + 1)
15fc : 85 48 __ STA T1 + 1 
15fe : a9 01 __ LDA #$01
1600 : 85 4d __ STA T3 + 0 
1602 : a6 54 __ LDX T9 + 0 
1604 : 38 __ __ SEC
.l111:
1605 : a0 01 __ LDY #$01
1607 : b1 11 __ LDA (P4),y ; (si + 0)
1609 : e5 4d __ SBC T3 + 0 
160b : 85 4b __ STA T2 + 0 
160d : a9 00 __ LDA #$00
160f : e5 4e __ SBC T3 + 1 
1611 : 18 __ __ CLC
1612 : 65 14 __ ADC P7 ; (str + 1)
1614 : 85 4c __ STA T2 + 1 
1616 : 88 __ __ DEY
1617 : b1 47 __ LDA (T1 + 0),y 
1619 : a4 13 __ LDY P6 ; (str + 0)
161b : 91 4b __ STA (T2 + 0),y 
161d : a5 47 __ LDA T1 + 0 
161f : d0 02 __ BNE $1623 ; (nformf.s114 + 0)
.s113:
1621 : c6 48 __ DEC T1 + 1 
.s114:
1623 : c6 47 __ DEC T1 + 0 
1625 : e6 4d __ INC T3 + 0 
1627 : e4 4d __ CPX T3 + 0 
1629 : b0 da __ BCS $1605 ; (nformf.l111 + 0)
.s30:
162b : a9 00 __ LDA #$00
162d : 85 4d __ STA T3 + 0 
162f : 90 08 __ BCC $1639 ; (nformf.l31 + 0)
.s33:
1631 : a9 20 __ LDA #$20
1633 : a4 4d __ LDY T3 + 0 
1635 : 91 13 __ STA (P6),y ; (str + 0)
1637 : e6 4d __ INC T3 + 0 
.l31:
1639 : a0 01 __ LDY #$01
163b : b1 11 __ LDA (P4),y ; (si + 0)
163d : 38 __ __ SEC
163e : e5 54 __ SBC T9 + 0 
1640 : 90 ef __ BCC $1631 ; (nformf.s33 + 0)
.s34:
1642 : c5 4d __ CMP T3 + 0 
1644 : 90 02 __ BCC $1648 ; (nformf.s32 + 0)
.s112:
1646 : d0 e9 __ BNE $1631 ; (nformf.s33 + 0)
.s32:
1648 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
164a : 85 1b __ STA ACCU + 0 
164c : a2 03 __ LDX #$03
164e : bd eb 9f LDA $9feb,x ; (nformf@stack + 0)
1651 : 95 53 __ STA T7 + 0,x 
1653 : ca __ __ DEX
1654 : 10 f8 __ BPL $164e ; (nformf.s3 + 4)
1656 : 60 __ __ RTS
.l36:
1657 : 8a __ __ TXA
1658 : a0 01 __ LDY #$01
165a : d1 11 __ CMP (P4),y ; (si + 0)
165c : b0 ea __ BCS $1648 ; (nformf.s32 + 0)
.s37:
165e : a8 __ __ TAY
165f : a9 20 __ LDA #$20
1661 : 91 13 __ STA (P6),y ; (str + 0)
1663 : e8 __ __ INX
1664 : 90 f1 __ BCC $1657 ; (nformf.l36 + 0)
.s53:
1666 : a5 51 __ LDA T5 + 0 
1668 : c9 07 __ CMP #$07
166a : 90 14 __ BCC $1680 ; (nformf.s62 + 0)
.s54:
166c : ad 78 1c LDA $1c78 ; (fround5[0] + 24)
166f : 85 47 __ STA T1 + 0 
1671 : ad 79 1c LDA $1c79 ; (fround5[0] + 25)
1674 : 85 48 __ STA T1 + 1 
1676 : ad 7a 1c LDA $1c7a ; (fround5[0] + 26)
1679 : 85 49 __ STA T1 + 2 
167b : ad 7b 1c LDA $1c7b ; (fround5[0] + 27)
167e : b0 15 __ BCS $1695 ; (nformf.s55 + 0)
.s62:
1680 : 0a __ __ ASL
1681 : 0a __ __ ASL
1682 : aa __ __ TAX
1683 : bd 5c 1c LDA $1c5c,x ; (divmod32 + 213)
1686 : 85 47 __ STA T1 + 0 
1688 : bd 5d 1c LDA $1c5d,x ; (divmod32 + 214)
168b : 85 48 __ STA T1 + 1 
168d : bd 5e 1c LDA $1c5e,x ; (spentry + 0)
1690 : 85 49 __ STA T1 + 2 
1692 : bd 5f 1c LDA $1c5f,x ; (giocharmap + 0)
.s55:
1695 : 85 4a __ STA T1 + 3 
1697 : a5 43 __ LDA T0 + 0 
1699 : 85 1b __ STA ACCU + 0 
169b : a5 44 __ LDA T0 + 1 
169d : 85 1c __ STA ACCU + 1 
169f : a5 45 __ LDA T0 + 2 
16a1 : 85 1d __ STA ACCU + 2 
16a3 : a5 46 __ LDA T0 + 3 
16a5 : 85 1e __ STA ACCU + 3 
16a7 : a2 47 __ LDX #$47
16a9 : 20 64 17 JSR $1764 ; (freg + 4)
16ac : 20 ab 17 JSR $17ab ; (faddsub + 6)
16af : a5 1c __ LDA ACCU + 1 
16b1 : 85 16 __ STA P9 ; (f + 1)
16b3 : a5 1d __ LDA ACCU + 2 
16b5 : 85 17 __ STA P10 ; (f + 2)
16b7 : a6 1b __ LDX ACCU + 0 
16b9 : a5 1e __ LDA ACCU + 3 
16bb : 85 18 __ STA P11 ; (f + 3)
16bd : 10 03 __ BPL $16c2 ; (nformf.s57 + 0)
16bf : 4c c3 14 JMP $14c3 ; (nformf.s18 + 0)
.s57:
16c2 : c9 41 __ CMP #$41
16c4 : d0 0d __ BNE $16d3 ; (nformf.s61 + 0)
.s58:
16c6 : a5 17 __ LDA P10 ; (f + 2)
16c8 : c9 20 __ CMP #$20
16ca : d0 07 __ BNE $16d3 ; (nformf.s61 + 0)
.s59:
16cc : a5 16 __ LDA P9 ; (f + 1)
16ce : d0 03 __ BNE $16d3 ; (nformf.s61 + 0)
.s60:
16d0 : 8a __ __ TXA
16d1 : f0 02 __ BEQ $16d5 ; (nformf.s56 + 0)
.s61:
16d3 : 90 ea __ BCC $16bf ; (nformf.s55 + 42)
.s56:
16d5 : a9 00 __ LDA #$00
16d7 : 85 03 __ STA WORK + 0 
16d9 : 85 04 __ STA WORK + 1 
16db : a9 20 __ LDA #$20
16dd : 85 05 __ STA WORK + 2 
16df : a9 41 __ LDA #$41
16e1 : 85 06 __ STA WORK + 3 
16e3 : 20 74 17 JSR $1774 ; (freg + 20)
16e6 : 20 5a 19 JSR $195a ; (crt_fdiv + 0)
16e9 : a5 1c __ LDA ACCU + 1 
16eb : 85 16 __ STA P9 ; (f + 1)
16ed : a5 1d __ LDA ACCU + 2 
16ef : 85 17 __ STA P10 ; (f + 2)
16f1 : a5 1e __ LDA ACCU + 3 
16f3 : 85 18 __ STA P11 ; (f + 3)
16f5 : a6 1b __ LDX ACCU + 0 
16f7 : e6 4f __ INC T4 + 0 
16f9 : d0 c4 __ BNE $16bf ; (nformf.s55 + 42)
.s117:
16fb : e6 50 __ INC T4 + 1 
16fd : 4c c3 14 JMP $14c3 ; (nformf.s18 + 0)
.s102:
1700 : 86 43 __ STX T0 + 0 
1702 : 85 47 __ STA T1 + 0 
1704 : a0 03 __ LDY #$03
1706 : b1 11 __ LDA (P4),y ; (si + 0)
1708 : 18 __ __ CLC
1709 : 69 08 __ ADC #$08
170b : a4 43 __ LDY T0 + 0 
170d : 91 13 __ STA (P6),y ; (str + 0)
170f : 18 __ __ CLC
1710 : a0 03 __ LDY #$03
1712 : b1 11 __ LDA (P4),y ; (si + 0)
1714 : 69 0d __ ADC #$0d
1716 : a4 43 __ LDY T0 + 0 
1718 : c8 __ __ INY
1719 : 91 13 __ STA (P6),y ; (str + 0)
171b : a0 03 __ LDY #$03
171d : b1 11 __ LDA (P4),y ; (si + 0)
171f : 18 __ __ CLC
1720 : 69 05 __ ADC #$05
1722 : a4 47 __ LDY T1 + 0 
1724 : 91 13 __ STA (P6),y ; (str + 0)
1726 : 18 __ __ CLC
1727 : a5 54 __ LDA T9 + 0 
1729 : 69 03 __ ADC #$03
172b : 85 54 __ STA T9 + 0 
172d : 4c d5 15 JMP $15d5 ; (nformf.s27 + 0)
.s104:
1730 : 20 41 17 JSR $1741 ; (isinf.s4 + 0)
1733 : a2 01 __ LDX #$01
1735 : 86 54 __ STX T9 + 0 
1737 : a8 __ __ TAY
1738 : d0 03 __ BNE $173d ; (nformf.s105 + 0)
173a : 4c 4a 12 JMP $124a ; (nformf.s7 + 0)
.s105:
173d : a9 03 __ LDA #$03
173f : d0 bf __ BNE $1700 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1741 : 06 0f __ ASL P2 ; (f + 2)
1743 : a5 10 __ LDA P3 ; (f + 3)
1745 : 2a __ __ ROL
1746 : c9 ff __ CMP #$ff
1748 : d0 03 __ BNE $174d ; (isinf.s6 + 0)
.s5:
174a : a9 01 __ LDA #$01
174c : 60 __ __ RTS
.s6:
174d : a9 00 __ LDA #$00
.s3:
174f : 60 __ __ RTS
--------------------------------------------------------------------
1750 : __ __ __ BYT 25 c4 20 c8 45 4c 4c 4f 20 d7 4f 52 4c 44 0a 00 : %. .ELLO .ORLD..
--------------------------------------------------------------------
freg: ; freg
1760 : b1 19 __ LDA (IP + 0),y 
1762 : c8 __ __ INY
1763 : aa __ __ TAX
1764 : b5 00 __ LDA $00,x 
1766 : 85 03 __ STA WORK + 0 
1768 : b5 01 __ LDA $01,x 
176a : 85 04 __ STA WORK + 1 
176c : b5 02 __ LDA $02,x 
176e : 85 05 __ STA WORK + 2 
1770 : b5 03 __ LDA WORK + 0,x 
1772 : 85 06 __ STA WORK + 3 
1774 : a5 05 __ LDA WORK + 2 
1776 : 0a __ __ ASL
1777 : a5 06 __ LDA WORK + 3 
1779 : 2a __ __ ROL
177a : 85 08 __ STA WORK + 5 
177c : f0 06 __ BEQ $1784 ; (freg + 36)
177e : a5 05 __ LDA WORK + 2 
1780 : 09 80 __ ORA #$80
1782 : 85 05 __ STA WORK + 2 
1784 : a5 1d __ LDA ACCU + 2 
1786 : 0a __ __ ASL
1787 : a5 1e __ LDA ACCU + 3 
1789 : 2a __ __ ROL
178a : 85 07 __ STA WORK + 4 
178c : f0 06 __ BEQ $1794 ; (freg + 52)
178e : a5 1d __ LDA ACCU + 2 
1790 : 09 80 __ ORA #$80
1792 : 85 1d __ STA ACCU + 2 
1794 : 60 __ __ RTS
1795 : 06 1e __ ASL ACCU + 3 
1797 : a5 07 __ LDA WORK + 4 
1799 : 6a __ __ ROR
179a : 85 1e __ STA ACCU + 3 
179c : b0 06 __ BCS $17a4 ; (freg + 68)
179e : a5 1d __ LDA ACCU + 2 
17a0 : 29 7f __ AND #$7f
17a2 : 85 1d __ STA ACCU + 2 
17a4 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
17a5 : a5 06 __ LDA WORK + 3 
17a7 : 49 80 __ EOR #$80
17a9 : 85 06 __ STA WORK + 3 
17ab : a9 ff __ LDA #$ff
17ad : c5 07 __ CMP WORK + 4 
17af : f0 04 __ BEQ $17b5 ; (faddsub + 16)
17b1 : c5 08 __ CMP WORK + 5 
17b3 : d0 11 __ BNE $17c6 ; (faddsub + 33)
17b5 : a5 1e __ LDA ACCU + 3 
17b7 : 09 7f __ ORA #$7f
17b9 : 85 1e __ STA ACCU + 3 
17bb : a9 80 __ LDA #$80
17bd : 85 1d __ STA ACCU + 2 
17bf : a9 00 __ LDA #$00
17c1 : 85 1b __ STA ACCU + 0 
17c3 : 85 1c __ STA ACCU + 1 
17c5 : 60 __ __ RTS
17c6 : 38 __ __ SEC
17c7 : a5 07 __ LDA WORK + 4 
17c9 : e5 08 __ SBC WORK + 5 
17cb : f0 38 __ BEQ $1805 ; (faddsub + 96)
17cd : aa __ __ TAX
17ce : b0 25 __ BCS $17f5 ; (faddsub + 80)
17d0 : e0 e9 __ CPX #$e9
17d2 : b0 0e __ BCS $17e2 ; (faddsub + 61)
17d4 : a5 08 __ LDA WORK + 5 
17d6 : 85 07 __ STA WORK + 4 
17d8 : a9 00 __ LDA #$00
17da : 85 1b __ STA ACCU + 0 
17dc : 85 1c __ STA ACCU + 1 
17de : 85 1d __ STA ACCU + 2 
17e0 : f0 23 __ BEQ $1805 ; (faddsub + 96)
17e2 : a5 1d __ LDA ACCU + 2 
17e4 : 4a __ __ LSR
17e5 : 66 1c __ ROR ACCU + 1 
17e7 : 66 1b __ ROR ACCU + 0 
17e9 : e8 __ __ INX
17ea : d0 f8 __ BNE $17e4 ; (faddsub + 63)
17ec : 85 1d __ STA ACCU + 2 
17ee : a5 08 __ LDA WORK + 5 
17f0 : 85 07 __ STA WORK + 4 
17f2 : 4c 05 18 JMP $1805 ; (faddsub + 96)
17f5 : e0 18 __ CPX #$18
17f7 : b0 33 __ BCS $182c ; (faddsub + 135)
17f9 : a5 05 __ LDA WORK + 2 
17fb : 4a __ __ LSR
17fc : 66 04 __ ROR WORK + 1 
17fe : 66 03 __ ROR WORK + 0 
1800 : ca __ __ DEX
1801 : d0 f8 __ BNE $17fb ; (faddsub + 86)
1803 : 85 05 __ STA WORK + 2 
1805 : a5 1e __ LDA ACCU + 3 
1807 : 29 80 __ AND #$80
1809 : 85 1e __ STA ACCU + 3 
180b : 45 06 __ EOR WORK + 3 
180d : 30 31 __ BMI $1840 ; (faddsub + 155)
180f : 18 __ __ CLC
1810 : a5 1b __ LDA ACCU + 0 
1812 : 65 03 __ ADC WORK + 0 
1814 : 85 1b __ STA ACCU + 0 
1816 : a5 1c __ LDA ACCU + 1 
1818 : 65 04 __ ADC WORK + 1 
181a : 85 1c __ STA ACCU + 1 
181c : a5 1d __ LDA ACCU + 2 
181e : 65 05 __ ADC WORK + 2 
1820 : 85 1d __ STA ACCU + 2 
1822 : 90 08 __ BCC $182c ; (faddsub + 135)
1824 : 66 1d __ ROR ACCU + 2 
1826 : 66 1c __ ROR ACCU + 1 
1828 : 66 1b __ ROR ACCU + 0 
182a : e6 07 __ INC WORK + 4 
182c : a5 07 __ LDA WORK + 4 
182e : c9 ff __ CMP #$ff
1830 : f0 83 __ BEQ $17b5 ; (faddsub + 16)
1832 : 4a __ __ LSR
1833 : 05 1e __ ORA ACCU + 3 
1835 : 85 1e __ STA ACCU + 3 
1837 : b0 06 __ BCS $183f ; (faddsub + 154)
1839 : a5 1d __ LDA ACCU + 2 
183b : 29 7f __ AND #$7f
183d : 85 1d __ STA ACCU + 2 
183f : 60 __ __ RTS
1840 : 38 __ __ SEC
1841 : a5 1b __ LDA ACCU + 0 
1843 : e5 03 __ SBC WORK + 0 
1845 : 85 1b __ STA ACCU + 0 
1847 : a5 1c __ LDA ACCU + 1 
1849 : e5 04 __ SBC WORK + 1 
184b : 85 1c __ STA ACCU + 1 
184d : a5 1d __ LDA ACCU + 2 
184f : e5 05 __ SBC WORK + 2 
1851 : 85 1d __ STA ACCU + 2 
1853 : b0 19 __ BCS $186e ; (faddsub + 201)
1855 : 38 __ __ SEC
1856 : a9 00 __ LDA #$00
1858 : e5 1b __ SBC ACCU + 0 
185a : 85 1b __ STA ACCU + 0 
185c : a9 00 __ LDA #$00
185e : e5 1c __ SBC ACCU + 1 
1860 : 85 1c __ STA ACCU + 1 
1862 : a9 00 __ LDA #$00
1864 : e5 1d __ SBC ACCU + 2 
1866 : 85 1d __ STA ACCU + 2 
1868 : a5 1e __ LDA ACCU + 3 
186a : 49 80 __ EOR #$80
186c : 85 1e __ STA ACCU + 3 
186e : a5 1d __ LDA ACCU + 2 
1870 : 30 ba __ BMI $182c ; (faddsub + 135)
1872 : 05 1c __ ORA ACCU + 1 
1874 : 05 1b __ ORA ACCU + 0 
1876 : f0 0f __ BEQ $1887 ; (faddsub + 226)
1878 : c6 07 __ DEC WORK + 4 
187a : f0 0b __ BEQ $1887 ; (faddsub + 226)
187c : 06 1b __ ASL ACCU + 0 
187e : 26 1c __ ROL ACCU + 1 
1880 : 26 1d __ ROL ACCU + 2 
1882 : 10 f4 __ BPL $1878 ; (faddsub + 211)
1884 : 4c 2c 18 JMP $182c ; (faddsub + 135)
1887 : a9 00 __ LDA #$00
1889 : 85 1b __ STA ACCU + 0 
188b : 85 1c __ STA ACCU + 1 
188d : 85 1d __ STA ACCU + 2 
188f : 85 1e __ STA ACCU + 3 
1891 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1892 : a5 1b __ LDA ACCU + 0 
1894 : 05 1c __ ORA ACCU + 1 
1896 : 05 1d __ ORA ACCU + 2 
1898 : f0 0e __ BEQ $18a8 ; (crt_fmul + 22)
189a : a5 03 __ LDA WORK + 0 
189c : 05 04 __ ORA WORK + 1 
189e : 05 05 __ ORA WORK + 2 
18a0 : d0 09 __ BNE $18ab ; (crt_fmul + 25)
18a2 : 85 1b __ STA ACCU + 0 
18a4 : 85 1c __ STA ACCU + 1 
18a6 : 85 1d __ STA ACCU + 2 
18a8 : 85 1e __ STA ACCU + 3 
18aa : 60 __ __ RTS
18ab : a5 1e __ LDA ACCU + 3 
18ad : 45 06 __ EOR WORK + 3 
18af : 29 80 __ AND #$80
18b1 : 85 1e __ STA ACCU + 3 
18b3 : a9 ff __ LDA #$ff
18b5 : c5 07 __ CMP WORK + 4 
18b7 : f0 42 __ BEQ $18fb ; (crt_fmul + 105)
18b9 : c5 08 __ CMP WORK + 5 
18bb : f0 3e __ BEQ $18fb ; (crt_fmul + 105)
18bd : a9 00 __ LDA #$00
18bf : 85 09 __ STA WORK + 6 
18c1 : 85 0a __ STA WORK + 7 
18c3 : 85 0b __ STA WORK + 8 
18c5 : a4 1b __ LDY ACCU + 0 
18c7 : a5 03 __ LDA WORK + 0 
18c9 : d0 06 __ BNE $18d1 ; (crt_fmul + 63)
18cb : a5 04 __ LDA WORK + 1 
18cd : f0 0a __ BEQ $18d9 ; (crt_fmul + 71)
18cf : d0 05 __ BNE $18d6 ; (crt_fmul + 68)
18d1 : 20 2c 19 JSR $192c ; (crt_fmul8 + 0)
18d4 : a5 04 __ LDA WORK + 1 
18d6 : 20 2c 19 JSR $192c ; (crt_fmul8 + 0)
18d9 : a5 05 __ LDA WORK + 2 
18db : 20 2c 19 JSR $192c ; (crt_fmul8 + 0)
18de : 38 __ __ SEC
18df : a5 0b __ LDA WORK + 8 
18e1 : 30 06 __ BMI $18e9 ; (crt_fmul + 87)
18e3 : 06 09 __ ASL WORK + 6 
18e5 : 26 0a __ ROL WORK + 7 
18e7 : 2a __ __ ROL
18e8 : 18 __ __ CLC
18e9 : 29 7f __ AND #$7f
18eb : 85 0b __ STA WORK + 8 
18ed : a5 07 __ LDA WORK + 4 
18ef : 65 08 __ ADC WORK + 5 
18f1 : 90 19 __ BCC $190c ; (crt_fmul + 122)
18f3 : e9 7f __ SBC #$7f
18f5 : b0 04 __ BCS $18fb ; (crt_fmul + 105)
18f7 : c9 ff __ CMP #$ff
18f9 : d0 15 __ BNE $1910 ; (crt_fmul + 126)
18fb : a5 1e __ LDA ACCU + 3 
18fd : 09 7f __ ORA #$7f
18ff : 85 1e __ STA ACCU + 3 
1901 : a9 80 __ LDA #$80
1903 : 85 1d __ STA ACCU + 2 
1905 : a9 00 __ LDA #$00
1907 : 85 1b __ STA ACCU + 0 
1909 : 85 1c __ STA ACCU + 1 
190b : 60 __ __ RTS
190c : e9 7e __ SBC #$7e
190e : 90 15 __ BCC $1925 ; (crt_fmul + 147)
1910 : 4a __ __ LSR
1911 : 05 1e __ ORA ACCU + 3 
1913 : 85 1e __ STA ACCU + 3 
1915 : a9 00 __ LDA #$00
1917 : 6a __ __ ROR
1918 : 05 0b __ ORA WORK + 8 
191a : 85 1d __ STA ACCU + 2 
191c : a5 0a __ LDA WORK + 7 
191e : 85 1c __ STA ACCU + 1 
1920 : a5 09 __ LDA WORK + 6 
1922 : 85 1b __ STA ACCU + 0 
1924 : 60 __ __ RTS
1925 : a9 00 __ LDA #$00
1927 : 85 1e __ STA ACCU + 3 
1929 : f0 d8 __ BEQ $1903 ; (crt_fmul + 113)
192b : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
192c : 38 __ __ SEC
192d : 6a __ __ ROR
192e : 90 1e __ BCC $194e ; (crt_fmul8 + 34)
1930 : aa __ __ TAX
1931 : 18 __ __ CLC
1932 : 98 __ __ TYA
1933 : 65 09 __ ADC WORK + 6 
1935 : 85 09 __ STA WORK + 6 
1937 : a5 0a __ LDA WORK + 7 
1939 : 65 1c __ ADC ACCU + 1 
193b : 85 0a __ STA WORK + 7 
193d : a5 0b __ LDA WORK + 8 
193f : 65 1d __ ADC ACCU + 2 
1941 : 6a __ __ ROR
1942 : 85 0b __ STA WORK + 8 
1944 : 8a __ __ TXA
1945 : 66 0a __ ROR WORK + 7 
1947 : 66 09 __ ROR WORK + 6 
1949 : 4a __ __ LSR
194a : f0 0d __ BEQ $1959 ; (crt_fmul8 + 45)
194c : b0 e2 __ BCS $1930 ; (crt_fmul8 + 4)
194e : 66 0b __ ROR WORK + 8 
1950 : 66 0a __ ROR WORK + 7 
1952 : 66 09 __ ROR WORK + 6 
1954 : 4a __ __ LSR
1955 : 90 f7 __ BCC $194e ; (crt_fmul8 + 34)
1957 : d0 d7 __ BNE $1930 ; (crt_fmul8 + 4)
1959 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
195a : a5 1b __ LDA ACCU + 0 
195c : 05 1c __ ORA ACCU + 1 
195e : 05 1d __ ORA ACCU + 2 
1960 : d0 03 __ BNE $1965 ; (crt_fdiv + 11)
1962 : 85 1e __ STA ACCU + 3 
1964 : 60 __ __ RTS
1965 : a5 1e __ LDA ACCU + 3 
1967 : 45 06 __ EOR WORK + 3 
1969 : 29 80 __ AND #$80
196b : 85 1e __ STA ACCU + 3 
196d : a5 08 __ LDA WORK + 5 
196f : f0 62 __ BEQ $19d3 ; (crt_fdiv + 121)
1971 : a5 07 __ LDA WORK + 4 
1973 : c9 ff __ CMP #$ff
1975 : f0 5c __ BEQ $19d3 ; (crt_fdiv + 121)
1977 : a9 00 __ LDA #$00
1979 : 85 09 __ STA WORK + 6 
197b : 85 0a __ STA WORK + 7 
197d : 85 0b __ STA WORK + 8 
197f : a2 18 __ LDX #$18
1981 : a5 1b __ LDA ACCU + 0 
1983 : c5 03 __ CMP WORK + 0 
1985 : a5 1c __ LDA ACCU + 1 
1987 : e5 04 __ SBC WORK + 1 
1989 : a5 1d __ LDA ACCU + 2 
198b : e5 05 __ SBC WORK + 2 
198d : 90 13 __ BCC $19a2 ; (crt_fdiv + 72)
198f : a5 1b __ LDA ACCU + 0 
1991 : e5 03 __ SBC WORK + 0 
1993 : 85 1b __ STA ACCU + 0 
1995 : a5 1c __ LDA ACCU + 1 
1997 : e5 04 __ SBC WORK + 1 
1999 : 85 1c __ STA ACCU + 1 
199b : a5 1d __ LDA ACCU + 2 
199d : e5 05 __ SBC WORK + 2 
199f : 85 1d __ STA ACCU + 2 
19a1 : 38 __ __ SEC
19a2 : 26 09 __ ROL WORK + 6 
19a4 : 26 0a __ ROL WORK + 7 
19a6 : 26 0b __ ROL WORK + 8 
19a8 : ca __ __ DEX
19a9 : f0 0a __ BEQ $19b5 ; (crt_fdiv + 91)
19ab : 06 1b __ ASL ACCU + 0 
19ad : 26 1c __ ROL ACCU + 1 
19af : 26 1d __ ROL ACCU + 2 
19b1 : b0 dc __ BCS $198f ; (crt_fdiv + 53)
19b3 : 90 cc __ BCC $1981 ; (crt_fdiv + 39)
19b5 : 38 __ __ SEC
19b6 : a5 0b __ LDA WORK + 8 
19b8 : 30 06 __ BMI $19c0 ; (crt_fdiv + 102)
19ba : 06 09 __ ASL WORK + 6 
19bc : 26 0a __ ROL WORK + 7 
19be : 2a __ __ ROL
19bf : 18 __ __ CLC
19c0 : 29 7f __ AND #$7f
19c2 : 85 0b __ STA WORK + 8 
19c4 : a5 07 __ LDA WORK + 4 
19c6 : e5 08 __ SBC WORK + 5 
19c8 : 90 1a __ BCC $19e4 ; (crt_fdiv + 138)
19ca : 18 __ __ CLC
19cb : 69 7f __ ADC #$7f
19cd : b0 04 __ BCS $19d3 ; (crt_fdiv + 121)
19cf : c9 ff __ CMP #$ff
19d1 : d0 15 __ BNE $19e8 ; (crt_fdiv + 142)
19d3 : a5 1e __ LDA ACCU + 3 
19d5 : 09 7f __ ORA #$7f
19d7 : 85 1e __ STA ACCU + 3 
19d9 : a9 80 __ LDA #$80
19db : 85 1d __ STA ACCU + 2 
19dd : a9 00 __ LDA #$00
19df : 85 1c __ STA ACCU + 1 
19e1 : 85 1b __ STA ACCU + 0 
19e3 : 60 __ __ RTS
19e4 : 69 7f __ ADC #$7f
19e6 : 90 15 __ BCC $19fd ; (crt_fdiv + 163)
19e8 : 4a __ __ LSR
19e9 : 05 1e __ ORA ACCU + 3 
19eb : 85 1e __ STA ACCU + 3 
19ed : a9 00 __ LDA #$00
19ef : 6a __ __ ROR
19f0 : 05 0b __ ORA WORK + 8 
19f2 : 85 1d __ STA ACCU + 2 
19f4 : a5 0a __ LDA WORK + 7 
19f6 : 85 1c __ STA ACCU + 1 
19f8 : a5 09 __ LDA WORK + 6 
19fa : 85 1b __ STA ACCU + 0 
19fc : 60 __ __ RTS
19fd : a9 00 __ LDA #$00
19ff : 85 1e __ STA ACCU + 3 
1a01 : 85 1d __ STA ACCU + 2 
1a03 : 85 1c __ STA ACCU + 1 
1a05 : 85 1b __ STA ACCU + 0 
1a07 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1a08 : 24 1c __ BIT ACCU + 1 
1a0a : 10 0d __ BPL $1a19 ; (divs16 + 17)
1a0c : 20 26 1a JSR $1a26 ; (negaccu + 0)
1a0f : 24 04 __ BIT WORK + 1 
1a11 : 10 0d __ BPL $1a20 ; (divs16 + 24)
1a13 : 20 34 1a JSR $1a34 ; (negtmp + 0)
1a16 : 4c 42 1a JMP $1a42 ; (divmod + 0)
1a19 : 24 04 __ BIT WORK + 1 
1a1b : 10 f9 __ BPL $1a16 ; (divs16 + 14)
1a1d : 20 34 1a JSR $1a34 ; (negtmp + 0)
1a20 : 20 42 1a JSR $1a42 ; (divmod + 0)
1a23 : 4c 26 1a JMP $1a26 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1a26 : 38 __ __ SEC
1a27 : a9 00 __ LDA #$00
1a29 : e5 1b __ SBC ACCU + 0 
1a2b : 85 1b __ STA ACCU + 0 
1a2d : a9 00 __ LDA #$00
1a2f : e5 1c __ SBC ACCU + 1 
1a31 : 85 1c __ STA ACCU + 1 
1a33 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1a34 : 38 __ __ SEC
1a35 : a9 00 __ LDA #$00
1a37 : e5 03 __ SBC WORK + 0 
1a39 : 85 03 __ STA WORK + 0 
1a3b : a9 00 __ LDA #$00
1a3d : e5 04 __ SBC WORK + 1 
1a3f : 85 04 __ STA WORK + 1 
1a41 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1a42 : a5 1c __ LDA ACCU + 1 
1a44 : d0 31 __ BNE $1a77 ; (divmod + 53)
1a46 : a5 04 __ LDA WORK + 1 
1a48 : d0 1e __ BNE $1a68 ; (divmod + 38)
1a4a : 85 06 __ STA WORK + 3 
1a4c : a2 04 __ LDX #$04
1a4e : 06 1b __ ASL ACCU + 0 
1a50 : 2a __ __ ROL
1a51 : c5 03 __ CMP WORK + 0 
1a53 : 90 02 __ BCC $1a57 ; (divmod + 21)
1a55 : e5 03 __ SBC WORK + 0 
1a57 : 26 1b __ ROL ACCU + 0 
1a59 : 2a __ __ ROL
1a5a : c5 03 __ CMP WORK + 0 
1a5c : 90 02 __ BCC $1a60 ; (divmod + 30)
1a5e : e5 03 __ SBC WORK + 0 
1a60 : 26 1b __ ROL ACCU + 0 
1a62 : ca __ __ DEX
1a63 : d0 eb __ BNE $1a50 ; (divmod + 14)
1a65 : 85 05 __ STA WORK + 2 
1a67 : 60 __ __ RTS
1a68 : a5 1b __ LDA ACCU + 0 
1a6a : 85 05 __ STA WORK + 2 
1a6c : a5 1c __ LDA ACCU + 1 
1a6e : 85 06 __ STA WORK + 3 
1a70 : a9 00 __ LDA #$00
1a72 : 85 1b __ STA ACCU + 0 
1a74 : 85 1c __ STA ACCU + 1 
1a76 : 60 __ __ RTS
1a77 : a5 04 __ LDA WORK + 1 
1a79 : d0 1f __ BNE $1a9a ; (divmod + 88)
1a7b : a5 03 __ LDA WORK + 0 
1a7d : 30 1b __ BMI $1a9a ; (divmod + 88)
1a7f : a9 00 __ LDA #$00
1a81 : 85 06 __ STA WORK + 3 
1a83 : a2 10 __ LDX #$10
1a85 : 06 1b __ ASL ACCU + 0 
1a87 : 26 1c __ ROL ACCU + 1 
1a89 : 2a __ __ ROL
1a8a : c5 03 __ CMP WORK + 0 
1a8c : 90 02 __ BCC $1a90 ; (divmod + 78)
1a8e : e5 03 __ SBC WORK + 0 
1a90 : 26 1b __ ROL ACCU + 0 
1a92 : 26 1c __ ROL ACCU + 1 
1a94 : ca __ __ DEX
1a95 : d0 f2 __ BNE $1a89 ; (divmod + 71)
1a97 : 85 05 __ STA WORK + 2 
1a99 : 60 __ __ RTS
1a9a : a9 00 __ LDA #$00
1a9c : 85 05 __ STA WORK + 2 
1a9e : 85 06 __ STA WORK + 3 
1aa0 : 84 02 __ STY $02 
1aa2 : a0 10 __ LDY #$10
1aa4 : 18 __ __ CLC
1aa5 : 26 1b __ ROL ACCU + 0 
1aa7 : 26 1c __ ROL ACCU + 1 
1aa9 : 26 05 __ ROL WORK + 2 
1aab : 26 06 __ ROL WORK + 3 
1aad : 38 __ __ SEC
1aae : a5 05 __ LDA WORK + 2 
1ab0 : e5 03 __ SBC WORK + 0 
1ab2 : aa __ __ TAX
1ab3 : a5 06 __ LDA WORK + 3 
1ab5 : e5 04 __ SBC WORK + 1 
1ab7 : 90 04 __ BCC $1abd ; (divmod + 123)
1ab9 : 86 05 __ STX WORK + 2 
1abb : 85 06 __ STA WORK + 3 
1abd : 88 __ __ DEY
1abe : d0 e5 __ BNE $1aa5 ; (divmod + 99)
1ac0 : 26 1b __ ROL ACCU + 0 
1ac2 : 26 1c __ ROL ACCU + 1 
1ac4 : a4 02 __ LDY $02 
1ac6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1ac7 : 24 1c __ BIT ACCU + 1 
1ac9 : 10 10 __ BPL $1adb ; (mods16 + 20)
1acb : 20 26 1a JSR $1a26 ; (negaccu + 0)
1ace : 24 04 __ BIT WORK + 1 
1ad0 : 10 03 __ BPL $1ad5 ; (mods16 + 14)
1ad2 : 20 34 1a JSR $1a34 ; (negtmp + 0)
1ad5 : 20 42 1a JSR $1a42 ; (divmod + 0)
1ad8 : 4c e6 1a JMP $1ae6 ; (negtmpb + 0)
1adb : 24 04 __ BIT WORK + 1 
1add : 10 03 __ BPL $1ae2 ; (mods16 + 27)
1adf : 20 34 1a JSR $1a34 ; (negtmp + 0)
1ae2 : 4c 42 1a JMP $1a42 ; (divmod + 0)
1ae5 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1ae6 : 38 __ __ SEC
1ae7 : a9 00 __ LDA #$00
1ae9 : e5 05 __ SBC WORK + 2 
1aeb : 85 05 __ STA WORK + 2 
1aed : a9 00 __ LDA #$00
1aef : e5 06 __ SBC WORK + 3 
1af1 : 85 06 __ STA WORK + 3 
1af3 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1af4 : 20 84 17 JSR $1784 ; (freg + 36)
1af7 : a5 07 __ LDA WORK + 4 
1af9 : c9 7f __ CMP #$7f
1afb : b0 07 __ BCS $1b04 ; (f32_to_i16 + 16)
1afd : a9 00 __ LDA #$00
1aff : 85 1b __ STA ACCU + 0 
1b01 : 85 1c __ STA ACCU + 1 
1b03 : 60 __ __ RTS
1b04 : e9 8e __ SBC #$8e
1b06 : 90 16 __ BCC $1b1e ; (f32_to_i16 + 42)
1b08 : 24 1e __ BIT ACCU + 3 
1b0a : 30 09 __ BMI $1b15 ; (f32_to_i16 + 33)
1b0c : a9 ff __ LDA #$ff
1b0e : 85 1b __ STA ACCU + 0 
1b10 : a9 7f __ LDA #$7f
1b12 : 85 1c __ STA ACCU + 1 
1b14 : 60 __ __ RTS
1b15 : a9 00 __ LDA #$00
1b17 : 85 1b __ STA ACCU + 0 
1b19 : a9 80 __ LDA #$80
1b1b : 85 1c __ STA ACCU + 1 
1b1d : 60 __ __ RTS
1b1e : aa __ __ TAX
1b1f : a5 1c __ LDA ACCU + 1 
1b21 : 46 1d __ LSR ACCU + 2 
1b23 : 6a __ __ ROR
1b24 : e8 __ __ INX
1b25 : d0 fa __ BNE $1b21 ; (f32_to_i16 + 45)
1b27 : 24 1e __ BIT ACCU + 3 
1b29 : 10 0e __ BPL $1b39 ; (f32_to_i16 + 69)
1b2b : 38 __ __ SEC
1b2c : 49 ff __ EOR #$ff
1b2e : 69 00 __ ADC #$00
1b30 : 85 1b __ STA ACCU + 0 
1b32 : a9 00 __ LDA #$00
1b34 : e5 1d __ SBC ACCU + 2 
1b36 : 85 1c __ STA ACCU + 1 
1b38 : 60 __ __ RTS
1b39 : 85 1b __ STA ACCU + 0 
1b3b : a5 1d __ LDA ACCU + 2 
1b3d : 85 1c __ STA ACCU + 1 
1b3f : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1b40 : 24 1c __ BIT ACCU + 1 
1b42 : 30 03 __ BMI $1b47 ; (sint16_to_float + 7)
1b44 : 4c 5e 1b JMP $1b5e ; (uint16_to_float + 0)
1b47 : 38 __ __ SEC
1b48 : a9 00 __ LDA #$00
1b4a : e5 1b __ SBC ACCU + 0 
1b4c : 85 1b __ STA ACCU + 0 
1b4e : a9 00 __ LDA #$00
1b50 : e5 1c __ SBC ACCU + 1 
1b52 : 85 1c __ STA ACCU + 1 
1b54 : 20 5e 1b JSR $1b5e ; (uint16_to_float + 0)
1b57 : a5 1e __ LDA ACCU + 3 
1b59 : 09 80 __ ORA #$80
1b5b : 85 1e __ STA ACCU + 3 
1b5d : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1b5e : a5 1b __ LDA ACCU + 0 
1b60 : 05 1c __ ORA ACCU + 1 
1b62 : d0 05 __ BNE $1b69 ; (uint16_to_float + 11)
1b64 : 85 1d __ STA ACCU + 2 
1b66 : 85 1e __ STA ACCU + 3 
1b68 : 60 __ __ RTS
1b69 : a2 8e __ LDX #$8e
1b6b : a5 1c __ LDA ACCU + 1 
1b6d : 30 06 __ BMI $1b75 ; (uint16_to_float + 23)
1b6f : ca __ __ DEX
1b70 : 06 1b __ ASL ACCU + 0 
1b72 : 2a __ __ ROL
1b73 : 10 fa __ BPL $1b6f ; (uint16_to_float + 17)
1b75 : 0a __ __ ASL
1b76 : 85 1d __ STA ACCU + 2 
1b78 : a5 1b __ LDA ACCU + 0 
1b7a : 85 1c __ STA ACCU + 1 
1b7c : 8a __ __ TXA
1b7d : 4a __ __ LSR
1b7e : 85 1e __ STA ACCU + 3 
1b80 : a9 00 __ LDA #$00
1b82 : 85 1b __ STA ACCU + 0 
1b84 : 66 1d __ ROR ACCU + 2 
1b86 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1b87 : 84 02 __ STY $02 
1b89 : a0 20 __ LDY #$20
1b8b : a9 00 __ LDA #$00
1b8d : 85 07 __ STA WORK + 4 
1b8f : 85 08 __ STA WORK + 5 
1b91 : 85 09 __ STA WORK + 6 
1b93 : 85 0a __ STA WORK + 7 
1b95 : a5 05 __ LDA WORK + 2 
1b97 : 05 06 __ ORA WORK + 3 
1b99 : d0 78 __ BNE $1c13 ; (divmod32 + 140)
1b9b : a5 04 __ LDA WORK + 1 
1b9d : d0 27 __ BNE $1bc6 ; (divmod32 + 63)
1b9f : 18 __ __ CLC
1ba0 : 26 1b __ ROL ACCU + 0 
1ba2 : 26 1c __ ROL ACCU + 1 
1ba4 : 26 1d __ ROL ACCU + 2 
1ba6 : 26 1e __ ROL ACCU + 3 
1ba8 : 2a __ __ ROL
1ba9 : 90 05 __ BCC $1bb0 ; (divmod32 + 41)
1bab : e5 03 __ SBC WORK + 0 
1bad : 38 __ __ SEC
1bae : b0 06 __ BCS $1bb6 ; (divmod32 + 47)
1bb0 : c5 03 __ CMP WORK + 0 
1bb2 : 90 02 __ BCC $1bb6 ; (divmod32 + 47)
1bb4 : e5 03 __ SBC WORK + 0 
1bb6 : 88 __ __ DEY
1bb7 : d0 e7 __ BNE $1ba0 ; (divmod32 + 25)
1bb9 : 85 07 __ STA WORK + 4 
1bbb : 26 1b __ ROL ACCU + 0 
1bbd : 26 1c __ ROL ACCU + 1 
1bbf : 26 1d __ ROL ACCU + 2 
1bc1 : 26 1e __ ROL ACCU + 3 
1bc3 : a4 02 __ LDY $02 
1bc5 : 60 __ __ RTS
1bc6 : a5 1e __ LDA ACCU + 3 
1bc8 : d0 10 __ BNE $1bda ; (divmod32 + 83)
1bca : a6 1d __ LDX ACCU + 2 
1bcc : 86 1e __ STX ACCU + 3 
1bce : a6 1c __ LDX ACCU + 1 
1bd0 : 86 1d __ STX ACCU + 2 
1bd2 : a6 1b __ LDX ACCU + 0 
1bd4 : 86 1c __ STX ACCU + 1 
1bd6 : 85 1b __ STA ACCU + 0 
1bd8 : a0 18 __ LDY #$18
1bda : 18 __ __ CLC
1bdb : 26 1b __ ROL ACCU + 0 
1bdd : 26 1c __ ROL ACCU + 1 
1bdf : 26 1d __ ROL ACCU + 2 
1be1 : 26 1e __ ROL ACCU + 3 
1be3 : 26 07 __ ROL WORK + 4 
1be5 : 26 08 __ ROL WORK + 5 
1be7 : 90 0c __ BCC $1bf5 ; (divmod32 + 110)
1be9 : a5 07 __ LDA WORK + 4 
1beb : e5 03 __ SBC WORK + 0 
1bed : aa __ __ TAX
1bee : a5 08 __ LDA WORK + 5 
1bf0 : e5 04 __ SBC WORK + 1 
1bf2 : 38 __ __ SEC
1bf3 : b0 0c __ BCS $1c01 ; (divmod32 + 122)
1bf5 : 38 __ __ SEC
1bf6 : a5 07 __ LDA WORK + 4 
1bf8 : e5 03 __ SBC WORK + 0 
1bfa : aa __ __ TAX
1bfb : a5 08 __ LDA WORK + 5 
1bfd : e5 04 __ SBC WORK + 1 
1bff : 90 04 __ BCC $1c05 ; (divmod32 + 126)
1c01 : 86 07 __ STX WORK + 4 
1c03 : 85 08 __ STA WORK + 5 
1c05 : 88 __ __ DEY
1c06 : d0 d3 __ BNE $1bdb ; (divmod32 + 84)
1c08 : 26 1b __ ROL ACCU + 0 
1c0a : 26 1c __ ROL ACCU + 1 
1c0c : 26 1d __ ROL ACCU + 2 
1c0e : 26 1e __ ROL ACCU + 3 
1c10 : a4 02 __ LDY $02 
1c12 : 60 __ __ RTS
1c13 : a0 10 __ LDY #$10
1c15 : a5 1e __ LDA ACCU + 3 
1c17 : 85 08 __ STA WORK + 5 
1c19 : a5 1d __ LDA ACCU + 2 
1c1b : 85 07 __ STA WORK + 4 
1c1d : a9 00 __ LDA #$00
1c1f : 85 1d __ STA ACCU + 2 
1c21 : 85 1e __ STA ACCU + 3 
1c23 : 18 __ __ CLC
1c24 : 26 1b __ ROL ACCU + 0 
1c26 : 26 1c __ ROL ACCU + 1 
1c28 : 26 07 __ ROL WORK + 4 
1c2a : 26 08 __ ROL WORK + 5 
1c2c : 26 09 __ ROL WORK + 6 
1c2e : 26 0a __ ROL WORK + 7 
1c30 : a5 07 __ LDA WORK + 4 
1c32 : c5 03 __ CMP WORK + 0 
1c34 : a5 08 __ LDA WORK + 5 
1c36 : e5 04 __ SBC WORK + 1 
1c38 : a5 09 __ LDA WORK + 6 
1c3a : e5 05 __ SBC WORK + 2 
1c3c : aa __ __ TAX
1c3d : a5 0a __ LDA WORK + 7 
1c3f : e5 06 __ SBC WORK + 3 
1c41 : 90 11 __ BCC $1c54 ; (divmod32 + 205)
1c43 : 86 09 __ STX WORK + 6 
1c45 : 85 0a __ STA WORK + 7 
1c47 : a5 07 __ LDA WORK + 4 
1c49 : e5 03 __ SBC WORK + 0 
1c4b : 85 07 __ STA WORK + 4 
1c4d : a5 08 __ LDA WORK + 5 
1c4f : e5 04 __ SBC WORK + 1 
1c51 : 85 08 __ STA WORK + 5 
1c53 : 38 __ __ SEC
1c54 : 88 __ __ DEY
1c55 : d0 cd __ BNE $1c24 ; (divmod32 + 157)
1c57 : 26 1b __ ROL ACCU + 0 
1c59 : 26 1c __ ROL ACCU + 1 
1c5b : a4 02 __ LDY $02 
1c5d : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1c5e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1c5f : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1c60 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1c70 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
charset:
2000 : __ __ __ BYT 3c 42 5a 5e 40 42 3c 00 00 00 1c 02 3e 46 3a 00 : <BZ^@B<.....>F:.
2010 : __ __ __ BYT 00 40 40 7c 42 62 5c 00 00 00 3c 42 40 42 3c 00 : .@@|Bb\...<B@B<.
2020 : __ __ __ BYT 02 02 3a 46 42 46 3a 00 00 00 3c 42 7e 40 3c 00 : ..:FBF:...<B~@<.
2030 : __ __ __ BYT 00 06 08 3e 08 08 08 00 00 00 3a 46 42 3e 02 3c : ...>......:FB>.<
2040 : __ __ __ BYT 00 40 40 5c 62 42 42 00 08 00 18 08 08 08 1c 00 : .@@\bBB.........
2050 : __ __ __ BYT 00 04 00 0c 04 04 24 18 00 40 44 48 70 4c 42 00 : ......$..@DHpLB.
2060 : __ __ __ BYT 00 30 10 10 10 10 38 00 00 00 76 49 49 49 41 00 : .0....8...vIIIA.
2070 : __ __ __ BYT 00 00 58 64 42 42 42 00 00 00 3c 42 42 42 3c 00 : ..XdBBB...<BBB<.
2080 : __ __ __ BYT 00 00 5c 62 42 7c 40 40 00 00 3a 46 42 3e 02 02 : ..\bB|@@..:FB>..
2090 : __ __ __ BYT 00 00 5c 62 40 40 40 00 00 00 3c 40 3c 02 3c 00 : ..\b@@@...<@<.<.
20a0 : __ __ __ BYT 00 10 7c 10 10 10 08 00 00 00 42 42 42 46 3a 00 : ..|.......BBBF:.
20b0 : __ __ __ BYT 00 00 44 44 44 28 10 00 00 00 41 41 49 2a 14 00 : ..DDD(....AAI*..
20c0 : __ __ __ BYT 00 00 46 28 10 28 44 00 00 00 42 42 46 3a 04 78 : ..F(.(D...BBF:.x
20d0 : __ __ __ BYT 00 00 7e 04 18 20 7e 00 3c 20 20 20 20 20 3c 00 : ..~.. ~.<     <.
20e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 3c 04 04 04 04 04 3c 00 : ........<.....<.
20f0 : __ __ __ BYT 00 18 24 42 00 00 00 00 00 00 00 00 00 00 00 ff : ..$B............
2100 : __ __ __ BYT 00 00 00 00 00 00 00 00 10 10 10 10 00 00 10 00 : ................
2110 : __ __ __ BYT 24 24 48 00 00 00 00 00 12 12 7f 36 7f 24 24 00 : $$H........6.$$.
2120 : __ __ __ BYT 08 3e 68 3c 16 7c 10 00 00 44 08 10 20 44 00 00 : .>h<.|...D.. D..
2130 : __ __ __ BYT 18 24 14 39 46 44 3b 00 04 08 10 00 00 00 00 00 : .$.9FD;.........
2140 : __ __ __ BYT 0c 10 20 20 20 10 0c 00 30 08 04 04 04 08 30 00 : ..   ...0.....0.
2150 : __ __ __ BYT 00 2a 1c 7f 1c 2a 00 00 00 08 08 3e 08 08 00 00 : .*...*.....>....
2160 : __ __ __ BYT 00 00 00 00 00 08 08 10 00 00 00 7e 00 00 00 00 : ...........~....
2170 : __ __ __ BYT 00 00 00 00 00 00 08 00 00 02 04 08 10 20 40 00 : ............. @.
2180 : __ __ __ BYT 3c 46 4a 52 62 42 3c 00 08 18 28 08 08 08 3e 00 : <FJRbB<...(...>.
2190 : __ __ __ BYT 3c 42 02 0c 30 42 7e 00 3c 42 02 1c 02 42 3c 00 : <B..0B~.<B...B<.
21a0 : __ __ __ BYT 0c 10 24 44 7f 04 04 00 7e 40 7c 02 02 42 3c 00 : ..$D....~@|..B<.
21b0 : __ __ __ BYT 3c 42 40 7c 42 42 3c 00 7e 42 04 08 10 10 10 00 : <B@|BB<.~B......
21c0 : __ __ __ BYT 3c 42 42 3c 42 42 3c 00 3c 42 42 3e 02 42 3c 00 : <BB<BB<.<BB>.B<.
21d0 : __ __ __ BYT 00 00 08 00 00 08 00 00 00 00 08 00 00 08 08 10 : ................
21e0 : __ __ __ BYT 0c 10 20 40 20 10 0c 00 00 00 7e 00 7e 00 00 00 : .. @ .....~.~...
21f0 : __ __ __ BYT 30 08 04 02 04 08 30 00 3c 42 02 0c 10 00 10 00 : 0.....0.<B......
2200 : __ __ __ BYT 00 00 00 00 00 00 00 00 18 24 42 7e 42 42 42 00 : .........$B~BBB.
2210 : __ __ __ BYT 7c 42 42 7c 42 42 7c 00 3c 42 40 40 40 42 3c 00 : |BB|BB|.<B@@@B<.
2220 : __ __ __ BYT 78 44 42 42 42 44 78 00 7e 40 40 78 40 40 7e 00 : xDBBBDx.~@@x@@~.
2230 : __ __ __ BYT 7e 40 40 78 40 40 40 00 3c 42 40 4e 42 42 3c 00 : ~@@x@@@.<B@NBB<.
2240 : __ __ __ BYT 42 42 42 7e 42 42 42 00 1c 08 08 08 08 08 1c 00 : BBB~BBB.........
2250 : __ __ __ BYT 3e 02 02 02 02 22 1c 00 44 48 50 70 48 44 42 00 : >...."..DHPpHDB.
2260 : __ __ __ BYT 40 40 40 40 40 42 7e 00 41 63 55 49 41 41 41 00 : @@@@@B~.AcUIAAA.
2270 : __ __ __ BYT 42 62 52 4a 46 42 42 00 3c 42 42 42 42 42 3c 00 : BbRJFBB.<BBBBB<.
2280 : __ __ __ BYT 7c 42 42 7c 40 40 40 00 3c 42 42 42 4a 44 3a 00 : |BB|@@@.<BBBJD:.
2290 : __ __ __ BYT 7c 42 42 7c 48 44 42 00 3c 42 40 3c 02 42 3c 00 : |BB|HDB.<B@<.B<.
22a0 : __ __ __ BYT 3e 08 08 08 08 08 08 00 42 42 42 42 42 42 3c 00 : >.......BBBBBB<.
22b0 : __ __ __ BYT 22 22 22 22 14 14 08 00 41 41 41 49 55 63 41 00 : """"....AAAIUcA.
22c0 : __ __ __ BYT 41 22 14 08 14 22 41 00 22 22 22 14 08 08 08 00 : A"..."A.""".....
22d0 : __ __ __ BYT 7e 02 04 08 10 20 7e 00 00 00 00 00 00 00 00 00 : ~.... ~.........
22e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2350 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2370 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2390 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2400 : __ __ __ BYT c3 bd a5 a1 bf bd c3 ff ff ff e3 fd c1 b9 c5 ff : ................
2410 : __ __ __ BYT ff bf bf 83 bd 9d a3 ff ff ff c3 bd bf bd c3 ff : ................
2420 : __ __ __ BYT ff f9 fd c1 bd b9 c5 ff ff ff c3 bd 81 bf c3 ff : ................
2430 : __ __ __ BYT ff f9 f7 c1 f7 f7 f7 ff ff ff c5 b9 bd c1 fd c3 : ................
2440 : __ __ __ BYT ff bf bf a3 9d bd bd ff ff f7 ff e7 f7 f7 e3 ff : ................
2450 : __ __ __ BYT ff fb ff f3 fb fb db e7 ff bf bb b7 8f b3 bd ff : ................
2460 : __ __ __ BYT ff cf ef ef ef ef c7 ff ff ff 89 b6 b6 b6 be ff : ................
2470 : __ __ __ BYT ff ff 87 bb bd bd bd ff ff ff c5 b9 bd bd c3 ff : ................
2480 : __ __ __ BYT ff ff a3 9d bd 83 bf bf ff ff c5 b9 bd c1 fd fd : ................
2490 : __ __ __ BYT ff ff a3 9d bf bf bf ff ff ff c3 bf c3 fd c3 ff : ................
24a0 : __ __ __ BYT ff ef 83 ef ef ef f7 ff ff ff bd bd bd b9 c5 ff : ................
24b0 : __ __ __ BYT ff ff bb bb bb d7 ef ff ff ff be be b6 d5 eb ff : ................
24c0 : __ __ __ BYT ff ff b9 d7 ef d7 bb ff ff ff bd bd b9 c5 fb 87 : ................
24d0 : __ __ __ BYT ff ff 81 fb e7 df 81 ff c3 df df df df df c3 ff : ................
24e0 : __ __ __ BYT ff ff ff ff ff ff ff ff c3 fb fb fb fb fb c3 ff : ................
24f0 : __ __ __ BYT ff e7 db bd ff ff ff ff ff ff ff ff ff ff ff 00 : ................
2500 : __ __ __ BYT ff ff ff ff ff ff ff ff ef ef ef ef ff ff ef ff : ................
2510 : __ __ __ BYT db db b7 ff ff ff ff ff ed ed 80 c9 80 db db ff : ................
2520 : __ __ __ BYT f7 c1 97 c3 e9 83 ef ff ff bb f7 ef df bb ff ff : ................
2530 : __ __ __ BYT e7 db eb c6 b9 bb c4 ff fb f7 ef ff ff ff ff ff : ................
2540 : __ __ __ BYT f3 ef df df df ef f3 ff cf f7 fb fb fb f7 cf ff : ................
2550 : __ __ __ BYT ff d5 e3 80 e3 d5 ff ff ff f7 f7 c1 f7 f7 ff ff : ................
2560 : __ __ __ BYT ff ff ff ff ff f7 f7 ef ff ff ff 81 ff ff ff ff : ................
2570 : __ __ __ BYT ff ff ff ff ff ff f7 ff ff fd fb f7 ef df bf ff : ................
2580 : __ __ __ BYT c3 b9 b5 ad 9d bd c3 ff f7 e7 d7 f7 f7 f7 c1 ff : ................
2590 : __ __ __ BYT c3 bd fd f3 cf bd 81 ff c3 bd fd e3 fd bd c3 ff : ................
25a0 : __ __ __ BYT f3 ef db bb 80 fb fb ff 81 bf 83 fd fd bd c3 ff : ................
25b0 : __ __ __ BYT c3 bd bf 83 bd bd c3 ff 81 bd fb f7 ef ef ef ff : ................
25c0 : __ __ __ BYT c3 bd bd c3 bd bd c3 ff c3 bd bd c1 fd bd c3 ff : ................
25d0 : __ __ __ BYT ff ff f7 ff ff f7 ff ff ff ff f7 ff ff f7 f7 ef : ................
25e0 : __ __ __ BYT f3 ef df bf df ef f3 ff ff ff 81 ff 81 ff ff ff : ................
25f0 : __ __ __ BYT cf f7 fb fd fb f7 cf ff c3 bd fd f3 ef ff ef ff : ................
2600 : __ __ __ BYT ff ff ff ff ff ff ff ff e7 db bd 81 bd bd bd ff : ................
2610 : __ __ __ BYT 83 bd bd 83 bd bd 83 ff c3 bd bf bf bf bd c3 ff : ................
2620 : __ __ __ BYT 87 bb bd bd bd bb 87 ff 81 bf bf 87 bf bf 81 ff : ................
2630 : __ __ __ BYT 81 bf bf 87 bf bf bf ff c3 bd bf b1 bd bd c3 ff : ................
2640 : __ __ __ BYT bd bd bd 81 bd bd bd ff e3 f7 f7 f7 f7 f7 e3 ff : ................
2650 : __ __ __ BYT c1 fd fd fd fd dd e3 ff bb b7 af 8f b7 bb bd ff : ................
2660 : __ __ __ BYT bf bf bf bf bf bd 81 ff be 9c aa b6 be be be ff : ................
2670 : __ __ __ BYT bd 9d ad b5 b9 bd bd ff c3 bd bd bd bd bd c3 ff : ................
2680 : __ __ __ BYT 83 bd bd 83 bf bf bf ff c3 bd bd bd b5 bb c5 ff : ................
2690 : __ __ __ BYT 83 bd bd 83 b7 bb bd ff c3 bd bf c3 fd bd c3 ff : ................
26a0 : __ __ __ BYT c1 f7 f7 f7 f7 f7 f7 ff bd bd bd bd bd bd c3 ff : ................
26b0 : __ __ __ BYT dd dd dd dd eb eb f7 ff be be be b6 aa 9c be ff : ................
26c0 : __ __ __ BYT be dd eb f7 eb dd be ff dd dd dd eb f7 f7 f7 ff : ................
26d0 : __ __ __ BYT 81 fd fb f7 ef df 81 ff ff ff ff ff ff ff ff ff : ................
26e0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
26f0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2700 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2710 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2720 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2730 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2740 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2750 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2760 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2770 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2780 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2790 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27a0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27b0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27c0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27d0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27e0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27f0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
