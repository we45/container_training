## Denial of Service

**Please Note:** VM might freeze/crash for these exercises.


##### Step 1:
* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:
*  **cd** into  `Labs/3.0.0-Container-Attacks/3.8.0`

    ```commandline
    cd Labs/3.0.0-Container-Attacks/3.8.0
    ```    

### CPU Bomb

##### Step 1:
*  Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5"  monitoringartist/docker-killer cpubomb`

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.8.0# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5"  monitoringartist/docker-killer cpubombcpubomb - duration 5s
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
    root@we45:~/Labs/3.0.0-Container-Attacks/3.8.0# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer membomb
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
* Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer membomb`

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.8.0# docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" monitoringartist/docker-killer membomb
    membomb - duration 5s
    Test: excessive memory (RAM+swap) utilization
    Mem: 743292K used, 1306568K free, 2640K shrd, 5532K buff, 158656K cached
    Mem: 1996980K used, 52880K free, 2676K shrd, 100K buff, 28592K cached
    Mem: 1989836K used, 60024K free, 2556K shrd, 100K buff, 25408K cached
    Mem: 1996808K used, 53052K free, 1628K shrd, 100K buff, 24812K cached
    Mem: 1996604K used, 53256K free, 248K shrd, 100K buff, 23892K cached
    /test.sh: line 101:     6 Killed                  timeout -t ${TIMEOUT} -s KILL bash -c $@
    ```
