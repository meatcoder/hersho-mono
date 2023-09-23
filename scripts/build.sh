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

# Copy source font from original location to build directory
echo "Copying source font..."
SRC_FONT_FILE="hersho_mono.sfd"
cp "../$SRC_FONT_FILE" .

# Generate OTF font from SFD font
echo "Generating OTF font..."
OUT_FONT_FILE="HershoMono-Regular.otf"
../scripts/generate_otf.sh "$SRC_FONT_FILE" "$OUT_FONT_FILE"

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
echo "Patching font with nerd font glyphs..."
fontforge --script ./font-patcher --complete "$OUT_FONT_FILE"

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
