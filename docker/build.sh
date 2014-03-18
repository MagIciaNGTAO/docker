#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Image Directory: $DIR"

cd  $DIR/base
docker build -t fitbur/base .

cd $DIR/zookeeper
docker build -t fitbur/zookeeper .

cd $DIR/kafka
docker build -t fitbur/kafka .

cd $DIR/elasticsearch
docker build -t fitbur/elasticsearch .

