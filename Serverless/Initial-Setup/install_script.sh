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

# Install bandit, pipenv & awscli
pip install bandit pipenv awscli

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# DVFaaS pipenv requirements
cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service && pipenv --python /usr/bin/python3 --skip-lock install boto3 && cd ~/

# Setup AWS
aws configure set default.region us-east-1
aws configure set aws_access_key_id AKIAJ5OPXKL3ER26OF2A
aws configure set aws_secret_access_key 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
