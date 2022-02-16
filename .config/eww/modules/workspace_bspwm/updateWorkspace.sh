#!/bin/sh

DIR="$(dirname "$(realpath "$0")")"
#echo $DIR

$DIR/clearWorkspace.sh
$DIR/updateWorkspace.sh
bspc subscribe desktop_focus node_swap node_transfer node_add node_remove | while read -r _ ; do
    $DIR/clearWorkspace.sh
    $DIR/updateWorkspace.sh
done 
