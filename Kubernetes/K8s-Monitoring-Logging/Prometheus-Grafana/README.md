# **`Monitoring - prometheus-grafana`**


Step 1: Navigate to prometheus+grafana directory

![](img/prometheus-grafana-1.png)


Step 2: Create a seperate K8s namespace named 'monitoring' by running `kubectl create namespace monitoring` and then run `kubectl get ns` to verify

![](img/prometheus-grafana-2.png)


Step 3: Create ClusterRole, ConfigMap, prometheus service and deployment bu running:
    
    kubectl create -f  clusterRole.yaml
    
    kubectl create -f config-map.yaml
    
    kubectl create -f prometheus.yaml

![](img/prometheus-grafana-3.png)
    

Step 4: Verify by running
    
    kubectl get configmap -n monitoring
    
    kubectl get deployments -n monitoring
    
    kubectl get svc -n monitoring

![](img/prometheus-grafana-4.png)


Step 5: Launch grafana by running `kubectl create -f grafana-prometheus.yaml` and verify by running `kubectl get deployments -n monitoring` and `kubectl get svc -n monitoring`

![](img/prometheus-grafana-5.png)


Step 6: Launch an application by running `kubectl create -f wecare-k8.yaml`

![](img/prometheus-grafana-6.png)


Step 7: Get Prometheus & Grafana urls by running `minikube service prometheus-service -n monitoring --url` and `minikube service prometheus-service -n monitoring --url`

![](img/prometheus-grafana-7.png)


Step 8: Access Grafana on the browser using the url and login using the credentials, `admin/admin` and temporarily skip the change password prompt.

![](img/prometheus-grafana-8.png)


Step 9: Clicking on `Add data source`, should redirect to a new page. Select `Prometheus` as the Type from the drop down Menu and fill the prometheus URL found in Step 7. Save and Test to add Data souce once the Form is filled

![](img/prometheus-grafana-9.png)


Step 10: On the Dashboards Tab on the Left, click on manage. 

![](img/prometheus-grafana-10.png)


Step 11: Click on the Upload button to upload `kubernetes-pod-monitoring.json` file and click on Load

![](img/prometheus-grafana-11.png)


Step 12: Change name if necessary, Select LocalCluster(name given in Step 9) as Prometheus data source and import

![](img/prometheus-grafana-12.png)


Step 13: Dashboard with resouce usage statistics should show up. It is possible to select Namespace and Pod from the drop down as well.

![](img/prometheus-grafana-13.png)




