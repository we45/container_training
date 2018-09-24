## Setting up a minimal container


##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)

##### Step 2:
*  **cd** into  `Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container`

    ```commandline
    cd Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container
    ```

##### Step 3:
*  Run `ifconfig -a` to get the list of network interfaces on the machine.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# ifconfig -a
    docker0   Link encap:Ethernet  HWaddr 02:42:a3:15:61:c4  
              inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
              inet6 addr: fe80::42:a3ff:fe15:61c4/64 Scope:Link
              UP BROADCAST MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:36 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:0 (0.0 B)  TX bytes:5624 (5.6 KB)
    
    eth0      Link encap:Ethernet  HWaddr 08:00:27:93:a8:82  
              inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
              inet6 addr: fe80::a00:27ff:fe93:a882/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:228327 errors:0 dropped:0 overruns:0 frame:0
              TX packets:114493 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:326750226 (326.7 MB)  TX bytes:6941544 (6.9 MB)
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:210 errors:0 dropped:0 overruns:0 frame:0
              TX packets:210 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:17728 (17.7 KB)  TX bytes:17728 (17.7 KB)
    
    lxcbr0    Link encap:Ethernet  HWaddr 42:99:04:97:b0:22  
              inet addr:10.0.3.1  Bcast:10.0.3.255  Mask:255.255.255.0
              inet6 addr: fe80::4099:4ff:fe97:b022/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:65 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:0 (0.0 B)  TX bytes:9205 (9.2 KB)
    ```

##### Step 4:
* Run `iptables -L` to get the iptables info.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# iptables -L
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination         
    ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:domain
    ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
    ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:bootps
    ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootps
    
    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination         
    DOCKER-USER  all  --  anywhere             anywhere            
    DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
    DOCKER     all  --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    ACCEPT     all  --  anywhere             anywhere            
    
    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination         
    
    Chain DOCKER (1 references)
    target     prot opt source               destination         
    
    Chain DOCKER-ISOLATION-STAGE-1 (1 references)
    target     prot opt source               destination         
    DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere            
    RETURN     all  --  anywhere             anywhere            
    
    Chain DOCKER-ISOLATION-STAGE-2 (1 references)
    target     prot opt source               destination         
    DROP       all  --  anywhere             anywhere            
    RETURN     all  --  anywhere             anywhere            
    
    Chain DOCKER-USER (1 references)
    target     prot opt source               destination         
    RETURN     all  --  anywhere             anywhere 
    
    ```

##### Step 5:
* Run `route -n` to get the default network gateways.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# route -n
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    0.0.0.0         10.0.2.2        0.0.0.0         UG    0      0        0 eth0
    10.0.2.0        0.0.0.0         255.255.255.0   U     1      0        0 eth0
    10.0.3.0        0.0.0.0         255.255.255.0   U     0      0        0 lxcbr0
    172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
    
    ```

##### Step 6:
* To create a minimal container, run `unshare --net --ipc --uts --mount /bin/bash`.
   
   Note: 
   
   ```
        Namespace flags used:
   
            --net : Unshare the network namespace            
            --ipc : Unshare the Inter-Process-Communication namespace
            --uts : Unshare UTS namespace
            --mount : Unshare the Mount namespace
   ```   
   
    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# unshare --net --ipc --uts --mount /bin/bash
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container#
    
    ```
 
##### Step 7:              
* Run `route -n` to verify default gateway, inside a new container.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# route -n
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    ```

##### Step 8:
* Run  and `iptables -L` to verify the  available iptables inside a new container.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# iptables -L
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination         
    
    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination         
    
    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination
    
    ```

##### Step 9:
* Run `exit` to exit from the container.

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.2.0-Minimal-Container# exit
    exit
    
    ``` 

