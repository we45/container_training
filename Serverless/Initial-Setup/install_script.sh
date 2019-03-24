#!/usr/bin/env bash

# Clone necessary repositories
git clone https://github.com/we45/DVFaaS-Damn-Vulnerable-Functions-as-a-Service.git ~/DVFaaS-Damn-Vulnerable-Functions-as-a-Service
git clone https://github.com/we45/Cut-The-Funds-NodeJS.git ~/Cut-The-Funds-NodeJS
git clone https://github.com/we45/NodeJsScan.git ~/NodeJsScan
git clone https://github.com/we45/serverless-training-apps.git ~/serverless-training-apps

# Install Node
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo 'deb https://deb.nodesource.com/node_10.x xenial main' > /etc/apt/sources.list.d/nodesource.list
echo 'deb-src https://deb.nodesource.com/node_10.x xenial main' >> /etc/apt/sources.list.d/nodesource.list
sleep 2
apt update
killall dpkg && dpkg --configure -a
sleep 1
apt install -y nodejs virtualenv

# Install bandit, pipenv & awscli
pip install bandit pipenv awscli

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

pip uninstall -y urllib3 && pip install urllib3==1.22

# DVFaaS pipenv requirements
cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service && pipenv --python /usr/bin/python3 install boto3 && cd ~/

echo "Done!"