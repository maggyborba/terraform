# -*- mode: ruby -*-
# vi: set ft=ruby :

# Basic Config.
Vagrant.configure("2") do |config|
config.vm.box = "bento/ubuntu-18.04"
config.vm.hostname = "ubuntu1"
#config.vm.network "private_network", type: "dhcp"  
config.vm.network "private_network", ip: "10.0.0.3"  

# VirtualBox specific:
config.vm.provider "virtualbox" do |vb|
vb.name = "vagrant-ubuntu1"
end

############################################################
# Provisioning VM
config.vm.provision "shell", inline:
<<-SHELL
echo "INSTALLING BASE PACKAGES"
apt-get update
apt-get install -y \
git \
zsh \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common
echo "DOCKER - ADDING DOCKER’S OFFICIAL GPG KEY"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "DOCKER - VERIFY FINGERPRINT 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
apt-key fingerprint 0EBFCD88
echo "DOCKER - SETUP STABLE REPO"
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt-get update
echo "DOCKER - INSTALL DOCKER CE VERSION 18.06.1 (KUBERNETES COMPATIBLE)"
apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
apt-mark hold docker-ce
echo "DOCKER - ADDING VAGRANT USER TO THE DOCKER GROUP"
usermod -aG docker vagrant
SHELL

config.vm.provision "shell", privileged: false, inline:
<<-SHELL
echo "CLONING OH MY ZSH FROM THE GIT REPO" 
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
echo "COPYING THE DEFAULT .ZSHRC CONFIG FILE"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "CHANGING THE OH_MY_ZSH THEME"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc  
SHELL

config.vm.provision "shell", inline:
<<-SHELL
echo "CHANGING THE VAGRANT USER'S SHELL TO USE ZSH"
chsh -s /bin/zsh vagrant
SHELL
############################################################
end
