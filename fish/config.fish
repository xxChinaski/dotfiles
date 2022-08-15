if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    # set fish_vi_key_bindings
    # export PATH=$PATH:/home/dt/.local/bin/
    set -gx PATH ~/.local/bin $PATH

    alias ll="lsd -lait --group-dirs first"
    alias llt="lsd -lait --group-dirs first --tree"
    alias v="nvim"
    alias arU="sudo pacman -Su"
    alias mt="neomutt"
    alias ms="mdbook serve -p 8000"

    alias gs="git status"
    alias gad="git add ."
    alias gc="git commit -m" 
    alias gp="git push" 

    alias tks="tmux kill-server"
    alias tls="tmux ls"
    alias ta="tmux a"
    alias tn="tmux new-session -s"

    # SERVERS ALIAS
    alias ps="python -m http.server 8888" 
    # APache Run
    alias apr="sudo systemctl enable --now httpd"
    # APache End
    alias ape="sudo systemctl disable --now httpd"
    # APache Status
    alias aps="sudo systemctl status httpd"

    # bash ~/.config/fish/crunch.sh
    # bash ~/.config/fish/waves.sh
    bash ~/.config/fish/barsh.sh
    # pfetch
    starship init fish | source
end
