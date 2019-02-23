# Docker Hands-On


##### Step 1:

* Pull the latest `abhaybhargav/vul_flask` docker image from DockerHub.

```commandline
docker pull abhaybhargav/vul_flask
```


##### Step 2: 
  
* List all docker images on the machine.

```bash
docker images
```


##### Step 3:

* Run the `abhaybhargav/vul_flask` docker image.

```bash
docker run -d --name vul_flask abhaybhargav/vul_flask
```


##### Step 4:

* View all running containers.

```bash
docker ps
```


##### Step 5:
 
* To exec into/access the running container, run the following command

```bash
docker exec -it vul_flask bash

root@0c8c0c6a5122:/apps#
```


##### Step 6:

* To exit from the container, run `exit`

```bash
 exit
```


##### Step 7: 
  
* Stop the running `vul_flask` container.

```bash
docker stop vul_flask
```


##### Step 8:

* View all running and stopped containers.

```bash
docker ps -a
```


##### Step 9:

* Remove the stopped container.

```bash
docker rm vul_flask
```


##### Step 10:

* Remove the `abhaybhargav/vul_flask` docker image from the system.

    **Note:** Don't delete image from the VM

```bash
docker rmi abhaybhargav/vul_flask
```
