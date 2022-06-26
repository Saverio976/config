# Shell Scripts

thanks to https://github.com/Abstract-IDE/Abstract for the base neovim config
(i will not say it is a clone, but, hum, yes xD)

## to download youtube audio

- youtube-dl (install https://github.com/ytdl-org/youtube-dl first)
```sh
cd misc/
./youtube-dl -h
```

## to install discord

- install discord (https://discord.com/)
```sh
cd network/
./discord.sh
```

## to compress audio / png
```sh
./misc/compress_png.sh folder
./misc/compress_audio.sh folder
```

## to have my neovim

- neovim config (packer installation in the shell script)
```sh
cd text-editor/nvim/
./install.sh first
# ... (do what the script will said)
./install.sh second
```
![neovim_file](/assets/open_one_file.png)
![neovim_terminal](/assets/terminal_inside.png)

## to have my vim (will not be maintained)

- vim config (vim-plug installation in the shell script)
```sh
cd text-editor/vim/
./vim-config.sh
```

## to install all

```sh
./install.sh
```

## to only get fil configuration

```sh
./get_configs.sh install
```

## LICENSE
[MIT](LICENSE)
