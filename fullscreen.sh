#!/bin/bash
checkfullscreen()
{
WINDOW=$(echo $(xwininfo -id $(xdotool getactivewindow) -stats | \
                egrep '(Width|Height):' | \
                awk '{print $NF}') | \
         sed -e 's/ /x/')
SCREEN=$(xdpyinfo | grep -m1 dimensions | awk '{print $2}')
if [ "$WINDOW" = "$SCREEN" ]; then
  	xdotool mousemove 0 500 
  	xdotool mousemove 0 501
fi
}

while true
do
  checkfullscreen
  sleep 300
done
