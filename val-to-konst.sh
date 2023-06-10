#!/bin/bash

find_files() {
  find kotlin/ \
  -type d -name ".git" -prune -o \
  -not -name "*.xml" -and \
  -type f
}

total=$(find_files | wc -l)

find_files | \
  pv -l -s $total | \
  xargs -I {} \
    sed -i 's/val/konst/g' {}
