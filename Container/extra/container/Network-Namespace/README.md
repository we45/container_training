## Network Namespace

##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)


##### Step 2:

*  **cd** into  `/home/we45/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace`

```cd /home/we45/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace```



##### Step 3:

*  Run `ifconfig -a` to get the list of network interfaces on the machine.

```
docker0   Link encap:Ethernet  HWaddr 02:42:1a:bc:85:c5  
          inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr 08:00:27:93:a8:82  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe93:a882/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:25 errors:0 dropped:0 overruns:0 frame:0
          TX packets:96 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:3398 (3.3 KB)  TX bytes:12120 (12.1 KB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:44 errors:0 dropped:0 overruns:0 frame:0
          TX packets:44 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:3178 (3.1 KB)  TX bytes:3178 (3.1 KB)

lxcbr0    Link encap:Ethernet  HWaddr 7e:88:28:b7:8d:0b  
          inet addr:10.0.3.1  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::7c88:28ff:feb7:8d0b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:59 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:8623 (8.6 KB)

```

##### Step 4:

* Run `iptables -L` to get the iptables info.

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# iptables -L
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

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.2.2        0.0.0.0         UG    0      0        0 eth0
10.0.2.0        0.0.0.0         255.255.255.0   U     1      0        0 eth0
10.0.3.0        0.0.0.0         255.255.255.0   U     0      0        0 lxcbr0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0

```

##### Step 6:

* To add a Networking Namespace, run `ip netns add NetNameSpace`

```root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# ip netns add NetNameSpace```

##### Step 7:

* Run `ip netns list` to get the list of Network Namespaces

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# ip netns list
NetNameSpace
```

##### Step 8:

* Run `sudo ip netns exec NetNameSpace bash` to exec into the Network Namespace.

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# sudo ip netns exec NetNameSpace bash
```

##### Step 9:

* Run `ifconfig -a` to get the list of network interfaces on the 'NetNameSpace' Network Namespace.

```root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# ifconfig -a
lo        Link encap:Local Loopback  
          LOOPBACK  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

##### Step 10:

* Run  and `iptables -L` to verify that there is no iptables available, since this is a new networking stack.

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

```
##### Step 11:   
           
* Run `route -n` to verify that there is no default gateway, inside a new container.

```root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
```

##### Step 12:

* Run `exit` to exit from the Network Namespace.

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# exit
exit

```

##### Step 13:

* Run  `ip netns list` to verify the Network Namespece.

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# ip netns list
NetNameSpace

```

##### Step 14:

* To delete the Network Namespce, run `sudo ip netns del NetNameSpace`

```
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# sudo ip netns del NetNameSpace
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Network-Namespace# 
```
