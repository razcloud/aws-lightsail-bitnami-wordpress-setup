#!/bin/bash
cd && pwd
echo "TASK [Install GIT]"
sudo apt-get install git -y
echo "SCRIPT [Setting up server with Ansible]"
echo "TASK [Install PPA]"
sudo apt-get install software-properties-common -y

echo "TASK [Add Ansible Repo]"
sudo apt-add-repository ppa:ansible/ansible -y

echo "TASK [Update & Upgrade]"
sudo apt update -y && sudo apt upgrade -y

echo "TASK [Install Ansbile]"
sudo apt install ansible -y

echo "TASK [Create raz_playbooks Directory]"
cd && pwd && mkdir "raz_playbooks" && cd "raz_playbooks" && pwd

echo "TASK [Git Glone]"
git clone https://github.com/CopaceticVT/aws-lightsail-bitnami-wordpress-setup.git

echo "TASK [Change to Project Directory]"
cd aws-lightsail-bitnami-wordpress-setup

echo "TASK [Run Playbook]"
sudo ansible-playbook raz-setup.yml -e 'ansible_python_interpreter=/usr/bin/python3'
