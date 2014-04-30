#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

echo "${blue}Pulling All Images${textreset}"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

names=$(find -name "Dockerfile" | awk -F/ '{print $(NF-1)}')

for name in $names ; do
  echo "${yellow}Pulling 'fitbur/$name' Image${textreset}"
  docker pull fitbur/$name
done

echo "${blue}All Images Pulled${textreset}"
