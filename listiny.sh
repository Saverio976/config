#!/bin/bash
# Install mp3-music-listener from source (https://github.com/Saverio976/mp3-music-listener)
# you must first install v

echo ""
echo "create a source folder if no already exists"
echo "mkdir -p $HOME/src/"
mkdir -p $HOME/src/
echo ""
echo "go to this folder"
echo "cd $HOME/src/"
cd $HOME/src/
echo ""
echo "remove an ancient git clone of listiny"
echo "rm -rf mp3-music-listener"
rm -rf mp3-music-listener
echo ""
echo "download source"
echo "git clone https://github.com/Saverio976/mp3-music-listener.git"
git clone https://github.com/Saverio976/mp3-music-listener.git
echo ""
echo "go to the mp3-music-listener folder"
echo "cd mp3-music-listner"
cd mp3-music-listener
echo ""
echo "do the installation part"
echo "make build"
make build
echo ""
echo "installation succeed"
