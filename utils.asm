#importonce 
#import "constants.asm"

// print single hex nibble in A (0..15) as ASCII to screen via CHROUT
print_nibble:
    cmp #10
    bcc pn_digit
    // A >= 10 -> 'A'..'F'
    clc
    adc #55             // 10 + 55 = 65 'A'
    jmp pn_out
pn_digit:
    clc
    adc #48             // 0 -> '0'
pn_out:
    jsr $FFD2
    rts

// print address
// Input: TMP2 = low byte, TMP2+1 = high byte of address to print
// Kills: A, X
SHOWAD:
    lda TMP2
    ldx TMP2+1

WRADDR:
    pha                 // save low byte
    txa                 // put high byte in A
    jsr WRTWO           // output high byte
    pla                 // restore low byte

WRBYTE:
    jsr WRTWO           // output byte in A

SPACE:
    lda #$20            // output space
    bne FLIP

CHOUT:
    cmp #$0D            // output char with special handling of CR
    bne FLIP
CRLF:
    lda #$0D            // load CR in A
    bit $13             // check default channel
    bpl FLIP            // if high bit is clear output CR only
    jsr CHROUT          // otherwise output CR+LF
    lda #$0A            // output LF
FLIP:
    jmp CHROUT

FRESH:
    jsr CRLF            // output CR
    lda #$20            // load space in A
    jsr CHROUT
    jmp SNCLR

WRTWO:
    stx SAVX            // save X
    jsr ASCTWO          // get hex chars for byte in X (lower) and A (upper)
    jsr CHROUT          // output upper nybble
    txa                 // transfer lower to A
    ldx SAVX            // restore X
    jmp CHROUT          // output lower nybble

// convert byte in A to hex digits
ASCTWO:
    pha                 // save byte
    jsr ASCII           // do low nybble
    tax                 // save in X
    pla                 // restore byte
    lsr                 // shift upper nybble down
    lsr  
    lsr  
    lsr  

// convert low nybble in A to hex digit
ASCII:
    and #$0F            // clear upper nibble
    cmp #$0A            // if less than A, skip next step
    bcc ASC1
    adc #6              // skip ascii chars between 9 and A
ASC1:
    adc #$30            // add ascii char 0 to value
    rts

// print and clear routines
// CLINE:
//     jsr CRLF            // send CR+LF
//     jmp SNCLR           // clear line
SNDCLR:
    jsr SNDMSG
SNCLR:
    ldy #$28            // loop 40 times
SNCLP:
    lda #$20            // output space character
    jsr CHROUT
    lda #$14            // output delete character
    jsr CHROUT
    dey
    bne SNCLP
    rts

// display message from table
SNDMSG:
    lda MSGBAS,Y        // Y contains offset in msg table
    php
    and #$7f            // strip high bit before output
    jsr CHOUT
    iny
    plp
    bpl SNDMSG          // loop until high bit is set
    rts


// convert binary to BCD
// Input: TMP0 = low byte, TMP0+1 = high byte of binary value
// Input: alternatively call CVTDEC_tmp2 for TMP2 = low byte, TMP2+1 = high byte of binary value

// CVTDEC:  jsr COPY12          // copy value from TMP0 to TMP2
CVTDEC_tmp2:
         lda #0
         ldx #2              // clear 3 bytes in work buffer
DECML1:  sta U0AA0,x
         dex
         bpl DECML1
         ldy #16             // 16 bits in input
         php                 // save status register
         sei                 // make sure no interrupts occur with BCD enabled
         sed
DECML2:  asl TMP2            // rotate bytes out of input low byte
         rol TMP2+1          // .. into high byte and carry bit
         ldx #2              // process 3 bytes
DECDBL:  lda U0AA0,x         // load current value of byte
         adc U0AA0,x         // add it to itself plus the carry bit
         sta U0AA0,x         // store it back in the same location
         dex                 // decrement byte counter
         bpl DECDBL          // loop until all bytes processed
         dey                 // decrement bit counter
         bne DECML2          // loop until all bits processed
         plp                 // restore processor status
         rts


// print number in specified base without leading zeros
nmprnt:  sta DIGCNT          // number of digits in accumulator
         sty NUMBIT          // bits per digit passed in y register
digout:  ldy NUMBIT          // get bits to process
         lda #0              // clear accumulator
rolbit:  asl U0AA0+2         // shift bits out of low byte
         rol U0AA0+1         // ... into high byte
         rol U0AA0           // ... into overflow byte
         rol                 // ... into accumulator
         dey                 // decrement bit counter
         bpl rolbit          // loop until all bits processed
         tay                 // check whether accumulator is 0
         bne nzero           // if not, print it
         cpx #1              // have we output the max number of digits?
         beq nzero           // if not, print it
         ldy DIGCNT          // how many digits have we output?
         beq zersup          // skip output if digit is 0
nzero:   inc DIGCNT          // increment digit counter
         ora #$30            // add numeric value to ascii '0' to get ascii char
         jsr CHROUT          // output character
zersup:  dex                 // decrement number of leading zeros
         bne digout          // next digit
         rts


// message table// last character has high bit set
MSGBAS:
MSG2:
    .text "   PC  SR AC XR YR SP   V0.1"  // header for registers
    .byte KEY_RETURN, $80    // end of message marker
MSG_UNKNOWN_COMMAND:
    .text "COMMAND NOT FOUND"
    .byte KEY_RETURN, $80
MSG_HELP:
    .text "AVAILABLE COMMANDS:"
    .byte KEY_RETURN
    .text " HELP - DISplaY THIS HELP MESSAGE"
    .byte KEY_RETURN
    .text " R    - DISplaY CPU REGISTERS"
    .byte KEY_RETURN, $80