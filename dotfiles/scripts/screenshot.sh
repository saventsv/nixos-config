#!/usr/bin/env bash


dir="$HOME/Pictures"
mkdir -p "$dir"


tmp=$(mktemp --suffix=.png)

scrot -s "$tmp" -f -z -i || exit 1

name=$(printf "" | dmenu -p "Screenshot name:")

# Default to timestamp if empty
[ -z "$name" ] && name=$(date +'%Y-%m-%d_%H-%M-%S')

mv "$tmp" "$dir/$name.png"
