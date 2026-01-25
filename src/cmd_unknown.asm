#import "utils.asm"
#import "hdncloud.asm"

// -----------------------------------------------------------------------------
// Unknown Command
// -----------------------------------------------------------------------------
// Purpose:
//   Display error message for unknown command.
// Usage:
//   wrong usage :-)
// Notes:
//   - Does not execute any command.

cmd_unknown:
    pha  // save key
    lda #KEY_RETURN  // TODO sometimes I receive $40 when RETURN is pressed after fiddling with history
    jsr CHROUT
    pla  // restore key
    cmp #KEY_SPACE
    beq !suppress_empty_line+

    // Commands not recognized locally will be sent to HDN Cloud service
    
    jsr send_cmd_to_hdn_cloud
    // TODO check for errors and only display message if cloud is not reachable

    // ldy #MSG_UNKNOWN_COMMAND - MSGBAS    // display headers
    // jsr SNDMSG
!suppress_empty_line:
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm
