#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Building All Images"

for i in * ; do
  if [ -d "$i" ]; then
    echo "${yellow}Building '$i'${textreset}"
    ./$i/build.sh
    echo "${green}Image '$i' Built${textreset}"
  fi
done


