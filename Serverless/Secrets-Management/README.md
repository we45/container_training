## Serverless - Secrets Management

### Instructions

> By now, please make sure you have AWS creds configured


* Install pip3

```bash
wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && rm get-pip.py
```

* Install Terraform:

```
wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip &&
unzip terraform_0.11.13_linux_amd64.zip &&
mv terraform /usr/local/bin/ &&
rm terraform_0.11.13_linux_amd64.zip &&
terraform --version
```

* Install Dependencies
    * `cd /root/container_training/Serverless/Secrets-Management/ops`

    * `terraform init`
    * `terraform apply`

* You need to select `us-west-2` when terraform prompts. Other regions are ok to. Please use a valid region.
* If terraform has run successfully, it generates a `config.json`
* Now, run: `cd container_training/Serverless/Secrets-Management/training-secrets`
* run: `mkdir -p .chalice`
* run `cp ../ops/config.json .chalice/`
* Run `pip3 install chalice`
* Run `pip3 install -r requirements.txt`
* Run `chalice deploy`. This deploys the serverless function and generates the URL
* Test url with `http POST https://<api-generated-url>/api/create-user email=<some-email>`


