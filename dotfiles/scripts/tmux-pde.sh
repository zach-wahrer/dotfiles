#!/bin/sh

tmux has-session -t "PDE" 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -n "Config" -s "PDE" -x - -y -
	tmux split-window -v
	tmux select-pane -t 0
	tmux resize-pane -t 0 -y 75%
	tmux send-keys -t 0 "cd ~/dotfiles" "Enter" "nvim" "Enter"
	tmux send-keys -t 1 "cd ~/dotfiles" "Enter"

	tmux new-window -n "Code"
	tmux split-window -v
	tmux select-pane -t 0
	tmux resize-pane -t 0 -y 75%
	tmux send-keys -t 0 "cd ~/go/src" "Enter" "nvim" "Enter"
	tmux send-keys -t 1 "cd ~/go/src" "Enter"

	tmux new-window -n "Terms"
	tmux split-window -v
	tmux split-window -v
	tmux select-layout even-vertical
	tmux send-keys -t 2 "cd ~/go/src/backend" "Enter" "make redis" "Enter"
	tmux select-pane -t 0

	tmux new-window -n "Brainhole"
	tmux send-keys -t 0 "cd ~/Brainhole" "Enter" "nvim" "Enter"

	tmux select-window -t "PDE:Code"
fi

tmux attach-session -d -t "PDE"
