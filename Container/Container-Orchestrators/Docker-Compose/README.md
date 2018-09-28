## Docker-Compose

##### Step 1:
* Open terminal

![](img/Open-Terminal.png)

##### Step 2:
* cd into Docker compose Lab Folder
    * `cd /home/we45/container_training/Container/Container-Orchestrators/Docker-Compose`
    
    ```commandline
    root@we45:~# cd /home/we45/container_training/Container/Container-Orchestrators/Docker-Composeroot@we45:~/container_training/Container/Container-Orchestrators/Docker-Compose#
    
    ```
    
##### Step 3:
* Run `docker-compose up -d`

    ```commandline
    root@we45:~/container_training/Container/Container-Orchestrators/Docker-Compose# docker-compose up -d
    Creating network "docker-compose_default" with the default driver
    Creating docker-compose_helloworld_1 ... done
    Creating docker-compose_nginx_1      ... done
    ```

##### Step 4:
* Open Browser and check the application status `http://localhost`

![](img/app-status.png)
