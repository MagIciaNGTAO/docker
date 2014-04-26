#!/bin/bash

echo "Setting Zookeeper IP to $ZOOKEEPER_PORT_2181_TCP_ADDR"
sed -i -e "s#ZOOKEEPER_ADDR#$ZOOKEEPER_PORT_2181_TCP_ADDR#g" $_HOME/conf/storm.yaml

echo "Setting Nimbus IP to $NIMBUS_PORT_6627_TCP_ADDR"
sed -i -e "s#NIMBUS_ADDR#$NIMBUS_PORT_6627_TCP_ADDR#g" $_HOME/conf/storm.yaml

storm $1
