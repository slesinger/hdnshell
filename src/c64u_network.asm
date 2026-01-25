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

.const PACKET_MAGIC_BYTE = $fe

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


	// printf("\n\nIP Address: %d.%d.%d.%d", uii_data[0], uii_data[1], uii_data[2], uii_data[3]);
	// printf("\n   Netmask: %d.%d.%d.%d", uii_data[4], uii_data[5], uii_data[6], uii_data[7]);
	// printf("\n   Gateway: %d.%d.%d.%d", uii_data[8], uii_data[9], uii_data[10], uii_data[11]);
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
    // sendcommand
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG  // cmd[0] target network
    lda #NET_CMD_SOCKET_READ
    sta CMD_DATA_REG  // cmd[1] command id
    lda socket_id
    sta CMD_DATA_REG  // cmd[2] socket id
    lda #$e8 // low byte of length of one block to read
    sta socketread_expected_length_lo  // TODO is this needed?
    sta CMD_DATA_REG  // cmd[3] length low byte
    lda #$00  // high byte of length
    sta socketread_expected_length_hi
    sta CMD_DATA_REG  // cmd[4] length high byte
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
    jsr wait_not_busy  // todle je porad soucast sendcommand

    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
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
    lda #PACKET_MAGIC_BYTE
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
