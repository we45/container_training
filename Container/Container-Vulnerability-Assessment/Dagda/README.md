## Dagda



##### Step 1:

* Open terminal

![](img/Open-Terminal.png)

##### Step 2:

* Run `cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda` to cd into a Dagda directory.

```commandline
root@we45:~# cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda
root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda#
```
   
##### Step 3:

* Run `docker run -d -p 27017:27017 -v dagda_db:/data/db --name mongodb mongo` for dagda related requisites.

```commandline
root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda# docker run -d -p 27017:27017 -v dagda_db:/data/db --name mongodb mongo
ca94dab2d52ed092ad7a3bd5f00c73cd8cb6692f271b688068cafac478737bfe
```
    
    **Note:** Wait 25 to 30 seconds to up the dagda database.
    
##### Step 4:

* Set Environment Variables

```commandline
export DAGDA_HOST='127.0.0.1'
export DAGDA_PORT=5000
```

##### Step 5:

* Run `source venv/bin/activate` to activate the virtualenv.

```commandline
root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda# source venv/bin/activate
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda#
```

##### Step 6:

* Run `cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda`, where dagda.py file exists.

```commandline
(venv)root@we45:~# cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda#
```

##### Step 7:

* Run `python3 dagda.py start` to start the dagda server
    
```commandline
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda# python3 dagda.py start
```
  
##### Step 8:

* Open Another Tab and navigate to `/home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/` and set the necessary environment variables

```commandline
export DAGDA_HOST='127.0.0.1'
export DAGDA_PORT=5000
```

```commandline
root@we45:~# cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/
root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda#
```

##### Step 9:

* Run `source venv/bin/activate` to activate the virtualenv.

```commandline
root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda# source venv/bin/activate
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda#
```


##### Step 10:

* Run `cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda`, where dagda.py file exists.

```commandline
(venv)root@we45:~# cd /home/we45/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda#
```


##### Step 11:   

* Run `python3 dagda.py vuln --cve_info CVE-2009-2890`

```commandline
(venv)root@we45:~/container_training/Container/Container-Vulnerability-Assessment/Dagda/dagda/dagda# python3 dagda.py vuln --cve_info CVE-2009-2890
[
    {
        "cveid": "CVE-2009-2890",
        "cvss_access_complexity": "Medium",
        "cvss_access_vector": "Network",
        "cvss_authentication": "None required",
        "cvss_availability_impact": "None",
        "cvss_base": 4.3,
        "cvss_confidentiality_impact": "None",
        "cvss_exploit": 8.6,
        "cvss_impact": 2.9,
        "cvss_integrity_impact": "Partial",
        "cvss_vector": [
            "AV:N",
            "AC:M",
            "Au:N",
            "C:N",
            "I:P",
            "A:N"
        ],
        "cweid": "CWE-79",
        "mod_date": "16-08-2017",
        "pub_date": "20-08-2009",
        "summary": "Cross-site scripting (XSS) vulnerability in results.php in PHP Scripts Now Riddles allows remote attackers to inject arbitrary web script or HTML via the searchquery parameter."
    }
]
```

##### Stop all running docker containers

* Run `clean-docker` to stop all the containers

```commandline
root@we45:~$ clean-docker
```
