#!/bin/bash

if [[ "$XDG_CONFIG_HOME" == "" ]]; then
    XDG_CONFIG_HOME=$HOME/.config
fi

if [[ "$1" == "upload" ]]; then
    # nvim
    mv ./text-editor/nvim/install.sh ./install.sh
    rm -rf ./text-editor/nvim/
    cp -r $XDG_CONFIG_HOME/nvim ./text-editor/
    mv ./install.sh ./text-editor/nvim/install.sh
    rm -rf ./text-editor/nvim/undo
    rm -rf ./text-editor/nvim/plugin

    # other configs
    rm -rf ./.config/*
    cp -r $XDG_CONFIG_HOME/alacritty/ ./.config/
    cp -r $XDG_CONFIG_HOME/i3/ ./.config/
    cp -r $XDG_CONFIG_HOME/git/ ./.config/
elif [[ "$1" == "install" ]]; then
    cp -r ./.config/* $XDG_CONFIG_HOME
    echo "next command : sudo cp /usr/bin/pinentry-curses /usr/bin/pinentry"
    sudo cp /usr/bin/pinentry-curses /usr/bin/pinentry
    echo "for neovim, see readme"
else
    echo "valid options : [upload, install]"
fi