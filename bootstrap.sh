# bootstrap script for CS++ Private Cloud kubernetes servers.
# Author : David Lynch : https://github.com/davidlynch-sd
# 
# https://github.com/cs-soc-tudublin/private-cloud-configuration

# INSTRUCTIONS: 
# clone repo to /root
# cd into repo
# run script as root
# grab a cup of tea and enjoy
#        (or a beer)

#!/bin/bash

set -xe

echo "This will take a while so get a cup of tea and smash the enter button when you see fit"

sleep 2

curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg \
            https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | \
	sudo tee /etc/apt/sources.list.d/kubernetes.list

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

#Syncing local package database with upstream.
apt update

#Tooling installation
apt install \
  vim \
  tmux \
  btop \
  htop \
  net-tools \
  kexec-tools \
  ca-certificates \
  curl \
  kubectl \
  figlet \
  cowsay \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \


cowsay "installing kind"
sleep 2

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind

cowsay "kind installed"

cowsay "All packages installed, setting up environment"

cp .bashrc ../.bashrc
cp .vimrc ../.vimrc

apt list --upgradeable


cowsay "congratulations, setup complete :D"
