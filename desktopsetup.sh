#!/bin/sh

killall -q polybar
polybar deezright &
polybar deezleft &
xrandr --output DP-3 --primary --auto --output DP-4 --right-of DP-3 --auto --output HDMI-0 --right-of DP-4 --auto &
feh --bg-fill /home/lou/Imagenes/000Wallpapers/Arca-TWINS-final.jpg &
echo "deez"
