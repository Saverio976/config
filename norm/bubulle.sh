#!/bin/bash
# download and install the bubulle norminette (norm checker for the epitech norm)
echo ""
echo "install all python dependencies"
echo "python3 -m pip install pycparser pyparsing pycparser-fake-libc --user"
python3 -m pip install pycparser pyparsing pycparser-fake-libc --user
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
echo "rm -rf Bubulle-Norminette"
rm -rf Bubulle-Norminette
echo ""
echo "download source"
echo "git clone https://github.com/aureliancnx/Bubulle-Norminette.git"
echo ""
echo "cd Bubulle-Norminette"
cd Bubulle-Norminette
echo ""
echo "make ./install_bubulle.sh executable"
echo "chmod +x ./install_bubulle.sh"
chmod +x ./install_bubulle.sh
echo "install"
echo "sudo ./install_bubulle.sh"
sudo ./install_bubulle.sh
