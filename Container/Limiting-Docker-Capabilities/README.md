## Docker Capabilities

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `/root/labs/container_training/Container/Limiting-Docker-Capabilities`

    ```commandline
    cd /root/labs/container_training/Container/Limiting-Docker-Capabilities
    ```

##### Step 3:

* Run `docker run -it alpine ping -c 1 localhost` to ping localhost network.

    ```commandline
    root@we45:~/container_training/Container/Container-Security-Deep-Dive/Limiting-Docker-Capabilities# docker run -it alpine ping -c 1 localhost
    PING localhost (127.0.0.1): 56 data bytes
    64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.054 ms
    
    --- localhost ping statistics ---
    1 packets transmitted, 1 packets received, 0% packet loss
    round-trip min/avg/max = 0.054/0.054/0.054 ms
    ```

##### Step 4:

* Run `docker run --cap-drop=net_raw -it alpine ping -c 1 localhost` docker container and disable network syscall and ping into localhost.

    ```commandline
    root@we45:~/container_training/Container/Container-Security-Deep-Dive/Limiting-Docker-Capabilities# docker run --cap-drop=net_raw -it alpine ping -c 1 localhost
    PING localhost (127.0.0.1): 56 data bytes
    ping: permission denied (are you root?)
    ```
##### Step 5:    

* Run `docker run --cap-drop=ALL --cap-add=net_raw -it alpine ping -c 1 localhost` docker container and disable all syscall and allow only  network syscall and ping into localhost.

    ```commandline
    root@we45:~/container_training/Container/Container-Security-Deep-Dive/Limiting-Docker-Capabilities# docker run --cap-drop=ALL --cap-add=net_raw -it alpine ping -c 1 localhost
    PING localhost (127.0.0.1): 56 data bytes
    64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.061 ms
    
    --- localhost ping statistics ---
    1 packets transmitted, 1 packets received, 0% packet loss
    round-trip min/avg/max = 0.061/0.061/0.061 ms
    ```


##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
