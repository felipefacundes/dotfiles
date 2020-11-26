#!/bin/bash
convert $@ +repage -depth 8 -selective-blur 0x5+10%% \
  \( -clone 0 \
    -level 0x60%% -colorspace gray -posterize 6 -depth 8 -gamma 2.2 \
    -blur 0x1 \) \
  \( -clone 0 -clone 1 -compose multiply -composite \
    -modulate 100,150,100 \) \
  \( -clone 0 -colorspace gray \) \
  \( -clone 3 -negate -blur 0x2 \) \
  \( -clone 3 -clone 4 -compose colordodge -composite \
    -evaluate pow 4 -threshold 90%% -statistic median 3x3 \) \
  -delete 0,1,3,4 \
  -compose multiply -composite "${@/.[jJpP][pPnN][gG]/-cartoon.jpg}"
