#!/bin/bash

set -e

PDF_DIR="./images"
CROPPED="Cropped"

if ! command -v pdfcrop &> /dev/null; then
    echo "❌ pdfcrop is not installed or not in PATH."
    exit 1
fi

for pdf_file in "$PDF_DIR"/*.pdf; do
    [ -e "$pdf_file" ] || continue
    base_name="$(basename "$pdf_file" .pdf)"
    cropped_file="$PDF_DIR/$base_name$CROPPED.pdf"
    echo "🔄 Cropping: $pdf_file → $cropped_file"
    pdfcrop "$pdf_file" "$cropped_file"
done

echo "✅ All PDF images cropped."
