## Anchore

* SSH into your Virtual Lab or open Terminal, if you're on the VM

* Navigate to `/root/labs/container_training/Container/Anchore`

* Run below three commands to set the environment variables.

    ```commandline
    export ANCHORE_CLI_URL=http://localhost:8228/v1
    export ANCHORE_CLI_USER=admin
    export ANCHORE_CLI_PASS=admin
    ```

* Run `docker-compose up -d` to up the  anchore-cli and its requisites.

    ````commandline
    root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Anchore# docker-compose up -d
    Creating network "anchore_default" with the default driver
    Creating anchore_anchore-db_1 ... done
    Creating anchore_anchore-engine_1 ... done
    
    ```` 
    
    **Note:** Wait 25 to 30 seconds to up the anchore database.

* Run `docker ps` to confirm

* Run `anchore-cli image list` to view the list of analyzed images.

    ```commandline
    Full Tag                                       Image ID                                                                Analysis Status        
    docker.io/abhaybhargav/vul_flask:latest        9ac6b79cd152209c1311c319fd50658cf456ec3291e8b8803006ce3c8a51e506        analyzed        
    docker.io/library/debian:latest                f2aae6ff5d896839bfb8609cb1510bcf36efcb6950683c3bcfb760668b0eefbe        analyzed
    ```


* Once the database is up , run `anchore-cli image add abhaybhargav/vul_flask:latest` to add the image into the anchore, to scan the image.

    ```commandline
    Image Digest: sha256:a3fe27c223066aa605e3fca8d49fbe53ab26f39f89ed895485669239f6c433ae
    Analysis Status: not_analyzed
    Image Type: docker
    Image ID: 9ac6b79cd152209c1311c319fd50658cf456ec3291e8b8803006ce3c8a51e506
    Dockerfile Mode: None
    Distro: None
    Distro Version: None
    Size: None
    Architecture: None
    Layer Count: None
    
    Full Tag: docker.io/abhaybhargav/vul_flask:latest
    
    ```

* Run `anchore-cli image list` to verify the added image status

    ```commandline
    Full Tag                                       Image ID                                                                Analysis Status        
    docker.io/abhaybhargav/vul_flask:latest        9ac6b79cd152209c1311c319fd50658cf456ec3291e8b8803006ce3c8a51e506        analyzing              
    docker.io/library/debian:latest                f2aae6ff5d896839bfb8609cb1510bcf36efcb6950683c3bcfb760668b0eefbe        analyzed
    ```
      
   
##### Step 8:

**Note:** Once the *Analysis Status* shows *analyzed*.

* Run `anchore-cli image content docker.io/abhaybhargav/vul_flask:latest os` to check OS related issue

    ```commandline
    libpam-modules-bin                  1.1.8-3.1+deb8u2+b1                     Unknown                                                                                                                                                                                                                                                                     
    libpam-runtime                      1.1.8-3.1+deb8u2                        Unknown                                                                                                                                                                                                                                                                     
    libpam0g                            1.1.8-3.1+deb8u2+b1                     Unknown                                                                                                                                                                                                                                                                     
    libpango-1.0-0                      1.36.8-3                                Unknown                                                                                                                                                                                                                                                                     
    libpangocairo-1.0-0                 1.36.8-3                                Unknown                                                                                                                                                                                                                                                                     
    libpangoft2-1.0-0                   1.36.8-3                                Unknown                                                                                                                                                                                                                                                                     
    libpathplan4                        2.38.0-7                                Unknown                                                                                                                                                                                                                                                                     
    libpcre3                            2:8.35-3.3+deb8u4                       Unknown                                                                                                                                                                                                                                                                     
    libpcre3-dev                        2:8.35-3.3+deb8u4                       Unknown                                                                                                                                                                                                                                                                     
    libpcrecpp0                         2:8.35-3.3+deb8u4                       Unknown                                                                                                                                                                                                                                                                     
    libpixman-1-0                       0.32.6-3                                Unknown                                                                                                                                                                                                                                                                     
    libpixman-1-dev                     0.32.6-3                                Unknown                                                                                                                                                               
    ```

* Run `anchore-cli image content docker.io/abhaybhargav/vul_flask:latest python` to check languages related issue.

    ```commandline
    Package                 Version           Location                                      
    Faker                   0.7.17            /usr/local/lib/python2.7/site-packages        
    Flask                   0.12.2            /usr/local/lib/python2.7/site-packages        
    Flask-SQLAlchemy        2.2               /usr/local/lib/python2.7/site-packages        
    Jinja2                  2.9.6             /usr/local/lib/python2.7/site-packages        
    MarkupSafe              1.0               /usr/local/lib/python2.7/site-packages        
    MySQL-python            1.2.5             /usr/local/lib/python2.7/site-packages        
    PyJWT                   1.5.2             /usr/local/lib/python2.7/site-packages        
    PyYAML                  3.12              /usr/local/lib/python2.7/site-packages        
    Python                  2.7.14            /usr/local/lib/python2.7/lib-dynload          
    Python                  2.7.9             /usr/lib/python2.7/lib-dynload                
    SQLAlchemy              1.1.11            /usr/local/lib/python2.7/site-packages        
    Werkzeug                0.14.1            /usr/local/lib/python2.7/site-packages        
    argparse                1.2.1             /usr/lib/python2.7                            
    backports-abc           0.5               /usr/local/lib/python2.7/site-packages        
    bzr                     2.7.0.dev1        /usr/lib/python2.7/dist-packages              
    certifi                 2017.4.17         /usr/local/lib/python2.7/site-packages        
    chardet                 3.0.4             /usr/local/lib/python2.7/site-packages        
    click                   6.7               /usr/local/lib/python2.7/site-packages        
    configobj               5.0.6             /usr/lib/python2.7/dist-packages              
    gevent                  1.2.2             /usr/local/lib/python2.7/site-packages        
    greenlet                0.4.12            /usr/local/lib/python2.7/site-packages        
    grequests               0.3.0             /usr/local/lib/python2.7/site-packages        
    idna                    2.5               /usr/local/lib/python2.7/site-packages        
    ipaddress               1.0.18            /usr/local/lib/python2.7/site-packages        
    itsdangerous            0.24              /usr/local/lib/python2.7/site-packages        
    lxml                    4.2.1             /usr/local/lib/python2.7/site-packages        
    mercurial               3.1.2             /usr/lib/python2.7/dist-packages              
    pip                     10.0.0            /usr/local/lib/python2.7/site-packages        
    python-dateutil         2.6.0             /usr/local/lib/python2.7/site-packages        
    python-docx             0.8.5             /usr/local/lib/python2.7/site-packages        
    requests                2.18.1            /usr/local/lib/python2.7/site-packages        
    setuptools              39.0.1            /usr/local/lib/python2.7/site-packages        
    singledispatch          3.4.0.3           /usr/local/lib/python2.7/site-packages        
    six                     1.10.0            /usr/local/lib/python2.7/site-packages        
    six                     1.8.0             /usr/lib/python2.7/dist-packages              
    tornado                 4.5.1             /usr/local/lib/python2.7/site-packages        
    urllib3                 1.21.1            /usr/local/lib/python2.7/site-packages        
    virtualenv              15.2.0            /usr/local/lib/python2.7/site-packages        
    wheel                   0.30.0            /usr/local/lib/python2.7/site-packages        
    wsgiref                 0.1.2             /usr/lib/python2.7                            
    wsgiref                 0.1.2             /usr/local/lib/python2.7  
    ```

* Run `docker-compose down` to stop all the anchore containers.

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
