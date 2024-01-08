#!/bin/sh

file=$(mktemp)

wtype -M ctrl c -m ctrl
sleep 0.1s
wl-paste >"$file"

# For some reason, wezterm will not stay open if wtype is called before it.
# wezterm start -- nvim "$file"
foot -- nvim "$file"

wl-copy <"$file"
wtype -M ctrl v -m ctrl

rm "$file"
