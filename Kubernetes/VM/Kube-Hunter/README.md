# Scanning K8s Cluster - Kubehunter



##### Step 1: 


* Navigate to the `Kube-Hunter` directory that has `kubehunter.py` file.

```bash
cd /home/we45/container_training/Kubernetes/VM/Kube-Hunter
```


##### Step 2: 

* To get a list of arguments available, run

```bash
./kube-hunter.py --help
```


##### Step 3: 

* To get list of all passive and active scans, run the following command

```bash
./kube-hunter.py --active --list
```


##### Step 4: 

* Start a passive scan with kube-hunter

```bash
./kube-hunter.py
```


##### Step 5: 

* Select `option 2` to run a scan on the minikube instance deployed on the VM

