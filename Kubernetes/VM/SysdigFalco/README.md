# Profiling and Logging - sysdig-falco


##### Step 1: 

* Navigate to the `SysdigFalco` directory

```bash
cd /home/we45/container_training/Kubernetes/VM/SysdigFalco
```

##### Step 2: 

* Fetch the VM IP

```bash
vmip
```

* VM IP can also be fetched by running `ifconfig`

##### Step 3: 

* Edit `falco_daemonset.yaml` and update the IP in curl command on `line 21`. Save and exit once IP has been updated.

EXAMPLE:

```yaml
args: [ "/usr/bin/falco", "-pk", "-o", "json_output=true", "-o", "program_output.enabled=true", "-o",  "program_output.program=jq '{text: .output}' | curl -d @- -X POST http://10.0.2.15:9090"]
```

##### Step 4: 

* Create the Falco daemonset and verify

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

##### Step 6:

* Start the tornado server

```bash
./tornado_server.py
```

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
