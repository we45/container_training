## Kubernetes Sealed Secrets

##### Step 1:
* Make sure minikube is running

##### Step 2:
* Ensure you are in the `SealedSecrets` directory
* Run `kubeseal <mysecret.json >mysealedsecret.json`
* Check the file with `cat mysealedsecret.json`
* Run `kubectl create -f mysealedsecret.json`

