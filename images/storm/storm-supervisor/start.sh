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
    echo "Setting HOST_DIR to /tmp"
    HOST_DIR=/tmp
    echo "Making $HOST_DIR/$NAME"
    mkdir -p $HOST_DIR/$NAME
  fi

  echo "Starting $NAME"
  docker run -d -P -h $NAME --name="$NEW_NAME" -p 8000:8000 -p 6700:6700 -p 6701:6701 -p 6702:6702 -p 6703:6703 -v $HOST_DIR/$NAME:/out --link="nimbus:nimbus" --link="zookeeper:zookeeper" fitbur/$NAME
fi

