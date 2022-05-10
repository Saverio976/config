if ! command -v gource &> /dev/null
then
    echo "need gource for this script"
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

gource --hide dirnames,filenames \
    --seconds-per-day 0.1 \
    --auto-skip-seconds 1 -1280x720 \
    --title "$1" -o - \
    --stop-at-end | ffmpeg -y -r 60 \
    -f image2pipe \
    -vcodec ppm -i - \
    -vcodec libx264 \
    -preset ultrafast \
    -pix_fmt yuv420p \
    -crf 1 \
    -threads 0 \
    -bf 0 $1.mp4
