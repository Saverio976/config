# Shell Scripts
## to install discord
## to compress audio / png
## to have configs of vim / neovim / i3 / alacritty

- install discord (https://discord.com/)
```sh
cd network/
./discord.sh
```

- neovim config (packer installation in the shell script)
```sh
cd text-editor/nvim/
./install.sh first
# ... (do what the script will said)
./install.sh second
```
![neovim_file](/assets/open_one_file.png)
![neovim_terminal](/assets/terminal_inside.png)

- vim config (vim-plug installation in the shell script)
```sh
cd text-editor/vim/
./vim-config.sh
```

- youtube-dl (install https://github.com/ytdl-org/youtube-dl first)
```sh
cd misc/
./youtube-dl -h
```

- compress audio
```sh
cd misc/
./compress_audio.sh FOLDER
```

- compress png
```sh
cd misc/
./compress_png.sh FOLDER
```

## LICENSE
[MIT](LICENSE)
