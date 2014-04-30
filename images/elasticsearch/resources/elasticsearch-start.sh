#!/bin/bash

echo "Starting ElasticSearch"

source /usr/bin/setenv

echo "Setting Container IP in elasticsearch.yml to $CONTAINER_IP"
sed -i "s#CONTAINER_IP#$CONTAINER_IP#g" $_SERVICE/config/elasticsearch.yml

$_SERVICE/bin/elasticsearch

