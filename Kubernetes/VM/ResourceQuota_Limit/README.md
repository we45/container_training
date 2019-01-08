# Resource Quotas and Limits

##### Step 1:

* Navigate to the `ResourceQuota_Limit` directory

```bash
cd /home/we45/container_training/Kubernetes/VM/ResourceQuota_Limit
```

##### Step 2:

* Create a pod on the `default` namespace.

```bash
kubectl create -f nginx-basic-limit.yaml
```

* Ensure that the status of the pod is set to `Running`

```bash
kubectl get pods
```

##### Step 3:

* Now test the memory consumption of the pod with the `stress` command:

* Run `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 100M`

* Stop it and run: `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 200M`

* Stop it and run `kubectl exec -it nginx-resource -- stress --cpu 1 --io 1 --vm 2 --vm-bytes 400M`

* It can be observed that the stress test fails with `exit code 1` at 400M because of the limit specified in Pod Spec. 

