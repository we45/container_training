#Linux Capabilities 

---

* Open terminal

![](img/open_terminal.png)

* Run a docker container and ping localhost
    * `docker run -it alpine ping -c 1 localhost`
    
    ![](img/docker-pull.png)
    
  
* Run a docker container and disable network syscall and ping into localhost
    * `docker run --cap-drop=net_raw -it alpine ping -c 1 localhost`
    
    ![](img/docker-pull.png)
    
* Run a docker container and disable all syscall and allow only  network syscall and ping into localhost
    * `docker run --cap-drop=ALL --cap-add=net_raw -it alpine ping -c 1 localhost`
    
    ![](img/part-1/docker-pull.png)
