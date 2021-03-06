#!/usr/bin/sh

cmd="\grep -A 1 Description ""$HOME""/.config/sxhkd/sxhkdrc | sed -e s/--/\ /g"
case $1 in
	fzf) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | fzf;;
	dmenu) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | dmenu -l 10 -p "Search Keybind";;
	rofi) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | rofi -dmenu -format i -markup-rows -no-show-icons -width 1000 -p "Search Keybind";;
	*) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | rofi -dmenu -format i -markup-rows -no-show-icons -width 1000 -p "Search Keybind";;
esac
