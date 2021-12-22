#!/bin/bash
# Download discord source and Install from terminal

echo ""
echo "create a source folder if no already exists"
mkdir -p $HOME/src/
echo ""
echo "go to this folder"
cd $HOME/src/
echo ""
echo "remove an ancient discord source if already downloaded"
rm -f ./Discord.tar.gz
echo ""
echo "download discord source"
curl -L -o ./Discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
echo ""
echo "Unzip it"
tar xf ./Discord.tar.gz
echo ""
echo "Delete an already existing desktop shortcut for discord if exists"
rm -f $HOME/Desktop/Discord
echo ""
echo "Create a shortcut for the desktop"
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
