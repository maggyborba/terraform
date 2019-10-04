# Basic Ansible template

## Objectives
The objective of this project is to demostrate how to use Ansible sticking to a recommended directory structure.

- It includes the windows bootstraping script to prepare Windows remote hosts to be provisioned with Ansible (ansible_remote_bootstrapping.yml)
- Use of group_vars.
- Minimum ansible.cfg setup
- Inventory file (hosts) and in-situ group variable demonstration.
- Playbook examples.

## Requirements

- A Linux distribution
- [Ansible](https://www.ansible.com/resources/get-started)
- SSH key pair setup between the Ansible control machine and the remote hosts.

## Advantages
Some advantage of Ansible for configuration management are:

- It's agentless (no agent needed in the remote host)
- Idempotent (things are done ONLY if needed. Repetitive executions won't break anything)
- It's declarative (defines the state you want in the remote host)
- Easy to use.

## Useful references
- https://www.ansible.com/blog/connecting-to-a-windows-host
- https://www.youtube.com/watch?v=icR-df2Olm8&list=PLFiccIuLB0OiWh7cbryhCaGPoqjQ62NpU
