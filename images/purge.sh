#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


./cleanup.sh

images=$(docker images -q)

echo "${yellow}Purging Images${textreset}"
for image in ${images}; do 
  docker rmi -f $image
done

echo "${green}Purge Completed${textreset}"
