# Clair

---

##### Step 1:

* Open terminal

![](img/Open-Terminal.png)

##### Step 2:

* Run `cd /root/labs/container_training/Container/Clair` into Clair Lab Folder

##### Step 3:

* Run clair related docker containers

    * `docker run -d -p 5432:5432 --name db arminc/clair-db:2019-01-01`
    
    ```commandline
     root@we45:container_training/Container/Container-Vulnerability-Assessment/Clair# docker run -d -p 5432:5432 --name db arminc/clair-db:2017-09-18
     e4cc159b0a71400ef6e57b4b2e5207b44bc4ceda630c27c551026a197b7f7414
    ```
    
    * `docker run -d -p 6060:6060 --link db:postgres --name clair arminc/clair-local-scan:v2.0.1`
    
    ```commandline
    root@we45:container_training/Container/Container-Vulnerability-Assessment/Clair# docker run -d -p 6060:6060 --link db:postgres --name clair arminc/clair-local-scan:v2.0.1
    4e3e38be1f84ff757836ea1cf34184d160b90a9a63ee236b7134d2a842a74f58
    ```
  
##### Step 4:

* Run Clair Scan 
    * `./clair-scanner --ip <VM_IP> -r clair_report.json abhaybhargav/vul_flask:latest`
    ![](img/run-scan.png)

  
##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
