#!/bin/bash

echo "This is for ubuntu:16.04(Xenial). Run as root user!"
apt update && apt -y upgrade
apt install -y curl wget apt-transport-https docker.io unzip httpie openssl golang-go jq htop
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubelet=1.10.3-00 kubeadm=1.10.3-00 kubectl=1.10.3-00 kubernetes-cni
wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py && pip install netaddr netifaces enum34 scapy requests PrettyTable urllib3 ruamel.yaml tornado
git clone https://github.com/we45/container_training.git
wget https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip && unzip vault_1.0.1_linux_amd64.zip && mv vault /usr/local/bin && rm vault_1.0.1_linux_amd64.zip
wget -O /usr/local/bin/kubeseal https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.7.0/kubeseal-linux-amd64 && chmod +x /usr/local/bin/kubeseal
echo "curl -XGET https://www.canihazip.com/s" >> /usr/local/bin/serverip && echo "echo ''" >> /usr/local/bin/serverip && chmod +x /usr/local/bin/serverip
