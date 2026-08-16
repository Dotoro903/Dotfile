#!/bin/bash

tmp="/tmp/clip.$RANDOM.png"

if wl-paste --list-types | grep -q image/png; then
    wl-paste --type image/png > "$tmp"
elif wl-paste --list-types | grep -q image/jpeg; then
    tmp="${tmp%.png}.jpg"
    wl-paste --type image/jpeg > "$tmp"
else
    echo "No image in clipboard"
    exit 1
fi

imv "$tmp"
