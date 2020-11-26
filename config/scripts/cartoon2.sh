#!/bin/bash

convert -quiet "$@" +repage -depth 8 -selective-blur 0x5+10% /tmp/pre-cartoon1.mpc
convert /tmp/pre-cartoon1.mpc -level 0x60% -colorspace gray -posterize 6 -depth 8 -gamma 2.2 /tmp/pre-cartoon2.mpc

PreCartoon1=/tmp/pre-cartoon1.mpc
PreCartoon2=/tmp/pre-cartoon2.mpc

	convert "$PreCartoon1" \( "$PreCartoon2" -blur 0x1 \) \
		\( -clone 0 -clone 1 -compose over -compose multiply -composite -modulate 100,150,100 \) \
		\( -clone 0 -colorspace gray \) \
		\( -clone 3 -negate -blur 0x2 \) \
		\( -clone 3 -clone 4 -compose over -compose colordodge -composite -evaluate pow 4 -threshold 90% -statistic median 3x3 \) \
			-delete 0,1,3,4 -compose over -compose multiply -composite "${@/.[jJpP][nNpP][gG]/-cartoon.jpg}"

rm /tmp/pre-cartoon1.mpc
rm /tmp/pre-cartoon2.mpc
