#!/bin/bash

echo "Starting Cassandra"

source /usr/bin/setenv

sed -i "s#CONTAINER_IP#$CONTAINER_IP#g" $_SERVICE/conf/cassandra.yaml

$_SERVICE/bin/cassandra -f
