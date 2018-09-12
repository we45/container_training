# Denial of Service

---

    * https://github.com/monitoringartist/docker-killer
    

Please Note: VM might freeze/crash for these exercises.
----------
    
    

CPU Bomb  
----------

Step 1: Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" --oom-kill-disable monitoringartist/docker-killer cpubomb`

    Screenshot here
    
Step 2: CPU usage should be close to 100% for 5 seconds before timeout. 

    Screenshot here


Memory Bomb  
----------

Step 1: Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" --oom-kill-disable monitoringartist/docker-killer membomb`
    
       Screenshot here
       
Step 2: Memory usage should be close to 100% for 5 seconds before timeout.

        Screenshot here


Network Bomb  
----------

Step 1: Run `docker run --rm -ti --privileged -v /:/rootfs -e "TIMEOUT=5" --oom-kill-disable monitoringartist/docker-killer membomb`

        Screenshot here
        
Step 2: Network usage should be close to maximum for 5 seconds before timeout.
        
        Screenshot here


