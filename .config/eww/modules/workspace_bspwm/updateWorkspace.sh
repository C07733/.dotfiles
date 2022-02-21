#!/bin/sh

if ! (set -o noclobber ; echo > /tmp/global.lock) ; then
    exit 1  # the global.lock already exists
fi

DIR="$(dirname "$(realpath "$0")")"
#echo $DIR

$DIR/clearWorkspace.sh
$DIR/desktopIconizer.sh

bspc subscribe node_swap node_transfer node_add node_remove | while read -r _ ; do
    $DIR/clearWorkspace.sh
    #$DIR/desktopIconizer.sh # ???
done &

bspc subscribe desktop_focus node_swap node_transfer node_add node_remove | while read -r _ ; do
    $DIR/desktopIconizer.sh
done 
