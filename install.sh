#!/bin/bash

vagrant plugin install vagrant-proxyconf
vagrant up
vagrant reload
vagrant ssh -c "sudo /vagrant/docker/start.sh"