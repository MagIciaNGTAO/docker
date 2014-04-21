#!/bin/bash

sed -i -e "s#ZOOKEEPER_ADDR#$ZOOKEEPER_PORT_2181_TCP_ADDR#g" $_HOME/conf/storm.yaml
sed -i -e "s#NUMBUS_ADDR#$NIMBUS_PORT_6627_TCP_ADDR#g" $_HOME/conf/storm.yaml

supervisord
