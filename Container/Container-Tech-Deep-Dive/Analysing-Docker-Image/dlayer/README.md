## Analysing Docker layers with Dlayer


##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `/home/we45/container_training/Container/Container-Tech-Deep-Dive/Analysing-Docker-Layers`

    ```commandline
    cd /home/we45/container_training/Container/Container-Tech-Deep-Dive/Analysing-Docker-Layers
    ```

##### Step 3:  
 
* Run `docker images` to get list of images on the machine

    ```commandline
    root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Analysing-Docker-Layers# docker images
    REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
    mongo                          latest              e3985c6fb3c8        2 weeks ago         381MB
    ubuntu                         16.04               b9e15a5d1e1a        2 weeks ago         115MB
    nginx                          latest              06144b287844        2 weeks ago         109MB
    postgres                       9                   01e1fdb168a4        2 weeks ago         229MB
    docker/docker-bench-security   latest              9845aeb4ed8d        6 weeks ago         32MB
    anchore/anchore-engine         latest              940c39377c1a        6 weeks ago         575MB
    sysdig/falco                   latest              48e977e1b431        7 weeks ago         694MB
    alpine                         latest              11cd0b38bc3c        2 months ago        4.41MB
    arminc/clair-local-scan        v2.0.1              84c42efb0397        3 months ago        387MB
    abhaybhargav/vul_flask         latest              9ac6b79cd152        5 months ago        763MB
    arminc/clair-db                2017-09-18          4eccc1042784        12 months ago       391MB
    
    ```
    ![](img/docker-images-list.png) 
    
##### Step 4: 

* Select an image to be analysed and run `docker save alpine:latest | dlayer -n 100 | less`

    ```commandline
    root@we45:~/Labs/2.0.0-Container-Tech-Deep-Dive/2.4.0-Intro-To-Docker/2.4.2-Analysing-Docker-Layers# docker save alpine:latest | dlayer -n 100 | less
    ====================================================================================================
     4.4 MB          $ #(nop) ADD file:25f61d70254b9807a40cd3e8d820f6a5ec0e1e596de04e325f6a33810393e95a in / 
    ====================================================================================================
     1.7 MB          lib/libcrypto.so.43.0.1
     796 kB          bin/busybox
     584 kB          lib/ld-musl-x86_64.so.1
     349 kB          etc/ssl/cert.pem
     310 kB          lib/libssl.so.45.0.1
     211 kB          sbin/apk
      92 kB          lib/libz.so.1.2.11
      80 kB          usr/bin/scanelf
      59 kB          lib/libtls.so.17.0.1
      45 kB          usr/bin/getent
      36 kB          etc/services
      32 kB          usr/bin/getconf
      20 kB          usr/bin/iconv
      11 kB          lib/apk/db/installed
     9.9 kB          usr/bin/ssl_client
     9.7 kB          lib/apk/db/scripts.tar
     5.8 kB          sbin/mkmntdirs
     4.1 kB          etc/udhcpd.conf
     2.0 kB          etc/modprobe.d/blacklist.conf
     1.9 kB          etc/protocols
     1.5 kB          etc/modprobe.d/aliases.conf
     1.2 kB          etc/passwd
     1.1 kB          etc/sysctl.d/00-alpine.conf
     1.0 kB          etc/ssl/x509v3.cnf
      745 B          etc/ssl/openssl.cnf
      697 B          etc/group
      570 B          etc/inittab
      451 B          etc/apk/keys/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
      451 B          etc/apk/keys/alpine-devel@lists.alpinelinux.org-5243ef4b.rsa.pub
      451 B          etc/apk/keys/alpine-devel@lists.alpinelinux.org-5261cecb.rsa.pub
      451 B          usr/share/apk/keys/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
      451 B          usr/share/apk/keys/alpine-devel@lists.alpinelinux.org-5243ef4b.rsa.pub
    :
    ```
    
    **Note:** Press `ctrl + c` or `ctrl + z` to exit from the view
    
    
   ![](img/dlayer-2.png)
        

