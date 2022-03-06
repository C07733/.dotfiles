#!/bin/sh

# Convert these floating point numbers into integers to better clean this code up

#Brightness=`stdbuf -o0 xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`

#newBrightness=$(echo "$Brightness + $1" | bc -l)

newBrightness=$(echo "scale=2; ($1) / 100" | bc -l)

if (( $(echo "$newBrightness >= 1.0" | bc -l) )); then
	xrandr --output HDMI2 --brightness 1

	echo "HI CAP"
	sleep 0.1

elif (( $(echo "$newBrightness <= 0.2" | bc -l) )); then
	xrandr --output HDMI2 --brightness 0.2

	echo "LOW CAP"
	sleep 0.1

else

	xrandr --output HDMI2 --brightness $newBrightness
fi

