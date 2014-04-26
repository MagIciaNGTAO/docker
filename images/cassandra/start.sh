#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"

CONTAINER=$(docker ps -a | awk '{print $NF}'  | grep "$NAME$")
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
  docker run -d -P -p 7199:7199 -p 7000:7000 -p 7001:7001 -p 9160:9160 -p 9042:9042 -v $HOST_DIR/$NAME:/out -h $NAME --name="$NAME" fitbur/$NAME
fi

