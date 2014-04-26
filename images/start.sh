#!/bin/bash

echo "Starting All Containers"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in * ; do
  SCRIPT=./$name/start.sh
  if [ -d "$name" ] && [ -e "$SCRIPT" ]; then
    echo "${yellow}Starting '$name' Container(s)${textreset}"
    $SCRIPT
  fi
done

