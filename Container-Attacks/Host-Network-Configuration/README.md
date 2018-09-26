## Tamper Host Network Configuration

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `Labs/3.0.0-Container-Attacks/3.5.0`

    ```commandline
    cd Labs/3.0.0-Container-Attacks/3.5.0
    ```

##### Step 3:

* Check if `ufw` is enabled on the host machine by running `ufw status`

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# ufw status
    Status: inactive
    ```

##### Step 4:

* Enable `ufw` by running `ufw enable`

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# ufw enable
    Firewall is active and enabled on system startup
    ```

##### Step 5:

* Run `docker run -d --privileged --net=host --name vul_flask abhaybhargav/vul_flask` to start a docker container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# docker run -d --privileged --net=host --name vul_flask abhaybhargav/vul_flask
    6733abdce5042a90db8b7d40a08155470c727e8b3864eda519714e172f63be88
    ```
 
##### Step 6:   

* Run `docker ps` to view, all running containers.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# docker ps
    CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS              PORTS               NAMES
    d0169e5801fe        abhaybhargav/vul_flask   "python app.py"     24 seconds ago      Up 22 seconds       5050/tcp            vul_flask
    ```
     
    ![](img/docker-ps.png)
    
##### Step 7:   

* Run `docker exec -it vul_flask bash` to exec into a running container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# docker exec -it vul_flask bash
    root@d0169e5801fe:/apps# 
    ```
    ![](img/docker-exec.png)
   
##### Step 8:

* Install `ufw` in the container by running `apt update && apt install -y ufw`

    ```commandline
    root@we45:/apps# apt update && apt install -y ufw
    Get:1 http://security.debian.org jessie/updates InRelease [44.9 kB]         
    Ign http://deb.debian.org jessie InRelease
    Get:2 http://deb.debian.org jessie-updates InRelease [145 kB]
    Get:3 http://deb.debian.org jessie Release.gpg [2420 B]                               
    Get:4 http://deb.debian.org jessie Release [148 kB]             
    Get:5 http://deb.debian.org jessie-updates/main amd64 Packages [23.0 kB]           
    Get:6 http://security.debian.org jessie/updates/main amd64 Packages [663 kB]      
    Get:7 http://deb.debian.org jessie/main amd64 Packages [9098 kB]         
    Fetched 10.1 MB in 21s (469 kB/s)                                                                                                                            
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    67 packages can be upgraded. Run 'apt list --upgradable' to see them.
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following extra packages will be installed:
      dh-python iptables libmpdec2 libnfnetlink0 libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libxtables10 python3 python3-minimal python3.4
      python3.4-minimal
    Suggested packages:
      python3-doc python3-tk python3-venv python3.4-venv python3.4-doc binfmt-support rsyslog
    The following NEW packages will be installed:
      dh-python iptables libmpdec2 libnfnetlink0 libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libxtables10 python3 python3-minimal python3.4
      python3.4-minimal ufw
    0 upgraded, 13 newly installed, 0 to remove and 67 not upgraded.
    Need to get 5151 kB of archives.
    After this operation, 23.3 MB of additional disk space will be used.
    Get:1 http://deb.debian.org/debian/ jessie/main libmpdec2 amd64 2.4.1-1 [85.7 kB]
    Get:2 http://deb.debian.org/debian/ jessie/main libnfnetlink0 amd64 1.0.1-3 [13.5 kB]
    Get:3 http://deb.debian.org/debian/ jessie/main libpython3.4-minimal amd64 3.4.2-1 [492 kB]
    Get:4 http://deb.debian.org/debian/ jessie/main libpython3.4-stdlib amd64 3.4.2-1 [2088 kB]
    Get:5 http://deb.debian.org/debian/ jessie/main python3.4-minimal amd64 3.4.2-1 [1646 kB]
    Get:6 http://deb.debian.org/debian/ jessie/main libxtables10 amd64 1.4.21-2+b1 [67.6 kB]                                                                     
    Get:7 http://deb.debian.org/debian/ jessie/main iptables amd64 1.4.21-2+b1 [277 kB]                                                                          
    Get:8 http://deb.debian.org/debian/ jessie/main python3.4 amd64 3.4.2-1 [204 kB]                                                                             
    Get:9 http://deb.debian.org/debian/ jessie/main python3-minimal amd64 3.4.2-2 [34.7 kB]                                                                      
    Get:10 http://deb.debian.org/debian/ jessie/main libpython3-stdlib amd64 3.4.2-2 [18.1 kB]                                                                   
    Get:11 http://deb.debian.org/debian/ jessie/main python3 amd64 3.4.2-2 [21.2 kB]                                                                             
    Get:12 http://deb.debian.org/debian/ jessie/main dh-python all 1.20141111-2 [66.4 kB]                                                                        
    Get:13 http://deb.debian.org/debian/ jessie/main ufw all 0.33-2 [138 kB]                                                                                     
    Fetched 5151 kB in 10s (509 kB/s)                                                                                                                            
    debconf: delaying package configuration, since apt-utils is not installed
    Selecting previously unselected package libmpdec2:amd64.
    (Reading database ... 21636 files and directories currently installed.)
    Preparing to unpack .../libmpdec2_2.4.1-1_amd64.deb ...
    Unpacking libmpdec2:amd64 (2.4.1-1) ...
    Selecting previously unselected package libnfnetlink0:amd64.
    Preparing to unpack .../libnfnetlink0_1.0.1-3_amd64.deb ...
    Unpacking libnfnetlink0:amd64 (1.0.1-3) ...
    Selecting previously unselected package libpython3.4-minimal:amd64.
    Preparing to unpack .../libpython3.4-minimal_3.4.2-1_amd64.deb ...
    Unpacking libpython3.4-minimal:amd64 (3.4.2-1) ...
    Selecting previously unselected package libpython3.4-stdlib:amd64.
    Preparing to unpack .../libpython3.4-stdlib_3.4.2-1_amd64.deb ...
    Unpacking libpython3.4-stdlib:amd64 (3.4.2-1) ...
    Selecting previously unselected package python3.4-minimal.
    Preparing to unpack .../python3.4-minimal_3.4.2-1_amd64.deb ...
    Unpacking python3.4-minimal (3.4.2-1) ...
    Selecting previously unselected package libxtables10.
    Preparing to unpack .../libxtables10_1.4.21-2+b1_amd64.deb ...
    Unpacking libxtables10 (1.4.21-2+b1) ...
    Selecting previously unselected package iptables.
    Preparing to unpack .../iptables_1.4.21-2+b1_amd64.deb ...
    Unpacking iptables (1.4.21-2+b1) ...
    Selecting previously unselected package python3.4.
    Preparing to unpack .../python3.4_3.4.2-1_amd64.deb ...
    Unpacking python3.4 (3.4.2-1) ...
    Selecting previously unselected package python3-minimal.
    Preparing to unpack .../python3-minimal_3.4.2-2_amd64.deb ...
    Unpacking python3-minimal (3.4.2-2) ...
    Selecting previously unselected package libpython3-stdlib:amd64.
    Preparing to unpack .../libpython3-stdlib_3.4.2-2_amd64.deb ...
    Unpacking libpython3-stdlib:amd64 (3.4.2-2) ...
    Selecting previously unselected package python3.
    Preparing to unpack .../python3_3.4.2-2_amd64.deb ...
    Unpacking python3 (3.4.2-2) ...
    Selecting previously unselected package dh-python.
    Preparing to unpack .../dh-python_1.20141111-2_all.deb ...
    Unpacking dh-python (1.20141111-2) ...
    Selecting previously unselected package ufw.
    Preparing to unpack .../archives/ufw_0.33-2_all.deb ...
    Unpacking ufw (0.33-2) ...
    Processing triggers for mime-support (3.58) ...
    Processing triggers for systemd (215-17+deb8u7) ...
    Setting up libmpdec2:amd64 (2.4.1-1) ...
    Setting up libnfnetlink0:amd64 (1.0.1-3) ...
    Setting up libpython3.4-minimal:amd64 (3.4.2-1) ...
    Setting up libpython3.4-stdlib:amd64 (3.4.2-1) ...
    Setting up python3.4-minimal (3.4.2-1) ...
    Setting up libxtables10 (1.4.21-2+b1) ...
    Setting up iptables (1.4.21-2+b1) ...
    Setting up python3.4 (3.4.2-1) ...
    Setting up python3-minimal (3.4.2-2) ...
    Setting up libpython3-stdlib:amd64 (3.4.2-2) ...
    Setting up dh-python (1.20141111-2) ...
    Setting up python3 (3.4.2-2) ...
    running python rtupdate hooks for python3.4...
    running python post-rtupdate hooks for python3.4...
    Setting up ufw (0.33-2) ...
    debconf: unable to initialize frontend: Dialog
    debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
    debconf: falling back to frontend: Readline
    
    Creating config file /etc/ufw/before.rules with new version
    
    Creating config file /etc/ufw/before6.rules with new version
    
    Creating config file /etc/ufw/after.rules with new version
    
    Creating config file /etc/ufw/after6.rules with new version
    update-rc.d: warning: start and stop actions are no longer supported; falling back to defaults
    Processing triggers for libc-bin (2.19-18+deb8u10) ...
    Processing triggers for systemd (215-17+deb8u7) ...
    ```   
    
##### Step 9:

* Run `ufw status` to verify ufw is running or not.

    ```commandline
    root@we45:/apps# ufw status
    Status: active
    ```
    
##### Step 10:

* To disable `ufw` of the host machine, run `ufw disable` in the container

    ```commandline
    root@we45:/apps# ufw disable
    Firewall stopped and disabled on system startup
    ```

##### Step 11:

* Run `ufw status` to verify ufw is stopped or not.

    ```commandline
    root@we45:/apps# ufw status
    Status: inactive
    ```
 
##### Step 12:

* Run `exit` to exit from the container

    ```commandline
    root@we45:/apps# exit
    exit
    
    ```

##### Step 13:

* Run `ufw status` in the host machine to verity ufw is running or not.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# ufw status
    Status: inactive
    ```

##### Step 14:

* Run `docker stop vul_flask` to stop the running container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# docker stop vul_flask
    vul_flask    
    ```

##### Step 15:

* Run `docker rm vul_flask` to remove stopped container.

    ```commandline
    root@we45:~/Labs/3.0.0-Container-Attacks/3.5.0# docker rm vul_flask
    vul_flask    
    ```