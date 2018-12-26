## Resource Quotas and Limits

##### Step 1:

* Make sure minikube is running `minikube status`

##### Step 2:

* Navigate to the `ResourceQuota_Limit` directory

* Run `kubectl create -f nginx-basic-limit.yaml` to create a Pod on the default namespace

* Run `kubectl get pods` to ensure that the status of the pod is set to 'Running'

##### Step 3:

* Now test the memory consumption of the pod with the `stress` command:

* Run `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 100M`

* Stop it and run: `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 200M`

* Stop it and run `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 400M`

