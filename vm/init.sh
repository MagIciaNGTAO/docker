#!/bin/bash

KERNEL=$(uname -r)
echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
apt-get update
apt-get install -y dkms build-essential linux-headers-$KERNEL linux-image-$KERNEL software-properties-common language-pack-en curl wget

#install docker
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update
apt-get install -y lxc-docker

# Avoid having to type "sudo" every time we use docker by creating
# the default docker group and add default vagrant user to this group.
groupadd docker
gpasswd -a vagrant docker
service docker restart

