mkdir -p $HOME/.src/

cd $HOME/.src/
if [[ -f NorMatrix ]]; then
	rm -rf NorMatrix
fi

git clone https://github.com/Saverio976/NorMatrix
if [[ $? != 0 ]]; then
	echo git clone failed
	exit 1
fi

cd NorMatrix/

if [[ $SHELL == *bash* ]]; then
	echo alias normatrix="$PWD/main.py" >> $HOME/.bashrc
else if [[ $SHELL == *zsh* ]]; then
	echo alias normatrix="$PWD/main.py" >> $HOME/.zshrc
else
	echo put "alias normatrix=$PWD/main.py" in your shell config
	exit 0
fi

echo Installation Done
