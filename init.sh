#!/bin/bash

# Update, best practices and install dependencies
sudo apt-get update -y \
    && apt-get install -y --no-install-recommends \
        curl \
        make \
        git \
    && true

## Install Docker and Docker-Compose
cat <<EOF | sudo tee -a /home/vagrant/.bashrc
export HOST_IP=\$(ip route get \$(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+') | grep -oP 'src \K\S+')
EOF

curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo usermod -aG docker ${USER}

COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



