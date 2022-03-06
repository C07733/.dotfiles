#!/bin/sh
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap br

xkbcomp -xkb "$DISPLAY" - | sed 's#key <CAPS>.*#key <CAPS> {\
    repeat=no,\
    type[group1]="ALPHABETIC",\
    symbols[group1]=[ Caps_Lock, Caps_Lock],\
    actions[group1]=[ LockMods(modifiers=Lock),\
    Private(type=3,data[0]=1,data[1]=3,data[2]=3)]\
};\
#' | xkbcomp -w 0 - "$DISPLAY"

xsetroot -cursor_name left_ptr

xset r rate 250 50

# This is pobrably not secure at all, but it'll work for most casual desktop usage
# betterlockscreen --lock

pipewire &
pipewire-pulse &
wireplumber &

exec bspwm
