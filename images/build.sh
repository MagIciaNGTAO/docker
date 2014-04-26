#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "${blue}Building All Images${textreset}"

for name in * ; do
  SCRIPT=./$name/build.sh
  if [ -d "$name" ] && [ -e "$SCRIPT" ]; then
    echo "${yellow}Building '$name' Image(s)${textreset}"
    $SCRIPT
    echo "${green}Built '$name' Image(s)${textreset}"
  fi
done

images=$(docker ps -a -q)
echo "${yellow}Removing Intermediates Containers${textreset}"
for image in ${images}; do 
  docker rm -f $image
done

images=$(docker images | grep "^<none>" | awk '{print $3}')
echo "${yellow}Removing Intermediates Images${textreset}"
for image in ${images}; do 
 docker rmi -f $image
done

echo "${blue}All Images Built. Happy Sailing!${textreset}"
