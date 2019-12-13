#!/bin/sh
xrandr --newmode "1366x768_60.00"  85.25  1366 1440 1576 1784  768 771 781 798 -hsync +vsync --output HDMI-1
xrandr --addmode HDMI-1 "1366x768-0"
#xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode HDMI-1 "1920x1080-0"

xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1 --off --output HDMI-1 --mode 1366x768 --pos 0x0 --rotate inverted --output DP-1 --off
