#import "utils.asm"

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
    ldy #MSG_UNKNOWN_COMMAND - MSGBAS    // display headers
    jsr SNDMSG
    jmp parse_done  // jump to parser completion handler in parser.asm
