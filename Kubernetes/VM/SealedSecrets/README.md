# Kubernetes Sealed Secrets - Kubeseal


##### Step 1:

* Navigate to the `SealedSecrets` directory

```bash
cd /root/container_training/Kubernetes/VM/SealedSecrets
```


##### Step 2:

* Ensure that minikube is running

```bash
minikube status
```


##### Step 3:

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
