# INSTALL - Shell Script
## some shell script
(and other if you modify dnf)

- install discord (https://discord.com/)
```sh
cd network/
bash discord.sh
```
- my vim config (vim-plug installation in the shell script)
```sh
cd text-editor/vim/
bash ./vim-config.sh
vim # it may appears some warnings, just press enter until vim window opens
:PlugInstall # it will take some minutes to clone all plugins
:qa
cd $HOME/.vim/plugged/YouCompleteMe/
python3 install.py --clangd-completer
# if you have an error, you need to install python3-devel or python3-dev, depends of your linux distribution
vim
:YcmTabnineHub # it will open a web browser, you can configure tabnine in it (an auto completion engine)
# now, you have a nice vim that dont seems to be vim....
```
- youtube-dl (install https://github.com/ytdl-org/youtube-dl first)
```sh
cd misc/
misc/youtube_dl URL [directory_path]
```

## LICENSE
[MIT](LICENSE)
