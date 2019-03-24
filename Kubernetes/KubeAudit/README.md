# Audit K8s cluster against common security controls


##### Step 1:

* Navigate to KubeAudit directory

```bash
cd /root/container_training/Kubernetes/KubeAudit
```

* Install [KubeAudit](https://github.com/Shopify/kubeaudit)

```bash
wget https://github.com/Shopify/kubeaudit/releases/download/v0.5.2/kubeaudit_0.5.2_linux_amd64.tar.gz

tar -xvzf kubeaudit_0.5.2_linux_amd64.tar.gz

mv kubeaudit /usr/local/bin/
```

##### Step 2:

* Check that every resource has a CPU and memory limit

```bash
kubeaudit limits
```

* Check if namespace(s) have a default deny network policy 

```bash
kubeaudit np
```

* Check if default Service Account token is mounted

```bash
kubeaudit sat
```

* Check if readOnlyRootFilesystem is set to false

```bash
kubeaudit rootfs
```

* Checks if RunAsNonRoot has not been set

```bash
kubeaudit nonroot
```

* Run All Audits(`resources`, `network policies`, `Service Accounts`, `capabilities`, `privileged`, `allowPrivilegeEscalation`, `runAsNonRoot`, `readOnlyRootFilesystem` )

```bash
kubeaudit all
```

###### * Note: Audits can be run on a particular namespace(`kubeaudit all -n default`) and the results can be fetched in `json` format(`kubeaudit all --json`)


##### Step 3:

* Check the `insecure_vulflask_deployment.yaml`

* Run `AutoFix` on the insecure_deployment and observe the changes

```bash
kubeaudit autofix -f insecure_vulflask_deployment.yaml
```

###### * Note: The changes made can sometimes be too secure for the service to work


