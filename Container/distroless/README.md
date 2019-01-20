## Distroless Docker

* Run: `cd /root/labs/container_training/Container/distroless`
* Run: `docker build -t distroless_flask_py .`. Wait for docker to build
* Run: `cd /root/labs/container_training/Container/distroless/distroful`
* Run: `docker build -t distroful_flask_py .`. Wait for docker to build
* Run: `docker run -d -p 5432:5432 --name db arminc/clair-db:2019-01-01`
* Run: `docker run -d -p 6060:6060 --link db:postgres --name clair arminc/clair-local-scan:v2.0.1`.

**Wait 10 seconds for Clair and DB to start**

* Run: `cd /root/labs/container_training/Container/Clair`
* Run: `./clair-scanner --ip <VM_IP> -r clair_report.json distroless_flask_py`
* Run: `./clair-scanner --ip <VM_IP> -r clair_report.json distroful_flask_py`. Observe the results

* Run: `clean-docker`