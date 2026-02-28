# Makefile for Hondani Shell project


# Paths
KICKASS_JAR = /home/honza/projects/c64/pc-tools/kickass/KickAss.jar
SRC_DIR = src
BIN_DIR = binaries
ASM_SRC = $(SRC_DIR)/hdnsh.asm
BIN_OUT = $(BIN_DIR)/hdnsh.bin

# Cloud/UI packaging
UI_DIR = ui
UI_DIST = $(UI_DIR)/dist
CLOUD_DIR = cloud
CLOUD_STATIC_DIR = $(CLOUD_DIR)/static
RELEASE_DIR = release
# Common VICE emulator options

REU_OPTS = -reu -reusize 128
DISK_OPTS = -9 data/001a.d64 -10 data/002b.d64 -8 data/image1.d64
# DISK_OPTS = -8 data/image1.d64
FS11_OPTS = -iecdevice11 -device11 1 -fs11 data/
#FS9_OPTS = -iecdevice9 -device9 1 -fs9 data/
VICE_OPTS = $(REU_OPTS) $(DISK_OPTS) $(FS11_OPTS)


.PHONY: build-basic run-hdn-vice run-c64u run-std-vice run-test_net clean
.PHONY: build-ui run-ui run-server test-server test-client
.PHONY: clean-dist copy-to-release package-win package-linux package-mac


clean:
	rm -rf $(BIN_DIR)
	rm -f ${SRC_DIR}/*.sym


# BASIC

build-basic:
	mkdir -p $(BIN_DIR)
	rm -f $(BIN_OUT) $(BIN_DIR)/*.dbg $(BIN_DIR)/*.sym $(BIN_DIR)/*.vs $(BIN_DIR)/*.prg
	java -jar $(KICKASS_JAR) $(ASM_SRC) -afo -libdir $(SRC_DIR) -o $(BIN_OUT) -vicesymbols

run-hdn-vice: build-basic
	x64sc -basic $(BIN_OUT) $(VICE_OPTS)

run-c64u: build-basic
	curl -T binaries/hdnsh.bin ftp://192.168.1.65/Flash/roms/
	python test/test_dmaservice.py

run-std-vice:
	x64sc -basic /usr/local/share/vice/C64/basic-901226-01.bin $(VICE_OPTS) $(ARG)


# test_net.prg on Ultimate 64
run-test_net:
	java -jar $(KICKASS_JAR) test_net.asm -o test_net.prg
	curl -X POST --header "Content-Type: application/octet-stream" --data-binary @test_net.prg http://192.168.1.65/v1/runners:run_prg


# UI

build-ui:
	cd $(UI_DIR) && npm install
	cd $(UI_DIR) && npm run build

run-ui:
	cd $(UI_DIR) && npm run dev


# Server

run-server:
	$(MAKE) -C cloud run-server


# Tests

test-server:
	$(MAKE) -C cloud test-server

test-client:
	$(MAKE) -C cloud test-client


# Release packaging

# Clean up dist folder before build
clean-dist:
	rm -rf $(CLOUD_DIR)/dist/

# Copy built executables from dist to release only if build succeeded
copy-to-release:
	mkdir -p $(RELEASE_DIR)
	if [ -f $(CLOUD_DIR)/dist/hdnsh-server-linux ]; then cp -f $(CLOUD_DIR)/dist/hdnsh-server-linux $(RELEASE_DIR)/; fi
	if [ -f $(CLOUD_DIR)/dist/hdnsh-server-mac ]; then cp -f $(CLOUD_DIR)/dist/hdnsh-server-mac $(RELEASE_DIR)/; fi
	# Windows build is handled by PowerShell script

package-win:
	echo "Use release.ps1 PowerShell script instead"

package-linux: build-ui clean-dist
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean --onefile --name hdnsh-server-linux --add-data "static:static" cloud.py
	$(MAKE) copy-to-release

package-mac:
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean --onefile --name hdnsh-server-mac --add-data "static:static" cloud.py
	$(MAKE) copy-to-release
