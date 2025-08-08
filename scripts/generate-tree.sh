#!/usr/bin/env bash
set -euo pipefail

DIR="${1:-}"
OUTDIR="./trees"

if [[ -z "$DIR" ]]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi
if [[ ! -d "$DIR" ]]; then
    echo "Error: '$DIR' is not a directory" >&2
    exit 1
fi

mkdir -p "$OUTDIR"

BASE="$(basename "$DIR")"
tree --charset=utf-8 -F --noreport "$DIR" \
| tr -d '\r' \
| sed -e 's/\xC2\xA0/ /g' \
> "$OUTDIR/$BASE.tree"

echo "Wrote: $OUTDIR/$BASE.tree"
