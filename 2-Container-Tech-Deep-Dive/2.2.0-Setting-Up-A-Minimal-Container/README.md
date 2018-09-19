# Setting up a minimal container

---


Step 1: Run `ifconfig -a`, `iptables -L`, `route -L`, etc.. to get the list of network interfaces on the machine.

![](img/min-cont-1.png)


Step 2: To create a minimal container, run `unshare --net --ipc --uts --mount /bin/bash`        
        
        * Namespace flags used:
            --net : Unshare the network namespace
            --ipc : Unshare the Inter-Process-Communication namespace
            --uts : Unshare UTS namespace
            --mount : Unshare the Mount namespace


![](img/min-cont-2.png)


Step 3: Run  `ifconfig -a`, `iptables -L`, `route -n`, etc.. on the container to confirm

![](img/min-cont-3.png)

        
Step 4: Exit once done.

![](img/min-cont-4.png)

