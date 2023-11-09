#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install make -y
sudo apt-get install net-tools -y
sudo apt-get install cifs-utils -y
sudo apt-get install nfs-common -y

sudo apt-get install git -y

eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa


#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#echo \
#  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#sudo apt-get update
#sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
#sudo usermod -aG docker vagrant
#
#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service
#
#sudo mkdir -p /usr/local/lib/docker/cli-plugins
#sudo curl -SL "https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64" -o /usr/local/lib/docker/cli-plugins/docker-compose
#sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
#sudo ln -s /usr/local/lib/docker/cli-plugins/docker-compose /usr/bin/docker-compose
#
#cat <<EOF | sudo tee -a /home/vagrant/.bashrc
#export HOST_IP=\$(ip route get \$(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+') | grep -oP 'src \K\S+')
#EOF
#
#sudo mkdir -p /etc/docker
#cat <<EOF | sudo tee /etc/docker/daemon.json
#{
#  "bip": "172.27.1.1/16",
#  "default-address-pools": [
#    {
#      "base": "172.26.1.1/16",
#      "size": 24
#    }
#  ],
#  "dns": ["192.168.21.96", "192.168.21.97"],
#  "dns-search": ["al.mt.gov.br"],
#  "exec-opts": ["native.cgroupdriver=systemd"],
#  "log-driver": "json-file",
#  "log-opts": {
#    "max-size": "100m"
#  },
#  "storage-driver": "overlay2",
#  "metrics-addr" : "0.0.0.0:9323",
#  "experimental" : true
#}
#EOF


