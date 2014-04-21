#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Building Storm Images in: $DIR"

for i in * ; do
  if [ -d "$i" ]; then
    echo "Building 'storm-$i' image"
    cd $DIR/$i
    docker build -t fitbur/storm-$i .
    cd ..
  fi
done

