# aws-lightsail-bitnami-wordpress-setup
Scripts to set up an AWS Lightsail Bitnami WordPress Instance.  

#!/bin/bash
cd && pwd
echo "SCRIPT [Setting up server with Ansible]"
echo "[Install PPA]"
sudo apt-get install software-properties-common -y

echo "[Add Ansible Repo]"
sudo apt-add-repository ppa:ansible/ansible -y

echo "[Update & Upgrade]"
sudo apt update -y && sudo apt upgrade -y

echo "[Install Ansbile]"
sudo apt install ansible -y

echo "[Create raz_playbooks Directory]"
cd && pwd && mkdir "raz_playbooks" && cd "raz_playbooks" && pwd

echo "[Git Glone]"
git clone https://github.com/CopaceticVT/aws-lightsail-bitnami-wordpress-setup.git

echo "[Change to Project Directory]"
cd aws-lightsail-bitnami-wordpress-setup

echo "[Run Playbook]"
sudo ansible-playbook raz-setup.yml -e 'ansible_python_interpreter=/usr/bin/python3'
