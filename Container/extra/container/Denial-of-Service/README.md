## Denial of Service

## Please Note: VM might freeze/crash for these exercises.

###### A malicious user with access to docker can consume host-resources such as CPU, Memory and Network by launching a malicious container. This can cause a Denial-of-Service attack making other services inaccessible.

##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)


### CPU Bomb

##### Step 1:

*  Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5"  monitoringartist/docker-killer cpubomb`

```commandline
root@we45:~# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5"  monitoringartist/docker-killer cpubombcpubomb - duration 5s
Test: excessive CPU utilization - one proces per processor with empty cycles
CPU:  90% usr  10% sys   0% nic   0% idle   0% io   0% irq   0% sirq
CPU: 100% usr   0% sys   0% nic   0% idle   0% io   0% irq   0% sirq
CPU: 100% usr   0% sys   0% nic   0% idle   0% io   0% irq   0% sirq
CPU: 100% usr   0% sys   0% nic   0% idle   0% io   0% irq   0% sirq
CPU:  98% usr   1% sys   0% nic   0% idle   0% io   0% irq   0% sirq
/test.sh: line 101:     6 Killed                  timeout -t ${TIMEOUT} -s KILL bash -c $@    
```


### Memory Bomb

##### Step 1:

* Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer membomb`

```commandline
root@we45:~# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer membomb
membomb - duration 5s
Test: excessive memory (RAM+swap) utilization
Mem: 1180028K used, 869832K free, 2900K shrd, 70124K buff, 575144K cached
Mem: 1704688K used, 345172K free, 2900K shrd, 70124K buff, 575144K cached
Mem: 1984284K used, 65576K free, 2688K shrd, 9100K buff, 253900K cached
Mem: 1993548K used, 56312K free, 2680K shrd, 96K buff, 69932K cached
Mem: 1994392K used, 55468K free, 2680K shrd, 244K buff, 52960K cached
/test.sh: line 101:     6 Killed                  timeout -t ${TIMEOUT} -s KILL bash -c $@
```   

### Network Bomb

##### Step 1:

* Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer netbomb`



##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```