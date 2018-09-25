# **`Docker Daemon Configuration`**


Step 1: Run an nmap scan on the VM to get the list of ports that are open. `nmap 127.0.0.1 -sV -p 4243`

![](img/daemon-config-1.png)


Step 2: To check access to the docker API, access `http://localhost:4243/version` and `http://localhost:4243/images/json`
 
![](img/daemon-config-2.png)


Step 3: Activate the python virtual environment and run the script that will run a malicious container via. the docker API.

![](img/daemon-config-3.png)


Step 4: On the browser, access the port mentioned in the script. `http://127.0.0.1:6080/vnc.html`

![](img/daemon-config-4.png)


Step 5: `Right-Click` and open the terminal. The user has UI access to the Host machine. 

![](img/daemon-config-5.png)


Step 6: To fix this issue, open `/etc/default/docker` and comment `DOCKER_OPTS`

![](img/daemon-config-6.png)

