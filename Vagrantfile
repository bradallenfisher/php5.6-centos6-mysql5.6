# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # centos 6.5
  config.vm.box = "bradallenfisher/centos65-x86_64"
  # ip address
  config.vm.network "private_network", ip: "192.168.19.56"
  # host name
  config.vm.hostname = "local.php56.dev"

  # run script as root
  config.vm.provision "shell",
    path: "install.sh"
    
  # run script as vagrant user
  config.vm.provision "shell",
    path: "post-install.sh",
    privileged: FALSE

end
