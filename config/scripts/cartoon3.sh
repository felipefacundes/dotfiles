#!/bin/bash
convolution=0.70
dx="-$convolution,0,$convolution,-$convolution,0,$convolution,-$convolution,0,$convolution"
dy="$convolution,$convolution,$convolution,0,0,0,-$convolution,-$convolution,-$convolution"

convert -quiet -regard-warnings $@ -colorspace RGB +repage /tmp/pre-cartoon1.jpg
convert \( /tmp/pre-cartoon1.jpg -median 2 \) \( -size 1x256 gradient: -rotate 90 -fx "floor(u*10+0.5)/10" \) -clut /tmp/pre-cartoon2.jpg

convert \( /tmp/pre-cartoon1.jpg -colorspace gray -median 2 \) \
	\( -clone 0 -bias 50% -convolve "$dx" -solarize 50% \) \
	\( -clone 0 -bias 50% -convolve "$dy" -solarize 50% \) \
	\( -clone 1 -clone 1 -compose multiply -composite -gamma 2 \) \
	\( -clone 2 -clone 2 -compose multiply -composite -gamma 2 \) \
	-delete 0-2 -compose plus -composite -threshold 75% /tmp/pre-cartoon3.jpg

convert /tmp/pre-cartoon2.jpg /tmp/pre-cartoon3.jpg -compose multiply -composite "${@/.[jJpP][nNpP][gG]/-cartoon.jpg}"
