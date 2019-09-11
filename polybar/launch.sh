#!/bin/sh

echo "Running"
# terminate running bar instances
killall -q polybar

# wait until processes have ecitedd
while pgrep -x polybar >/dev/null; do
    echo "while loop"
    sleep 1
done

## launch bars
#disp=$(xrandr --query | grep HDMI)
#echo $disp
#if [[ $disp = *connected* ]]; then
#    echo "in here"
#    polybar top &
#fi

polybar base &
polybar base1 &
echo "Bars launched..."


