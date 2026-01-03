// test_net.asm
//
// This program connects to a TCP server, sends a message,
// receives the response, and stores it at $0400.
//
// Target: C64 with Ultimate-II+ or Ultimate 64 cartridge
// Assembler: KickAssembler

* = $1000 "Main Program"

// Ultimate cartridge registers
.const CONTROL_REG     = $df1c
.const CMD_DATA_REG    = $df1d
.const RESP_DATA_REG   = $df1e
.const STATUS_DATA_REG = $df1f
.const STATUS_REG      = $df1c // Also used for status flags

// Command Targets
.const TARGET_NETWORK  = $03

// Network Commands
.const NET_CMD_CONNECT = $07
.const NET_CMD_CLOSE   = $09
.const NET_CMD_READ    = $10
.const NET_CMD_WRITE   = $11

// Status bits
.const STATUS_BIT_CMD_BUSY = %00010000
.const STATUS_BIT_RESP_PENDING = %00100000

// Memory location for response
.const RESPONSE_BUFFER = $0400

// --- Main Program ---
start:
    // 1. Connect to the server
    jsr connect_to_server
    bcs connection_failed // Branch if carry is set (error)
    sta socket_id         // Store the returned socket ID

    // 2. Send the message
    jsr send_message
    bcs send_failed       // Branch on error

    // 3. Read the response
    jsr read_response
    bcs read_failed       // Branch on error

    // 4. Close the socket
    jsr close_socket

    // Exit program
    rts

connection_failed:
send_failed:
read_failed:
    // On failure, just exit
    rts

// --- Data ---
socket_id: .byte 0
host_ip:   .text "192.168.1.2"
           .byte 0
port:      .word 6464
message:   .text "Hello from C64!"
           .byte 0

// --- Subroutines ---

// Waits for the Ultimate command interface to be idle.
wait_idle:
!loop:
    lda STATUS_REG
    and #STATUS_BIT_CMD_BUSY | STATUS_BIT_RESP_PENDING
    bne !loop-
    rts

// Acknowledges a command by clearing the response pending flag.
accept_command:
    lda #%00000010
    sta CONTROL_REG
    rts

// connect_to_server
// Connects to the TCP server.
// Returns: A = socket ID, Carry set on error.
connect_to_server:
    jsr wait_idle

    // Set target to Network
    lda #TARGET_NETWORK
    sta CONTROL_REG

    // Send Connect command
    lda #NET_CMD_CONNECT
    sta CMD_DATA_REG

    // Send port (little-endian)
    lda <port
    sta CMD_DATA_REG
    lda >port
    sta CMD_DATA_REG

    // Send IP address (null-terminated string)
    ldx #0
!send_ip_loop:
    lda host_ip,x
    sta CMD_DATA_REG
    inx
    cmp #0
    bne !send_ip_loop-

    // Push the command to the cartridge to execute it
    lda #%00000001
    ora CONTROL_REG
    sta CONTROL_REG

    // Read response data (socket ID)
    jsr wait_idle
    lda RESP_DATA_REG
    sta socket_id

    // Read status messages (and discard them)
!read_status_loop:
    lda STATUS_REG
    and #%00000100 // Status data available bit
    beq !read_status_done+
    lda STATUS_DATA_REG
    jmp !read_status_loop-
!read_status_done:

    // Accept the command
    jsr accept_command

    // Check for success. A simple check is to see if socket ID is non-zero.
    // A more robust check would parse the status messages.
    lda socket_id
    cmp #0
    beq !error+ // If socket is 0, it failed
    clc        // Clear carry (success)
    rts
!error:
    sec // Set carry (error)
    rts

// send_message
// Sends the null-terminated message.
// Returns: Carry set on error.
send_message:
    jsr wait_idle

    // Set target to Network
    lda #TARGET_NETWORK
    sta CONTROL_REG

    // Send Write command
    lda #NET_CMD_WRITE
    sta CMD_DATA_REG

    // Send socket ID
    lda socket_id
    sta CMD_DATA_REG

    // Send message data
    ldx #0
!send_data_loop:
    lda message,x
    sta CMD_DATA_REG
    inx
    cmp #0
    bne !send_data_loop-

    // Push the command to the cartridge to execute it
    lda #%00000001
    ora CONTROL_REG
    sta CONTROL_REG

    // Accept the command
    jsr accept_command
    clc // Assume success for now
    rts

// read_response
// Reads data from the socket into RESPONSE_BUFFER.
// Returns: Carry set on error.
read_response:
    jsr wait_idle

    // Set target to Network
    lda #TARGET_NETWORK
    sta CONTROL_REG

    // Send Read command
    lda #NET_CMD_READ
    sta CMD_DATA_REG

    // Send socket ID
    lda socket_id
    sta CMD_DATA_REG

    // Send length to read (e.g., 1024 bytes)
    lda #<1024
    sta CMD_DATA_REG
    lda #>1024
    sta CMD_DATA_REG

    // Push the command to the cartridge to execute it
    lda #%00000001
    ora CONTROL_REG
    sta CONTROL_REG

    // Read the actual data length from response register
    jsr wait_idle
    lda RESP_DATA_REG
    sta read_len_lo
    lda RESP_DATA_REG
    sta read_len_hi

    // Read data into buffer
    ldy #0 // Index for buffer
!read_data_loop:
        // Check if all data has been read
        cpy read_len_lo
        bne !continue_read+
        lda read_len_hi
        cmp #0
        beq !read_done+ // Finished if high byte is 0
!continue_read:
        lda STATUS_REG
        and #%00000001 // Data available bit
        beq !read_data_loop- // Wait for data
        
        lda RESP_DATA_REG
        sta RESPONSE_BUFFER,y
        iny
        jmp !read_data_loop-

!read_done:
    // Null-terminate the received data
    lda #0
    sta RESPONSE_BUFFER,y

    // Accept the command
    jsr accept_command
    clc // Success
    rts

read_len_lo: .byte 0
read_len_hi: .byte 0

// close_socket
// Closes the given socket.
close_socket:
    jsr wait_idle

    // Set target to Network
    lda #TARGET_NETWORK
    sta CONTROL_REG

    // Send Close command
    lda #NET_CMD_CLOSE
    sta CMD_DATA_REG

    // Send socket ID
    lda socket_id
    sta CMD_DATA_REG

    // Push the command to the cartridge to execute it
    lda #%00000001
    ora CONTROL_REG
    sta CONTROL_REG

    // Accept the command
    jsr accept_command
    rts
