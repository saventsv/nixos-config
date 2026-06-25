#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# find images (adjust extensions if needed)
choice=$(find "$WALLPAPER_DIR" -type f \
  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
  | dmenu -i -l 10 -p "Wallpaper:")

# exit if nothing selected
[ -z "$choice" ] && exit 0

# set wallpaper
feh --bg-fill "$choice"
