#!/bin/bash
# download online audio with url

ECHO_HELP=0
if [ "$1" == "-h" ]
then
	ECHO_HELP=1
fi
if [ "$1" == "--help" ]
then
	ECHO_HELP=1
fi
if [ "$1" == "" ]
then
	ECHO_HELP=1
fi

if [ $ECHO_HELP -eq 1 ]
then
	echo "bash youtube_dl.sh URL [directory_path]"
	echo "download online audio with URL"
	echo "if you provide a directory path, it will download file here, else the current directory is used"
	exit
fi

if [ "$2" == "" ]
then
	DIR_PATH='.'
else
	DIR_PATH=$2
fi

echo ""
echo "check if you have the youtube-dl command-line program"
echo "
if ! command -v youtube-dl &> /dev/null
then
	sudo dnf install youtube-dl
	exit
fi
"
if ! command -v youtube-dl &> /dev/null
then
        sudo dnf install youtube-dl
fi
echo ""
echo "download audio"
echo "youtube-dl --ignore-config --no-progress --no-warnings --geo-bypass --yes-playlist --restrict-filenames --no-cache-dir --format 'bestaudio[ext=mp3]/bestaudio' $1 -o '$DIR_PATH/%(title)s.%(ext)s'"
youtube-dl --ignore-config --no-progress --no-warnings --geo-bypass --yes-playlist --restrict-filenames --no-cache-dir --format 'bestaudio[ext=mp3]/bestaudio' $1 -o "$DIR_PATH/%(title)s.%(ext)s"
