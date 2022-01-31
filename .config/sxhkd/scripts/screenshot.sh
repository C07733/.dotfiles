#!/bin/sh -e

selection=$(slop -b -3 -c 0.486,0.694,0.937,0.3 -l -f "-i %i -g %g")
shotgun $selection - | xclip -t 'image/png' -selection clipboard

dunstify "Screenshot Taken" "Cropped, to clipboard" -i ~/.icons/material-design-icons-modified/src/image/crop/materialicons/24px.svg
