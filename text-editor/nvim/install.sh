#!/bin/bash

if ! command -v nvim &> /dev/null
then
    echo "you need to install 'nvim'"
    exit 84
fi

if [[ $PWD != */nvim ]]; then
    echo "you need to be in 'text-editor/nvim/' folder to execute this script"
    exit 84
fi

if [[ "$1" == "first" ]]; then
    # nvim plugin manager
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    # nvim config folder
    mkdir -p $HOME/.config
    mkdir -p $HOME/.config/nvim
    mkdir -p $HOME/.config/nvim/lua
    # config file for the installation
    echo "require('plugins')" > $HOME/.config/nvim/init.lua
    cp ./lua/plugins.lua $HOME/.config/nvim/lua/plugins.lua
    # how to
    echo ">> now, open nvim and write"
    echo ":PackerCompile"
    echo ">> Press enter and write"
    echo ":PackerInstall"
    echo ">> if there are no errors, just re execute this script:"
    echo "./install.sh second"
    exit 0
fi

if [[ "$1" == "second" ]]; then
    # copy the true config
    cp ./init.lua $HOME/.config/nvim/init.lua
    cp ./compile_flags.txt $HOME/.config/nvim/compile_flags.txt
    cp -r ./lua/ $HOME/.config/nvim/
    # how to
    echo ">> now, you should be able to use this config"
    exit 0
fi

echo ">> why are you here ?"
echo ">> i think you need to execute this script like this:"
echo "./install.sh first"
exit 84
