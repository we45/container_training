## Container Breakout - Non-Root Container

### Volume Mounts

* ssh into the container virtual lab or open Terminal in the VM

    ```
    ssh root@<IPAddrGivenToYou>
    password: <passwordGivenToYou>

    ```

* Run `whoami` to confirm that you are the `root` user.

```commandline
root@we45:~# whoami
root
root@we45:~#
```

* Validate that there's a secrets file in the root dir with `cat secret.txt`

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

* Run `cat /root/secret.txt` read the content of `secret.txt` file that was created by `root` user.

```commandline
we45@we45:~$ cat /root/secret.txt
cat: /root/secret.txt: Permission denied
```

* Run `docker run -ti --rm -u 1000 -v /root:/hostFS/ alpine sh` as `we45`(non-root user)


* Run `cat /hostFS/secret.txt` to view the content of the file.

```commandline
/hostFS/root # cat secret.txt
cat: can't open '/hostFS/secret.txt': Permission denied
```

* Run `exit` to exit from the container.

```commandline
/hostFS/root # exit
we45@we45:~$
```

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```