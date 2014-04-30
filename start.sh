#!/bin/bash

textreset=$(tput sgr0) # reset the foreground colour
green=$(tput setaf 2)
yellow=$(tput setaf 3) 
blue=$(tput setaf 4)

echo "${blue}Starting All Containers${textreset}"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in * ; do
  SCRIPT=./$name/start.sh
  if [ -d "$name" ] && [ -e "$SCRIPT" ]; then
    echo "${yellow}Starting '$name' Container${textreset}"
    $SCRIPT
  fi
done

