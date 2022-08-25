#!/usr/bin/env bash

projectsList=$(ls -xm ~/projects |  sed 's/,/ /g'  )
projects=${projectsList[@]}

# echo $projects

rofiMenu(){
  for proj in $projects
  do 
    echo $proj
  done
  echo "kill server"
}

sessionSetup(){
  window=0 
  tmux rename-window -t $choice:$window 'EDITOR'
  tmux send-keys -t $choice:$window 'v' C-m
  tmux split-window -h
  tmux send-keys -t $choice:$window 'v' C-m
  tmux select-pane -t 0
  tmux select-layout -E

  window=1
  tmux new-window -t $choice:$window -n 'SERVER'
  tmux split-window 
  tmux split-window -h
  tmux split-window -h
  tmux select-layout main-vertical
  tmux select-pane -t 0
  tmux select-layout -E

  window=2
  tmux new-window -t $choice:$window -n 'ORG'
  tmux send-keys -t $choice:$window 'cd ~/org/src/' C-m
  tmux send-keys -t $choice:$window 'clear' C-m

  tmux select-window -t :=0
  # tmux attach-session -t $choice
}

mainRofi(){
  choice=$(rofiMenu | rofi -dmenu | cut -d. -f1)
  sessionExist=$(tmux ls | grep $choice)
  clientExist=$(tmux list-clients)

  if ! [ -n "$choice" ]; then 
    exit 0
  fi

  if [ "$choice" == "kill server" ]; then
    tmux kill-server
    exit 0
  fi

  cd ~/projects/$choice/

  if [ -n "$clientExist" ]; then
    if [ -z "$sessionExist" ]; then
      tmux new-session -ds $choice
      sessionSetup
    fi
  else
    if [ -n "$sessionExist" ]; then
		  kitty -e sh -c "sleep 0.1 ; tmux a -t $choice"
    else
      tmux new-session -ds $choice
      sessionSetup
      kitty -e sh -c "sleep 0.1 ; tmux a -t $choice"
    fi
  fi

  tmux switch-client -t $choice
}

mainRofi
