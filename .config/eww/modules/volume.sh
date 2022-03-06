#!/bin/sh

if [ "$1" == "up" ]; then
	pamixer -i 5
elif [ "$1" == "down" ]; then
	pamixer -d 5
fi

eww update volume_percent="$(pamixer --get-volume)"
