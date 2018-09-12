# Docker Daemon Configuration

---



    * Insecure Docker API configuration can compromise a host machine.
    NJ needs to finish final piece of this and will get it done by Friday EOD


    Run Nmap on 127.0.0.1 to discover docker port maybe? Just to show that it's open

Step 1. Once you have access to a remote machine docker API, access `http://<IP>:<PORT>/version` or `http://<IP>:<PORT>/images/json` to confirm.
Step 2. Run a script that will exploit the Remote docker API by running a malicious image on it.
Step 3. In this case, `nithinwe45/insecure_image` has an ssh service running on it and has the docker socket exposed.
Step 4. You can access the malicious container by running `ssh -i ~/.ssh/id_rsa root@<IP> -p 22022`
Step 5. Once inside the container, running `docker images` should give you access to images of the host machine.
Step 6. Use `Container Breakout (docker socket expose)` to gain access to the host.
