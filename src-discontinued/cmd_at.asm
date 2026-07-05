#import "constants.asm"
#import "utils.asm"


// -----------------------------------------------------------------------------
// Last Status Command
// -----------------------------------------------------------------------------
// Purpose:
//   Displays string status of last operation on network or Ultimate DOS,...
// Usage:
//   @
//     - shows the status string

cmd_at:
    ParsingInputsDone()

    jsr PrintStatusString

    CommandDone()  // jump to parser completion handler in parser.asm
