#!/bin/bash


tmux new -d -s CONFIG -n TMUX 'bash -c "nvim ~/.tmux.conf; exec bash"' \;\
	new-window -n NVIM 'bash -c "cd ~/.config/nvim && nvim; exec bash"' \;\
	new-window -n BASH 'bash -c "nvim ~/.bashrc; exec bash"' \;\
	select-window -t CONFIG:1 \;\
	attach-session -t CONFIG

