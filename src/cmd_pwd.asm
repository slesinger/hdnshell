#import "utils.asm"
#import "c64u_dos.asm"
#import "hdncloud.asm"

// -----------------------------------------------------------------------------
// Get current path within the UII filesystem
// -----------------------------------------------------------------------------
// Purpose:
//   Retrieve and display the current working directory path.
// Usage:
//   pwd

cmd_pwd:
    ParsingInputsDone() // finish parsing input line

    lda FA
    cmp #8
    beq !use_89_dir+
    cmp #9
    beq !use_89_dir+
    cmp #10  //iec device
    beq !use_iec_dir+
    cmp #SCR_Cc  // CSDB device
    beq !use_csdb_dir+
    // else use Ultimate command to get directory listing
    jsr uii_get_path
    jmp !done+
!use_csdb_dir:
    jsr send_cmd_to_hdn_cloud
    jmp !done+
!use_iec_dir:
!use_89_dir:
    lda #<NOT_SUPPORTED
    sta SAVX
    lda #>NOT_SUPPORTED
    sta SAVY
    jsr PrintText
!done:
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm
