#!/bin/bash

echo "Stopping all docker containers:"
docker ps
ids=`docker ps | tail -n +2 |cut -d ' ' -f 1`
echo $ids | xargs docker stop
echo $ids | xargs docker rm
docker rm $(docker ps -a -q)
#docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
