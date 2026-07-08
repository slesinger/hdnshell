#!/bin/bash
# Build all 8 banks of the Retro Replay 3.8p image with KickAssembler and
# verify the result is byte-identical to the point-of-truth binary
# rr38p-tmp12reu.bin (65536 bytes = 8 banks x 8192).
set -e
cd "$(dirname "$0")"

KICKASS="${KICKASS:-/home/honza/projects/c64/pc-tools/kickass/KickAss.jar}"
OUT=build
mkdir -p "$OUT"

for bank in 0 1 2 3 4 5 6 7; do
    src="rr38p-tmp12reu.bank0${bank}.asm"
    java -jar "$KICKASS" -binfile -o "$OUT/bank0${bank}.bin" "$src" > "$OUT/bank0${bank}.log" 2>&1 \
        || { echo "ASSEMBLY FAILED: $src"; tail -20 "$OUT/bank0${bank}.log"; exit 1; }
    mv -f "rr38p-tmp12reu.bank0${bank}.sym" "$OUT/" 2>/dev/null || true
    size=$(stat -c%s "$OUT/bank0${bank}.bin")
    if [ "$size" -ne 8192 ]; then
        echo "SIZE MISMATCH: bank0${bank}.bin is $size bytes, expected 8192"
        exit 1
    fi
done

cat "$OUT"/bank00.bin "$OUT"/bank01.bin "$OUT"/bank02.bin "$OUT"/bank03.bin \
    "$OUT"/bank04.bin "$OUT"/bank05.bin "$OUT"/bank06.bin "$OUT"/bank07.bin > "$OUT/rr38p-built.bin"

if cmp -s "$OUT/rr38p-built.bin" rr38p-tmp12reu.bin; then
    echo "OK: built image is byte-identical to rr38p-tmp12reu.bin"
else
    echo "MISMATCH: built image differs from rr38p-tmp12reu.bin"
    cmp "$OUT/rr38p-built.bin" rr38p-tmp12reu.bin | head -5
    exit 1
fi
