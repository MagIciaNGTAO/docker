#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NAME="${PWD##*/}"
PARENT="${PWD%/*}"
MOD="${PARENT##*/}"

docker build --rm -t fitbur/$MOD-$NAME .
