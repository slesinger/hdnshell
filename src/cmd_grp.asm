#import "utils.asm"
#import "hdncloud.asm"

// -----------------------------------------------------------------------------
// Get CSDB Group detail
// -----------------------------------------------------------------------------
// Purpose:
//   Print details about a CSDB group based on group ID.
// Usage:
//   GRP <group_id>

cmd_grp:
    ParsingInputsDone() // finish parsing input line

    // send full command line to HDN Cloud CSDB handler
    jsr send_cmd_to_hdn_cloud
    // TODO check for errors

    CommandDone()  // jump to parser completion handler in parser.asm
