# K8s VM Initial Setup

##### Step 1:

* Run the following command(s) to get the latest files

```bash
cd /home/we45/container_training && git pull

echo "hostname -I | cut -d' ' -f1" > /usr/local/bin/vmip && chmod +x /usr/local/bin/vmip

kubectl delete --all pods -n default
```
