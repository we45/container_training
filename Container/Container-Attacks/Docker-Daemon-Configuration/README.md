# **`Docker Daemon Configuration`**

###### A malicious user who gains access Docker API, can launch a container and gain access to the host machine with root permissions.


##### Step 1:

* Run an nmap scan on the VM to get the list of ports that are open. `nmap 127.0.0.1 -sV -p 4243`

![](img/daemon-config-1.png)


##### Step 2: 

* To verify access to docker API, access `http://localhost:4243/version` and `http://localhost:4243/images/json` from the browser.
 
![](img/daemon-config-2.png)

###### A user can get the list of docker images and docker containers running on that machine

##### Step 3

* Navigate to the directory containing the malicious script.

    ```commandline
    cd /home/we45/container_training/Container/Container-Attacks/Docker-Daemon-Configuration
    ```

* Activate the python virtual environment and run the script that will launch a malicious container via. the docker API.

```commandline
source venv/bin/activate
```
    
```commandline
python launch-malicious-docker.py
```

![](img/daemon-config-3.png)


##### Step 4

* On the browser, access the IP and Port mentioned in the script. `http://127.0.0.1:6080/vnc.html`

![](img/daemon-config-4.png)


##### Step 5

* `Right-Click` and open the terminal. The user has UI access to the Host machine. 

![](img/daemon-config-5.png)


##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```

##### To fix this issue, open `/etc/default/docker` and comment `DOCKER_OPTS` which exposes the docker API to the public.

![](img/daemon-config-6.png)

