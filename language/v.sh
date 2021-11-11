#!/bin/bash
# Install vlang from terminal

echo ""
echo "create a source folder if not already exists"
echo "mkdir -p $HOME/src/"
mkdir -p $HOME/src/
echo ""
echo "go to this folder"
echo "cd $HOME/src/"
cd $HOME/src/
echo ""
echo "remove vlang source if already exists"
echo "rm -rf ./v/"
rm -rf ./v/
echo ""
echo "download source"
echo "git clone https://github.com/vlang/v"
git clone https://github.com/vlang/v
echo ""
echo "go to the v folder"
cd v
echo ""
echo "install v"
echo "if you have any error, please install 'libatomic'"
echo "make"
make
echo ""
echo "to use v anywhere, use : 'sudo $HOME/src/v/v symlink'"
