##Docker Hands-On Part-1 

* Open terminal

![](img/click_terminal.png)

* Download docker image from Docker Hub
    * `docker pull abhaybhargav/vul_flask`
    
    ![](img/docker-basic/docker-pull.png)
    
* View list of docker images
    * `docker pull abhaybhargav/vul_flask`
    
    ![](img/docker-basic/docker-images-list.png)
    
 
* Start docker container 
   * `docker run -d --name vul_flask abhaybhargav/vul_flask`
    
   ![](img/docker-basic/docker-run.png)
    
* List of running containers
   * `docker ps`
    
   ![](img/docker-basic/docker-ps.png)
    
    
* Exec into a container
   * `docker exec -it vul_flask bash`
    
   ![](img/docker-basic/docker-exec.png)
   

* Exit from the container
   * `exit`
    
   ![](img/docker-basic/exit-docker.png) 
   
* List of running containers
   * `docker ps`
    
   ![](img/docker-basic/docker-ps.png)
   
   
* Stop running container
   * `docker stop vul_flask`
    
   ![](img/docker-basic/docker-stop.png)   
    

* List of all containers including stopped and running containers
   * `docker ps -a`
    
   ![](img/docker-basic/docker-ps-a.png)
   
* Remove Stopped container
   * `docker rm vul_flask`
    
   ![](img/docker-basic/docker-rm.png)


* Remove docker image
   * `docker rmi abhaybhargav/vul_flask`
    
   ![](img/docker-basic/docker-rmi-images.png)
