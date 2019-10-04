# -*- mode: ruby -*-
# vi: set ft=ruby :

# Basic Config.
Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-18.04"
    config.vm.hostname = "ubuntu3"
    config.vm.network "private_network", ip: "10.0.0.7"
    #config.vm.network "private_network", type: "dhcp"
    
    # VirtualBox specific:
    config.vm.provider "virtualbox" do |vb|
        vb.name = "vagrant-ubuntu3"
    end

    ############################################################
    # Provisioning with Ansible (Installed in the host machine)
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "/Users/fernandovarela/Documents/DOCS FERNANDO MAC/ansible/ansible-demo-project/playbook-ubuntu3.yml"
    end
end
