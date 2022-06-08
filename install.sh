echo "What is your command to install a package ?"
echo "("
echo "example:"
echo "-arch: pacman -S"
echo "-debian: apt install"
echo ")"
echo "-> "
read COMMAND_INSTALL

if [[ "$(uname -a | grep 'arch')" != "" ]]; then
    echo "do you want to install paru and use it instead of pacman [y/n] ?"
    echo ""
    read PARU_OR_ARCH
    if [[ "$PARU_OR_ARCH" == "y" ]]; then
        cd /tmp
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        COMMAND_INSTALL="paru -S"
    fi
fi

cd /tmp
git clone https://github.com/Saverio976/config.git config
cd config

./get_configs.sh

for LINE in $(/bin/cat | grep -v -e '^#'); do
    sudo $COMMAND_INSTALL $LINE
done

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now dhcpcd

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo ""
echo "for neovim config"
echo "go to /tmp/config/text-editor/nvim/"
echo "and execute ./install.sh"
