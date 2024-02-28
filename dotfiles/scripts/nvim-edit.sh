#!/bin/sh

file=$(mktemp)

wtype -M ctrl c -m ctrl
sleep 0.1s
wl-paste >"$file"

alacritty -e nvim "$file"

wl-copy <"$file"
wtype -M ctrl v -m ctrl

rm "$file"
