#import "constants.asm"
#import "utils.asm"
#import "c64u_dos.asm"
#import "c64u_network.asm"
#import "hdncloud.asm"



// -----------------------------------------------------------------------------
// Info Command
// -----------------------------------------------------------------------------
// Purpose:
//   Display information about various system components.
// Usage:
//   INFO
//     - 'INFO' shows the current status of the system.

cmd_info:
    ParsingInputsDone() // finish parsing input line
    lda FEATURE_FLAGS
    and #FEATURE_FLAG_ULTIMATE
    bne !printUltim+
!printRegularC64System:
    // Print C64 or C128 system info
    lda #KEY_C
    jsr CHROUT
    lda #KEY_6
    jsr CHROUT
    lda #KEY_4
    jsr CHROUT
    lda #$d3
    jsr CHROUT
    lda #KEY_RETURN
    jmp !printServerAddress+

!printUltim:
    jsr uii_identify

    // print local ip address
    lda #<LocalLabel
    ldx #>LocalLabel
    jsr LoadTextPtr
    jsr PrintText
    jsr uii_print_ipaddress

    // print "SERVER HOST: "
    lda #<ServerLabel
    ldx #>ServerLabel
    jsr LoadTextPtr
    jsr PrintText
    // print server host address
!printServerAddress:
    lda #<host_ip
    ldx #>host_ip
    jsr LoadTextPtr
    jsr PrintText

    jsr is_hdn_cloud_reachable  // carry clear if reachable
    bcs !cloud_not_reachable+
    // print " CONNECTED"
    jsr connect_hdn_cloud
    // PrintReturn()
    lda #<(ServerNotConnectedLabel + 4)  // skip "NOT "
    ldx #>(ServerNotConnectedLabel + 4)
    jsr LoadTextPtr
    jsr PrintText
    jsr PrintStatusString
    jmp !done+

!cloud_not_reachable:
//     // print " NOT CONNECTED"
    lda #<ServerNotConnectedLabel
    ldx #>ServerNotConnectedLabel
    jsr LoadTextPtr
    jsr PrintText

!done:
    ParsingInputsDone()
    CommandDone()  // jump to parser completion handler in parser.asm

.encoding "petscii_mixed"

LocalLabel:
    .byte KEY_RETURN
    .text "My IP address: "
    .byte $00

ServerLabel:
    .byte KEY_RETURN
    .text "Server "
    .byte $00

ServerNotConnectedLabel:
    .text " not reachable "
    .byte $00
