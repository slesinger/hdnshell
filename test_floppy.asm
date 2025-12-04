// Test program for floppy.asm PrintDirectory routine
#import "floppy.asm"

*= $0801 "Basic Upstart"
    BasicUpstart(start)    // 10 sys$0810
* = $0810
start:
    // jsr PrintDirectory
    jsr LoadFile
    // jsr SaveFile
    rts
