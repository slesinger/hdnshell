#importonce

#import "constants.asm"
#import "c64u_common.asm"

// DOS Commands
.const DOS_CMD_IDENTIFY = $01
.const DOS_CMD_OPEN_FILE = $02
.const DOS_CMD_CLOSE_FILE = $03
.const DOS_CMD_READ_DATA = $04
.const DOS_CMD_WRITE_DATA = $05
.const DOS_CMD_FILE_SEEK = $06
.const DOS_CMD_FILE_INFO = $07
.const DOS_CMD_FILE_STAT = $08
.const DOS_CMD_DELETE_FILE = $09
.const DOS_CMD_RENAME_FILE = $0a
.const DOS_CMD_COPY_FILE = $0b
.const DOS_CMD_CHANGE_DIR = $11
.const DOS_CMD_GET_PATH = $12
.const DOS_CMD_OPEN_DIR = $13
.const DOS_CMD_READ_DIR = $14
.const DOS_CMD_COPY_UI_PATH = $15
.const DOS_CMD_CREATE_DIR = $16
.const DOS_CMD_COPY_HOME_PATH = $17
.const DOS_CMD_LOAD_REU = $21
.const DOS_CMD_SAVE_REU = $22
.const DOS_CMD_MOUNT_DISK = $23
.const DOS_CMD_UMOUNT_DISK = $24
.const DOS_CMD_SWAP_DISK = $25
.const DOS_CMD_GET_TIME = $26
.const DOS_CMD_SET_TIME = $27
.const CTRL_CMD_ENABLE_DISK_A = $30
.const CTRL_CMD_DISABLE_DISK_A = $31
.const CTRL_CMD_ENABLE_DISK_B = $32
.const CTRL_CMD_DISABLE_DISK_B = $33
.const CTRL_CMD_DRIVE_A_POWER = $34
.const CTRL_CMD_DRIVE_B_POWER = $35
.const DOS_CMD_ECHO	 = $f0


// Ultimate Cartridge Detection Routine
// Addresses for the Ultimate Command Interface
// Sets FEATURE_FLAG_ULTIMATE in FEATURE_FLAGS if detected
// Returns: carry set if ultimate detected, clear if not
DetectUltimate:
    lda STATUS_REG
    beq !found_it+
    // plain c64, no ultimate
    lda FEATURE_FLAGS
    and #($ff - FEATURE_FLAG_ULTIMATE)
    sta FEATURE_FLAGS  // clear ultimate flag
    clc
    rts
!found_it:
    lda FEATURE_FLAGS
    ora #FEATURE_FLAG_ULTIMATE
    sta FEATURE_FLAGS  // set ultimate flag
    sec
    rts


// Replies like this: b'!*** C64 Ultimate (V1.47) 3.14 ***'
uii_identify:
    jsr wait_idle
    lda #TARGET_DOS1
    sta CMD_DATA_REG
    lda #DOS_CMD_IDENTIFY
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


