#!/bin/bash

# myTerm=kitty
#
# server=$(echo -n $(tmux list-sessions | grep server -m 1))
#
# if [[ ${#server} -gt 1 ]] 
#   then 
# 		$myTerm -e sh -c "sleep 0.1 ; cd $HOME/Develop/; tmux new-session -s FastSession"
#   else
# 		$myTerm -e sh -c "sleep 0.1 ; cd $HOME/Develop/; tmux -a"
# fi


session="NewSession"
proj="test"

mkdir /home/dt/Develop/$proj
cd /home/dt/Develop/$proj

tmux new-session -d -s $session

window=0 
tmux rename-window -t $session:$window 'VIM'
tmux send-keys -t $session:$window 'vi' C-m
tmux split-window -h
tmux send-keys -t $session:$window 'vi' C-m
tmux select-pane -t 0
tmux select-layout -E

window=1
tmux new-window -t $session:$window -n 'SERVER'
tmux split-window 
tmux split-window -h
tmux split-window -h
tmux select-layout main-vertical
tmux select-pane -t 0
tmux select-layout -E

window=2
tmux new-window -t $session:$window -n 'ORG'
tmux send-keys -t $session:$window 'cd ~/org/src/' C-m
tmux send-keys -t $session:$window 'clear' C-m

tmux select-window -t :=0

tmux attach-session -t $session
