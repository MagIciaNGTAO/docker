#!/bin/bash

echo "Starting Storm"

echo "Setting Zookeeper IP to $ZOOKEEPER_PORT_2181_TCP_ADDR"
sed -i -e "s#ZOOKEEPER_IP#$ZOOKEEPER_PORT_2181_TCP_ADDR#g" $_HOME/conf/storm.yaml

echo "Setting Nimbus IP to $NIMBUS_PORT_6627_TCP_ADDR"
sed -i -e "s#NIMBUS_IP#$NIMBUS_PORT_6627_TCP_ADDR#g" $_HOME/conf/storm.yaml

storm $1
