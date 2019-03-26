## Deploy a Serverless Function

##### Step 1:

* Install pip3, if it is not installed

```bash
wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && rm get-pip.py
```

* Install `Chalice`

```bash
pip3 install chalice
```

##### Step 2:

* Navigate to `DVFaaS` Directory

```bash
cd /root/DVFaaS-Damn-Vulnerable-Functions-as-a-Service/

ls
```

* Navigate to Insecure Deserialization directory

```bash
cd insecure_deserialization/insecure-deserialization
```


##### Step 3:

#### * IMPORTANT: Ensure that the AWS creds have been configured!


* Set the necessary environment variables

```bash
export LC_ALL=C.UTF-8

export LANG=C.UTF-8
```

* Deploy the serverless function using `chalice`

```bash
chalice deploy
```

##### Step 3:

* Delete the serverless function

```bash
chalice delete
```
