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
080e : 8e 2b 1d STX $1d2b ; (spentry + 0)
0811 : a2 1d __ LDX #$1d
0813 : a0 49 __ LDY #$49
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1d __ CPX #$1d
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 4d __ CPY #$4d
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 96 __ LDA #$96
083d : 85 23 __ STA SP + 0 
083f : a9 cf __ LDA #$cf
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
;   9, "/home/honza/projects/c64/projects/oscar64/samples/memmap/largemem.c"
.s1:
0a00 : a2 03 __ LDX #$03
0a02 : b5 53 __ LDA T1 + 0,x 
0a04 : 9d 98 cf STA $cf98,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1 + 2)
.s4:
0a0a : a9 36 __ LDA #$36
0a0c : 85 01 __ STA $01 
0a0e : a9 00 __ LDA #$00
0a10 : 85 1b __ STA ACCU + 0 
0a12 : a9 04 __ LDA #$04
0a14 : 85 1c __ STA ACCU + 1 
0a16 : 20 5d 1c JSR $1c5d ; (crt_malloc + 0)
0a19 : a5 1c __ LDA ACCU + 1 
0a1b : 05 1b __ ORA ACCU + 0 
0a1d : f0 5f __ BEQ $0a7e ; (main.s5 + 0)
.s6:
0a1f : a5 1c __ LDA ACCU + 1 
0a21 : 85 54 __ STA T1 + 1 
0a23 : a5 1b __ LDA ACCU + 0 
0a25 : 85 53 __ STA T1 + 0 
0a27 : a9 00 __ LDA #$00
0a29 : 85 56 __ STA T2 + 1 
.l7:
0a2b : a9 48 __ LDA #$48
0a2d : 8d fa cf STA $cffa ; (sstack + 8)
0a30 : a9 17 __ LDA #$17
0a32 : 8d fb cf STA $cffb ; (sstack + 9)
0a35 : a5 1b __ LDA ACCU + 0 
0a37 : 8d fe cf STA $cffe ; (sstack + 12)
0a3a : a5 1c __ LDA ACCU + 1 
0a3c : 8d ff cf STA $cfff ; (sstack + 13)
0a3f : 18 __ __ CLC
0a40 : a5 56 __ LDA T2 + 1 
0a42 : 69 04 __ ADC #$04
0a44 : 85 56 __ STA T2 + 1 
0a46 : 8d fd cf STA $cffd ; (sstack + 11)
0a49 : a9 00 __ LDA #$00
0a4b : 8d fc cf STA $cffc ; (sstack + 10)
0a4e : 20 91 0a JSR $0a91 ; (printf.s4 + 0)
0a51 : a9 fc __ LDA #$fc
0a53 : 85 44 __ STA T0 + 1 
0a55 : a2 00 __ LDX #$00
0a57 : a0 00 __ LDY #$00
.l9:
0a59 : a9 aa __ LDA #$aa
0a5b : 91 53 __ STA (T1 + 0),y 
0a5d : c8 __ __ INY
0a5e : d0 02 __ BNE $0a62 ; (main.s12 + 0)
.s11:
0a60 : e6 54 __ INC T1 + 1 
.s12:
0a62 : e8 __ __ INX
0a63 : d0 f4 __ BNE $0a59 ; (main.l9 + 0)
.s10:
0a65 : e6 44 __ INC T0 + 1 
0a67 : d0 f0 __ BNE $0a59 ; (main.l9 + 0)
.s8:
0a69 : 86 1b __ STX ACCU + 0 
0a6b : a9 04 __ LDA #$04
0a6d : 85 1c __ STA ACCU + 1 
0a6f : 20 5d 1c JSR $1c5d ; (crt_malloc + 0)
0a72 : a5 1b __ LDA ACCU + 0 
0a74 : 85 53 __ STA T1 + 0 
0a76 : a5 1c __ LDA ACCU + 1 
0a78 : 85 54 __ STA T1 + 1 
0a7a : 05 1b __ ORA ACCU + 0 
0a7c : d0 ad __ BNE $0a2b ; (main.l7 + 0)
.s5:
0a7e : 85 1b __ STA ACCU + 0 
0a80 : 85 1c __ STA ACCU + 1 
0a82 : a9 37 __ LDA #$37
0a84 : 85 01 __ STA $01 
.s3:
0a86 : a2 03 __ LDX #$03
0a88 : bd 98 cf LDA $cf98,x ; (main@stack + 0)
0a8b : 95 53 __ STA T1 + 0,x 
0a8d : ca __ __ DEX
0a8e : 10 f8 __ BPL $0a88 ; (main.s3 + 2)
0a90 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
0a91 : a9 01 __ LDA #$01
0a93 : 8d f9 cf STA $cff9 ; (sstack + 7)
0a96 : a9 9e __ LDA #$9e
0a98 : 8d f3 cf STA $cff3 ; (sstack + 1)
0a9b : a9 cf __ LDA #$cf
0a9d : 8d f4 cf STA $cff4 ; (sstack + 2)
0aa0 : ad fa cf LDA $cffa ; (sstack + 8)
0aa3 : 8d f5 cf STA $cff5 ; (sstack + 3)
0aa6 : ad fb cf LDA $cffb ; (sstack + 9)
0aa9 : 8d f6 cf STA $cff6 ; (sstack + 4)
0aac : a9 fc __ LDA #$fc
0aae : 8d f7 cf STA $cff7 ; (sstack + 5)
0ab1 : a9 cf __ LDA #$cf
0ab3 : 8d f8 cf STA $cff8 ; (sstack + 6)
0ab6 : 4c b9 0a JMP $0ab9 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
0ab9 : a2 09 __ LDX #$09
0abb : b5 53 __ LDA T1 + 0,x 
0abd : 9d d0 cf STA $cfd0,x ; (sformat@stack + 0)
0ac0 : ca __ __ DEX
0ac1 : 10 f8 __ BPL $0abb ; (sformat.s1 + 2)
.s4:
0ac3 : ad f5 cf LDA $cff5 ; (sstack + 3)
0ac6 : 85 55 __ STA T3 + 0 
0ac8 : a9 00 __ LDA #$00
0aca : 85 5b __ STA T6 + 0 
0acc : ad f6 cf LDA $cff6 ; (sstack + 4)
0acf : 85 56 __ STA T3 + 1 
0ad1 : ad f3 cf LDA $cff3 ; (sstack + 1)
0ad4 : 85 57 __ STA T4 + 0 
0ad6 : ad f4 cf LDA $cff4 ; (sstack + 2)
0ad9 : 85 58 __ STA T4 + 1 
.l5:
0adb : a0 00 __ LDY #$00
0add : b1 55 __ LDA (T3 + 0),y 
0adf : d0 36 __ BNE $0b17 ; (sformat.s10 + 0)
.s6:
0ae1 : a4 5b __ LDY T6 + 0 
0ae3 : 91 57 __ STA (T4 + 0),y 
0ae5 : 98 __ __ TYA
0ae6 : f0 28 __ BEQ $0b10 ; (sformat.s95 + 0)
.s7:
0ae8 : ad f9 cf LDA $cff9 ; (sstack + 7)
0aeb : d0 18 __ BNE $0b05 ; (sformat.s9 + 0)
.s8:
0aed : 98 __ __ TYA
0aee : 18 __ __ CLC
0aef : 65 57 __ ADC T4 + 0 
0af1 : aa __ __ TAX
0af2 : a5 58 __ LDA T4 + 1 
0af4 : 69 00 __ ADC #$00
.s3:
0af6 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0af8 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0afa : a2 09 __ LDX #$09
0afc : bd d0 cf LDA $cfd0,x ; (sformat@stack + 0)
0aff : 95 53 __ STA T1 + 0,x 
0b01 : ca __ __ DEX
0b02 : 10 f8 __ BPL $0afc ; (sformat.s3 + 6)
0b04 : 60 __ __ RTS
.s9:
0b05 : a5 57 __ LDA T4 + 0 
0b07 : 85 0e __ STA P1 
0b09 : a5 58 __ LDA T4 + 1 
0b0b : 85 0f __ STA P2 
0b0d : 20 fa 0e JSR $0efa ; (puts.l4 + 0)
.s95:
0b10 : a5 58 __ LDA T4 + 1 
0b12 : a6 57 __ LDX T4 + 0 
0b14 : 4c f6 0a JMP $0af6 ; (sformat.s3 + 0)
.s10:
0b17 : c9 25 __ CMP #$25
0b19 : f0 3e __ BEQ $0b59 ; (sformat.s15 + 0)
.s11:
0b1b : a4 5b __ LDY T6 + 0 
0b1d : 91 57 __ STA (T4 + 0),y 
0b1f : e6 55 __ INC T3 + 0 
0b21 : d0 02 __ BNE $0b25 ; (sformat.s117 + 0)
.s116:
0b23 : e6 56 __ INC T3 + 1 
.s117:
0b25 : c8 __ __ INY
0b26 : 84 5b __ STY T6 + 0 
0b28 : 98 __ __ TYA
0b29 : c0 28 __ CPY #$28
0b2b : 90 ae __ BCC $0adb ; (sformat.l5 + 0)
.s12:
0b2d : 85 43 __ STA T0 + 0 
0b2f : a9 00 __ LDA #$00
0b31 : 85 5b __ STA T6 + 0 
0b33 : ad f9 cf LDA $cff9 ; (sstack + 7)
0b36 : f0 14 __ BEQ $0b4c ; (sformat.s13 + 0)
.s14:
0b38 : a5 57 __ LDA T4 + 0 
0b3a : 85 0e __ STA P1 
0b3c : a5 58 __ LDA T4 + 1 
0b3e : 85 0f __ STA P2 
0b40 : a9 00 __ LDA #$00
0b42 : a4 43 __ LDY T0 + 0 
0b44 : 91 0e __ STA (P1),y 
0b46 : 20 fa 0e JSR $0efa ; (puts.l4 + 0)
0b49 : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s13:
0b4c : 18 __ __ CLC
0b4d : a5 57 __ LDA T4 + 0 
0b4f : 65 43 __ ADC T0 + 0 
0b51 : 85 57 __ STA T4 + 0 
0b53 : 90 86 __ BCC $0adb ; (sformat.l5 + 0)
.s118:
0b55 : e6 58 __ INC T4 + 1 
0b57 : b0 82 __ BCS $0adb ; (sformat.l5 + 0)
.s15:
0b59 : a5 5b __ LDA T6 + 0 
0b5b : f0 27 __ BEQ $0b84 ; (sformat.s16 + 0)
.s89:
0b5d : 84 5b __ STY T6 + 0 
0b5f : 85 43 __ STA T0 + 0 
0b61 : ad f9 cf LDA $cff9 ; (sstack + 7)
0b64 : f0 13 __ BEQ $0b79 ; (sformat.s90 + 0)
.s91:
0b66 : a5 57 __ LDA T4 + 0 
0b68 : 85 0e __ STA P1 
0b6a : a5 58 __ LDA T4 + 1 
0b6c : 85 0f __ STA P2 
0b6e : 98 __ __ TYA
0b6f : a4 43 __ LDY T0 + 0 
0b71 : 91 0e __ STA (P1),y 
0b73 : 20 fa 0e JSR $0efa ; (puts.l4 + 0)
0b76 : 4c 84 0b JMP $0b84 ; (sformat.s16 + 0)
.s90:
0b79 : 18 __ __ CLC
0b7a : a5 57 __ LDA T4 + 0 
0b7c : 65 43 __ ADC T0 + 0 
0b7e : 85 57 __ STA T4 + 0 
0b80 : 90 02 __ BCC $0b84 ; (sformat.s16 + 0)
.s115:
0b82 : e6 58 __ INC T4 + 1 
.s16:
0b84 : a9 00 __ LDA #$00
0b86 : 8d df cf STA $cfdf ; (si.sign + 0)
0b89 : 8d e0 cf STA $cfe0 ; (si.left + 0)
0b8c : 8d e1 cf STA $cfe1 ; (si.prefix + 0)
0b8f : a0 01 __ LDY #$01
0b91 : b1 55 __ LDA (T3 + 0),y 
0b93 : a2 20 __ LDX #$20
0b95 : 8e da cf STX $cfda ; (si.fill + 0)
0b98 : a2 00 __ LDX #$00
0b9a : 8e db cf STX $cfdb ; (si.width + 0)
0b9d : ca __ __ DEX
0b9e : 8e dc cf STX $cfdc ; (si.precision + 0)
0ba1 : a2 0a __ LDX #$0a
0ba3 : 8e de cf STX $cfde ; (si.base + 0)
0ba6 : aa __ __ TAX
0ba7 : a9 02 __ LDA #$02
0ba9 : d0 07 __ BNE $0bb2 ; (sformat.l17 + 0)
.s85:
0bab : a0 00 __ LDY #$00
0bad : b1 55 __ LDA (T3 + 0),y 
0baf : aa __ __ TAX
0bb0 : a9 01 __ LDA #$01
.l17:
0bb2 : 18 __ __ CLC
0bb3 : 65 55 __ ADC T3 + 0 
0bb5 : 85 55 __ STA T3 + 0 
0bb7 : 90 02 __ BCC $0bbb ; (sformat.s106 + 0)
.s105:
0bb9 : e6 56 __ INC T3 + 1 
.s106:
0bbb : 8a __ __ TXA
0bbc : e0 2b __ CPX #$2b
0bbe : d0 07 __ BNE $0bc7 ; (sformat.s18 + 0)
.s88:
0bc0 : a9 01 __ LDA #$01
0bc2 : 8d df cf STA $cfdf ; (si.sign + 0)
0bc5 : d0 e4 __ BNE $0bab ; (sformat.s85 + 0)
.s18:
0bc7 : c9 30 __ CMP #$30
0bc9 : d0 06 __ BNE $0bd1 ; (sformat.s19 + 0)
.s87:
0bcb : 8d da cf STA $cfda ; (si.fill + 0)
0bce : 4c ab 0b JMP $0bab ; (sformat.s85 + 0)
.s19:
0bd1 : c9 23 __ CMP #$23
0bd3 : d0 07 __ BNE $0bdc ; (sformat.s20 + 0)
.s86:
0bd5 : a9 01 __ LDA #$01
0bd7 : 8d e1 cf STA $cfe1 ; (si.prefix + 0)
0bda : d0 cf __ BNE $0bab ; (sformat.s85 + 0)
.s20:
0bdc : c9 2d __ CMP #$2d
0bde : d0 07 __ BNE $0be7 ; (sformat.s21 + 0)
.s84:
0be0 : a9 01 __ LDA #$01
0be2 : 8d e0 cf STA $cfe0 ; (si.left + 0)
0be5 : d0 c4 __ BNE $0bab ; (sformat.s85 + 0)
.s21:
0be7 : 85 47 __ STA T2 + 0 
0be9 : c9 30 __ CMP #$30
0beb : 90 3c __ BCC $0c29 ; (sformat.s22 + 0)
.s80:
0bed : c9 3a __ CMP #$3a
0bef : b0 77 __ BCS $0c68 ; (sformat.s23 + 0)
.s81:
0bf1 : a9 00 __ LDA #$00
0bf3 : 85 53 __ STA T1 + 0 
.l82:
0bf5 : a5 53 __ LDA T1 + 0 
0bf7 : 0a __ __ ASL
0bf8 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0bfa : a9 00 __ LDA #$00
0bfc : 2a __ __ ROL
0bfd : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0bff : 2a __ __ ROL
0c00 : aa __ __ TAX
0c01 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c03 : 65 53 __ ADC T1 + 0 
0c05 : 0a __ __ ASL
0c06 : 18 __ __ CLC
0c07 : 65 47 __ ADC T2 + 0 
0c09 : 38 __ __ SEC
0c0a : e9 30 __ SBC #$30
0c0c : 85 53 __ STA T1 + 0 
0c0e : a0 00 __ LDY #$00
0c10 : b1 55 __ LDA (T3 + 0),y 
0c12 : 85 47 __ STA T2 + 0 
0c14 : e6 55 __ INC T3 + 0 
0c16 : d0 02 __ BNE $0c1a ; (sformat.s114 + 0)
.s113:
0c18 : e6 56 __ INC T3 + 1 
.s114:
0c1a : c9 30 __ CMP #$30
0c1c : 90 04 __ BCC $0c22 ; (sformat.s104 + 0)
.s83:
0c1e : c9 3a __ CMP #$3a
0c20 : 90 d3 __ BCC $0bf5 ; (sformat.l82 + 0)
.s104:
0c22 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0c24 : a6 53 __ LDX T1 + 0 
0c26 : 8e db cf STX $cfdb ; (si.width + 0)
.s22:
0c29 : c9 2e __ CMP #$2e
0c2b : d0 3b __ BNE $0c68 ; (sformat.s23 + 0)
.s76:
0c2d : a9 00 __ LDA #$00
0c2f : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0c31 : 4c 4b 0c JMP $0c4b ; (sformat.l77 + 0)
.s79:
0c34 : a5 43 __ LDA T0 + 0 
0c36 : 0a __ __ ASL
0c37 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c39 : 98 __ __ TYA
0c3a : 2a __ __ ROL
0c3b : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0c3d : 2a __ __ ROL
0c3e : aa __ __ TAX
0c3f : 18 __ __ CLC
0c40 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c42 : 65 43 __ ADC T0 + 0 
0c44 : 0a __ __ ASL
0c45 : 18 __ __ CLC
0c46 : 65 47 __ ADC T2 + 0 
0c48 : 38 __ __ SEC
0c49 : e9 30 __ SBC #$30
.l77:
0c4b : 85 43 __ STA T0 + 0 
0c4d : a0 00 __ LDY #$00
0c4f : b1 55 __ LDA (T3 + 0),y 
0c51 : 85 47 __ STA T2 + 0 
0c53 : e6 55 __ INC T3 + 0 
0c55 : d0 02 __ BNE $0c59 ; (sformat.s108 + 0)
.s107:
0c57 : e6 56 __ INC T3 + 1 
.s108:
0c59 : c9 30 __ CMP #$30
0c5b : 90 04 __ BCC $0c61 ; (sformat.s103 + 0)
.s78:
0c5d : c9 3a __ CMP #$3a
0c5f : 90 d3 __ BCC $0c34 ; (sformat.s79 + 0)
.s103:
0c61 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0c63 : a6 43 __ LDX T0 + 0 
0c65 : 8e dc cf STX $cfdc ; (si.precision + 0)
.s23:
0c68 : c9 64 __ CMP #$64
0c6a : f0 0c __ BEQ $0c78 ; (sformat.s75 + 0)
.s24:
0c6c : c9 44 __ CMP #$44
0c6e : f0 08 __ BEQ $0c78 ; (sformat.s75 + 0)
.s25:
0c70 : c9 69 __ CMP #$69
0c72 : f0 04 __ BEQ $0c78 ; (sformat.s75 + 0)
.s26:
0c74 : c9 49 __ CMP #$49
0c76 : d0 07 __ BNE $0c7f ; (sformat.s27 + 0)
.s75:
0c78 : a9 01 __ LDA #$01
.s93:
0c7a : 85 13 __ STA P6 
0c7c : 4c c0 0e JMP $0ec0 ; (sformat.s73 + 0)
.s27:
0c7f : c9 75 __ CMP #$75
0c81 : f0 04 __ BEQ $0c87 ; (sformat.s74 + 0)
.s28:
0c83 : c9 55 __ CMP #$55
0c85 : d0 04 __ BNE $0c8b ; (sformat.s29 + 0)
.s74:
0c87 : a9 00 __ LDA #$00
0c89 : f0 ef __ BEQ $0c7a ; (sformat.s93 + 0)
.s29:
0c8b : c9 78 __ CMP #$78
0c8d : f0 04 __ BEQ $0c93 ; (sformat.s72 + 0)
.s30:
0c8f : c9 58 __ CMP #$58
0c91 : d0 15 __ BNE $0ca8 ; (sformat.s31 + 0)
.s72:
0c93 : a5 47 __ LDA T2 + 0 
0c95 : 29 e0 __ AND #$e0
0c97 : 09 01 __ ORA #$01
0c99 : 8d dd cf STA $cfdd ; (si.cha + 0)
0c9c : a9 00 __ LDA #$00
0c9e : 85 13 __ STA P6 
0ca0 : a9 10 __ LDA #$10
0ca2 : 8d de cf STA $cfde ; (si.base + 0)
0ca5 : 4c c0 0e JMP $0ec0 ; (sformat.s73 + 0)
.s31:
0ca8 : c9 6c __ CMP #$6c
0caa : d0 03 __ BNE $0caf ; (sformat.s32 + 0)
0cac : 4c 31 0e JMP $0e31 ; (sformat.s60 + 0)
.s32:
0caf : c9 4c __ CMP #$4c
0cb1 : f0 f9 __ BEQ $0cac ; (sformat.s31 + 4)
.s33:
0cb3 : c9 66 __ CMP #$66
0cb5 : f0 14 __ BEQ $0ccb ; (sformat.s59 + 0)
.s34:
0cb7 : c9 67 __ CMP #$67
0cb9 : f0 10 __ BEQ $0ccb ; (sformat.s59 + 0)
.s35:
0cbb : c9 65 __ CMP #$65
0cbd : f0 0c __ BEQ $0ccb ; (sformat.s59 + 0)
.s36:
0cbf : c9 46 __ CMP #$46
0cc1 : f0 08 __ BEQ $0ccb ; (sformat.s59 + 0)
.s37:
0cc3 : c9 47 __ CMP #$47
0cc5 : f0 04 __ BEQ $0ccb ; (sformat.s59 + 0)
.s38:
0cc7 : c9 45 __ CMP #$45
0cc9 : d0 5c __ BNE $0d27 ; (sformat.s39 + 0)
.s59:
0ccb : a5 57 __ LDA T4 + 0 
0ccd : 85 13 __ STA P6 
0ccf : a5 58 __ LDA T4 + 1 
0cd1 : 85 14 __ STA P7 
0cd3 : a5 47 __ LDA T2 + 0 
0cd5 : 29 e0 __ AND #$e0
0cd7 : 09 01 __ ORA #$01
0cd9 : 8d dd cf STA $cfdd ; (si.cha + 0)
0cdc : ad f7 cf LDA $cff7 ; (sstack + 5)
0cdf : 85 59 __ STA T5 + 0 
0ce1 : a9 da __ LDA #$da
0ce3 : 85 11 __ STA P4 
0ce5 : a9 cf __ LDA #$cf
0ce7 : 85 12 __ STA P5 
0ce9 : ad f8 cf LDA $cff8 ; (sstack + 6)
0cec : 85 5a __ STA T5 + 1 
0cee : a0 00 __ LDY #$00
0cf0 : b1 59 __ LDA (T5 + 0),y 
0cf2 : 85 15 __ STA P8 
0cf4 : c8 __ __ INY
0cf5 : b1 59 __ LDA (T5 + 0),y 
0cf7 : 85 16 __ STA P9 
0cf9 : c8 __ __ INY
0cfa : b1 59 __ LDA (T5 + 0),y 
0cfc : 85 17 __ STA P10 
0cfe : c8 __ __ INY
0cff : b1 59 __ LDA (T5 + 0),y 
0d01 : 85 18 __ STA P11 
0d03 : a5 47 __ LDA T2 + 0 
0d05 : ed dd cf SBC $cfdd ; (si.cha + 0)
0d08 : 18 __ __ CLC
0d09 : 69 61 __ ADC #$61
0d0b : 8d f2 cf STA $cff2 ; (sstack + 0)
0d0e : 20 d5 11 JSR $11d5 ; (nformf.s1 + 0)
0d11 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0d13 : 85 5b __ STA T6 + 0 
0d15 : 18 __ __ CLC
0d16 : a5 59 __ LDA T5 + 0 
0d18 : 69 04 __ ADC #$04
0d1a : 8d f7 cf STA $cff7 ; (sstack + 5)
0d1d : a5 5a __ LDA T5 + 1 
0d1f : 69 00 __ ADC #$00
0d21 : 8d f8 cf STA $cff8 ; (sstack + 6)
0d24 : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s39:
0d27 : c9 73 __ CMP #$73
0d29 : f0 3b __ BEQ $0d66 ; (sformat.s47 + 0)
.s40:
0d2b : c9 53 __ CMP #$53
0d2d : f0 37 __ BEQ $0d66 ; (sformat.s47 + 0)
.s41:
0d2f : c9 63 __ CMP #$63
0d31 : f0 12 __ BEQ $0d45 ; (sformat.s46 + 0)
.s42:
0d33 : c9 43 __ CMP #$43
0d35 : f0 0e __ BEQ $0d45 ; (sformat.s46 + 0)
.s43:
0d37 : aa __ __ TAX
0d38 : f0 ea __ BEQ $0d24 ; (sformat.s59 + 89)
.s44:
0d3a : a0 00 __ LDY #$00
0d3c : 91 57 __ STA (T4 + 0),y 
.s45:
0d3e : a9 01 __ LDA #$01
.s96:
0d40 : 85 5b __ STA T6 + 0 
0d42 : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s46:
0d45 : ad f7 cf LDA $cff7 ; (sstack + 5)
0d48 : 85 43 __ STA T0 + 0 
0d4a : ad f8 cf LDA $cff8 ; (sstack + 6)
0d4d : 85 44 __ STA T0 + 1 
0d4f : a0 00 __ LDY #$00
0d51 : b1 43 __ LDA (T0 + 0),y 
0d53 : 91 57 __ STA (T4 + 0),y 
0d55 : a5 43 __ LDA T0 + 0 
0d57 : 69 01 __ ADC #$01
0d59 : 8d f7 cf STA $cff7 ; (sstack + 5)
0d5c : a5 44 __ LDA T0 + 1 
0d5e : 69 00 __ ADC #$00
0d60 : 8d f8 cf STA $cff8 ; (sstack + 6)
0d63 : 4c 3e 0d JMP $0d3e ; (sformat.s45 + 0)
.s47:
0d66 : ad f7 cf LDA $cff7 ; (sstack + 5)
0d69 : 85 43 __ STA T0 + 0 
0d6b : 69 01 __ ADC #$01
0d6d : 8d f7 cf STA $cff7 ; (sstack + 5)
0d70 : ad f8 cf LDA $cff8 ; (sstack + 6)
0d73 : 85 44 __ STA T0 + 1 
0d75 : 69 00 __ ADC #$00
0d77 : 8d f8 cf STA $cff8 ; (sstack + 6)
0d7a : a0 00 __ LDY #$00
0d7c : 84 5c __ STY T7 + 0 
0d7e : b1 43 __ LDA (T0 + 0),y 
0d80 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d82 : 85 53 __ STA T1 + 0 
0d84 : c8 __ __ INY
0d85 : b1 43 __ LDA (T0 + 0),y 
0d87 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d89 : 85 54 __ STA T1 + 1 
0d8b : ad db cf LDA $cfdb ; (si.width + 0)
0d8e : f0 0c __ BEQ $0d9c ; (sformat.s48 + 0)
.s100:
0d90 : 88 __ __ DEY
0d91 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d93 : f0 05 __ BEQ $0d9a ; (sformat.s101 + 0)
.l58:
0d95 : c8 __ __ INY
0d96 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d98 : d0 fb __ BNE $0d95 ; (sformat.l58 + 0)
.s101:
0d9a : 84 5c __ STY T7 + 0 
.s48:
0d9c : ad e0 cf LDA $cfe0 ; (si.left + 0)
0d9f : 85 59 __ STA T5 + 0 
0da1 : d0 19 __ BNE $0dbc ; (sformat.s49 + 0)
.s98:
0da3 : a6 5c __ LDX T7 + 0 
0da5 : ec db cf CPX $cfdb ; (si.width + 0)
0da8 : a0 00 __ LDY #$00
0daa : b0 0c __ BCS $0db8 ; (sformat.s99 + 0)
.l57:
0dac : ad da cf LDA $cfda ; (si.fill + 0)
0daf : 91 57 __ STA (T4 + 0),y 
0db1 : c8 __ __ INY
0db2 : e8 __ __ INX
0db3 : ec db cf CPX $cfdb ; (si.width + 0)
0db6 : 90 f4 __ BCC $0dac ; (sformat.l57 + 0)
.s99:
0db8 : 86 5c __ STX T7 + 0 
0dba : 84 5b __ STY T6 + 0 
.s49:
0dbc : ac f9 cf LDY $cff9 ; (sstack + 7)
0dbf : d0 48 __ BNE $0e09 ; (sformat.s54 + 0)
.s50:
0dc1 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0dc3 : f0 23 __ BEQ $0de8 ; (sformat.s51 + 0)
.s53:
0dc5 : 18 __ __ CLC
0dc6 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0dc8 : 69 01 __ ADC #$01
0dca : 85 43 __ STA T0 + 0 
0dcc : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0dce : 69 00 __ ADC #$00
0dd0 : 85 44 __ STA T0 + 1 
0dd2 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0dd4 : a4 5b __ LDY T6 + 0 
0dd6 : 91 57 __ STA (T4 + 0),y 
0dd8 : e6 5b __ INC T6 + 0 
0dda : a0 00 __ LDY #$00
0ddc : b1 43 __ LDA (T0 + 0),y 
0dde : a8 __ __ TAY
0ddf : e6 43 __ INC T0 + 0 
0de1 : d0 02 __ BNE $0de5 ; (sformat.s112 + 0)
.s111:
0de3 : e6 44 __ INC T0 + 1 
.s112:
0de5 : 98 __ __ TYA
0de6 : d0 ec __ BNE $0dd4 ; (sformat.l92 + 0)
.s51:
0de8 : a5 59 __ LDA T5 + 0 
0dea : d0 03 __ BNE $0def ; (sformat.s97 + 0)
0dec : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s97:
0def : a6 5c __ LDX T7 + 0 
0df1 : ec db cf CPX $cfdb ; (si.width + 0)
0df4 : a4 5b __ LDY T6 + 0 
0df6 : b0 0c __ BCS $0e04 ; (sformat.s102 + 0)
.l52:
0df8 : ad da cf LDA $cfda ; (si.fill + 0)
0dfb : 91 57 __ STA (T4 + 0),y 
0dfd : c8 __ __ INY
0dfe : e8 __ __ INX
0dff : ec db cf CPX $cfdb ; (si.width + 0)
0e02 : 90 f4 __ BCC $0df8 ; (sformat.l52 + 0)
.s102:
0e04 : 84 5b __ STY T6 + 0 
0e06 : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s54:
0e09 : a4 5b __ LDY T6 + 0 
0e0b : f0 11 __ BEQ $0e1e ; (sformat.s55 + 0)
.s56:
0e0d : a5 57 __ LDA T4 + 0 
0e0f : 85 0e __ STA P1 
0e11 : a5 58 __ LDA T4 + 1 
0e13 : 85 0f __ STA P2 
0e15 : a9 00 __ LDA #$00
0e17 : 85 5b __ STA T6 + 0 
0e19 : 91 0e __ STA (P1),y 
0e1b : 20 fa 0e JSR $0efa ; (puts.l4 + 0)
.s55:
0e1e : a5 53 __ LDA T1 + 0 
0e20 : 85 0e __ STA P1 
0e22 : a5 54 __ LDA T1 + 1 
0e24 : 85 0f __ STA P2 
0e26 : 20 fa 0e JSR $0efa ; (puts.l4 + 0)
0e29 : ad e0 cf LDA $cfe0 ; (si.left + 0)
0e2c : d0 c1 __ BNE $0def ; (sformat.s97 + 0)
0e2e : 4c db 0a JMP $0adb ; (sformat.l5 + 0)
.s60:
0e31 : ad f7 cf LDA $cff7 ; (sstack + 5)
0e34 : 85 43 __ STA T0 + 0 
0e36 : 69 03 __ ADC #$03
0e38 : 8d f7 cf STA $cff7 ; (sstack + 5)
0e3b : ad f8 cf LDA $cff8 ; (sstack + 6)
0e3e : 85 44 __ STA T0 + 1 
0e40 : 69 00 __ ADC #$00
0e42 : 8d f8 cf STA $cff8 ; (sstack + 6)
0e45 : a0 00 __ LDY #$00
0e47 : b1 55 __ LDA (T3 + 0),y 
0e49 : aa __ __ TAX
0e4a : e6 55 __ INC T3 + 0 
0e4c : d0 02 __ BNE $0e50 ; (sformat.s110 + 0)
.s109:
0e4e : e6 56 __ INC T3 + 1 
.s110:
0e50 : b1 43 __ LDA (T0 + 0),y 
0e52 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0e54 : 85 11 __ STA P4 
0e56 : a0 01 __ LDY #$01
0e58 : b1 43 __ LDA (T0 + 0),y 
0e5a : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0e5c : 85 12 __ STA P5 
0e5e : c8 __ __ INY
0e5f : b1 43 __ LDA (T0 + 0),y 
0e61 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0e63 : 85 13 __ STA P6 
0e65 : c8 __ __ INY
0e66 : b1 43 __ LDA (T0 + 0),y 
0e68 : 85 14 __ STA P7 
0e6a : e0 64 __ CPX #$64
0e6c : f0 0c __ BEQ $0e7a ; (sformat.s71 + 0)
.s61:
0e6e : e0 44 __ CPX #$44
0e70 : f0 08 __ BEQ $0e7a ; (sformat.s71 + 0)
.s62:
0e72 : e0 69 __ CPX #$69
0e74 : f0 04 __ BEQ $0e7a ; (sformat.s71 + 0)
.s63:
0e76 : e0 49 __ CPX #$49
0e78 : d0 1c __ BNE $0e96 ; (sformat.s64 + 0)
.s71:
0e7a : a9 01 __ LDA #$01
.s94:
0e7c : 85 15 __ STA P8 
.s69:
0e7e : a5 57 __ LDA T4 + 0 
0e80 : 85 0f __ STA P2 
0e82 : a5 58 __ LDA T4 + 1 
0e84 : 85 10 __ STA P3 
0e86 : a9 da __ LDA #$da
0e88 : 85 0d __ STA P0 
0e8a : a9 cf __ LDA #$cf
0e8c : 85 0e __ STA P1 
0e8e : 20 8b 10 JSR $108b ; (nforml.s4 + 0)
0e91 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e93 : 4c 40 0d JMP $0d40 ; (sformat.s96 + 0)
.s64:
0e96 : e0 75 __ CPX #$75
0e98 : f0 04 __ BEQ $0e9e ; (sformat.s70 + 0)
.s65:
0e9a : e0 55 __ CPX #$55
0e9c : d0 04 __ BNE $0ea2 ; (sformat.s66 + 0)
.s70:
0e9e : a9 00 __ LDA #$00
0ea0 : f0 da __ BEQ $0e7c ; (sformat.s94 + 0)
.s66:
0ea2 : e0 78 __ CPX #$78
0ea4 : f0 06 __ BEQ $0eac ; (sformat.s68 + 0)
.s67:
0ea6 : 85 1e __ STA ACCU + 3 ; (fps + 0)
0ea8 : e0 58 __ CPX #$58
0eaa : d0 82 __ BNE $0e2e ; (sformat.s55 + 16)
.s68:
0eac : a9 00 __ LDA #$00
0eae : 85 15 __ STA P8 
0eb0 : a9 10 __ LDA #$10
0eb2 : 8d de cf STA $cfde ; (si.base + 0)
0eb5 : 8a __ __ TXA
0eb6 : 29 e0 __ AND #$e0
0eb8 : 09 01 __ ORA #$01
0eba : 8d dd cf STA $cfdd ; (si.cha + 0)
0ebd : 4c 7e 0e JMP $0e7e ; (sformat.s69 + 0)
.s73:
0ec0 : a5 57 __ LDA T4 + 0 
0ec2 : 85 0f __ STA P2 
0ec4 : a5 58 __ LDA T4 + 1 
0ec6 : 85 10 __ STA P3 
0ec8 : ad f7 cf LDA $cff7 ; (sstack + 5)
0ecb : 85 43 __ STA T0 + 0 
0ecd : ad f8 cf LDA $cff8 ; (sstack + 6)
0ed0 : 85 44 __ STA T0 + 1 
0ed2 : a0 00 __ LDY #$00
0ed4 : b1 43 __ LDA (T0 + 0),y 
0ed6 : 85 11 __ STA P4 
0ed8 : c8 __ __ INY
0ed9 : b1 43 __ LDA (T0 + 0),y 
0edb : 85 12 __ STA P5 
0edd : 18 __ __ CLC
0ede : a5 43 __ LDA T0 + 0 
0ee0 : 69 02 __ ADC #$02
0ee2 : 8d f7 cf STA $cff7 ; (sstack + 5)
0ee5 : a5 44 __ LDA T0 + 1 
0ee7 : 69 00 __ ADC #$00
0ee9 : 8d f8 cf STA $cff8 ; (sstack + 6)
0eec : a9 da __ LDA #$da
0eee : 85 0d __ STA P0 
0ef0 : a9 cf __ LDA #$cf
0ef2 : 85 0e __ STA P1 
0ef4 : 20 70 0f JSR $0f70 ; (nformi.s4 + 0)
0ef7 : 4c 40 0d JMP $0d40 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0efa : a0 00 __ LDY #$00
0efc : b1 0e __ LDA (P1),y ; (str + 0)
0efe : d0 01 __ BNE $0f01 ; (puts.s5 + 0)
.s3:
0f00 : 60 __ __ RTS
.s5:
0f01 : e6 0e __ INC P1 ; (str + 0)
0f03 : d0 02 __ BNE $0f07 ; (puts.s7 + 0)
.s6:
0f05 : e6 0f __ INC P2 ; (str + 1)
.s7:
0f07 : 20 0d 0f JSR $0f0d ; (putpch.s4 + 0)
0f0a : 4c fa 0e JMP $0efa ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0f0d : 85 0d __ STA P0 ; (c + 0)
0f0f : ad 2c 1d LDA $1d2c ; (giocharmap + 0)
0f12 : f0 32 __ BEQ $0f46 ; (putpch.s5 + 0)
.s6:
0f14 : a5 0d __ LDA P0 ; (c + 0)
0f16 : c9 0a __ CMP #$0a
0f18 : d0 04 __ BNE $0f1e ; (putpch.s7 + 0)
.s18:
0f1a : a9 0d __ LDA #$0d
0f1c : d0 32 __ BNE $0f50 ; (putpch.s15 + 0)
.s7:
0f1e : c9 09 __ CMP #$09
0f20 : f0 36 __ BEQ $0f58 ; (putpch.s16 + 0)
.s8:
0f22 : ad 2c 1d LDA $1d2c ; (giocharmap + 0)
0f25 : c9 02 __ CMP #$02
0f27 : 90 1d __ BCC $0f46 ; (putpch.s5 + 0)
.s9:
0f29 : a5 0d __ LDA P0 ; (c + 0)
0f2b : c9 41 __ CMP #$41
0f2d : 90 17 __ BCC $0f46 ; (putpch.s5 + 0)
.s10:
0f2f : c9 7b __ CMP #$7b
0f31 : b0 13 __ BCS $0f46 ; (putpch.s5 + 0)
.s11:
0f33 : c9 61 __ CMP #$61
0f35 : b0 04 __ BCS $0f3b ; (putpch.s13 + 0)
.s12:
0f37 : c9 5b __ CMP #$5b
0f39 : b0 0b __ BCS $0f46 ; (putpch.s5 + 0)
.s13:
0f3b : 49 20 __ EOR #$20
0f3d : 85 0d __ STA P0 ; (c + 0)
0f3f : ad 2c 1d LDA $1d2c ; (giocharmap + 0)
0f42 : c9 02 __ CMP #$02
0f44 : f0 06 __ BEQ $0f4c ; (putpch.s14 + 0)
.s5:
0f46 : a5 0d __ LDA P0 ; (c + 0)
0f48 : 20 d2 ff JSR $ffd2 
.s3:
0f4b : 60 __ __ RTS
.s14:
0f4c : a5 0d __ LDA P0 ; (c + 0)
0f4e : 29 5f __ AND #$5f
.s15:
0f50 : 85 43 __ STA T0 + 0 
0f52 : a5 43 __ LDA T0 + 0 
0f54 : 20 d2 ff JSR $ffd2 
0f57 : 60 __ __ RTS
.s16:
0f58 : a5 d3 __ LDA $d3 
0f5a : 29 03 __ AND #$03
0f5c : 85 43 __ STA T0 + 0 
0f5e : a9 20 __ LDA #$20
0f60 : 85 44 __ STA T1 + 0 
.l17:
0f62 : a5 44 __ LDA T1 + 0 
0f64 : 20 d2 ff JSR $ffd2 
0f67 : e6 43 __ INC T0 + 0 
0f69 : a5 43 __ LDA T0 + 0 
0f6b : c9 04 __ CMP #$04
0f6d : 90 f3 __ BCC $0f62 ; (putpch.l17 + 0)
0f6f : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0f70 : a9 00 __ LDA #$00
0f72 : 85 43 __ STA T5 + 0 
0f74 : a0 04 __ LDY #$04
0f76 : b1 0d __ LDA (P0),y ; (si + 0)
0f78 : 85 44 __ STA T6 + 0 
0f7a : a5 13 __ LDA P6 ; (s + 0)
0f7c : f0 13 __ BEQ $0f91 ; (nformi.s5 + 0)
.s33:
0f7e : 24 12 __ BIT P5 ; (v + 1)
0f80 : 10 0f __ BPL $0f91 ; (nformi.s5 + 0)
.s34:
0f82 : 38 __ __ SEC
0f83 : a9 00 __ LDA #$00
0f85 : e5 11 __ SBC P4 ; (v + 0)
0f87 : 85 11 __ STA P4 ; (v + 0)
0f89 : a9 00 __ LDA #$00
0f8b : e5 12 __ SBC P5 ; (v + 1)
0f8d : 85 12 __ STA P5 ; (v + 1)
0f8f : e6 43 __ INC T5 + 0 
.s5:
0f91 : a9 10 __ LDA #$10
0f93 : 85 45 __ STA T7 + 0 
0f95 : a5 11 __ LDA P4 ; (v + 0)
0f97 : 05 12 __ ORA P5 ; (v + 1)
0f99 : f0 33 __ BEQ $0fce ; (nformi.s6 + 0)
.s28:
0f9b : a5 11 __ LDA P4 ; (v + 0)
0f9d : 85 1b __ STA ACCU + 0 
0f9f : a5 12 __ LDA P5 ; (v + 1)
0fa1 : 85 1c __ STA ACCU + 1 
.l29:
0fa3 : a5 44 __ LDA T6 + 0 
0fa5 : 85 03 __ STA WORK + 0 
0fa7 : a9 00 __ LDA #$00
0fa9 : 85 04 __ STA WORK + 1 
0fab : 20 41 1a JSR $1a41 ; (divmod + 0)
0fae : a5 05 __ LDA WORK + 2 
0fb0 : c9 0a __ CMP #$0a
0fb2 : b0 04 __ BCS $0fb8 ; (nformi.s32 + 0)
.s30:
0fb4 : a9 30 __ LDA #$30
0fb6 : 90 06 __ BCC $0fbe ; (nformi.s31 + 0)
.s32:
0fb8 : a0 03 __ LDY #$03
0fba : b1 0d __ LDA (P0),y ; (si + 0)
0fbc : e9 0a __ SBC #$0a
.s31:
0fbe : 18 __ __ CLC
0fbf : 65 05 __ ADC WORK + 2 
0fc1 : a6 45 __ LDX T7 + 0 
0fc3 : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
0fc6 : c6 45 __ DEC T7 + 0 
0fc8 : a5 1b __ LDA ACCU + 0 
0fca : 05 1c __ ORA ACCU + 1 
0fcc : d0 d5 __ BNE $0fa3 ; (nformi.l29 + 0)
.s6:
0fce : a0 02 __ LDY #$02
0fd0 : b1 0d __ LDA (P0),y ; (si + 0)
0fd2 : c9 ff __ CMP #$ff
0fd4 : d0 04 __ BNE $0fda ; (nformi.s27 + 0)
.s7:
0fd6 : a9 0f __ LDA #$0f
0fd8 : d0 05 __ BNE $0fdf ; (nformi.s39 + 0)
.s27:
0fda : 38 __ __ SEC
0fdb : a9 10 __ LDA #$10
0fdd : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0fdf : a8 __ __ TAY
0fe0 : c4 45 __ CPY T7 + 0 
0fe2 : b0 0d __ BCS $0ff1 ; (nformi.s8 + 0)
.s26:
0fe4 : a9 30 __ LDA #$30
.l40:
0fe6 : a6 45 __ LDX T7 + 0 
0fe8 : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
0feb : c6 45 __ DEC T7 + 0 
0fed : c4 45 __ CPY T7 + 0 
0fef : 90 f5 __ BCC $0fe6 ; (nformi.l40 + 0)
.s8:
0ff1 : a0 07 __ LDY #$07
0ff3 : b1 0d __ LDA (P0),y ; (si + 0)
0ff5 : f0 1c __ BEQ $1013 ; (nformi.s9 + 0)
.s24:
0ff7 : a5 44 __ LDA T6 + 0 
0ff9 : c9 10 __ CMP #$10
0ffb : d0 16 __ BNE $1013 ; (nformi.s9 + 0)
.s25:
0ffd : a0 03 __ LDY #$03
0fff : b1 0d __ LDA (P0),y ; (si + 0)
1001 : a8 __ __ TAY
1002 : a9 30 __ LDA #$30
1004 : a6 45 __ LDX T7 + 0 
1006 : ca __ __ DEX
1007 : ca __ __ DEX
1008 : 86 45 __ STX T7 + 0 
100a : 9d e2 cf STA $cfe2,x ; (buffer[0] + 0)
100d : 98 __ __ TYA
100e : 69 16 __ ADC #$16
1010 : 9d e3 cf STA $cfe3,x ; (buffer[0] + 1)
.s9:
1013 : a9 00 __ LDA #$00
1015 : 85 1b __ STA ACCU + 0 
1017 : a5 43 __ LDA T5 + 0 
1019 : f0 0c __ BEQ $1027 ; (nformi.s10 + 0)
.s23:
101b : a9 2d __ LDA #$2d
.s22:
101d : a6 45 __ LDX T7 + 0 
101f : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
1022 : c6 45 __ DEC T7 + 0 
1024 : 4c 31 10 JMP $1031 ; (nformi.s11 + 0)
.s10:
1027 : a0 05 __ LDY #$05
1029 : b1 0d __ LDA (P0),y ; (si + 0)
102b : f0 04 __ BEQ $1031 ; (nformi.s11 + 0)
.s21:
102d : a9 2b __ LDA #$2b
102f : d0 ec __ BNE $101d ; (nformi.s22 + 0)
.s11:
1031 : a6 45 __ LDX T7 + 0 
1033 : a0 06 __ LDY #$06
1035 : b1 0d __ LDA (P0),y ; (si + 0)
1037 : d0 2b __ BNE $1064 ; (nformi.s17 + 0)
.l12:
1039 : 8a __ __ TXA
103a : 18 __ __ CLC
103b : a0 01 __ LDY #$01
103d : 71 0d __ ADC (P0),y ; (si + 0)
103f : b0 04 __ BCS $1045 ; (nformi.s15 + 0)
.s16:
1041 : c9 11 __ CMP #$11
1043 : 90 0a __ BCC $104f ; (nformi.s13 + 0)
.s15:
1045 : a0 00 __ LDY #$00
1047 : b1 0d __ LDA (P0),y ; (si + 0)
1049 : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
104c : ca __ __ DEX
104d : b0 ea __ BCS $1039 ; (nformi.l12 + 0)
.s13:
104f : e0 10 __ CPX #$10
1051 : b0 0e __ BCS $1061 ; (nformi.s41 + 0)
.s14:
1053 : 88 __ __ DEY
.l37:
1054 : bd e2 cf LDA $cfe2,x ; (buffer[0] + 0)
1057 : 91 0f __ STA (P2),y ; (str + 0)
1059 : c8 __ __ INY
105a : e8 __ __ INX
105b : e0 10 __ CPX #$10
105d : 90 f5 __ BCC $1054 ; (nformi.l37 + 0)
.s38:
105f : 84 1b __ STY ACCU + 0 
.s41:
1061 : a5 1b __ LDA ACCU + 0 
.s3:
1063 : 60 __ __ RTS
.s17:
1064 : e0 10 __ CPX #$10
1066 : b0 1a __ BCS $1082 ; (nformi.l18 + 0)
.s20:
1068 : a0 00 __ LDY #$00
.l35:
106a : bd e2 cf LDA $cfe2,x ; (buffer[0] + 0)
106d : 91 0f __ STA (P2),y ; (str + 0)
106f : c8 __ __ INY
1070 : e8 __ __ INX
1071 : e0 10 __ CPX #$10
1073 : 90 f5 __ BCC $106a ; (nformi.l35 + 0)
.s36:
1075 : 84 1b __ STY ACCU + 0 
1077 : b0 09 __ BCS $1082 ; (nformi.l18 + 0)
.s19:
1079 : 88 __ __ DEY
107a : b1 0d __ LDA (P0),y ; (si + 0)
107c : a4 1b __ LDY ACCU + 0 
107e : 91 0f __ STA (P2),y ; (str + 0)
1080 : e6 1b __ INC ACCU + 0 
.l18:
1082 : a5 1b __ LDA ACCU + 0 
1084 : a0 01 __ LDY #$01
1086 : d1 0d __ CMP (P0),y ; (si + 0)
1088 : 90 ef __ BCC $1079 ; (nformi.s19 + 0)
108a : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
108b : a9 00 __ LDA #$00
108d : 85 43 __ STA T4 + 0 
108f : a5 15 __ LDA P8 ; (s + 0)
1091 : f0 1f __ BEQ $10b2 ; (nforml.s5 + 0)
.s35:
1093 : 24 14 __ BIT P7 ; (v + 3)
1095 : 10 1b __ BPL $10b2 ; (nforml.s5 + 0)
.s36:
1097 : 38 __ __ SEC
1098 : a9 00 __ LDA #$00
109a : e5 11 __ SBC P4 ; (v + 0)
109c : 85 11 __ STA P4 ; (v + 0)
109e : a9 00 __ LDA #$00
10a0 : e5 12 __ SBC P5 ; (v + 1)
10a2 : 85 12 __ STA P5 ; (v + 1)
10a4 : a9 00 __ LDA #$00
10a6 : e5 13 __ SBC P6 ; (v + 2)
10a8 : 85 13 __ STA P6 ; (v + 2)
10aa : a9 00 __ LDA #$00
10ac : e5 14 __ SBC P7 ; (v + 3)
10ae : 85 14 __ STA P7 ; (v + 3)
10b0 : e6 43 __ INC T4 + 0 
.s5:
10b2 : a9 10 __ LDA #$10
10b4 : 85 44 __ STA T5 + 0 
10b6 : a5 14 __ LDA P7 ; (v + 3)
10b8 : f0 03 __ BEQ $10bd ; (nforml.s31 + 0)
10ba : 4c 85 11 JMP $1185 ; (nforml.l28 + 0)
.s31:
10bd : a5 13 __ LDA P6 ; (v + 2)
10bf : d0 f9 __ BNE $10ba ; (nforml.s5 + 8)
.s32:
10c1 : a5 12 __ LDA P5 ; (v + 1)
10c3 : d0 f5 __ BNE $10ba ; (nforml.s5 + 8)
.s33:
10c5 : c5 11 __ CMP P4 ; (v + 0)
10c7 : 90 f1 __ BCC $10ba ; (nforml.s5 + 8)
.s6:
10c9 : a0 02 __ LDY #$02
10cb : b1 0d __ LDA (P0),y ; (si + 0)
10cd : c9 ff __ CMP #$ff
10cf : d0 04 __ BNE $10d5 ; (nforml.s27 + 0)
.s7:
10d1 : a9 0f __ LDA #$0f
10d3 : d0 05 __ BNE $10da ; (nforml.s41 + 0)
.s27:
10d5 : 38 __ __ SEC
10d6 : a9 10 __ LDA #$10
10d8 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
10da : a8 __ __ TAY
10db : c4 44 __ CPY T5 + 0 
10dd : b0 0d __ BCS $10ec ; (nforml.s8 + 0)
.s26:
10df : a9 30 __ LDA #$30
.l42:
10e1 : a6 44 __ LDX T5 + 0 
10e3 : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
10e6 : c6 44 __ DEC T5 + 0 
10e8 : c4 44 __ CPY T5 + 0 
10ea : 90 f5 __ BCC $10e1 ; (nforml.l42 + 0)
.s8:
10ec : a0 07 __ LDY #$07
10ee : b1 0d __ LDA (P0),y ; (si + 0)
10f0 : f0 1d __ BEQ $110f ; (nforml.s9 + 0)
.s24:
10f2 : a0 04 __ LDY #$04
10f4 : b1 0d __ LDA (P0),y ; (si + 0)
10f6 : c9 10 __ CMP #$10
10f8 : d0 15 __ BNE $110f ; (nforml.s9 + 0)
.s25:
10fa : 88 __ __ DEY
10fb : b1 0d __ LDA (P0),y ; (si + 0)
10fd : a8 __ __ TAY
10fe : a9 30 __ LDA #$30
1100 : a6 44 __ LDX T5 + 0 
1102 : ca __ __ DEX
1103 : ca __ __ DEX
1104 : 86 44 __ STX T5 + 0 
1106 : 9d e2 cf STA $cfe2,x ; (buffer[0] + 0)
1109 : 98 __ __ TYA
110a : 69 16 __ ADC #$16
110c : 9d e3 cf STA $cfe3,x ; (buffer[0] + 1)
.s9:
110f : a9 00 __ LDA #$00
1111 : 85 1b __ STA ACCU + 0 
1113 : a5 43 __ LDA T4 + 0 
1115 : f0 0c __ BEQ $1123 ; (nforml.s10 + 0)
.s23:
1117 : a9 2d __ LDA #$2d
.s22:
1119 : a6 44 __ LDX T5 + 0 
111b : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
111e : c6 44 __ DEC T5 + 0 
1120 : 4c 2d 11 JMP $112d ; (nforml.s11 + 0)
.s10:
1123 : a0 05 __ LDY #$05
1125 : b1 0d __ LDA (P0),y ; (si + 0)
1127 : f0 04 __ BEQ $112d ; (nforml.s11 + 0)
.s21:
1129 : a9 2b __ LDA #$2b
112b : d0 ec __ BNE $1119 ; (nforml.s22 + 0)
.s11:
112d : a0 06 __ LDY #$06
112f : a6 44 __ LDX T5 + 0 
1131 : b1 0d __ LDA (P0),y ; (si + 0)
1133 : d0 29 __ BNE $115e ; (nforml.s17 + 0)
.l12:
1135 : 8a __ __ TXA
1136 : 18 __ __ CLC
1137 : a0 01 __ LDY #$01
1139 : 71 0d __ ADC (P0),y ; (si + 0)
113b : b0 04 __ BCS $1141 ; (nforml.s15 + 0)
.s16:
113d : c9 11 __ CMP #$11
113f : 90 0a __ BCC $114b ; (nforml.s13 + 0)
.s15:
1141 : a0 00 __ LDY #$00
1143 : b1 0d __ LDA (P0),y ; (si + 0)
1145 : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
1148 : ca __ __ DEX
1149 : b0 ea __ BCS $1135 ; (nforml.l12 + 0)
.s13:
114b : e0 10 __ CPX #$10
114d : b0 0e __ BCS $115d ; (nforml.s3 + 0)
.s14:
114f : 88 __ __ DEY
.l39:
1150 : bd e2 cf LDA $cfe2,x ; (buffer[0] + 0)
1153 : 91 0f __ STA (P2),y ; (str + 0)
1155 : c8 __ __ INY
1156 : e8 __ __ INX
1157 : e0 10 __ CPX #$10
1159 : 90 f5 __ BCC $1150 ; (nforml.l39 + 0)
.s40:
115b : 84 1b __ STY ACCU + 0 
.s3:
115d : 60 __ __ RTS
.s17:
115e : e0 10 __ CPX #$10
1160 : b0 1a __ BCS $117c ; (nforml.l18 + 0)
.s20:
1162 : a0 00 __ LDY #$00
.l37:
1164 : bd e2 cf LDA $cfe2,x ; (buffer[0] + 0)
1167 : 91 0f __ STA (P2),y ; (str + 0)
1169 : c8 __ __ INY
116a : e8 __ __ INX
116b : e0 10 __ CPX #$10
116d : 90 f5 __ BCC $1164 ; (nforml.l37 + 0)
.s38:
116f : 84 1b __ STY ACCU + 0 
1171 : b0 09 __ BCS $117c ; (nforml.l18 + 0)
.s19:
1173 : 88 __ __ DEY
1174 : b1 0d __ LDA (P0),y ; (si + 0)
1176 : a4 1b __ LDY ACCU + 0 
1178 : 91 0f __ STA (P2),y ; (str + 0)
117a : e6 1b __ INC ACCU + 0 
.l18:
117c : a5 1b __ LDA ACCU + 0 
117e : a0 01 __ LDY #$01
1180 : d1 0d __ CMP (P0),y ; (si + 0)
1182 : 90 ef __ BCC $1173 ; (nforml.s19 + 0)
1184 : 60 __ __ RTS
.l28:
1185 : a0 04 __ LDY #$04
1187 : b1 0d __ LDA (P0),y ; (si + 0)
1189 : 85 03 __ STA WORK + 0 
118b : a5 11 __ LDA P4 ; (v + 0)
118d : 85 1b __ STA ACCU + 0 
118f : a5 12 __ LDA P5 ; (v + 1)
1191 : 85 1c __ STA ACCU + 1 
1193 : a5 13 __ LDA P6 ; (v + 2)
1195 : 85 1d __ STA ACCU + 2 
1197 : a5 14 __ LDA P7 ; (v + 3)
1199 : 85 1e __ STA ACCU + 3 
119b : a9 00 __ LDA #$00
119d : 85 04 __ STA WORK + 1 
119f : 85 05 __ STA WORK + 2 
11a1 : 85 06 __ STA WORK + 3 
11a3 : 20 86 1b JSR $1b86 ; (divmod32 + 0)
11a6 : a5 07 __ LDA WORK + 4 
11a8 : c9 0a __ CMP #$0a
11aa : b0 04 __ BCS $11b0 ; (nforml.s34 + 0)
.s29:
11ac : a9 30 __ LDA #$30
11ae : 90 06 __ BCC $11b6 ; (nforml.s30 + 0)
.s34:
11b0 : a0 03 __ LDY #$03
11b2 : b1 0d __ LDA (P0),y ; (si + 0)
11b4 : e9 0a __ SBC #$0a
.s30:
11b6 : 18 __ __ CLC
11b7 : 65 07 __ ADC WORK + 4 
11b9 : a6 44 __ LDX T5 + 0 
11bb : 9d e1 cf STA $cfe1,x ; (si.prefix + 0)
11be : c6 44 __ DEC T5 + 0 
11c0 : a5 1b __ LDA ACCU + 0 
11c2 : 85 11 __ STA P4 ; (v + 0)
11c4 : a5 1c __ LDA ACCU + 1 
11c6 : 85 12 __ STA P5 ; (v + 1)
11c8 : a5 1d __ LDA ACCU + 2 
11ca : 85 13 __ STA P6 ; (v + 2)
11cc : a5 1e __ LDA ACCU + 3 
11ce : 85 14 __ STA P7 ; (v + 3)
11d0 : d0 b3 __ BNE $1185 ; (nforml.l28 + 0)
11d2 : 4c bd 10 JMP $10bd ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
11d5 : a2 03 __ LDX #$03
11d7 : b5 53 __ LDA T7 + 0,x 
11d9 : 9d e9 cf STA $cfe9,x ; (nformf@stack + 0)
11dc : ca __ __ DEX
11dd : 10 f8 __ BPL $11d7 ; (nformf.s1 + 2)
.s4:
11df : a5 16 __ LDA P9 ; (f + 1)
11e1 : 85 44 __ STA T0 + 1 
11e3 : a5 17 __ LDA P10 ; (f + 2)
11e5 : 85 45 __ STA T0 + 2 
11e7 : a5 18 __ LDA P11 ; (f + 3)
11e9 : 29 7f __ AND #$7f
11eb : 05 17 __ ORA P10 ; (f + 2)
11ed : 05 16 __ ORA P9 ; (f + 1)
11ef : 05 15 __ ORA P8 ; (f + 0)
11f1 : f0 21 __ BEQ $1214 ; (nformf.s5 + 0)
.s107:
11f3 : 24 18 __ BIT P11 ; (f + 3)
11f5 : 10 1d __ BPL $1214 ; (nformf.s5 + 0)
.s106:
11f7 : a9 2d __ LDA #$2d
11f9 : a0 00 __ LDY #$00
11fb : 91 13 __ STA (P6),y ; (str + 0)
11fd : a5 18 __ LDA P11 ; (f + 3)
11ff : 49 80 __ EOR #$80
1201 : 85 10 __ STA P3 
1203 : 85 18 __ STA P11 ; (f + 3)
1205 : a5 15 __ LDA P8 ; (f + 0)
1207 : 85 0d __ STA P0 
1209 : a5 16 __ LDA P9 ; (f + 1)
120b : 85 0e __ STA P1 
120d : a5 17 __ LDA P10 ; (f + 2)
120f : 85 0f __ STA P2 
1211 : 4c 28 17 JMP $1728 ; (nformf.s104 + 0)
.s5:
1214 : a5 15 __ LDA P8 ; (f + 0)
1216 : 85 0d __ STA P0 
1218 : a5 16 __ LDA P9 ; (f + 1)
121a : 85 0e __ STA P1 
121c : a5 17 __ LDA P10 ; (f + 2)
121e : 85 0f __ STA P2 
1220 : a5 18 __ LDA P11 ; (f + 3)
1222 : 85 10 __ STA P3 
1224 : a0 05 __ LDY #$05
1226 : b1 11 __ LDA (P4),y ; (si + 0)
1228 : f0 09 __ BEQ $1233 ; (nformf.s6 + 0)
.s103:
122a : a9 2b __ LDA #$2b
122c : a0 00 __ LDY #$00
122e : 91 13 __ STA (P6),y ; (str + 0)
1230 : 4c 28 17 JMP $1728 ; (nformf.s104 + 0)
.s6:
1233 : 20 39 17 JSR $1739 ; (isinf.s4 + 0)
1236 : a2 00 __ LDX #$00
1238 : 86 54 __ STX T9 + 0 
123a : a8 __ __ TAY
123b : f0 05 __ BEQ $1242 ; (nformf.s7 + 0)
.s101:
123d : a9 02 __ LDA #$02
123f : 4c f8 16 JMP $16f8 ; (nformf.s102 + 0)
.s7:
1242 : a5 11 __ LDA P4 ; (si + 0)
1244 : 85 4b __ STA T2 + 0 
1246 : a5 12 __ LDA P5 ; (si + 1)
1248 : 85 4c __ STA T2 + 1 
124a : a0 02 __ LDY #$02
124c : b1 11 __ LDA (P4),y ; (si + 0)
124e : c9 ff __ CMP #$ff
1250 : d0 02 __ BNE $1254 ; (nformf.s100 + 0)
.s8:
1252 : a9 06 __ LDA #$06
.s100:
1254 : 85 4d __ STA T3 + 0 
1256 : 85 52 __ STA T6 + 0 
1258 : a9 00 __ LDA #$00
125a : 85 4f __ STA T4 + 0 
125c : 85 50 __ STA T4 + 1 
125e : a5 18 __ LDA P11 ; (f + 3)
1260 : 85 46 __ STA T0 + 3 
1262 : 29 7f __ AND #$7f
1264 : 05 17 __ ORA P10 ; (f + 2)
1266 : 05 16 __ ORA P9 ; (f + 1)
1268 : a6 15 __ LDX P8 ; (f + 0)
126a : 86 43 __ STX T0 + 0 
126c : 05 15 __ ORA P8 ; (f + 0)
126e : d0 03 __ BNE $1273 ; (nformf.s67 + 0)
1270 : 4c a7 13 JMP $13a7 ; (nformf.s9 + 0)
.s67:
1273 : a5 18 __ LDA P11 ; (f + 3)
1275 : 10 03 __ BPL $127a ; (nformf.s95 + 0)
1277 : 4c f9 12 JMP $12f9 ; (nformf.l80 + 0)
.s95:
127a : c9 44 __ CMP #$44
127c : d0 0d __ BNE $128b ; (nformf.l99 + 0)
.s96:
127e : a5 17 __ LDA P10 ; (f + 2)
1280 : c9 7a __ CMP #$7a
1282 : d0 07 __ BNE $128b ; (nformf.l99 + 0)
.s97:
1284 : a5 16 __ LDA P9 ; (f + 1)
1286 : d0 03 __ BNE $128b ; (nformf.l99 + 0)
.s98:
1288 : 8a __ __ TXA
1289 : f0 02 __ BEQ $128d ; (nformf.l90 + 0)
.l99:
128b : 90 54 __ BCC $12e1 ; (nformf.s68 + 0)
.l90:
128d : 18 __ __ CLC
128e : a5 4f __ LDA T4 + 0 
1290 : 69 03 __ ADC #$03
1292 : 85 4f __ STA T4 + 0 
1294 : 90 02 __ BCC $1298 ; (nformf.s121 + 0)
.s120:
1296 : e6 50 __ INC T4 + 1 
.s121:
1298 : a5 43 __ LDA T0 + 0 
129a : 85 1b __ STA ACCU + 0 
129c : a5 44 __ LDA T0 + 1 
129e : 85 1c __ STA ACCU + 1 
12a0 : a5 45 __ LDA T0 + 2 
12a2 : 85 1d __ STA ACCU + 2 
12a4 : a5 46 __ LDA T0 + 3 
12a6 : 85 1e __ STA ACCU + 3 
12a8 : a9 00 __ LDA #$00
12aa : 85 03 __ STA WORK + 0 
12ac : 85 04 __ STA WORK + 1 
12ae : a9 7a __ LDA #$7a
12b0 : 85 05 __ STA WORK + 2 
12b2 : a9 44 __ LDA #$44
12b4 : 85 06 __ STA WORK + 3 
12b6 : 20 73 17 JSR $1773 ; (freg + 20)
12b9 : 20 59 19 JSR $1959 ; (crt_fdiv + 0)
12bc : a5 1b __ LDA ACCU + 0 
12be : 85 43 __ STA T0 + 0 
12c0 : a5 1c __ LDA ACCU + 1 
12c2 : 85 44 __ STA T0 + 1 
12c4 : a6 1d __ LDX ACCU + 2 
12c6 : 86 45 __ STX T0 + 2 
12c8 : a5 1e __ LDA ACCU + 3 
12ca : 85 46 __ STA T0 + 3 
12cc : 30 13 __ BMI $12e1 ; (nformf.s68 + 0)
.s91:
12ce : c9 44 __ CMP #$44
12d0 : d0 b9 __ BNE $128b ; (nformf.l99 + 0)
.s92:
12d2 : e0 7a __ CPX #$7a
12d4 : d0 b5 __ BNE $128b ; (nformf.l99 + 0)
.s93:
12d6 : a5 1c __ LDA ACCU + 1 
12d8 : 38 __ __ SEC
12d9 : d0 b0 __ BNE $128b ; (nformf.l99 + 0)
.s94:
12db : a5 1b __ LDA ACCU + 0 
12dd : f0 ae __ BEQ $128d ; (nformf.l90 + 0)
12df : d0 aa __ BNE $128b ; (nformf.l99 + 0)
.s68:
12e1 : a5 46 __ LDA T0 + 3 
12e3 : 30 14 __ BMI $12f9 ; (nformf.l80 + 0)
.s86:
12e5 : c9 3f __ CMP #$3f
12e7 : d0 0e __ BNE $12f7 ; (nformf.s85 + 0)
.s87:
12e9 : a5 45 __ LDA T0 + 2 
12eb : c9 80 __ CMP #$80
12ed : d0 08 __ BNE $12f7 ; (nformf.s85 + 0)
.s88:
12ef : a5 44 __ LDA T0 + 1 
12f1 : d0 04 __ BNE $12f7 ; (nformf.s85 + 0)
.s89:
12f3 : a5 43 __ LDA T0 + 0 
12f5 : f0 49 __ BEQ $1340 ; (nformf.s69 + 0)
.s85:
12f7 : b0 47 __ BCS $1340 ; (nformf.s69 + 0)
.l80:
12f9 : 38 __ __ SEC
12fa : a5 4f __ LDA T4 + 0 
12fc : e9 03 __ SBC #$03
12fe : 85 4f __ STA T4 + 0 
1300 : b0 02 __ BCS $1304 ; (nformf.s116 + 0)
.s115:
1302 : c6 50 __ DEC T4 + 1 
.s116:
1304 : a9 00 __ LDA #$00
1306 : 85 1b __ STA ACCU + 0 
1308 : 85 1c __ STA ACCU + 1 
130a : a9 7a __ LDA #$7a
130c : 85 1d __ STA ACCU + 2 
130e : a9 44 __ LDA #$44
1310 : 85 1e __ STA ACCU + 3 
1312 : a2 43 __ LDX #$43
1314 : 20 63 17 JSR $1763 ; (freg + 4)
1317 : 20 91 18 JSR $1891 ; (crt_fmul + 0)
131a : a5 1b __ LDA ACCU + 0 
131c : 85 43 __ STA T0 + 0 
131e : a5 1c __ LDA ACCU + 1 
1320 : 85 44 __ STA T0 + 1 
1322 : a6 1d __ LDX ACCU + 2 
1324 : 86 45 __ STX T0 + 2 
1326 : a5 1e __ LDA ACCU + 3 
1328 : 85 46 __ STA T0 + 3 
132a : 30 cd __ BMI $12f9 ; (nformf.l80 + 0)
.s81:
132c : c9 3f __ CMP #$3f
132e : 90 c9 __ BCC $12f9 ; (nformf.l80 + 0)
.s122:
1330 : d0 0e __ BNE $1340 ; (nformf.s69 + 0)
.s82:
1332 : e0 80 __ CPX #$80
1334 : 90 c3 __ BCC $12f9 ; (nformf.l80 + 0)
.s123:
1336 : d0 08 __ BNE $1340 ; (nformf.s69 + 0)
.s83:
1338 : a5 1c __ LDA ACCU + 1 
133a : d0 bb __ BNE $12f7 ; (nformf.s85 + 0)
.s84:
133c : a5 1b __ LDA ACCU + 0 
133e : d0 b7 __ BNE $12f7 ; (nformf.s85 + 0)
.s69:
1340 : a5 46 __ LDA T0 + 3 
1342 : 30 63 __ BMI $13a7 ; (nformf.s9 + 0)
.s75:
1344 : c9 41 __ CMP #$41
1346 : d0 0e __ BNE $1356 ; (nformf.l79 + 0)
.s76:
1348 : a5 45 __ LDA T0 + 2 
134a : c9 20 __ CMP #$20
134c : d0 08 __ BNE $1356 ; (nformf.l79 + 0)
.s77:
134e : a5 44 __ LDA T0 + 1 
1350 : d0 04 __ BNE $1356 ; (nformf.l79 + 0)
.s78:
1352 : a5 43 __ LDA T0 + 0 
1354 : f0 02 __ BEQ $1358 ; (nformf.l70 + 0)
.l79:
1356 : 90 4f __ BCC $13a7 ; (nformf.s9 + 0)
.l70:
1358 : e6 4f __ INC T4 + 0 
135a : d0 02 __ BNE $135e ; (nformf.s119 + 0)
.s118:
135c : e6 50 __ INC T4 + 1 
.s119:
135e : a5 43 __ LDA T0 + 0 
1360 : 85 1b __ STA ACCU + 0 
1362 : a5 44 __ LDA T0 + 1 
1364 : 85 1c __ STA ACCU + 1 
1366 : a5 45 __ LDA T0 + 2 
1368 : 85 1d __ STA ACCU + 2 
136a : a5 46 __ LDA T0 + 3 
136c : 85 1e __ STA ACCU + 3 
136e : a9 00 __ LDA #$00
1370 : 85 03 __ STA WORK + 0 
1372 : 85 04 __ STA WORK + 1 
1374 : a9 20 __ LDA #$20
1376 : 85 05 __ STA WORK + 2 
1378 : a9 41 __ LDA #$41
137a : 85 06 __ STA WORK + 3 
137c : 20 73 17 JSR $1773 ; (freg + 20)
137f : 20 59 19 JSR $1959 ; (crt_fdiv + 0)
1382 : a5 1b __ LDA ACCU + 0 
1384 : 85 43 __ STA T0 + 0 
1386 : a5 1c __ LDA ACCU + 1 
1388 : 85 44 __ STA T0 + 1 
138a : a6 1d __ LDX ACCU + 2 
138c : 86 45 __ STX T0 + 2 
138e : a5 1e __ LDA ACCU + 3 
1390 : 85 46 __ STA T0 + 3 
1392 : 30 13 __ BMI $13a7 ; (nformf.s9 + 0)
.s71:
1394 : c9 41 __ CMP #$41
1396 : d0 be __ BNE $1356 ; (nformf.l79 + 0)
.s72:
1398 : e0 20 __ CPX #$20
139a : d0 ba __ BNE $1356 ; (nformf.l79 + 0)
.s73:
139c : a5 1c __ LDA ACCU + 1 
139e : 38 __ __ SEC
139f : d0 b5 __ BNE $1356 ; (nformf.l79 + 0)
.s74:
13a1 : a5 1b __ LDA ACCU + 0 
13a3 : f0 b3 __ BEQ $1358 ; (nformf.l70 + 0)
13a5 : d0 af __ BNE $1356 ; (nformf.l79 + 0)
.s9:
13a7 : ad f2 cf LDA $cff2 ; (sstack + 0)
13aa : c9 65 __ CMP #$65
13ac : d0 04 __ BNE $13b2 ; (nformf.s11 + 0)
.s10:
13ae : a9 01 __ LDA #$01
13b0 : d0 02 __ BNE $13b4 ; (nformf.s12 + 0)
.s11:
13b2 : a9 00 __ LDA #$00
.s12:
13b4 : 85 55 __ STA T10 + 0 
13b6 : a6 4d __ LDX T3 + 0 
13b8 : e8 __ __ INX
13b9 : 86 51 __ STX T5 + 0 
13bb : ad f2 cf LDA $cff2 ; (sstack + 0)
13be : c9 67 __ CMP #$67
13c0 : d0 13 __ BNE $13d5 ; (nformf.s13 + 0)
.s63:
13c2 : a5 50 __ LDA T4 + 1 
13c4 : 30 08 __ BMI $13ce ; (nformf.s64 + 0)
.s66:
13c6 : d0 06 __ BNE $13ce ; (nformf.s64 + 0)
.s65:
13c8 : a5 4f __ LDA T4 + 0 
13ca : c9 04 __ CMP #$04
13cc : 90 07 __ BCC $13d5 ; (nformf.s13 + 0)
.s64:
13ce : a9 01 __ LDA #$01
13d0 : 85 55 __ STA T10 + 0 
13d2 : 4c 5e 16 JMP $165e ; (nformf.s53 + 0)
.s13:
13d5 : a5 55 __ LDA T10 + 0 
13d7 : d0 f9 __ BNE $13d2 ; (nformf.s64 + 4)
.s14:
13d9 : 24 50 __ BIT T4 + 1 
13db : 10 43 __ BPL $1420 ; (nformf.s15 + 0)
.s52:
13dd : a5 43 __ LDA T0 + 0 
13df : 85 1b __ STA ACCU + 0 
13e1 : a5 44 __ LDA T0 + 1 
13e3 : 85 1c __ STA ACCU + 1 
13e5 : a5 45 __ LDA T0 + 2 
13e7 : 85 1d __ STA ACCU + 2 
13e9 : a5 46 __ LDA T0 + 3 
13eb : 85 1e __ STA ACCU + 3 
.l108:
13ed : a9 00 __ LDA #$00
13ef : 85 03 __ STA WORK + 0 
13f1 : 85 04 __ STA WORK + 1 
13f3 : a9 20 __ LDA #$20
13f5 : 85 05 __ STA WORK + 2 
13f7 : a9 41 __ LDA #$41
13f9 : 85 06 __ STA WORK + 3 
13fb : 20 73 17 JSR $1773 ; (freg + 20)
13fe : 20 59 19 JSR $1959 ; (crt_fdiv + 0)
1401 : 18 __ __ CLC
1402 : a5 4f __ LDA T4 + 0 
1404 : 69 01 __ ADC #$01
1406 : 85 4f __ STA T4 + 0 
1408 : a5 50 __ LDA T4 + 1 
140a : 69 00 __ ADC #$00
140c : 85 50 __ STA T4 + 1 
140e : 30 dd __ BMI $13ed ; (nformf.l108 + 0)
.s109:
1410 : a5 1e __ LDA ACCU + 3 
1412 : 85 46 __ STA T0 + 3 
1414 : a5 1d __ LDA ACCU + 2 
1416 : 85 45 __ STA T0 + 2 
1418 : a5 1c __ LDA ACCU + 1 
141a : 85 44 __ STA T0 + 1 
141c : a5 1b __ LDA ACCU + 0 
141e : 85 43 __ STA T0 + 0 
.s15:
1420 : 18 __ __ CLC
1421 : a5 4d __ LDA T3 + 0 
1423 : 65 4f __ ADC T4 + 0 
1425 : 18 __ __ CLC
1426 : 69 01 __ ADC #$01
1428 : 85 51 __ STA T5 + 0 
142a : c9 07 __ CMP #$07
142c : 90 14 __ BCC $1442 ; (nformf.s51 + 0)
.s16:
142e : ad 45 1d LDA $1d45 ; (fround5[0] + 24)
1431 : 85 47 __ STA T1 + 0 
1433 : ad 46 1d LDA $1d46 ; (fround5[0] + 25)
1436 : 85 48 __ STA T1 + 1 
1438 : ad 47 1d LDA $1d47 ; (fround5[0] + 26)
143b : 85 49 __ STA T1 + 2 
143d : ad 48 1d LDA $1d48 ; (fround5[0] + 27)
1440 : b0 15 __ BCS $1457 ; (nformf.s17 + 0)
.s51:
1442 : 0a __ __ ASL
1443 : 0a __ __ ASL
1444 : aa __ __ TAX
1445 : bd 29 1d LDA $1d29,x ; (crt_malloc + 204)
1448 : 85 47 __ STA T1 + 0 
144a : bd 2a 1d LDA $1d2a,x ; (crt_malloc + 205)
144d : 85 48 __ STA T1 + 1 
144f : bd 2b 1d LDA $1d2b,x ; (spentry + 0)
1452 : 85 49 __ STA T1 + 2 
1454 : bd 2c 1d LDA $1d2c,x ; (giocharmap + 0)
.s17:
1457 : 85 4a __ STA T1 + 3 
1459 : a5 43 __ LDA T0 + 0 
145b : 85 1b __ STA ACCU + 0 
145d : a5 44 __ LDA T0 + 1 
145f : 85 1c __ STA ACCU + 1 
1461 : a5 45 __ LDA T0 + 2 
1463 : 85 1d __ STA ACCU + 2 
1465 : a5 46 __ LDA T0 + 3 
1467 : 85 1e __ STA ACCU + 3 
1469 : a2 47 __ LDX #$47
146b : 20 63 17 JSR $1763 ; (freg + 4)
146e : 20 aa 17 JSR $17aa ; (faddsub + 6)
1471 : a5 1c __ LDA ACCU + 1 
1473 : 85 16 __ STA P9 ; (f + 1)
1475 : a5 1d __ LDA ACCU + 2 
1477 : 85 17 __ STA P10 ; (f + 2)
1479 : a6 1b __ LDX ACCU + 0 
147b : a5 1e __ LDA ACCU + 3 
147d : 85 18 __ STA P11 ; (f + 3)
147f : 30 3a __ BMI $14bb ; (nformf.s18 + 0)
.s46:
1481 : c9 41 __ CMP #$41
1483 : d0 0d __ BNE $1492 ; (nformf.s50 + 0)
.s47:
1485 : a5 17 __ LDA P10 ; (f + 2)
1487 : c9 20 __ CMP #$20
1489 : d0 07 __ BNE $1492 ; (nformf.s50 + 0)
.s48:
148b : a5 16 __ LDA P9 ; (f + 1)
148d : d0 03 __ BNE $1492 ; (nformf.s50 + 0)
.s49:
148f : 8a __ __ TXA
1490 : f0 02 __ BEQ $1494 ; (nformf.s45 + 0)
.s50:
1492 : 90 27 __ BCC $14bb ; (nformf.s18 + 0)
.s45:
1494 : a9 00 __ LDA #$00
1496 : 85 03 __ STA WORK + 0 
1498 : 85 04 __ STA WORK + 1 
149a : a9 20 __ LDA #$20
149c : 85 05 __ STA WORK + 2 
149e : a9 41 __ LDA #$41
14a0 : 85 06 __ STA WORK + 3 
14a2 : 20 73 17 JSR $1773 ; (freg + 20)
14a5 : 20 59 19 JSR $1959 ; (crt_fdiv + 0)
14a8 : a5 1c __ LDA ACCU + 1 
14aa : 85 16 __ STA P9 ; (f + 1)
14ac : a5 1d __ LDA ACCU + 2 
14ae : 85 17 __ STA P10 ; (f + 2)
14b0 : a5 1e __ LDA ACCU + 3 
14b2 : 85 18 __ STA P11 ; (f + 3)
14b4 : a6 4d __ LDX T3 + 0 
14b6 : ca __ __ DEX
14b7 : 86 52 __ STX T6 + 0 
14b9 : a6 1b __ LDX ACCU + 0 
.s18:
14bb : 38 __ __ SEC
14bc : a5 51 __ LDA T5 + 0 
14be : e5 52 __ SBC T6 + 0 
14c0 : 85 4d __ STA T3 + 0 
14c2 : a9 00 __ LDA #$00
14c4 : e9 00 __ SBC #$00
14c6 : 85 4e __ STA T3 + 1 
14c8 : a9 14 __ LDA #$14
14ca : c5 51 __ CMP T5 + 0 
14cc : b0 02 __ BCS $14d0 ; (nformf.s19 + 0)
.s44:
14ce : 85 51 __ STA T5 + 0 
.s19:
14d0 : a5 4d __ LDA T3 + 0 
14d2 : d0 08 __ BNE $14dc ; (nformf.s21 + 0)
.s20:
14d4 : a9 30 __ LDA #$30
14d6 : a4 54 __ LDY T9 + 0 
14d8 : 91 13 __ STA (P6),y ; (str + 0)
14da : e6 54 __ INC T9 + 0 
.s21:
14dc : a9 00 __ LDA #$00
14de : 85 56 __ STA T11 + 0 
14e0 : c5 4d __ CMP T3 + 0 
14e2 : f0 6f __ BEQ $1553 ; (nformf.l43 + 0)
.s23:
14e4 : c9 07 __ CMP #$07
14e6 : 90 04 __ BCC $14ec ; (nformf.s24 + 0)
.l42:
14e8 : a9 30 __ LDA #$30
14ea : b0 55 __ BCS $1541 ; (nformf.l25 + 0)
.s24:
14ec : 86 1b __ STX ACCU + 0 
14ee : 86 43 __ STX T0 + 0 
14f0 : a5 16 __ LDA P9 ; (f + 1)
14f2 : 85 1c __ STA ACCU + 1 
14f4 : 85 44 __ STA T0 + 1 
14f6 : a5 17 __ LDA P10 ; (f + 2)
14f8 : 85 1d __ STA ACCU + 2 
14fa : 85 45 __ STA T0 + 2 
14fc : a5 18 __ LDA P11 ; (f + 3)
14fe : 85 1e __ STA ACCU + 3 
1500 : 85 46 __ STA T0 + 3 
1502 : 20 f3 1a JSR $1af3 ; (f32_to_i16 + 0)
1505 : a5 1b __ LDA ACCU + 0 
1507 : 85 53 __ STA T7 + 0 
1509 : 20 3f 1b JSR $1b3f ; (sint16_to_float + 0)
150c : a2 43 __ LDX #$43
150e : 20 63 17 JSR $1763 ; (freg + 4)
1511 : a5 1e __ LDA ACCU + 3 
1513 : 49 80 __ EOR #$80
1515 : 85 1e __ STA ACCU + 3 
1517 : 20 aa 17 JSR $17aa ; (faddsub + 6)
151a : a9 00 __ LDA #$00
151c : 85 03 __ STA WORK + 0 
151e : 85 04 __ STA WORK + 1 
1520 : a9 20 __ LDA #$20
1522 : 85 05 __ STA WORK + 2 
1524 : a9 41 __ LDA #$41
1526 : 85 06 __ STA WORK + 3 
1528 : 20 73 17 JSR $1773 ; (freg + 20)
152b : 20 91 18 JSR $1891 ; (crt_fmul + 0)
152e : a5 1c __ LDA ACCU + 1 
1530 : 85 16 __ STA P9 ; (f + 1)
1532 : a5 1d __ LDA ACCU + 2 
1534 : 85 17 __ STA P10 ; (f + 2)
1536 : a5 1e __ LDA ACCU + 3 
1538 : 85 18 __ STA P11 ; (f + 3)
153a : 18 __ __ CLC
153b : a5 53 __ LDA T7 + 0 
153d : 69 30 __ ADC #$30
153f : a6 1b __ LDX ACCU + 0 
.l25:
1541 : a4 54 __ LDY T9 + 0 
1543 : 91 13 __ STA (P6),y ; (str + 0)
1545 : e6 54 __ INC T9 + 0 
1547 : e6 56 __ INC T11 + 0 
1549 : a5 56 __ LDA T11 + 0 
154b : c5 51 __ CMP T5 + 0 
154d : b0 14 __ BCS $1563 ; (nformf.s26 + 0)
.s22:
154f : c5 4d __ CMP T3 + 0 
1551 : d0 91 __ BNE $14e4 ; (nformf.s23 + 0)
.l43:
1553 : a9 2e __ LDA #$2e
1555 : a4 54 __ LDY T9 + 0 
1557 : 91 13 __ STA (P6),y ; (str + 0)
1559 : e6 54 __ INC T9 + 0 
155b : a5 56 __ LDA T11 + 0 
155d : c9 07 __ CMP #$07
155f : 90 8b __ BCC $14ec ; (nformf.s24 + 0)
1561 : b0 85 __ BCS $14e8 ; (nformf.l42 + 0)
.s26:
1563 : a5 55 __ LDA T10 + 0 
1565 : f0 66 __ BEQ $15cd ; (nformf.s27 + 0)
.s38:
1567 : a0 03 __ LDY #$03
1569 : b1 4b __ LDA (T2 + 0),y 
156b : 69 03 __ ADC #$03
156d : a4 54 __ LDY T9 + 0 
156f : 91 13 __ STA (P6),y ; (str + 0)
1571 : c8 __ __ INY
1572 : 84 54 __ STY T9 + 0 
1574 : 24 50 __ BIT T4 + 1 
1576 : 30 06 __ BMI $157e ; (nformf.s41 + 0)
.s39:
1578 : a9 2b __ LDA #$2b
157a : 91 13 __ STA (P6),y ; (str + 0)
157c : d0 11 __ BNE $158f ; (nformf.s40 + 0)
.s41:
157e : a9 2d __ LDA #$2d
1580 : 91 13 __ STA (P6),y ; (str + 0)
1582 : 38 __ __ SEC
1583 : a9 00 __ LDA #$00
1585 : e5 4f __ SBC T4 + 0 
1587 : 85 4f __ STA T4 + 0 
1589 : a9 00 __ LDA #$00
158b : e5 50 __ SBC T4 + 1 
158d : 85 50 __ STA T4 + 1 
.s40:
158f : e6 54 __ INC T9 + 0 
1591 : a5 4f __ LDA T4 + 0 
1593 : 85 1b __ STA ACCU + 0 
1595 : a5 50 __ LDA T4 + 1 
1597 : 85 1c __ STA ACCU + 1 
1599 : a9 0a __ LDA #$0a
159b : 85 03 __ STA WORK + 0 
159d : a9 00 __ LDA #$00
159f : 85 04 __ STA WORK + 1 
15a1 : 20 07 1a JSR $1a07 ; (divs16 + 0)
15a4 : 18 __ __ CLC
15a5 : a5 1b __ LDA ACCU + 0 
15a7 : 69 30 __ ADC #$30
15a9 : a4 54 __ LDY T9 + 0 
15ab : 91 13 __ STA (P6),y ; (str + 0)
15ad : e6 54 __ INC T9 + 0 
15af : a5 4f __ LDA T4 + 0 
15b1 : 85 1b __ STA ACCU + 0 
15b3 : a5 50 __ LDA T4 + 1 
15b5 : 85 1c __ STA ACCU + 1 
15b7 : a9 0a __ LDA #$0a
15b9 : 85 03 __ STA WORK + 0 
15bb : a9 00 __ LDA #$00
15bd : 85 04 __ STA WORK + 1 
15bf : 20 c6 1a JSR $1ac6 ; (mods16 + 0)
15c2 : 18 __ __ CLC
15c3 : a5 05 __ LDA WORK + 2 
15c5 : 69 30 __ ADC #$30
15c7 : a4 54 __ LDY T9 + 0 
15c9 : 91 13 __ STA (P6),y ; (str + 0)
15cb : e6 54 __ INC T9 + 0 
.s27:
15cd : a5 54 __ LDA T9 + 0 
15cf : a0 01 __ LDY #$01
15d1 : d1 11 __ CMP (P4),y ; (si + 0)
15d3 : b0 6d __ BCS $1642 ; (nformf.s3 + 0)
.s28:
15d5 : a0 06 __ LDY #$06
15d7 : b1 11 __ LDA (P4),y ; (si + 0)
15d9 : f0 04 __ BEQ $15df ; (nformf.s29 + 0)
.s110:
15db : a6 54 __ LDX T9 + 0 
15dd : 90 70 __ BCC $164f ; (nformf.l36 + 0)
.s29:
15df : a5 54 __ LDA T9 + 0 
15e1 : f0 40 __ BEQ $1623 ; (nformf.s30 + 0)
.s35:
15e3 : e9 00 __ SBC #$00
15e5 : a8 __ __ TAY
15e6 : a9 00 __ LDA #$00
15e8 : e9 00 __ SBC #$00
15ea : aa __ __ TAX
15eb : 98 __ __ TYA
15ec : 18 __ __ CLC
15ed : 65 13 __ ADC P6 ; (str + 0)
15ef : 85 47 __ STA T1 + 0 
15f1 : 8a __ __ TXA
15f2 : 65 14 __ ADC P7 ; (str + 1)
15f4 : 85 48 __ STA T1 + 1 
15f6 : a9 01 __ LDA #$01
15f8 : 85 4d __ STA T3 + 0 
15fa : a6 54 __ LDX T9 + 0 
15fc : 38 __ __ SEC
.l111:
15fd : a0 01 __ LDY #$01
15ff : b1 11 __ LDA (P4),y ; (si + 0)
1601 : e5 4d __ SBC T3 + 0 
1603 : 85 4b __ STA T2 + 0 
1605 : a9 00 __ LDA #$00
1607 : e5 4e __ SBC T3 + 1 
1609 : 18 __ __ CLC
160a : 65 14 __ ADC P7 ; (str + 1)
160c : 85 4c __ STA T2 + 1 
160e : 88 __ __ DEY
160f : b1 47 __ LDA (T1 + 0),y 
1611 : a4 13 __ LDY P6 ; (str + 0)
1613 : 91 4b __ STA (T2 + 0),y 
1615 : a5 47 __ LDA T1 + 0 
1617 : d0 02 __ BNE $161b ; (nformf.s114 + 0)
.s113:
1619 : c6 48 __ DEC T1 + 1 
.s114:
161b : c6 47 __ DEC T1 + 0 
161d : e6 4d __ INC T3 + 0 
161f : e4 4d __ CPX T3 + 0 
1621 : b0 da __ BCS $15fd ; (nformf.l111 + 0)
.s30:
1623 : a9 00 __ LDA #$00
1625 : 85 4d __ STA T3 + 0 
1627 : 90 08 __ BCC $1631 ; (nformf.l31 + 0)
.s33:
1629 : a9 20 __ LDA #$20
162b : a4 4d __ LDY T3 + 0 
162d : 91 13 __ STA (P6),y ; (str + 0)
162f : e6 4d __ INC T3 + 0 
.l31:
1631 : a0 01 __ LDY #$01
1633 : b1 11 __ LDA (P4),y ; (si + 0)
1635 : 38 __ __ SEC
1636 : e5 54 __ SBC T9 + 0 
1638 : 90 ef __ BCC $1629 ; (nformf.s33 + 0)
.s34:
163a : c5 4d __ CMP T3 + 0 
163c : 90 02 __ BCC $1640 ; (nformf.s32 + 0)
.s112:
163e : d0 e9 __ BNE $1629 ; (nformf.s33 + 0)
.s32:
1640 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1642 : 85 1b __ STA ACCU + 0 
1644 : a2 03 __ LDX #$03
1646 : bd e9 cf LDA $cfe9,x ; (nformf@stack + 0)
1649 : 95 53 __ STA T7 + 0,x 
164b : ca __ __ DEX
164c : 10 f8 __ BPL $1646 ; (nformf.s3 + 4)
164e : 60 __ __ RTS
.l36:
164f : 8a __ __ TXA
1650 : a0 01 __ LDY #$01
1652 : d1 11 __ CMP (P4),y ; (si + 0)
1654 : b0 ea __ BCS $1640 ; (nformf.s32 + 0)
.s37:
1656 : a8 __ __ TAY
1657 : a9 20 __ LDA #$20
1659 : 91 13 __ STA (P6),y ; (str + 0)
165b : e8 __ __ INX
165c : 90 f1 __ BCC $164f ; (nformf.l36 + 0)
.s53:
165e : a5 51 __ LDA T5 + 0 
1660 : c9 07 __ CMP #$07
1662 : 90 14 __ BCC $1678 ; (nformf.s62 + 0)
.s54:
1664 : ad 45 1d LDA $1d45 ; (fround5[0] + 24)
1667 : 85 47 __ STA T1 + 0 
1669 : ad 46 1d LDA $1d46 ; (fround5[0] + 25)
166c : 85 48 __ STA T1 + 1 
166e : ad 47 1d LDA $1d47 ; (fround5[0] + 26)
1671 : 85 49 __ STA T1 + 2 
1673 : ad 48 1d LDA $1d48 ; (fround5[0] + 27)
1676 : b0 15 __ BCS $168d ; (nformf.s55 + 0)
.s62:
1678 : 0a __ __ ASL
1679 : 0a __ __ ASL
167a : aa __ __ TAX
167b : bd 29 1d LDA $1d29,x ; (crt_malloc + 204)
167e : 85 47 __ STA T1 + 0 
1680 : bd 2a 1d LDA $1d2a,x ; (crt_malloc + 205)
1683 : 85 48 __ STA T1 + 1 
1685 : bd 2b 1d LDA $1d2b,x ; (spentry + 0)
1688 : 85 49 __ STA T1 + 2 
168a : bd 2c 1d LDA $1d2c,x ; (giocharmap + 0)
.s55:
168d : 85 4a __ STA T1 + 3 
168f : a5 43 __ LDA T0 + 0 
1691 : 85 1b __ STA ACCU + 0 
1693 : a5 44 __ LDA T0 + 1 
1695 : 85 1c __ STA ACCU + 1 
1697 : a5 45 __ LDA T0 + 2 
1699 : 85 1d __ STA ACCU + 2 
169b : a5 46 __ LDA T0 + 3 
169d : 85 1e __ STA ACCU + 3 
169f : a2 47 __ LDX #$47
16a1 : 20 63 17 JSR $1763 ; (freg + 4)
16a4 : 20 aa 17 JSR $17aa ; (faddsub + 6)
16a7 : a5 1c __ LDA ACCU + 1 
16a9 : 85 16 __ STA P9 ; (f + 1)
16ab : a5 1d __ LDA ACCU + 2 
16ad : 85 17 __ STA P10 ; (f + 2)
16af : a6 1b __ LDX ACCU + 0 
16b1 : a5 1e __ LDA ACCU + 3 
16b3 : 85 18 __ STA P11 ; (f + 3)
16b5 : 10 03 __ BPL $16ba ; (nformf.s57 + 0)
16b7 : 4c bb 14 JMP $14bb ; (nformf.s18 + 0)
.s57:
16ba : c9 41 __ CMP #$41
16bc : d0 0d __ BNE $16cb ; (nformf.s61 + 0)
.s58:
16be : a5 17 __ LDA P10 ; (f + 2)
16c0 : c9 20 __ CMP #$20
16c2 : d0 07 __ BNE $16cb ; (nformf.s61 + 0)
.s59:
16c4 : a5 16 __ LDA P9 ; (f + 1)
16c6 : d0 03 __ BNE $16cb ; (nformf.s61 + 0)
.s60:
16c8 : 8a __ __ TXA
16c9 : f0 02 __ BEQ $16cd ; (nformf.s56 + 0)
.s61:
16cb : 90 ea __ BCC $16b7 ; (nformf.s55 + 42)
.s56:
16cd : a9 00 __ LDA #$00
16cf : 85 03 __ STA WORK + 0 
16d1 : 85 04 __ STA WORK + 1 
16d3 : a9 20 __ LDA #$20
16d5 : 85 05 __ STA WORK + 2 
16d7 : a9 41 __ LDA #$41
16d9 : 85 06 __ STA WORK + 3 
16db : 20 73 17 JSR $1773 ; (freg + 20)
16de : 20 59 19 JSR $1959 ; (crt_fdiv + 0)
16e1 : a5 1c __ LDA ACCU + 1 
16e3 : 85 16 __ STA P9 ; (f + 1)
16e5 : a5 1d __ LDA ACCU + 2 
16e7 : 85 17 __ STA P10 ; (f + 2)
16e9 : a5 1e __ LDA ACCU + 3 
16eb : 85 18 __ STA P11 ; (f + 3)
16ed : a6 1b __ LDX ACCU + 0 
16ef : e6 4f __ INC T4 + 0 
16f1 : d0 c4 __ BNE $16b7 ; (nformf.s55 + 42)
.s117:
16f3 : e6 50 __ INC T4 + 1 
16f5 : 4c bb 14 JMP $14bb ; (nformf.s18 + 0)
.s102:
16f8 : 86 43 __ STX T0 + 0 
16fa : 85 47 __ STA T1 + 0 
16fc : a0 03 __ LDY #$03
16fe : b1 11 __ LDA (P4),y ; (si + 0)
1700 : 18 __ __ CLC
1701 : 69 08 __ ADC #$08
1703 : a4 43 __ LDY T0 + 0 
1705 : 91 13 __ STA (P6),y ; (str + 0)
1707 : 18 __ __ CLC
1708 : a0 03 __ LDY #$03
170a : b1 11 __ LDA (P4),y ; (si + 0)
170c : 69 0d __ ADC #$0d
170e : a4 43 __ LDY T0 + 0 
1710 : c8 __ __ INY
1711 : 91 13 __ STA (P6),y ; (str + 0)
1713 : a0 03 __ LDY #$03
1715 : b1 11 __ LDA (P4),y ; (si + 0)
1717 : 18 __ __ CLC
1718 : 69 05 __ ADC #$05
171a : a4 47 __ LDY T1 + 0 
171c : 91 13 __ STA (P6),y ; (str + 0)
171e : 18 __ __ CLC
171f : a5 54 __ LDA T9 + 0 
1721 : 69 03 __ ADC #$03
1723 : 85 54 __ STA T9 + 0 
1725 : 4c cd 15 JMP $15cd ; (nformf.s27 + 0)
.s104:
1728 : 20 39 17 JSR $1739 ; (isinf.s4 + 0)
172b : a2 01 __ LDX #$01
172d : 86 54 __ STX T9 + 0 
172f : a8 __ __ TAY
1730 : d0 03 __ BNE $1735 ; (nformf.s105 + 0)
1732 : 4c 42 12 JMP $1242 ; (nformf.s7 + 0)
.s105:
1735 : a9 03 __ LDA #$03
1737 : d0 bf __ BNE $16f8 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1739 : 06 0f __ ASL P2 ; (f + 2)
173b : a5 10 __ LDA P3 ; (f + 3)
173d : 2a __ __ ROL
173e : c9 ff __ CMP #$ff
1740 : d0 03 __ BNE $1745 ; (isinf.s6 + 0)
.s5:
1742 : a9 01 __ LDA #$01
1744 : 60 __ __ RTS
.s6:
1745 : a9 00 __ LDA #$00
.s3:
1747 : 60 __ __ RTS
--------------------------------------------------------------------
1748 : __ __ __ BYT 41 4c 4c 4f 43 41 54 45 44 20 25 35 75 20 41 54 : ALLOCATED %5u AT
1758 : __ __ __ BYT 20 25 30 34 78 0a 00                            :  %04x..
--------------------------------------------------------------------
freg: ; freg
175f : b1 19 __ LDA (IP + 0),y 
1761 : c8 __ __ INY
1762 : aa __ __ TAX
1763 : b5 00 __ LDA $00,x 
1765 : 85 03 __ STA WORK + 0 
1767 : b5 01 __ LDA $01,x 
1769 : 85 04 __ STA WORK + 1 
176b : b5 02 __ LDA $02,x 
176d : 85 05 __ STA WORK + 2 
176f : b5 03 __ LDA WORK + 0,x 
1771 : 85 06 __ STA WORK + 3 
1773 : a5 05 __ LDA WORK + 2 
1775 : 0a __ __ ASL
1776 : a5 06 __ LDA WORK + 3 
1778 : 2a __ __ ROL
1779 : 85 08 __ STA WORK + 5 
177b : f0 06 __ BEQ $1783 ; (freg + 36)
177d : a5 05 __ LDA WORK + 2 
177f : 09 80 __ ORA #$80
1781 : 85 05 __ STA WORK + 2 
1783 : a5 1d __ LDA ACCU + 2 
1785 : 0a __ __ ASL
1786 : a5 1e __ LDA ACCU + 3 
1788 : 2a __ __ ROL
1789 : 85 07 __ STA WORK + 4 
178b : f0 06 __ BEQ $1793 ; (freg + 52)
178d : a5 1d __ LDA ACCU + 2 
178f : 09 80 __ ORA #$80
1791 : 85 1d __ STA ACCU + 2 
1793 : 60 __ __ RTS
1794 : 06 1e __ ASL ACCU + 3 
1796 : a5 07 __ LDA WORK + 4 
1798 : 6a __ __ ROR
1799 : 85 1e __ STA ACCU + 3 
179b : b0 06 __ BCS $17a3 ; (freg + 68)
179d : a5 1d __ LDA ACCU + 2 
179f : 29 7f __ AND #$7f
17a1 : 85 1d __ STA ACCU + 2 
17a3 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
17a4 : a5 06 __ LDA WORK + 3 
17a6 : 49 80 __ EOR #$80
17a8 : 85 06 __ STA WORK + 3 
17aa : a9 ff __ LDA #$ff
17ac : c5 07 __ CMP WORK + 4 
17ae : f0 04 __ BEQ $17b4 ; (faddsub + 16)
17b0 : c5 08 __ CMP WORK + 5 
17b2 : d0 11 __ BNE $17c5 ; (faddsub + 33)
17b4 : a5 1e __ LDA ACCU + 3 
17b6 : 09 7f __ ORA #$7f
17b8 : 85 1e __ STA ACCU + 3 
17ba : a9 80 __ LDA #$80
17bc : 85 1d __ STA ACCU + 2 
17be : a9 00 __ LDA #$00
17c0 : 85 1b __ STA ACCU + 0 
17c2 : 85 1c __ STA ACCU + 1 
17c4 : 60 __ __ RTS
17c5 : 38 __ __ SEC
17c6 : a5 07 __ LDA WORK + 4 
17c8 : e5 08 __ SBC WORK + 5 
17ca : f0 38 __ BEQ $1804 ; (faddsub + 96)
17cc : aa __ __ TAX
17cd : b0 25 __ BCS $17f4 ; (faddsub + 80)
17cf : e0 e9 __ CPX #$e9
17d1 : b0 0e __ BCS $17e1 ; (faddsub + 61)
17d3 : a5 08 __ LDA WORK + 5 
17d5 : 85 07 __ STA WORK + 4 
17d7 : a9 00 __ LDA #$00
17d9 : 85 1b __ STA ACCU + 0 
17db : 85 1c __ STA ACCU + 1 
17dd : 85 1d __ STA ACCU + 2 
17df : f0 23 __ BEQ $1804 ; (faddsub + 96)
17e1 : a5 1d __ LDA ACCU + 2 
17e3 : 4a __ __ LSR
17e4 : 66 1c __ ROR ACCU + 1 
17e6 : 66 1b __ ROR ACCU + 0 
17e8 : e8 __ __ INX
17e9 : d0 f8 __ BNE $17e3 ; (faddsub + 63)
17eb : 85 1d __ STA ACCU + 2 
17ed : a5 08 __ LDA WORK + 5 
17ef : 85 07 __ STA WORK + 4 
17f1 : 4c 04 18 JMP $1804 ; (faddsub + 96)
17f4 : e0 18 __ CPX #$18
17f6 : b0 33 __ BCS $182b ; (faddsub + 135)
17f8 : a5 05 __ LDA WORK + 2 
17fa : 4a __ __ LSR
17fb : 66 04 __ ROR WORK + 1 
17fd : 66 03 __ ROR WORK + 0 
17ff : ca __ __ DEX
1800 : d0 f8 __ BNE $17fa ; (faddsub + 86)
1802 : 85 05 __ STA WORK + 2 
1804 : a5 1e __ LDA ACCU + 3 
1806 : 29 80 __ AND #$80
1808 : 85 1e __ STA ACCU + 3 
180a : 45 06 __ EOR WORK + 3 
180c : 30 31 __ BMI $183f ; (faddsub + 155)
180e : 18 __ __ CLC
180f : a5 1b __ LDA ACCU + 0 
1811 : 65 03 __ ADC WORK + 0 
1813 : 85 1b __ STA ACCU + 0 
1815 : a5 1c __ LDA ACCU + 1 
1817 : 65 04 __ ADC WORK + 1 
1819 : 85 1c __ STA ACCU + 1 
181b : a5 1d __ LDA ACCU + 2 
181d : 65 05 __ ADC WORK + 2 
181f : 85 1d __ STA ACCU + 2 
1821 : 90 08 __ BCC $182b ; (faddsub + 135)
1823 : 66 1d __ ROR ACCU + 2 
1825 : 66 1c __ ROR ACCU + 1 
1827 : 66 1b __ ROR ACCU + 0 
1829 : e6 07 __ INC WORK + 4 
182b : a5 07 __ LDA WORK + 4 
182d : c9 ff __ CMP #$ff
182f : f0 83 __ BEQ $17b4 ; (faddsub + 16)
1831 : 4a __ __ LSR
1832 : 05 1e __ ORA ACCU + 3 
1834 : 85 1e __ STA ACCU + 3 
1836 : b0 06 __ BCS $183e ; (faddsub + 154)
1838 : a5 1d __ LDA ACCU + 2 
183a : 29 7f __ AND #$7f
183c : 85 1d __ STA ACCU + 2 
183e : 60 __ __ RTS
183f : 38 __ __ SEC
1840 : a5 1b __ LDA ACCU + 0 
1842 : e5 03 __ SBC WORK + 0 
1844 : 85 1b __ STA ACCU + 0 
1846 : a5 1c __ LDA ACCU + 1 
1848 : e5 04 __ SBC WORK + 1 
184a : 85 1c __ STA ACCU + 1 
184c : a5 1d __ LDA ACCU + 2 
184e : e5 05 __ SBC WORK + 2 
1850 : 85 1d __ STA ACCU + 2 
1852 : b0 19 __ BCS $186d ; (faddsub + 201)
1854 : 38 __ __ SEC
1855 : a9 00 __ LDA #$00
1857 : e5 1b __ SBC ACCU + 0 
1859 : 85 1b __ STA ACCU + 0 
185b : a9 00 __ LDA #$00
185d : e5 1c __ SBC ACCU + 1 
185f : 85 1c __ STA ACCU + 1 
1861 : a9 00 __ LDA #$00
1863 : e5 1d __ SBC ACCU + 2 
1865 : 85 1d __ STA ACCU + 2 
1867 : a5 1e __ LDA ACCU + 3 
1869 : 49 80 __ EOR #$80
186b : 85 1e __ STA ACCU + 3 
186d : a5 1d __ LDA ACCU + 2 
186f : 30 ba __ BMI $182b ; (faddsub + 135)
1871 : 05 1c __ ORA ACCU + 1 
1873 : 05 1b __ ORA ACCU + 0 
1875 : f0 0f __ BEQ $1886 ; (faddsub + 226)
1877 : c6 07 __ DEC WORK + 4 
1879 : f0 0b __ BEQ $1886 ; (faddsub + 226)
187b : 06 1b __ ASL ACCU + 0 
187d : 26 1c __ ROL ACCU + 1 
187f : 26 1d __ ROL ACCU + 2 
1881 : 10 f4 __ BPL $1877 ; (faddsub + 211)
1883 : 4c 2b 18 JMP $182b ; (faddsub + 135)
1886 : a9 00 __ LDA #$00
1888 : 85 1b __ STA ACCU + 0 
188a : 85 1c __ STA ACCU + 1 
188c : 85 1d __ STA ACCU + 2 
188e : 85 1e __ STA ACCU + 3 
1890 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1891 : a5 1b __ LDA ACCU + 0 
1893 : 05 1c __ ORA ACCU + 1 
1895 : 05 1d __ ORA ACCU + 2 
1897 : f0 0e __ BEQ $18a7 ; (crt_fmul + 22)
1899 : a5 03 __ LDA WORK + 0 
189b : 05 04 __ ORA WORK + 1 
189d : 05 05 __ ORA WORK + 2 
189f : d0 09 __ BNE $18aa ; (crt_fmul + 25)
18a1 : 85 1b __ STA ACCU + 0 
18a3 : 85 1c __ STA ACCU + 1 
18a5 : 85 1d __ STA ACCU + 2 
18a7 : 85 1e __ STA ACCU + 3 
18a9 : 60 __ __ RTS
18aa : a5 1e __ LDA ACCU + 3 
18ac : 45 06 __ EOR WORK + 3 
18ae : 29 80 __ AND #$80
18b0 : 85 1e __ STA ACCU + 3 
18b2 : a9 ff __ LDA #$ff
18b4 : c5 07 __ CMP WORK + 4 
18b6 : f0 42 __ BEQ $18fa ; (crt_fmul + 105)
18b8 : c5 08 __ CMP WORK + 5 
18ba : f0 3e __ BEQ $18fa ; (crt_fmul + 105)
18bc : a9 00 __ LDA #$00
18be : 85 09 __ STA WORK + 6 
18c0 : 85 0a __ STA WORK + 7 
18c2 : 85 0b __ STA WORK + 8 
18c4 : a4 1b __ LDY ACCU + 0 
18c6 : a5 03 __ LDA WORK + 0 
18c8 : d0 06 __ BNE $18d0 ; (crt_fmul + 63)
18ca : a5 04 __ LDA WORK + 1 
18cc : f0 0a __ BEQ $18d8 ; (crt_fmul + 71)
18ce : d0 05 __ BNE $18d5 ; (crt_fmul + 68)
18d0 : 20 2b 19 JSR $192b ; (crt_fmul8 + 0)
18d3 : a5 04 __ LDA WORK + 1 
18d5 : 20 2b 19 JSR $192b ; (crt_fmul8 + 0)
18d8 : a5 05 __ LDA WORK + 2 
18da : 20 2b 19 JSR $192b ; (crt_fmul8 + 0)
18dd : 38 __ __ SEC
18de : a5 0b __ LDA WORK + 8 
18e0 : 30 06 __ BMI $18e8 ; (crt_fmul + 87)
18e2 : 06 09 __ ASL WORK + 6 
18e4 : 26 0a __ ROL WORK + 7 
18e6 : 2a __ __ ROL
18e7 : 18 __ __ CLC
18e8 : 29 7f __ AND #$7f
18ea : 85 0b __ STA WORK + 8 
18ec : a5 07 __ LDA WORK + 4 
18ee : 65 08 __ ADC WORK + 5 
18f0 : 90 19 __ BCC $190b ; (crt_fmul + 122)
18f2 : e9 7f __ SBC #$7f
18f4 : b0 04 __ BCS $18fa ; (crt_fmul + 105)
18f6 : c9 ff __ CMP #$ff
18f8 : d0 15 __ BNE $190f ; (crt_fmul + 126)
18fa : a5 1e __ LDA ACCU + 3 
18fc : 09 7f __ ORA #$7f
18fe : 85 1e __ STA ACCU + 3 
1900 : a9 80 __ LDA #$80
1902 : 85 1d __ STA ACCU + 2 
1904 : a9 00 __ LDA #$00
1906 : 85 1b __ STA ACCU + 0 
1908 : 85 1c __ STA ACCU + 1 
190a : 60 __ __ RTS
190b : e9 7e __ SBC #$7e
190d : 90 15 __ BCC $1924 ; (crt_fmul + 147)
190f : 4a __ __ LSR
1910 : 05 1e __ ORA ACCU + 3 
1912 : 85 1e __ STA ACCU + 3 
1914 : a9 00 __ LDA #$00
1916 : 6a __ __ ROR
1917 : 05 0b __ ORA WORK + 8 
1919 : 85 1d __ STA ACCU + 2 
191b : a5 0a __ LDA WORK + 7 
191d : 85 1c __ STA ACCU + 1 
191f : a5 09 __ LDA WORK + 6 
1921 : 85 1b __ STA ACCU + 0 
1923 : 60 __ __ RTS
1924 : a9 00 __ LDA #$00
1926 : 85 1e __ STA ACCU + 3 
1928 : f0 d8 __ BEQ $1902 ; (crt_fmul + 113)
192a : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
192b : 38 __ __ SEC
192c : 6a __ __ ROR
192d : 90 1e __ BCC $194d ; (crt_fmul8 + 34)
192f : aa __ __ TAX
1930 : 18 __ __ CLC
1931 : 98 __ __ TYA
1932 : 65 09 __ ADC WORK + 6 
1934 : 85 09 __ STA WORK + 6 
1936 : a5 0a __ LDA WORK + 7 
1938 : 65 1c __ ADC ACCU + 1 
193a : 85 0a __ STA WORK + 7 
193c : a5 0b __ LDA WORK + 8 
193e : 65 1d __ ADC ACCU + 2 
1940 : 6a __ __ ROR
1941 : 85 0b __ STA WORK + 8 
1943 : 8a __ __ TXA
1944 : 66 0a __ ROR WORK + 7 
1946 : 66 09 __ ROR WORK + 6 
1948 : 4a __ __ LSR
1949 : f0 0d __ BEQ $1958 ; (crt_fmul8 + 45)
194b : b0 e2 __ BCS $192f ; (crt_fmul8 + 4)
194d : 66 0b __ ROR WORK + 8 
194f : 66 0a __ ROR WORK + 7 
1951 : 66 09 __ ROR WORK + 6 
1953 : 4a __ __ LSR
1954 : 90 f7 __ BCC $194d ; (crt_fmul8 + 34)
1956 : d0 d7 __ BNE $192f ; (crt_fmul8 + 4)
1958 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1959 : a5 1b __ LDA ACCU + 0 
195b : 05 1c __ ORA ACCU + 1 
195d : 05 1d __ ORA ACCU + 2 
195f : d0 03 __ BNE $1964 ; (crt_fdiv + 11)
1961 : 85 1e __ STA ACCU + 3 
1963 : 60 __ __ RTS
1964 : a5 1e __ LDA ACCU + 3 
1966 : 45 06 __ EOR WORK + 3 
1968 : 29 80 __ AND #$80
196a : 85 1e __ STA ACCU + 3 
196c : a5 08 __ LDA WORK + 5 
196e : f0 62 __ BEQ $19d2 ; (crt_fdiv + 121)
1970 : a5 07 __ LDA WORK + 4 
1972 : c9 ff __ CMP #$ff
1974 : f0 5c __ BEQ $19d2 ; (crt_fdiv + 121)
1976 : a9 00 __ LDA #$00
1978 : 85 09 __ STA WORK + 6 
197a : 85 0a __ STA WORK + 7 
197c : 85 0b __ STA WORK + 8 
197e : a2 18 __ LDX #$18
1980 : a5 1b __ LDA ACCU + 0 
1982 : c5 03 __ CMP WORK + 0 
1984 : a5 1c __ LDA ACCU + 1 
1986 : e5 04 __ SBC WORK + 1 
1988 : a5 1d __ LDA ACCU + 2 
198a : e5 05 __ SBC WORK + 2 
198c : 90 13 __ BCC $19a1 ; (crt_fdiv + 72)
198e : a5 1b __ LDA ACCU + 0 
1990 : e5 03 __ SBC WORK + 0 
1992 : 85 1b __ STA ACCU + 0 
1994 : a5 1c __ LDA ACCU + 1 
1996 : e5 04 __ SBC WORK + 1 
1998 : 85 1c __ STA ACCU + 1 
199a : a5 1d __ LDA ACCU + 2 
199c : e5 05 __ SBC WORK + 2 
199e : 85 1d __ STA ACCU + 2 
19a0 : 38 __ __ SEC
19a1 : 26 09 __ ROL WORK + 6 
19a3 : 26 0a __ ROL WORK + 7 
19a5 : 26 0b __ ROL WORK + 8 
19a7 : ca __ __ DEX
19a8 : f0 0a __ BEQ $19b4 ; (crt_fdiv + 91)
19aa : 06 1b __ ASL ACCU + 0 
19ac : 26 1c __ ROL ACCU + 1 
19ae : 26 1d __ ROL ACCU + 2 
19b0 : b0 dc __ BCS $198e ; (crt_fdiv + 53)
19b2 : 90 cc __ BCC $1980 ; (crt_fdiv + 39)
19b4 : 38 __ __ SEC
19b5 : a5 0b __ LDA WORK + 8 
19b7 : 30 06 __ BMI $19bf ; (crt_fdiv + 102)
19b9 : 06 09 __ ASL WORK + 6 
19bb : 26 0a __ ROL WORK + 7 
19bd : 2a __ __ ROL
19be : 18 __ __ CLC
19bf : 29 7f __ AND #$7f
19c1 : 85 0b __ STA WORK + 8 
19c3 : a5 07 __ LDA WORK + 4 
19c5 : e5 08 __ SBC WORK + 5 
19c7 : 90 1a __ BCC $19e3 ; (crt_fdiv + 138)
19c9 : 18 __ __ CLC
19ca : 69 7f __ ADC #$7f
19cc : b0 04 __ BCS $19d2 ; (crt_fdiv + 121)
19ce : c9 ff __ CMP #$ff
19d0 : d0 15 __ BNE $19e7 ; (crt_fdiv + 142)
19d2 : a5 1e __ LDA ACCU + 3 
19d4 : 09 7f __ ORA #$7f
19d6 : 85 1e __ STA ACCU + 3 
19d8 : a9 80 __ LDA #$80
19da : 85 1d __ STA ACCU + 2 
19dc : a9 00 __ LDA #$00
19de : 85 1c __ STA ACCU + 1 
19e0 : 85 1b __ STA ACCU + 0 
19e2 : 60 __ __ RTS
19e3 : 69 7f __ ADC #$7f
19e5 : 90 15 __ BCC $19fc ; (crt_fdiv + 163)
19e7 : 4a __ __ LSR
19e8 : 05 1e __ ORA ACCU + 3 
19ea : 85 1e __ STA ACCU + 3 
19ec : a9 00 __ LDA #$00
19ee : 6a __ __ ROR
19ef : 05 0b __ ORA WORK + 8 
19f1 : 85 1d __ STA ACCU + 2 
19f3 : a5 0a __ LDA WORK + 7 
19f5 : 85 1c __ STA ACCU + 1 
19f7 : a5 09 __ LDA WORK + 6 
19f9 : 85 1b __ STA ACCU + 0 
19fb : 60 __ __ RTS
19fc : a9 00 __ LDA #$00
19fe : 85 1e __ STA ACCU + 3 
1a00 : 85 1d __ STA ACCU + 2 
1a02 : 85 1c __ STA ACCU + 1 
1a04 : 85 1b __ STA ACCU + 0 
1a06 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1a07 : 24 1c __ BIT ACCU + 1 
1a09 : 10 0d __ BPL $1a18 ; (divs16 + 17)
1a0b : 20 25 1a JSR $1a25 ; (negaccu + 0)
1a0e : 24 04 __ BIT WORK + 1 
1a10 : 10 0d __ BPL $1a1f ; (divs16 + 24)
1a12 : 20 33 1a JSR $1a33 ; (negtmp + 0)
1a15 : 4c 41 1a JMP $1a41 ; (divmod + 0)
1a18 : 24 04 __ BIT WORK + 1 
1a1a : 10 f9 __ BPL $1a15 ; (divs16 + 14)
1a1c : 20 33 1a JSR $1a33 ; (negtmp + 0)
1a1f : 20 41 1a JSR $1a41 ; (divmod + 0)
1a22 : 4c 25 1a JMP $1a25 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1a25 : 38 __ __ SEC
1a26 : a9 00 __ LDA #$00
1a28 : e5 1b __ SBC ACCU + 0 
1a2a : 85 1b __ STA ACCU + 0 
1a2c : a9 00 __ LDA #$00
1a2e : e5 1c __ SBC ACCU + 1 
1a30 : 85 1c __ STA ACCU + 1 
1a32 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1a33 : 38 __ __ SEC
1a34 : a9 00 __ LDA #$00
1a36 : e5 03 __ SBC WORK + 0 
1a38 : 85 03 __ STA WORK + 0 
1a3a : a9 00 __ LDA #$00
1a3c : e5 04 __ SBC WORK + 1 
1a3e : 85 04 __ STA WORK + 1 
1a40 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1a41 : a5 1c __ LDA ACCU + 1 
1a43 : d0 31 __ BNE $1a76 ; (divmod + 53)
1a45 : a5 04 __ LDA WORK + 1 
1a47 : d0 1e __ BNE $1a67 ; (divmod + 38)
1a49 : 85 06 __ STA WORK + 3 
1a4b : a2 04 __ LDX #$04
1a4d : 06 1b __ ASL ACCU + 0 
1a4f : 2a __ __ ROL
1a50 : c5 03 __ CMP WORK + 0 
1a52 : 90 02 __ BCC $1a56 ; (divmod + 21)
1a54 : e5 03 __ SBC WORK + 0 
1a56 : 26 1b __ ROL ACCU + 0 
1a58 : 2a __ __ ROL
1a59 : c5 03 __ CMP WORK + 0 
1a5b : 90 02 __ BCC $1a5f ; (divmod + 30)
1a5d : e5 03 __ SBC WORK + 0 
1a5f : 26 1b __ ROL ACCU + 0 
1a61 : ca __ __ DEX
1a62 : d0 eb __ BNE $1a4f ; (divmod + 14)
1a64 : 85 05 __ STA WORK + 2 
1a66 : 60 __ __ RTS
1a67 : a5 1b __ LDA ACCU + 0 
1a69 : 85 05 __ STA WORK + 2 
1a6b : a5 1c __ LDA ACCU + 1 
1a6d : 85 06 __ STA WORK + 3 
1a6f : a9 00 __ LDA #$00
1a71 : 85 1b __ STA ACCU + 0 
1a73 : 85 1c __ STA ACCU + 1 
1a75 : 60 __ __ RTS
1a76 : a5 04 __ LDA WORK + 1 
1a78 : d0 1f __ BNE $1a99 ; (divmod + 88)
1a7a : a5 03 __ LDA WORK + 0 
1a7c : 30 1b __ BMI $1a99 ; (divmod + 88)
1a7e : a9 00 __ LDA #$00
1a80 : 85 06 __ STA WORK + 3 
1a82 : a2 10 __ LDX #$10
1a84 : 06 1b __ ASL ACCU + 0 
1a86 : 26 1c __ ROL ACCU + 1 
1a88 : 2a __ __ ROL
1a89 : c5 03 __ CMP WORK + 0 
1a8b : 90 02 __ BCC $1a8f ; (divmod + 78)
1a8d : e5 03 __ SBC WORK + 0 
1a8f : 26 1b __ ROL ACCU + 0 
1a91 : 26 1c __ ROL ACCU + 1 
1a93 : ca __ __ DEX
1a94 : d0 f2 __ BNE $1a88 ; (divmod + 71)
1a96 : 85 05 __ STA WORK + 2 
1a98 : 60 __ __ RTS
1a99 : a9 00 __ LDA #$00
1a9b : 85 05 __ STA WORK + 2 
1a9d : 85 06 __ STA WORK + 3 
1a9f : 84 02 __ STY $02 
1aa1 : a0 10 __ LDY #$10
1aa3 : 18 __ __ CLC
1aa4 : 26 1b __ ROL ACCU + 0 
1aa6 : 26 1c __ ROL ACCU + 1 
1aa8 : 26 05 __ ROL WORK + 2 
1aaa : 26 06 __ ROL WORK + 3 
1aac : 38 __ __ SEC
1aad : a5 05 __ LDA WORK + 2 
1aaf : e5 03 __ SBC WORK + 0 
1ab1 : aa __ __ TAX
1ab2 : a5 06 __ LDA WORK + 3 
1ab4 : e5 04 __ SBC WORK + 1 
1ab6 : 90 04 __ BCC $1abc ; (divmod + 123)
1ab8 : 86 05 __ STX WORK + 2 
1aba : 85 06 __ STA WORK + 3 
1abc : 88 __ __ DEY
1abd : d0 e5 __ BNE $1aa4 ; (divmod + 99)
1abf : 26 1b __ ROL ACCU + 0 
1ac1 : 26 1c __ ROL ACCU + 1 
1ac3 : a4 02 __ LDY $02 
1ac5 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1ac6 : 24 1c __ BIT ACCU + 1 
1ac8 : 10 10 __ BPL $1ada ; (mods16 + 20)
1aca : 20 25 1a JSR $1a25 ; (negaccu + 0)
1acd : 24 04 __ BIT WORK + 1 
1acf : 10 03 __ BPL $1ad4 ; (mods16 + 14)
1ad1 : 20 33 1a JSR $1a33 ; (negtmp + 0)
1ad4 : 20 41 1a JSR $1a41 ; (divmod + 0)
1ad7 : 4c e5 1a JMP $1ae5 ; (negtmpb + 0)
1ada : 24 04 __ BIT WORK + 1 
1adc : 10 03 __ BPL $1ae1 ; (mods16 + 27)
1ade : 20 33 1a JSR $1a33 ; (negtmp + 0)
1ae1 : 4c 41 1a JMP $1a41 ; (divmod + 0)
1ae4 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1ae5 : 38 __ __ SEC
1ae6 : a9 00 __ LDA #$00
1ae8 : e5 05 __ SBC WORK + 2 
1aea : 85 05 __ STA WORK + 2 
1aec : a9 00 __ LDA #$00
1aee : e5 06 __ SBC WORK + 3 
1af0 : 85 06 __ STA WORK + 3 
1af2 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1af3 : 20 83 17 JSR $1783 ; (freg + 36)
1af6 : a5 07 __ LDA WORK + 4 
1af8 : c9 7f __ CMP #$7f
1afa : b0 07 __ BCS $1b03 ; (f32_to_i16 + 16)
1afc : a9 00 __ LDA #$00
1afe : 85 1b __ STA ACCU + 0 
1b00 : 85 1c __ STA ACCU + 1 
1b02 : 60 __ __ RTS
1b03 : e9 8e __ SBC #$8e
1b05 : 90 16 __ BCC $1b1d ; (f32_to_i16 + 42)
1b07 : 24 1e __ BIT ACCU + 3 
1b09 : 30 09 __ BMI $1b14 ; (f32_to_i16 + 33)
1b0b : a9 ff __ LDA #$ff
1b0d : 85 1b __ STA ACCU + 0 
1b0f : a9 7f __ LDA #$7f
1b11 : 85 1c __ STA ACCU + 1 
1b13 : 60 __ __ RTS
1b14 : a9 00 __ LDA #$00
1b16 : 85 1b __ STA ACCU + 0 
1b18 : a9 80 __ LDA #$80
1b1a : 85 1c __ STA ACCU + 1 
1b1c : 60 __ __ RTS
1b1d : aa __ __ TAX
1b1e : a5 1c __ LDA ACCU + 1 
1b20 : 46 1d __ LSR ACCU + 2 
1b22 : 6a __ __ ROR
1b23 : e8 __ __ INX
1b24 : d0 fa __ BNE $1b20 ; (f32_to_i16 + 45)
1b26 : 24 1e __ BIT ACCU + 3 
1b28 : 10 0e __ BPL $1b38 ; (f32_to_i16 + 69)
1b2a : 38 __ __ SEC
1b2b : 49 ff __ EOR #$ff
1b2d : 69 00 __ ADC #$00
1b2f : 85 1b __ STA ACCU + 0 
1b31 : a9 00 __ LDA #$00
1b33 : e5 1d __ SBC ACCU + 2 
1b35 : 85 1c __ STA ACCU + 1 
1b37 : 60 __ __ RTS
1b38 : 85 1b __ STA ACCU + 0 
1b3a : a5 1d __ LDA ACCU + 2 
1b3c : 85 1c __ STA ACCU + 1 
1b3e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1b3f : 24 1c __ BIT ACCU + 1 
1b41 : 30 03 __ BMI $1b46 ; (sint16_to_float + 7)
1b43 : 4c 5d 1b JMP $1b5d ; (uint16_to_float + 0)
1b46 : 38 __ __ SEC
1b47 : a9 00 __ LDA #$00
1b49 : e5 1b __ SBC ACCU + 0 
1b4b : 85 1b __ STA ACCU + 0 
1b4d : a9 00 __ LDA #$00
1b4f : e5 1c __ SBC ACCU + 1 
1b51 : 85 1c __ STA ACCU + 1 
1b53 : 20 5d 1b JSR $1b5d ; (uint16_to_float + 0)
1b56 : a5 1e __ LDA ACCU + 3 
1b58 : 09 80 __ ORA #$80
1b5a : 85 1e __ STA ACCU + 3 
1b5c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1b5d : a5 1b __ LDA ACCU + 0 
1b5f : 05 1c __ ORA ACCU + 1 
1b61 : d0 05 __ BNE $1b68 ; (uint16_to_float + 11)
1b63 : 85 1d __ STA ACCU + 2 
1b65 : 85 1e __ STA ACCU + 3 
1b67 : 60 __ __ RTS
1b68 : a2 8e __ LDX #$8e
1b6a : a5 1c __ LDA ACCU + 1 
1b6c : 30 06 __ BMI $1b74 ; (uint16_to_float + 23)
1b6e : ca __ __ DEX
1b6f : 06 1b __ ASL ACCU + 0 
1b71 : 2a __ __ ROL
1b72 : 10 fa __ BPL $1b6e ; (uint16_to_float + 17)
1b74 : 0a __ __ ASL
1b75 : 85 1d __ STA ACCU + 2 
1b77 : a5 1b __ LDA ACCU + 0 
1b79 : 85 1c __ STA ACCU + 1 
1b7b : 8a __ __ TXA
1b7c : 4a __ __ LSR
1b7d : 85 1e __ STA ACCU + 3 
1b7f : a9 00 __ LDA #$00
1b81 : 85 1b __ STA ACCU + 0 
1b83 : 66 1d __ ROR ACCU + 2 
1b85 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1b86 : 84 02 __ STY $02 
1b88 : a0 20 __ LDY #$20
1b8a : a9 00 __ LDA #$00
1b8c : 85 07 __ STA WORK + 4 
1b8e : 85 08 __ STA WORK + 5 
1b90 : 85 09 __ STA WORK + 6 
1b92 : 85 0a __ STA WORK + 7 
1b94 : a5 05 __ LDA WORK + 2 
1b96 : 05 06 __ ORA WORK + 3 
1b98 : d0 78 __ BNE $1c12 ; (divmod32 + 140)
1b9a : a5 04 __ LDA WORK + 1 
1b9c : d0 27 __ BNE $1bc5 ; (divmod32 + 63)
1b9e : 18 __ __ CLC
1b9f : 26 1b __ ROL ACCU + 0 
1ba1 : 26 1c __ ROL ACCU + 1 
1ba3 : 26 1d __ ROL ACCU + 2 
1ba5 : 26 1e __ ROL ACCU + 3 
1ba7 : 2a __ __ ROL
1ba8 : 90 05 __ BCC $1baf ; (divmod32 + 41)
1baa : e5 03 __ SBC WORK + 0 
1bac : 38 __ __ SEC
1bad : b0 06 __ BCS $1bb5 ; (divmod32 + 47)
1baf : c5 03 __ CMP WORK + 0 
1bb1 : 90 02 __ BCC $1bb5 ; (divmod32 + 47)
1bb3 : e5 03 __ SBC WORK + 0 
1bb5 : 88 __ __ DEY
1bb6 : d0 e7 __ BNE $1b9f ; (divmod32 + 25)
1bb8 : 85 07 __ STA WORK + 4 
1bba : 26 1b __ ROL ACCU + 0 
1bbc : 26 1c __ ROL ACCU + 1 
1bbe : 26 1d __ ROL ACCU + 2 
1bc0 : 26 1e __ ROL ACCU + 3 
1bc2 : a4 02 __ LDY $02 
1bc4 : 60 __ __ RTS
1bc5 : a5 1e __ LDA ACCU + 3 
1bc7 : d0 10 __ BNE $1bd9 ; (divmod32 + 83)
1bc9 : a6 1d __ LDX ACCU + 2 
1bcb : 86 1e __ STX ACCU + 3 
1bcd : a6 1c __ LDX ACCU + 1 
1bcf : 86 1d __ STX ACCU + 2 
1bd1 : a6 1b __ LDX ACCU + 0 
1bd3 : 86 1c __ STX ACCU + 1 
1bd5 : 85 1b __ STA ACCU + 0 
1bd7 : a0 18 __ LDY #$18
1bd9 : 18 __ __ CLC
1bda : 26 1b __ ROL ACCU + 0 
1bdc : 26 1c __ ROL ACCU + 1 
1bde : 26 1d __ ROL ACCU + 2 
1be0 : 26 1e __ ROL ACCU + 3 
1be2 : 26 07 __ ROL WORK + 4 
1be4 : 26 08 __ ROL WORK + 5 
1be6 : 90 0c __ BCC $1bf4 ; (divmod32 + 110)
1be8 : a5 07 __ LDA WORK + 4 
1bea : e5 03 __ SBC WORK + 0 
1bec : aa __ __ TAX
1bed : a5 08 __ LDA WORK + 5 
1bef : e5 04 __ SBC WORK + 1 
1bf1 : 38 __ __ SEC
1bf2 : b0 0c __ BCS $1c00 ; (divmod32 + 122)
1bf4 : 38 __ __ SEC
1bf5 : a5 07 __ LDA WORK + 4 
1bf7 : e5 03 __ SBC WORK + 0 
1bf9 : aa __ __ TAX
1bfa : a5 08 __ LDA WORK + 5 
1bfc : e5 04 __ SBC WORK + 1 
1bfe : 90 04 __ BCC $1c04 ; (divmod32 + 126)
1c00 : 86 07 __ STX WORK + 4 
1c02 : 85 08 __ STA WORK + 5 
1c04 : 88 __ __ DEY
1c05 : d0 d3 __ BNE $1bda ; (divmod32 + 84)
1c07 : 26 1b __ ROL ACCU + 0 
1c09 : 26 1c __ ROL ACCU + 1 
1c0b : 26 1d __ ROL ACCU + 2 
1c0d : 26 1e __ ROL ACCU + 3 
1c0f : a4 02 __ LDY $02 
1c11 : 60 __ __ RTS
1c12 : a0 10 __ LDY #$10
1c14 : a5 1e __ LDA ACCU + 3 
1c16 : 85 08 __ STA WORK + 5 
1c18 : a5 1d __ LDA ACCU + 2 
1c1a : 85 07 __ STA WORK + 4 
1c1c : a9 00 __ LDA #$00
1c1e : 85 1d __ STA ACCU + 2 
1c20 : 85 1e __ STA ACCU + 3 
1c22 : 18 __ __ CLC
1c23 : 26 1b __ ROL ACCU + 0 
1c25 : 26 1c __ ROL ACCU + 1 
1c27 : 26 07 __ ROL WORK + 4 
1c29 : 26 08 __ ROL WORK + 5 
1c2b : 26 09 __ ROL WORK + 6 
1c2d : 26 0a __ ROL WORK + 7 
1c2f : a5 07 __ LDA WORK + 4 
1c31 : c5 03 __ CMP WORK + 0 
1c33 : a5 08 __ LDA WORK + 5 
1c35 : e5 04 __ SBC WORK + 1 
1c37 : a5 09 __ LDA WORK + 6 
1c39 : e5 05 __ SBC WORK + 2 
1c3b : aa __ __ TAX
1c3c : a5 0a __ LDA WORK + 7 
1c3e : e5 06 __ SBC WORK + 3 
1c40 : 90 11 __ BCC $1c53 ; (divmod32 + 205)
1c42 : 86 09 __ STX WORK + 6 
1c44 : 85 0a __ STA WORK + 7 
1c46 : a5 07 __ LDA WORK + 4 
1c48 : e5 03 __ SBC WORK + 0 
1c4a : 85 07 __ STA WORK + 4 
1c4c : a5 08 __ LDA WORK + 5 
1c4e : e5 04 __ SBC WORK + 1 
1c50 : 85 08 __ STA WORK + 5 
1c52 : 38 __ __ SEC
1c53 : 88 __ __ DEY
1c54 : d0 cd __ BNE $1c23 ; (divmod32 + 157)
1c56 : 26 1b __ ROL ACCU + 0 
1c58 : 26 1c __ ROL ACCU + 1 
1c5a : a4 02 __ LDY $02 
1c5c : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
1c5d : 18 __ __ CLC
1c5e : a5 1b __ LDA ACCU + 0 
1c60 : 69 05 __ ADC #$05
1c62 : 29 fc __ AND #$fc
1c64 : 85 03 __ STA WORK + 0 
1c66 : a5 1c __ LDA ACCU + 1 
1c68 : 69 00 __ ADC #$00
1c6a : 85 04 __ STA WORK + 1 
1c6c : ad 4b 1d LDA $1d4b ; (HeapNode.end + 0)
1c6f : d0 26 __ BNE $1c97 ; (crt_malloc + 58)
1c71 : a9 00 __ LDA #$00
1c73 : 8d 52 1d STA $1d52 
1c76 : 8d 53 1d STA $1d53 
1c79 : ee 4b 1d INC $1d4b ; (HeapNode.end + 0)
1c7c : a9 50 __ LDA #$50
1c7e : 09 02 __ ORA #$02
1c80 : 8d 49 1d STA $1d49 ; (HeapNode.next + 0)
1c83 : a9 1d __ LDA #$1d
1c85 : 8d 4a 1d STA $1d4a ; (HeapNode.next + 1)
1c88 : 38 __ __ SEC
1c89 : a9 00 __ LDA #$00
1c8b : e9 02 __ SBC #$02
1c8d : 8d 54 1d STA $1d54 
1c90 : a9 c0 __ LDA #$c0
1c92 : e9 00 __ SBC #$00
1c94 : 8d 55 1d STA $1d55 
1c97 : a9 49 __ LDA #$49
1c99 : a2 1d __ LDX #$1d
1c9b : 85 1d __ STA ACCU + 2 
1c9d : 86 1e __ STX ACCU + 3 
1c9f : 18 __ __ CLC
1ca0 : a0 00 __ LDY #$00
1ca2 : b1 1d __ LDA (ACCU + 2),y 
1ca4 : 85 1b __ STA ACCU + 0 
1ca6 : 65 03 __ ADC WORK + 0 
1ca8 : 85 05 __ STA WORK + 2 
1caa : c8 __ __ INY
1cab : b1 1d __ LDA (ACCU + 2),y 
1cad : 85 1c __ STA ACCU + 1 
1caf : f0 20 __ BEQ $1cd1 ; (crt_malloc + 116)
1cb1 : 65 04 __ ADC WORK + 1 
1cb3 : 85 06 __ STA WORK + 3 
1cb5 : b0 14 __ BCS $1ccb ; (crt_malloc + 110)
1cb7 : a0 02 __ LDY #$02
1cb9 : b1 1b __ LDA (ACCU + 0),y 
1cbb : c5 05 __ CMP WORK + 2 
1cbd : c8 __ __ INY
1cbe : b1 1b __ LDA (ACCU + 0),y 
1cc0 : e5 06 __ SBC WORK + 3 
1cc2 : b0 0e __ BCS $1cd2 ; (crt_malloc + 117)
1cc4 : a5 1b __ LDA ACCU + 0 
1cc6 : a6 1c __ LDX ACCU + 1 
1cc8 : 4c 9b 1c JMP $1c9b ; (crt_malloc + 62)
1ccb : a9 00 __ LDA #$00
1ccd : 85 1b __ STA ACCU + 0 
1ccf : 85 1c __ STA ACCU + 1 
1cd1 : 60 __ __ RTS
1cd2 : a5 05 __ LDA WORK + 2 
1cd4 : 85 07 __ STA WORK + 4 
1cd6 : a5 06 __ LDA WORK + 3 
1cd8 : 85 08 __ STA WORK + 5 
1cda : a0 02 __ LDY #$02
1cdc : a5 07 __ LDA WORK + 4 
1cde : d1 1b __ CMP (ACCU + 0),y 
1ce0 : d0 15 __ BNE $1cf7 ; (crt_malloc + 154)
1ce2 : c8 __ __ INY
1ce3 : a5 08 __ LDA WORK + 5 
1ce5 : d1 1b __ CMP (ACCU + 0),y 
1ce7 : d0 0e __ BNE $1cf7 ; (crt_malloc + 154)
1ce9 : a0 00 __ LDY #$00
1ceb : b1 1b __ LDA (ACCU + 0),y 
1ced : 91 1d __ STA (ACCU + 2),y 
1cef : c8 __ __ INY
1cf0 : b1 1b __ LDA (ACCU + 0),y 
1cf2 : 91 1d __ STA (ACCU + 2),y 
1cf4 : 4c 14 1d JMP $1d14 ; (crt_malloc + 183)
1cf7 : a0 00 __ LDY #$00
1cf9 : b1 1b __ LDA (ACCU + 0),y 
1cfb : 91 07 __ STA (WORK + 4),y 
1cfd : a5 07 __ LDA WORK + 4 
1cff : 91 1d __ STA (ACCU + 2),y 
1d01 : c8 __ __ INY
1d02 : b1 1b __ LDA (ACCU + 0),y 
1d04 : 91 07 __ STA (WORK + 4),y 
1d06 : a5 08 __ LDA WORK + 5 
1d08 : 91 1d __ STA (ACCU + 2),y 
1d0a : c8 __ __ INY
1d0b : b1 1b __ LDA (ACCU + 0),y 
1d0d : 91 07 __ STA (WORK + 4),y 
1d0f : c8 __ __ INY
1d10 : b1 1b __ LDA (ACCU + 0),y 
1d12 : 91 07 __ STA (WORK + 4),y 
1d14 : a0 00 __ LDY #$00
1d16 : a5 05 __ LDA WORK + 2 
1d18 : 91 1b __ STA (ACCU + 0),y 
1d1a : c8 __ __ INY
1d1b : a5 06 __ LDA WORK + 3 
1d1d : 91 1b __ STA (ACCU + 0),y 
1d1f : 18 __ __ CLC
1d20 : a5 1b __ LDA ACCU + 0 
1d22 : 69 02 __ ADC #$02
1d24 : 85 1b __ STA ACCU + 0 
1d26 : 90 02 __ BCC $1d2a ; (crt_malloc + 205)
1d28 : e6 1c __ INC ACCU + 1 
1d2a : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1d2b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1d2c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1d2d : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1d3d : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
HeapNode:
1d49 : __ __ __ BSS	4
