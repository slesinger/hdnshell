#importonce

#import "c64u_network.asm"
#import "constants.asm"
#import "utils.asm"

.const hdncld_cmd = _TMP
.const HDNCLD_CMD_SEND_CMD = $00
.const HDNCLD_CMD_SEND_KEY = $01
.const HDNCLD_CMD_SEND_CLI = $02

.const SERVER_CMD_GET_SCREEN = $01

// Connects to HDN Cloud service if not connected already
// Output: carry clear on success, set on failure
connect_hdn_cloud:
    // is connected already?
    lda FEATURE_FLAGS
    and #FEATURE_FLAG_CLOUD_REACHABLE
    beq !cloud_not_available+
    jsr uii_tcpconnect
    jsr uii_success  // carry clear on success, set on failure
    bcs !cloud_not_available+
!connected:
    clc
    rts
!cloud_not_available:
    // connection failed or skipped
    sec
    rts


disconnect_hdn_cloud:
    jsr uii_socketclose
    rts


// Checks if HDN Cloud service is reachable
// Sets or clears FEATURE_FLAG_CLOUD_REACHABLE in FEATURE_FLAGS
// Returns: carry clear if reachable, set if not reachable
is_hdn_cloud_reachable:
    jsr uii_tcpconnect
    jsr uii_success  // carry clear on success, set on failure
    bcs !cloud_not_available+
    lda FEATURE_FLAGS  // set flag
    ora #FEATURE_FLAG_CLOUD_REACHABLE
    sta FEATURE_FLAGS
    jsr disconnect_hdn_cloud
    clc
    rts
!cloud_not_available:
    lda FEATURE_FLAGS  // clear flag
    and #($ff - FEATURE_FLAG_CLOUD_REACHABLE)
    sta FEATURE_FLAGS
    sec
    rts

send_cmd_to_hdn_cloud_CHROUT:
    pha
    lda #<readdata_CHROUT_callback
    sta JSR_INDIRECT_ADDR
    lda #>readdata_CHROUT_callback
    sta JSR_INDIRECT_ADDR+1
    pla
// Sends the command line stored in PARSER_INPUT_PTR to HDN Cloud service
// Input: a: HDNCLD_CMD_SEND_*
// Input: content in PARSER_INPUT_PTR
// Output: carry clear on success, set on failure
send_cmd_to_hdn_cloud:
    pha  // save which HDNCLD_CMD_SEND_*
    // connect to network if not connected already
    jsr connect_hdn_cloud
    bcs !NOT_OK+

    // send command line data to socket
    lda #<PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR_2  // store data pointer low byte
    lda #>PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR_2+1  // store data pointer high byte
    pla // restore which HDNCLD_CMD_SEND_*
    ora console_id
    sta hdncld_cmd
    lda #PARSER_MAX_INPUT_LEN + 2 // command id + data length
    jsr uii_socketwrite

    // wait for response
    // jsr readdata_NULL_callback                  //  stejne se tam nekde nastavi chrout vevnitr, todle nema vubec zadny vliv
!repeat_until_00data:
    jsr uii_socketread
    jsr uii_success  // returns 00,ok if data has been received, there are maybe more data
    bcs !repeat_until_00data-
//     // read response data
//     jsr readdata_CHROUT_callback      // odtud dolu to sre jen posledni 5e, veskera dopoved je uz prectena nahore.
// !repeat_until_02nodata:
//     jsr uii_socketread
//     jsr uii_success  // returns 00,ok if data has been received, there are maybe more data
//     bcc !repeat_until_02nodata-
    jsr disconnect_hdn_cloud
    clc
    rts
!NOT_OK:
    sec
    rts


send_cmd_to_hdn_cloud_no_response:
    pha  // save which HDNCLD_CMD_SEND_*
    // connect to network if not connected already
    jsr connect_hdn_cloud
    bcs !NOT_OK+

    // send command line data to socket
    lda #<PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR_2  // store data pointer low byte
    lda #>PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR_2+1  // store data pointer high byte
    pla // restore which HDNCLD_CMD_SEND_*
    ora console_id
    sta hdncld_cmd
    lda #PARSER_MAX_INPUT_LEN + 2 // command id + data length
    jsr uii_socketwrite
    jsr disconnect_hdn_cloud
    clc
    rts
!NOT_OK:
    sec
    rts


// Retrieves current state of the full screen for given console from server
// Input: console_id
server_get_console_screen:
    lda #SERVER_CMD_GET_SCREEN
    sta PARSER_INPUT_PTR+0
    lda #$00  // null terminate
    sta PARSER_INPUT_PTR+1

    // request for the screen
    lda #HDNCLD_CMD_SEND_CMD
    jsr send_cmd_to_hdn_cloud_no_response


// If console switched to server application, send any key press to server to update screen immediately
// input: A = key code to send
server_send_key:
    sta PARSER_INPUT_PTR+0  // key code
    lda MODIFIER_KEY_BITS
    sta PARSER_INPUT_PTR+1  // modifier keys
    lda #$00
    sta PARSER_INPUT_PTR+2  // null terminate
    lda #HDNCLD_CMD_SEND_KEY
    jsr send_cmd_to_hdn_cloud_no_response
    rts