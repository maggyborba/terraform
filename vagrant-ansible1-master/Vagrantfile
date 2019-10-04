# -*- mode: ruby -*-
# vi: set ft=ruby :

# Basic Setup
Vagrant.configure("2") do |config|
config.vm.box = "bento/ubuntu-18.04"
config.vm.hostname = "ansible1"
config.vm.network "private_network", ip: "10.0.0.9"
#config.vm.network "private_network", type: "dhcp"  

# Provider-specific configuration so you can fine-tune various
# backing providers for Vagrant. These expose provider-specific options.
# Example for VirtualBox:
config.vm.provider "virtualbox" do |vb|
vb.name = "vagrant-ansible1"
end

############################################################
# GENERAL PROVISIONING
config.vm.provision "shell", inline:
<<-SHELL
echo "INSTALLING BASE PACKAGES"
apt-get update
apt-get install -y \
git \
zsh \
build-essential \
libpq-dev \
libssl-dev \
openssl \
libffi-dev \
zlib1g-dev \
sshpass \
echo "INSTALLING PYTHON2 PIP"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
echo "ANSIBLE - INSTALLING PYWINRM TO MANAGE WINDOWS HOSTS"
yes | pip install pywinrm
echo "ANSIBLE - INSTALLING ANSIBLE WITH PIP (Requires Ubuntu 16.04+)"
yes | pip install ansible
SHELL

config.vm.provision "shell", privileged: false, inline:
<<-SHELL
echo "ZSH - CLONING OH MY ZSH FROM THE GIT REPO" 
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
echo "ZSH - COPYING DEFAULT .zshrc CONFIG FILE"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "ZSH - CHANGING THE OH_MY_ZSH THEME"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
echo "ANSIBLE - CLONING ANSIBLE TEMPLATES"
git clone https://github.com/fervartel/ansible.git
git clone https://github.com/groovemonkey/hands-on-ansible.git
SHELL

config.vm.provision "shell", inline:
<<-SHELL
echo "ZSH - CHANGING THE VAGRANT USER'S SHELL TO USE ZSH"
chsh -s /bin/zsh vagrant
SHELL
############################################################
end
