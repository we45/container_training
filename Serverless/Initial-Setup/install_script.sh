#!/usr/bin/env bash

# Clone necessary repositories
git clone https://github.com/we45/DVFaaS-Damn-Vulnerable-Functions-as-a-Service.git ~/DVFaaS-Damn-Vulnerable-Functions-as-a-Service
git clone https://github.com/we45/Cut-The-Funds-NodeJS.git ~/Cut-The-Funds-NodeJS
git clone https://github.com/we45/NodeJsScan.git ~/NodeJsScan
git clone https://github.com/we45/serverless-training-apps.git ~/serverless-training-apps

# Install Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs

# Install virtualenv
apt-get install -y virtualenv

# Install bandit
pip install bandit