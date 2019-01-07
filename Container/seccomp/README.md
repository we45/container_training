## SECCOMP Profiles for Docker Containers

* cd into <directory> with `cd <directory>`

* Run `docker run -it --rm --security-opt seccomp:custom_profile.json alpine chmod 400 /etc/hostname`

* Observe the results