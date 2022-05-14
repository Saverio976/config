# pactl

## set output audio to hdmi
pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo

## set output audio to pc
pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo

# xrandr

## set second screen
xrandr --output HDMI-1-1 --mode 1920x1080 --right-of eDP1

## remove the second screen set
xrandr --auto

# gpg

## export key to file
gpg --export-secret-key KEY_ID > file

## import gpg
gpg --import file
