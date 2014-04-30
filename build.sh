#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "${blue}Building All Images${textreset}"

images=$(find $SCRIPT_DIR -name "Dockerfile" | sort)

for image in $images ; do
  DIR=$(dirname $image)
  NAME=fitbur/$(echo "$image" | awk -F/ '{print $(NF-1)}')
  TAG=$(cat $image  | grep "ENV _VERSION" | awk '{print $3}')

  cd $DIR

  echo "${yellow}Building '$NAME' Image${textreset}"  
  docker build --rm -t $NAME .

  echo "${yellow}Tagging '$NAME' Image ($TAG)${textreset}"
  docker tag  $NAME $NAME:$TAG
 
  echo "${green}Image '$NAME' Built${textreset}"
done

echo "${blue}All Images Built. Happy Sailing!${textreset}"

