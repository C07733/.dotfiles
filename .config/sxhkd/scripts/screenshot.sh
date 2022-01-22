#!/bin/sh -e

selection=$(slop -b 3 -p -3 -c 0.486,0.694,0.937,0.3 -l -f "-i %i -g %g")
shotgun $selection - | xclip -t 'image/png' -selection clipboard


