#!/bin/bash

if ! command -v ffmpeg &> /dev/null
then
    echo "install ffmpeg first"
    exit 84
fi
for FILE in $(/usr/bin/ls $1)
do
    ffmpeg -y -i $1/$FILE -c:a libvorbis -qscale 1 $1/$FILE
done
