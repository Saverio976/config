#!/bin/bash

if [[ "$XDG_CONFIG_HOME" == "" ]]; then
    XDG_CONFIG_HOME=$HOME/.config
fi

if [[ "$1" == "upload" ]]; then
    # nvim
    mv ./text-editor/nvim/install.sh ./text-editor/install.sh
    rm -rf ./text-editor/nvim/
    cp -r $XDG_CONFIG_HOME/nvim ./text-editor/
    mv ./text-editor/install.sh ./text-editor/nvim/install.sh
    rm -rf ./text-editor/nvim/undo
    rm -rf ./text-editor/nvim/plugin
	# end nvim

    # other configs
    rm -rf ./.config/*
    cp -r $XDG_CONFIG_HOME/alacritty/ ./.config/
    cp -r $XDG_CONFIG_HOME/i3/ ./.config/
    cp -r $XDG_CONFIG_HOME/git/ ./.config/
    cp -r $XDG_CONFIG_HOME/kitty/ ./.config/
    cp -r $XDG_CONFIG_HOME/rofi ./.config/
    cp -r $XDG_CONFIG_HOME/polybar ./.config/
    cp $HOME/.p10k.zsh ./.config
    cp $HOME/.zshrc ./.config
elif [[ "$1" == "install" ]]; then
    mv ./.config/git/ /tmp/gitconfigtmp
    cp -r ./.config/* $XDG_CONFIG_HOME
    mv /tmp/gitconfigtmp ./.config/git
    rm -f $XDG_CONFIG_HOME/.p10k.zsh
    rm -f $XDG_CONFIG_HOME/.zshrc
    cp ./.config/.p10k.zsh $HOME
    cp ./.config/.zshrc $HOME
    if [ -f /usr/bin/pinentry-curses ]; then
        echo "next command : sudo cp /usr/bin/pinentry-curses /usr/bin/pinentry"
        echo "you can cancel this with ctrl+c"
        sudo cp /usr/bin/pinentry-curses /usr/bin/pinentry
        echo "for neovim, see readme"
    fi
else
    echo "valid options : [upload, install]"
fi
