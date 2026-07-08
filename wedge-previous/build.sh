#!/usr/bin/env bash
# Reassembles rr38p-tmp12reu.bin from the per-bank Kick Assembler sources.
# Requires Kick Assembler (KICKASS env var, or edit the path below) and java.
#set -euo pipefail

KICKASS="${KICKASS:-/home/honza/projects/c64/pc-tools/kickass/KickAss.jar}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$DIR/build"
mkdir -p "$OUT"

BANKS=()
for n in 0 1 2 3 4 5 6 7; do
    nn=$(printf "%02d" "$n")
    src="$DIR/rr38p-tmp12reu.bank${nn}.asm"
    echo $src
    bin="$OUT/bank${nn}.bin"
    java -jar "$KICKASS" "$src" -o "$bin" 
#>/dev/null
    # strip the 2-byte PRG load-address header Kick Assembler prepends
    tail -c +3 "$bin" > "$bin.raw"
    BANKS+=("$bin.raw")
done

cat "${BANKS[@]}" > "$OUT/rr38p-tmp12reu.rebuilt.bin"

echo "Built: $OUT/rr38p-tmp12reu.rebuilt.bin"

# Package as a Retro Replay .crt (VICE cartconv, cart type 36/"rr") for flashing on Ultimate64/C64U.
CARTCONV="${CARTCONV:-cartconv}"
"$CARTCONV" -t rr -i "$OUT/rr38p-tmp12reu.rebuilt.bin" -o "$OUT/hdn-rr38p-tmp12reu.crt" \
    -n "CYBERPUNX RETRO REPLAY" >/dev/null
echo "Built: $OUT/hdn-rr38p-tmp12reu.crt"
