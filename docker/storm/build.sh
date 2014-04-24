#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 

echo "Output a ${yellow} coloured ${textreset} ${red} word ${textreset}."

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"

echo "Building Storm Images"

for i in * ; do
  if [ -d "$i" ]; then
    echo "${yellow}Building '$NAME-$i'${textreset}"
    ./$i/build.sh
    echo "${green}Image '$NAME-$i' Built${textreset}"
  fi
done

