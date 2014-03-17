#!/bin/bash

vagrant up
vagrant reload
vagrant ssh -c "sudo /vagrant/docker/start.sh"