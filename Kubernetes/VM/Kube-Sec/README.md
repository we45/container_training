# YAML Static Analyser - Kubesec

###### Kubesec helps quantify risk for K8s resources based on the suggested best-practices. Lists of test run can be found at https://kubesec.io/basics/.


##### Step 1: 

* Navigate to the `Kube-Sec` directory

```bash
cd /home/we45/container_training/Kubernetes/VM/Kube-Sec
```


##### Step 2: 

* To analyze a Kubernetes YAML spec file, run

```bash
./kubesec insecure_vulflask_deployment.yaml
```


##### Step 3:

* To save results to a file, run the following command

```bash
./kubesec insecure_vulflask_deployment.yaml >> kubesec_result.json
```
