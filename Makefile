# Makefile for Hondani Shell project


# Paths
KICKASS_JAR = /home/honza/projects/c64/pc-tools/kickass/KickAss.jar
SRC_DIR = src
BIN_DIR = binaries
ASM_SRC = $(SRC_DIR)/hdnsh.asm
BIN_OUT = $(BIN_DIR)/hdnsh.bin

# Common VICE emulator options

REU_OPTS = -reu -reusize 128
DISK_OPTS = -9 data/001a.d64 -10 data/002b.d64 -8 data/image1.d64
# DISK_OPTS = -8 data/image1.d64
FS11_OPTS = -iecdevice11 -device11 1 -fs11 data/
#FS9_OPTS = -iecdevice9 -device9 1 -fs9 data/
VICE_OPTS = $(REU_OPTS) $(DISK_OPTS) $(FS11_OPTS)


.PHONY: all build run run-std clean cloud-server test-cloud cloud-client


all: build


build:
	mkdir -p $(BIN_DIR)
	rm -f $(BIN_OUT) $(BIN_DIR)/*.dbg $(BIN_DIR)/*.sym $(BIN_DIR)/*.vs $(BIN_DIR)/*.prg
	java -jar $(KICKASS_JAR) $(ASM_SRC) -afo -libdir $(SRC_DIR) -o $(BIN_OUT) -vicesymbols
# 	mv -f *.dbg *.sym *.vs *.prg $(BIN_DIR) 2>/dev/null || true


run: build
	x64sc -basic $(BIN_OUT) $(VICE_OPTS)


run-std:
	x64sc -basic /usr/local/share/vice/C64/basic-901226-01.bin $(VICE_OPTS) $(ARG)

clean:
	rm -rf $(BIN_DIR)
	rm -f ${SRC_DIR}/*.sym


cloud-server:
	make -C cloud cloud-server


cloud-client:
	make -C cloud cloud-client



# Tests

test-cloud:
	make -C cloud test-cloud

test-client:
	make -C cloud test-client