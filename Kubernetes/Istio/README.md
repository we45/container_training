# Istio for Network Security Policies

## Objective

* In the K8s Attack exercies, RCE could have been prevented if `reverse shell` was blocked by Network Security controls

* Istio by default blocks `egress`. 

##### Step 1:

* Navigate to the istio directory

```commandline
cd /root/container_training/Kubernetes/Istio
```

* Download the installation file

```
curl -L https://git.io/getLatestIstio | sh -
```

* Navigate to the installation directory

```
ls

cd istio-1.x.x
```

##### Step 2:

* Install Istio without mutual TLS authentication between sidecars

```
kubectl apply -f install/kubernetes/istio-demo.yaml
```

* Verify the installation

```
kubectl get svc -n istio-system

kubectl get pods -n istio-system
```

##### Step 3:

* Apply automatic sidecar injection to the `default` namespace

```
kubectl label namespace default istio-injection=enabled
```

##### Step 4:

* Navigate to `K8s-Cluster-Attack` and try to run the exercise again

* Observe the results


##### Step 5:

* Stop istio

```
kubectl delete -f install/kubernetes/istio-demo.yaml

kubectl label namespace default istio-injection-
```
