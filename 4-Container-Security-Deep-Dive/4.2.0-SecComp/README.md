#Seccomp (secure computing mode) 

---

* Open terminal

![](../../img/click_terminal.png)

* Create "sec_comp_policy.json" file 

![](../../img/create_sec_comp_policy.png)

* Open "sec_comp_policy.json" file

![](../../img/sec_comp_mouse_pad_create.png)

* Create a policy (commands shouldn't allow "example:mkdir (create folder)" ) 

![](../../img/sec_comp_config.png) 

* Once saved the configuration run docker using ("docker run -d --security-opt seccomp:﻿sec_comp_policy.json -p 5050:5050 abhaybhargav/vul_flask")

![](../../img/run_sec_comp_docker.png)

* Exec into docker container ("docker exec -it container-id bash")

![](../../img/sec_comp_docker_exec.png)

* Try create folder using ("mkdir demo")

![](../../img/sec_comp_create_folder.png)

* You will get an permission denied error

![](../../img/sec_comp_permission_denied.png)


