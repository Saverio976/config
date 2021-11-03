#!bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
mkdir ~/.vim/colors
cp .vimcolor_iceberg.vim ~/.vim/colors/iceberg.vim
