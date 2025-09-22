#!/bin/sh

file=$(mktemp)

wtype -M ctrl c -m ctrl
sleep 0.1s
wl-paste >"$file"

ghostty -e nvim "$file"

wl-copy <"$file"
wtype -M ctrl v -m ctrl

rm "$file"
