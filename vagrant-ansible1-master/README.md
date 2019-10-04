# Ansible Control Machine setup

## Objectives
The objective of this vagrant file is to spin up and provision a VirtualBox VM with the following especifications:

- OS: ubuntu-18.04
- Private IP: 10.0.0.9
- Shell: ZShell + Oh My SZh (just for fun)
- Basic Packages: GIT, sshpass, pip2, pywinrm, [ANSIBLE](https://docs.ansible.com/ansible/latest/index.html)

## Requirements

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- Linux boxes to be managed requires SSH and Python installed. Ideally, SSH key from the Control Machine should be used in the remotes.
- Windows boxes to be managed requires quite a configuration. To make it easier a publicly available *ConfigureRemotingForAnsible.ps1* is provided.

## Advantages
The main advantage of using vagrant for this kind of testing environment is that it enables us to use a completely isolated VM which can be built, destroyed and re-built in a matter of minutes.

## Scope of provisioning
This vagrant script is mostly intended for the OS build and core components installation required for rolling out an Ansible Control Machine. It'll also clone a git repo with a recommended directory structure and a BASE and DOCKER provisioning examples as "roles".