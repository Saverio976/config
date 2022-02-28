#!/bin/bash

alias zshconf="vim $HOME/.zshrc"
alias vimconf="vim $HOME/.vimrc"

# im in the vim matrix
alias :q="exit"

alias searchd="s-d"
alias searchf="s-f"
alias scrcpy="scrcpy -S -w --power-off-on-close --disable-screensaver"

alias normatrix="$HOME/.src/NorMatrix/exec.sh"

if command -v exa &> /dev/null
then
    # some color
    alias ls="exa -la"
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
