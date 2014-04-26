#!/bin/bash

echo "Fixing hostname"
HOST=`hostname`
echo "Setting hostname to $HOST"
sudo echo "127.0.0.1 $HOST" >> /etc/hosts

echo "Setting ZooKeeper IP to $ZOOKEEPER_PORT_2181_TCP_ADDR"

echo "Fixing ZooKeeper IP in server.properties (s/ZOOKEEPER_IP/$ZOOKEEPER_PORT_2181_TCP_ADDR/g)"
sed -i "s/ZOOKEEPER_IP/$ZOOKEEPER_PORT_2181_TCP_ADDR/g" /opt/kafka/config/server.properties

echo "Starting Kafka"
/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
