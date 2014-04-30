#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3)

images=$(docker ps -a -q)
echo "${yellow}Stopping Containers${textreset}"
for image in ${images}; do 
 docker stop $image
done

echo "${yellow}Removing Containers${textreset}"
for image in ${images}; do 
  docker rm -f $image
done

echo "${green}Cleanup Completed${textreset}"


