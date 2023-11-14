#!/usr/bin/env sh
if [ "$(kitty @ ls | grep -c '            "title": "nvim-output')" -eq 0 ];
then
  kitty @ --to "$KITTY_LISTEN_ON" new-window --keep-focus --title "nvim-output" "$SHELL"
fi
