#!/bin/bash

function help_it ()
{
	echo "USAGE:"
	echo "./install.sh (-h | --help | -install | -clean-install)"
	echo "DESCRIPTION"
	echo "-h --help        :    show this message"
	echo "-install         :    install (copy all file in nvim config folder)"
	echo "-clean-install   :    remove config folder, and add a fresh one"
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	help_it
	exit 0
fi

if [[ "$1" == "-install" || "$1" == "-clean-install" ]]; then
	# requirements
	if ! command -v nvim &> /dev/null; then
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
    # nvim config folder
    mkdir -p $HOME/.config
	if [[ "$1" == "-clean-install" ]]; then
		rm -rf $HOME/.config/nvim
	fi
	cd ..
	cp -r nvim $HOME/.config/
	nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
 #    # config file for the installation
 #    echo ">> now, open nvim and write"
 #    echo ":PackerCompile"
 #    echo ">> Press enter and write"
 #    echo ":PackerInstall"
	# echo ">> Press enter"
	exit 0
fi

help_it
exit 1
