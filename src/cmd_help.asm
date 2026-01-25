#import "constants.asm"
#import "utils.asm"
#import "hdncloud.asm"


// -----------------------------------------------------------------------------
// Help Command
// -----------------------------------------------------------------------------
// Purpose:
//   Displays help information for available commands.
// Usage:
//   HELP
//     - 'HELP' shows the help information.
// Notes:
//   - Useful for debugging and code analysis.
// <help_command> ::= "HELP"

cmd_help:
    jsr send_cmd_to_hdn_cloud  // Display remote help if cloud is available
    bcc !cloud_available+

    // Display local help message
    ldy #MSG_HELP - MSGBAS    // display headers
    jsr SNDCLR

!cloud_available:
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm

cmd_x:  // THIS IS JUST A TESTEBED
inc $d021
    jmp JMP_RESET_MACHINE
    CommandDone()