#!/bin/sh

tmux has-session -t "PDE" 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -n "Config" -s "PDE"
	tmux send-keys -t 0 "cd ~/.config" "Enter" "nvim" "Enter"
	tmux split-window -v
	tmux send-keys -t 1 "cd ~/.config" "Enter"
	tmux resize-pane -y 15%
	tmux select-pane -t 0

	tmux new-window -n "Code"
	tmux send-keys -t 0 "cd ~/go/src" "Enter" "nvim" "Enter"
	tmux split-window -v
	tmux send-keys -t 1 "cd ~/go/src" "Enter"
	tmux resize-pane -y 15%
	tmux select-pane -t 0

	tmux new-window -n "Terms"
	tmux split-window -v
	tmux split-window -v
	tmux select-layout even-vertical
	tmux select-pane -t 0

	tmux new-window -n "Brainhole"
	tmux send-keys -t 0 "cd ~/Brainhole" "Enter" "nvim" "Enter"

	tmux select-window -t "PDE:Code"
fi

tmux attach-session -d -t "PDE"
