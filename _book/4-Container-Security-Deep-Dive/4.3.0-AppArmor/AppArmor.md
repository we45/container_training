##AppArmor (Application Armor) 

* Open terminal

![](../../img/click_terminal.png)

* Type "cd" into "/etc/apparmor.d"

![](../../img/app_armor_cd.png)

* Type mkdir containers (create containers folder)

![](../../img/app_armor_create_container_folder.png)

* Type "cd /etc/apparmor.d/containers"

![](../../img/app_armor_cd_containers_folder.png)

* Create apparmor config file (touch docker_app_armor_config)

![](../../img/app_armor_create_config_file.png)

* Open "docker_app_armor_config" file (mousepad docker_app_armor_config)

![](../../img/app_armor_mousepad.png)

* Enter configuration details (in this case we have disabled the passwd file view and write permission)

![](../../img/app_armor_insert_config_mousepad.png)

* Load file into a kernel using ("apparmor_parser -r -W /etc/apparmor.d/containers/docker_app_armor_config")

![](../../img/app_armor_give_permission.png)

* Run docker using apparmor policy ("docker run --security-opt apparmor:docker_app_armor_config -d -p 5050:5050 abhaybhargav/vul_flask")

![](../../img/app_armor_docker_run_config.png)

* Exec into docker container ("docker exec -it container-id bash")

![](../../img/app_armor_exec_docker_container.png)

* Type "cat /etc/passwd"

![](../../img/app_armor_exec_cat.png)

* You will get an permission denied error

![](../../img/app_armor_permission_denied.png)

