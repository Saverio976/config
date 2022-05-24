#!/bin/bash

# conf
alias i3conf="nvim $HOME/.config/i3/config"
alias zshconf="nvim $HOME/.zshrc"
alias vimconf="nvim $HOME/.vimrc"
alias starshipconf="nvim $HOME/.config/starship.toml"

# im in the vim matrix
alias :q="exit"

alias searchd="s-d"
alias searchf="s-f"
alias scrcpy="scrcpy -S -w --power-off-on-close --disable-screensaver"
alias restartx="sudo systemctl restart lightdm.service"
alias normatrix="$HOME/source/NorMatrix/main.py"

alias audio-input-toggle="pactl set-source-mute @DEFAULT_SOURCE@ toggle"
alias audio-output-toggle="pactl set-sink-mute @DEFAULT_SINK@ toggle"

# prompt gpg password on tty
GPG_TTY=$(tty)
export GPG_TTY

function replace_command() {
    command_replace=$(echo $2 | awk '{print $1;}')
    if command -v $command_replace &> /dev/null
    then
        alias $1="$2"
    fi
}

replace_command "ls" "exa -la"
replace_command "cat" "bat"
replace_command "htop" "btm"

if command -v starship &> /dev/null
then
    eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null
then
    eval "$(zoxide init zsh --cmd cd)"
fi

# search directory name
function s-d () {
    if [[ "$2" == "" ]]
    then
        CHECK="."
    else
        CHECK=$2
    fi
    find $CHECK -type d -name "*$1*"
}

# search file name
function s-f () {
    if [[ "$2" == "" ]]
    then
        CHECK="."
    else
        CHECK=$2
    fi
    find $CHECK -type f -name "*$1*"
}

# clean pacman cache
function cleanpacman () {
    OLDPKG=$(pacman -Qdtq)
    if [[ "$OLDPKG" != "" ]]
    then
        sudo pacman -Rns $OLDPKG
    fi
    if [[ "$1" == "y" ]]
    then
        yes | sudo pacman -Scc
    else
        sudo pacman -Scc
    fi
}

# clean yay cache
function cleanyay () {
    OLDPKG=$(yay -Qdtq)
    if [[ "$OLDPKG" != "" ]]
    then
        sudo yay -Rns $OLDPKG
    fi
    if [[ "$1" == "y" ]]
    then
        yes | sudo yay -Scc
    else
        sudo yay -Scc
    fi
}

function man () {
    if [[ "$1" == "google" ]]; then
        xdg-open 'https://duckduckgo.com/?q='$2
    else
        /bin/man "$@"
    fi
}
