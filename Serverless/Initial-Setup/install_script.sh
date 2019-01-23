#!/usr/bin/env bash

# Clone necessary repositories
git clone https://github.com/we45/DVFaaS-Damn-Vulnerable-Functions-as-a-Service.git ~/DVFaaS-Damn-Vulnerable-Functions-as-a-Service
git clone https://github.com/we45/Cut-The-Funds-NodeJS.git ~/Cut-The-Funds-NodeJS
git clone https://github.com/we45/NodeJsScan.git ~/NodeJsScan
git clone https://github.com/we45/serverless-training-apps.git ~/serverless-training-apps

# Install Node
curl -sL https://deb.nodesource.com/setup_10.x | bash
dpkg --configure -a
apt-get install -y nodejs

# Install virtualenv
apt-get install -y virtualenv

# Install bandit, pipenv & awscli
pip install bandit pipenv awscli

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# DVFaaS pipenv requirements
cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service && pipenv --python /usr/bin/python3 install boto3 && cd ~/
