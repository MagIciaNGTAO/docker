$script = <<SCRIPT
#!/bin/bash

sudo /vagrant/vm/setup.sh
echo "All Done :)"
echo "Be sure to 'vagrant reload'"
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "Ubuntu 12.04 LTS (64bit)"
  #config.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  # Configure Port Forwarding

  #zookeeper
  config.vm.network :forwarded_port, host: 2181, guest: 2181
  
  #kafka
  config.vm.network :forwarded_port, host: 9092, guest: 9092
  config.vm.network :forwarded_port, host: 7203, guest: 7203

  #elasticsearch
  config.vm.network :forwarded_port, host: 9200, guest: 9200
  config.vm.network :forwarded_port, host: 9300, guest: 9300
  

  #config.vm.synced_folder("vagrant-docker", "/vagrant")

  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?
    config.vm.provision "shell",
      inline: $script
  end

  # add a bit more memory, it never hurts. It's VM specific and we're using Virtualbox here.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
end
