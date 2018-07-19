##Mount Namespace Isolation
* Open terminal

![](img/click_terminal.png)

* Run docker image (﻿docker run -it busybox)

![](img/run_docker.png)

* Type **ls** command in the terminal

![](img/ls_command.png)

* Open New Terminal in the host system

![](img/click_terminal.png)

* Type **findmnt** command in the terminal

![](img/findmnt.png)

* Copy the docker overlay path

![](img/copy_mnt_path.png)

* Type **cd** and paste the docker overlay path

![](img/cd_docker_overlay_path.png) 

* Type **ls** command in the terminal

![](img/overlay_ls.png)

* Create file using touch command (touch malicious.txt) in the host system terminal

![](img/create_file.png)

* Type **ls** command in the terminal

![](img/file_created.png)

* Now Open Docker exec terminal and type **ls**

![](img/docker_inside_file.png)

* Delete malicious.txt file inside docker exec

![](img/delete_file.png)

* Type **ls** command in the terminal

![](img/ls_command.png)

* Open host terminal and type **ls** inside docker overlay path

![](img/overlay_ls.png)


