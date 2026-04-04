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
080e : 8e f6 17 STX $17f6 ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 00 __ LDY #$00
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2b __ CPX #$2b
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
083b : a9 fa __ LDA #$fa
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
;  37, "/home/honza/projects/c64/projects/oscar64/samples/sprites/multiplexer.c"
.s1:
0a00 : a5 53 __ LDA T7 + 0 
0a02 : 8d fc 9f STA $9ffc ; (main@stack + 0)
0a05 : a5 54 __ LDA T7 + 1 
0a07 : 8d fd 9f STA $9ffd ; (main@stack + 1)
.s4:
0a0a : a9 00 __ LDA #$00
0a0c : 85 4b __ STA T1 + 0 
0a0e : a9 00 __ LDA #$00
0a10 : 85 4c __ STA T2 + 0 
0a12 : a9 28 __ LDA #$28
0a14 : 85 4d __ STA T2 + 1 
.l5:
0a16 : a5 4b __ LDA T1 + 0 
0a18 : 85 1b __ STA ACCU + 0 
0a1a : a9 00 __ LDA #$00
0a1c : 85 1c __ STA ACCU + 1 
0a1e : 20 af 17 JSR $17af ; (sint16_to_float + 0)
0a21 : a9 db __ LDA #$db
0a23 : 85 03 __ STA WORK + 0 
0a25 : a9 40 __ LDA #$40
0a27 : 85 06 __ STA WORK + 3 
0a29 : a9 0f __ LDA #$0f
0a2b : 85 04 __ STA WORK + 1 
0a2d : a9 49 __ LDA #$49
0a2f : 85 05 __ STA WORK + 2 
0a31 : 20 d5 13 JSR $13d5 ; (freg + 20)
0a34 : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0a37 : a9 00 __ LDA #$00
0a39 : 85 03 __ STA WORK + 0 
0a3b : 85 04 __ STA WORK + 1 
0a3d : a9 80 __ LDA #$80
0a3f : 85 05 __ STA WORK + 2 
0a41 : a9 42 __ LDA #$42
0a43 : 85 06 __ STA WORK + 3 
0a45 : 20 d5 13 JSR $13d5 ; (freg + 20)
0a48 : 20 bb 15 JSR $15bb ; (crt_fdiv + 0)
0a4b : a5 1b __ LDA ACCU + 0 
0a4d : 85 0d __ STA P0 
0a4f : a5 1c __ LDA ACCU + 1 
0a51 : 85 0e __ STA P1 
0a53 : a5 1d __ LDA ACCU + 2 
0a55 : 85 0f __ STA P2 
0a57 : a5 1e __ LDA ACCU + 3 
0a59 : 85 10 __ STA P3 
0a5b : 20 99 0b JSR $0b99 ; (sin.s4 + 0)
0a5e : a9 00 __ LDA #$00
0a60 : 85 03 __ STA WORK + 0 
0a62 : 85 04 __ STA WORK + 1 
0a64 : a9 8c __ LDA #$8c
0a66 : 85 05 __ STA WORK + 2 
0a68 : a9 42 __ LDA #$42
0a6a : 85 06 __ STA WORK + 3 
0a6c : 20 d5 13 JSR $13d5 ; (freg + 20)
0a6f : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0a72 : 20 63 17 JSR $1763 ; (f32_to_i16 + 0)
0a75 : a5 1b __ LDA ACCU + 0 
0a77 : a0 00 __ LDY #$00
0a79 : 91 4c __ STA (T2 + 0),y 
0a7b : a5 1c __ LDA ACCU + 1 
0a7d : c8 __ __ INY
0a7e : 91 4c __ STA (T2 + 0),y 
0a80 : 18 __ __ CLC
0a81 : a5 4c __ LDA T2 + 0 
0a83 : 69 02 __ ADC #$02
0a85 : 85 4c __ STA T2 + 0 
0a87 : 90 02 __ BCC $0a8b ; (main.s17 + 0)
.s16:
0a89 : e6 4d __ INC T2 + 1 
.s17:
0a8b : e6 4b __ INC T1 + 0 
0a8d : 10 87 __ BPL $0a16 ; (main.l5 + 0)
.s6:
0a8f : 20 30 0d JSR $0d30 ; (rirq_init_kernal.s4 + 0)
0a92 : a9 00 __ LDA #$00
0a94 : 85 10 __ STA P3 
0a96 : a9 04 __ LDA #$04
0a98 : 85 11 __ STA P4 
0a9a : 20 cc 0d JSR $0dcc ; (vspr_init.s4 + 0)
0a9d : a9 20 __ LDA #$20
0a9f : 85 4b __ STA T1 + 0 
0aa1 : a9 00 __ LDA #$00
0aa3 : 0a __ __ ASL
0aa4 : 26 4b __ ROL T1 + 0 
0aa6 : 0a __ __ ASL
0aa7 : 26 4b __ ROL T1 + 0 
0aa9 : a9 1e __ LDA #$1e
0aab : 85 0e __ STA P1 
0aad : a9 dc __ LDA #$dc
0aaf : 85 10 __ STA P3 
0ab1 : a9 00 __ LDA #$00
0ab3 : 85 0f __ STA P2 
0ab5 : 85 11 __ STA P4 
0ab7 : a6 4b __ LDX T1 + 0 
0ab9 : 86 12 __ STX P5 
.l13:
0abb : 85 0d __ STA P0 
0abd : 29 07 __ AND #$07
0abf : 09 08 __ ORA #$08
0ac1 : 85 13 __ STA P6 
0ac3 : 20 64 0f JSR $0f64 ; (vspr_set.s4 + 0)
0ac6 : e6 12 __ INC P5 
0ac8 : 18 __ __ CLC
0ac9 : a5 0e __ LDA P1 
0acb : 69 10 __ ADC #$10
0acd : 85 0e __ STA P1 
0acf : 90 02 __ BCC $0ad3 ; (main.s19 + 0)
.s18:
0ad1 : e6 0f __ INC P2 
.s19:
0ad3 : 38 __ __ SEC
0ad4 : a5 10 __ LDA P3 
0ad6 : e9 08 __ SBC #$08
0ad8 : 85 10 __ STA P3 
0ada : 18 __ __ CLC
0adb : a5 0d __ LDA P0 
0add : 69 01 __ ADC #$01
0adf : c9 10 __ CMP #$10
0ae1 : 90 d8 __ BCC $0abb ; (main.l13 + 0)
.s14:
0ae3 : 20 8e 0f JSR $0f8e ; (vspr_sort.s4 + 0)
0ae6 : 20 d7 0f JSR $0fd7 ; (vspr_update.s4 + 0)
0ae9 : a9 00 __ LDA #$00
0aeb : 20 14 13 JSR $1314 ; (rirq_sort.s4 + 0)
0aee : 20 a3 13 JSR $13a3 ; (rirq_start.s4 + 0)
0af1 : a9 00 __ LDA #$00
0af3 : 85 53 __ STA T7 + 0 
.l7:
0af5 : 85 54 __ STA T7 + 1 
0af7 : 4a __ __ LSR
0af8 : 85 44 __ STA T0 + 1 
0afa : a5 53 __ LDA T7 + 0 
0afc : 6a __ __ ROR
0afd : 46 44 __ LSR T0 + 1 
0aff : 6a __ __ ROR
0b00 : 46 44 __ LSR T0 + 1 
0b02 : 6a __ __ ROR
0b03 : 46 44 __ LSR T0 + 1 
0b05 : 6a __ __ ROR
0b06 : aa __ __ TAX
0b07 : 0a __ __ ASL
0b08 : 85 4b __ STA T1 + 0 
0b0a : 8a __ __ TXA
0b0b : 18 __ __ CLC
0b0c : 69 20 __ ADC #$20
0b0e : 0a __ __ ASL
0b0f : 85 43 __ STA T0 + 0 
0b11 : a9 00 __ LDA #$00
0b13 : 85 4c __ STA T2 + 0 
.l8:
0b15 : 0a __ __ ASL
0b16 : 0a __ __ ASL
0b17 : 0a __ __ ASL
0b18 : 18 __ __ CLC
0b19 : 65 53 __ ADC T7 + 0 
0b1b : 85 1b __ STA ACCU + 0 
0b1d : 0a __ __ ASL
0b1e : aa __ __ TAX
0b1f : bd 00 28 LDA $2800,x ; (sintab[0] + 0)
0b22 : 18 __ __ CLC
0b23 : 69 c8 __ ADC #$c8
0b25 : bc 01 28 LDY $2801,x ; (sintab[0] + 1)
0b28 : 90 02 __ BCC $0b2c ; (main.s21 + 0)
.s20:
0b2a : c8 __ __ INY
0b2b : 18 __ __ CLC
.s21:
0b2c : a6 4b __ LDX T1 + 0 
0b2e : 7d 00 28 ADC $2800,x ; (sintab[0] + 0)
0b31 : 85 4e __ STA T4 + 0 
0b33 : 98 __ __ TYA
0b34 : 7d 01 28 ADC $2801,x ; (sintab[0] + 1)
0b37 : 85 4f __ STA T4 + 1 
0b39 : a6 4c __ LDX T2 + 0 
0b3b : 9d a7 29 STA $29a7,x ; (vspriteXHigh[0] + 0)
0b3e : 18 __ __ CLC
0b3f : a5 1b __ LDA ACCU + 0 
0b41 : 69 20 __ ADC #$20
0b43 : 0a __ __ ASL
0b44 : aa __ __ TAX
0b45 : bd 00 28 LDA $2800,x ; (sintab[0] + 0)
0b48 : 18 __ __ CLC
0b49 : 69 96 __ ADC #$96
0b4b : bc 01 28 LDY $2801,x ; (sintab[0] + 1)
0b4e : 90 02 __ BCC $0b52 ; (main.s23 + 0)
.s22:
0b50 : c8 __ __ INY
0b51 : 18 __ __ CLC
.s23:
0b52 : a6 43 __ LDX T0 + 0 
0b54 : 7d 00 28 ADC $2800,x ; (sintab[0] + 0)
0b57 : 85 1b __ STA ACCU + 0 
0b59 : 98 __ __ TYA
0b5a : 7d 01 28 ADC $2801,x ; (sintab[0] + 1)
0b5d : d0 06 __ BNE $0b65 ; (main.s12 + 0)
.s9:
0b5f : a5 4f __ LDA T4 + 1 
0b61 : 29 fe __ AND #$fe
0b63 : f0 04 __ BEQ $0b69 ; (main.s10 + 0)
.s12:
0b65 : a9 ff __ LDA #$ff
0b67 : d0 02 __ BNE $0b6b ; (main.s15 + 0)
.s10:
0b69 : a5 1b __ LDA ACCU + 0 
.s15:
0b6b : a6 4c __ LDX T2 + 0 
0b6d : e8 __ __ INX
0b6e : 86 4c __ STX T2 + 0 
0b70 : 9d 86 29 STA $2986,x ; (spriteOrder[0] + 15)
0b73 : a5 4e __ LDA T4 + 0 
0b75 : 9d 96 29 STA $2996,x ; (vspriteYLow[0] + 15)
0b78 : 8a __ __ TXA
0b79 : e0 10 __ CPX #$10
0b7b : d0 98 __ BNE $0b15 ; (main.l8 + 0)
.s11:
0b7d : 20 8e 0f JSR $0f8e ; (vspr_sort.s4 + 0)
0b80 : 20 b5 13 JSR $13b5 ; (rirq_wait.l4 + 0)
0b83 : 20 d7 0f JSR $0fd7 ; (vspr_update.s4 + 0)
0b86 : a9 00 __ LDA #$00
0b88 : 20 14 13 JSR $1314 ; (rirq_sort.s4 + 0)
0b8b : 18 __ __ CLC
0b8c : a5 53 __ LDA T7 + 0 
0b8e : 69 01 __ ADC #$01
0b90 : 85 53 __ STA T7 + 0 
0b92 : a5 54 __ LDA T7 + 1 
0b94 : 69 00 __ ADC #$00
0b96 : 4c f5 0a JMP $0af5 ; (main.l7 + 0)
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
0b99 : a5 0d __ LDA P0 ; (f + 0)
0b9b : 85 43 __ STA T0 + 0 
0b9d : a5 0e __ LDA P1 ; (f + 1)
0b9f : 85 44 __ STA T0 + 1 
0ba1 : a5 0f __ LDA P2 ; (f + 2)
0ba3 : 85 45 __ STA T0 + 2 
0ba5 : a5 10 __ LDA P3 ; (f + 3)
0ba7 : 29 7f __ AND #$7f
0ba9 : 05 0f __ ORA P2 ; (f + 2)
0bab : 05 0e __ ORA P1 ; (f + 1)
0bad : 05 0d __ ORA P0 ; (f + 0)
0baf : f0 0e __ BEQ $0bbf ; (sin.s5 + 0)
.s22:
0bb1 : 24 10 __ BIT P3 ; (f + 3)
0bb3 : 10 0a __ BPL $0bbf ; (sin.s5 + 0)
.s21:
0bb5 : a9 00 __ LDA #$00
0bb7 : 85 47 __ STA T1 + 0 
0bb9 : 85 48 __ STA T1 + 1 
0bbb : a9 bf __ LDA #$bf
0bbd : d0 08 __ BNE $0bc7 ; (sin.s6 + 0)
.s5:
0bbf : a9 00 __ LDA #$00
0bc1 : 85 47 __ STA T1 + 0 
0bc3 : 85 48 __ STA T1 + 1 
0bc5 : a9 3f __ LDA #$3f
.s6:
0bc7 : 85 4a __ STA T1 + 3 
0bc9 : a5 10 __ LDA P3 ; (f + 3)
0bcb : 29 7f __ AND #$7f
0bcd : 85 46 __ STA T0 + 3 
0bcf : a9 80 __ LDA #$80
0bd1 : 85 49 __ STA T1 + 2 
0bd3 : a9 83 __ LDA #$83
0bd5 : 85 1b __ STA ACCU + 0 
0bd7 : a9 3e __ LDA #$3e
0bd9 : 85 1e __ STA ACCU + 3 
0bdb : a9 f9 __ LDA #$f9
0bdd : 85 1c __ STA ACCU + 1 
0bdf : a9 22 __ LDA #$22
0be1 : 85 1d __ STA ACCU + 2 
0be3 : a2 43 __ LDX #$43
0be5 : 20 c5 13 JSR $13c5 ; (freg + 4)
0be8 : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0beb : a5 1b __ LDA ACCU + 0 
0bed : 85 43 __ STA T0 + 0 
0bef : a5 1c __ LDA ACCU + 1 
0bf1 : 85 44 __ STA T0 + 1 
0bf3 : a5 1d __ LDA ACCU + 2 
0bf5 : 85 45 __ STA T0 + 2 
0bf7 : a5 1e __ LDA ACCU + 3 
0bf9 : 85 46 __ STA T0 + 3 
0bfb : 20 e5 13 JSR $13e5 ; (freg + 36)
0bfe : 20 69 16 JSR $1669 ; (fround + 0)
0c01 : a2 43 __ LDX #$43
0c03 : 20 c5 13 JSR $13c5 ; (freg + 4)
0c06 : a5 1e __ LDA ACCU + 3 
0c08 : 49 80 __ EOR #$80
0c0a : 85 1e __ STA ACCU + 3 
0c0c : 20 0c 14 JSR $140c ; (faddsub + 6)
0c0f : a5 1b __ LDA ACCU + 0 
0c11 : 85 43 __ STA T0 + 0 
0c13 : a5 1c __ LDA ACCU + 1 
0c15 : 85 44 __ STA T0 + 1 
0c17 : a6 1d __ LDX ACCU + 2 
0c19 : 86 45 __ STX T0 + 2 
0c1b : a5 1e __ LDA ACCU + 3 
0c1d : 85 46 __ STA T0 + 3 
0c1f : 30 3b __ BMI $0c5c ; (sin.s7 + 0)
.s16:
0c21 : c9 3f __ CMP #$3f
0c23 : d0 0b __ BNE $0c30 ; (sin.s20 + 0)
.s17:
0c25 : 8a __ __ TXA
0c26 : d0 08 __ BNE $0c30 ; (sin.s20 + 0)
.s18:
0c28 : a5 1c __ LDA ACCU + 1 
0c2a : d0 04 __ BNE $0c30 ; (sin.s20 + 0)
.s19:
0c2c : a5 1b __ LDA ACCU + 0 
0c2e : f0 02 __ BEQ $0c32 ; (sin.s15 + 0)
.s20:
0c30 : 90 2a __ BCC $0c5c ; (sin.s7 + 0)
.s15:
0c32 : a9 00 __ LDA #$00
0c34 : 85 1b __ STA ACCU + 0 
0c36 : 85 1c __ STA ACCU + 1 
0c38 : 85 1d __ STA ACCU + 2 
0c3a : a9 bf __ LDA #$bf
0c3c : 85 1e __ STA ACCU + 3 
0c3e : a2 43 __ LDX #$43
0c40 : 20 c5 13 JSR $13c5 ; (freg + 4)
0c43 : 20 0c 14 JSR $140c ; (faddsub + 6)
0c46 : a5 1b __ LDA ACCU + 0 
0c48 : 85 43 __ STA T0 + 0 
0c4a : a5 1c __ LDA ACCU + 1 
0c4c : 85 44 __ STA T0 + 1 
0c4e : a5 1d __ LDA ACCU + 2 
0c50 : 85 45 __ STA T0 + 2 
0c52 : a5 1e __ LDA ACCU + 3 
0c54 : 85 46 __ STA T0 + 3 
0c56 : a5 4a __ LDA T1 + 3 
0c58 : 49 80 __ EOR #$80
0c5a : 85 4a __ STA T1 + 3 
.s7:
0c5c : a5 1e __ LDA ACCU + 3 
0c5e : 30 38 __ BMI $0c98 ; (sin.s8 + 0)
.s10:
0c60 : c9 3e __ CMP #$3e
0c62 : d0 0e __ BNE $0c72 ; (sin.s14 + 0)
.s11:
0c64 : a5 1d __ LDA ACCU + 2 
0c66 : c9 80 __ CMP #$80
0c68 : d0 08 __ BNE $0c72 ; (sin.s14 + 0)
.s12:
0c6a : a5 1c __ LDA ACCU + 1 
0c6c : d0 04 __ BNE $0c72 ; (sin.s14 + 0)
.s13:
0c6e : a5 1b __ LDA ACCU + 0 
0c70 : f0 02 __ BEQ $0c74 ; (sin.s9 + 0)
.s14:
0c72 : 90 24 __ BCC $0c98 ; (sin.s8 + 0)
.s9:
0c74 : a9 00 __ LDA #$00
0c76 : 85 1b __ STA ACCU + 0 
0c78 : 85 1c __ STA ACCU + 1 
0c7a : 85 1d __ STA ACCU + 2 
0c7c : a9 3f __ LDA #$3f
0c7e : 85 1e __ STA ACCU + 3 
0c80 : a2 43 __ LDX #$43
0c82 : 20 c5 13 JSR $13c5 ; (freg + 4)
0c85 : 20 06 14 JSR $1406 ; (faddsub + 0)
0c88 : a5 1b __ LDA ACCU + 0 
0c8a : 85 43 __ STA T0 + 0 
0c8c : a5 1c __ LDA ACCU + 1 
0c8e : 85 44 __ STA T0 + 1 
0c90 : a5 1d __ LDA ACCU + 2 
0c92 : 85 45 __ STA T0 + 2 
0c94 : a5 1e __ LDA ACCU + 3 
0c96 : 85 46 __ STA T0 + 3 
.s8:
0c98 : a9 98 __ LDA #$98
0c9a : 85 1b __ STA ACCU + 0 
0c9c : a9 42 __ LDA #$42
0c9e : 85 1e __ STA ACCU + 3 
0ca0 : a9 ec __ LDA #$ec
0ca2 : 85 1c __ STA ACCU + 1 
0ca4 : a9 5e __ LDA #$5e
0ca6 : 85 1d __ STA ACCU + 2 
0ca8 : a2 43 __ LDX #$43
0caa : 20 c5 13 JSR $13c5 ; (freg + 4)
0cad : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0cb0 : a9 f8 __ LDA #$f8
0cb2 : 85 03 __ STA WORK + 0 
0cb4 : a9 41 __ LDA #$41
0cb6 : 85 06 __ STA WORK + 3 
0cb8 : a9 c5 __ LDA #$c5
0cba : 85 04 __ STA WORK + 1 
0cbc : a9 13 __ LDA #$13
0cbe : 85 05 __ STA WORK + 2 
0cc0 : 20 d5 13 JSR $13d5 ; (freg + 20)
0cc3 : 20 0c 14 JSR $140c ; (faddsub + 6)
0cc6 : a2 43 __ LDX #$43
0cc8 : 20 c5 13 JSR $13c5 ; (freg + 4)
0ccb : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0cce : a9 6e __ LDA #$6e
0cd0 : 85 03 __ STA WORK + 0 
0cd2 : a9 c2 __ LDA #$c2
0cd4 : 85 06 __ STA WORK + 3 
0cd6 : a9 27 __ LDA #$27
0cd8 : 85 04 __ STA WORK + 1 
0cda : a9 2a __ LDA #$2a
0cdc : 85 05 __ STA WORK + 2 
0cde : 20 d5 13 JSR $13d5 ; (freg + 20)
0ce1 : 20 0c 14 JSR $140c ; (faddsub + 6)
0ce4 : a2 43 __ LDX #$43
0ce6 : 20 c5 13 JSR $13c5 ; (freg + 4)
0ce9 : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0cec : a9 df __ LDA #$df
0cee : 85 03 __ STA WORK + 0 
0cf0 : a9 3d __ LDA #$3d
0cf2 : 85 06 __ STA WORK + 3 
0cf4 : a9 af __ LDA #$af
0cf6 : 85 04 __ STA WORK + 1 
0cf8 : a9 5c __ LDA #$5c
0cfa : 85 05 __ STA WORK + 2 
0cfc : 20 d5 13 JSR $13d5 ; (freg + 20)
0cff : 20 0c 14 JSR $140c ; (faddsub + 6)
0d02 : a2 43 __ LDX #$43
0d04 : 20 c5 13 JSR $13c5 ; (freg + 4)
0d07 : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0d0a : a9 b6 __ LDA #$b6
0d0c : 85 03 __ STA WORK + 0 
0d0e : a9 40 __ LDA #$40
0d10 : 85 06 __ STA WORK + 3 
0d12 : a9 0f __ LDA #$0f
0d14 : 85 04 __ STA WORK + 1 
0d16 : a9 c9 __ LDA #$c9
0d18 : 85 05 __ STA WORK + 2 
0d1a : 20 d5 13 JSR $13d5 ; (freg + 20)
0d1d : 20 0c 14 JSR $140c ; (faddsub + 6)
0d20 : a2 43 __ LDX #$43
0d22 : 20 c5 13 JSR $13c5 ; (freg + 4)
0d25 : 20 f3 14 JSR $14f3 ; (crt_fmul + 0)
0d28 : a2 47 __ LDX #$47
0d2a : 20 c5 13 JSR $13c5 ; (freg + 4)
0d2d : 4c f3 14 JMP $14f3 ; (crt_fmul + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0d30 : 20 51 0d JSR $0d51 ; (rirq_init_tables.s4 + 0)
0d33 : 78 __ __ SEI
0d34 : a9 01 __ LDA #$01
0d36 : 8d 1a d0 STA $d01a 
0d39 : a9 6f __ LDA #$6f
0d3b : 8d 14 03 STA $0314 
0d3e : a9 0d __ LDA #$0d
0d40 : 8d 15 03 STA $0315 
0d43 : ad 11 d0 LDA $d011 
0d46 : 29 7f __ AND #$7f
0d48 : 8d 11 d0 STA $d011 
0d4b : a9 ff __ LDA #$ff
0d4d : 8d 12 d0 STA $d012 
.s3:
0d50 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0d51 : a2 00 __ LDX #$00
.l5:
0d53 : a9 ff __ LDA #$ff
0d55 : 9d 00 29 STA $2900,x ; (rasterIRQRows[0] + 0)
0d58 : 8a __ __ TXA
0d59 : 9d 12 29 STA $2912,x ; (rasterIRQIndex[0] + 1)
0d5c : e8 __ __ INX
0d5d : e0 10 __ CPX #$10
0d5f : d0 f2 __ BNE $0d53 ; (rirq_init_tables.l5 + 0)
.s6:
0d61 : 8e 11 29 STX $2911 ; (rasterIRQIndex[0] + 0)
0d64 : a9 ff __ LDA #$ff
0d66 : 8d 32 29 STA $2932 ; (rasterIRQNext[0] + 16)
0d69 : a9 00 __ LDA #$00
0d6b : 8d 10 29 STA $2910 ; (rasterIRQRows[0] + 16)
.s3:
0d6e : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0d6f : ad 19 d0 LDA $d019 
0d72 : 10 51 __ BPL $0dc5 ; (rirq_isr_kernal_io + 86)
0d74 : ae 33 29 LDX $2933 ; (nextIRQ + 0)
0d77 : 30 33 __ BMI $0dac ; (rirq_isr_kernal_io + 61)
0d79 : bd 22 29 LDA $2922,x ; (rasterIRQNext[0] + 0)
0d7c : bc 12 29 LDY $2912,x ; (rasterIRQIndex[0] + 1)
0d7f : be 34 29 LDX $2934,y ; (rasterIRQLow[0] + 0)
0d82 : 8e 8c 0d STX $0d8c ; (rirq_isr_kernal_io + 29)
0d85 : be 44 29 LDX $2944,y ; (rasterIRQHigh[0] + 0)
0d88 : 8e 8d 0d STX $0d8d ; (rirq_isr_kernal_io + 30)
0d8b : 20 00 00 JSR $0000 
0d8e : ee 33 29 INC $2933 ; (nextIRQ + 0)
0d91 : ae 33 29 LDX $2933 ; (nextIRQ + 0)
0d94 : bc 22 29 LDY $2922,x ; (rasterIRQNext[0] + 0)
0d97 : 0e 19 d0 ASL $d019 
0d9a : c0 ff __ CPY #$ff
0d9c : f0 14 __ BEQ $0db2 ; (rirq_isr_kernal_io + 67)
0d9e : 88 __ __ DEY
0d9f : 88 __ __ DEY
0da0 : 8c 12 d0 STY $d012 
0da3 : 88 __ __ DEY
0da4 : cc 12 d0 CPY $d012 
0da7 : 90 d0 __ BCC $0d79 ; (rirq_isr_kernal_io + 10)
0da9 : 4c 81 ea JMP $ea81 
0dac : 0e 19 d0 ASL $d019 
0daf : 4c 81 ea JMP $ea81 
0db2 : ee 54 29 INC $2954 ; (rirq_count + 0)
0db5 : ac 22 29 LDY $2922 ; (rasterIRQNext[0] + 0)
0db8 : 88 __ __ DEY
0db9 : 88 __ __ DEY
0dba : 8c 12 d0 STY $d012 
0dbd : a2 00 __ LDX #$00
0dbf : 8e 33 29 STX $2933 ; (nextIRQ + 0)
0dc2 : 4c 81 ea JMP $ea81 
0dc5 : ad 0d dc LDA $dc0d 
0dc8 : 58 __ __ CLI
0dc9 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
vspr_init: ; vspr_init(u8*)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0dcc : a9 00 __ LDA #$00
0dce : 8d 1d d0 STA $d01d 
0dd1 : 8d 17 d0 STA $d017 
0dd4 : a9 ff __ LDA #$ff
0dd6 : 8d 15 d0 STA $d015 
0dd9 : 18 __ __ CLC
0dda : a5 10 __ LDA P3 ; (screen + 0)
0ddc : 69 f8 __ ADC #$f8
0dde : 85 43 __ STA T4 + 0 
0de0 : 8d 55 29 STA $2955 ; (vspriteScreen + 0)
0de3 : a5 11 __ LDA P4 ; (screen + 1)
0de5 : 69 03 __ ADC #$03
0de7 : 85 44 __ STA T4 + 1 
0de9 : 8d 56 29 STA $2956 ; (vspriteScreen + 1)
0dec : a9 00 __ LDA #$00
0dee : 85 45 __ STA T5 + 0 
0df0 : 85 46 __ STA T6 + 0 
0df2 : a9 50 __ LDA #$50
0df4 : 85 47 __ STA T7 + 0 
0df6 : a9 05 __ LDA #$05
0df8 : 85 0f __ STA P2 
0dfa : a9 00 __ LDA #$00
0dfc : 85 0d __ STA P0 
0dfe : a9 2a __ LDA #$2a
0e00 : 85 0e __ STA P1 
.l5:
0e02 : 20 c0 0e JSR $0ec0 ; (rirq_build.s4 + 0)
0e05 : a9 00 __ LDA #$00
0e07 : a0 02 __ LDY #$02
0e09 : 91 0d __ STA (P0),y 
0e0b : a0 04 __ LDY #$04
0e0d : 91 0d __ STA (P0),y 
0e0f : a0 11 __ LDY #$11
0e11 : 91 0d __ STA (P0),y 
0e13 : a0 16 __ LDY #$16
0e15 : 91 0d __ STA (P0),y 
0e17 : a0 1b __ LDY #$1b
0e19 : 91 0d __ STA (P0),y 
0e1b : a5 45 __ LDA T5 + 0 
0e1d : aa __ __ TAX
0e1e : 18 __ __ CLC
0e1f : 69 27 __ ADC #$27
0e21 : a0 0b __ LDY #$0b
0e23 : 91 0d __ STA (P0),y 
0e25 : a9 d0 __ LDA #$d0
0e27 : 69 00 __ ADC #$00
0e29 : c8 __ __ INY
0e2a : 91 0d __ STA (P0),y 
0e2c : a5 46 __ LDA T6 + 0 
0e2e : a0 0e __ LDY #$0e
0e30 : 91 0d __ STA (P0),y 
0e32 : a9 d0 __ LDA #$d0
0e34 : c8 __ __ INY
0e35 : 91 0d __ STA (P0),y 
0e37 : a5 46 __ LDA T6 + 0 
0e39 : 69 01 __ ADC #$01
0e3b : a0 13 __ LDY #$13
0e3d : 91 0d __ STA (P0),y 
0e3f : a9 d0 __ LDA #$d0
0e41 : 69 00 __ ADC #$00
0e43 : c8 __ __ INY
0e44 : 91 0d __ STA (P0),y 
0e46 : 8a __ __ TXA
0e47 : e8 __ __ INX
0e48 : 86 45 __ STX T5 + 0 
0e4a : 65 43 __ ADC T4 + 0 
0e4c : a0 18 __ LDY #$18
0e4e : 91 0d __ STA (P0),y 
0e50 : a5 44 __ LDA T4 + 1 
0e52 : 69 00 __ ADC #$00
0e54 : c8 __ __ INY
0e55 : 91 0d __ STA (P0),y 
0e57 : a9 10 __ LDA #$10
0e59 : a0 1d __ LDY #$1d
0e5b : 91 0d __ STA (P0),y 
0e5d : a9 d0 __ LDA #$d0
0e5f : c8 __ __ INY
0e60 : 91 0d __ STA (P0),y 
0e62 : 18 __ __ CLC
0e63 : a5 0d __ LDA P0 
0e65 : 69 01 __ ADC #$01
0e67 : 9d 33 29 STA $2933,x ; (nextIRQ + 0)
0e6a : a5 0e __ LDA P1 
0e6c : 69 00 __ ADC #$00
0e6e : 9d 43 29 STA $2943,x ; (rasterIRQLow[0] + 15)
0e71 : a5 47 __ LDA T7 + 0 
0e73 : 9d ff 28 STA $28ff,x ; (sintab[0] + 255)
0e76 : 18 __ __ CLC
0e77 : 69 04 __ ADC #$04
0e79 : 85 47 __ STA T7 + 0 
0e7b : e6 46 __ INC T6 + 0 
0e7d : e6 46 __ INC T6 + 0 
0e7f : 18 __ __ CLC
0e80 : a5 0d __ LDA P0 
0e82 : 69 20 __ ADC #$20
0e84 : 85 0d __ STA P0 
0e86 : 90 02 __ BCC $0e8a ; (vspr_init.s9 + 0)
.s8:
0e88 : e6 0e __ INC P1 
.s9:
0e8a : e0 08 __ CPX #$08
0e8c : b0 03 __ BCS $0e91 ; (vspr_init.s6 + 0)
0e8e : 4c 02 0e JMP $0e02 ; (vspr_init.l5 + 0)
.s6:
0e91 : a9 00 __ LDA #$00
0e93 : 85 0f __ STA P2 
0e95 : a9 29 __ LDA #$29
0e97 : 85 0e __ STA P1 
0e99 : a9 57 __ LDA #$57
0e9b : 85 0d __ STA P0 
0e9d : 20 c0 0e JSR $0ec0 ; (rirq_build.s4 + 0)
0ea0 : a9 fa __ LDA #$fa
0ea2 : 8d 08 29 STA $2908 ; (rasterIRQRows[0] + 8)
0ea5 : a9 58 __ LDA #$58
0ea7 : 8d 3c 29 STA $293c ; (rasterIRQLow[0] + 8)
0eaa : a9 29 __ LDA #$29
0eac : 8d 4c 29 STA $294c ; (rasterIRQHigh[0] + 8)
0eaf : a2 00 __ LDX #$00
.l7:
0eb1 : 8a __ __ TXA
0eb2 : 9d 77 29 STA $2977,x ; (spriteOrder[0] + 0)
0eb5 : a9 ff __ LDA #$ff
0eb7 : 9d 87 29 STA $2987,x ; (vspriteYLow[0] + 0)
0eba : e8 __ __ INX
0ebb : e0 10 __ CPX #$10
0ebd : d0 f2 __ BNE $0eb1 ; (vspr_init.l7 + 0)
.s3:
0ebf : 60 __ __ RTS
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ec0 : a5 0d __ LDA P0 ; (ic + 0)
0ec2 : 85 1b __ STA ACCU + 0 
0ec4 : a5 0e __ LDA P1 ; (ic + 1)
0ec6 : 85 1c __ STA ACCU + 1 
0ec8 : a9 a0 __ LDA #$a0
0eca : a0 01 __ LDY #$01
0ecc : 91 0d __ STA (P0),y ; (ic + 0)
0ece : a9 00 __ LDA #$00
0ed0 : c8 __ __ INY
0ed1 : 91 0d __ STA (P0),y ; (ic + 0)
0ed3 : a9 a2 __ LDA #$a2
0ed5 : c8 __ __ INY
0ed6 : 91 0d __ STA (P0),y ; (ic + 0)
0ed8 : a9 00 __ LDA #$00
0eda : c8 __ __ INY
0edb : 91 0d __ STA (P0),y ; (ic + 0)
0edd : a9 cd __ LDA #$cd
0edf : c8 __ __ INY
0ee0 : 91 0d __ STA (P0),y ; (ic + 0)
0ee2 : a9 12 __ LDA #$12
0ee4 : c8 __ __ INY
0ee5 : 91 0d __ STA (P0),y ; (ic + 0)
0ee7 : a9 d0 __ LDA #$d0
0ee9 : c8 __ __ INY
0eea : 91 0d __ STA (P0),y ; (ic + 0)
0eec : a9 b0 __ LDA #$b0
0eee : c8 __ __ INY
0eef : 91 0d __ STA (P0),y ; (ic + 0)
0ef1 : a9 fb __ LDA #$fb
0ef3 : c8 __ __ INY
0ef4 : 91 0d __ STA (P0),y ; (ic + 0)
0ef6 : a9 8c __ LDA #$8c
0ef8 : c8 __ __ INY
0ef9 : 91 0d __ STA (P0),y ; (ic + 0)
0efb : a9 00 __ LDA #$00
0efd : c8 __ __ INY
0efe : 91 0d __ STA (P0),y ; (ic + 0)
0f00 : c8 __ __ INY
0f01 : 91 0d __ STA (P0),y ; (ic + 0)
0f03 : a8 __ __ TAY
0f04 : a5 0f __ LDA P2 ; (size + 0)
0f06 : 91 0d __ STA (P0),y ; (ic + 0)
0f08 : f0 53 __ BEQ $0f5d ; (rirq_build.s5 + 0)
.s6:
0f0a : a0 0d __ LDY #$0d
0f0c : c9 01 __ CMP #$01
0f0e : d0 05 __ BNE $0f15 ; (rirq_build.s7 + 0)
.s10:
0f10 : a9 60 __ LDA #$60
0f12 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0f14 : 60 __ __ RTS
.s7:
0f15 : a9 8e __ LDA #$8e
0f17 : 91 0d __ STA (P0),y ; (ic + 0)
0f19 : a9 00 __ LDA #$00
0f1b : c8 __ __ INY
0f1c : 91 0d __ STA (P0),y ; (ic + 0)
0f1e : c8 __ __ INY
0f1f : 91 0d __ STA (P0),y ; (ic + 0)
0f21 : a5 0f __ LDA P2 ; (size + 0)
0f23 : c9 03 __ CMP #$03
0f25 : 90 2a __ BCC $0f51 ; (rirq_build.s8 + 0)
.s9:
0f27 : e9 02 __ SBC #$02
0f29 : aa __ __ TAX
0f2a : 18 __ __ CLC
0f2b : a5 0d __ LDA P0 ; (ic + 0)
0f2d : 69 01 __ ADC #$01
0f2f : 85 1b __ STA ACCU + 0 
0f31 : a5 0e __ LDA P1 ; (ic + 1)
0f33 : 69 00 __ ADC #$00
0f35 : 85 1c __ STA ACCU + 1 
.l11:
0f37 : a9 a9 __ LDA #$a9
0f39 : 91 1b __ STA (ACCU + 0),y 
0f3b : a9 00 __ LDA #$00
0f3d : c8 __ __ INY
0f3e : 91 1b __ STA (ACCU + 0),y 
0f40 : a9 8d __ LDA #$8d
0f42 : c8 __ __ INY
0f43 : 91 1b __ STA (ACCU + 0),y 
0f45 : a9 00 __ LDA #$00
0f47 : c8 __ __ INY
0f48 : 91 1b __ STA (ACCU + 0),y 
0f4a : c8 __ __ INY
0f4b : 91 1b __ STA (ACCU + 0),y 
0f4d : c8 __ __ INY
0f4e : ca __ __ DEX
0f4f : d0 e6 __ BNE $0f37 ; (rirq_build.l11 + 0)
.s8:
0f51 : 98 __ __ TYA
0f52 : 18 __ __ CLC
0f53 : 65 0d __ ADC P0 ; (ic + 0)
0f55 : 85 1b __ STA ACCU + 0 
0f57 : a5 0e __ LDA P1 ; (ic + 1)
0f59 : 69 00 __ ADC #$00
0f5b : 85 1c __ STA ACCU + 1 
.s5:
0f5d : a9 60 __ LDA #$60
0f5f : a0 01 __ LDY #$01
0f61 : 91 1b __ STA (ACCU + 0),y 
0f63 : 60 __ __ RTS
--------------------------------------------------------------------
vspr_set: ; vspr_set(u8,i16,i16,u8,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0f64 : a5 11 __ LDA P4 ; (ypos + 1)
0f66 : d0 06 __ BNE $0f6e ; (vspr_set.s7 + 0)
.s5:
0f68 : a5 0f __ LDA P2 ; (xpos + 1)
0f6a : 29 fe __ AND #$fe
0f6c : f0 04 __ BEQ $0f72 ; (vspr_set.s6 + 0)
.s7:
0f6e : a9 ff __ LDA #$ff
0f70 : d0 02 __ BNE $0f74 ; (vspr_set.s8 + 0)
.s6:
0f72 : a5 10 __ LDA P3 ; (ypos + 0)
.s8:
0f74 : a6 0d __ LDX P0 ; (sp + 0)
0f76 : 9d 87 29 STA $2987,x ; (vspriteYLow[0] + 0)
0f79 : a5 0e __ LDA P1 ; (xpos + 0)
0f7b : 9d 97 29 STA $2997,x ; (vspriteXLow[0] + 0)
0f7e : a5 0f __ LDA P2 ; (xpos + 1)
0f80 : 9d a7 29 STA $29a7,x ; (vspriteXHigh[0] + 0)
0f83 : a5 12 __ LDA P5 ; (image + 0)
0f85 : 9d b7 29 STA $29b7,x ; (vspriteImage[0] + 0)
0f88 : a5 13 __ LDA P6 ; (color + 0)
0f8a : 9d c7 29 STA $29c7,x ; (vspriteColor[0] + 0)
.s3:
0f8d : 60 __ __ RTS
--------------------------------------------------------------------
vspr_sort: ; vspr_sort()->void
; 103, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0f8e : ae 77 29 LDX $2977 ; (spriteOrder[0] + 0)
0f91 : bd 87 29 LDA $2987,x ; (vspriteYLow[0] + 0)
0f94 : 85 1b __ STA ACCU + 0 
0f96 : 8d d8 29 STA $29d8 ; (spriteYPos[0] + 1)
0f99 : a0 01 __ LDY #$01
.l5:
0f9b : be 77 29 LDX $2977,y ; (spriteOrder[0] + 0)
0f9e : bd 87 29 LDA $2987,x ; (vspriteYLow[0] + 0)
0fa1 : c5 1b __ CMP ACCU + 0 
0fa3 : 90 07 __ BCC $0fac ; (vspr_sort.s8 + 0)
.s6:
0fa5 : 99 d8 29 STA $29d8,y ; (spriteYPos[0] + 1)
0fa8 : 85 1b __ STA ACCU + 0 
0faa : b0 25 __ BCS $0fd1 ; (vspr_sort.s7 + 0)
.s8:
0fac : 86 1d __ STX ACCU + 2 
0fae : 84 1c __ STY ACCU + 1 
0fb0 : aa __ __ TAX
0fb1 : a5 1b __ LDA ACCU + 0 
.l10:
0fb3 : 99 d8 29 STA $29d8,y ; (spriteYPos[0] + 1)
0fb6 : b9 76 29 LDA $2976,y ; (synch.code[0] + 30)
0fb9 : 99 77 29 STA $2977,y ; (spriteOrder[0] + 0)
0fbc : b9 d6 29 LDA $29d6,y ; (vspriteColor[0] + 15)
0fbf : 85 1e __ STA ACCU + 3 
0fc1 : e4 1e __ CPX ACCU + 3 
0fc3 : 88 __ __ DEY
0fc4 : 90 ed __ BCC $0fb3 ; (vspr_sort.l10 + 0)
.s9:
0fc6 : a5 1d __ LDA ACCU + 2 
0fc8 : 99 77 29 STA $2977,y ; (spriteOrder[0] + 0)
0fcb : 8a __ __ TXA
0fcc : 99 d8 29 STA $29d8,y ; (spriteYPos[0] + 1)
0fcf : a4 1c __ LDY ACCU + 1 
.s7:
0fd1 : c8 __ __ INY
0fd2 : c0 10 __ CPY #$10
0fd4 : 90 c5 __ BCC $0f9b ; (vspr_sort.l5 + 0)
.s3:
0fd6 : 60 __ __ RTS
--------------------------------------------------------------------
vspr_update: ; vspr_update()->void
; 108, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0fd7 : ae 77 29 LDX $2977 ; (spriteOrder[0] + 0)
0fda : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
0fdd : 8d 27 d0 STA $d027 
0fe0 : ad 55 29 LDA $2955 ; (vspriteScreen + 0)
0fe3 : 85 1b __ STA ACCU + 0 
0fe5 : ad 56 29 LDA $2956 ; (vspriteScreen + 1)
0fe8 : 85 1c __ STA ACCU + 1 
0fea : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
0fed : a0 00 __ LDY #$00
0fef : 91 1b __ STA (ACCU + 0),y 
0ff1 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
0ff4 : 4a __ __ LSR
0ff5 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
0ff8 : 8d 00 d0 STA $d000 
0ffb : ad d8 29 LDA $29d8 ; (spriteYPos[0] + 1)
0ffe : 8d 01 d0 STA $d001 
1001 : ae 78 29 LDX $2978 ; (spriteOrder[0] + 1)
1004 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1007 : 8d 28 d0 STA $d028 
100a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
100d : c8 __ __ INY
100e : 91 1b __ STA (ACCU + 0),y 
1010 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1013 : 85 1d __ STA ACCU + 2 
1015 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1018 : 8d 02 d0 STA $d002 
101b : ad d9 29 LDA $29d9 ; (spriteYPos[0] + 2)
101e : 8d 03 d0 STA $d003 
1021 : ae 79 29 LDX $2979 ; (spriteOrder[0] + 2)
1024 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1027 : 8d 29 d0 STA $d029 
102a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
102d : c8 __ __ INY
102e : 91 1b __ STA (ACCU + 0),y 
1030 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1033 : 85 1e __ STA ACCU + 3 
1035 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1038 : 8d 04 d0 STA $d004 
103b : ad da 29 LDA $29da ; (spriteYPos[0] + 3)
103e : 8d 05 d0 STA $d005 
1041 : ae 7a 29 LDX $297a ; (spriteOrder[0] + 3)
1044 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1047 : 8d 2a d0 STA $d02a 
104a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
104d : c8 __ __ INY
104e : 91 1b __ STA (ACCU + 0),y 
1050 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1053 : 85 43 __ STA T6 + 0 
1055 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1058 : 8d 06 d0 STA $d006 
105b : ad db 29 LDA $29db ; (spriteYPos[0] + 4)
105e : 8d 07 d0 STA $d007 
1061 : ae 7b 29 LDX $297b ; (spriteOrder[0] + 4)
1064 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1067 : 8d 2b d0 STA $d02b 
106a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
106d : c8 __ __ INY
106e : 91 1b __ STA (ACCU + 0),y 
1070 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1073 : 85 44 __ STA T7 + 0 
1075 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1078 : 8d 08 d0 STA $d008 
107b : ad dc 29 LDA $29dc ; (spriteYPos[0] + 5)
107e : 8d 09 d0 STA $d009 
1081 : ae 7c 29 LDX $297c ; (spriteOrder[0] + 5)
1084 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1087 : 8d 2c d0 STA $d02c 
108a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
108d : c8 __ __ INY
108e : 91 1b __ STA (ACCU + 0),y 
1090 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1093 : 85 45 __ STA T8 + 0 
1095 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1098 : 8d 0a d0 STA $d00a 
109b : ad dd 29 LDA $29dd ; (spriteYPos[0] + 6)
109e : 8d 0b d0 STA $d00b 
10a1 : ae 7d 29 LDX $297d ; (spriteOrder[0] + 6)
10a4 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
10a7 : 8d 2d d0 STA $d02d 
10aa : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
10ad : c8 __ __ INY
10ae : 91 1b __ STA (ACCU + 0),y 
10b0 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
10b3 : 85 46 __ STA T9 + 0 
10b5 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
10b8 : 8d 0c d0 STA $d00c 
10bb : ad de 29 LDA $29de ; (spriteYPos[0] + 7)
10be : 8d 0d d0 STA $d00d 
10c1 : ae 7e 29 LDX $297e ; (spriteOrder[0] + 7)
10c4 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
10c7 : 8d 2e d0 STA $d02e 
10ca : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
10cd : c8 __ __ INY
10ce : 91 1b __ STA (ACCU + 0),y 
10d0 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
10d3 : 8d 0e d0 STA $d00e 
10d6 : ad df 29 LDA $29df ; (spriteYPos[0] + 8)
10d9 : 8d 0f d0 STA $d00f 
10dc : a9 00 __ LDA #$00
10de : 6a __ __ ROR
10df : 46 1d __ LSR ACCU + 2 
10e1 : 6a __ __ ROR
10e2 : 46 1e __ LSR ACCU + 3 
10e4 : 6a __ __ ROR
10e5 : 46 43 __ LSR T6 + 0 
10e7 : 6a __ __ ROR
10e8 : 46 44 __ LSR T7 + 0 
10ea : 6a __ __ ROR
10eb : 46 45 __ LSR T8 + 0 
10ed : 6a __ __ ROR
10ee : 46 46 __ LSR T9 + 0 
10f0 : 6a __ __ ROR
10f1 : 85 1b __ STA ACCU + 0 
10f3 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
10f6 : 4a __ __ LSR
10f7 : 66 1b __ ROR ACCU + 0 
10f9 : ad e0 29 LDA $29e0 ; (spriteYPos[0] + 9)
10fc : c9 fa __ CMP #$fa
10fe : a6 1b __ LDX ACCU + 0 
1100 : 8e 10 d0 STX $d010 
1103 : 90 1b __ BCC $1120 ; (vspr_update.s13 + 0)
.s5:
1105 : a9 ff __ LDA #$ff
1107 : 8d 00 29 STA $2900 ; (rasterIRQRows[0] + 0)
.s6:
110a : 8d 01 29 STA $2901 ; (rasterIRQRows[0] + 1)
.s7:
110d : 8d 02 29 STA $2902 ; (rasterIRQRows[0] + 2)
.s8:
1110 : 8d 03 29 STA $2903 ; (rasterIRQRows[0] + 3)
.s9:
1113 : 8d 04 29 STA $2904 ; (rasterIRQRows[0] + 4)
.s10:
1116 : 8d 05 29 STA $2905 ; (rasterIRQRows[0] + 5)
.s11:
1119 : 8d 06 29 STA $2906 ; (rasterIRQRows[0] + 6)
.s12:
111c : 8d 07 29 STA $2907 ; (rasterIRQRows[0] + 7)
.s3:
111f : 60 __ __ RTS
.s13:
1120 : ad d8 29 LDA $29d8 ; (spriteYPos[0] + 1)
1123 : 69 17 __ ADC #$17
1125 : 8d 00 29 STA $2900 ; (rasterIRQRows[0] + 0)
1128 : 8a __ __ TXA
1129 : 09 01 __ ORA #$01
112b : a8 __ __ TAY
112c : ae 7f 29 LDX $297f ; (spriteOrder[0] + 8)
112f : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1132 : 4a __ __ LSR
1133 : b0 04 __ BCS $1139 ; (vspr_update.s15 + 0)
.s14:
1135 : 98 __ __ TYA
1136 : 49 01 __ EOR #$01
1138 : a8 __ __ TAY
.s15:
1139 : ad e0 29 LDA $29e0 ; (spriteYPos[0] + 9)
113c : 8d 11 2a STA $2a11 ; (spirq[0].code[0] + 16)
113f : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1142 : 8d 02 2a STA $2a02 ; (spirq[0].code[0] + 1)
1145 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1148 : 8d 04 2a STA $2a04 ; (spirq[0].code[0] + 3)
114b : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
114e : 8d 16 2a STA $2a16 ; (spirq[0].code[0] + 21)
1151 : 8c 1b 2a STY $2a1b ; (spirq[0].code[0] + 26)
1154 : ad e1 29 LDA $29e1 ; (spriteYPos[0] + 10)
1157 : c9 fa __ CMP #$fa
1159 : 90 04 __ BCC $115f ; (vspr_update.s16 + 0)
.s43:
115b : a9 ff __ LDA #$ff
115d : b0 ab __ BCS $110a ; (vspr_update.s6 + 0)
.s16:
115f : ad d9 29 LDA $29d9 ; (spriteYPos[0] + 2)
1162 : 69 17 __ ADC #$17
1164 : 8d 01 29 STA $2901 ; (rasterIRQRows[0] + 1)
1167 : 98 __ __ TYA
1168 : 09 02 __ ORA #$02
116a : a8 __ __ TAY
116b : ae 80 29 LDX $2980 ; (spriteOrder[0] + 9)
116e : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1171 : 4a __ __ LSR
1172 : b0 04 __ BCS $1178 ; (vspr_update.s18 + 0)
.s17:
1174 : 98 __ __ TYA
1175 : 49 02 __ EOR #$02
1177 : a8 __ __ TAY
.s18:
1178 : ad e1 29 LDA $29e1 ; (spriteYPos[0] + 10)
117b : 8d 31 2a STA $2a31 ; (spirq[0] + 49)
117e : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1181 : 8d 22 2a STA $2a22 ; (spirq[0] + 34)
1184 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1187 : 8d 24 2a STA $2a24 ; (spirq[0] + 36)
118a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
118d : 8d 36 2a STA $2a36 ; (spirq[0] + 54)
1190 : 8c 3b 2a STY $2a3b ; (spirq[0] + 59)
1193 : ad e2 29 LDA $29e2 ; (spriteYPos[0] + 11)
1196 : c9 fa __ CMP #$fa
1198 : 90 05 __ BCC $119f ; (vspr_update.s19 + 0)
.s42:
119a : a9 ff __ LDA #$ff
119c : 4c 0d 11 JMP $110d ; (vspr_update.s7 + 0)
.s19:
119f : ad da 29 LDA $29da ; (spriteYPos[0] + 3)
11a2 : 69 17 __ ADC #$17
11a4 : 8d 02 29 STA $2902 ; (rasterIRQRows[0] + 2)
11a7 : 98 __ __ TYA
11a8 : 09 04 __ ORA #$04
11aa : a8 __ __ TAY
11ab : ae 81 29 LDX $2981 ; (spriteOrder[0] + 10)
11ae : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
11b1 : 4a __ __ LSR
11b2 : b0 04 __ BCS $11b8 ; (vspr_update.s21 + 0)
.s20:
11b4 : 98 __ __ TYA
11b5 : 49 04 __ EOR #$04
11b7 : a8 __ __ TAY
.s21:
11b8 : ad e2 29 LDA $29e2 ; (spriteYPos[0] + 11)
11bb : 8d 51 2a STA $2a51 ; (spirq[0] + 81)
11be : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
11c1 : 8d 42 2a STA $2a42 ; (spirq[0] + 66)
11c4 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
11c7 : 8d 44 2a STA $2a44 ; (spirq[0] + 68)
11ca : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
11cd : 8d 56 2a STA $2a56 ; (spirq[0] + 86)
11d0 : 8c 5b 2a STY $2a5b ; (spirq[0] + 91)
11d3 : ad e3 29 LDA $29e3 ; (spriteYPos[0] + 12)
11d6 : c9 fa __ CMP #$fa
11d8 : 90 05 __ BCC $11df ; (vspr_update.s22 + 0)
.s41:
11da : a9 ff __ LDA #$ff
11dc : 4c 10 11 JMP $1110 ; (vspr_update.s8 + 0)
.s22:
11df : ad db 29 LDA $29db ; (spriteYPos[0] + 4)
11e2 : 69 17 __ ADC #$17
11e4 : 8d 03 29 STA $2903 ; (rasterIRQRows[0] + 3)
11e7 : 98 __ __ TYA
11e8 : 09 08 __ ORA #$08
11ea : a8 __ __ TAY
11eb : ae 82 29 LDX $2982 ; (spriteOrder[0] + 11)
11ee : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
11f1 : 4a __ __ LSR
11f2 : b0 04 __ BCS $11f8 ; (vspr_update.s24 + 0)
.s23:
11f4 : 98 __ __ TYA
11f5 : 49 08 __ EOR #$08
11f7 : a8 __ __ TAY
.s24:
11f8 : ad e3 29 LDA $29e3 ; (spriteYPos[0] + 12)
11fb : 8d 71 2a STA $2a71 ; (spirq[0] + 113)
11fe : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1201 : 8d 62 2a STA $2a62 ; (spirq[0] + 98)
1204 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1207 : 8d 64 2a STA $2a64 ; (spirq[0] + 100)
120a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
120d : 8d 76 2a STA $2a76 ; (spirq[0] + 118)
1210 : 8c 7b 2a STY $2a7b ; (spirq[0] + 123)
1213 : ad e4 29 LDA $29e4 ; (spriteYPos[0] + 13)
1216 : c9 fa __ CMP #$fa
1218 : 90 05 __ BCC $121f ; (vspr_update.s25 + 0)
.s40:
121a : a9 ff __ LDA #$ff
121c : 4c 13 11 JMP $1113 ; (vspr_update.s9 + 0)
.s25:
121f : ad dc 29 LDA $29dc ; (spriteYPos[0] + 5)
1222 : 69 17 __ ADC #$17
1224 : 8d 04 29 STA $2904 ; (rasterIRQRows[0] + 4)
1227 : 98 __ __ TYA
1228 : 09 10 __ ORA #$10
122a : a8 __ __ TAY
122b : ae 83 29 LDX $2983 ; (spriteOrder[0] + 12)
122e : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1231 : 4a __ __ LSR
1232 : b0 04 __ BCS $1238 ; (vspr_update.s27 + 0)
.s26:
1234 : 98 __ __ TYA
1235 : 49 10 __ EOR #$10
1237 : a8 __ __ TAY
.s27:
1238 : ad e4 29 LDA $29e4 ; (spriteYPos[0] + 13)
123b : 8d 91 2a STA $2a91 ; (spirq[0] + 145)
123e : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1241 : 8d 82 2a STA $2a82 ; (spirq[0] + 130)
1244 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1247 : 8d 84 2a STA $2a84 ; (spirq[0] + 132)
124a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
124d : 8d 96 2a STA $2a96 ; (spirq[0] + 150)
1250 : 8c 9b 2a STY $2a9b ; (spirq[0] + 155)
1253 : ad e5 29 LDA $29e5 ; (spriteYPos[0] + 14)
1256 : c9 fa __ CMP #$fa
1258 : 90 05 __ BCC $125f ; (vspr_update.s28 + 0)
.s39:
125a : a9 ff __ LDA #$ff
125c : 4c 16 11 JMP $1116 ; (vspr_update.s10 + 0)
.s28:
125f : ad dd 29 LDA $29dd ; (spriteYPos[0] + 6)
1262 : 69 17 __ ADC #$17
1264 : 8d 05 29 STA $2905 ; (rasterIRQRows[0] + 5)
1267 : 98 __ __ TYA
1268 : 09 20 __ ORA #$20
126a : a8 __ __ TAY
126b : ae 84 29 LDX $2984 ; (spriteOrder[0] + 13)
126e : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1271 : 4a __ __ LSR
1272 : b0 04 __ BCS $1278 ; (vspr_update.s30 + 0)
.s29:
1274 : 98 __ __ TYA
1275 : 49 20 __ EOR #$20
1277 : a8 __ __ TAY
.s30:
1278 : ad e5 29 LDA $29e5 ; (spriteYPos[0] + 14)
127b : 8d b1 2a STA $2ab1 ; (spirq[0] + 177)
127e : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
1281 : 8d a2 2a STA $2aa2 ; (spirq[0] + 162)
1284 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
1287 : 8d a4 2a STA $2aa4 ; (spirq[0] + 164)
128a : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
128d : 8d b6 2a STA $2ab6 ; (spirq[0] + 182)
1290 : 8c bb 2a STY $2abb ; (spirq[0] + 187)
1293 : ad e6 29 LDA $29e6 ; (spriteYPos[0] + 15)
1296 : c9 fa __ CMP #$fa
1298 : 90 05 __ BCC $129f ; (vspr_update.s31 + 0)
.s38:
129a : a9 ff __ LDA #$ff
129c : 4c 19 11 JMP $1119 ; (vspr_update.s11 + 0)
.s31:
129f : ad de 29 LDA $29de ; (spriteYPos[0] + 7)
12a2 : 69 17 __ ADC #$17
12a4 : 8d 06 29 STA $2906 ; (rasterIRQRows[0] + 6)
12a7 : 98 __ __ TYA
12a8 : 09 40 __ ORA #$40
12aa : 85 1b __ STA ACCU + 0 
12ac : ae 85 29 LDX $2985 ; (spriteOrder[0] + 14)
12af : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
12b2 : 4a __ __ LSR
12b3 : b0 06 __ BCS $12bb ; (vspr_update.s33 + 0)
.s32:
12b5 : a5 1b __ LDA ACCU + 0 
12b7 : 49 40 __ EOR #$40
12b9 : 85 1b __ STA ACCU + 0 
.s33:
12bb : ad e6 29 LDA $29e6 ; (spriteYPos[0] + 15)
12be : 8d d1 2a STA $2ad1 ; (spirq[0] + 209)
12c1 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
12c4 : 8d c2 2a STA $2ac2 ; (spirq[0] + 194)
12c7 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
12ca : 8d c4 2a STA $2ac4 ; (spirq[0] + 196)
12cd : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
12d0 : 8d d6 2a STA $2ad6 ; (spirq[0] + 214)
12d3 : a5 1b __ LDA ACCU + 0 
12d5 : 8d db 2a STA $2adb ; (spirq[0] + 219)
12d8 : ae e7 29 LDX $29e7 ; (spriteYPos[0] + 16)
12db : e0 fa __ CPX #$fa
12dd : 90 05 __ BCC $12e4 ; (vspr_update.s34 + 0)
.s37:
12df : a9 ff __ LDA #$ff
12e1 : 4c 1c 11 JMP $111c ; (vspr_update.s12 + 0)
.s34:
12e4 : ad df 29 LDA $29df ; (spriteYPos[0] + 8)
12e7 : 69 17 __ ADC #$17
12e9 : 8d 07 29 STA $2907 ; (rasterIRQRows[0] + 7)
12ec : 8e f1 2a STX $2af1 ; (spirq[0] + 241)
12ef : ae 86 29 LDX $2986 ; (spriteOrder[0] + 15)
12f2 : bd c7 29 LDA $29c7,x ; (vspriteColor[0] + 0)
12f5 : 8d e2 2a STA $2ae2 ; (spirq[0] + 226)
12f8 : bd 97 29 LDA $2997,x ; (vspriteXLow[0] + 0)
12fb : 8d e4 2a STA $2ae4 ; (spirq[0] + 228)
12fe : bd b7 29 LDA $29b7,x ; (vspriteImage[0] + 0)
1301 : 8d f6 2a STA $2af6 ; (spirq[0] + 246)
1304 : bd a7 29 LDA $29a7,x ; (vspriteXHigh[0] + 0)
1307 : 4a __ __ LSR
1308 : a5 1b __ LDA ACCU + 0 
130a : 09 80 __ ORA #$80
130c : b0 02 __ BCS $1310 ; (vspr_update.s36 + 0)
.s35:
130e : 49 80 __ EOR #$80
.s36:
1310 : 8d fb 2a STA $2afb ; (spirq[0] + 251)
1313 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
1314 : 85 0d __ STA P0 ; (inirq + 0)
1316 : a9 ff __ LDA #$ff
1318 : 8d 33 29 STA $2933 ; (nextIRQ + 0)
131b : ae 12 29 LDX $2912 ; (rasterIRQIndex[0] + 1)
131e : bd 00 29 LDA $2900,x ; (rasterIRQRows[0] + 0)
1321 : 85 1c __ STA ACCU + 1 
1323 : a2 02 __ LDX #$02
.l5:
1325 : bc 11 29 LDY $2911,x ; (rasterIRQIndex[0] + 0)
1328 : b9 00 29 LDA $2900,y ; (rasterIRQRows[0] + 0)
132b : c5 1c __ CMP ACCU + 1 
132d : 90 04 __ BCC $1333 ; (rirq_sort.s12 + 0)
.s6:
132f : 85 1c __ STA ACCU + 1 
1331 : b0 24 __ BCS $1357 ; (rirq_sort.s7 + 0)
.s12:
1333 : 86 1d __ STX ACCU + 2 
1335 : 84 1e __ STY ACCU + 3 
1337 : 85 1b __ STA ACCU + 0 
1339 : bd 10 29 LDA $2910,x ; (rasterIRQRows[0] + 16)
133c : 9d 11 29 STA $2911,x ; (rasterIRQIndex[0] + 0)
133f : 90 05 __ BCC $1346 ; (rirq_sort.l13 + 0)
.s15:
1341 : 98 __ __ TYA
1342 : 9d 10 29 STA $2910,x ; (rasterIRQRows[0] + 16)
1345 : ca __ __ DEX
.l13:
1346 : a5 1b __ LDA ACCU + 0 
1348 : bc 0f 29 LDY $290f,x ; (rasterIRQRows[0] + 15)
134b : d9 00 29 CMP $2900,y ; (rasterIRQRows[0] + 0)
134e : 90 f1 __ BCC $1341 ; (rirq_sort.s15 + 0)
.s14:
1350 : a5 1e __ LDA ACCU + 3 
1352 : 9d 10 29 STA $2910,x ; (rasterIRQRows[0] + 16)
1355 : a6 1d __ LDX ACCU + 2 
.s7:
1357 : e8 __ __ INX
1358 : e0 11 __ CPX #$11
135a : 90 c9 __ BCC $1325 ; (rirq_sort.l5 + 0)
.s8:
135c : a2 03 __ LDX #$03
.l17:
135e : bc 12 29 LDY $2912,x ; (rasterIRQIndex[0] + 1)
1361 : b9 00 29 LDA $2900,y ; (rasterIRQRows[0] + 0)
1364 : 9d 22 29 STA $2922,x ; (rasterIRQNext[0] + 0)
1367 : bc 16 29 LDY $2916,x ; (rasterIRQIndex[0] + 5)
136a : b9 00 29 LDA $2900,y ; (rasterIRQRows[0] + 0)
136d : 9d 26 29 STA $2926,x ; (rasterIRQNext[0] + 4)
1370 : bc 1a 29 LDY $291a,x ; (rasterIRQIndex[0] + 9)
1373 : b9 00 29 LDA $2900,y ; (rasterIRQRows[0] + 0)
1376 : 9d 2a 29 STA $292a,x ; (rasterIRQNext[0] + 8)
1379 : bc 1e 29 LDY $291e,x ; (rasterIRQIndex[0] + 13)
137c : b9 00 29 LDA $2900,y ; (rasterIRQRows[0] + 0)
137f : 9d 2e 29 STA $292e,x ; (rasterIRQNext[0] + 12)
1382 : ca __ __ DEX
1383 : 10 d9 __ BPL $135e ; (rirq_sort.l17 + 0)
.s18:
1385 : ad 54 29 LDA $2954 ; (rirq_count + 0)
1388 : 8d e8 29 STA $29e8 ; (rirq_pcount + 0)
138b : a5 0d __ LDA P0 ; (inirq + 0)
138d : f0 06 __ BEQ $1395 ; (rirq_sort.s9 + 0)
.s11:
138f : a9 0f __ LDA #$0f
.s16:
1391 : 8d 33 29 STA $2933 ; (nextIRQ + 0)
.s3:
1394 : 60 __ __ RTS
.s9:
1395 : ac 22 29 LDY $2922 ; (rasterIRQNext[0] + 0)
1398 : c0 ff __ CPY #$ff
139a : f0 f8 __ BEQ $1394 ; (rirq_sort.s3 + 0)
.s10:
139c : 88 __ __ DEY
139d : 8c 12 d0 STY $d012 
13a0 : 4c 91 13 JMP $1391 ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
13a3 : ad 11 d0 LDA $d011 
13a6 : 29 7f __ AND #$7f
13a8 : 8d 11 d0 STA $d011 
13ab : a9 64 __ LDA #$64
13ad : 8d 12 d0 STA $d012 
13b0 : 0e 19 d0 ASL $d019 
13b3 : 58 __ __ CLI
.s3:
13b4 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
13b5 : ad 54 29 LDA $2954 ; (rirq_count + 0)
13b8 : cd e8 29 CMP $29e8 ; (rirq_pcount + 0)
13bb : f0 f8 __ BEQ $13b5 ; (rirq_wait.l4 + 0)
.s5:
13bd : 8d e8 29 STA $29e8 ; (rirq_pcount + 0)
.s3:
13c0 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
13c1 : b1 19 __ LDA (IP + 0),y 
13c3 : c8 __ __ INY
13c4 : aa __ __ TAX
13c5 : b5 00 __ LDA $00,x 
13c7 : 85 03 __ STA WORK + 0 
13c9 : b5 01 __ LDA $01,x 
13cb : 85 04 __ STA WORK + 1 
13cd : b5 02 __ LDA $02,x 
13cf : 85 05 __ STA WORK + 2 
13d1 : b5 03 __ LDA WORK + 0,x 
13d3 : 85 06 __ STA WORK + 3 
13d5 : a5 05 __ LDA WORK + 2 
13d7 : 0a __ __ ASL
13d8 : a5 06 __ LDA WORK + 3 
13da : 2a __ __ ROL
13db : 85 08 __ STA WORK + 5 
13dd : f0 06 __ BEQ $13e5 ; (freg + 36)
13df : a5 05 __ LDA WORK + 2 
13e1 : 09 80 __ ORA #$80
13e3 : 85 05 __ STA WORK + 2 
13e5 : a5 1d __ LDA ACCU + 2 
13e7 : 0a __ __ ASL
13e8 : a5 1e __ LDA ACCU + 3 
13ea : 2a __ __ ROL
13eb : 85 07 __ STA WORK + 4 
13ed : f0 06 __ BEQ $13f5 ; (freg + 52)
13ef : a5 1d __ LDA ACCU + 2 
13f1 : 09 80 __ ORA #$80
13f3 : 85 1d __ STA ACCU + 2 
13f5 : 60 __ __ RTS
13f6 : 06 1e __ ASL ACCU + 3 
13f8 : a5 07 __ LDA WORK + 4 
13fa : 6a __ __ ROR
13fb : 85 1e __ STA ACCU + 3 
13fd : b0 06 __ BCS $1405 ; (freg + 68)
13ff : a5 1d __ LDA ACCU + 2 
1401 : 29 7f __ AND #$7f
1403 : 85 1d __ STA ACCU + 2 
1405 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1406 : a5 06 __ LDA WORK + 3 
1408 : 49 80 __ EOR #$80
140a : 85 06 __ STA WORK + 3 
140c : a9 ff __ LDA #$ff
140e : c5 07 __ CMP WORK + 4 
1410 : f0 04 __ BEQ $1416 ; (faddsub + 16)
1412 : c5 08 __ CMP WORK + 5 
1414 : d0 11 __ BNE $1427 ; (faddsub + 33)
1416 : a5 1e __ LDA ACCU + 3 
1418 : 09 7f __ ORA #$7f
141a : 85 1e __ STA ACCU + 3 
141c : a9 80 __ LDA #$80
141e : 85 1d __ STA ACCU + 2 
1420 : a9 00 __ LDA #$00
1422 : 85 1b __ STA ACCU + 0 
1424 : 85 1c __ STA ACCU + 1 
1426 : 60 __ __ RTS
1427 : 38 __ __ SEC
1428 : a5 07 __ LDA WORK + 4 
142a : e5 08 __ SBC WORK + 5 
142c : f0 38 __ BEQ $1466 ; (faddsub + 96)
142e : aa __ __ TAX
142f : b0 25 __ BCS $1456 ; (faddsub + 80)
1431 : e0 e9 __ CPX #$e9
1433 : b0 0e __ BCS $1443 ; (faddsub + 61)
1435 : a5 08 __ LDA WORK + 5 
1437 : 85 07 __ STA WORK + 4 
1439 : a9 00 __ LDA #$00
143b : 85 1b __ STA ACCU + 0 
143d : 85 1c __ STA ACCU + 1 
143f : 85 1d __ STA ACCU + 2 
1441 : f0 23 __ BEQ $1466 ; (faddsub + 96)
1443 : a5 1d __ LDA ACCU + 2 
1445 : 4a __ __ LSR
1446 : 66 1c __ ROR ACCU + 1 
1448 : 66 1b __ ROR ACCU + 0 
144a : e8 __ __ INX
144b : d0 f8 __ BNE $1445 ; (faddsub + 63)
144d : 85 1d __ STA ACCU + 2 
144f : a5 08 __ LDA WORK + 5 
1451 : 85 07 __ STA WORK + 4 
1453 : 4c 66 14 JMP $1466 ; (faddsub + 96)
1456 : e0 18 __ CPX #$18
1458 : b0 33 __ BCS $148d ; (faddsub + 135)
145a : a5 05 __ LDA WORK + 2 
145c : 4a __ __ LSR
145d : 66 04 __ ROR WORK + 1 
145f : 66 03 __ ROR WORK + 0 
1461 : ca __ __ DEX
1462 : d0 f8 __ BNE $145c ; (faddsub + 86)
1464 : 85 05 __ STA WORK + 2 
1466 : a5 1e __ LDA ACCU + 3 
1468 : 29 80 __ AND #$80
146a : 85 1e __ STA ACCU + 3 
146c : 45 06 __ EOR WORK + 3 
146e : 30 31 __ BMI $14a1 ; (faddsub + 155)
1470 : 18 __ __ CLC
1471 : a5 1b __ LDA ACCU + 0 
1473 : 65 03 __ ADC WORK + 0 
1475 : 85 1b __ STA ACCU + 0 
1477 : a5 1c __ LDA ACCU + 1 
1479 : 65 04 __ ADC WORK + 1 
147b : 85 1c __ STA ACCU + 1 
147d : a5 1d __ LDA ACCU + 2 
147f : 65 05 __ ADC WORK + 2 
1481 : 85 1d __ STA ACCU + 2 
1483 : 90 08 __ BCC $148d ; (faddsub + 135)
1485 : 66 1d __ ROR ACCU + 2 
1487 : 66 1c __ ROR ACCU + 1 
1489 : 66 1b __ ROR ACCU + 0 
148b : e6 07 __ INC WORK + 4 
148d : a5 07 __ LDA WORK + 4 
148f : c9 ff __ CMP #$ff
1491 : f0 83 __ BEQ $1416 ; (faddsub + 16)
1493 : 4a __ __ LSR
1494 : 05 1e __ ORA ACCU + 3 
1496 : 85 1e __ STA ACCU + 3 
1498 : b0 06 __ BCS $14a0 ; (faddsub + 154)
149a : a5 1d __ LDA ACCU + 2 
149c : 29 7f __ AND #$7f
149e : 85 1d __ STA ACCU + 2 
14a0 : 60 __ __ RTS
14a1 : 38 __ __ SEC
14a2 : a5 1b __ LDA ACCU + 0 
14a4 : e5 03 __ SBC WORK + 0 
14a6 : 85 1b __ STA ACCU + 0 
14a8 : a5 1c __ LDA ACCU + 1 
14aa : e5 04 __ SBC WORK + 1 
14ac : 85 1c __ STA ACCU + 1 
14ae : a5 1d __ LDA ACCU + 2 
14b0 : e5 05 __ SBC WORK + 2 
14b2 : 85 1d __ STA ACCU + 2 
14b4 : b0 19 __ BCS $14cf ; (faddsub + 201)
14b6 : 38 __ __ SEC
14b7 : a9 00 __ LDA #$00
14b9 : e5 1b __ SBC ACCU + 0 
14bb : 85 1b __ STA ACCU + 0 
14bd : a9 00 __ LDA #$00
14bf : e5 1c __ SBC ACCU + 1 
14c1 : 85 1c __ STA ACCU + 1 
14c3 : a9 00 __ LDA #$00
14c5 : e5 1d __ SBC ACCU + 2 
14c7 : 85 1d __ STA ACCU + 2 
14c9 : a5 1e __ LDA ACCU + 3 
14cb : 49 80 __ EOR #$80
14cd : 85 1e __ STA ACCU + 3 
14cf : a5 1d __ LDA ACCU + 2 
14d1 : 30 ba __ BMI $148d ; (faddsub + 135)
14d3 : 05 1c __ ORA ACCU + 1 
14d5 : 05 1b __ ORA ACCU + 0 
14d7 : f0 0f __ BEQ $14e8 ; (faddsub + 226)
14d9 : c6 07 __ DEC WORK + 4 
14db : f0 0b __ BEQ $14e8 ; (faddsub + 226)
14dd : 06 1b __ ASL ACCU + 0 
14df : 26 1c __ ROL ACCU + 1 
14e1 : 26 1d __ ROL ACCU + 2 
14e3 : 10 f4 __ BPL $14d9 ; (faddsub + 211)
14e5 : 4c 8d 14 JMP $148d ; (faddsub + 135)
14e8 : a9 00 __ LDA #$00
14ea : 85 1b __ STA ACCU + 0 
14ec : 85 1c __ STA ACCU + 1 
14ee : 85 1d __ STA ACCU + 2 
14f0 : 85 1e __ STA ACCU + 3 
14f2 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
14f3 : a5 1b __ LDA ACCU + 0 
14f5 : 05 1c __ ORA ACCU + 1 
14f7 : 05 1d __ ORA ACCU + 2 
14f9 : f0 0e __ BEQ $1509 ; (crt_fmul + 22)
14fb : a5 03 __ LDA WORK + 0 
14fd : 05 04 __ ORA WORK + 1 
14ff : 05 05 __ ORA WORK + 2 
1501 : d0 09 __ BNE $150c ; (crt_fmul + 25)
1503 : 85 1b __ STA ACCU + 0 
1505 : 85 1c __ STA ACCU + 1 
1507 : 85 1d __ STA ACCU + 2 
1509 : 85 1e __ STA ACCU + 3 
150b : 60 __ __ RTS
150c : a5 1e __ LDA ACCU + 3 
150e : 45 06 __ EOR WORK + 3 
1510 : 29 80 __ AND #$80
1512 : 85 1e __ STA ACCU + 3 
1514 : a9 ff __ LDA #$ff
1516 : c5 07 __ CMP WORK + 4 
1518 : f0 42 __ BEQ $155c ; (crt_fmul + 105)
151a : c5 08 __ CMP WORK + 5 
151c : f0 3e __ BEQ $155c ; (crt_fmul + 105)
151e : a9 00 __ LDA #$00
1520 : 85 09 __ STA WORK + 6 
1522 : 85 0a __ STA WORK + 7 
1524 : 85 0b __ STA WORK + 8 
1526 : a4 1b __ LDY ACCU + 0 
1528 : a5 03 __ LDA WORK + 0 
152a : d0 06 __ BNE $1532 ; (crt_fmul + 63)
152c : a5 04 __ LDA WORK + 1 
152e : f0 0a __ BEQ $153a ; (crt_fmul + 71)
1530 : d0 05 __ BNE $1537 ; (crt_fmul + 68)
1532 : 20 8d 15 JSR $158d ; (crt_fmul8 + 0)
1535 : a5 04 __ LDA WORK + 1 
1537 : 20 8d 15 JSR $158d ; (crt_fmul8 + 0)
153a : a5 05 __ LDA WORK + 2 
153c : 20 8d 15 JSR $158d ; (crt_fmul8 + 0)
153f : 38 __ __ SEC
1540 : a5 0b __ LDA WORK + 8 
1542 : 30 06 __ BMI $154a ; (crt_fmul + 87)
1544 : 06 09 __ ASL WORK + 6 
1546 : 26 0a __ ROL WORK + 7 
1548 : 2a __ __ ROL
1549 : 18 __ __ CLC
154a : 29 7f __ AND #$7f
154c : 85 0b __ STA WORK + 8 
154e : a5 07 __ LDA WORK + 4 
1550 : 65 08 __ ADC WORK + 5 
1552 : 90 19 __ BCC $156d ; (crt_fmul + 122)
1554 : e9 7f __ SBC #$7f
1556 : b0 04 __ BCS $155c ; (crt_fmul + 105)
1558 : c9 ff __ CMP #$ff
155a : d0 15 __ BNE $1571 ; (crt_fmul + 126)
155c : a5 1e __ LDA ACCU + 3 
155e : 09 7f __ ORA #$7f
1560 : 85 1e __ STA ACCU + 3 
1562 : a9 80 __ LDA #$80
1564 : 85 1d __ STA ACCU + 2 
1566 : a9 00 __ LDA #$00
1568 : 85 1b __ STA ACCU + 0 
156a : 85 1c __ STA ACCU + 1 
156c : 60 __ __ RTS
156d : e9 7e __ SBC #$7e
156f : 90 15 __ BCC $1586 ; (crt_fmul + 147)
1571 : 4a __ __ LSR
1572 : 05 1e __ ORA ACCU + 3 
1574 : 85 1e __ STA ACCU + 3 
1576 : a9 00 __ LDA #$00
1578 : 6a __ __ ROR
1579 : 05 0b __ ORA WORK + 8 
157b : 85 1d __ STA ACCU + 2 
157d : a5 0a __ LDA WORK + 7 
157f : 85 1c __ STA ACCU + 1 
1581 : a5 09 __ LDA WORK + 6 
1583 : 85 1b __ STA ACCU + 0 
1585 : 60 __ __ RTS
1586 : a9 00 __ LDA #$00
1588 : 85 1e __ STA ACCU + 3 
158a : f0 d8 __ BEQ $1564 ; (crt_fmul + 113)
158c : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
158d : 38 __ __ SEC
158e : 6a __ __ ROR
158f : 90 1e __ BCC $15af ; (crt_fmul8 + 34)
1591 : aa __ __ TAX
1592 : 18 __ __ CLC
1593 : 98 __ __ TYA
1594 : 65 09 __ ADC WORK + 6 
1596 : 85 09 __ STA WORK + 6 
1598 : a5 0a __ LDA WORK + 7 
159a : 65 1c __ ADC ACCU + 1 
159c : 85 0a __ STA WORK + 7 
159e : a5 0b __ LDA WORK + 8 
15a0 : 65 1d __ ADC ACCU + 2 
15a2 : 6a __ __ ROR
15a3 : 85 0b __ STA WORK + 8 
15a5 : 8a __ __ TXA
15a6 : 66 0a __ ROR WORK + 7 
15a8 : 66 09 __ ROR WORK + 6 
15aa : 4a __ __ LSR
15ab : f0 0d __ BEQ $15ba ; (crt_fmul8 + 45)
15ad : b0 e2 __ BCS $1591 ; (crt_fmul8 + 4)
15af : 66 0b __ ROR WORK + 8 
15b1 : 66 0a __ ROR WORK + 7 
15b3 : 66 09 __ ROR WORK + 6 
15b5 : 4a __ __ LSR
15b6 : 90 f7 __ BCC $15af ; (crt_fmul8 + 34)
15b8 : d0 d7 __ BNE $1591 ; (crt_fmul8 + 4)
15ba : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
15bb : a5 1b __ LDA ACCU + 0 
15bd : 05 1c __ ORA ACCU + 1 
15bf : 05 1d __ ORA ACCU + 2 
15c1 : d0 03 __ BNE $15c6 ; (crt_fdiv + 11)
15c3 : 85 1e __ STA ACCU + 3 
15c5 : 60 __ __ RTS
15c6 : a5 1e __ LDA ACCU + 3 
15c8 : 45 06 __ EOR WORK + 3 
15ca : 29 80 __ AND #$80
15cc : 85 1e __ STA ACCU + 3 
15ce : a5 08 __ LDA WORK + 5 
15d0 : f0 62 __ BEQ $1634 ; (crt_fdiv + 121)
15d2 : a5 07 __ LDA WORK + 4 
15d4 : c9 ff __ CMP #$ff
15d6 : f0 5c __ BEQ $1634 ; (crt_fdiv + 121)
15d8 : a9 00 __ LDA #$00
15da : 85 09 __ STA WORK + 6 
15dc : 85 0a __ STA WORK + 7 
15de : 85 0b __ STA WORK + 8 
15e0 : a2 18 __ LDX #$18
15e2 : a5 1b __ LDA ACCU + 0 
15e4 : c5 03 __ CMP WORK + 0 
15e6 : a5 1c __ LDA ACCU + 1 
15e8 : e5 04 __ SBC WORK + 1 
15ea : a5 1d __ LDA ACCU + 2 
15ec : e5 05 __ SBC WORK + 2 
15ee : 90 13 __ BCC $1603 ; (crt_fdiv + 72)
15f0 : a5 1b __ LDA ACCU + 0 
15f2 : e5 03 __ SBC WORK + 0 
15f4 : 85 1b __ STA ACCU + 0 
15f6 : a5 1c __ LDA ACCU + 1 
15f8 : e5 04 __ SBC WORK + 1 
15fa : 85 1c __ STA ACCU + 1 
15fc : a5 1d __ LDA ACCU + 2 
15fe : e5 05 __ SBC WORK + 2 
1600 : 85 1d __ STA ACCU + 2 
1602 : 38 __ __ SEC
1603 : 26 09 __ ROL WORK + 6 
1605 : 26 0a __ ROL WORK + 7 
1607 : 26 0b __ ROL WORK + 8 
1609 : ca __ __ DEX
160a : f0 0a __ BEQ $1616 ; (crt_fdiv + 91)
160c : 06 1b __ ASL ACCU + 0 
160e : 26 1c __ ROL ACCU + 1 
1610 : 26 1d __ ROL ACCU + 2 
1612 : b0 dc __ BCS $15f0 ; (crt_fdiv + 53)
1614 : 90 cc __ BCC $15e2 ; (crt_fdiv + 39)
1616 : 38 __ __ SEC
1617 : a5 0b __ LDA WORK + 8 
1619 : 30 06 __ BMI $1621 ; (crt_fdiv + 102)
161b : 06 09 __ ASL WORK + 6 
161d : 26 0a __ ROL WORK + 7 
161f : 2a __ __ ROL
1620 : 18 __ __ CLC
1621 : 29 7f __ AND #$7f
1623 : 85 0b __ STA WORK + 8 
1625 : a5 07 __ LDA WORK + 4 
1627 : e5 08 __ SBC WORK + 5 
1629 : 90 1a __ BCC $1645 ; (crt_fdiv + 138)
162b : 18 __ __ CLC
162c : 69 7f __ ADC #$7f
162e : b0 04 __ BCS $1634 ; (crt_fdiv + 121)
1630 : c9 ff __ CMP #$ff
1632 : d0 15 __ BNE $1649 ; (crt_fdiv + 142)
1634 : a5 1e __ LDA ACCU + 3 
1636 : 09 7f __ ORA #$7f
1638 : 85 1e __ STA ACCU + 3 
163a : a9 80 __ LDA #$80
163c : 85 1d __ STA ACCU + 2 
163e : a9 00 __ LDA #$00
1640 : 85 1c __ STA ACCU + 1 
1642 : 85 1b __ STA ACCU + 0 
1644 : 60 __ __ RTS
1645 : 69 7f __ ADC #$7f
1647 : 90 15 __ BCC $165e ; (crt_fdiv + 163)
1649 : 4a __ __ LSR
164a : 05 1e __ ORA ACCU + 3 
164c : 85 1e __ STA ACCU + 3 
164e : a9 00 __ LDA #$00
1650 : 6a __ __ ROR
1651 : 05 0b __ ORA WORK + 8 
1653 : 85 1d __ STA ACCU + 2 
1655 : a5 0a __ LDA WORK + 7 
1657 : 85 1c __ STA ACCU + 1 
1659 : a5 09 __ LDA WORK + 6 
165b : 85 1b __ STA ACCU + 0 
165d : 60 __ __ RTS
165e : a9 00 __ LDA #$00
1660 : 85 1e __ STA ACCU + 3 
1662 : 85 1d __ STA ACCU + 2 
1664 : 85 1c __ STA ACCU + 1 
1666 : 85 1b __ STA ACCU + 0 
1668 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
1669 : 24 1e __ BIT ACCU + 3 
166b : 10 13 __ BPL $1680 ; (fround + 23)
166d : 30 6b __ BMI $16da ; (fround + 113)
166f : 24 1e __ BIT ACCU + 3 
1671 : 30 0d __ BMI $1680 ; (fround + 23)
1673 : 10 65 __ BPL $16da ; (fround + 113)
1675 : a9 00 __ LDA #$00
1677 : 85 1b __ STA ACCU + 0 
1679 : 85 1c __ STA ACCU + 1 
167b : 85 1d __ STA ACCU + 2 
167d : 85 1e __ STA ACCU + 3 
167f : 60 __ __ RTS
1680 : a5 07 __ LDA WORK + 4 
1682 : c9 7f __ CMP #$7f
1684 : 90 ef __ BCC $1675 ; (fround + 12)
1686 : c9 87 __ CMP #$87
1688 : 90 16 __ BCC $16a0 ; (fround + 55)
168a : c9 8f __ CMP #$8f
168c : 90 26 __ BCC $16b4 ; (fround + 75)
168e : c9 97 __ CMP #$97
1690 : b0 34 __ BCS $16c6 ; (fround + 93)
1692 : 38 __ __ SEC
1693 : e9 8f __ SBC #$8f
1695 : aa __ __ TAX
1696 : a5 1b __ LDA ACCU + 0 
1698 : 3d f7 17 AND $17f7,x ; (ubitmask[0] + 0)
169b : 85 1b __ STA ACCU + 0 
169d : 4c c6 16 JMP $16c6 ; (fround + 93)
16a0 : 38 __ __ SEC
16a1 : e9 7f __ SBC #$7f
16a3 : aa __ __ TAX
16a4 : a5 1d __ LDA ACCU + 2 
16a6 : 3d f7 17 AND $17f7,x ; (ubitmask[0] + 0)
16a9 : 85 1d __ STA ACCU + 2 
16ab : a9 00 __ LDA #$00
16ad : 85 1b __ STA ACCU + 0 
16af : 85 1c __ STA ACCU + 1 
16b1 : 4c c6 16 JMP $16c6 ; (fround + 93)
16b4 : 38 __ __ SEC
16b5 : e9 87 __ SBC #$87
16b7 : aa __ __ TAX
16b8 : a5 1c __ LDA ACCU + 1 
16ba : 3d f7 17 AND $17f7,x ; (ubitmask[0] + 0)
16bd : 85 1c __ STA ACCU + 1 
16bf : a9 00 __ LDA #$00
16c1 : 85 1b __ STA ACCU + 0 
16c3 : 4c c6 16 JMP $16c6 ; (fround + 93)
16c6 : 4c f6 13 JMP $13f6 ; (freg + 53)
16c9 : a9 7f __ LDA #$7f
16cb : 85 07 __ STA WORK + 4 
16cd : a9 00 __ LDA #$00
16cf : 85 1b __ STA ACCU + 0 
16d1 : 85 1c __ STA ACCU + 1 
16d3 : a9 80 __ LDA #$80
16d5 : 85 1d __ STA ACCU + 2 
16d7 : 4c f6 13 JMP $13f6 ; (freg + 53)
16da : a5 1b __ LDA ACCU + 0 
16dc : 05 1c __ ORA ACCU + 1 
16de : 05 1d __ ORA ACCU + 2 
16e0 : f0 93 __ BEQ $1675 ; (fround + 12)
16e2 : a5 07 __ LDA WORK + 4 
16e4 : c9 7f __ CMP #$7f
16e6 : 90 e1 __ BCC $16c9 ; (fround + 96)
16e8 : c9 87 __ CMP #$87
16ea : 90 2e __ BCC $171a ; (fround + 177)
16ec : c9 8f __ CMP #$8f
16ee : 90 4c __ BCC $173c ; (fround + 211)
16f0 : c9 97 __ CMP #$97
16f2 : b0 6c __ BCS $1760 ; (fround + 247)
16f4 : 38 __ __ SEC
16f5 : e9 8f __ SBC #$8f
16f7 : aa __ __ TAX
16f8 : 18 __ __ CLC
16f9 : bd f7 17 LDA $17f7,x ; (ubitmask[0] + 0)
16fc : 49 ff __ EOR #$ff
16fe : 65 1b __ ADC ACCU + 0 
1700 : 85 1b __ STA ACCU + 0 
1702 : a9 00 __ LDA #$00
1704 : 65 1c __ ADC ACCU + 1 
1706 : 85 1c __ STA ACCU + 1 
1708 : a9 00 __ LDA #$00
170a : 65 1d __ ADC ACCU + 2 
170c : 90 07 __ BCC $1715 ; (fround + 172)
170e : 6a __ __ ROR
170f : 66 1c __ ROR ACCU + 1 
1711 : 66 1b __ ROR ACCU + 0 
1713 : e6 07 __ INC WORK + 4 
1715 : 85 1d __ STA ACCU + 2 
1717 : 4c 80 16 JMP $1680 ; (fround + 23)
171a : 38 __ __ SEC
171b : e9 7f __ SBC #$7f
171d : aa __ __ TAX
171e : 18 __ __ CLC
171f : a9 ff __ LDA #$ff
1721 : 65 1b __ ADC ACCU + 0 
1723 : a9 ff __ LDA #$ff
1725 : 65 1c __ ADC ACCU + 1 
1727 : bd f7 17 LDA $17f7,x ; (ubitmask[0] + 0)
172a : 49 ff __ EOR #$ff
172c : 65 1d __ ADC ACCU + 2 
172e : 90 07 __ BCC $1737 ; (fround + 206)
1730 : 6a __ __ ROR
1731 : 66 1c __ ROR ACCU + 1 
1733 : 66 1b __ ROR ACCU + 0 
1735 : e6 07 __ INC WORK + 4 
1737 : 85 1d __ STA ACCU + 2 
1739 : 4c 80 16 JMP $1680 ; (fround + 23)
173c : 38 __ __ SEC
173d : e9 87 __ SBC #$87
173f : aa __ __ TAX
1740 : 18 __ __ CLC
1741 : a9 ff __ LDA #$ff
1743 : 65 1b __ ADC ACCU + 0 
1745 : bd f7 17 LDA $17f7,x ; (ubitmask[0] + 0)
1748 : 49 ff __ EOR #$ff
174a : 65 1c __ ADC ACCU + 1 
174c : 85 1c __ STA ACCU + 1 
174e : a9 00 __ LDA #$00
1750 : 65 1d __ ADC ACCU + 2 
1752 : 90 07 __ BCC $175b ; (fround + 242)
1754 : 6a __ __ ROR
1755 : 66 1c __ ROR ACCU + 1 
1757 : 66 1b __ ROR ACCU + 0 
1759 : e6 07 __ INC WORK + 4 
175b : 85 1d __ STA ACCU + 2 
175d : 4c 80 16 JMP $1680 ; (fround + 23)
1760 : 4c f6 13 JMP $13f6 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1763 : 20 e5 13 JSR $13e5 ; (freg + 36)
1766 : a5 07 __ LDA WORK + 4 
1768 : c9 7f __ CMP #$7f
176a : b0 07 __ BCS $1773 ; (f32_to_i16 + 16)
176c : a9 00 __ LDA #$00
176e : 85 1b __ STA ACCU + 0 
1770 : 85 1c __ STA ACCU + 1 
1772 : 60 __ __ RTS
1773 : e9 8e __ SBC #$8e
1775 : 90 16 __ BCC $178d ; (f32_to_i16 + 42)
1777 : 24 1e __ BIT ACCU + 3 
1779 : 30 09 __ BMI $1784 ; (f32_to_i16 + 33)
177b : a9 ff __ LDA #$ff
177d : 85 1b __ STA ACCU + 0 
177f : a9 7f __ LDA #$7f
1781 : 85 1c __ STA ACCU + 1 
1783 : 60 __ __ RTS
1784 : a9 00 __ LDA #$00
1786 : 85 1b __ STA ACCU + 0 
1788 : a9 80 __ LDA #$80
178a : 85 1c __ STA ACCU + 1 
178c : 60 __ __ RTS
178d : aa __ __ TAX
178e : a5 1c __ LDA ACCU + 1 
1790 : 46 1d __ LSR ACCU + 2 
1792 : 6a __ __ ROR
1793 : e8 __ __ INX
1794 : d0 fa __ BNE $1790 ; (f32_to_i16 + 45)
1796 : 24 1e __ BIT ACCU + 3 
1798 : 10 0e __ BPL $17a8 ; (f32_to_i16 + 69)
179a : 38 __ __ SEC
179b : 49 ff __ EOR #$ff
179d : 69 00 __ ADC #$00
179f : 85 1b __ STA ACCU + 0 
17a1 : a9 00 __ LDA #$00
17a3 : e5 1d __ SBC ACCU + 2 
17a5 : 85 1c __ STA ACCU + 1 
17a7 : 60 __ __ RTS
17a8 : 85 1b __ STA ACCU + 0 
17aa : a5 1d __ LDA ACCU + 2 
17ac : 85 1c __ STA ACCU + 1 
17ae : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
17af : 24 1c __ BIT ACCU + 1 
17b1 : 30 03 __ BMI $17b6 ; (sint16_to_float + 7)
17b3 : 4c cd 17 JMP $17cd ; (uint16_to_float + 0)
17b6 : 38 __ __ SEC
17b7 : a9 00 __ LDA #$00
17b9 : e5 1b __ SBC ACCU + 0 
17bb : 85 1b __ STA ACCU + 0 
17bd : a9 00 __ LDA #$00
17bf : e5 1c __ SBC ACCU + 1 
17c1 : 85 1c __ STA ACCU + 1 
17c3 : 20 cd 17 JSR $17cd ; (uint16_to_float + 0)
17c6 : a5 1e __ LDA ACCU + 3 
17c8 : 09 80 __ ORA #$80
17ca : 85 1e __ STA ACCU + 3 
17cc : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
17cd : a5 1b __ LDA ACCU + 0 
17cf : 05 1c __ ORA ACCU + 1 
17d1 : d0 05 __ BNE $17d8 ; (uint16_to_float + 11)
17d3 : 85 1d __ STA ACCU + 2 
17d5 : 85 1e __ STA ACCU + 3 
17d7 : 60 __ __ RTS
17d8 : a2 8e __ LDX #$8e
17da : a5 1c __ LDA ACCU + 1 
17dc : 30 06 __ BMI $17e4 ; (uint16_to_float + 23)
17de : ca __ __ DEX
17df : 06 1b __ ASL ACCU + 0 
17e1 : 2a __ __ ROL
17e2 : 10 fa __ BPL $17de ; (uint16_to_float + 17)
17e4 : 0a __ __ ASL
17e5 : 85 1d __ STA ACCU + 2 
17e7 : a5 1b __ LDA ACCU + 0 
17e9 : 85 1c __ STA ACCU + 1 
17eb : 8a __ __ TXA
17ec : 4a __ __ LSR
17ed : 85 1e __ STA ACCU + 3 
17ef : a9 00 __ LDA #$00
17f1 : 85 1b __ STA ACCU + 0 
17f3 : 66 1d __ ROR ACCU + 2 
17f5 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
17f6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ubitmask:
17f7 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
spriteset:
2000 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2010 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 38 c1 83 30 c1 83 24 : .........8..0..$
2020 : __ __ __ BYT c1 83 0c c1 83 1c c1 83 81 c1 83 ff c1 83 ff e1 : ................
2030 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2040 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2050 : __ __ __ BYT ff c1 83 ff c1 83 e7 c1 83 c7 c1 83 87 c1 83 e7 : ................
2060 : __ __ __ BYT c1 83 e7 c1 83 e7 c1 83 81 c1 83 ff c1 83 ff e1 : ................
2070 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2080 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2090 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 fc c1 83 c1 : .........<......
20a0 : __ __ __ BYT c1 83 9f c1 83 3f c1 83 00 c1 83 ff c1 83 ff e1 : .....?..........
20b0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
20c0 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
20d0 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 fc c1 83 e1 : .........<......
20e0 : __ __ __ BYT c1 83 fc c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : .....<..........
20f0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2100 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2110 : __ __ __ BYT ff c1 83 ff c1 83 c7 c1 83 9f c1 83 33 c1 83 33 : ............3..3
2120 : __ __ __ BYT c1 83 01 c1 83 f3 c1 83 f3 c1 83 ff c1 83 ff e1 : ................
2130 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2140 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2150 : __ __ __ BYT ff c1 83 ff c1 83 00 c1 83 3f c1 83 01 c1 83 fc : .........?......
2160 : __ __ __ BYT c1 83 fc c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : .....<..........
2170 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2180 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2190 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 3f c1 83 01 : .........<..?...
21a0 : __ __ __ BYT c1 83 3c c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : ..<..<..........
21b0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
21c0 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
21d0 : __ __ __ BYT ff c1 83 ff c1 83 00 c1 83 fc c1 83 f9 c1 83 f3 : ................
21e0 : __ __ __ BYT c1 83 e7 c1 83 e7 c1 83 e7 c1 83 ff c1 83 ff e1 : ................
21f0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2200 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2210 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 3c c1 83 81 : .........<..<...
2220 : __ __ __ BYT c1 83 3c c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : ..<..<..........
2230 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2240 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2250 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 3c c1 83 80 : .........<..<...
2260 : __ __ __ BYT c1 83 fc c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : .....<..........
2270 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2280 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2290 : __ __ __ BYT ff c1 83 ff c1 83 c3 c1 83 99 c1 83 3c c1 83 00 : ............<...
22a0 : __ __ __ BYT c1 83 3c c1 83 3c c1 83 3c c1 83 ff c1 83 ff e1 : ..<..<..<.......
22b0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
22c0 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
22d0 : __ __ __ BYT ff c1 83 ff c1 83 01 c1 83 3c c1 83 3c c1 83 01 : .........<..<...
22e0 : __ __ __ BYT c1 83 3c c1 83 3c c1 83 01 c1 83 ff c1 83 ff e1 : ..<..<..........
22f0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2300 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2310 : __ __ __ BYT ff c1 83 ff c1 83 81 c1 83 3c c1 83 3f c1 83 3f : .........<..?..?
2320 : __ __ __ BYT c1 83 3f c1 83 3c c1 83 81 c1 83 ff c1 83 ff e1 : ..?..<..........
2330 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2340 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2350 : __ __ __ BYT ff c1 83 ff c1 83 01 c1 83 3c c1 83 3c c1 83 3c : .........<..<..<
2360 : __ __ __ BYT c1 83 3c c1 83 3c c1 83 01 c1 83 ff c1 83 ff e1 : ..<..<..........
2370 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2380 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
2390 : __ __ __ BYT ff c1 83 ff c1 83 00 c1 83 3f c1 83 3f c1 83 07 : .........?..?...
23a0 : __ __ __ BYT c1 83 3f c1 83 3f c1 83 00 c1 83 ff c1 83 ff e1 : ..?..?..........
23b0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
23c0 : __ __ __ BYT 7f ff fe c0 00 03 a0 00 01 90 00 01 88 00 01 87 : ................
23d0 : __ __ __ BYT ff c1 83 ff c1 83 00 c1 83 3f c1 83 3f c1 83 07 : .........?..?...
23e0 : __ __ __ BYT c1 83 3f c1 83 3f c1 83 3f c1 83 ff c1 83 ff e1 : ..?..?..?.......
23f0 : __ __ __ BYT 80 00 11 80 00 09 80 00 05 c0 00 03 7f ff fe 00 : ................
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2450 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2470 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2480 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2490 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2510 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2530 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2550 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2570 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2580 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2590 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2620 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2630 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2640 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2650 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2660 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2670 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2680 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2690 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2750 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2770 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2790 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
sintab:
2800 : __ __ __ BSS	256
--------------------------------------------------------------------
rasterIRQRows:
2900 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
2911 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
2922 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
2933 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
2934 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
2944 : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
2954 : __ __ __ BSS	1
--------------------------------------------------------------------
vspriteScreen:
2955 : __ __ __ BSS	2
--------------------------------------------------------------------
synch:
2957 : __ __ __ BSS	32
--------------------------------------------------------------------
spriteOrder:
2977 : __ __ __ BSS	16
--------------------------------------------------------------------
vspriteYLow:
2987 : __ __ __ BSS	16
--------------------------------------------------------------------
vspriteXLow:
2997 : __ __ __ BSS	16
--------------------------------------------------------------------
vspriteXHigh:
29a7 : __ __ __ BSS	16
--------------------------------------------------------------------
vspriteImage:
29b7 : __ __ __ BSS	16
--------------------------------------------------------------------
vspriteColor:
29c7 : __ __ __ BSS	16
--------------------------------------------------------------------
spriteYPos:
29d7 : __ __ __ BSS	17
--------------------------------------------------------------------
rirq_pcount:
29e8 : __ __ __ BSS	1
--------------------------------------------------------------------
spirq:
2a00 : __ __ __ BSS	256
