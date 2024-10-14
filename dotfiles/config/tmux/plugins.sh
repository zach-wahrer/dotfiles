#!/bin/sh

TMUX_PLUGINS="$HOME/.config/tmux/plugins"

# Logging #
if [[ ! -d $TMUX_PLUGINS/tmux-logging ]]; then
	git clone https://github.com/tmux-plugins/tmux-logging $TMUX_PLUGINS/tmux-logging
fi

# Menus #
if [[ ! -d $TMUX_PLUGINS/tmux-menus ]]; then
	git clone https://github.com/jaclu/tmux-menus $TMUX_PLUGINS/tmux-menus
fi

# Fast Copy #
if [[ ! -d $TMUX_PLUGINS/tmux-fastcopy ]]; then
	git clone https://github.com/abhinav/tmux-fastcopy $TMUX_PLUGINS/tmux-fastcopy
fi
