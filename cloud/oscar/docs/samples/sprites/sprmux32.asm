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
080e : 8e e5 10 STX $10e5 ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 00 __ LDY #$00
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2c __ CPX #$2c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 a1 __ CPY #$a1
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
0843 : 20 00 0a JSR $0a00 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  57, "/home/honza/projects/c64/projects/oscar64/samples/sprites/sprmux32.c"
.s4:
0a00 : 78 __ __ SEI
0a01 : a9 7f __ LDA #$7f
0a03 : 8d 0d dc STA $dc0d 
0a06 : 8d 0d dd STA $dd0d 
0a09 : 8d 00 dc STA $dc00 
0a0c : a9 08 __ LDA #$08
0a0e : 8d 0e dc STA $dc0e 
0a11 : 8d 0f dc STA $dc0f 
0a14 : 8d 0e dd STA $dd0e 
0a17 : 8d 0f dd STA $dd0f 
0a1a : a9 00 __ LDA #$00
0a1c : 8d 03 dc STA $dc03 
0a1f : 8d 03 dd STA $dd03 
0a22 : a9 ff __ LDA #$ff
0a24 : 8d 02 dc STA $dc02 
0a27 : a9 07 __ LDA #$07
0a29 : 8d 00 dd STA $dd00 
0a2c : a9 3f __ LDA #$3f
0a2e : 8d 02 dd STA $dd02 
0a31 : ad 0d dc LDA $dc0d 
0a34 : ad 0d dd LDA $dd0d 
0a37 : a9 35 __ LDA #$35
0a39 : 85 01 __ STA $01 
0a3b : 20 88 10 JSR $1088 ; (rirq_init_io.s4 + 0)
0a3e : 20 5c 11 JSR $115c ; (vspr_init.s4 + 0)
0a41 : a9 20 __ LDA #$20
0a43 : 85 47 __ STA T1 + 0 
0a45 : a9 00 __ LDA #$00
0a47 : 0a __ __ ASL
0a48 : 26 47 __ ROL T1 + 0 
0a4a : 0a __ __ ASL
0a4b : 26 47 __ ROL T1 + 0 
0a4d : a9 dc __ LDA #$dc
0a4f : 85 10 __ STA P3 
0a51 : a9 1e __ LDA #$1e
0a53 : 85 0e __ STA P1 
0a55 : a9 00 __ LDA #$00
0a57 : 85 11 __ STA P4 
0a59 : 85 0d __ STA P0 
0a5b : 85 0f __ STA P2 
0a5d : 18 __ __ CLC
.l9:
0a5e : 29 0f __ AND #$0f
0a60 : 65 47 __ ADC T1 + 0 
0a62 : 85 12 __ STA P5 
0a64 : a5 0d __ LDA P0 
0a66 : 29 07 __ AND #$07
0a68 : 09 08 __ ORA #$08
0a6a : 85 13 __ STA P6 
0a6c : 20 a9 10 JSR $10a9 ; (vspr_set.s4 + 0)
0a6f : 18 __ __ CLC
0a70 : a5 0e __ LDA P1 
0a72 : 69 08 __ ADC #$08
0a74 : 85 0e __ STA P1 
0a76 : 90 02 __ BCC $0a7a ; (main.s11 + 0)
.s10:
0a78 : e6 0f __ INC P2 
.s11:
0a7a : 38 __ __ SEC
0a7b : a5 10 __ LDA P3 
0a7d : e9 04 __ SBC #$04
0a7f : 85 10 __ STA P3 
0a81 : e6 0d __ INC P0 
0a83 : a5 0d __ LDA P0 
0a85 : c9 20 __ CMP #$20
0a87 : 90 d5 __ BCC $0a5e ; (main.l9 + 0)
.s8:
0a89 : 20 e3 12 JSR $12e3 ; (vspr_sort.s4 + 0)
0a8c : 20 2c 13 JSR $132c ; (vspr_update.s4 + 0)
0a8f : 20 98 1a JSR $1a98 ; (rirq_sort.s4 + 0)
0a92 : 20 d3 10 JSR $10d3 ; (rirq_start.s4 + 0)
0a95 : a9 00 __ LDA #$00
0a97 : 85 4a __ STA T3 + 1 
0a99 : 8d 20 d0 STA $d020 
0a9c : 8d 21 d0 STA $d021 
0a9f : 85 48 __ STA T2 + 0 
0aa1 : a9 5b __ LDA #$5b
0aa3 : 85 49 __ STA T3 + 0 
.l5:
0aa5 : a6 48 __ LDX T2 + 0 
0aa7 : bd 00 1d LDA $1d00,x ; (sintab[0] + 0)
0aaa : 18 __ __ CLC
0aab : 69 8c __ ADC #$8c
0aad : 8d d3 2b STA $2bd3 ; (vspriteYLow[0] + 0)
0ab0 : bd 00 1c LDA $1c00,x ; (costab[0] + 0)
0ab3 : 49 80 __ EOR #$80
0ab5 : 18 __ __ CLC
0ab6 : 69 2a __ ADC #$2a
0ab8 : 8d 00 2c STA $2c00 ; (vspriteXLow[0] + 0)
0abb : a9 00 __ LDA #$00
0abd : 2a __ __ ROL
0abe : 8d 20 2c STA $2c20 ; (vspriteXHigh[0] + 0)
0ac1 : 8a __ __ TXA
0ac2 : 69 08 __ ADC #$08
0ac4 : a8 __ __ TAY
0ac5 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0ac8 : 18 __ __ CLC
0ac9 : 69 8c __ ADC #$8c
0acb : 8d d4 2b STA $2bd4 ; (vspriteYLow[0] + 1)
0ace : 8a __ __ TXA
0acf : 18 __ __ CLC
0ad0 : 65 4a __ ADC T3 + 1 
0ad2 : aa __ __ TAX
0ad3 : 18 __ __ CLC
0ad4 : 69 08 __ ADC #$08
0ad6 : a8 __ __ TAY
0ad7 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0ada : 49 80 __ EOR #$80
0adc : 18 __ __ CLC
0add : 69 2a __ ADC #$2a
0adf : 8d 01 2c STA $2c01 ; (vspriteXLow[0] + 1)
0ae2 : a9 00 __ LDA #$00
0ae4 : 2a __ __ ROL
0ae5 : 8d 21 2c STA $2c21 ; (vspriteXHigh[0] + 1)
0ae8 : a5 48 __ LDA T2 + 0 
0aea : 69 10 __ ADC #$10
0aec : a8 __ __ TAY
0aed : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0af0 : 18 __ __ CLC
0af1 : 69 8c __ ADC #$8c
0af3 : 8d d5 2b STA $2bd5 ; (vspriteYLow[0] + 2)
0af6 : a5 49 __ LDA T3 + 0 
0af8 : 0a __ __ ASL
0af9 : 85 43 __ STA T0 + 0 
0afb : 8a __ __ TXA
0afc : 65 4a __ ADC T3 + 1 
0afe : aa __ __ TAX
0aff : 18 __ __ CLC
0b00 : 69 10 __ ADC #$10
0b02 : a8 __ __ TAY
0b03 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0b06 : 49 80 __ EOR #$80
0b08 : 18 __ __ CLC
0b09 : 69 2a __ ADC #$2a
0b0b : 8d 02 2c STA $2c02 ; (vspriteXLow[0] + 2)
0b0e : a9 00 __ LDA #$00
0b10 : 2a __ __ ROL
0b11 : 8d 22 2c STA $2c22 ; (vspriteXHigh[0] + 2)
0b14 : a5 48 __ LDA T2 + 0 
0b16 : 69 18 __ ADC #$18
0b18 : a8 __ __ TAY
0b19 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0b1c : 18 __ __ CLC
0b1d : 69 8c __ ADC #$8c
0b1f : 8d d6 2b STA $2bd6 ; (vspriteYLow[0] + 3)
0b22 : 18 __ __ CLC
0b23 : a5 43 __ LDA T0 + 0 
0b25 : 65 49 __ ADC T3 + 0 
0b27 : 85 43 __ STA T0 + 0 
0b29 : 8a __ __ TXA
0b2a : 65 4a __ ADC T3 + 1 
0b2c : aa __ __ TAX
0b2d : 18 __ __ CLC
0b2e : 69 18 __ ADC #$18
0b30 : a8 __ __ TAY
0b31 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0b34 : 49 80 __ EOR #$80
0b36 : 18 __ __ CLC
0b37 : 69 2a __ ADC #$2a
0b39 : 8d 03 2c STA $2c03 ; (vspriteXLow[0] + 3)
0b3c : a9 00 __ LDA #$00
0b3e : 2a __ __ ROL
0b3f : 8d 23 2c STA $2c23 ; (vspriteXHigh[0] + 3)
0b42 : a5 48 __ LDA T2 + 0 
0b44 : 69 20 __ ADC #$20
0b46 : a8 __ __ TAY
0b47 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0b4a : 18 __ __ CLC
0b4b : 69 8c __ ADC #$8c
0b4d : 8d d7 2b STA $2bd7 ; (vspriteYLow[0] + 4)
0b50 : 18 __ __ CLC
0b51 : a5 43 __ LDA T0 + 0 
0b53 : 65 49 __ ADC T3 + 0 
0b55 : 85 43 __ STA T0 + 0 
0b57 : 8a __ __ TXA
0b58 : 65 4a __ ADC T3 + 1 
0b5a : aa __ __ TAX
0b5b : 18 __ __ CLC
0b5c : 69 20 __ ADC #$20
0b5e : a8 __ __ TAY
0b5f : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0b62 : 49 80 __ EOR #$80
0b64 : 18 __ __ CLC
0b65 : 69 2a __ ADC #$2a
0b67 : 8d 04 2c STA $2c04 ; (vspriteXLow[0] + 4)
0b6a : a9 00 __ LDA #$00
0b6c : 2a __ __ ROL
0b6d : 8d 24 2c STA $2c24 ; (vspriteXHigh[0] + 4)
0b70 : a5 48 __ LDA T2 + 0 
0b72 : 69 28 __ ADC #$28
0b74 : a8 __ __ TAY
0b75 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0b78 : 18 __ __ CLC
0b79 : 69 8c __ ADC #$8c
0b7b : 8d d8 2b STA $2bd8 ; (vspriteYLow[0] + 5)
0b7e : 18 __ __ CLC
0b7f : a5 43 __ LDA T0 + 0 
0b81 : 65 49 __ ADC T3 + 0 
0b83 : 85 43 __ STA T0 + 0 
0b85 : 8a __ __ TXA
0b86 : 65 4a __ ADC T3 + 1 
0b88 : aa __ __ TAX
0b89 : 18 __ __ CLC
0b8a : 69 28 __ ADC #$28
0b8c : a8 __ __ TAY
0b8d : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0b90 : 49 80 __ EOR #$80
0b92 : 18 __ __ CLC
0b93 : 69 2a __ ADC #$2a
0b95 : 8d 05 2c STA $2c05 ; (vspriteXLow[0] + 5)
0b98 : a9 00 __ LDA #$00
0b9a : 2a __ __ ROL
0b9b : 8d 25 2c STA $2c25 ; (vspriteXHigh[0] + 5)
0b9e : a5 48 __ LDA T2 + 0 
0ba0 : 69 30 __ ADC #$30
0ba2 : a8 __ __ TAY
0ba3 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0ba6 : 18 __ __ CLC
0ba7 : 69 8c __ ADC #$8c
0ba9 : 8d d9 2b STA $2bd9 ; (vspriteYLow[0] + 6)
0bac : 18 __ __ CLC
0bad : a5 43 __ LDA T0 + 0 
0baf : 65 49 __ ADC T3 + 0 
0bb1 : 85 43 __ STA T0 + 0 
0bb3 : 8a __ __ TXA
0bb4 : 65 4a __ ADC T3 + 1 
0bb6 : aa __ __ TAX
0bb7 : 18 __ __ CLC
0bb8 : 69 30 __ ADC #$30
0bba : a8 __ __ TAY
0bbb : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0bbe : 49 80 __ EOR #$80
0bc0 : 18 __ __ CLC
0bc1 : 69 2a __ ADC #$2a
0bc3 : 8d 06 2c STA $2c06 ; (vspriteXLow[0] + 6)
0bc6 : a9 00 __ LDA #$00
0bc8 : 2a __ __ ROL
0bc9 : 8d 26 2c STA $2c26 ; (vspriteXHigh[0] + 6)
0bcc : a5 48 __ LDA T2 + 0 
0bce : 69 38 __ ADC #$38
0bd0 : a8 __ __ TAY
0bd1 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0bd4 : 18 __ __ CLC
0bd5 : 69 8c __ ADC #$8c
0bd7 : 8d da 2b STA $2bda ; (vspriteYLow[0] + 7)
0bda : 18 __ __ CLC
0bdb : a5 43 __ LDA T0 + 0 
0bdd : 65 49 __ ADC T3 + 0 
0bdf : 85 43 __ STA T0 + 0 
0be1 : 8a __ __ TXA
0be2 : 65 4a __ ADC T3 + 1 
0be4 : aa __ __ TAX
0be5 : 18 __ __ CLC
0be6 : 69 38 __ ADC #$38
0be8 : a8 __ __ TAY
0be9 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0bec : 49 80 __ EOR #$80
0bee : 18 __ __ CLC
0bef : 69 2a __ ADC #$2a
0bf1 : 8d 07 2c STA $2c07 ; (vspriteXLow[0] + 7)
0bf4 : a9 00 __ LDA #$00
0bf6 : 2a __ __ ROL
0bf7 : 8d 27 2c STA $2c27 ; (vspriteXHigh[0] + 7)
0bfa : a5 48 __ LDA T2 + 0 
0bfc : 69 40 __ ADC #$40
0bfe : a8 __ __ TAY
0bff : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0c02 : 18 __ __ CLC
0c03 : 69 8c __ ADC #$8c
0c05 : 8d db 2b STA $2bdb ; (vspriteYLow[0] + 8)
0c08 : 18 __ __ CLC
0c09 : a5 43 __ LDA T0 + 0 
0c0b : 65 49 __ ADC T3 + 0 
0c0d : 85 43 __ STA T0 + 0 
0c0f : 8a __ __ TXA
0c10 : 65 4a __ ADC T3 + 1 
0c12 : aa __ __ TAX
0c13 : 18 __ __ CLC
0c14 : 69 40 __ ADC #$40
0c16 : a8 __ __ TAY
0c17 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0c1a : 49 80 __ EOR #$80
0c1c : 18 __ __ CLC
0c1d : 69 2a __ ADC #$2a
0c1f : 8d 08 2c STA $2c08 ; (vspriteXLow[0] + 8)
0c22 : a9 00 __ LDA #$00
0c24 : 2a __ __ ROL
0c25 : 8d 28 2c STA $2c28 ; (vspriteXHigh[0] + 8)
0c28 : a5 48 __ LDA T2 + 0 
0c2a : 69 48 __ ADC #$48
0c2c : a8 __ __ TAY
0c2d : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0c30 : 18 __ __ CLC
0c31 : 69 8c __ ADC #$8c
0c33 : 8d dc 2b STA $2bdc ; (vspriteYLow[0] + 9)
0c36 : 18 __ __ CLC
0c37 : a5 43 __ LDA T0 + 0 
0c39 : 65 49 __ ADC T3 + 0 
0c3b : 85 43 __ STA T0 + 0 
0c3d : 8a __ __ TXA
0c3e : 65 4a __ ADC T3 + 1 
0c40 : aa __ __ TAX
0c41 : 18 __ __ CLC
0c42 : 69 48 __ ADC #$48
0c44 : a8 __ __ TAY
0c45 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0c48 : 49 80 __ EOR #$80
0c4a : 18 __ __ CLC
0c4b : 69 2a __ ADC #$2a
0c4d : 8d 09 2c STA $2c09 ; (vspriteXLow[0] + 9)
0c50 : a9 00 __ LDA #$00
0c52 : 2a __ __ ROL
0c53 : 8d 29 2c STA $2c29 ; (vspriteXHigh[0] + 9)
0c56 : a5 48 __ LDA T2 + 0 
0c58 : 69 50 __ ADC #$50
0c5a : a8 __ __ TAY
0c5b : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0c5e : 18 __ __ CLC
0c5f : 69 8c __ ADC #$8c
0c61 : 8d dd 2b STA $2bdd ; (vspriteYLow[0] + 10)
0c64 : 18 __ __ CLC
0c65 : a5 43 __ LDA T0 + 0 
0c67 : 65 49 __ ADC T3 + 0 
0c69 : 85 43 __ STA T0 + 0 
0c6b : 8a __ __ TXA
0c6c : 65 4a __ ADC T3 + 1 
0c6e : aa __ __ TAX
0c6f : 18 __ __ CLC
0c70 : 69 50 __ ADC #$50
0c72 : a8 __ __ TAY
0c73 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0c76 : 49 80 __ EOR #$80
0c78 : 18 __ __ CLC
0c79 : 69 2a __ ADC #$2a
0c7b : 8d 0a 2c STA $2c0a ; (vspriteXLow[0] + 10)
0c7e : a9 00 __ LDA #$00
0c80 : 2a __ __ ROL
0c81 : 8d 2a 2c STA $2c2a ; (vspriteXHigh[0] + 10)
0c84 : a5 48 __ LDA T2 + 0 
0c86 : 69 58 __ ADC #$58
0c88 : a8 __ __ TAY
0c89 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0c8c : 18 __ __ CLC
0c8d : 69 8c __ ADC #$8c
0c8f : 8d de 2b STA $2bde ; (vspriteYLow[0] + 11)
0c92 : 18 __ __ CLC
0c93 : a5 43 __ LDA T0 + 0 
0c95 : 65 49 __ ADC T3 + 0 
0c97 : 85 43 __ STA T0 + 0 
0c99 : 8a __ __ TXA
0c9a : 65 4a __ ADC T3 + 1 
0c9c : aa __ __ TAX
0c9d : 18 __ __ CLC
0c9e : 69 58 __ ADC #$58
0ca0 : a8 __ __ TAY
0ca1 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0ca4 : 49 80 __ EOR #$80
0ca6 : 18 __ __ CLC
0ca7 : 69 2a __ ADC #$2a
0ca9 : 8d 0b 2c STA $2c0b ; (vspriteXLow[0] + 11)
0cac : a9 00 __ LDA #$00
0cae : 2a __ __ ROL
0caf : 8d 2b 2c STA $2c2b ; (vspriteXHigh[0] + 11)
0cb2 : a5 48 __ LDA T2 + 0 
0cb4 : 69 60 __ ADC #$60
0cb6 : a8 __ __ TAY
0cb7 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0cba : 18 __ __ CLC
0cbb : 69 8c __ ADC #$8c
0cbd : 8d df 2b STA $2bdf ; (vspriteYLow[0] + 12)
0cc0 : 18 __ __ CLC
0cc1 : a5 43 __ LDA T0 + 0 
0cc3 : 65 49 __ ADC T3 + 0 
0cc5 : 85 43 __ STA T0 + 0 
0cc7 : 8a __ __ TXA
0cc8 : 65 4a __ ADC T3 + 1 
0cca : aa __ __ TAX
0ccb : 18 __ __ CLC
0ccc : 69 60 __ ADC #$60
0cce : a8 __ __ TAY
0ccf : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0cd2 : 49 80 __ EOR #$80
0cd4 : 18 __ __ CLC
0cd5 : 69 2a __ ADC #$2a
0cd7 : 8d 0c 2c STA $2c0c ; (vspriteXLow[0] + 12)
0cda : a9 00 __ LDA #$00
0cdc : 2a __ __ ROL
0cdd : 8d 2c 2c STA $2c2c ; (vspriteXHigh[0] + 12)
0ce0 : a5 48 __ LDA T2 + 0 
0ce2 : 69 68 __ ADC #$68
0ce4 : a8 __ __ TAY
0ce5 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0ce8 : 18 __ __ CLC
0ce9 : 69 8c __ ADC #$8c
0ceb : 8d e0 2b STA $2be0 ; (vspriteYLow[0] + 13)
0cee : 18 __ __ CLC
0cef : a5 43 __ LDA T0 + 0 
0cf1 : 65 49 __ ADC T3 + 0 
0cf3 : 85 43 __ STA T0 + 0 
0cf5 : 8a __ __ TXA
0cf6 : 65 4a __ ADC T3 + 1 
0cf8 : aa __ __ TAX
0cf9 : 18 __ __ CLC
0cfa : 69 68 __ ADC #$68
0cfc : a8 __ __ TAY
0cfd : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0d00 : 49 80 __ EOR #$80
0d02 : 18 __ __ CLC
0d03 : 69 2a __ ADC #$2a
0d05 : 8d 0d 2c STA $2c0d ; (vspriteXLow[0] + 13)
0d08 : a9 00 __ LDA #$00
0d0a : 2a __ __ ROL
0d0b : 8d 2d 2c STA $2c2d ; (vspriteXHigh[0] + 13)
0d0e : a5 48 __ LDA T2 + 0 
0d10 : 69 70 __ ADC #$70
0d12 : a8 __ __ TAY
0d13 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0d16 : 18 __ __ CLC
0d17 : 69 8c __ ADC #$8c
0d19 : 8d e1 2b STA $2be1 ; (vspriteYLow[0] + 14)
0d1c : 18 __ __ CLC
0d1d : a5 43 __ LDA T0 + 0 
0d1f : 65 49 __ ADC T3 + 0 
0d21 : 85 43 __ STA T0 + 0 
0d23 : 8a __ __ TXA
0d24 : 65 4a __ ADC T3 + 1 
0d26 : aa __ __ TAX
0d27 : 18 __ __ CLC
0d28 : 69 70 __ ADC #$70
0d2a : a8 __ __ TAY
0d2b : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0d2e : 49 80 __ EOR #$80
0d30 : 18 __ __ CLC
0d31 : 69 2a __ ADC #$2a
0d33 : 8d 0e 2c STA $2c0e ; (vspriteXLow[0] + 14)
0d36 : a9 00 __ LDA #$00
0d38 : 2a __ __ ROL
0d39 : 8d 2e 2c STA $2c2e ; (vspriteXHigh[0] + 14)
0d3c : a5 48 __ LDA T2 + 0 
0d3e : 69 78 __ ADC #$78
0d40 : a8 __ __ TAY
0d41 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0d44 : 18 __ __ CLC
0d45 : 69 8c __ ADC #$8c
0d47 : 8d e2 2b STA $2be2 ; (vspriteYLow[0] + 15)
0d4a : 18 __ __ CLC
0d4b : a5 43 __ LDA T0 + 0 
0d4d : 65 49 __ ADC T3 + 0 
0d4f : 85 43 __ STA T0 + 0 
0d51 : 8a __ __ TXA
0d52 : 65 4a __ ADC T3 + 1 
0d54 : aa __ __ TAX
0d55 : 18 __ __ CLC
0d56 : 69 78 __ ADC #$78
0d58 : a8 __ __ TAY
0d59 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0d5c : 49 80 __ EOR #$80
0d5e : 18 __ __ CLC
0d5f : 69 2a __ ADC #$2a
0d61 : 8d 0f 2c STA $2c0f ; (vspriteXLow[0] + 15)
0d64 : a9 00 __ LDA #$00
0d66 : 2a __ __ ROL
0d67 : 8d 2f 2c STA $2c2f ; (vspriteXHigh[0] + 15)
0d6a : a5 48 __ LDA T2 + 0 
0d6c : 69 80 __ ADC #$80
0d6e : a8 __ __ TAY
0d6f : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0d72 : 18 __ __ CLC
0d73 : 69 8c __ ADC #$8c
0d75 : 8d e3 2b STA $2be3 ; (vspriteYLow[0] + 16)
0d78 : 18 __ __ CLC
0d79 : a5 43 __ LDA T0 + 0 
0d7b : 65 49 __ ADC T3 + 0 
0d7d : 85 43 __ STA T0 + 0 
0d7f : 8a __ __ TXA
0d80 : 65 4a __ ADC T3 + 1 
0d82 : aa __ __ TAX
0d83 : 49 80 __ EOR #$80
0d85 : a8 __ __ TAY
0d86 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0d89 : 49 80 __ EOR #$80
0d8b : 18 __ __ CLC
0d8c : 69 2a __ ADC #$2a
0d8e : 8d 10 2c STA $2c10 ; (vspriteXLow[0] + 16)
0d91 : a9 00 __ LDA #$00
0d93 : 2a __ __ ROL
0d94 : 8d 30 2c STA $2c30 ; (vspriteXHigh[0] + 16)
0d97 : a5 48 __ LDA T2 + 0 
0d99 : 69 88 __ ADC #$88
0d9b : a8 __ __ TAY
0d9c : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0d9f : 18 __ __ CLC
0da0 : 69 8c __ ADC #$8c
0da2 : 8d e4 2b STA $2be4 ; (vspriteYLow[0] + 17)
0da5 : 18 __ __ CLC
0da6 : a5 43 __ LDA T0 + 0 
0da8 : 65 49 __ ADC T3 + 0 
0daa : 85 43 __ STA T0 + 0 
0dac : 8a __ __ TXA
0dad : 65 4a __ ADC T3 + 1 
0daf : aa __ __ TAX
0db0 : 18 __ __ CLC
0db1 : 69 88 __ ADC #$88
0db3 : a8 __ __ TAY
0db4 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0db7 : 49 80 __ EOR #$80
0db9 : 18 __ __ CLC
0dba : 69 2a __ ADC #$2a
0dbc : 8d 11 2c STA $2c11 ; (vspriteXLow[0] + 17)
0dbf : a9 00 __ LDA #$00
0dc1 : 2a __ __ ROL
0dc2 : 8d 31 2c STA $2c31 ; (vspriteXHigh[0] + 17)
0dc5 : a5 48 __ LDA T2 + 0 
0dc7 : 69 90 __ ADC #$90
0dc9 : a8 __ __ TAY
0dca : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0dcd : 18 __ __ CLC
0dce : 69 8c __ ADC #$8c
0dd0 : 8d e5 2b STA $2be5 ; (vspriteYLow[0] + 18)
0dd3 : 18 __ __ CLC
0dd4 : a5 43 __ LDA T0 + 0 
0dd6 : 65 49 __ ADC T3 + 0 
0dd8 : 85 43 __ STA T0 + 0 
0dda : 8a __ __ TXA
0ddb : 65 4a __ ADC T3 + 1 
0ddd : aa __ __ TAX
0dde : 18 __ __ CLC
0ddf : 69 90 __ ADC #$90
0de1 : a8 __ __ TAY
0de2 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0de5 : 49 80 __ EOR #$80
0de7 : 18 __ __ CLC
0de8 : 69 2a __ ADC #$2a
0dea : 8d 12 2c STA $2c12 ; (vspriteXLow[0] + 18)
0ded : a9 00 __ LDA #$00
0def : 2a __ __ ROL
0df0 : 8d 32 2c STA $2c32 ; (vspriteXHigh[0] + 18)
0df3 : a5 48 __ LDA T2 + 0 
0df5 : 69 98 __ ADC #$98
0df7 : a8 __ __ TAY
0df8 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0dfb : 18 __ __ CLC
0dfc : 69 8c __ ADC #$8c
0dfe : 8d e6 2b STA $2be6 ; (vspriteYLow[0] + 19)
0e01 : 18 __ __ CLC
0e02 : a5 43 __ LDA T0 + 0 
0e04 : 65 49 __ ADC T3 + 0 
0e06 : 85 43 __ STA T0 + 0 
0e08 : 8a __ __ TXA
0e09 : 65 4a __ ADC T3 + 1 
0e0b : aa __ __ TAX
0e0c : 18 __ __ CLC
0e0d : 69 98 __ ADC #$98
0e0f : a8 __ __ TAY
0e10 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0e13 : 49 80 __ EOR #$80
0e15 : 18 __ __ CLC
0e16 : 69 2a __ ADC #$2a
0e18 : 8d 13 2c STA $2c13 ; (vspriteXLow[0] + 19)
0e1b : a9 00 __ LDA #$00
0e1d : 2a __ __ ROL
0e1e : 8d 33 2c STA $2c33 ; (vspriteXHigh[0] + 19)
0e21 : a5 48 __ LDA T2 + 0 
0e23 : 69 a0 __ ADC #$a0
0e25 : a8 __ __ TAY
0e26 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0e29 : 18 __ __ CLC
0e2a : 69 8c __ ADC #$8c
0e2c : 8d e7 2b STA $2be7 ; (vspriteYLow[0] + 20)
0e2f : 18 __ __ CLC
0e30 : a5 43 __ LDA T0 + 0 
0e32 : 65 49 __ ADC T3 + 0 
0e34 : 85 43 __ STA T0 + 0 
0e36 : 8a __ __ TXA
0e37 : 65 4a __ ADC T3 + 1 
0e39 : aa __ __ TAX
0e3a : 18 __ __ CLC
0e3b : 69 a0 __ ADC #$a0
0e3d : a8 __ __ TAY
0e3e : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0e41 : 49 80 __ EOR #$80
0e43 : 18 __ __ CLC
0e44 : 69 2a __ ADC #$2a
0e46 : 8d 14 2c STA $2c14 ; (vspriteXLow[0] + 20)
0e49 : a9 00 __ LDA #$00
0e4b : 2a __ __ ROL
0e4c : 8d 34 2c STA $2c34 ; (vspriteXHigh[0] + 20)
0e4f : a5 48 __ LDA T2 + 0 
0e51 : 69 a8 __ ADC #$a8
0e53 : a8 __ __ TAY
0e54 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0e57 : 18 __ __ CLC
0e58 : 69 8c __ ADC #$8c
0e5a : 8d e8 2b STA $2be8 ; (vspriteYLow[0] + 21)
0e5d : 18 __ __ CLC
0e5e : a5 43 __ LDA T0 + 0 
0e60 : 65 49 __ ADC T3 + 0 
0e62 : 85 43 __ STA T0 + 0 
0e64 : 8a __ __ TXA
0e65 : 65 4a __ ADC T3 + 1 
0e67 : aa __ __ TAX
0e68 : 18 __ __ CLC
0e69 : 69 a8 __ ADC #$a8
0e6b : a8 __ __ TAY
0e6c : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0e6f : 49 80 __ EOR #$80
0e71 : 18 __ __ CLC
0e72 : 69 2a __ ADC #$2a
0e74 : 8d 15 2c STA $2c15 ; (vspriteXLow[0] + 21)
0e77 : a9 00 __ LDA #$00
0e79 : 2a __ __ ROL
0e7a : 8d 35 2c STA $2c35 ; (vspriteXHigh[0] + 21)
0e7d : a5 48 __ LDA T2 + 0 
0e7f : 69 b0 __ ADC #$b0
0e81 : a8 __ __ TAY
0e82 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0e85 : 18 __ __ CLC
0e86 : 69 8c __ ADC #$8c
0e88 : 8d e9 2b STA $2be9 ; (vspriteYLow[0] + 22)
0e8b : 18 __ __ CLC
0e8c : a5 43 __ LDA T0 + 0 
0e8e : 65 49 __ ADC T3 + 0 
0e90 : 85 43 __ STA T0 + 0 
0e92 : 8a __ __ TXA
0e93 : 65 4a __ ADC T3 + 1 
0e95 : aa __ __ TAX
0e96 : 18 __ __ CLC
0e97 : 69 b0 __ ADC #$b0
0e99 : a8 __ __ TAY
0e9a : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0e9d : 49 80 __ EOR #$80
0e9f : 18 __ __ CLC
0ea0 : 69 2a __ ADC #$2a
0ea2 : 8d 16 2c STA $2c16 ; (vspriteXLow[0] + 22)
0ea5 : a9 00 __ LDA #$00
0ea7 : 2a __ __ ROL
0ea8 : 8d 36 2c STA $2c36 ; (vspriteXHigh[0] + 22)
0eab : a5 48 __ LDA T2 + 0 
0ead : 69 b8 __ ADC #$b8
0eaf : a8 __ __ TAY
0eb0 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0eb3 : 18 __ __ CLC
0eb4 : 69 8c __ ADC #$8c
0eb6 : 8d ea 2b STA $2bea ; (vspriteYLow[0] + 23)
0eb9 : 18 __ __ CLC
0eba : a5 43 __ LDA T0 + 0 
0ebc : 65 49 __ ADC T3 + 0 
0ebe : 85 43 __ STA T0 + 0 
0ec0 : 8a __ __ TXA
0ec1 : 65 4a __ ADC T3 + 1 
0ec3 : aa __ __ TAX
0ec4 : 18 __ __ CLC
0ec5 : 69 b8 __ ADC #$b8
0ec7 : a8 __ __ TAY
0ec8 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0ecb : 49 80 __ EOR #$80
0ecd : 18 __ __ CLC
0ece : 69 2a __ ADC #$2a
0ed0 : 8d 17 2c STA $2c17 ; (vspriteXLow[0] + 23)
0ed3 : a9 00 __ LDA #$00
0ed5 : 2a __ __ ROL
0ed6 : 8d 37 2c STA $2c37 ; (vspriteXHigh[0] + 23)
0ed9 : a5 48 __ LDA T2 + 0 
0edb : 69 c0 __ ADC #$c0
0edd : a8 __ __ TAY
0ede : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0ee1 : 18 __ __ CLC
0ee2 : 69 8c __ ADC #$8c
0ee4 : 8d eb 2b STA $2beb ; (vspriteYLow[0] + 24)
0ee7 : 18 __ __ CLC
0ee8 : a5 43 __ LDA T0 + 0 
0eea : 65 49 __ ADC T3 + 0 
0eec : 85 43 __ STA T0 + 0 
0eee : 8a __ __ TXA
0eef : 65 4a __ ADC T3 + 1 
0ef1 : aa __ __ TAX
0ef2 : 18 __ __ CLC
0ef3 : 69 c0 __ ADC #$c0
0ef5 : a8 __ __ TAY
0ef6 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0ef9 : 49 80 __ EOR #$80
0efb : 18 __ __ CLC
0efc : 69 2a __ ADC #$2a
0efe : 8d 18 2c STA $2c18 ; (vspriteXLow[0] + 24)
0f01 : a9 00 __ LDA #$00
0f03 : 2a __ __ ROL
0f04 : 8d 38 2c STA $2c38 ; (vspriteXHigh[0] + 24)
0f07 : a5 48 __ LDA T2 + 0 
0f09 : 69 c8 __ ADC #$c8
0f0b : a8 __ __ TAY
0f0c : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0f0f : 18 __ __ CLC
0f10 : 69 8c __ ADC #$8c
0f12 : 8d ec 2b STA $2bec ; (vspriteYLow[0] + 25)
0f15 : 18 __ __ CLC
0f16 : a5 43 __ LDA T0 + 0 
0f18 : 65 49 __ ADC T3 + 0 
0f1a : 85 43 __ STA T0 + 0 
0f1c : 8a __ __ TXA
0f1d : 65 4a __ ADC T3 + 1 
0f1f : aa __ __ TAX
0f20 : 18 __ __ CLC
0f21 : 69 c8 __ ADC #$c8
0f23 : a8 __ __ TAY
0f24 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0f27 : 49 80 __ EOR #$80
0f29 : 18 __ __ CLC
0f2a : 69 2a __ ADC #$2a
0f2c : 8d 19 2c STA $2c19 ; (vspriteXLow[0] + 25)
0f2f : a9 00 __ LDA #$00
0f31 : 2a __ __ ROL
0f32 : 8d 39 2c STA $2c39 ; (vspriteXHigh[0] + 25)
0f35 : a5 48 __ LDA T2 + 0 
0f37 : 69 d0 __ ADC #$d0
0f39 : a8 __ __ TAY
0f3a : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0f3d : 18 __ __ CLC
0f3e : 69 8c __ ADC #$8c
0f40 : 8d ed 2b STA $2bed ; (vspriteYLow[0] + 26)
0f43 : 18 __ __ CLC
0f44 : a5 43 __ LDA T0 + 0 
0f46 : 65 49 __ ADC T3 + 0 
0f48 : 85 43 __ STA T0 + 0 
0f4a : 8a __ __ TXA
0f4b : 65 4a __ ADC T3 + 1 
0f4d : aa __ __ TAX
0f4e : 18 __ __ CLC
0f4f : 69 d0 __ ADC #$d0
0f51 : a8 __ __ TAY
0f52 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0f55 : 49 80 __ EOR #$80
0f57 : 18 __ __ CLC
0f58 : 69 2a __ ADC #$2a
0f5a : 8d 1a 2c STA $2c1a ; (vspriteXLow[0] + 26)
0f5d : a9 00 __ LDA #$00
0f5f : 2a __ __ ROL
0f60 : 8d 3a 2c STA $2c3a ; (vspriteXHigh[0] + 26)
0f63 : a5 48 __ LDA T2 + 0 
0f65 : 69 d8 __ ADC #$d8
0f67 : a8 __ __ TAY
0f68 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0f6b : 18 __ __ CLC
0f6c : 69 8c __ ADC #$8c
0f6e : 8d ee 2b STA $2bee ; (vspriteYLow[0] + 27)
0f71 : 18 __ __ CLC
0f72 : a5 43 __ LDA T0 + 0 
0f74 : 65 49 __ ADC T3 + 0 
0f76 : 85 43 __ STA T0 + 0 
0f78 : 8a __ __ TXA
0f79 : 65 4a __ ADC T3 + 1 
0f7b : aa __ __ TAX
0f7c : 18 __ __ CLC
0f7d : 69 d8 __ ADC #$d8
0f7f : a8 __ __ TAY
0f80 : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0f83 : 49 80 __ EOR #$80
0f85 : 18 __ __ CLC
0f86 : 69 2a __ ADC #$2a
0f88 : 8d 1b 2c STA $2c1b ; (vspriteXLow[0] + 27)
0f8b : a9 00 __ LDA #$00
0f8d : 2a __ __ ROL
0f8e : 8d 3b 2c STA $2c3b ; (vspriteXHigh[0] + 27)
0f91 : a5 48 __ LDA T2 + 0 
0f93 : 69 e0 __ ADC #$e0
0f95 : a8 __ __ TAY
0f96 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0f99 : 18 __ __ CLC
0f9a : 69 8c __ ADC #$8c
0f9c : 8d ef 2b STA $2bef ; (vspriteYLow[0] + 28)
0f9f : 18 __ __ CLC
0fa0 : a5 43 __ LDA T0 + 0 
0fa2 : 65 49 __ ADC T3 + 0 
0fa4 : 85 43 __ STA T0 + 0 
0fa6 : 8a __ __ TXA
0fa7 : 65 4a __ ADC T3 + 1 
0fa9 : aa __ __ TAX
0faa : 18 __ __ CLC
0fab : 69 e0 __ ADC #$e0
0fad : a8 __ __ TAY
0fae : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0fb1 : 49 80 __ EOR #$80
0fb3 : 18 __ __ CLC
0fb4 : 69 2a __ ADC #$2a
0fb6 : 8d 1c 2c STA $2c1c ; (vspriteXLow[0] + 28)
0fb9 : a9 00 __ LDA #$00
0fbb : 2a __ __ ROL
0fbc : 8d 3c 2c STA $2c3c ; (vspriteXHigh[0] + 28)
0fbf : a5 48 __ LDA T2 + 0 
0fc1 : 69 e8 __ ADC #$e8
0fc3 : a8 __ __ TAY
0fc4 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0fc7 : 18 __ __ CLC
0fc8 : 69 8c __ ADC #$8c
0fca : 8d f0 2b STA $2bf0 ; (vspriteYLow[0] + 29)
0fcd : 18 __ __ CLC
0fce : a5 43 __ LDA T0 + 0 
0fd0 : 65 49 __ ADC T3 + 0 
0fd2 : 85 43 __ STA T0 + 0 
0fd4 : 8a __ __ TXA
0fd5 : 65 4a __ ADC T3 + 1 
0fd7 : aa __ __ TAX
0fd8 : 18 __ __ CLC
0fd9 : 69 e8 __ ADC #$e8
0fdb : a8 __ __ TAY
0fdc : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
0fdf : 49 80 __ EOR #$80
0fe1 : 18 __ __ CLC
0fe2 : 69 2a __ ADC #$2a
0fe4 : 8d 1d 2c STA $2c1d ; (vspriteXLow[0] + 29)
0fe7 : a9 00 __ LDA #$00
0fe9 : 2a __ __ ROL
0fea : 8d 3d 2c STA $2c3d ; (vspriteXHigh[0] + 29)
0fed : a5 48 __ LDA T2 + 0 
0fef : 69 f0 __ ADC #$f0
0ff1 : a8 __ __ TAY
0ff2 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
0ff5 : 18 __ __ CLC
0ff6 : 69 8c __ ADC #$8c
0ff8 : 8d f1 2b STA $2bf1 ; (vspriteYLow[0] + 30)
0ffb : 18 __ __ CLC
0ffc : a5 43 __ LDA T0 + 0 
0ffe : 65 49 __ ADC T3 + 0 
1000 : 85 43 __ STA T0 + 0 
1002 : 8a __ __ TXA
1003 : 65 4a __ ADC T3 + 1 
1005 : aa __ __ TAX
1006 : 18 __ __ CLC
1007 : 69 f0 __ ADC #$f0
1009 : a8 __ __ TAY
100a : b9 00 1c LDA $1c00,y ; (costab[0] + 0)
100d : 49 80 __ EOR #$80
100f : 18 __ __ CLC
1010 : 69 2a __ ADC #$2a
1012 : 8d 1e 2c STA $2c1e ; (vspriteXLow[0] + 30)
1015 : a9 00 __ LDA #$00
1017 : 2a __ __ ROL
1018 : 8d 3e 2c STA $2c3e ; (vspriteXHigh[0] + 30)
101b : a5 48 __ LDA T2 + 0 
101d : 69 f8 __ ADC #$f8
101f : a8 __ __ TAY
1020 : b9 00 1d LDA $1d00,y ; (sintab[0] + 0)
1023 : 18 __ __ CLC
1024 : 69 8c __ ADC #$8c
1026 : 8d f2 2b STA $2bf2 ; (vspriteYLow[0] + 31)
1029 : 18 __ __ CLC
102a : a5 43 __ LDA T0 + 0 
102c : 65 49 __ ADC T3 + 0 
102e : 8a __ __ TXA
102f : 65 4a __ ADC T3 + 1 
1031 : 18 __ __ CLC
1032 : 69 f8 __ ADC #$f8
1034 : aa __ __ TAX
1035 : bd 00 1c LDA $1c00,x ; (costab[0] + 0)
1038 : 49 80 __ EOR #$80
103a : 18 __ __ CLC
103b : 69 2a __ ADC #$2a
103d : 8d 1f 2c STA $2c1f ; (vspriteXLow[0] + 31)
1040 : a9 00 __ LDA #$00
1042 : 2a __ __ ROL
1043 : 8d 3f 2c STA $2c3f ; (vspriteXHigh[0] + 31)
1046 : 20 e3 12 JSR $12e3 ; (vspr_sort.s4 + 0)
1049 : e6 49 __ INC T3 + 0 
104b : d0 02 __ BNE $104f ; (main.s13 + 0)
.s12:
104d : e6 4a __ INC T3 + 1 
.s13:
104f : 18 __ __ CLC
1050 : a5 48 __ LDA T2 + 0 
1052 : 69 03 __ ADC #$03
1054 : 85 48 __ STA T2 + 0 
.l6:
1056 : ad 90 28 LDA $2890 ; (rirq_count + 0)
1059 : cd f3 2b CMP $2bf3 ; (rirq_pcount + 0)
105c : f0 f8 __ BEQ $1056 ; (main.l6 + 0)
.s7:
105e : 8d f3 2b STA $2bf3 ; (rirq_pcount + 0)
1061 : 20 2c 13 JSR $132c ; (vspr_update.s4 + 0)
1064 : 20 98 1a JSR $1a98 ; (rirq_sort.s4 + 0)
1067 : 4c a5 0a JMP $0aa5 ; (main.l5 + 0)
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
106a : a2 00 __ LDX #$00
.l5:
106c : a9 ff __ LDA #$ff
106e : 9d 00 28 STA $2800,x ; (rasterIRQRows[0] + 0)
1071 : 8a __ __ TXA
1072 : 9d 1e 28 STA $281e,x ; (rasterIRQIndex[0] + 1)
1075 : e8 __ __ INX
1076 : e0 1c __ CPX #$1c
1078 : d0 f2 __ BNE $106c ; (rirq_init_tables.l5 + 0)
.s6:
107a : 8e 1d 28 STX $281d ; (rasterIRQIndex[0] + 0)
107d : a9 ff __ LDA #$ff
107f : 8d 56 28 STA $2856 ; (rasterIRQNext[0] + 28)
1082 : a9 00 __ LDA #$00
1084 : 8d 1c 28 STA $281c ; (rasterIRQRows[0] + 28)
.s3:
1087 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_io: ; rirq_init_io()->void
; 177, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
1088 : 20 6a 10 JSR $106a ; (rirq_init_tables.s4 + 0)
108b : 78 __ __ SEI
108c : a9 01 __ LDA #$01
108e : 8d 1a d0 STA $d01a 
1091 : a9 00 __ LDA #$00
1093 : 8d fe ff STA $fffe 
1096 : a9 11 __ LDA #$11
1098 : 8d ff ff STA $ffff 
109b : ad 11 d0 LDA $d011 
109e : 29 7f __ AND #$7f
10a0 : 8d 11 d0 STA $d011 
10a3 : a9 ff __ LDA #$ff
10a5 : 8d 12 d0 STA $d012 
.s3:
10a8 : 60 __ __ RTS
--------------------------------------------------------------------
vspr_set: ; vspr_set(u8,i16,i16,u8,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
10a9 : a5 11 __ LDA P4 ; (ypos + 1)
10ab : d0 06 __ BNE $10b3 ; (vspr_set.s7 + 0)
.s5:
10ad : a5 0f __ LDA P2 ; (xpos + 1)
10af : 29 fe __ AND #$fe
10b1 : f0 04 __ BEQ $10b7 ; (vspr_set.s6 + 0)
.s7:
10b3 : a9 ff __ LDA #$ff
10b5 : d0 02 __ BNE $10b9 ; (vspr_set.s8 + 0)
.s6:
10b7 : a5 10 __ LDA P3 ; (ypos + 0)
.s8:
10b9 : a6 0d __ LDX P0 ; (sp + 0)
10bb : 9d d3 2b STA $2bd3,x ; (vspriteYLow[0] + 0)
10be : a5 0e __ LDA P1 ; (xpos + 0)
10c0 : 9d 00 2c STA $2c00,x ; (vspriteXLow[0] + 0)
10c3 : a5 0f __ LDA P2 ; (xpos + 1)
10c5 : 9d 20 2c STA $2c20,x ; (vspriteXHigh[0] + 0)
10c8 : a5 12 __ LDA P5 ; (image + 0)
10ca : 9d 40 2c STA $2c40,x ; (vspriteImage[0] + 0)
10cd : a5 13 __ LDA P6 ; (color + 0)
10cf : 9d 60 2c STA $2c60,x ; (vspriteColor[0] + 0)
.s3:
10d2 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
10d3 : ad 11 d0 LDA $d011 
10d6 : 29 7f __ AND #$7f
10d8 : 8d 11 d0 STA $d011 
10db : a9 64 __ LDA #$64
10dd : 8d 12 d0 STA $d012 
10e0 : 0e 19 d0 ASL $d019 
10e3 : 58 __ __ CLI
.s3:
10e4 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
10e5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
rirq_isr_ram_io: ; rirq_isr_ram_io
1100 : 8e 42 11 STX $1142 ; (rirq_isr_ram_io + 66)
1103 : ae 57 28 LDX $2857 ; (nextIRQ + 0)
1106 : 30 3c __ BMI $1144 ; (rirq_isr_ram_io + 68)
1108 : 8d 40 11 STA $1140 ; (rirq_isr_ram_io + 64)
110b : 8c 3e 11 STY $113e ; (rirq_isr_ram_io + 62)
110e : bd 3a 28 LDA $283a,x ; (rasterIRQNext[0] + 0)
1111 : bc 1e 28 LDY $281e,x ; (rasterIRQIndex[0] + 1)
1114 : be 58 28 LDX $2858,y ; (rasterIRQLow[0] + 0)
1117 : 8e 21 11 STX $1121 ; (rirq_isr_ram_io + 33)
111a : be 74 28 LDX $2874,y ; (rasterIRQHigh[0] + 0)
111d : 8e 22 11 STX $1122 ; (rirq_isr_ram_io + 34)
1120 : 20 00 00 JSR $0000 
1123 : ee 57 28 INC $2857 ; (nextIRQ + 0)
1126 : ae 57 28 LDX $2857 ; (nextIRQ + 0)
1129 : bc 3a 28 LDY $283a,x ; (rasterIRQNext[0] + 0)
112c : 0e 19 d0 ASL $d019 
112f : c0 ff __ CPY #$ff
1131 : f0 17 __ BEQ $114a ; (rirq_isr_ram_io + 74)
1133 : 88 __ __ DEY
1134 : 8c 12 d0 STY $d012 
1137 : 88 __ __ DEY
1138 : cc 12 d0 CPY $d012 
113b : 90 d1 __ BCC $110e ; (rirq_isr_ram_io + 14)
113d : a0 00 __ LDY #$00
113f : a9 00 __ LDA #$00
1141 : a2 00 __ LDX #$00
1143 : 40 __ __ RTI
1144 : 0e 19 d0 ASL $d019 
1147 : 4c 41 11 JMP $1141 ; (rirq_isr_ram_io + 65)
114a : ee 90 28 INC $2890 ; (rirq_count + 0)
114d : ac 3a 28 LDY $283a ; (rasterIRQNext[0] + 0)
1150 : 88 __ __ DEY
1151 : 8c 12 d0 STY $d012 
1154 : a2 00 __ LDX #$00
1156 : 8e 57 28 STX $2857 ; (nextIRQ + 0)
1159 : f0 e2 __ BEQ $113d ; (rirq_isr_ram_io + 61)
115b : 60 __ __ RTS
--------------------------------------------------------------------
vspr_init: ; vspr_init(u8*)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
115c : a9 00 __ LDA #$00
115e : 85 43 __ STA T4 + 0 
1160 : 8d 1d d0 STA $d01d 
1163 : 8d 17 d0 STA $d017 
1166 : a9 ff __ LDA #$ff
1168 : 8d 15 d0 STA $d015 
116b : a9 f8 __ LDA #$f8
116d : 8d 91 28 STA $2891 ; (vspriteScreen + 0)
1170 : a9 07 __ LDA #$07
1172 : 8d 92 28 STA $2892 ; (vspriteScreen + 1)
1175 : a9 50 __ LDA #$50
1177 : 85 44 __ STA T5 + 0 
1179 : a9 05 __ LDA #$05
117b : 85 0f __ STA P2 
117d : a9 93 __ LDA #$93
117f : 85 0d __ STA P0 
1181 : a9 28 __ LDA #$28
1183 : 85 0e __ STA P1 
.l5:
1185 : 20 3f 12 JSR $123f ; (rirq_build.s4 + 0)
1188 : a9 00 __ LDA #$00
118a : a0 02 __ LDY #$02
118c : 91 0d __ STA (P0),y 
118e : a0 04 __ LDY #$04
1190 : 91 0d __ STA (P0),y 
1192 : a0 11 __ LDY #$11
1194 : 91 0d __ STA (P0),y 
1196 : a0 16 __ LDY #$16
1198 : 91 0d __ STA (P0),y 
119a : a0 1b __ LDY #$1b
119c : 91 0d __ STA (P0),y 
119e : a5 43 __ LDA T4 + 0 
11a0 : 29 07 __ AND #$07
11a2 : 85 1b __ STA ACCU + 0 
11a4 : 18 __ __ CLC
11a5 : 69 27 __ ADC #$27
11a7 : a0 0b __ LDY #$0b
11a9 : 91 0d __ STA (P0),y 
11ab : a9 d0 __ LDA #$d0
11ad : c8 __ __ INY
11ae : 91 0d __ STA (P0),y 
11b0 : a9 10 __ LDA #$10
11b2 : a0 1d __ LDY #$1d
11b4 : 91 0d __ STA (P0),y 
11b6 : a9 d0 __ LDA #$d0
11b8 : c8 __ __ INY
11b9 : 91 0d __ STA (P0),y 
11bb : a5 1b __ LDA ACCU + 0 
11bd : 0a __ __ ASL
11be : a0 0e __ LDY #$0e
11c0 : 91 0d __ STA (P0),y 
11c2 : aa __ __ TAX
11c3 : a9 d0 __ LDA #$d0
11c5 : c8 __ __ INY
11c6 : 91 0d __ STA (P0),y 
11c8 : e8 __ __ INX
11c9 : 8a __ __ TXA
11ca : a0 13 __ LDY #$13
11cc : 91 0d __ STA (P0),y 
11ce : a9 d0 __ LDA #$d0
11d0 : c8 __ __ INY
11d1 : 91 0d __ STA (P0),y 
11d3 : a5 1b __ LDA ACCU + 0 
11d5 : 09 f8 __ ORA #$f8
11d7 : a0 18 __ LDY #$18
11d9 : 91 0d __ STA (P0),y 
11db : a9 07 __ LDA #$07
11dd : c8 __ __ INY
11de : 91 0d __ STA (P0),y 
11e0 : 18 __ __ CLC
11e1 : a5 0d __ LDA P0 
11e3 : 69 01 __ ADC #$01
11e5 : a6 43 __ LDX T4 + 0 
11e7 : e8 __ __ INX
11e8 : 86 43 __ STX T4 + 0 
11ea : 9d 57 28 STA $2857,x ; (nextIRQ + 0)
11ed : a5 0e __ LDA P1 
11ef : 69 00 __ ADC #$00
11f1 : 9d 73 28 STA $2873,x ; (rasterIRQLow[0] + 27)
11f4 : a5 44 __ LDA T5 + 0 
11f6 : 9d ff 27 STA $27ff,x ; (spriteset[0] + 2047)
11f9 : 18 __ __ CLC
11fa : 69 04 __ ADC #$04
11fc : 85 44 __ STA T5 + 0 
11fe : 18 __ __ CLC
11ff : a5 0d __ LDA P0 
1201 : 69 20 __ ADC #$20
1203 : 85 0d __ STA P0 
1205 : 90 02 __ BCC $1209 ; (vspr_init.s9 + 0)
.s8:
1207 : e6 0e __ INC P1 
.s9:
1209 : e0 18 __ CPX #$18
120b : b0 03 __ BCS $1210 ; (vspr_init.s6 + 0)
120d : 4c 85 11 JMP $1185 ; (vspr_init.l5 + 0)
.s6:
1210 : a9 00 __ LDA #$00
1212 : 85 0f __ STA P2 
1214 : a9 2b __ LDA #$2b
1216 : 85 0e __ STA P1 
1218 : a9 93 __ LDA #$93
121a : 85 0d __ STA P0 
121c : 20 3f 12 JSR $123f ; (rirq_build.s4 + 0)
121f : a9 fa __ LDA #$fa
1221 : 8d 18 28 STA $2818 ; (rasterIRQRows[0] + 24)
1224 : a9 94 __ LDA #$94
1226 : 8d 70 28 STA $2870 ; (rasterIRQLow[0] + 24)
1229 : a9 2b __ LDA #$2b
122b : 8d 8c 28 STA $288c ; (rasterIRQHigh[0] + 24)
122e : a2 00 __ LDX #$00
.l7:
1230 : 8a __ __ TXA
1231 : 9d b3 2b STA $2bb3,x ; (spriteOrder[0] + 0)
1234 : a9 ff __ LDA #$ff
1236 : 9d d3 2b STA $2bd3,x ; (vspriteYLow[0] + 0)
1239 : e8 __ __ INX
123a : e0 20 __ CPX #$20
123c : d0 f2 __ BNE $1230 ; (vspr_init.l7 + 0)
.s3:
123e : 60 __ __ RTS
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
123f : a5 0d __ LDA P0 ; (ic + 0)
1241 : 85 1b __ STA ACCU + 0 
1243 : a5 0e __ LDA P1 ; (ic + 1)
1245 : 85 1c __ STA ACCU + 1 
1247 : a9 a0 __ LDA #$a0
1249 : a0 01 __ LDY #$01
124b : 91 0d __ STA (P0),y ; (ic + 0)
124d : a9 00 __ LDA #$00
124f : c8 __ __ INY
1250 : 91 0d __ STA (P0),y ; (ic + 0)
1252 : a9 a2 __ LDA #$a2
1254 : c8 __ __ INY
1255 : 91 0d __ STA (P0),y ; (ic + 0)
1257 : a9 00 __ LDA #$00
1259 : c8 __ __ INY
125a : 91 0d __ STA (P0),y ; (ic + 0)
125c : a9 cd __ LDA #$cd
125e : c8 __ __ INY
125f : 91 0d __ STA (P0),y ; (ic + 0)
1261 : a9 12 __ LDA #$12
1263 : c8 __ __ INY
1264 : 91 0d __ STA (P0),y ; (ic + 0)
1266 : a9 d0 __ LDA #$d0
1268 : c8 __ __ INY
1269 : 91 0d __ STA (P0),y ; (ic + 0)
126b : a9 b0 __ LDA #$b0
126d : c8 __ __ INY
126e : 91 0d __ STA (P0),y ; (ic + 0)
1270 : a9 fb __ LDA #$fb
1272 : c8 __ __ INY
1273 : 91 0d __ STA (P0),y ; (ic + 0)
1275 : a9 8c __ LDA #$8c
1277 : c8 __ __ INY
1278 : 91 0d __ STA (P0),y ; (ic + 0)
127a : a9 00 __ LDA #$00
127c : c8 __ __ INY
127d : 91 0d __ STA (P0),y ; (ic + 0)
127f : c8 __ __ INY
1280 : 91 0d __ STA (P0),y ; (ic + 0)
1282 : a8 __ __ TAY
1283 : a5 0f __ LDA P2 ; (size + 0)
1285 : 91 0d __ STA (P0),y ; (ic + 0)
1287 : f0 53 __ BEQ $12dc ; (rirq_build.s5 + 0)
.s6:
1289 : a0 0d __ LDY #$0d
128b : c9 01 __ CMP #$01
128d : d0 05 __ BNE $1294 ; (rirq_build.s7 + 0)
.s10:
128f : a9 60 __ LDA #$60
1291 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
1293 : 60 __ __ RTS
.s7:
1294 : a9 8e __ LDA #$8e
1296 : 91 0d __ STA (P0),y ; (ic + 0)
1298 : a9 00 __ LDA #$00
129a : c8 __ __ INY
129b : 91 0d __ STA (P0),y ; (ic + 0)
129d : c8 __ __ INY
129e : 91 0d __ STA (P0),y ; (ic + 0)
12a0 : a5 0f __ LDA P2 ; (size + 0)
12a2 : c9 03 __ CMP #$03
12a4 : 90 2a __ BCC $12d0 ; (rirq_build.s8 + 0)
.s9:
12a6 : e9 02 __ SBC #$02
12a8 : aa __ __ TAX
12a9 : 18 __ __ CLC
12aa : a5 0d __ LDA P0 ; (ic + 0)
12ac : 69 01 __ ADC #$01
12ae : 85 1b __ STA ACCU + 0 
12b0 : a5 0e __ LDA P1 ; (ic + 1)
12b2 : 69 00 __ ADC #$00
12b4 : 85 1c __ STA ACCU + 1 
.l11:
12b6 : a9 a9 __ LDA #$a9
12b8 : 91 1b __ STA (ACCU + 0),y 
12ba : a9 00 __ LDA #$00
12bc : c8 __ __ INY
12bd : 91 1b __ STA (ACCU + 0),y 
12bf : a9 8d __ LDA #$8d
12c1 : c8 __ __ INY
12c2 : 91 1b __ STA (ACCU + 0),y 
12c4 : a9 00 __ LDA #$00
12c6 : c8 __ __ INY
12c7 : 91 1b __ STA (ACCU + 0),y 
12c9 : c8 __ __ INY
12ca : 91 1b __ STA (ACCU + 0),y 
12cc : c8 __ __ INY
12cd : ca __ __ DEX
12ce : d0 e6 __ BNE $12b6 ; (rirq_build.l11 + 0)
.s8:
12d0 : 98 __ __ TYA
12d1 : 18 __ __ CLC
12d2 : 65 0d __ ADC P0 ; (ic + 0)
12d4 : 85 1b __ STA ACCU + 0 
12d6 : a5 0e __ LDA P1 ; (ic + 1)
12d8 : 69 00 __ ADC #$00
12da : 85 1c __ STA ACCU + 1 
.s5:
12dc : a9 60 __ LDA #$60
12de : a0 01 __ LDY #$01
12e0 : 91 1b __ STA (ACCU + 0),y 
12e2 : 60 __ __ RTS
--------------------------------------------------------------------
vspr_sort: ; vspr_sort()->void
; 103, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
12e3 : ae b3 2b LDX $2bb3 ; (spriteOrder[0] + 0)
12e6 : bd d3 2b LDA $2bd3,x ; (vspriteYLow[0] + 0)
12e9 : 85 1b __ STA ACCU + 0 
12eb : 8d 81 2c STA $2c81 ; (spriteYPos[0] + 1)
12ee : a0 01 __ LDY #$01
.l5:
12f0 : be b3 2b LDX $2bb3,y ; (spriteOrder[0] + 0)
12f3 : bd d3 2b LDA $2bd3,x ; (vspriteYLow[0] + 0)
12f6 : c5 1b __ CMP ACCU + 0 
12f8 : 90 07 __ BCC $1301 ; (vspr_sort.s8 + 0)
.s6:
12fa : 99 81 2c STA $2c81,y ; (spriteYPos[0] + 1)
12fd : 85 1b __ STA ACCU + 0 
12ff : b0 25 __ BCS $1326 ; (vspr_sort.s7 + 0)
.s8:
1301 : 86 1d __ STX ACCU + 2 
1303 : 84 1c __ STY ACCU + 1 
1305 : aa __ __ TAX
1306 : a5 1b __ LDA ACCU + 0 
.l10:
1308 : 99 81 2c STA $2c81,y ; (spriteYPos[0] + 1)
130b : b9 b2 2b LDA $2bb2,y ; (synch.code[0] + 30)
130e : 99 b3 2b STA $2bb3,y ; (spriteOrder[0] + 0)
1311 : b9 7f 2c LDA $2c7f,y ; (vspriteColor[0] + 31)
1314 : 85 1e __ STA ACCU + 3 
1316 : e4 1e __ CPX ACCU + 3 
1318 : 88 __ __ DEY
1319 : 90 ed __ BCC $1308 ; (vspr_sort.l10 + 0)
.s9:
131b : a5 1d __ LDA ACCU + 2 
131d : 99 b3 2b STA $2bb3,y ; (spriteOrder[0] + 0)
1320 : 8a __ __ TXA
1321 : 99 81 2c STA $2c81,y ; (spriteYPos[0] + 1)
1324 : a4 1c __ LDY ACCU + 1 
.s7:
1326 : c8 __ __ INY
1327 : c0 20 __ CPY #$20
1329 : 90 c5 __ BCC $12f0 ; (vspr_sort.l5 + 0)
.s3:
132b : 60 __ __ RTS
--------------------------------------------------------------------
vspr_update: ; vspr_update()->void
; 108, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
132c : ae b3 2b LDX $2bb3 ; (spriteOrder[0] + 0)
132f : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1332 : 8d 27 d0 STA $d027 
1335 : ad 91 28 LDA $2891 ; (vspriteScreen + 0)
1338 : 85 1b __ STA ACCU + 0 
133a : ad 92 28 LDA $2892 ; (vspriteScreen + 1)
133d : 85 1c __ STA ACCU + 1 
133f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1342 : a0 00 __ LDY #$00
1344 : 91 1b __ STA (ACCU + 0),y 
1346 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1349 : 4a __ __ LSR
134a : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
134d : 8d 00 d0 STA $d000 
1350 : ad 81 2c LDA $2c81 ; (spriteYPos[0] + 1)
1353 : 8d 01 d0 STA $d001 
1356 : ae b4 2b LDX $2bb4 ; (spriteOrder[0] + 1)
1359 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
135c : 8d 28 d0 STA $d028 
135f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1362 : c8 __ __ INY
1363 : 91 1b __ STA (ACCU + 0),y 
1365 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1368 : 85 1d __ STA ACCU + 2 
136a : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
136d : 8d 02 d0 STA $d002 
1370 : ad 82 2c LDA $2c82 ; (spriteYPos[0] + 2)
1373 : 8d 03 d0 STA $d003 
1376 : ae b5 2b LDX $2bb5 ; (spriteOrder[0] + 2)
1379 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
137c : 8d 29 d0 STA $d029 
137f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1382 : c8 __ __ INY
1383 : 91 1b __ STA (ACCU + 0),y 
1385 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1388 : 85 1e __ STA ACCU + 3 
138a : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
138d : 8d 04 d0 STA $d004 
1390 : ad 83 2c LDA $2c83 ; (spriteYPos[0] + 3)
1393 : 8d 05 d0 STA $d005 
1396 : ae b6 2b LDX $2bb6 ; (spriteOrder[0] + 3)
1399 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
139c : 8d 2a d0 STA $d02a 
139f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
13a2 : c8 __ __ INY
13a3 : 91 1b __ STA (ACCU + 0),y 
13a5 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
13a8 : 85 43 __ STA T6 + 0 
13aa : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
13ad : 8d 06 d0 STA $d006 
13b0 : ad 84 2c LDA $2c84 ; (spriteYPos[0] + 4)
13b3 : 8d 07 d0 STA $d007 
13b6 : ae b7 2b LDX $2bb7 ; (spriteOrder[0] + 4)
13b9 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
13bc : 8d 2b d0 STA $d02b 
13bf : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
13c2 : c8 __ __ INY
13c3 : 91 1b __ STA (ACCU + 0),y 
13c5 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
13c8 : 85 44 __ STA T7 + 0 
13ca : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
13cd : 8d 08 d0 STA $d008 
13d0 : ad 85 2c LDA $2c85 ; (spriteYPos[0] + 5)
13d3 : 8d 09 d0 STA $d009 
13d6 : ae b8 2b LDX $2bb8 ; (spriteOrder[0] + 5)
13d9 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
13dc : 8d 2c d0 STA $d02c 
13df : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
13e2 : c8 __ __ INY
13e3 : 91 1b __ STA (ACCU + 0),y 
13e5 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
13e8 : 85 45 __ STA T8 + 0 
13ea : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
13ed : 8d 0a d0 STA $d00a 
13f0 : ad 86 2c LDA $2c86 ; (spriteYPos[0] + 6)
13f3 : 8d 0b d0 STA $d00b 
13f6 : ae b9 2b LDX $2bb9 ; (spriteOrder[0] + 6)
13f9 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
13fc : 8d 2d d0 STA $d02d 
13ff : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1402 : c8 __ __ INY
1403 : 91 1b __ STA (ACCU + 0),y 
1405 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1408 : 85 46 __ STA T9 + 0 
140a : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
140d : 8d 0c d0 STA $d00c 
1410 : ad 87 2c LDA $2c87 ; (spriteYPos[0] + 7)
1413 : 8d 0d d0 STA $d00d 
1416 : ae ba 2b LDX $2bba ; (spriteOrder[0] + 7)
1419 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
141c : 8d 2e d0 STA $d02e 
141f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1422 : c8 __ __ INY
1423 : 91 1b __ STA (ACCU + 0),y 
1425 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1428 : 8d 0e d0 STA $d00e 
142b : ad 88 2c LDA $2c88 ; (spriteYPos[0] + 8)
142e : 8d 0f d0 STA $d00f 
1431 : a9 00 __ LDA #$00
1433 : 6a __ __ ROR
1434 : 46 1d __ LSR ACCU + 2 
1436 : 6a __ __ ROR
1437 : 46 1e __ LSR ACCU + 3 
1439 : 6a __ __ ROR
143a : 46 43 __ LSR T6 + 0 
143c : 6a __ __ ROR
143d : 46 44 __ LSR T7 + 0 
143f : 6a __ __ ROR
1440 : 46 45 __ LSR T8 + 0 
1442 : 6a __ __ ROR
1443 : 46 46 __ LSR T9 + 0 
1445 : 6a __ __ ROR
1446 : 85 1b __ STA ACCU + 0 
1448 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
144b : 4a __ __ LSR
144c : 66 1b __ ROR ACCU + 0 
144e : ad 89 2c LDA $2c89 ; (spriteYPos[0] + 9)
1451 : c9 fa __ CMP #$fa
1453 : a6 1b __ LDX ACCU + 0 
1455 : 8e 10 d0 STX $d010 
1458 : 90 20 __ BCC $147a ; (vspr_update.s29 + 0)
.s5:
145a : a9 ff __ LDA #$ff
145c : 8d 00 28 STA $2800 ; (rasterIRQRows[0] + 0)
.s6:
145f : 8d 01 28 STA $2801 ; (rasterIRQRows[0] + 1)
.s7:
1462 : 8d 02 28 STA $2802 ; (rasterIRQRows[0] + 2)
.s8:
1465 : 8d 03 28 STA $2803 ; (rasterIRQRows[0] + 3)
.s9:
1468 : 8d 04 28 STA $2804 ; (rasterIRQRows[0] + 4)
.s10:
146b : 8d 05 28 STA $2805 ; (rasterIRQRows[0] + 5)
.s11:
146e : 8d 06 28 STA $2806 ; (rasterIRQRows[0] + 6)
.s12:
1471 : 8d 07 28 STA $2807 ; (rasterIRQRows[0] + 7)
.s13:
1474 : 8d 08 28 STA $2808 ; (rasterIRQRows[0] + 8)
1477 : 4c b6 16 JMP $16b6 ; (vspr_update.s14 + 0)
.s29:
147a : ad 81 2c LDA $2c81 ; (spriteYPos[0] + 1)
147d : 69 17 __ ADC #$17
147f : 8d 00 28 STA $2800 ; (rasterIRQRows[0] + 0)
1482 : 8a __ __ TXA
1483 : 09 01 __ ORA #$01
1485 : a8 __ __ TAY
1486 : ae bb 2b LDX $2bbb ; (spriteOrder[0] + 8)
1489 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
148c : 4a __ __ LSR
148d : b0 04 __ BCS $1493 ; (vspr_update.s31 + 0)
.s30:
148f : 98 __ __ TYA
1490 : 49 01 __ EOR #$01
1492 : a8 __ __ TAY
.s31:
1493 : ad 89 2c LDA $2c89 ; (spriteYPos[0] + 9)
1496 : 8d a4 28 STA $28a4 ; (spirq[0].code[0] + 16)
1499 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
149c : 8d 95 28 STA $2895 ; (spirq[0].code[0] + 1)
149f : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
14a2 : 8d 97 28 STA $2897 ; (spirq[0].code[0] + 3)
14a5 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
14a8 : 8d a9 28 STA $28a9 ; (spirq[0].code[0] + 21)
14ab : 8c ae 28 STY $28ae ; (spirq[0].code[0] + 26)
14ae : ad 8a 2c LDA $2c8a ; (spriteYPos[0] + 10)
14b1 : c9 fa __ CMP #$fa
14b3 : 90 04 __ BCC $14b9 ; (vspr_update.s32 + 0)
.s123:
14b5 : a9 ff __ LDA #$ff
14b7 : b0 a6 __ BCS $145f ; (vspr_update.s6 + 0)
.s32:
14b9 : ad 82 2c LDA $2c82 ; (spriteYPos[0] + 2)
14bc : 69 17 __ ADC #$17
14be : 8d 01 28 STA $2801 ; (rasterIRQRows[0] + 1)
14c1 : 98 __ __ TYA
14c2 : 09 02 __ ORA #$02
14c4 : a8 __ __ TAY
14c5 : ae bc 2b LDX $2bbc ; (spriteOrder[0] + 9)
14c8 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
14cb : 4a __ __ LSR
14cc : b0 04 __ BCS $14d2 ; (vspr_update.s34 + 0)
.s33:
14ce : 98 __ __ TYA
14cf : 49 02 __ EOR #$02
14d1 : a8 __ __ TAY
.s34:
14d2 : ad 8a 2c LDA $2c8a ; (spriteYPos[0] + 10)
14d5 : 8d c4 28 STA $28c4 ; (spirq[0] + 49)
14d8 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
14db : 8d b5 28 STA $28b5 ; (spirq[0] + 34)
14de : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
14e1 : 8d b7 28 STA $28b7 ; (spirq[0] + 36)
14e4 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
14e7 : 8d c9 28 STA $28c9 ; (spirq[0] + 54)
14ea : 8c ce 28 STY $28ce ; (spirq[0] + 59)
14ed : ad 8b 2c LDA $2c8b ; (spriteYPos[0] + 11)
14f0 : c9 fa __ CMP #$fa
14f2 : 90 05 __ BCC $14f9 ; (vspr_update.s35 + 0)
.s122:
14f4 : a9 ff __ LDA #$ff
14f6 : 4c 62 14 JMP $1462 ; (vspr_update.s7 + 0)
.s35:
14f9 : ad 83 2c LDA $2c83 ; (spriteYPos[0] + 3)
14fc : 69 17 __ ADC #$17
14fe : 8d 02 28 STA $2802 ; (rasterIRQRows[0] + 2)
1501 : 98 __ __ TYA
1502 : 09 04 __ ORA #$04
1504 : a8 __ __ TAY
1505 : ae bd 2b LDX $2bbd ; (spriteOrder[0] + 10)
1508 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
150b : 4a __ __ LSR
150c : b0 04 __ BCS $1512 ; (vspr_update.s37 + 0)
.s36:
150e : 98 __ __ TYA
150f : 49 04 __ EOR #$04
1511 : a8 __ __ TAY
.s37:
1512 : ad 8b 2c LDA $2c8b ; (spriteYPos[0] + 11)
1515 : 8d e4 28 STA $28e4 ; (spirq[0] + 81)
1518 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
151b : 8d d5 28 STA $28d5 ; (spirq[0] + 66)
151e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1521 : 8d d7 28 STA $28d7 ; (spirq[0] + 68)
1524 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1527 : 8d e9 28 STA $28e9 ; (spirq[0] + 86)
152a : 8c ee 28 STY $28ee ; (spirq[0] + 91)
152d : ad 8c 2c LDA $2c8c ; (spriteYPos[0] + 12)
1530 : c9 fa __ CMP #$fa
1532 : 90 05 __ BCC $1539 ; (vspr_update.s38 + 0)
.s121:
1534 : a9 ff __ LDA #$ff
1536 : 4c 65 14 JMP $1465 ; (vspr_update.s8 + 0)
.s38:
1539 : ad 84 2c LDA $2c84 ; (spriteYPos[0] + 4)
153c : 69 17 __ ADC #$17
153e : 8d 03 28 STA $2803 ; (rasterIRQRows[0] + 3)
1541 : 98 __ __ TYA
1542 : 09 08 __ ORA #$08
1544 : a8 __ __ TAY
1545 : ae be 2b LDX $2bbe ; (spriteOrder[0] + 11)
1548 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
154b : 4a __ __ LSR
154c : b0 04 __ BCS $1552 ; (vspr_update.s40 + 0)
.s39:
154e : 98 __ __ TYA
154f : 49 08 __ EOR #$08
1551 : a8 __ __ TAY
.s40:
1552 : ad 8c 2c LDA $2c8c ; (spriteYPos[0] + 12)
1555 : 8d 04 29 STA $2904 ; (spirq[0] + 113)
1558 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
155b : 8d f5 28 STA $28f5 ; (spirq[0] + 98)
155e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1561 : 8d f7 28 STA $28f7 ; (spirq[0] + 100)
1564 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1567 : 8d 09 29 STA $2909 ; (spirq[0] + 118)
156a : 8c 0e 29 STY $290e ; (spirq[0] + 123)
156d : ad 8d 2c LDA $2c8d ; (spriteYPos[0] + 13)
1570 : c9 fa __ CMP #$fa
1572 : 90 05 __ BCC $1579 ; (vspr_update.s41 + 0)
.s120:
1574 : a9 ff __ LDA #$ff
1576 : 4c 68 14 JMP $1468 ; (vspr_update.s9 + 0)
.s41:
1579 : ad 85 2c LDA $2c85 ; (spriteYPos[0] + 5)
157c : 69 17 __ ADC #$17
157e : 8d 04 28 STA $2804 ; (rasterIRQRows[0] + 4)
1581 : 98 __ __ TYA
1582 : 09 10 __ ORA #$10
1584 : a8 __ __ TAY
1585 : ae bf 2b LDX $2bbf ; (spriteOrder[0] + 12)
1588 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
158b : 4a __ __ LSR
158c : b0 04 __ BCS $1592 ; (vspr_update.s43 + 0)
.s42:
158e : 98 __ __ TYA
158f : 49 10 __ EOR #$10
1591 : a8 __ __ TAY
.s43:
1592 : ad 8d 2c LDA $2c8d ; (spriteYPos[0] + 13)
1595 : 8d 24 29 STA $2924 ; (spirq[0] + 145)
1598 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
159b : 8d 15 29 STA $2915 ; (spirq[0] + 130)
159e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
15a1 : 8d 17 29 STA $2917 ; (spirq[0] + 132)
15a4 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
15a7 : 8d 29 29 STA $2929 ; (spirq[0] + 150)
15aa : 8c 2e 29 STY $292e ; (spirq[0] + 155)
15ad : ad 8e 2c LDA $2c8e ; (spriteYPos[0] + 14)
15b0 : c9 fa __ CMP #$fa
15b2 : 90 05 __ BCC $15b9 ; (vspr_update.s44 + 0)
.s119:
15b4 : a9 ff __ LDA #$ff
15b6 : 4c 6b 14 JMP $146b ; (vspr_update.s10 + 0)
.s44:
15b9 : ad 86 2c LDA $2c86 ; (spriteYPos[0] + 6)
15bc : 69 17 __ ADC #$17
15be : 8d 05 28 STA $2805 ; (rasterIRQRows[0] + 5)
15c1 : 98 __ __ TYA
15c2 : 09 20 __ ORA #$20
15c4 : a8 __ __ TAY
15c5 : ae c0 2b LDX $2bc0 ; (spriteOrder[0] + 13)
15c8 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
15cb : 4a __ __ LSR
15cc : b0 04 __ BCS $15d2 ; (vspr_update.s46 + 0)
.s45:
15ce : 98 __ __ TYA
15cf : 49 20 __ EOR #$20
15d1 : a8 __ __ TAY
.s46:
15d2 : ad 8e 2c LDA $2c8e ; (spriteYPos[0] + 14)
15d5 : 8d 44 29 STA $2944 ; (spirq[0] + 177)
15d8 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
15db : 8d 35 29 STA $2935 ; (spirq[0] + 162)
15de : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
15e1 : 8d 37 29 STA $2937 ; (spirq[0] + 164)
15e4 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
15e7 : 8d 49 29 STA $2949 ; (spirq[0] + 182)
15ea : 8c 4e 29 STY $294e ; (spirq[0] + 187)
15ed : ad 8f 2c LDA $2c8f ; (spriteYPos[0] + 15)
15f0 : c9 fa __ CMP #$fa
15f2 : 90 05 __ BCC $15f9 ; (vspr_update.s47 + 0)
.s118:
15f4 : a9 ff __ LDA #$ff
15f6 : 4c 6e 14 JMP $146e ; (vspr_update.s11 + 0)
.s47:
15f9 : ad 87 2c LDA $2c87 ; (spriteYPos[0] + 7)
15fc : 69 17 __ ADC #$17
15fe : 8d 06 28 STA $2806 ; (rasterIRQRows[0] + 6)
1601 : 98 __ __ TYA
1602 : 09 40 __ ORA #$40
1604 : a8 __ __ TAY
1605 : ae c1 2b LDX $2bc1 ; (spriteOrder[0] + 14)
1608 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
160b : 4a __ __ LSR
160c : b0 04 __ BCS $1612 ; (vspr_update.s49 + 0)
.s48:
160e : 98 __ __ TYA
160f : 49 40 __ EOR #$40
1611 : a8 __ __ TAY
.s49:
1612 : ad 8f 2c LDA $2c8f ; (spriteYPos[0] + 15)
1615 : 8d 64 29 STA $2964 ; (spirq[0] + 209)
1618 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
161b : 8d 55 29 STA $2955 ; (spirq[0] + 194)
161e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1621 : 8d 57 29 STA $2957 ; (spirq[0] + 196)
1624 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1627 : 8d 69 29 STA $2969 ; (spirq[0] + 214)
162a : 8c 6e 29 STY $296e ; (spirq[0] + 219)
162d : ad 90 2c LDA $2c90 ; (spriteYPos[0] + 16)
1630 : c9 fa __ CMP #$fa
1632 : 90 05 __ BCC $1639 ; (vspr_update.s50 + 0)
.s117:
1634 : a9 ff __ LDA #$ff
1636 : 4c 71 14 JMP $1471 ; (vspr_update.s12 + 0)
.s50:
1639 : ad 88 2c LDA $2c88 ; (spriteYPos[0] + 8)
163c : 69 17 __ ADC #$17
163e : 8d 07 28 STA $2807 ; (rasterIRQRows[0] + 7)
1641 : 98 __ __ TYA
1642 : 09 80 __ ORA #$80
1644 : a8 __ __ TAY
1645 : ae c2 2b LDX $2bc2 ; (spriteOrder[0] + 15)
1648 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
164b : 4a __ __ LSR
164c : b0 04 __ BCS $1652 ; (vspr_update.s52 + 0)
.s51:
164e : 98 __ __ TYA
164f : 49 80 __ EOR #$80
1651 : a8 __ __ TAY
.s52:
1652 : ad 90 2c LDA $2c90 ; (spriteYPos[0] + 16)
1655 : 8d 84 29 STA $2984 ; (spirq[0] + 241)
1658 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
165b : 8d 75 29 STA $2975 ; (spirq[0] + 226)
165e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1661 : 8d 77 29 STA $2977 ; (spirq[0] + 228)
1664 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1667 : 8d 89 29 STA $2989 ; (spirq[0] + 246)
166a : 8c 8e 29 STY $298e ; (spirq[0] + 251)
166d : ad 91 2c LDA $2c91 ; (spriteYPos[0] + 17)
1670 : c9 fa __ CMP #$fa
1672 : 90 05 __ BCC $1679 ; (vspr_update.s53 + 0)
.s116:
1674 : a9 ff __ LDA #$ff
1676 : 4c 74 14 JMP $1474 ; (vspr_update.s13 + 0)
.s53:
1679 : ad 89 2c LDA $2c89 ; (spriteYPos[0] + 9)
167c : 69 17 __ ADC #$17
167e : 8d 08 28 STA $2808 ; (rasterIRQRows[0] + 8)
1681 : 98 __ __ TYA
1682 : 09 01 __ ORA #$01
1684 : a8 __ __ TAY
1685 : ae c3 2b LDX $2bc3 ; (spriteOrder[0] + 16)
1688 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
168b : 4a __ __ LSR
168c : b0 04 __ BCS $1692 ; (vspr_update.s55 + 0)
.s54:
168e : 98 __ __ TYA
168f : 49 01 __ EOR #$01
1691 : a8 __ __ TAY
.s55:
1692 : ad 91 2c LDA $2c91 ; (spriteYPos[0] + 17)
1695 : 8d a4 29 STA $29a4 ; (spirq[0] + 273)
1698 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
169b : 8d 95 29 STA $2995 ; (spirq[0] + 258)
169e : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
16a1 : 8d 97 29 STA $2997 ; (spirq[0] + 260)
16a4 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
16a7 : 8d a9 29 STA $29a9 ; (spirq[0] + 278)
16aa : 8c ae 29 STY $29ae ; (spirq[0] + 283)
16ad : ad 92 2c LDA $2c92 ; (spriteYPos[0] + 18)
16b0 : c9 fa __ CMP #$fa
16b2 : 90 30 __ BCC $16e4 ; (vspr_update.s56 + 0)
.s115:
16b4 : a9 ff __ LDA #$ff
.s14:
16b6 : 8d 09 28 STA $2809 ; (rasterIRQRows[0] + 9)
.s15:
16b9 : 8d 0a 28 STA $280a ; (rasterIRQRows[0] + 10)
.s16:
16bc : 8d 0b 28 STA $280b ; (rasterIRQRows[0] + 11)
.s17:
16bf : 8d 0c 28 STA $280c ; (rasterIRQRows[0] + 12)
.s18:
16c2 : 8d 0d 28 STA $280d ; (rasterIRQRows[0] + 13)
.s19:
16c5 : 8d 0e 28 STA $280e ; (rasterIRQRows[0] + 14)
.s20:
16c8 : 8d 0f 28 STA $280f ; (rasterIRQRows[0] + 15)
.s21:
16cb : 8d 10 28 STA $2810 ; (rasterIRQRows[0] + 16)
.s22:
16ce : 8d 11 28 STA $2811 ; (rasterIRQRows[0] + 17)
.s23:
16d1 : 8d 12 28 STA $2812 ; (rasterIRQRows[0] + 18)
.s24:
16d4 : 8d 13 28 STA $2813 ; (rasterIRQRows[0] + 19)
.s25:
16d7 : 8d 14 28 STA $2814 ; (rasterIRQRows[0] + 20)
.s26:
16da : 8d 15 28 STA $2815 ; (rasterIRQRows[0] + 21)
.s27:
16dd : 8d 16 28 STA $2816 ; (rasterIRQRows[0] + 22)
.s28:
16e0 : 8d 17 28 STA $2817 ; (rasterIRQRows[0] + 23)
.s3:
16e3 : 60 __ __ RTS
.s56:
16e4 : ad 8a 2c LDA $2c8a ; (spriteYPos[0] + 10)
16e7 : 69 17 __ ADC #$17
16e9 : 8d 09 28 STA $2809 ; (rasterIRQRows[0] + 9)
16ec : 98 __ __ TYA
16ed : 09 02 __ ORA #$02
16ef : a8 __ __ TAY
16f0 : ae c4 2b LDX $2bc4 ; (spriteOrder[0] + 17)
16f3 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
16f6 : 4a __ __ LSR
16f7 : b0 04 __ BCS $16fd ; (vspr_update.s58 + 0)
.s57:
16f9 : 98 __ __ TYA
16fa : 49 02 __ EOR #$02
16fc : a8 __ __ TAY
.s58:
16fd : ad 92 2c LDA $2c92 ; (spriteYPos[0] + 18)
1700 : 8d c4 29 STA $29c4 ; (spirq[0] + 305)
1703 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1706 : 8d b5 29 STA $29b5 ; (spirq[0] + 290)
1709 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
170c : 8d b7 29 STA $29b7 ; (spirq[0] + 292)
170f : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1712 : 8d c9 29 STA $29c9 ; (spirq[0] + 310)
1715 : 8c ce 29 STY $29ce ; (spirq[0] + 315)
1718 : ad 93 2c LDA $2c93 ; (spriteYPos[0] + 19)
171b : c9 fa __ CMP #$fa
171d : 90 04 __ BCC $1723 ; (vspr_update.s59 + 0)
.s114:
171f : a9 ff __ LDA #$ff
1721 : b0 96 __ BCS $16b9 ; (vspr_update.s15 + 0)
.s59:
1723 : ad 8b 2c LDA $2c8b ; (spriteYPos[0] + 11)
1726 : 69 17 __ ADC #$17
1728 : 8d 0a 28 STA $280a ; (rasterIRQRows[0] + 10)
172b : 98 __ __ TYA
172c : 09 04 __ ORA #$04
172e : a8 __ __ TAY
172f : ae c5 2b LDX $2bc5 ; (spriteOrder[0] + 18)
1732 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1735 : 4a __ __ LSR
1736 : b0 04 __ BCS $173c ; (vspr_update.s61 + 0)
.s60:
1738 : 98 __ __ TYA
1739 : 49 04 __ EOR #$04
173b : a8 __ __ TAY
.s61:
173c : ad 93 2c LDA $2c93 ; (spriteYPos[0] + 19)
173f : 8d e4 29 STA $29e4 ; (spirq[0] + 337)
1742 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1745 : 8d d5 29 STA $29d5 ; (spirq[0] + 322)
1748 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
174b : 8d d7 29 STA $29d7 ; (spirq[0] + 324)
174e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1751 : 8d e9 29 STA $29e9 ; (spirq[0] + 342)
1754 : 8c ee 29 STY $29ee ; (spirq[0] + 347)
1757 : ad 94 2c LDA $2c94 ; (spriteYPos[0] + 20)
175a : c9 fa __ CMP #$fa
175c : 90 05 __ BCC $1763 ; (vspr_update.s62 + 0)
.s113:
175e : a9 ff __ LDA #$ff
1760 : 4c bc 16 JMP $16bc ; (vspr_update.s16 + 0)
.s62:
1763 : ad 8c 2c LDA $2c8c ; (spriteYPos[0] + 12)
1766 : 69 17 __ ADC #$17
1768 : 8d 0b 28 STA $280b ; (rasterIRQRows[0] + 11)
176b : 98 __ __ TYA
176c : 09 08 __ ORA #$08
176e : a8 __ __ TAY
176f : ae c6 2b LDX $2bc6 ; (spriteOrder[0] + 19)
1772 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1775 : 4a __ __ LSR
1776 : b0 04 __ BCS $177c ; (vspr_update.s64 + 0)
.s63:
1778 : 98 __ __ TYA
1779 : 49 08 __ EOR #$08
177b : a8 __ __ TAY
.s64:
177c : ad 94 2c LDA $2c94 ; (spriteYPos[0] + 20)
177f : 8d 04 2a STA $2a04 ; (spirq[0] + 369)
1782 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1785 : 8d f5 29 STA $29f5 ; (spirq[0] + 354)
1788 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
178b : 8d f7 29 STA $29f7 ; (spirq[0] + 356)
178e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1791 : 8d 09 2a STA $2a09 ; (spirq[0] + 374)
1794 : 8c 0e 2a STY $2a0e ; (spirq[0] + 379)
1797 : ad 95 2c LDA $2c95 ; (spriteYPos[0] + 21)
179a : c9 fa __ CMP #$fa
179c : 90 05 __ BCC $17a3 ; (vspr_update.s65 + 0)
.s112:
179e : a9 ff __ LDA #$ff
17a0 : 4c bf 16 JMP $16bf ; (vspr_update.s17 + 0)
.s65:
17a3 : ad 8d 2c LDA $2c8d ; (spriteYPos[0] + 13)
17a6 : 69 17 __ ADC #$17
17a8 : 8d 0c 28 STA $280c ; (rasterIRQRows[0] + 12)
17ab : 98 __ __ TYA
17ac : 09 10 __ ORA #$10
17ae : a8 __ __ TAY
17af : ae c7 2b LDX $2bc7 ; (spriteOrder[0] + 20)
17b2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
17b5 : 4a __ __ LSR
17b6 : b0 04 __ BCS $17bc ; (vspr_update.s67 + 0)
.s66:
17b8 : 98 __ __ TYA
17b9 : 49 10 __ EOR #$10
17bb : a8 __ __ TAY
.s67:
17bc : ad 95 2c LDA $2c95 ; (spriteYPos[0] + 21)
17bf : 8d 24 2a STA $2a24 ; (spirq[0] + 401)
17c2 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
17c5 : 8d 15 2a STA $2a15 ; (spirq[0] + 386)
17c8 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
17cb : 8d 17 2a STA $2a17 ; (spirq[0] + 388)
17ce : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
17d1 : 8d 29 2a STA $2a29 ; (spirq[0] + 406)
17d4 : 8c 2e 2a STY $2a2e ; (spirq[0] + 411)
17d7 : ad 96 2c LDA $2c96 ; (spriteYPos[0] + 22)
17da : c9 fa __ CMP #$fa
17dc : 90 05 __ BCC $17e3 ; (vspr_update.s68 + 0)
.s111:
17de : a9 ff __ LDA #$ff
17e0 : 4c c2 16 JMP $16c2 ; (vspr_update.s18 + 0)
.s68:
17e3 : ad 8e 2c LDA $2c8e ; (spriteYPos[0] + 14)
17e6 : 69 17 __ ADC #$17
17e8 : 8d 0d 28 STA $280d ; (rasterIRQRows[0] + 13)
17eb : 98 __ __ TYA
17ec : 09 20 __ ORA #$20
17ee : a8 __ __ TAY
17ef : ae c8 2b LDX $2bc8 ; (spriteOrder[0] + 21)
17f2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
17f5 : 4a __ __ LSR
17f6 : b0 04 __ BCS $17fc ; (vspr_update.s70 + 0)
.s69:
17f8 : 98 __ __ TYA
17f9 : 49 20 __ EOR #$20
17fb : a8 __ __ TAY
.s70:
17fc : ad 96 2c LDA $2c96 ; (spriteYPos[0] + 22)
17ff : 8d 44 2a STA $2a44 ; (spirq[0] + 433)
1802 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1805 : 8d 35 2a STA $2a35 ; (spirq[0] + 418)
1808 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
180b : 8d 37 2a STA $2a37 ; (spirq[0] + 420)
180e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1811 : 8d 49 2a STA $2a49 ; (spirq[0] + 438)
1814 : 8c 4e 2a STY $2a4e ; (spirq[0] + 443)
1817 : ad 97 2c LDA $2c97 ; (spriteYPos[0] + 23)
181a : c9 fa __ CMP #$fa
181c : 90 05 __ BCC $1823 ; (vspr_update.s71 + 0)
.s110:
181e : a9 ff __ LDA #$ff
1820 : 4c c5 16 JMP $16c5 ; (vspr_update.s19 + 0)
.s71:
1823 : ad 8f 2c LDA $2c8f ; (spriteYPos[0] + 15)
1826 : 69 17 __ ADC #$17
1828 : 8d 0e 28 STA $280e ; (rasterIRQRows[0] + 14)
182b : 98 __ __ TYA
182c : 09 40 __ ORA #$40
182e : a8 __ __ TAY
182f : ae c9 2b LDX $2bc9 ; (spriteOrder[0] + 22)
1832 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1835 : 4a __ __ LSR
1836 : b0 04 __ BCS $183c ; (vspr_update.s73 + 0)
.s72:
1838 : 98 __ __ TYA
1839 : 49 40 __ EOR #$40
183b : a8 __ __ TAY
.s73:
183c : ad 97 2c LDA $2c97 ; (spriteYPos[0] + 23)
183f : 8d 64 2a STA $2a64 ; (spirq[0] + 465)
1842 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1845 : 8d 55 2a STA $2a55 ; (spirq[0] + 450)
1848 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
184b : 8d 57 2a STA $2a57 ; (spirq[0] + 452)
184e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1851 : 8d 69 2a STA $2a69 ; (spirq[0] + 470)
1854 : 8c 6e 2a STY $2a6e ; (spirq[0] + 475)
1857 : ad 98 2c LDA $2c98 ; (spriteYPos[0] + 24)
185a : c9 fa __ CMP #$fa
185c : 90 05 __ BCC $1863 ; (vspr_update.s74 + 0)
.s109:
185e : a9 ff __ LDA #$ff
1860 : 4c c8 16 JMP $16c8 ; (vspr_update.s20 + 0)
.s74:
1863 : ad 90 2c LDA $2c90 ; (spriteYPos[0] + 16)
1866 : 69 17 __ ADC #$17
1868 : 8d 0f 28 STA $280f ; (rasterIRQRows[0] + 15)
186b : 98 __ __ TYA
186c : 09 80 __ ORA #$80
186e : a8 __ __ TAY
186f : ae ca 2b LDX $2bca ; (spriteOrder[0] + 23)
1872 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1875 : 4a __ __ LSR
1876 : b0 04 __ BCS $187c ; (vspr_update.s76 + 0)
.s75:
1878 : 98 __ __ TYA
1879 : 49 80 __ EOR #$80
187b : a8 __ __ TAY
.s76:
187c : ad 98 2c LDA $2c98 ; (spriteYPos[0] + 24)
187f : 8d 84 2a STA $2a84 ; (spirq[0] + 497)
1882 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1885 : 8d 75 2a STA $2a75 ; (spirq[0] + 482)
1888 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
188b : 8d 77 2a STA $2a77 ; (spirq[0] + 484)
188e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1891 : 8d 89 2a STA $2a89 ; (spirq[0] + 502)
1894 : 8c 8e 2a STY $2a8e ; (spirq[0] + 507)
1897 : ad 99 2c LDA $2c99 ; (spriteYPos[0] + 25)
189a : c9 fa __ CMP #$fa
189c : 90 05 __ BCC $18a3 ; (vspr_update.s77 + 0)
.s108:
189e : a9 ff __ LDA #$ff
18a0 : 4c cb 16 JMP $16cb ; (vspr_update.s21 + 0)
.s77:
18a3 : ad 91 2c LDA $2c91 ; (spriteYPos[0] + 17)
18a6 : 69 17 __ ADC #$17
18a8 : 8d 10 28 STA $2810 ; (rasterIRQRows[0] + 16)
18ab : 98 __ __ TYA
18ac : 09 01 __ ORA #$01
18ae : a8 __ __ TAY
18af : ae cb 2b LDX $2bcb ; (spriteOrder[0] + 24)
18b2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
18b5 : 4a __ __ LSR
18b6 : b0 04 __ BCS $18bc ; (vspr_update.s79 + 0)
.s78:
18b8 : 98 __ __ TYA
18b9 : 49 01 __ EOR #$01
18bb : a8 __ __ TAY
.s79:
18bc : ad 99 2c LDA $2c99 ; (spriteYPos[0] + 25)
18bf : 8d a4 2a STA $2aa4 ; (spirq[0] + 529)
18c2 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
18c5 : 8d 95 2a STA $2a95 ; (spirq[0] + 514)
18c8 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
18cb : 8d 97 2a STA $2a97 ; (spirq[0] + 516)
18ce : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
18d1 : 8d a9 2a STA $2aa9 ; (spirq[0] + 534)
18d4 : 8c ae 2a STY $2aae ; (spirq[0] + 539)
18d7 : ad 9a 2c LDA $2c9a ; (spriteYPos[0] + 26)
18da : c9 fa __ CMP #$fa
18dc : 90 05 __ BCC $18e3 ; (vspr_update.s80 + 0)
.s107:
18de : a9 ff __ LDA #$ff
18e0 : 4c ce 16 JMP $16ce ; (vspr_update.s22 + 0)
.s80:
18e3 : ad 92 2c LDA $2c92 ; (spriteYPos[0] + 18)
18e6 : 69 17 __ ADC #$17
18e8 : 8d 11 28 STA $2811 ; (rasterIRQRows[0] + 17)
18eb : 98 __ __ TYA
18ec : 09 02 __ ORA #$02
18ee : a8 __ __ TAY
18ef : ae cc 2b LDX $2bcc ; (spriteOrder[0] + 25)
18f2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
18f5 : 4a __ __ LSR
18f6 : b0 04 __ BCS $18fc ; (vspr_update.s82 + 0)
.s81:
18f8 : 98 __ __ TYA
18f9 : 49 02 __ EOR #$02
18fb : a8 __ __ TAY
.s82:
18fc : ad 9a 2c LDA $2c9a ; (spriteYPos[0] + 26)
18ff : 8d c4 2a STA $2ac4 ; (spirq[0] + 561)
1902 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1905 : 8d b5 2a STA $2ab5 ; (spirq[0] + 546)
1908 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
190b : 8d b7 2a STA $2ab7 ; (spirq[0] + 548)
190e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1911 : 8d c9 2a STA $2ac9 ; (spirq[0] + 566)
1914 : 8c ce 2a STY $2ace ; (spirq[0] + 571)
1917 : ad 9b 2c LDA $2c9b ; (spriteYPos[0] + 27)
191a : c9 fa __ CMP #$fa
191c : 90 05 __ BCC $1923 ; (vspr_update.s83 + 0)
.s106:
191e : a9 ff __ LDA #$ff
1920 : 4c d1 16 JMP $16d1 ; (vspr_update.s23 + 0)
.s83:
1923 : ad 93 2c LDA $2c93 ; (spriteYPos[0] + 19)
1926 : 69 17 __ ADC #$17
1928 : 8d 12 28 STA $2812 ; (rasterIRQRows[0] + 18)
192b : 98 __ __ TYA
192c : 09 04 __ ORA #$04
192e : a8 __ __ TAY
192f : ae cd 2b LDX $2bcd ; (spriteOrder[0] + 26)
1932 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1935 : 4a __ __ LSR
1936 : b0 04 __ BCS $193c ; (vspr_update.s85 + 0)
.s84:
1938 : 98 __ __ TYA
1939 : 49 04 __ EOR #$04
193b : a8 __ __ TAY
.s85:
193c : ad 9b 2c LDA $2c9b ; (spriteYPos[0] + 27)
193f : 8d e4 2a STA $2ae4 ; (spirq[0] + 593)
1942 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1945 : 8d d5 2a STA $2ad5 ; (spirq[0] + 578)
1948 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
194b : 8d d7 2a STA $2ad7 ; (spirq[0] + 580)
194e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1951 : 8d e9 2a STA $2ae9 ; (spirq[0] + 598)
1954 : 8c ee 2a STY $2aee ; (spirq[0] + 603)
1957 : ad 9c 2c LDA $2c9c ; (spriteYPos[0] + 28)
195a : c9 fa __ CMP #$fa
195c : 90 05 __ BCC $1963 ; (vspr_update.s86 + 0)
.s105:
195e : a9 ff __ LDA #$ff
1960 : 4c d4 16 JMP $16d4 ; (vspr_update.s24 + 0)
.s86:
1963 : ad 94 2c LDA $2c94 ; (spriteYPos[0] + 20)
1966 : 69 17 __ ADC #$17
1968 : 8d 13 28 STA $2813 ; (rasterIRQRows[0] + 19)
196b : 98 __ __ TYA
196c : 09 08 __ ORA #$08
196e : a8 __ __ TAY
196f : ae ce 2b LDX $2bce ; (spriteOrder[0] + 27)
1972 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1975 : 4a __ __ LSR
1976 : b0 04 __ BCS $197c ; (vspr_update.s88 + 0)
.s87:
1978 : 98 __ __ TYA
1979 : 49 08 __ EOR #$08
197b : a8 __ __ TAY
.s88:
197c : ad 9c 2c LDA $2c9c ; (spriteYPos[0] + 28)
197f : 8d 04 2b STA $2b04 ; (spirq[0] + 625)
1982 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1985 : 8d f5 2a STA $2af5 ; (spirq[0] + 610)
1988 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
198b : 8d f7 2a STA $2af7 ; (spirq[0] + 612)
198e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1991 : 8d 09 2b STA $2b09 ; (spirq[0] + 630)
1994 : 8c 0e 2b STY $2b0e ; (spirq[0] + 635)
1997 : ad 9d 2c LDA $2c9d ; (spriteYPos[0] + 29)
199a : c9 fa __ CMP #$fa
199c : 90 05 __ BCC $19a3 ; (vspr_update.s89 + 0)
.s104:
199e : a9 ff __ LDA #$ff
19a0 : 4c d7 16 JMP $16d7 ; (vspr_update.s25 + 0)
.s89:
19a3 : ad 95 2c LDA $2c95 ; (spriteYPos[0] + 21)
19a6 : 69 17 __ ADC #$17
19a8 : 8d 14 28 STA $2814 ; (rasterIRQRows[0] + 20)
19ab : 98 __ __ TYA
19ac : 09 10 __ ORA #$10
19ae : a8 __ __ TAY
19af : ae cf 2b LDX $2bcf ; (spriteOrder[0] + 28)
19b2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
19b5 : 4a __ __ LSR
19b6 : b0 04 __ BCS $19bc ; (vspr_update.s91 + 0)
.s90:
19b8 : 98 __ __ TYA
19b9 : 49 10 __ EOR #$10
19bb : a8 __ __ TAY
.s91:
19bc : ad 9d 2c LDA $2c9d ; (spriteYPos[0] + 29)
19bf : 8d 24 2b STA $2b24 ; (spirq[0] + 657)
19c2 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
19c5 : 8d 15 2b STA $2b15 ; (spirq[0] + 642)
19c8 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
19cb : 8d 17 2b STA $2b17 ; (spirq[0] + 644)
19ce : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
19d1 : 8d 29 2b STA $2b29 ; (spirq[0] + 662)
19d4 : 8c 2e 2b STY $2b2e ; (spirq[0] + 667)
19d7 : ad 9e 2c LDA $2c9e ; (spriteYPos[0] + 30)
19da : c9 fa __ CMP #$fa
19dc : 90 05 __ BCC $19e3 ; (vspr_update.s92 + 0)
.s103:
19de : a9 ff __ LDA #$ff
19e0 : 4c da 16 JMP $16da ; (vspr_update.s26 + 0)
.s92:
19e3 : ad 96 2c LDA $2c96 ; (spriteYPos[0] + 22)
19e6 : 69 17 __ ADC #$17
19e8 : 8d 15 28 STA $2815 ; (rasterIRQRows[0] + 21)
19eb : 98 __ __ TYA
19ec : 09 20 __ ORA #$20
19ee : a8 __ __ TAY
19ef : ae d0 2b LDX $2bd0 ; (spriteOrder[0] + 29)
19f2 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
19f5 : 4a __ __ LSR
19f6 : b0 04 __ BCS $19fc ; (vspr_update.s94 + 0)
.s93:
19f8 : 98 __ __ TYA
19f9 : 49 20 __ EOR #$20
19fb : a8 __ __ TAY
.s94:
19fc : ad 9e 2c LDA $2c9e ; (spriteYPos[0] + 30)
19ff : 8d 44 2b STA $2b44 ; (spirq[0] + 689)
1a02 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1a05 : 8d 35 2b STA $2b35 ; (spirq[0] + 674)
1a08 : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1a0b : 8d 37 2b STA $2b37 ; (spirq[0] + 676)
1a0e : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1a11 : 8d 49 2b STA $2b49 ; (spirq[0] + 694)
1a14 : 8c 4e 2b STY $2b4e ; (spirq[0] + 699)
1a17 : ad 9f 2c LDA $2c9f ; (spriteYPos[0] + 31)
1a1a : c9 fa __ CMP #$fa
1a1c : 90 05 __ BCC $1a23 ; (vspr_update.s95 + 0)
.s102:
1a1e : a9 ff __ LDA #$ff
1a20 : 4c dd 16 JMP $16dd ; (vspr_update.s27 + 0)
.s95:
1a23 : ad 97 2c LDA $2c97 ; (spriteYPos[0] + 23)
1a26 : 69 17 __ ADC #$17
1a28 : 8d 16 28 STA $2816 ; (rasterIRQRows[0] + 22)
1a2b : 98 __ __ TYA
1a2c : 09 40 __ ORA #$40
1a2e : 85 1b __ STA ACCU + 0 
1a30 : ae d1 2b LDX $2bd1 ; (spriteOrder[0] + 30)
1a33 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1a36 : 4a __ __ LSR
1a37 : b0 06 __ BCS $1a3f ; (vspr_update.s97 + 0)
.s96:
1a39 : a5 1b __ LDA ACCU + 0 
1a3b : 49 40 __ EOR #$40
1a3d : 85 1b __ STA ACCU + 0 
.s97:
1a3f : ad 9f 2c LDA $2c9f ; (spriteYPos[0] + 31)
1a42 : 8d 64 2b STA $2b64 ; (spirq[0] + 721)
1a45 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1a48 : 8d 55 2b STA $2b55 ; (spirq[0] + 706)
1a4b : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1a4e : 8d 57 2b STA $2b57 ; (spirq[0] + 708)
1a51 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1a54 : 8d 69 2b STA $2b69 ; (spirq[0] + 726)
1a57 : a5 1b __ LDA ACCU + 0 
1a59 : 8d 6e 2b STA $2b6e ; (spirq[0] + 731)
1a5c : ae a0 2c LDX $2ca0 ; (spriteYPos[0] + 32)
1a5f : e0 fa __ CPX #$fa
1a61 : 90 05 __ BCC $1a68 ; (vspr_update.s98 + 0)
.s101:
1a63 : a9 ff __ LDA #$ff
1a65 : 4c e0 16 JMP $16e0 ; (vspr_update.s28 + 0)
.s98:
1a68 : ad 98 2c LDA $2c98 ; (spriteYPos[0] + 24)
1a6b : 69 17 __ ADC #$17
1a6d : 8d 17 28 STA $2817 ; (rasterIRQRows[0] + 23)
1a70 : 8e 84 2b STX $2b84 ; (spirq[0] + 753)
1a73 : ae d2 2b LDX $2bd2 ; (spriteOrder[0] + 31)
1a76 : bd 60 2c LDA $2c60,x ; (vspriteColor[0] + 0)
1a79 : 8d 75 2b STA $2b75 ; (spirq[0] + 738)
1a7c : bd 00 2c LDA $2c00,x ; (vspriteXLow[0] + 0)
1a7f : 8d 77 2b STA $2b77 ; (spirq[0] + 740)
1a82 : bd 40 2c LDA $2c40,x ; (vspriteImage[0] + 0)
1a85 : 8d 89 2b STA $2b89 ; (spirq[0] + 758)
1a88 : bd 20 2c LDA $2c20,x ; (vspriteXHigh[0] + 0)
1a8b : 4a __ __ LSR
1a8c : a5 1b __ LDA ACCU + 0 
1a8e : 09 80 __ ORA #$80
1a90 : b0 02 __ BCS $1a94 ; (vspr_update.s100 + 0)
.s99:
1a92 : 49 80 __ EOR #$80
.s100:
1a94 : 8d 8e 2b STA $2b8e ; (spirq[0] + 763)
1a97 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
1a98 : a9 ff __ LDA #$ff
1a9a : 8d 57 28 STA $2857 ; (nextIRQ + 0)
1a9d : ae 1e 28 LDX $281e ; (rasterIRQIndex[0] + 1)
1aa0 : bd 00 28 LDA $2800,x ; (rasterIRQRows[0] + 0)
1aa3 : 85 1c __ STA ACCU + 1 
1aa5 : a2 02 __ LDX #$02
.l5:
1aa7 : bc 1d 28 LDY $281d,x ; (rasterIRQIndex[0] + 0)
1aaa : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
1aad : c5 1c __ CMP ACCU + 1 
1aaf : 90 04 __ BCC $1ab5 ; (rirq_sort.s10 + 0)
.s6:
1ab1 : 85 1c __ STA ACCU + 1 
1ab3 : b0 24 __ BCS $1ad9 ; (rirq_sort.s7 + 0)
.s10:
1ab5 : 86 1d __ STX ACCU + 2 
1ab7 : 84 1e __ STY ACCU + 3 
1ab9 : 85 1b __ STA ACCU + 0 
1abb : bd 1c 28 LDA $281c,x ; (rasterIRQRows[0] + 28)
1abe : 9d 1d 28 STA $281d,x ; (rasterIRQIndex[0] + 0)
1ac1 : 90 05 __ BCC $1ac8 ; (rirq_sort.l11 + 0)
.s13:
1ac3 : 98 __ __ TYA
1ac4 : 9d 1c 28 STA $281c,x ; (rasterIRQRows[0] + 28)
1ac7 : ca __ __ DEX
.l11:
1ac8 : a5 1b __ LDA ACCU + 0 
1aca : bc 1b 28 LDY $281b,x ; (rasterIRQRows[0] + 27)
1acd : d9 00 28 CMP $2800,y ; (rasterIRQRows[0] + 0)
1ad0 : 90 f1 __ BCC $1ac3 ; (rirq_sort.s13 + 0)
.s12:
1ad2 : a5 1e __ LDA ACCU + 3 
1ad4 : 9d 1c 28 STA $281c,x ; (rasterIRQRows[0] + 28)
1ad7 : a6 1d __ LDX ACCU + 2 
.s7:
1ad9 : e8 __ __ INX
1ada : e0 1d __ CPX #$1d
1adc : 90 c9 __ BCC $1aa7 ; (rirq_sort.l5 + 0)
.s8:
1ade : a2 06 __ LDX #$06
.l14:
1ae0 : bc 1e 28 LDY $281e,x ; (rasterIRQIndex[0] + 1)
1ae3 : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
1ae6 : 9d 3a 28 STA $283a,x ; (rasterIRQNext[0] + 0)
1ae9 : bc 25 28 LDY $2825,x ; (rasterIRQIndex[0] + 8)
1aec : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
1aef : 9d 41 28 STA $2841,x ; (rasterIRQNext[0] + 7)
1af2 : bc 2c 28 LDY $282c,x ; (rasterIRQIndex[0] + 15)
1af5 : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
1af8 : 9d 48 28 STA $2848,x ; (rasterIRQNext[0] + 14)
1afb : bc 33 28 LDY $2833,x ; (rasterIRQIndex[0] + 22)
1afe : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
1b01 : 9d 4f 28 STA $284f,x ; (rasterIRQNext[0] + 21)
1b04 : ca __ __ DEX
1b05 : 10 d9 __ BPL $1ae0 ; (rirq_sort.l14 + 0)
.s15:
1b07 : ad 90 28 LDA $2890 ; (rirq_count + 0)
1b0a : 8d f3 2b STA $2bf3 ; (rirq_pcount + 0)
1b0d : ac 3a 28 LDY $283a ; (rasterIRQNext[0] + 0)
1b10 : c0 ff __ CPY #$ff
1b12 : f0 09 __ BEQ $1b1d ; (rirq_sort.s3 + 0)
.s9:
1b14 : 88 __ __ DEY
1b15 : 8c 12 d0 STY $d012 
1b18 : a9 00 __ LDA #$00
1b1a : 8d 57 28 STA $2857 ; (nextIRQ + 0)
.s3:
1b1d : 60 __ __ RTS
--------------------------------------------------------------------
costab:
1c00 : __ __ __ BYT 78 78 78 78 77 77 77 76 76 75 74 74 73 72 71 70 : xxxxwwwvvuttsrqp
1c10 : __ __ __ BYT 6f 6e 6c 6b 6a 68 67 65 64 62 60 5f 5d 5b 59 57 : onlkjhgedb`_][YW
1c20 : __ __ __ BYT 55 53 51 4e 4c 4a 47 45 43 40 3e 3b 39 36 33 31 : USQNLJGEC@>;9631
1c30 : __ __ __ BYT 2e 2b 28 26 23 20 1d 1a 17 15 12 0f 0c 09 06 03 : .+(&# ..........
1c40 : __ __ __ BYT 00 fd fa f7 f4 f1 ee eb e9 e6 e3 e0 dd da d8 d5 : ................
1c50 : __ __ __ BYT d2 cf cd ca c7 c5 c2 c0 bd bb b9 b6 b4 b2 af ad : ................
1c60 : __ __ __ BYT ab a9 a7 a5 a3 a1 a0 9e 9c 9b 99 98 96 95 94 92 : ................
1c70 : __ __ __ BYT 91 90 8f 8e 8d 8c 8c 8b 8a 8a 89 89 89 88 88 88 : ................
1c80 : __ __ __ BYT 88 88 88 88 89 89 89 8a 8a 8b 8c 8c 8d 8e 8f 90 : ................
1c90 : __ __ __ BYT 91 92 94 95 96 98 99 9b 9c 9e a0 a1 a3 a5 a7 a9 : ................
1ca0 : __ __ __ BYT ab ad af b2 b4 b6 b9 bb bd c0 c2 c5 c7 ca cd cf : ................
1cb0 : __ __ __ BYT d2 d5 d8 da dd e0 e3 e6 e9 eb ee f1 f4 f7 fa fd : ................
1cc0 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 17 1a 1d 20 23 26 28 2b : ........... #&(+
1cd0 : __ __ __ BYT 2e 31 33 36 39 3b 3e 40 43 45 47 4a 4c 4e 51 53 : .1369;>@CEGJLNQS
1ce0 : __ __ __ BYT 55 57 59 5b 5d 5f 60 62 64 65 67 68 6a 6b 6c 6e : UWY[]_`bdeghjkln
1cf0 : __ __ __ BYT 6f 70 71 72 73 74 74 75 76 76 77 77 77 78 78 78 : opqrsttuvvwwwxxx
--------------------------------------------------------------------
sintab:
1d00 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
1d10 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
1d20 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
1d30 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
1d40 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
1d50 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
1d60 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
1d70 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
1d80 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
1d90 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
1da0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
1db0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
1dc0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
1dd0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
1de0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
1df0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
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
rasterIRQRows:
2800 : __ __ __ BSS	29
--------------------------------------------------------------------
rasterIRQIndex:
281d : __ __ __ BSS	29
--------------------------------------------------------------------
rasterIRQNext:
283a : __ __ __ BSS	29
--------------------------------------------------------------------
nextIRQ:
2857 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
2858 : __ __ __ BSS	28
--------------------------------------------------------------------
rasterIRQHigh:
2874 : __ __ __ BSS	28
--------------------------------------------------------------------
rirq_count:
2890 : __ __ __ BSS	1
--------------------------------------------------------------------
vspriteScreen:
2891 : __ __ __ BSS	2
--------------------------------------------------------------------
spirq:
2893 : __ __ __ BSS	768
--------------------------------------------------------------------
synch:
2b93 : __ __ __ BSS	32
--------------------------------------------------------------------
spriteOrder:
2bb3 : __ __ __ BSS	32
--------------------------------------------------------------------
vspriteYLow:
2bd3 : __ __ __ BSS	32
--------------------------------------------------------------------
rirq_pcount:
2bf3 : __ __ __ BSS	1
--------------------------------------------------------------------
vspriteXLow:
2c00 : __ __ __ BSS	32
--------------------------------------------------------------------
vspriteXHigh:
2c20 : __ __ __ BSS	32
--------------------------------------------------------------------
vspriteImage:
2c40 : __ __ __ BSS	32
--------------------------------------------------------------------
vspriteColor:
2c60 : __ __ __ BSS	32
--------------------------------------------------------------------
spriteYPos:
2c80 : __ __ __ BSS	33
