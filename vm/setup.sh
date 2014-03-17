#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Script Directory: $DIR"

sudo $DIR/init.sh
sudo $DIR/guest_additions.sh

exit
