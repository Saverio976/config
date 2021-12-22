#!/bin/bash

if ! command -v vim &> /dev/null
then
        echo "you need to install 'vim'"
	exit 84
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
mkdir ~/.vim/colors
cp .vimcolor_iceberg.vim ~/.vim/colors/iceberg.vim

echo "now, open vim, run the command 'PlugInstall'
exit vim, go the the folder '$(HOME)/.vim/plugged/YouCompleteMe/'
run: python3 install.py --all
now you have the autocompletion"
