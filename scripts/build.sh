#!/usr/bin/env bash
# shellcheck shell=bash

set -euo pipefail

# Script that builds the font from the source files

# cd into the directory above this one and set a trap to restore working directory on exit.
# This is to ensure that the script can be run from anywhere.
echo "Initializing build script..."
cd "${0%/*}/.."
ORIGINAL_DIR="$(pwd -P)"
trap 'cd "$ORIGINAL_DIR"' EXIT

# Create build directory unless it already exists and cd into it
mkdir -p build
cd build

# Copy source font files from original location to build directory
echo "Copying source fonts..."
SRC_FONT_FILES="hersho_mono_regular.sfd hersho_mono_italic.sfd" 
for f in $SRC_FONT_FILES; do
    cp "../$f" .
done

# Generate OTF font files from SFD font
echo "Generating OTF fonts..."
for SRC_FONT_FILE in *.sfd; do
		# generate output filename
		BASE_FNAME=$(basename -s .sfd "$SRC_FONT_FILE")
		N1=$(echo "$BASE_FNAME" | cut -d _ -f 1 )
		N2=$(echo "$BASE_FNAME" | cut -d _ -f 2 )
		N3=$(echo "$BASE_FNAME" | cut -d _ -f 3 )
		OUT_FONT_FILE=$(printf "%s%s-%s.otf" "${N1^}" "${N2^}" "${N3^}") 
		
		# call the script to generate the OTF file
		../scripts/generate_otf.sh "$SRC_FONT_FILE" "$OUT_FONT_FILE"
done

# Setup nerd font patcher if it doesn't already exist
PATCHER_VERSION="3.0.2"
if [ ! -x font-patcher ]; then
    echo "Setting up nerd font patcher..."
    curl -O -L "https://github.com/ryanoasis/nerd-fonts/releases/download/v${PATCHER_VERSION}/FontPatcher.zip"
    unzip FontPatcher.zip
    rm FontPatcher.zip
else
    echo "Nerd font patcher already setup. Skipping..."
fi

# Patch font with nerd font glyphs
echo "Patching regular font with nerd font glyphs..."
for REGULAR_FONT_FILE in *.otf; do
		fontforge --script ./font-patcher --complete "$REGULAR_FONT_FILE"
done

# Generate preview image for nerd font
echo "Generating preview image for fonts..."
for font in ./*.otf; do
    fontimage "$font"
done

# Copy output fonts to fonts directory
echo "Copying output to fonts directory..."
mkdir -p ../fonts
cp ./*.otf ../fonts
cp ./*.png ../fonts

# print success message and cleanup
echo "Cleaning up..."
rm ./*.otf
rm ./*.sfd
rm ./*.png

echo "Yay! Build complete."
