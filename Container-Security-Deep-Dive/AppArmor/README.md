## AppArmor (Application Armor)

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `Labs/4.0.0-Container-Security-Deep-Dive/4.3.0`

    ```commandline
    cd Labs/4.0.0-Container-Security-Deep-Dive/4.3.0
    ```

##### Step 3:

*  **cd** into  `/etc/apparmor.d`

    ```commandline
    cd /etc/apparmor.d
    ```

##### Step 4:

* Run `mkdir containers` to create folder

    ```commandline
    root@we45:/etc/apparmor.d# mkdir containers    
    ```

##### Step 5:

*  **cd** into  `/etc/apparmor.d/containers`

    ```commandline
    cd /etc/apparmor.d/containers
    ```

##### Step 6:

* Run `touch docker_app_armor_config`

    ```commandline
    root@we45:/etc/apparmor.d/containers# touch docker_app_armor_config
    ```

##### Step 7:

* Run  `atom .` to open ataom IDE

##### Step 8:

* Enter configuration details.

```text

```

##### Step 8:

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

