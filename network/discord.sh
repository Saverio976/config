#!/bin/bash
# Install discord from terminal

echo ""
echo "create a source folder if no already exists"
echo "mkdir -p $HOME/src/"
mkdir -p $HOME/src/
echo ""
echo "go to this folder"
echo "cd $HOME/src/"
cd $HOME/src/
echo ""
echo "remove an ancient discord source if already downloaded"
echo "rm -rf ./Discord.tar.gz"
rm -f ./Discord.tar.gz
echo "rm -rf ./Discord"
echo ""
echo "download discord source"
echo "curl -L -o ./Discord.tar.gz 'https://discord.com/api/download?platform=linux&format=tar.gz'"
curl -L -o ./Discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
echo ""
echo "Unzip it"
echo "tar xf ./Discord.tar.gz"
tar xf ./Discord.tar.gz
echo ""
echo "Delete an already existing desktop shortcut for discord if exists"
echo "rm -f $HOME/Desktop/Discord"
rm -f $HOME/Desktop/Discord
echo ""
echo "Create a shortcut for the desktop"
echo "(view the command in the source file)"
rm -f "$HOME/Desktop/Discord.desktop"
echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Discord
Comment=Discord application
Exec=$HOME/src/Discord/Discord
Icon=$HOME/src/Discord/discord.png
Terminal=false
Path=$HOME/src/Discord" >> $HOME/Desktop/Discord.desktop
echo ""
# prompt a good indicator
echo "Succesfull installation"
