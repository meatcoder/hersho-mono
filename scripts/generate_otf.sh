#! /usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

# Check if 2 arguments were passed
# If not, print usage and exit

if [ "$#" -ne 2 ]; then
    echo "Generate OTF font from SFD source font"
    echo "Usage: $0 <input.sfd> <output.otf>"
    exit 1
fi

# Generate OTF font from SFD font
fontforge -c 'font = open(argv[1]); font.generate(argv[2])' "$1" "$2" 
