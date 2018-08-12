#!/bin/bash

# Install git
sudo apt update
sudo apt-get install -y build-essentials git git-core software-properties-common 

# Install ansible
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    sudo apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install ansible -y
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
echo ""
echo "Prep-work Complete"
echo ""
echo "Run ansible with: "
echo "ansible-pull -v -U https://github.com/myersg86/elementary-ansible.git playbook.yml"