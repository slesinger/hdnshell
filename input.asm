// ============================================================================
// Input Text Handling Routine
// ============================================================================
// Handles keyboard input with cursor movement, insertion, and deletion
// Requires: PARSER_INPUT_PTR, InputLength, CursorPos to be defined in main file
// ============================================================================

// Constants

#import "constants.asm"
#import "parser.asm"
// ============================================================================
// Main Input Handler
// ============================================================================
// Processes keyboard input and manages the input buffer
// Called from main loop with character in A register
// ============================================================================

HandleInput:
    // Handle special keys
    cmp #KEY_RETURN
    bne !+
    jmp HandleReturn
!:
    jsr CHROUT
    rts

// ============================================================================
// Handle Enter Key
// ============================================================================
HandleReturn:
    // copy input from screen current line to PARSER_INPUT_PTR, max 79 chars
    ldy #79
CopyInputLoop:
    lda (PNT),y        // read from current screen input line
    jsr screen2petscii
    sta PARSER_INPUT_PTR,y   // store to input buffer
    dey
    cpy #$ff
    beq CopyInputLoopEnd
    jmp CopyInputLoop
CopyInputLoopEnd:
    
    // Null terminate (better two bytes for safety)
    // lda #0
    // ldx InputLength
    // sta PARSER_INPUT_PTR,x
    // inx
    // sta PARSER_INPUT_PTR,x
    // Disable cursor
      // Load PNT (low) into LDA, add PNTR, store to ZP_INDIRECT_ADDR (low)
    lda PNT          // Load PNT low byte
    clc
    adc PNTR          // Add PNTR (cursor column)
    sta ZP_INDIRECT_ADDR          // Store result to ZP_INDIRECT_ADDR low byte
      // Load PNT (high), add carry if needed, store to ZP_INDIRECT_ADDR (high)
    lda PNT+1          // Load PNT high byte
    adc #$00           // Add carry from previous addition
    sta ZP_INDIRECT_ADDR+1  // Store result to ZP_INDIRECT_ADDR high byte
    
    ldy #$00
    lda (ZP_INDIRECT_ADDR),y
    and #$7F          // Clear bit 7 to disable cursor
    sta (ZP_INDIRECT_ADDR),y
    
    // parse and execute
    jsr parse_input
    
    // Clear input buffer and reset cursor
    lda #$00
    sta InputLength
    sta PARSER_INPUT_PTR
    sta PARSER_INPUT_PTR+1
    sta CursorPos

    rts
