#!/bin/bash

A="val"
B="var"

convert -size 500x200 xc:white -font DejaVu-Sans -pointsize 90 \
        -gravity northwest -fill black -annotate +10+100 $A A.png && \
convert -size 500x200 xc:white -font DejaVu-Sans -pointsize 90 \
        -gravity northwest -fill black -annotate +10+100 $B B.png && \

convert A.png B.png -compose Minus_Src -composite -negate B_only.png && \
convert B.png A.png -compose Minus_Src -composite -negate A_only.png && \
convert A.png B.png -compose Plus -composite C_only.png 
#convert A.png B.png -compose Darken -composite first_and_second_only.png && \
#composite -compose difference A.png B.png difference.png && \
#composite difference.png A.png output.png && \
#composite difference.png B.png output.png && \
#


#compare -metric AE -compose src A.png B.png diff.png

#convert A.png diff.png -compose difference -composite -threshold 0 -fill red -opaque white A_only.png
#convert B.png diff.png -compose difference -composite -threshold 0 -fill blue -opaque white B_only.png


#convert A_only.png B_only.png -compose lighten -composite final.png

#convert first_only.png \( +clone -evaluate set 0 -channel R -negate \) \
  #-compose multiply -channel rgb -composite red_first_only.png && \
#convert second_only.png \( +clone -evaluate set 0 -channel B -negate \) \
  #-compose multiply -channel rgb -composite blue_second_only.png
#convert -compose Lighten -composite result.png
#echo a #rm A.png B.png difference.png
