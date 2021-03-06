#!/usr/bin/env sh

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/colorblocks"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
sleep 1

# Launch 2nd bar if 2nd monitor is connected
second_monitor=$(xrandr --query | grep 'HDMI-0')
if [[ $second_monitor = *connected* ]]; then
	polybar -q second -c "$DIR"/config.ini &
fi

# Launch 3rd bar if 3rd monitor is connected
third_monitor=$(xrandr --query | grep 'DVI-D-0')
if [[ $third_monitor = *connected* ]]; then
	polybar -q third -c "$DIR"/config.ini &
fi
