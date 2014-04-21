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
    docker run -d -p 2181:2181 -v $OUT/zookeeper:/out -h zookeeper --name="zookeeper" fitbur/zookeeper
fi

DIRS=$(ls -l --time-style="long-iso" $MYDIR | egrep '^d' | awk '{print $8}')

echo "Creating Output Directories"
for i in $DIRS ; do
  if [ -d "$i" ]; then
    echo "Making $OUT/$i"
    mkdir -p $OUT/$i
  fi
done

docker run -d -p 3773:3773 -p 3772:3772 -p 6627:6627 -v $OUT/nimbus:/out --name="nimbus" --link="zookeeper:zookeeper" -h nimbus fitbur/storm-nimbus
docker run -d -p 8000:8000 -v $OUT/supervisor:/out --name="supervisor" --link="nimbus:nimbus" --link="zookeeper:zookeeper" -h supervisor fitbur/storm-supervisor
docker run -d -p 8080:8080 -v $OUT/ui:/out --name="ui" --link="nimbus:nimbus" --link="zookeeper:zookeeper" fitbur/storm-ui
