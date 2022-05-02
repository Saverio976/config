if ! command -v gource &> /dev/null
then
    echo "need gource for this script"
    exit 84
fi
if ! command -v avconv &> /dev/null
then
    echo "need avconv for this script"
    exit 84
fi
if ! command -v ffmpeg &> /dev/null
then
    echo "need ffmpeg for this script"
    exit 84
fi

if [[ "$1" == "-h" ]];
then
    echo "USAGE: $0 projectName"
    echo "in a git repo and it will product a projectName.mp4"
    exit 0
fi

if [[ "$1" == "" ]];
then
    echo "please specify project name"
    exit 84
fi

gource -s .06 -1280x720 \
    --auto-skip-seconds .5 \
    --multi-sampling \
    --stop-at-end \
    --key \
    --highlight-users \
    --hide mouse \
    --background-colour 000000 \
    --title "$1" \
    --output-ppm-stream - \
    --output-framerate 30 | avconv -y -r 30 \
    -f image2pipe \
    -vcodec ppm \
    -i - \
    -b 65536K \
    movie.mp4 && ffmpeg -i movie.mp4 \
    -b:v 3048780 \
    -vcodec libx264 \
    -crf 24 "$1.mp4"

rm movie.mp4
