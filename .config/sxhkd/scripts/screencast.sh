#!/bin/sh -e
if pidof ffmpeg
  then
    killall ffmpeg
    dunstify "Recording Ended" "Saved to ~/Videos" -i ~/.icons/material-design-icons-modified/src/action/not_started/materialicons/24px.svg
  else 
    slop=$(slop -b -3 -c 1,0.4,0.298,0.3 -l -f "%x %y %w %h")

    read -r X Y W H < <(echo $slop)

    time=$(date +%F%T)


    # only start recording if we give a width (e.g we press escape to get out of slop - don't record)
    width=${#W}

    if [ $width -gt 0 ];
     then
      dunstify "Recording Started" "Saving to ~/Videos" -i ~/.icons/material-design-icons-modified/src/action/not_started/materialicons/24px.svg
      # records without audio input
      # for audio add "-f alsa -i pulse" to the line below (at the end before \, without "")
      ffmpeg -f x11grab -s "$W"x"$H" -framerate 60  -thread_queue_size 512  -i $DISPLAY.0+$X,$Y \
       -vcodec libx264 -qp 18 -preset ultrafast \
       ~/Videos/recording-$time.mp4
    fi
fi
