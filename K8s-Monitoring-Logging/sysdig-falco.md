# **`Profiling and Logging - sysdig-falco`**


Step 1: Navigate to the directory that has sysdig-falco YAML files

![](img/sysdig-falco-1.png)


Step 2: Start the tornado server by running `./tornado_server.py`

![](img/sysdig-falco-2.png)


Step 3: Open a new tab on the terminal and run  `ifconfig` to get the ip address of the VM

![](img/sysdig-falco-3.png)


Step 4: Run `atom falco_daemonset.yaml` to update the IP in curl command on line 21. Save and exit once IP has been updated.

![](img/sysdig-falco-4.png)


Step 5: Run `kubectl create -f falco_daemonset.yaml` to create the daemonset and `kubectl get daemonsets` to verify

![](img/sysdig-falco-5.png)


Step 6: Run `kubectl create -f falco-event-generator-deployment.yaml` to create pods that generate intentionally malicious events. Run `kubeclt get deployments` to verify.

![](img/sysdig-falco-6.png)


Step 7: Go back to the tab running tornado server to see the real-time logs of malicious events.

![](img/sysdig-falco-7.png)
