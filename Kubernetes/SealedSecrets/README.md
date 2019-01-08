# Kubernetes Sealed Secrets - Kubeseal

##### Step 1:

* Navigate to the `SealedSecrets` directory

```bash
cd /root/container_training/Kubernetes/SealedSecrets
```

##### Step 2:

* Ensure that K8s is running

```bash
kubectl get nodes
```

##### Step 3:

* Create `SealedSecret` controller and Custom Resource Definition

```bash
kubectl create -f controller.yaml

kubectl create -f sealedsecret-crd.yaml
```

##### Step 4:

* Seal the existing secret with `kubeseal`

```bash
kubeseal <mysecret.json >mysealedsecret.json
```

* Check the sealed-secret file 

```bash
cat mysealedsecret.json
```

##### Step 5:

* Create the Sealed-Secret

```bash
kubectl create -f mysealedsecret.json
```

* Check the created Secret

```bash
kubectl get secrets
```


##### Step 6:

* Delete the created sealed secret 

```bash
kubectl delete -f mysealedsecret.json
```


##### Step 7:

* Stop SealedSecret Controller and Custom Resource Definition

```bash
kubectl delete -f controller.yaml

kubectl delete -f sealedsecret-crd.yaml
```