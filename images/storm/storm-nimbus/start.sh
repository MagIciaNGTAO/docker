#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"
NEW_NAME=${NAME/storm-/}

../../zookeeper/start.sh

CONTAINER=$(docker ps -a | awk '{print $NF}'  | grep "$NEW_NAME$")
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
  docker run -d -P -h $NAME --name="$NEW_NAME" -p 3773:3773 -p 3772:3772 -p 6627:6627 -v $HOST_DIR/$NAME:/out --link="zookeeper:zookeeper" fitbur/$NAME
fi

