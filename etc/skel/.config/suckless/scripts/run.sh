#!/bin/sh

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
run "alacritty -e xrandr --output DP1 --mode 1920x1080"
run "nm-applet"
run "pamac-tray"
run "variety -n"
run "xfce4-power-manager"
run "xfce4-clipman"
run "blueberry-tray"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

run pa-applet
run "numlockx on"

run sxhkd -c ~/.config/suckless/sxhkd/sxhkdrc &


###  Personal Apps ###
run /usr/bin/synology-drive &
#run setxkbmap -layout "us,il" -option "grp:alt_shift_toggle"
run redshift-gtk -l 31.046051:34.851612 &
run /home/ilan/DATA/SynologyDrive/SOFTWARE/Linux/AppImage/Nextcloud-3.17.1-x86_64.AppImage &

run picom -b  --config ~/.config/suckless/picom/picom.conf &
run /home/ilan/.bin/keyboard_tray.py &


pkill bar.sh
~/.config/suckless/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
