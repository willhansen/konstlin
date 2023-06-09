#!/bin/bash

A="$1"
B="$2"


convert -size 500x200 xc:white -font DejaVu-Sans -pointsize 150 \
        -gravity West -fill black -annotate +10+0 $A A.png && \
convert -size 500x200 xc:white -font DejaVu-Sans -pointsize 150 \
        -gravity West -fill black -annotate +10+0 $B B.png && \

convert B.png -compose Minus A.png -composite -negate B_only.png && \
convert A.png -compose Minus B.png -composite -negate A_only.png && \
convert A.png -compose Lighten B.png -composite C_only.png && \

rm A.png B.png && \

convert A_only.png +level-colors DodgerBlue3, A_only_blue.png && \
convert B_only.png +level-colors firebrick, B_only_red.png && \

rm A_only.png B_only.png && \

convert A_only_blue.png B_only_red.png -compose Darken -composite diff.png && \
convert C_only.png diff.png -compose Darken -composite ${A}"_vs_"${B}".png" && \

rm A_only_blue.png B_only_red.png C_only.png diff.png
