# Scanning K8s Cluster - Kubehunter



##### Step 1: 


* Navigate to the `Kube-Hunter` directory that has `kubehunter.py` file.

```bash
cd /root/container_training/Kubernetes/K8s-Vulnerability-Assessment/Kube-Hunter
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

* Select `option 1` to run a scan on the kubernetes instance deployed on the server and enter the Server IP


###### * Note: Server IP can be fetched by running `serverip` on the server.


