#!/usr/bin/env bash

wget https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_amd64.zip && unzip vault_1.0.1_linux_amd64.zip && mv vault /usr/local/bin && rm vault_1.0.1_linux_amd64.zip
echo "hostname -I | cut -d' ' -f1" > /usr/local/bin/vmip && chmod +x /usr/local/bin/vmip