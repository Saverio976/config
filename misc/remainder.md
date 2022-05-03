# pactl

## set output audio to hdmi
pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo

## set outputaudio to pc
pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo

## set second screen
xrandr --output HDMI-1-1 --mode 1920x1080 --right-of eDP1

## remove the second screen set
xrandr --auto
