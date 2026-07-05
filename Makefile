# Makefile for Hondani Shell project


# Paths
KICKASS_JAR = /home/honza/projects/c64/pc-tools/kickass/KickAss.jar
# ROM v1 is discontinued; its sources now live in src-discontinued and are only
# built by the legacy targets below.
SRC_DIR = src-discontinued
BIN_DIR = binaries
ASM_SRC = $(SRC_DIR)/hdnsh.asm
BIN_OUT = $(BIN_DIR)/hdnsh.bin

# Cartridge wedge (the current product)
WEDGE_DIR = wedge
CRT_OUT = $(WEDGE_DIR)/build/hdn-rr38p-tmp12reu.crt

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


.PHONY: build-crt build-basic-legacy run-hdn-vice run-c64u run-std-vice run-test_net clean
.PHONY: build-ui run-ui run-server test-server test-client
.PHONY: clean-dist copy-to-release package-win package-linux package-mac
.PHONY: github-release release


clean:
	rm -rf $(BIN_DIR)
	rm -f ${SRC_DIR}/*.sym


# Cartridge (current product) — reassemble the RR wedge banks and package the .crt
build-crt:
	$(WEDGE_DIR)/build.sh

# BASIC ROM v1 (discontinued) — kept only for the legacy VICE/C64U run targets below
build-basic-legacy:
	mkdir -p $(BIN_DIR)
	rm -f $(BIN_OUT) $(BIN_DIR)/*.dbg $(BIN_DIR)/*.sym $(BIN_DIR)/*.vs $(BIN_DIR)/*.prg
	java -jar $(KICKASS_JAR) $(ASM_SRC) -afo -libdir $(SRC_DIR) -o $(BIN_OUT) -vicesymbols

run-hdn-vice: build-basic-legacy
	x64sc -basic $(BIN_OUT) $(VICE_OPTS)

run-c64u: build-basic-legacy
	curl -T binaries/hdnsh.bin ftp://192.168.1.65/Flash/roms/
	python test/test_dmaservice.py
	sleep 5
	curl -X PUT http://192.168.1.65/v1/machine:reboot

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

run-server-testclient:
	$(MAKE) -C cloud run-testclient

install-server-packages:
	pip install -r cloud/requirements.txt

upgrade-server-packages:
	echo "This will take some time, please be patient"; \
	pip-compile --upgrade

check-server:
	black cloud --exclude cloud/lightrag; \
	flake8 --max-line-length=3000 --extend-ignore E203,E402,E501 cloud --exclude cloud/lightrag; \
	echo; \
	echo "Static code analysis is running..."; \
	mypy --check-untyped-defs cloud/cloud.py

# Tests

test-server:
	$(MAKE) -C cloud test-server

test-client:
	$(MAKE) -C cloud test-client


# Release packaging

# Resolve version from latest git tag; strip leading 'v'; fall back to 0.0.0
GIT_VERSION := $(shell git describe --tags --abbrev=0 2>/dev/null | sed 's/^[vV]//')
VERSION ?= $(if $(GIT_VERSION),$(GIT_VERSION),0.0.0)

# Clean up dist folder before build
clean-dist:
	rm -rf $(CLOUD_DIR)/dist/

# Copy built executables from dist to release only if build succeeded
copy-to-release:
	mkdir -p $(RELEASE_DIR)
	if [ -f $(BIN_OUT) ]; then cp -f $(BIN_OUT) $(RELEASE_DIR)/; fi
	if [ -f $(CLOUD_DIR)/dist/hdnsh-server-linux ]; then cp -f $(CLOUD_DIR)/dist/hdnsh-server-linux $(RELEASE_DIR)/; fi
	if [ -f $(CLOUD_DIR)/dist/hdnsh-server-mac ]; then cp -f $(CLOUD_DIR)/dist/hdnsh-server-mac $(RELEASE_DIR)/; fi
	# Windows build is handled by PowerShell script

package-win:
	echo "Use release.ps1 PowerShell script instead"

package-linux: build-ui clean-dist
	echo '__version__ = "$(VERSION)"' > $(CLOUD_DIR)/version.py
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean hdnsh-server-linux.spec
	$(MAKE) copy-to-release

package-mac:
	echo '__version__ = "$(VERSION)"' > $(CLOUD_DIR)/version.py
	cd $(CLOUD_DIR) && python3 -m PyInstaller --clean hdnsh-server-linux.spec
	$(MAKE) copy-to-release


# Full build: linux server + copy to release.
# The cartridge (.crt) is built separately via `make build-crt` and published by hand.
release: package-linux copy-to-release


# Create a git tag, build everything, and publish a GitHub release with all assets in release/
# Usage: make github-release VERSION=1.2.3 [NOTES="optional release notes"]
#        VERSION is required; if omitted the target will abort.
NOTES ?=
github-release:
	@test -n "$(VERSION)" || (echo "ERROR: VERSION is required.  Usage: make github-release VERSION=1.2.3"; exit 1)
	@echo "--- Building release v$(VERSION) ---"
	$(MAKE) release VERSION=$(VERSION)
	@echo "--- Tagging v$(VERSION) ---"
	git tag -a "v$(VERSION)" -m "Release v$(VERSION)"
	git push origin "v$(VERSION)"
	@echo "--- Creating GitHub release v$(VERSION) ---"
	gh release create "v$(VERSION)" $(RELEASE_DIR)/* \
		--title "v$(VERSION)" \
		$(if $(NOTES),--notes "$(NOTES)",--generate-notes)
	@echo "--- Release v$(VERSION) published ---"
