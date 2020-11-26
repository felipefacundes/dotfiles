#!/bin/bash

convert -quiet "$@" +repage -depth 8 -selective-blur 0x5+10% /tmp/pre-cartoon1.jpg
convert /tmp/pre-cartoon1.jpg -level 0x60 -set colorspace RGB -colorspace gray -posterize 6 -depth 8 -colorspace sRGB /tmp/pre-cartoon2.jpg

PreCartoon1=/tmp/pre-cartoon1.jpg
PreCartoon2=/tmp/pre-cartoon2.jpg

	convert "$PreCartoon1" \( "$PreCartoon2" -blur 0x1 \) \
		\( -clone 0 -clone 1 -compose over -compose multiply -composite -modulate 100,150,100 \) \
		\( -clone 0 -set colorspace RGB -colorspace gray \) \
		\( -clone 3 -negate -blur 0x4 \) \
		\( -clone 3 -clone 4 -compose over -compose colordodge -composite \
			-evaluate pow 4 -threshold 4 -statistic median 3x3 \) \
			-delete 0,1,3,4 -compose over -compose multiply -composite -set filename:base "%[basename]" "%[filename:base]-cartoon.jpg"

rm /tmp/pre-cartoon1.jpg
rm /tmp/pre-cartoon2.jpg
