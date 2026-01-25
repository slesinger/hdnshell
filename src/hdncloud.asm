#importonce

#import "c64u_network.asm"
#import "constants.asm"
#import "utils.asm"

.const hdncld_cmd = _TMP
.const HDNCLD_CMD_SEND_KEY = $01
.const HDNCLD_CMD_SEND_CLI = $02

// Connects to HDN Cloud service if not connected already
// Output: carry clear on success, set on failure
connect_hdn_cloud:
    // is connected alreaclc
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

// Sends the command line stored in PARSER_INPUT_PTR to HDN Cloud service
send_cmd_to_hdn_cloud:
    // connect to network if not connected already
    jsr connect_hdn_cloud
    bcs !NOT_OK+

    // send command line data to socket
    lda #<PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR  // store data pointer low byte
    lda #>PARSER_INPUT_PTR
    sta ZP_INDIRECT_ADDR+1  // store data pointer high byte
    lda #HDNCLD_CMD_SEND_CLI
    sta hdncld_cmd
    lda #PARSER_MAX_INPUT_LEN + 2 // command id + data length
    jsr uii_socketwrite

    // wait for response
!repeat_until_00data:
    jsr uii_socketread
    jsr uii_success  // returns 00,ok if data has been received, there are maybe more data
    bcs !repeat_until_00data-
    // read response data
!repeat_until_02nodata:
    jsr uii_socketread
    jsr uii_success  // returns 00,ok if data has been received, there are maybe more data
    bcc !repeat_until_02nodata-
    jsr disconnect_hdn_cloud
    clc
    rts
!NOT_OK:
    sec
    rts