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

# nvim plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

# copy config
cp ./init.lua $HOME/.config/nvim
cp -r ./lua/* $HOME/.config/nvim/
cp ./.ycm_global_ycm_extra_conf.py $HOME/.config/nvim/

echo "
-> now,
- open nvim
- run the command ':PackerCompile',
- run ':PackerInstall',
- exit nvim,
- go to the folder $HOME/.local/share/nvim/site/pack/packer/start/YouCompleteMe/
- run: python3 install.py --clangd-completer
-> GG you have the autocompletion
"
