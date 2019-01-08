# **`Role Based Access Control`**


##### Step 1: 

* Navigate to `RoleBasedAccessControl` directory.

```bash
cd /home/we45/container_training/Kubernetes/VM/RoleBasedAccessControl
```

##### Step 2: 

* Generate an ssl key for `restricteduser`

```bash
sudo openssl genrsa -out restricteduser.key 4096
```


##### Step 3:

* Generate a certificate using they key created in `Step 1`

```bash
sudo openssl req -new -key restricteduser.key -out restricteduser.csr -subj '/CN=restricteduser/O=developer'
```


##### Step 4:

* Generate a self-signed key for k8s

```bash
sudo openssl x509 -req -in restricteduser.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out restricteduser.crt -days 365
```

##### Step 5:

* Create a restricted namespace

```bash
kubectl create namespace restricted-namespace
```

##### Step 6:

* Set credentials and context for the user `restricteduser`

```bash
kubectl config set-credentials restricteduser --client-certificate=restricteduser.crt  --client-key=restricteduser.key

kubectl config set-context restricteduser-context --cluster=minikube --namespace=restricted-namespace --user=restricteduser
```


##### Step 7:

* Try fetching the list of pods with `restricteduser-context`

```bash
kubectl --context=restricteduser-context get pods
```

* It will show the following Error: `Error from server (Forbidden): pods is forbidden: User "restricteduser" cannot list pods in the namespace "restricted-namespace"`

##### Step 8:

* Create a Role and RoleBinding in `restricted-namespace`

```bash
kubectl -n restricted-namespace create -f role-deployment-manager.yaml

kubectl -n restricted-namespace create -f rolebinding-deployment-manager.yaml
```

##### Step 9:

* Run a pod using `restricteduser-context`

```bash
kubectl --context=restricteduser-context run --image nginx:alpine nginx
```

##### Step 10:

* Using the restricteduser-context, try deleting the pod running

```bash
kubectl --context=restricteduser-context get pods 

kubectl --context=restricteduser-context delete pod <pod_name> 
```

* It will show the following Error: `Error from server (Forbidden): pods "nginx-xxxxxxxxxx-xxxxx" is forbidden: User "restricteduser" cannot delete pods in the namespace "restricted-namespace"`
 

##### Step 11

* To Remove the `Role`, `RoleBinding` and the `Pod`, delete the `restricted-namespace`. 

```bash
kubectl delete ns restricted-namespace
```
