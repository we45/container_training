# Docker Hands-On Part-1

---


#####Step 1:
* Open Terminal

	![](img/part-1/Open-Terminal.png)

#####Step 2:
* Download docker image from Docker Hub

    * `docker pull abhaybhargav/vul_flask`
    
    
    
    ![](img/part-1/docker-pull.png)
 
#####Step 3:   
* View list of docker images
    * `docker pull abhaybhargav/vul_flask`
    
    ![](img/part-1/docker-images-list.png)
    
#####Step 4:
* Start docker container 
   * `docker run -d --name vul_flask abhaybhargav/vul_flask`
    
   ![](img/part-1/docker-run.png)
 
#####Step 5:   
* List of running containers
   * `docker ps`
    
   ![](img/part-1/docker-ps.png)
    
#####Step 6:   
* Exec into a container
   * `docker exec -it vul_flask bash`
    
   ![](img/part-1/docker-exec.png)
   
#####Step 7:
* Exit from the container
   * `exit`
    
   ![](img/part-1/exit-docker.png) 

#####Step 8:   
* List of running containers
   * `docker ps`
    
   ![](img/part-1/docker-ps.png)
   
#####Step 9:   
* Stop running container
   * `docker stop vul_flask`
    
   ![](img/part-1/docker-stop.png)   
    
#####Step 10:
* List of all containers including stopped and running containers
   * `docker ps -a`
    
   ![](img/part-1/docker-ps-a.png)

#####Step 11:   
* Remove Stopped container
   * `docker rm vul_flask`
    
   ![](img/part-1/docker-rm.png)

#####Step 12:
* Remove docker image
   * `docker rmi abhaybhargav/vul_flask`
    
   ![](img/part-1/docker-rmi-images.png)
