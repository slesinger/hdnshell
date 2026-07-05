#import "constants.asm"
#import "cmd_empty.asm"
#import "cmd_hash.asm"
#import "cmd_at.asm"
#import "cmd_cd.asm"
#import "cmd_frz.asm"
#import "cmd_g.asm"
#import "cmd_help.asm"
#import "cmd_info.asm"
#import "cmd_l.asm"
#import "cmd_lsll.asm"
#import "cmd_m.asm"
#import "cmd_mkdir.asm"
#import "cmd_mnt.asm"
#import "cmd_pwd.asm"
#import "cmd_r.asm"
#import "cmd_reset.asm"
#import "cmd_run.asm"
#import "cmd_time.asm"
#import "cmd_unknown.asm"
#import "cmd_umnt.asm"

// Token Table for parser generalisation
// Parser iterates over "current letter" which is a structure of 3 bytes:
// 1. expected key code
// 2. low byte address of next letter structure (or command execution address)
// 3. high byte address of next letter structure (or command execution address)
// This table is ordered by visiting token tree depth-first. Token tree rows are orderd alphabetically.
// KEY_NULL must always go to as a first item of table because if white space or end of string is reached, parser jumps to KEY_NULL entry to get command address.
// If table for current letter does not resolve to full command then KEY_NULL must be there also to resolve to end_of_command and defaults to read the first entry.
// If command can have arguments, KEY_SPACE entry must be there to resolve to command execution address.
// Each table must end by PARSER_END_OF_TABLE marker.
.byte $88, $88, $88, $88
// Top level
tbl:
.byte KEY_NULL, <tbl_null, >tbl_null  // empty line
.byte KEY_HASH, <tbl_hash, >tbl_hash
.byte KEY_AT, <tbl_at, >tbl_at
.byte KEY_C, <tbl_c, >tbl_c
.byte KEY_D, <tbl_d, >tbl_d
.byte KEY_F, <tbl_f, >tbl_f
.byte KEY_G, <tbl_g, >tbl_g
.byte KEY_H, <tbl_h, >tbl_h
.byte KEY_I, <tbl_i, >tbl_i
.byte KEY_L, <tbl_l, >tbl_l
.byte KEY_M, <tbl_m, >tbl_m
.byte KEY_P, <tbl_p, >tbl_p
.byte KEY_R, <tbl_r, >tbl_r
.byte KEY_T, <tbl_t, >tbl_t
.byte KEY_U, <tbl_u, >tbl_u
.byte KEY_X, <tbl_x, >tbl_x
.byte PARSER_END_OF_TABLE
.byte PARSER_END_OF_TABLE
.byte PARSER_END_OF_TABLE

tbl_null:
.byte KEY_NULL, <cmd_empty, >cmd_empty  // empty line


// Top level #device
tbl_hash:
.byte KEY_NULL, <cmd_hash, >cmd_hash
.byte KEY_8, <tbl_hash_device, >tbl_hash_device
.byte KEY_9, <tbl_hash_device, >tbl_hash_device
.byte KEY_C, <tbl_hash_device, >tbl_hash_device  // CSDB.dk
.byte KEY_F, <tbl_hash_device, >tbl_hash_device  // Ultimate 64 Flash
.byte KEY_H, <tbl_hash_device, >tbl_hash_device  // Ultimate 64 Home
.byte KEY_S, <tbl_hash_device, >tbl_hash_device  // SoftIEC
.byte KEY_T, <tbl_hash_device, >tbl_hash_device  // Ultimate 64 Temp
.byte PARSER_END_OF_TABLE

tbl_hash_device:
.byte KEY_NULL, <cmd_hash, >cmd_hash
.byte PARSER_END_OF_TABLE


tbl_at:
.byte KEY_NULL, <cmd_at, >cmd_at
.byte PARSER_END_OF_TABLE

// Top level C
tbl_c:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown  // c without arguments
.byte KEY_D, <tbl_cd, >tbl_cd
.byte PARSER_END_OF_TABLE

tbl_cd:
.byte KEY_NULL, <cmd_cd, >cmd_cd
.byte PARSER_END_OF_TABLE


// Top level D
tbl_d:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_I, <tbl_di, >tbl_di
.byte PARSER_END_OF_TABLE

tbl_di:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_R, <tbl_dir, >tbl_dir
.byte PARSER_END_OF_TABLE

tbl_dir:
.byte KEY_NULL, <cmd_dir, >cmd_dir  // dir with arguments
.byte PARSER_END_OF_TABLE


// Top level F
tbl_f:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_R, <tbl_fr, >tbl_fr
.byte PARSER_END_OF_TABLE

tbl_fr:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_Z, <tbl_frz, >tbl_frz
.byte PARSER_END_OF_TABLE

tbl_frz:
.byte KEY_NULL, <cmd_frz, >cmd_frz  // freeze has no arguments
.byte PARSER_END_OF_TABLE


// Top level G
tbl_g:
.byte KEY_NULL, <cmd_g, >cmd_g  // g without arguments  // TODO g has one mandatory argument - address
.byte PARSER_END_OF_TABLE


// Top level H
tbl_h:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_E, <tbl_he, >tbl_he
.byte PARSER_END_OF_TABLE

tbl_he:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_L, <tbl_hel, >tbl_hel
.byte PARSER_END_OF_TABLE

tbl_hel:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_P, <tbl_help, >tbl_help
.byte PARSER_END_OF_TABLE

tbl_help:
.byte KEY_NULL, <cmd_help, >cmd_help  // no args
.byte PARSER_END_OF_TABLE


// Top level I
tbl_i:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_N, <tbl_in, >tbl_in
.byte PARSER_END_OF_TABLE

tbl_in:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_F, <tbl_inf, >tbl_inf
.byte PARSER_END_OF_TABLE

tbl_inf:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_O, <tbl_info, >tbl_info
.byte PARSER_END_OF_TABLE

tbl_info:
.byte KEY_NULL, <cmd_info, >cmd_info  // no args
.byte PARSER_END_OF_TABLE

// Top level L
tbl_l:
.byte KEY_SPACE, <cmd_l, >cmd_l  // l with arguments
.byte KEY_L, <tbl_ll, >tbl_ll
.byte KEY_S, <tbl_ls, >tbl_ls
.byte PARSER_END_OF_TABLE

tbl_ll:
.byte KEY_NULL, <cmd_ll, >cmd_ll   // ll without arguments
.byte KEY_SPACE, <cmd_ll, >cmd_ll  // ll with arguments
.byte PARSER_END_OF_TABLE

tbl_ls:
.byte KEY_NULL, <cmd_ls, >cmd_ls   // ls without arguments  // must be fist position to read command address after carry flag identifies the end of command
.byte KEY_SPACE, <cmd_ls, >cmd_ls  // ls with arguments
.byte PARSER_END_OF_TABLE


// Top level M
tbl_m:
.byte KEY_NULL, <cmd_m, >cmd_m   // m without arguments
.byte KEY_SPACE, <cmd_m, >cmd_m  // m with arguments
.byte KEY_K, <tbl_mk, >tbl_mk
.byte KEY_N, <tbl_mn, >tbl_mn
.byte PARSER_END_OF_TABLE

tbl_mk:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_D, <tbl_mkd, >tbl_mkd
.byte PARSER_END_OF_TABLE

tbl_mkd:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_I, <tbl_mkdi, >tbl_mkdi
.byte PARSER_END_OF_TABLE

tbl_mkdi:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_R, <tbl_mkdir, >tbl_mkdir
.byte PARSER_END_OF_TABLE

tbl_mkdir:
.byte KEY_SPACE, <cmd_mkdir, >cmd_mkdir  // mkdir with arguments
.byte PARSER_END_OF_TABLE

tbl_mn:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_T, <tbl_mnt, >tbl_mnt
.byte PARSER_END_OF_TABLE

tbl_mnt:
.byte KEY_SPACE, <cmd_mnt, >cmd_mnt  // mkdir with arguments
.byte PARSER_END_OF_TABLE


// Top level P
tbl_p:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_W, <tbl_pw, >tbl_pw
.byte PARSER_END_OF_TABLE

tbl_pw:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_D, <tbl_pwd, >tbl_pwd
.byte PARSER_END_OF_TABLE

tbl_pwd:
.byte KEY_NULL, <cmd_pwd, >cmd_pwd  // pwd without arguments
.byte PARSER_END_OF_TABLE


// Top level R
tbl_r:
.byte KEY_NULL, <cmd_r, >cmd_r  // r without arguments
.byte KEY_E, <tbl_re, >tbl_re
.byte KEY_U, <tbl_ru, >tbl_ru
.byte KEY_SHIFT_U, <tbl_rU, >tbl_rU
.byte PARSER_END_OF_TABLE

tbl_re:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_S, <tbl_res, >tbl_res
.byte PARSER_END_OF_TABLE

tbl_res:
.byte KEY_NULL, <cmd_reset, >cmd_reset
.byte PARSER_END_OF_TABLE


tbl_ru:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_N, <tbl_run, >tbl_run
.byte PARSER_END_OF_TABLE

tbl_rU:
.byte KEY_NULL, <cmd_run, >cmd_run  // no args
.byte PARSER_END_OF_TABLE

tbl_run:
.byte KEY_NULL, <cmd_run, >cmd_run  // no args
.byte PARSER_END_OF_TABLE


// Top level T
tbl_t:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_I, <tbl_ti, >tbl_ti
.byte PARSER_END_OF_TABLE

tbl_ti:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_M, <tbl_tim, >tbl_tim
.byte PARSER_END_OF_TABLE

tbl_tim:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_E, <tbl_time, >tbl_time
.byte PARSER_END_OF_TABLE

tbl_time:
.byte KEY_NULL, <cmd_time, >cmd_time  // no args
.byte PARSER_END_OF_TABLE


// Top level U
tbl_u:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_M, <tbl_um, >tbl_um
.byte PARSER_END_OF_TABLE

tbl_um:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_N, <tbl_umn, >tbl_umn
.byte PARSER_END_OF_TABLE

tbl_umn:
.byte KEY_T, <tbl_umnt, >tbl_umnt
.byte PARSER_END_OF_TABLE

tbl_umnt:
.byte KEY_NULL, <cmd_umnt, >cmd_umnt  // umnt with arguments
.byte PARSER_END_OF_TABLE

// Top level X
tbl_x:
.byte KEY_NULL, <cmd_x, >cmd_x  // x without arguments
.byte PARSER_END_OF_TABLE
