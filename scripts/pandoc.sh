#!/bin/sh
cd "$(dirname "$0")"
pandoc ../praxisbericht.tex -t plain -o ../praxisbericht.txt
echo "Generated praxisbericht.txt"