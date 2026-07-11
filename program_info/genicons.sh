#!/bin/bash

set -e

LAUNCHER_APPID="org.quartzlauncher.QuartzLauncher"

svg2png() {
    input_file="$1"
    output_file="$2"
    width="$3"
    height="$4"

    inkscape \
        -w "$width" \
        -h "$height" \
        -o "$output_file" \
        "$input_file"
}

# ----------------------------------------------------------------------
# Windows ICO
# ----------------------------------------------------------------------

if command -v inkscape >/dev/null && \
   command -v icotool >/dev/null && \
   command -v oxipng >/dev/null; then

    d=$(mktemp -d)

    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_16.png" 16 16
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_24.png" 24 24
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_32.png" 32 32
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_48.png" 48 48
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_64.png" 64 64
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_128.png" 128 128
    svg2png "${LAUNCHER_APPID}.svg" "$d/quartzlauncher_256.png" 256 256

    oxipng --opt max --strip all --alpha --interlace 0 "$d"/quartzlauncher_*.png

    rm -f quartzlauncher.ico

    icotool -o quartzlauncher.ico -c \
        "$d/quartzlauncher_256.png" \
        "$d/quartzlauncher_128.png" \
        "$d/quartzlauncher_64.png" \
        "$d/quartzlauncher_48.png" \
        "$d/quartzlauncher_32.png" \
        "$d/quartzlauncher_24.png" \
        "$d/quartzlauncher_16.png"

    echo "Generated quartzlauncher.ico"

else
    echo "Skipping Windows icon generation (inkscape/icotool/oxipng missing)."
fi

# ----------------------------------------------------------------------
# macOS ICNS
# ----------------------------------------------------------------------

if command -v inkscape >/dev/null && \
   command -v iconutil >/dev/null && \
   command -v oxipng >/dev/null; then

    tmp=$(mktemp -d)
    d="$tmp/quartzlauncher.iconset"

    mkdir -p "$d"

    # Используем отдельный SVG для macOS, если он есть
    if [ -f "${LAUNCHER_APPID}.bigsur.svg" ]; then
        SVG="${LAUNCHER_APPID}.bigsur.svg"
    else
        SVG="${LAUNCHER_APPID}.svg"
    fi

    svg2png "$SVG" "$d/icon_16x16.png" 16 16
    svg2png "$SVG" "$d/icon_16x16@2x.png" 32 32
    svg2png "$SVG" "$d/icon_32x32.png" 32 32
    svg2png "$SVG" "$d/icon_32x32@2x.png" 64 64
    svg2png "$SVG" "$d/icon_128x128.png" 128 128
    svg2png "$SVG" "$d/icon_128x128@2x.png" 256 256
    svg2png "$SVG" "$d/icon_256x256.png" 256 256
    svg2png "$SVG" "$d/icon_256x256@2x.png" 512 512
    svg2png "$SVG" "$d/icon_512x512.png" 512 512
    svg2png "$SVG" "$d/icon_512x512@2x.png" 1024 1024

    oxipng --opt max --strip all --alpha --interlace 0 "$d"/icon_*.png

    iconutil -c icns "$d"

    cp -v "$tmp/quartzlauncher.icns" .

    echo "Generated quartzlauncher.icns"

else
    echo "Skipping macOS icon generation (inkscape/iconutil/oxipng missing)."
fi

# ----------------------------------------------------------------------
# Launcher SVG
# ----------------------------------------------------------------------

if [ -d "../launcher/resources/multimc/scalable" ]; then
    cp -v "${LAUNCHER_APPID}.svg" \
        "../launcher/resources/multimc/scalable/launcher.svg"
fi

echo "Done."