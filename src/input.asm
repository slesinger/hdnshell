#import "constants.asm"
#import "parser.asm"
#import "screen.asm"

// ============================================================================
// Main Input Handler
// ============================================================================
// Processes keyboard input and manages the input buffer
// Called from main loop with character in A register
// ============================================================================

HandleInput:
    // Check rolling flag
    jsr handle_if_rolling  // kills A
    // Handle special keys
    cmp #KEY_RETURN
    bne !+
    jmp HandleReturn
!:
    cmp #KEY_UP
    bne !+
    jmp HandleHistoryUp
!:
    cmp #KEY_DOWN
    bne !+
    jmp HandleHistoryDown
!:
    cmp #KEY_F1
    bne !+
    jmp HandleF1
!:
    cmp #KEY_F7
    bne !+
    jmp HandleF7
!:
    // Normal character input
    jsr CHROUT
    rts


// ============================================================================
// Pre-hook for CHROUT to detect screen scroll for saving screen buffer history
// Input: A = char to output
// Killed registers: None
// ============================================================================
CHROUT_PreHook:
    pha
    lda TBLX
    cmp #$18
    bne !no_scroll+         // If not last line, no scroll
    pla
    pha
    cmp #KEY_RETURN
    beq !scroll+            // If A == KEY_RETURN, scroll
    lda PNTR                // Load cursor column
    cmp #$27                // Check if PNT is at the end of last line
    beq !scroll+            // If PNTR == #$27, scroll
    cmp #$4f                // Check if PNT is at the end of last line
    beq !scroll+            // If PNTR == #$4f, scroll
    jmp !no_scroll+
!scroll:
    // Store top line of screen to history buffer
    jsr save_screen_to_history
!no_scroll:
    pla
    jsr CHROUT_ORIG
    rts
// ============================================================================
// Handle Enter Key
// ============================================================================
HandleReturn:
    // Resolve next history buffer index based on current index
    ldy commandline_history_idx  // load current index (0-COMMANDLINE_HISTORY_MAXLEN-1)
    iny  // move to next index
    // is == COMMANDLINE_HISTORY_MAXLEN?
    cpy #COMMANDLINE_HISTORY_MAXLEN
    bne !+
    // wrap around
    ldy #$00
!:
    // store updated index
    sty commandline_history_idx
    jsr get_history_entry_address
    jsr clear_input_buffer
    // copy input from screen current line to PARSER_INPUT_PTR, max 79 chars
    ldy $d5   // get current input line length
CopyInputLoop:
    lda (PNT),y        // read from current screen input line
    jsr screen2petscii
    sta PARSER_INPUT_PTR,y   // store to input buffer
    sta (ZP_INDIRECT_ADDR),y   // store this input to command line history buffer
    dey
    cpy #$ff
    beq CopyInputLoopEnd
    jmp CopyInputLoop
CopyInputLoopEnd:
    
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

// Kills: A, Y
clear_input_buffer:
    // clear input buffer
    ldy #PARSER_MAX_INPUT_LEN
    lda #$20  // space
!:
    sta PARSER_INPUT_PTR,y   // clear input buffer
    dey
    cpy #$ff
    bne !-
    rts

// ============================================================================
// Handle Command History Up/Down
// ============================================================================
HandleHistoryDown:
    ldy commandline_history_idx  // load current index
    tya
    iny  // forward history
    cpy #COMMANDLINE_HISTORY_MAXLEN
    bne !+
    // wrap around
    ldy #$00
!:
    jmp HandleHistoryUpDown
HandleHistoryUp:
    ldy commandline_history_idx  // load current index
    tya
    dey  // backward history
    cpy #$ff
    bne !+
    // wrap around
    ldy #(COMMANDLINE_HISTORY_MAXLEN - 1)
!:
HandleHistoryUpDown:
    sty commandline_history_idx
    tay
    jsr get_history_entry_address
    jsr clear_input_buffer
    // copy input from history buffer to screen, max 80 chars
    ldy $d5   // get current input line length
CopyHistoryLoop:
    lda (ZP_INDIRECT_ADDR),y   // read from history buffer
    jsr petscii2screen
    sta (PNT),y        // store to current screen input line
    dey
    cpy #$ff
    bne CopyHistoryLoop
    rts


// ============================================================================
// Get History Entry Address
// Input: Y = history index
// Output: ZP_INDIRECT_ADDR = address of history entry
// ============================================================================
get_history_entry_address:
    tya
    asl  // multiply by 2
    // read low address byte of history entry from ROM $ECF0
    tay
    lda SCRLOADDR,y
    sta ZP_INDIRECT_ADDR          // store low byte of history entry address
    lda SCRHIADDR,y
    and #$07  // keep only 3 bits $04xx-$07xx
    sec       // Set carry for subtraction
    sbc #$04  // Subtract 4 from A    
    ora #>commandline_history_addr  // move to $c0xx
    sta ZP_INDIRECT_ADDR+1        // store high byte of history entry address
    rts


// ============================================================================
// Handle Console buffer up (more to history)
// ============================================================================
HandleF1:
    jsr get_older_screen_history_line
    rts

HandleF7:
    jsr get_newer_screen_history_line
    rts