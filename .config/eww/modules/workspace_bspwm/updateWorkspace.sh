#!/bin/sh

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
