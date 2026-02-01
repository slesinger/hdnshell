#import "constants.asm"
#import "utils.asm"
#import "parser_functions.asm"
#import "c64u_dos.asm"
#import "hdncloud.asm"

// -----------------------------------------------------------------------------
// Change Directory Command
// -----------------------------------------------------------------------------
// Purpose:
//   Change directory for IEC device and UII filesystem.
// Usage:
//   for #e
//     - 'cd <path>' changes the current directory to <path>.
//   for #t,h,f
//     - 'cd <path>' changes the current directory to <path>.
// Notes:
//   - Useful for debugging and code analysis.
// <register_command> ::= "R"


cmd_cd:  // TODO for mounting d64 image on c64 ultimate maybe MOUNT instead of CD will be needed.

    jsr parse_file_or_path
    bcc !dir_name_parsed_ok+
    // Error parsing filename, handle error
    lda #RED  // TODO wrong filename, print error message
    sta $d020
    CommandDone()  // jump to parser completion handler in parser.asm
!dir_name_parsed_ok:
    ParsingInputsDone() // finish parsing input line
    // check what device is active
    lda FA
    cmp #10  // SoftIEC device
    beq !iec_device+
    cmp #SCR_Cc  // CSDB device
    bne !uii_device+
    // CSDB device
    jsr send_cmd_to_hdn_cloud
!uii_device:
    // else Uii file system 
    jsr uii_change_dir
!dir_changed:
    CommandDone()  // like rts

!iec_device:
    // save FNLEN as it get cleared by kernal calls
    lda FNLEN
    sta _TMP
    // execute actual job
    // Filename is at ZP_INDIRECT_ADDR_2, length in FNLEN
    
    // SETLFS - Set logical file 15, device 11, secondary address 15 (command channel)
    lda #15        // Logical file number 15 (command channel)
    ldx FA         // Device number (load from FA memory location)
    ldy #15        // Secondary address 15 (command channel)
    jsr SETLFS
    
    // SETNAM - Set file name (empty for command channel)
    lda #0         // No filename needed for opening command channel
    jsr SETNAM
    
    // OPEN - Open the command channel
    jsr OPEN
    bcs !error+     // If carry set, error occurred
    
    // CHKOUT - Set output to file 15 (command channel)
    ldx #15        // Logical file number
    jsr CHKOUT
    
    // Send "CD:" prefix
    lda #KEY_C
    jsr CHROUT_ORIG
    lda #KEY_D
    jsr CHROUT_ORIG
    lda #KEY_COLON
    jsr CHROUT_ORIG

    // Send the directory name
    ldy #0
!send_loop:
    cpy _TMP  // FNLEN
    beq !send_done+
    lda (ZP_INDIRECT_ADDR),y
    jsr CHROUT_ORIG
    iny
    bne !send_loop-
    
!send_done:
    // CLRCHN - Restore output to screen
    jsr CLRCHN
    
    // CLOSE - Close the command channel
    lda #15
    jsr CLOSE
    
    CommandDone()

!error:
    // Handle error
    lda #RED
    sta $d020
    CommandDone()

