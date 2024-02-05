#!/bin/bash

# Update, best practices and install dependencies
sudo apt-get update -y \
    && apt-get install -y --no-install-recommends \
        curl \
        make \
        git \
        php php-zip php-xml php-pgsql php-intl php-mbstring \
        yarn nodejs npm \
    && true

## Install Composer
COMPOSER_SUM="28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
COMPOSER_VERSION="2.2.18"
curl -LO "https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar" \
    && echo "${COMPOSER_SUM}  composer.phar" | sha256sum -c - \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer --version \
    && true

## Install Docker and Docker-Compose
cat <<EOF | sudo tee -a /home/vagrant/.bashrc
export HOST_IP=\$(ip route get \$(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+') | grep -oP 'src \K\S+')
EOF

curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo usermod -aG docker ${USER}

DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## Install Symfony
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli