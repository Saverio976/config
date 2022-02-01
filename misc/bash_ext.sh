#!/bin/bash

alias zshconf="vim $HOME/.zshrc"
alias vimconf="vim $HOME/.vimrc"

# im in the vim matrix
alias :q="exit"

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
alias searchd="s-d"

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
alias searchf="s-f"

alias normatrix="$HOME/.src/NorMatrix/exec.sh"

function clean () {
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
