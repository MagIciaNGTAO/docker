#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"
NEW_NAME=${NAME/storm-/}

../storm-nimbus/start.sh

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
  docker run -d -P -h $NAME --name="$NEW_NAME" -p 8080:8080 -v $HOST_DIR/$NAME:/out --link="nimbus:nimbus" --link="zookeeper:zookeeper" fitbur/$NAME
fi

