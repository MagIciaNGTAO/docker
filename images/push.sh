#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

echo "${blue}Pushing All Images${textreset}"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

./build.sh

names=$(docker images | grep "^fitbur" | awk '{print $1}')

for name in $names ; do
  echo "${yellow}Pushing '$name' Image${textreset}"
  docker push $name
done

echo "${blue}All Images Pushed${textreset}"
