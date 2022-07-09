if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -g SPACEFISH_PROMPT_SEPARATE_LINE false
    set -g SPACEFISH_CHAR_SYMBOL "➜ "
    set -g SPACEFISH_GIT_SYMBOL "שׂ "   

    alias ll="lsd -lait --group-dirs first"
    alias llt="lsd -lait --group-dirs first --tree"
    alias vi="nvim"
    alias arU="sudo pacman -Su"
    alias mt="neomutt"
    alias ms="mdbook serve -p 8000"

    alias gs="git status"
    alias gad="git add ."
    alias gc="git commit -m" 
    alias gp="git push" 

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
