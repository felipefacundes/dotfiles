#!/bin/bash
convert $@ \
\( -clone 0 -blur 0x5 \) \
\( -clone 0 -fill black -colorize 100 \) \
\( -clone 0 -define convolve:scale='!' \
-define morphology:compose=Lighten \
-morphology Convolve  'Sobel:>' \
-negate -evaluate pow 5 -negate -level 30x100% \) \
-delete 0 -compose over -composite \
-set filename:base "%[basename]" "%[filename:base]"-cartoon.jpg
