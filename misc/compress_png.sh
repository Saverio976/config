#!/bin/bash

if ! command -v optipng &> /dev/null
then
    echo "install optipng first"
    exit 84
fi
for FILE in $(/usr/bin/ls $1)
do
    optipng $1/$FILE
done
