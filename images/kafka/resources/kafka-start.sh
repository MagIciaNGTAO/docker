#!/bin/bash

source /usr/bin/setenv

echo "Starting Kafka"

CONFIG=$_SERVICE/config/server.properties

echo "Setting Container IP in server.properties to $CONTAINER_IP"
sed -i "s#CONTAINER_IP#$CONTAINER_IP#g" $CONFIG

echo "Setting ZooKeeper IP to $ZOOKEEPER_PORT_2181_TCP_ADDR"
sed -i "s#ZOOKEEPER_IP#$ZOOKEEPER_PORT_2181_TCP_ADDR#g" $CONFIG


$_SERVICE/bin/kafka-server-start.sh $CONFIG
