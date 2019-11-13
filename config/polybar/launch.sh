#!/bin/sh

# Terminate already running bar instances
killall -q polybar
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top &
polybar bottom &

echo "Bars launched..."


