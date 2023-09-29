#!/bin/bash

# Update packages
sudo apt update
sudo apt upgrade -y

# Install go
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf go1.21.1.linux-amd64.tar.gz
rm go1.21.0.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >>/home/gosdn/.profile
echo "export GOPATH=$HOME/go " >>/home/gosdn/.profile
source /home/gosdn/.profile

# Add Docker keyring
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker Repository
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add gosdn User to Docker Group
sudo usermod -aG docker networks

# Install Containerlab
bash -c "$(curl -sL https://get.containerlab.dev)"
