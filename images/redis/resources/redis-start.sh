#!/bin/bash

echo "Starting ElasticSearch"

source /usr/bin/setenv

echo "Setting Container IP in redis.conf to $CONTAINER_IP"
sed -i "s#CONTAINER_IP#$CONTAINER_IP#g" $_SERVICE/config/server.conf

$_SERVICE/bin/redis-server $_SERVICE/config/server.conf

