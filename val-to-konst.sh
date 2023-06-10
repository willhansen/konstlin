#!/bin/bash


total=$(find . -type f | wc -l)
find . -type f | pv -l -s $total | xargs -I {} sed -i 's/ val / konst /g' {}
