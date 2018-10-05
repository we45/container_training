## Resource Management


**Note:**
```commandline
--storage-opt           Storage driver
--cpus		        Number of CPUs
-m                      Memory Size 

```

* Run `docker run -it --storage-opt size=10G -m=4M --cpus=".5" ubuntu:latest /bin/bash`


##### Step 2:

* Run `clean-docker` to stop all containers.  

    ```commandline
    (venv)root@we45: clean-docker
    92200af86b18
    ca94dab2d52e
    92200af86b18
    34c4adcf326d
    86cd73d03ef1
    ca94dab2d52e
    "docker rmi" requires at least 1 argument.
    See 'docker rmi --help'.
    
    Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]
    
    Remove one or more images
    
    ```