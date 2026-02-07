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
PYI_NAME = hdnsh-cloud

ifeq ($(OS),Windows_NT)
PYI_DATA_SEP = ;
PYI_EXE_EXT = .exe
else
PYI_DATA_SEP = :
PYI_EXE_EXT =
endif

# Common VICE emulator options

REU_OPTS = -reu -reusize 128
DISK_OPTS = -9 data/001a.d64 -10 data/002b.d64 -8 data/image1.d64
# DISK_OPTS = -8 data/image1.d64
FS11_OPTS = -iecdevice11 -device11 1 -fs11 data/
#FS9_OPTS = -iecdevice9 -device9 1 -fs9 data/
VICE_OPTS = $(REU_OPTS) $(DISK_OPTS) $(FS11_OPTS)


.PHONY: all build run-vice run-c64u run-std clean cloud-server test-cloud cloud-client release ui-build ui-copy backend-package


all: build


build:
	mkdir -p $(BIN_DIR)
	rm -f $(BIN_OUT) $(BIN_DIR)/*.dbg $(BIN_DIR)/*.sym $(BIN_DIR)/*.vs $(BIN_DIR)/*.prg
	java -jar $(KICKASS_JAR) $(ASM_SRC) -afo -libdir $(SRC_DIR) -o $(BIN_OUT) -vicesymbols
# 	mv -f *.dbg *.sym *.vs *.prg $(BIN_DIR) 2>/dev/null || true


run-vice: build
	x64sc -basic $(BIN_OUT) $(VICE_OPTS)

run-c64u: build
	curl -T binaries/hdnsh.bin ftp://192.168.1.65/Flash/roms/
	python test/test_dmaservice.py

run-std:
	x64sc -basic /usr/local/share/vice/C64/basic-901226-01.bin $(VICE_OPTS) $(ARG)


# Upload and run test_net.prg on Ultimate 64
.PHONY: run-prg1
run-prg1: test_net.prg
	curl -X POST --header "Content-Type: application/octet-stream" --data-binary @test_net.prg http://192.168.1.65/v1/runners:run_prg

# Build test_net.prg if not present
test_net.prg: test_net.asm
	java -jar $(KICKASS_JAR) test_net.asm -o test_net.prg

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


release: clean-release ui-build ui-copy backend-package-win backend-package-linux backend-package-mac
clean-release:
	rm -f $(RELEASE_DIR)/hdnsh-cloud $(RELEASE_DIR)/hdnsh-cloud.exe $(RELEASE_DIR)/hdnsh-cloud-mac $(RELEASE_DIR)/hdnsh-server-win.exe $(RELEASE_DIR)/hdnsh-server-linux $(RELEASE_DIR)/hdnsh-server-mac

ui-build:
	cd $(UI_DIR) && npm install
	cd $(UI_DIR) && npm run build

ui-copy:
	rm -rf $(CLOUD_STATIC_DIR)
	cp -r $(UI_DIST) $(CLOUD_STATIC_DIR)

backend-package-win:
	rm -rf $(CLOUD_DIR)/build-win $(CLOUD_DIR)/dist-win $(CLOUD_DIR)/*.spec
	cd $(CLOUD_DIR) && pyinstaller --clean --onefile --name hdnsh-server-win --add-data "static;static" cloud.py
	mkdir -p $(RELEASE_DIR)
	cp -f $(CLOUD_DIR)/dist/hdnsh-server-win.exe $(RELEASE_DIR)/

backend-package-linux:
	rm -rf $(CLOUD_DIR)/build-linux $(CLOUD_DIR)/dist-linux $(CLOUD_DIR)/*.spec
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean --onefile --name hdnsh-server-linux --add-data "static:static" cloud.py
	mkdir -p $(RELEASE_DIR)
	cp -f $(CLOUD_DIR)/dist/hdnsh-server-linux $(RELEASE_DIR)/

backend-package-mac:
	rm -rf $(CLOUD_DIR)/build-mac $(CLOUD_DIR)/dist-mac $(CLOUD_DIR)/*.spec
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean --onefile --name hdnsh-server-mac --add-data "static:static" cloud.py
	mkdir -p $(RELEASE_DIR)
	cp -f $(CLOUD_DIR)/dist/hdnsh-server-mac $(RELEASE_DIR)/

backend-package-mac:
	rm -rf $(CLOUD_DIR)/build-mac $(CLOUD_DIR)/dist-mac $(CLOUD_DIR)/*.spec
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean --onefile --name $(PYI_NAME)-mac --add-data "static:static" cloud.py
	mkdir -p $(RELEASE_DIR)
	cp -f $(CLOUD_DIR)/dist/$(PYI_NAME)-mac $(RELEASE_DIR)/