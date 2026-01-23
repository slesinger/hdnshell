#importonce

#import "constants.asm"
#import "utils.asm"

#import "c64u_common.asm"


.var port = 6464

// Network Commands
.const NET_CMD_GET_INTERFACE_COUNT = $02
.const NET_CMD_GET_IP_ADDRESS = $05
.const NET_CMD_TCP_SOCKET_CONNECT = $07
.const NET_CMD_UDP_SOCKET_CONNECT = $08
.const NET_CMD_SOCKET_CLOSE   = $09
.const NET_CMD_SOCKET_READ    = $10
.const NET_CMD_SOCKET_WRITE   = $11
.const NET_CMD_TCP_LISTENER_START = $12
.const NET_CMD_TCP_LISTENER_STOP = $13
.const NET_CMD_GET_LISTENER_STATE = $14
.const NET_CMD_GET_LISTENER_SOCKET = $15



// Input: host_ip, port
// Output: socket_id
uii_tcpconnect:
    // clear connect flag
    lda FEATURE_FLAGS
    and #($ff - FEATURE_FLAG_CLOUD_REACHABLE)  // clear flag
    sta FEATURE_FLAGS
    // wait for ready
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_TCP_SOCKET_CONNECT
    sta CMD_DATA_REG
    // Send port (little-endian)
    lda #<port
    sta CMD_DATA_REG
    lda #>port
    sta CMD_DATA_REG
    // Send IP address (null-terminated string)
    ldx #0
!send_ip_loop:
    lda host_ip,x
    sta CMD_DATA_REG
    inx
    cmp #0
    bne !send_ip_loop-
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    // read socket_id
    lda RESP_DATA_REG
    sta socket_id
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
    // set connect status
    jsr uii_success  // carry clear on success, set on failure
    bcc !connect_success+
    rts
!connect_success:
    lda FEATURE_FLAGS
    ora #FEATURE_FLAG_CLOUD_REACHABLE  // set flag
    sta FEATURE_FLAGS
    rts


uii_socketclose:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_SOCKET_CLOSE
    sta CMD_DATA_REG
    lda socket_id
    sta CMD_DATA_REG
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
    rts


uii_print_ipaddress:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_GET_IP_ADDRESS
    sta CMD_DATA_REG
    lda #$00  // ??
    sta CMD_DATA_REG
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    // IP_ADDR_LOCAL
    jsr uii_readdata  // TODO only print 192 168 A 192 168
    jsr uii_readstatus
    jsr uii_accept
    rts


uii_socketread:
!read_next_block:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_SOCKET_READ
    sta CMD_DATA_REG
    lda socket_id
    sta CMD_DATA_REG
    lda #$08 // low byte of length - read 1 byte
    sta socketread_expected_length_lo
    sta CMD_DATA_REG
    lda #$00  // high byte of length
    sta socketread_expected_length_hi
    sta CMD_DATA_REG
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    lda RESP_DATA_REG
    sta socketread_real_length_lo
    lda RESP_DATA_REG
    sta socketread_real_length_hi
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept

    // HERE IT CAN RETURN OR LOOP TO READ MORE DATA IF NEEDED
    // IF RTS, YOU CAN DO OTHER THINGS AND READ THE REST LATER
    lda socketread_real_length_lo
    cmp socketread_expected_length_lo
    bne !read_exit+  // read length is shorter than requested, end of data, exit
    lda socketread_real_length_hi
    cmp socketread_expected_length_hi
    beq !read_next_block-  // read length equals requested, read more
!read_exit:
    rts
socketread_real_length_lo:
    .byte $00
socketread_real_length_hi:
    .byte $00
socketread_expected_length_lo:
    .byte $00
socketread_expected_length_hi:
    .byte $00


// Input: 
//  ZP ZP_INDIRECT_ADDR - pointer to data, A - length
//  _TMP: command type (1: key press, 2: command from cli)
uii_socketwrite:
    tax  // store length
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_SOCKET_WRITE
    sta CMD_DATA_REG
    lda socket_id
    sta CMD_DATA_REG
    // Send magic and command
    lda #$fe
    sta CMD_DATA_REG
    lda #$ff
    sta CMD_DATA_REG
    lda _TMP
    sta CMD_DATA_REG
    // Send IP address (null-terminated string)
    ldy #$00
!send_ip_loop:
    lda (ZP_INDIRECT_ADDR),y
    sta CMD_DATA_REG
    iny
    dex
    bne !send_ip_loop-
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
    rts
