##!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"
NEW_NAME=${NAME/datastax-/}

CONTAINER=$(docker ps -a | awk '{print $NF}'  | grep "$NEW_NAME$")
RUNNING=$?

if [ $RUNNING -eq 0 ]; then
    echo "$NAME is already running"
else
  if [ -z "$HOST_DIR" ] ; then
    HOST_DIR=/tmp/containers
    mkdir -p $HOST_DIR/$NAME
  fi

  echo "Starting $NAME"
  echo "Mounting Volume $HOST_DIR/$NAME"
  docker run -d -P -p 8888:8888 -p 50031:50031 -p 61620:61620 -v $HOST_DIR/$NAME:/out -h $NAME --name="$NEW_NAME" fitbur/$NAME
fi

