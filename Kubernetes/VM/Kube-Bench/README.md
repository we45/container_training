# K8s CIS Benchmark - Kube-bench


##### Step 1: 

* Navigate to the `Kube-Bench` directory

```bash
cd /home/we45/container_training/Kubernetes/VM/Kube-Bench
```


##### Step 2: 

* To get a list of available commands and options, run the following command

```bash
./kube-bench --help
```


##### Step 3: 

* To run CIS benchmark scan, run

```bash
./kube-bench master
```


##### Step 4: 

* To save results to a `json` file, run the following command

If a `.json` report is necessary, run 

```bash
./kube-bench --json master > report.json
```
