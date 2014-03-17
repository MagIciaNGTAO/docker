#!/bin/bash

echo "Downloading VBox Guest Additions"
wget -N http://dlc.sun.com.edgesuite.net/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso -O /tmp/VBoxGuestAdditions_4.3.8.iso
mkdir /mnt/VBoxGuestAdditions
mount /tmp/VBoxGuestAdditions_4.3.8.iso /mnt/VBoxGuestAdditions
echo "Installing VBox Guest Additions"
sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run
