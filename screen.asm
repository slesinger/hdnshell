#import "constants.asm"

// ============================================================================
// When scrolling console, the top line of the screen is going to disappear.
// Save it to REU buffer for later retrieval.
// Called from CHROUT pre-hook when scroll is detected.
// Read index is also synced to write index because we write only when on head of the buffer.
// Input: None
// Output: None
// Killed registers: TBD
// ============================================================================

.const SCREEN_WIDTH = 40
.const SCREEN_HEIGHT = 25
save_screen_to_history:
    ReuStore(SCREEN_RAM, screen_history_write_ptr, 0, SCREEN_WIDTH*SCREEN_HEIGHT)
    // Update write pointer for next line by adding $28 (40) bytes
    lda screen_history_write_ptr
    clc
    adc #$28
    sta screen_history_write_ptr
    sta screen_history_read_ptr      // Sync read pointer to write pointer because we write only when on head of the buffer
    lda screen_history_write_ptr+1
    adc #$00
    sta screen_history_write_ptr+1
    sta screen_history_read_ptr+1
    // Roll over if pointer >= $4000
    lda screen_history_write_ptr+1
    cmp #$40
    bcc !no_rollover+
    sec
    sbc #$40
    sta screen_history_write_ptr+1
    sta screen_history_read_ptr+1
!no_rollover:
    rts


// ============================================================================
// Handle Console buffer up (older history) Key F1
// ============================================================================
get_older_screen_history_line:
    // Set rolling flag in INPUT_FLAGS
    lda INPUT_FLAGS
    ora #$01
    sta INPUT_FLAGS
    // If this is the first F1 then also save the full current screen including full commandline
    // if screen_history_read_ptr == screen_history_write_ptr and screen_history_read_ptr+1 == screen_history_write_ptr+1 then do nothing here and rts
    lda screen_history_read_ptr
    cmp screen_history_write_ptr
    bne !not_latest_screen+
    lda screen_history_read_ptr+1
    cmp screen_history_write_ptr+1
    bne !not_latest_screen+
    // Save current screen to REU buffer
    ReuStore(SCREEN_RAM, screen_history_write_ptr, 0, SCREEN_WIDTH*SCREEN_HEIGHT)
!not_latest_screen:
    // Move screen_history_read_ptr back by $28 (40) bytes
    lda screen_history_read_ptr
    sec
    sbc #$28
    sta screen_history_read_ptr
    lda screen_history_read_ptr+1
    sbc #$00
    sta screen_history_read_ptr+1

//     // Roll over if pointer < $0000: add $4000 until in range
//     lda screen_history_read_ptr+1
//     bpl !no_rollover+   // If high byte is not negative, we're in range
// !rollover_loop:
//     clc
//     lda screen_history_read_ptr
//     adc #$00            // Add low byte of $4000
//     sta screen_history_read_ptr
//     lda screen_history_read_ptr+1
//     adc #$40            // Add high byte of $4000
//     sta screen_history_read_ptr+1
//     bpl !no_rollover+   // If still negative, repeat
//     jmp !rollover_loop-
!no_rollover:
    ReuFetch(SCREEN_RAM, screen_history_read_ptr, 0, SCREEN_WIDTH*SCREEN_HEIGHT)
    rts

// ============================================================================
// Handle Console buffer down (towards current screen) Key F7
// ============================================================================
get_newer_screen_history_line:
    // if screen_history_read_ptr == screen_history_write_ptr and screen_history_read_ptr+1 == screen_history_write_ptr+1 then do nothing here and rts
    lda screen_history_read_ptr
    cmp screen_history_write_ptr
    bne !+
    lda screen_history_read_ptr+1
    cmp screen_history_write_ptr+1
    beq !no_history+
!:

    // Move screen_history_read_ptr forward by $28 (40) bytes
    lda screen_history_read_ptr
    clc
    adc #$28
    sta screen_history_read_ptr
    lda screen_history_read_ptr+1
    adc #$00
    sta screen_history_read_ptr+1
    // Roll over if pointer >= $4000: subtract $4000
    lda screen_history_read_ptr+1
    cmp #$40
    bcc !no_rollover+
    sec
    lda screen_history_read_ptr
    sbc #$00            // Subtract low byte of $4000
    sta screen_history_read_ptr
    lda screen_history_read_ptr+1
    sbc #$40            // Subtract high byte of $4000
    sta screen_history_read_ptr+1
!no_rollover:
    ReuFetch(SCREEN_RAM, screen_history_read_ptr, 0, SCREEN_WIDTH*SCREEN_HEIGHT)
    rts
!no_history:
    // Clear rolling flag in INPUT_FLAGS
    lda INPUT_FLAGS
    and #$FE
    sta INPUT_FLAGS
    rts

// ============================================================================
// Checks if rolling terminal screen history mode is active and return to latest
// screen and if other than F1/F7 key is pressed, disable rolling mode.
// Input: key pressed in A
// Output: None
// Killed registers: A
// ============================================================================
handle_if_rolling:
    pha  // save key pressed
    lda INPUT_FLAGS
    and #$01
    beq !not_rolling+  // bit 0 not set, not in rolling mode, rts
    // rolling mode
    // Check if F1 or F7 key is pressed (in register A)
    pla  // restore key pressed
    cmp #KEY_F1
    beq !rolling_F1F7+
    cmp #KEY_F7
    beq !rolling_F1F7+
    // rest read pointer to latest screen
    lda screen_history_write_ptr
    sta screen_history_read_ptr
    lda screen_history_write_ptr+1
    sta screen_history_read_ptr+1
    // Display latest screen
    ReuFetch(SCREEN_RAM, screen_history_read_ptr, 0, SCREEN_WIDTH*SCREEN_HEIGHT)
    // Clear rolling flag in INPUT_FLAGS
    lda INPUT_FLAGS
    and #$FE
    sta INPUT_FLAGS
!rolling_F1F7:
    rts
!not_rolling:
    pla
    rts