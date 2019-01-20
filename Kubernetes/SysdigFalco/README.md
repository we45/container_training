# Profiling and Logging - sysdig-falco


##### Step 1: 

* Navigate to the `SysdigFalco` directory

```bash
cd /root/container_training/Kubernetes/SysdigFalco
```

##### Step 2: 

* Fetch the Server IP

```bash
serverip
```

##### Step 3: 

* Edit `falco_daemonset.yaml` and update the IP in curl command on `line 21`.

```bash
sed -i -e 's/SERVER-IP/<serverip>/g' falco_daemonset.yaml
```

EXAMPLE:

```yaml
args: [ "/usr/bin/falco", "-pk", "-o", "json_output=true", "-o", "program_output.enabled=true", "-o",  "program_output.program=jq '{text: .output}' | curl -d @- -X POST http://192.168.1.1:9090"]
```

##### Step 4: 

* Create the Falco daemonset

```yaml
kubectl create -f falco_daemonset.yaml
```

##### Step 5:

* Create a Pod that intentionally generates malicious events

```bash
kubectl create -f falco-event-generator-deployment.yaml

kubectl get deployments

kubectl get pods
```

* Ensure that the `Status` of pods in `Running`

##### Step 6:


* Start tornado server to get the real-time logs of malicious events

```bash
./tornado_server.py
```

* Stop the tornado server with `ctrl + c`

##### Step 7:

* Stop the malicious event-generator and falco daemonset

```bash
kubectl delete -f falco-event-generator-deployment.yaml -f falco_daemonset.yaml
```
