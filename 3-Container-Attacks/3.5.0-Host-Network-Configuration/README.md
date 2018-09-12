# Tamper Host Network Configuration

---


Step 1: Check if `ufw` is enabled on the host machine by running `ufw status`

    Screenshot here

Step 2: Enable `ufw` by running `ufw enable`

    Screenshot here
    
Step 3: Run a container by setting `--privilege` and `--net=host` flags. `docker run -ti --privilege --net=host ubuntu:16.04`

    Screenshot here
    
Step 4: Install `ufw` in the container by running `apt update && apt install -y ufw`

    Screenshot here
    
Step 5: To disable `ufw` of the host machine, run `ufw disable` in the container

    Screenshot here
    
Step 6: Exit the container by running `exit` and then run `ufw status` on the host machine to verify that `ufw` has been disabled.
 
    Screenshot here
