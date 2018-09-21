## Kubernetes Sealed Secrets

##### Step 1:
* Make sure minikube is running `minikube status`

##### Step 2:
* Ensure you are in the `SealedSecrets` directory
* Run `kubeseal <mysecret.json >mysealedsecret.json`
* Check the file with `cat mysealedsecret.json`
* Run `kubectl create -f mysealedsecret.json`
* Run `kubectl get secrets`
* To delete the sealed secret, run `kubectl delete -f mysealedsecret.json`
