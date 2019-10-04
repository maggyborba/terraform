# -*- mode: ruby -*-
# vi: set ft=ruby :

# Basic Config.
Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-18.04"
    config.vm.hostname = "ubuntu2"
    config.vm.network "private_network", ip: "10.0.0.6"
    #config.vm.network "private_network", type: "dhcp"
    
    # VirtualBox specific:
    config.vm.provider "virtualbox" do |vb|
        vb.name = "vagrant-ubuntu2"
    end

    ############################################################
    # Provisioning with Ansible (Installing it in the remote VM)
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.install_mode = "pip"
    end
end
