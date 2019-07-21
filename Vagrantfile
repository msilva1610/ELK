# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = 'ubuntu/xenial64' #Ubuntu 16.04 LTS

  config.vm.define :nginx01 do |nginx01_config|
    nginx01_config.vm.hostname = 'nginx01'
    nginx01_config.vm.network :private_network, ip: '192.168.100.10'
    nginx01_config.vm.network :forwarded_port, guest: 8585, host: 80
    nginx01_config.vm.network :forwarded_port, guest: 8686, host: 5000                     
    # master01_config.vm.provision :shell, path: "script.sh"
  end
end
