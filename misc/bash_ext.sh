#!/bin/bash

# im in the vim matrix
alias :q="exit"

alias searchd="s-d"
alias searchf="s-f"
alias restartx="sudo systemctl restart lightdm.service"

# prompt gpg password on tty
export GPG_TTY=GPG_TTY=$(tty)
# xdg config
export XDG_CONFIG_HOME="$HOME/.config"

##############################################################################
# REPLACE COMMAND
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
replace_command "kill" "fkill"

# replace cd command
if command -v zoxide &> /dev/null
then
    eval "$(zoxide init zsh --cmd cd)"
fi
if command -v direnv &> /dev/null
then
    eval "$(direnv hook zsh)"
fi

##############################################################################
# ALIAS
function alias_if_exists() {
    command_exists=$(echo $2 | awk '{print $1;}')
    if command -v $command_exists &> /dev/null
    then
        alias $1="$2"
    fi
}

alias_if_exists "audio-input-toggle" "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
# alias audio-input-toggle="pactl set-source-mute @DEFAULT_SOURCE@ toggle"
alias_if_exists "audio-output-toggle" "pactl set-sink-mute @DEFAULT_SINK@ toggle"
# alias audio-output-toggle="pactl set-sink-mute @DEFAULT_SINK@ toggle"
alias_if_exists "scrcpy" "scrcpy -S -w --power-off-on-close --disable-screensaver"
# alias scrcpy="scrcpy -S -w --power-off-on-close --disable-screensaver"
alias_if_exists "normatrix" "$HOME/source/NorMatrix/main.py"
# alias normatrix="$HOME/source/NorMatrix/main.py"

alias_if_exists "termtosvg" "python3 -m termtosvg"

alias_if_exists "i3conf" "nvim $HOME/.config/i3/config"
# alias i3conf="nvim $HOME/.config/i3/config"
alias_if_exists "zshconf" "nvim $HOME/.zshrc"
# alias zshconf="nvim $HOME/.zshrc"
alias_if_exists "starshipconf" "nvim $HOME/.config/starship.toml"
# alias starshipconf="nvim $HOME/.config/starship.toml"

##############################################################################
# PROMPT
# if command -v starship &> /dev/null
# then
#     eval "$(starship init zsh)"
# fi

##############################################################################
# CUSTOM FUNCTION

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

# clean paru cache
function cleanparu () {
    OLDPKG=$(paru -Qdtq)
    if [[ "$OLDPKG" != "" ]]
    then
        sudo paru -Rns $OLDPKG
    fi
    if [[ "$1" == "y" ]]
    then
        yes | sudo paru -Scc
    else
        sudo paru -Scc
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

true_man_intern=$(which man)
function man () {
    if [[ "$1" == "google" ]]; then
        xdg-open 'https://duckduckgo.com/?q='$2
    else
        $true_man_intern "$@"
    fi
}
