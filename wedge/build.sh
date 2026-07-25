#!/usr/bin/env bash
# Reassembles rr38p-tmp12reu.bin from the per-bank Kick Assembler sources.
# Requires Kick Assembler (KICKASS env var, or edit the path below) and java.
set -euo pipefail

KICKASS="${KICKASS:-/home/honza/projects/c64/pc-tools/kickass/KickAss.jar}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$DIR/build"
mkdir -p "$OUT"

# Version stamped into the .crt cartridge-name header field (offset $20, 32 bytes).
# That field lives in the .crt container, NOT in the banks mapped into the C64, so
# it costs zero cartridge/C64 memory. The HDN Server reads it back to show which
# release is flashed. Prefer an explicit CART_VERSION (passed by `make` at release),
# else the exact git tag on HEAD; an untagged dev build stays "dev" (-> "unknown" in
# the UI), which is itself the "you flashed an unpublished build" signal.
VER="${CART_VERSION:-$(git -C "$DIR" describe --tags --exact-match 2>/dev/null || true)}"
VER="${VER#v}"; VER="${VER#V}"
if [ -n "$VER" ]; then
    CART_NAME="HDNSH RR v$VER"
else
    CART_NAME="HDNSH RR dev"
fi
echo "Cartridge name field: $CART_NAME"

BANKS=()
for n in 0 1 2 3 4 5 6 7; do
    nn=$(printf "%02d" "$n")
    src="$DIR/rr38p-tmp12reu.bank${nn}.asm"
    bin="$OUT/bank${nn}.bin"
    java -jar "$KICKASS" "$src" -o "$bin" #>/dev/null
    # strip the 2-byte PRG load-address header Kick Assembler prepends
    tail -c +3 "$bin" > "$bin.raw"
    BANKS+=("$bin.raw")
done

cat "${BANKS[@]}" > "$OUT/rr38p-tmp12reu.rebuilt.bin"

echo "Built: $OUT/rr38p-tmp12reu.rebuilt.bin"

# Package as a Retro Replay .crt (VICE cartconv, cart type 36/"rr") for flashing on Ultimate64/C64U.
CARTCONV="${CARTCONV:-cartconv}"
"$CARTCONV" -t rr -i "$OUT/rr38p-tmp12reu.rebuilt.bin" -o "$OUT/hdn-rr38p-tmp12reu.crt" \
    -n "$CART_NAME" >/dev/null
echo "Built: $OUT/hdn-rr38p-tmp12reu.crt"

# Deploy to BOTH flashable names in wedge/ -- a stale copy under either name
# once shadowed a fresh build and invalidated a whole hardware test round.
cp "$OUT/hdn-rr38p-tmp12reu.crt" "$DIR/hdn-rr38p-tmp12reu.crt"
echo "Deployed: $DIR/hdn-rr38p-tmp12reu.crt"
