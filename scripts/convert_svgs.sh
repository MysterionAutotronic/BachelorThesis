#!/bin/bash

set -e

SVG_DIR="./images"

if ! command -v inkscape &> /dev/null; then
    echo "❌ Inkscape is not installed or not in PATH."
    exit 1
fi

for svg_file in "$SVG_DIR"/*.svg; do
    [ -e "$svg_file" ] || continue
    base_name="$(basename "$svg_file" .svg)"
    pdf_file="$SVG_DIR/$base_name.pdf"
    echo "🔄 Converting: $svg_file → $pdf_file"
    inkscape "$svg_file" --export-type=pdf --export-filename="$pdf_file"
done

echo "✅ All SVGs converted."
