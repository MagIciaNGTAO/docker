#!/bin/bash

set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"
APPS=${APPS:-/mnt/apps}
sudo mkdir -p $APPS

#docker run -d -p 2181:2181 --name="zookeeper" fitbur/zookeeper
#docker run -d -p 9092:9092 --name="kafka" --link="zookeeper:zookeeper" fitbur/kafka

mkdir -p $APPS/zookeeper
docker rm zookeeper > /dev/null 2>&1 || true
ZOOKEEPER=$(docker run -d -p 2181:2181 -v $APPS/zookeeper:/out --name="zookeeper" fitbur/zookeeper)
echo "Started ZOOKEEPER in container $ZOOKEEPER"

mkdir -p $APPS/kafka
docker rm kafka > /dev/null 2>&1 || true
KAFKA=$(docker run -d -p 9092:9092 -v $APPS/kafka:/out --name="kafka" --link="zookeeper:zookeeper" fitbur/kafka)
echo "Started KAFKA in container $KAFKA"

mkdir -p $APPS/elasticsearch
docker rm elasticsearch > /dev/null 2>&1 || true
ELASTICSEARCH=$(docker run -d -p 9200:9200 -p 9300:9300 -v $APPS/elasticsearch:/out --name="elasticsearch"  fitbur/elasticsearch)
echo "Started ElasticSearch in container $ELASTICSEARCH"

