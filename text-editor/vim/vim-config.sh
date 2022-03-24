#!/bin/bash

if ! command -v vim &> /dev/null
then
        echo "you need to install 'vim'"
	exit 84
fi

if [[ $PWD != */vim ]]; then
	echo "you need to be in 'text-editor/vim/' folder to execute this script"
	exit 84
fi

# vim plugin manager
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# save the ancient vimrc config
if [[ -f $HOME/.vimrc ]]; then
	mv $HOME/.vimrc $HOME/.vimrc.before
fi

# create the new vimrc file
cp .vimrc $HOME/.vimrc

# create folder for themes
mkdir -p $HOME/.vim/colors

# copy the iceberg theme
cp .vimcolor_iceberg.vim $HOME/.vim/colors/iceberg.vim

# copy ycm flags
cp .ycm_global_ycm_extra_conf.py $HOME/.vim/

echo "
-> now,
- open vim,
- run the command ':PlugInstall',
- exit vim,
- go the the folder '$HOME/.vim/plugged/YouCompleteMe/',
- run: python3 install.py --all,
-> GG you have the autocompletion"
