#!/bin/bash

TMP_FILE=tmp_audio_will_be_moved.ogg

if ! command -v ffmpeg &> /dev/null
then
    echo "install ffmpeg first"
    exit 84
fi
for FILE in $(/usr/bin/ls $1)
do
    ffmpeg -i $1/$FILE -c:a libvorbis -qscale 1 $1/$TMP_FILE -y
    rm $1/$FILE
    mv $1/$TMP_FILE $1/${FILE/.*/.ogg}
done
