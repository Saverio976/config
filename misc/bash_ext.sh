#!/bin/bash

# conf
alias i3conf="vim $HOME/.config/i3/config"
alias zshconf="vim $HOME/.zshrc"
alias vimconf="vim $HOME/.vimrc"

# im in the vim matrix
alias :q="exit"

alias searchd="s-d"
alias searchf="s-f"
alias scrcpy="scrcpy -S -w --power-off-on-close --disable-screensaver"
alias audio-input-toggle="pactl set-source-mute @DEFAULT_SOURCE@ toggle"
alias restartx="sudo systemctl restart lightdm.service"
alias normatrix="$HOME/.src/NorMatrix/exec.sh"

# prompt gpg password on tty
GPG_TTY=$(tty)
export GPG_TTY

if command -v exa &> /dev/null
then
    # some color
    alias ls="exa -la"
fi

if command -v bat &> /dev/null
then
    # some color
    alias cat="bat"
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
