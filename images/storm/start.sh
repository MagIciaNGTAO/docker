#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Building Storm Images in: $DIR"

export OUT=~/out
mkdir -p $OUT

ZOOKEEPER=$(docker ps -a | awk '{print $NF}'  | grep "zookeeper$")
ZOOKEEPER_RUNNING=$?

if [ $ZOOKEEPER_RUNNING -eq 0 ]; then
    echo "Zookeeper is already running"
else
    echo "Starting Zookeeper"
    mkdir -p $OUT/zookeeper
    docker run -d -p 2181:2181 -v $OUT/zookeeper:/out -h zookeeper --name="zookeeper" fitbur/zookeeper
fi

DIRS=$(ls -l --time-style="long-iso" | egrep '^d' | awk '{print $8}')

echo "Creating Output Directories"
for i in $DIRS ; do
  if [ -d "$i" ]; then
    echo "Starting $i"
    ./$i/start.sh
  fi
done


