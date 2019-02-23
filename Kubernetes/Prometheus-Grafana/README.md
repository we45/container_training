# **`Monitoring with Prometheus + Grafana`**


##### Step 1: 

* Navigate to prometheus+grafana directory

```bash
cd /root/container_training/Kubernetes/Prometheus-Grafana
```

![](img/prometheus-grafana-1.png)


##### Step 2: 

* Create a separate K8s namespace named `monitoring'`.

```bash
kubectl create namespace monitoring

kubectl get ns
```

![](img/prometheus-grafana-2.png)


##### Step 3: 

* Create ClusterRole, ConfigMap, prometheus service and deployment

```bash
kubectl create -f  clusterRole.yaml

kubectl create -f config-map.yaml

kubectl create -f prometheus.yaml
```

![](img/prometheus-grafana-3.png)


```bash
kubectl get configmap -n monitoring

kubectl get deployments -n monitoring

kubectl get svc -n monitoring
```


![](img/prometheus-grafana-4.png)


##### Step 4: 

* Launch grafana 

```bash
kubectl create -f grafana-prometheus.yaml

kubectl get deployments -n monitoring

kubectl get svc -n monitoring
```


![](img/prometheus-grafana-5.png)


##### Step 5: 

* Launch a few pods to monitor.

```bash
kubectl create -f wecare-k8.yaml
```

![](img/prometheus-grafana-6.png)


##### Step 6: 

* Upgrade your `kubectl` to the latest version

```bash
apt-get install --only-upgrade kubectl
```

###### Note: This upgrade is to allow usage of bind-ip(0.0.0.0) for the proxy-forward functionality 


##### Step 7: 

* Get Prometheus & Grafana urls

```bash
kubectl -n monitoring get svc
```

The output should be similar to:

```bash
root@kubernetes-security-training-ubuntu:~/container_training/Kubernetes# kubectl -n monitoring get svc
NAME                 TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
grafana              NodePort   10.109.181.65    <none>        3000:32310/TCP   25m
prometheus-service   NodePort   10.101.242.178   <none>        8080:31000/TCP   26m
```

* Make note of the cluster-ip and port of both services


##### Step 8: 

* Setup `proxy-forward` to be able to access grafana UI from the browser`

```bash
kubectl -n monitoring port-forward svc/grafana --address=0.0.0.0 3000
```

* Access Grafana on the browser using `Server-IP:3000` and login using the credentials, `admin/admin`.


##### Step 9:

* Clicking on `Add data source`, should redirect to a new page. Select `Prometheus` as the Type from the drop down Menu and fill the prometheus URL found in Step 7. Save and Test to add Data source once the Form is filled

![](img/prometheus-grafana-9.png)


##### Step 10: 

* On the Dashboards Tab on the Left, click on manage. 

![](img/prometheus-grafana-10.png)


##### Step 11: 

* Click on the Upload button to upload `kubernetes-pod-monitoring.json` file and click on Load

![](img/prometheus-grafana-11.png)

* The contents of `kubernetes-pod-monitoring.json` can also be pasted as an alternative to upload


##### Step 12:

* Select the configured source as the Prometheus data source and import

![](img/prometheus-grafana-12.png)


##### Step 13: 

* Dashboard with resource usage statistics should show up. It is possible to select Namespace and Pod from the drop down as well.

![](img/prometheus-grafana-13.png)


##### Step 14: 

* On the terminal, stop all the pods and services running by deleting the `monitoring` namespace

```bash
kubectl delete ns monitoring
```
