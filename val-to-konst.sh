#!/bin/bash


total=$(find . \
  -type d -name ".git" -prune -o \
  -type f | wc -l)
find . \
  -type d -name ".git" -prune -o \
  -type f | pv -l -s $total | xargs -I {} \
  sed -i -E 's#([ \(\t\">\{\}/'"'"'`^;=~|\[,])val([ \"'"'"'\]`])#\1konst\2#g' {}
