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
080e : 8e c9 0b STX $0bc9 ; (spentry + 0)
0811 : a2 0b __ LDX #$0b
0813 : a0 cc __ LDY #$cc
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0b __ CPX #$0b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 fe __ CPY #$fe
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
;  90, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/colorram.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 8d 21 d0 STA $d021 
0885 : 8d 20 d0 STA $d020 
0888 : a9 20 __ LDA #$20
088a : a2 fa __ LDX #$fa
.l6:
088c : ca __ __ DEX
088d : 9d 00 04 STA $0400,x 
0890 : 9d fa 04 STA $04fa,x 
0893 : 9d f4 05 STA $05f4,x 
0896 : 9d ee 06 STA $06ee,x 
0899 : d0 f1 __ BNE $088c ; (main.l6 + 0)
.s5:
089b : a9 07 __ LDA #$07
089d : a2 fa __ LDX #$fa
.l8:
089f : ca __ __ DEX
08a0 : 9d 00 d8 STA $d800,x 
08a3 : 9d fa d8 STA $d8fa,x 
08a6 : 9d f4 d9 STA $d9f4,x 
08a9 : 9d ee da STA $daee,x 
08ac : d0 f1 __ BNE $089f ; (main.l8 + 0)
.s7:
08ae : a9 00 __ LDA #$00
08b0 : 85 44 __ STA T1 + 0 
.l9:
08b2 : 18 __ __ CLC
08b3 : a5 44 __ LDA T1 + 0 
08b5 : 69 01 __ ADC #$01
08b7 : 29 07 __ AND #$07
08b9 : 85 44 __ STA T1 + 0 
08bb : d0 0e __ BNE $08cb ; (main.l11 + 0)
.s10:
08bd : a9 72 __ LDA #$72
08bf : 85 0d __ STA P0 
08c1 : a9 00 __ LDA #$00
08c3 : 85 0e __ STA P1 
08c5 : 20 f3 08 JSR $08f3 ; (vic_waitLine.s4 + 0)
08c8 : 20 0c 09 JSR $090c ; (scrollLeft0.s4 + 0)
.l11:
08cb : 2c 11 d0 BIT $d011 
08ce : 10 fb __ BPL $08cb ; (main.l11 + 0)
.s12:
08d0 : a5 44 __ LDA T1 + 0 
08d2 : 49 07 __ EOR #$07
08d4 : 8d 16 d0 STA $d016 
08d7 : a5 44 __ LDA T1 + 0 
08d9 : d0 06 __ BNE $08e1 ; (main.s14 + 0)
.s13:
08db : 20 d4 09 JSR $09d4 ; (scrollLeft1.s4 + 0)
08de : 4c b2 08 JMP $08b2 ; (main.l9 + 0)
.s14:
08e1 : c9 04 __ CMP #$04
08e3 : d0 07 __ BNE $08ec ; (main.l15 + 0)
.s16:
08e5 : 20 7b 0b JSR $0b7b ; (prepcol.s4 + 0)
08e8 : a9 04 __ LDA #$04
08ea : 85 44 __ STA T1 + 0 
.l15:
08ec : 2c 11 d0 BIT $d011 
08ef : 30 fb __ BMI $08ec ; (main.l15 + 0)
08f1 : 10 bf __ BPL $08b2 ; (main.l9 + 0)
--------------------------------------------------------------------
vic_waitLine: ; vic_waitLine(i16)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
08f3 : 46 0e __ LSR P1 ; (line + 1)
08f5 : a9 00 __ LDA #$00
08f7 : 6a __ __ ROR
08f8 : 85 1b __ STA ACCU + 0 
08fa : a4 0d __ LDY P0 ; (line + 0)
.l5:
08fc : 98 __ __ TYA
.l7:
08fd : cd 12 d0 CMP $d012 
0900 : d0 fb __ BNE $08fd ; (vic_waitLine.l7 + 0)
.s6:
0902 : ad 11 d0 LDA $d011 
0905 : 29 80 __ AND #$80
0907 : c5 1b __ CMP ACCU + 0 
0909 : d0 f1 __ BNE $08fc ; (vic_waitLine.l5 + 0)
.s3:
090b : 60 __ __ RTS
--------------------------------------------------------------------
scrollLeft0: ; scrollLeft0()->void
;  22, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/colorram.c"
.s4:
090c : a2 00 __ LDX #$00
.l5:
090e : bd 01 04 LDA $0401,x 
0911 : 9d 00 04 STA $0400,x 
0914 : bd 01 d8 LDA $d801,x 
0917 : 9d 00 d8 STA $d800,x 
091a : bd 29 04 LDA $0429,x 
091d : 9d 28 04 STA $0428,x 
0920 : bd 29 d8 LDA $d829,x 
0923 : 9d 28 d8 STA $d828,x 
0926 : bd 51 04 LDA $0451,x 
0929 : 9d 50 04 STA $0450,x 
092c : bd 51 d8 LDA $d851,x 
092f : 9d 50 d8 STA $d850,x 
0932 : bd 79 04 LDA $0479,x 
0935 : 9d 78 04 STA $0478,x 
0938 : bd 79 d8 LDA $d879,x 
093b : 9d 78 d8 STA $d878,x 
093e : bd a1 04 LDA $04a1,x 
0941 : 9d a0 04 STA $04a0,x 
0944 : bd a1 d8 LDA $d8a1,x 
0947 : 9d a0 d8 STA $d8a0,x 
094a : bd c9 04 LDA $04c9,x 
094d : 9d c8 04 STA $04c8,x 
0950 : bd c9 d8 LDA $d8c9,x 
0953 : 9d c8 d8 STA $d8c8,x 
0956 : bd f1 04 LDA $04f1,x 
0959 : 9d f0 04 STA $04f0,x 
095c : bd f1 d8 LDA $d8f1,x 
095f : 9d f0 d8 STA $d8f0,x 
0962 : bd 19 05 LDA $0519,x 
0965 : 9d 18 05 STA $0518,x 
0968 : bd 19 d9 LDA $d919,x 
096b : 9d 18 d9 STA $d918,x 
096e : e8 __ __ INX
096f : e0 27 __ CPX #$27
0971 : d0 9b __ BNE $090e ; (scrollLeft0.l5 + 0)
.s6:
0973 : ad cc 0b LDA $0bcc ; (rbuff[0] + 0)
0976 : 8d 27 04 STA $0427 
0979 : ad cd 0b LDA $0bcd ; (rbuff[0] + 1)
097c : 8d 4f 04 STA $044f 
097f : ad ce 0b LDA $0bce ; (rbuff[0] + 2)
0982 : 8d 77 04 STA $0477 
0985 : ad cf 0b LDA $0bcf ; (rbuff[0] + 3)
0988 : 8d 9f 04 STA $049f 
098b : ad d0 0b LDA $0bd0 ; (rbuff[0] + 4)
098e : 8d c7 04 STA $04c7 
0991 : ad d1 0b LDA $0bd1 ; (rbuff[0] + 5)
0994 : 8d ef 04 STA $04ef 
0997 : ad d2 0b LDA $0bd2 ; (rbuff[0] + 6)
099a : 8d 17 05 STA $0517 
099d : ad d3 0b LDA $0bd3 ; (rbuff[0] + 7)
09a0 : 8d 3f 05 STA $053f 
09a3 : ad e5 0b LDA $0be5 ; (cbuff[0] + 0)
09a6 : 8d 27 d8 STA $d827 
09a9 : ad e6 0b LDA $0be6 ; (cbuff[0] + 1)
09ac : 8d 4f d8 STA $d84f 
09af : ad e7 0b LDA $0be7 ; (cbuff[0] + 2)
09b2 : 8d 77 d8 STA $d877 
09b5 : ad e8 0b LDA $0be8 ; (cbuff[0] + 3)
09b8 : 8d 9f d8 STA $d89f 
09bb : ad e9 0b LDA $0be9 ; (cbuff[0] + 4)
09be : 8d c7 d8 STA $d8c7 
09c1 : ad ea 0b LDA $0bea ; (cbuff[0] + 5)
09c4 : 8d ef d8 STA $d8ef 
09c7 : ad eb 0b LDA $0beb ; (cbuff[0] + 6)
09ca : 8d 17 d9 STA $d917 
09cd : ad ec 0b LDA $0bec ; (cbuff[0] + 7)
09d0 : 8d 3f d9 STA $d93f 
.s3:
09d3 : 60 __ __ RTS
--------------------------------------------------------------------
scrollLeft1: ; scrollLeft1()->void
;  43, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/colorram.c"
.s4:
09d4 : a2 00 __ LDX #$00
.l5:
09d6 : bd 41 05 LDA $0541,x 
09d9 : 9d 40 05 STA $0540,x 
09dc : bd 41 d9 LDA $d941,x 
09df : 9d 40 d9 STA $d940,x 
09e2 : bd 69 05 LDA $0569,x 
09e5 : 9d 68 05 STA $0568,x 
09e8 : bd 69 d9 LDA $d969,x 
09eb : 9d 68 d9 STA $d968,x 
09ee : bd 91 05 LDA $0591,x 
09f1 : 9d 90 05 STA $0590,x 
09f4 : bd 91 d9 LDA $d991,x 
09f7 : 9d 90 d9 STA $d990,x 
09fa : bd b9 05 LDA $05b9,x 
09fd : 9d b8 05 STA $05b8,x 
0a00 : bd b9 d9 LDA $d9b9,x 
0a03 : 9d b8 d9 STA $d9b8,x 
0a06 : bd e1 05 LDA $05e1,x 
0a09 : 9d e0 05 STA $05e0,x 
0a0c : bd e1 d9 LDA $d9e1,x 
0a0f : 9d e0 d9 STA $d9e0,x 
0a12 : bd 09 06 LDA $0609,x 
0a15 : 9d 08 06 STA $0608,x 
0a18 : bd 09 da LDA $da09,x 
0a1b : 9d 08 da STA $da08,x 
0a1e : bd 31 06 LDA $0631,x 
0a21 : 9d 30 06 STA $0630,x 
0a24 : bd 31 da LDA $da31,x 
0a27 : 9d 30 da STA $da30,x 
0a2a : bd 59 06 LDA $0659,x 
0a2d : 9d 58 06 STA $0658,x 
0a30 : bd 59 da LDA $da59,x 
0a33 : 9d 58 da STA $da58,x 
0a36 : e8 __ __ INX
0a37 : e0 27 __ CPX #$27
0a39 : d0 9b __ BNE $09d6 ; (scrollLeft1.l5 + 0)
.s6:
0a3b : ad d4 0b LDA $0bd4 ; (rbuff[0] + 8)
0a3e : 8d 67 05 STA $0567 
0a41 : ad d5 0b LDA $0bd5 ; (rbuff[0] + 9)
0a44 : 8d 8f 05 STA $058f 
0a47 : ad d6 0b LDA $0bd6 ; (rbuff[0] + 10)
0a4a : 8d b7 05 STA $05b7 
0a4d : ad d7 0b LDA $0bd7 ; (rbuff[0] + 11)
0a50 : 8d df 05 STA $05df 
0a53 : ad d8 0b LDA $0bd8 ; (rbuff[0] + 12)
0a56 : 8d 07 06 STA $0607 
0a59 : ad d9 0b LDA $0bd9 ; (rbuff[0] + 13)
0a5c : 8d 2f 06 STA $062f 
0a5f : ad da 0b LDA $0bda ; (rbuff[0] + 14)
0a62 : 8d 57 06 STA $0657 
0a65 : ad db 0b LDA $0bdb ; (rbuff[0] + 15)
0a68 : 8d 7f 06 STA $067f 
0a6b : ad ed 0b LDA $0bed ; (cbuff[0] + 8)
0a6e : 8d 67 d9 STA $d967 
0a71 : ad ee 0b LDA $0bee ; (cbuff[0] + 9)
0a74 : 8d 8f d9 STA $d98f 
0a77 : ad ef 0b LDA $0bef ; (cbuff[0] + 10)
0a7a : 8d b7 d9 STA $d9b7 
0a7d : ad f0 0b LDA $0bf0 ; (cbuff[0] + 11)
0a80 : 8d df d9 STA $d9df 
0a83 : ad f1 0b LDA $0bf1 ; (cbuff[0] + 12)
0a86 : 8d 07 da STA $da07 
0a89 : ad f2 0b LDA $0bf2 ; (cbuff[0] + 13)
0a8c : 8d 2f da STA $da2f 
0a8f : ad f3 0b LDA $0bf3 ; (cbuff[0] + 14)
0a92 : 8d 57 da STA $da57 
0a95 : ad f4 0b LDA $0bf4 ; (cbuff[0] + 15)
0a98 : 8d 7f da STA $da7f 
0a9b : a2 00 __ LDX #$00
.l7:
0a9d : bd 81 06 LDA $0681,x 
0aa0 : 9d 80 06 STA $0680,x 
0aa3 : bd 81 da LDA $da81,x 
0aa6 : 9d 80 da STA $da80,x 
0aa9 : bd a9 06 LDA $06a9,x 
0aac : 9d a8 06 STA $06a8,x 
0aaf : bd a9 da LDA $daa9,x 
0ab2 : 9d a8 da STA $daa8,x 
0ab5 : bd d1 06 LDA $06d1,x 
0ab8 : 9d d0 06 STA $06d0,x 
0abb : bd d1 da LDA $dad1,x 
0abe : 9d d0 da STA $dad0,x 
0ac1 : bd f9 06 LDA $06f9,x 
0ac4 : 9d f8 06 STA $06f8,x 
0ac7 : bd f9 da LDA $daf9,x 
0aca : 9d f8 da STA $daf8,x 
0acd : bd 21 07 LDA $0721,x 
0ad0 : 9d 20 07 STA $0720,x 
0ad3 : bd 21 db LDA $db21,x 
0ad6 : 9d 20 db STA $db20,x 
0ad9 : bd 49 07 LDA $0749,x 
0adc : 9d 48 07 STA $0748,x 
0adf : bd 49 db LDA $db49,x 
0ae2 : 9d 48 db STA $db48,x 
0ae5 : bd 71 07 LDA $0771,x 
0ae8 : 9d 70 07 STA $0770,x 
0aeb : bd 71 db LDA $db71,x 
0aee : 9d 70 db STA $db70,x 
0af1 : bd 99 07 LDA $0799,x 
0af4 : 9d 98 07 STA $0798,x 
0af7 : bd 99 db LDA $db99,x 
0afa : 9d 98 db STA $db98,x 
0afd : bd c1 07 LDA $07c1,x 
0b00 : 9d c0 07 STA $07c0,x 
0b03 : bd c1 db LDA $dbc1,x 
0b06 : 9d c0 db STA $dbc0,x 
0b09 : e8 __ __ INX
0b0a : e0 27 __ CPX #$27
0b0c : d0 8f __ BNE $0a9d ; (scrollLeft1.l7 + 0)
.s8:
0b0e : ad dc 0b LDA $0bdc ; (rbuff[0] + 16)
0b11 : 8d a7 06 STA $06a7 
0b14 : ad dd 0b LDA $0bdd ; (rbuff[0] + 17)
0b17 : 8d cf 06 STA $06cf 
0b1a : ad de 0b LDA $0bde ; (rbuff[0] + 18)
0b1d : 8d f7 06 STA $06f7 
0b20 : ad df 0b LDA $0bdf ; (rbuff[0] + 19)
0b23 : 8d 1f 07 STA $071f 
0b26 : ad e0 0b LDA $0be0 ; (rbuff[0] + 20)
0b29 : 8d 47 07 STA $0747 
0b2c : ad e1 0b LDA $0be1 ; (rbuff[0] + 21)
0b2f : 8d 6f 07 STA $076f 
0b32 : ad e2 0b LDA $0be2 ; (rbuff[0] + 22)
0b35 : 8d 97 07 STA $0797 
0b38 : ad e3 0b LDA $0be3 ; (rbuff[0] + 23)
0b3b : 8d bf 07 STA $07bf 
0b3e : ad e4 0b LDA $0be4 ; (rbuff[0] + 24)
0b41 : 8d e7 07 STA $07e7 
0b44 : ad f5 0b LDA $0bf5 ; (cbuff[0] + 16)
0b47 : 8d a7 da STA $daa7 
0b4a : ad f6 0b LDA $0bf6 ; (cbuff[0] + 17)
0b4d : 8d cf da STA $dacf 
0b50 : ad f7 0b LDA $0bf7 ; (cbuff[0] + 18)
0b53 : 8d f7 da STA $daf7 
0b56 : ad f8 0b LDA $0bf8 ; (cbuff[0] + 19)
0b59 : 8d 1f db STA $db1f 
0b5c : ad f9 0b LDA $0bf9 ; (cbuff[0] + 20)
0b5f : 8d 47 db STA $db47 
0b62 : ad fa 0b LDA $0bfa ; (cbuff[0] + 21)
0b65 : 8d 6f db STA $db6f 
0b68 : ad fb 0b LDA $0bfb ; (cbuff[0] + 22)
0b6b : 8d 97 db STA $db97 
0b6e : ad fc 0b LDA $0bfc ; (cbuff[0] + 23)
0b71 : 8d bf db STA $dbbf 
0b74 : ad fd 0b LDA $0bfd ; (cbuff[0] + 24)
0b77 : 8d e7 db STA $dbe7 
.s3:
0b7a : 60 __ __ RTS
--------------------------------------------------------------------
prepcol: ; prepcol()->void
;  80, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/colorram.c"
.s4:
0b7b : a9 00 __ LDA #$00
0b7d : 85 43 __ STA T4 + 0 
.l5:
0b7f : 20 a2 0b JSR $0ba2 ; (rand.s4 + 0)
0b82 : a5 1b __ LDA ACCU + 0 
0b84 : 29 0f __ AND #$0f
0b86 : a4 43 __ LDY T4 + 0 
0b88 : 99 e5 0b STA $0be5,y ; (cbuff[0] + 0)
0b8b : a5 1b __ LDA ACCU + 0 
0b8d : 29 10 __ AND #$10
0b8f : f0 04 __ BEQ $0b95 ; (prepcol.s6 + 0)
.s7:
0b91 : a9 66 __ LDA #$66
0b93 : d0 02 __ BNE $0b97 ; (prepcol.s8 + 0)
.s6:
0b95 : a9 a0 __ LDA #$a0
.s8:
0b97 : c8 __ __ INY
0b98 : 84 43 __ STY T4 + 0 
0b9a : 99 cb 0b STA $0bcb,y ; (seed + 1)
0b9d : c0 19 __ CPY #$19
0b9f : 90 de __ BCC $0b7f ; (prepcol.l5 + 0)
.s3:
0ba1 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0ba2 : ad cb 0b LDA $0bcb ; (seed + 1)
0ba5 : 4a __ __ LSR
0ba6 : ad ca 0b LDA $0bca ; (seed + 0)
0ba9 : 6a __ __ ROR
0baa : aa __ __ TAX
0bab : a9 00 __ LDA #$00
0bad : 6a __ __ ROR
0bae : 4d ca 0b EOR $0bca ; (seed + 0)
0bb1 : 85 1b __ STA ACCU + 0 
0bb3 : 8a __ __ TXA
0bb4 : 4d cb 0b EOR $0bcb ; (seed + 1)
0bb7 : 85 1c __ STA ACCU + 1 
0bb9 : 4a __ __ LSR
0bba : 45 1b __ EOR ACCU + 0 
0bbc : 8d ca 0b STA $0bca ; (seed + 0)
0bbf : 85 1b __ STA ACCU + 0 
0bc1 : 45 1c __ EOR ACCU + 1 
0bc3 : 8d cb 0b STA $0bcb ; (seed + 1)
0bc6 : 85 1c __ STA ACCU + 1 
.s3:
0bc8 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0bc9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
0bca : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
rbuff:
0bcc : __ __ __ BSS	25
--------------------------------------------------------------------
cbuff:
0be5 : __ __ __ BSS	25
