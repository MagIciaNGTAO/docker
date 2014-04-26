#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"

../zookeeper/start.sh

CONTAINER=$(docker ps -a | awk '{print $NF}'  | grep "$NAME$")
RUNNING=$?

if [ $RUNNING -eq 0 ]; then
    echo "$NAME is already running"
else
  if [ -z "$HOST_DIR" ] ; then
    echo "Setting HOST_DIR to /tmp"
    HOST_DIR=/tmp/containers
    echo "Making $HOST_DIR/$NAME"
    mkdir -p $HOST_DIR/$NAME
  fi

  echo "Starting $NAME"
  docker run -d -P -p 9092:9092 -p 7203:7203 -v $HOST_DIR/$NAME:/out -h $NAME --name="$NAME" --link="zookeeper:zookeeper" fitbur/$NAME
fi

