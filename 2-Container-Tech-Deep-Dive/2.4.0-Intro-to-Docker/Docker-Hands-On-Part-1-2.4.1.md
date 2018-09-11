##Docker Hands-On Part-1 

* Open terminal

![](img/part-1/open_terminal.png)

* Download docker image from Docker Hub
    * `docker pull abhaybhargav/vul_flask`
    
    ![](img/part-1/docker-pull.png)
    
* View list of docker images
    * `docker pull abhaybhargav/vul_flask`
    
    ![](img/part-1/docker-images-list.png)
    
 
* Start docker container 
   * `docker run -d --name vul_flask abhaybhargav/vul_flask`
    
   ![](img/part-1/docker-run.png)
    
* List of running containers
   * `docker ps`
    
   ![](img/part-1/docker-ps.png)
    
    
* Exec into a container
   * `docker exec -it vul_flask bash`
    
   ![](img/part-1/docker-exec.png)
   

* Exit from the container
   * `exit`
    
   ![](img/part-1/exit-docker.png) 
   
* List of running containers
   * `docker ps`
    
   ![](img/part-1/docker-ps.png)
   
   
* Stop running container
   * `docker stop vul_flask`
    
   ![](img/part-1/docker-stop.png)   
    

* List of all containers including stopped and running containers
   * `docker ps -a`
    
   ![](img/part-1/docker-ps-a.png)
   
* Remove Stopped container
   * `docker rm vul_flask`
    
   ![](img/part-1/docker-rm.png)


* Remove docker image
   * `docker rmi abhaybhargav/vul_flask`
    
   ![](img/part-1/docker-rmi-images.png)
