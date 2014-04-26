#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in * ; do
  SCRIPT=./$name/build.sh
  if [ -d "$name" ] && [ -e "$SCRIPT" ]; then
    echo "${yellow}Building '$name' Image(s)${textreset}"
    $SCRIPT
    echo "${green}Built '$name' Image(s)${textreset}"
  fi
done

