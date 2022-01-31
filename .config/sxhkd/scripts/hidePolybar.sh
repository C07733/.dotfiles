#!/bin/sh

polybarHide=/tmp/.polybarHide

if [ ! -f "$polybarHide" ]; then
    touch $polybarHide
    bspc config top_padding 0  
    hideIt.sh -N '^polybar-example_HDMI2$' -S -d top -p 0 & disown 
else 
  TOGGLE=/tmp/.toggle
  if [ ! -f "$TOGGLE" ]; then
      touch $TOGGLE
      bspc config top_padding 28 && hideIt.sh -N '^polybar-example_HDMI2$' -t 
  else
      rm $TOGGLE
      bspc config top_padding 0 && hideIt.sh -N '^polybar-example_HDMI2$' -t
  fi
fi
