##Network Namespace 

* Open terminal

    ![](img/click_terminal.png)

* Run docker container without network 
    * `docker run -d --name vul_flask_one --network none abhaybhargav/vul_flask`
    
    ![](img/network_name_space/step1.png)
 
* Docker exec into the container

    * ``docker exec vul_flask_one ip a``
    
    ![](img/network_name_space/docker_exec_ip_a.png)
   
* Create Network Namespace directory for docker network

    * ``mkdir /var/run/netns``
    
    ![](img/network_name_space/create_netns_dir.png)
    
* Create Separate Network for docker
    * ``ip link add docker_network type veth
``

    ![](img/network_name_space/docker_network_create_veth.png)
    
    
* Show All veth networks
    ``ip link show type veth``
    
    ![](img/network_name_space/show_veth.png)


* Get docker container PID
    * ``pid_one="$(docker inspect --format '{{.State.Pid}}' vul_flask_one)"
``
    
    ![](img/network_name_space/get_pid_of_container.png)
    
* Assigning created network namespace into container using symlink
    * ``ln -s /proc/$pid_one/ns/net /var/run/netns/vul_flask_one``
    
    ![](img/network_name_space/symlink_between_docker_main_network.png)
    

* Add created docker_network (veth) into docker container
    * ``ip link set docker_network netns vul_flask_one
``
    
    ![](img/network_name_space/assign_veth_to_docker.png)
    
    
* Assign IP into the docker container via docker_network (veth)
    * ``ip netns exec vul_flask_one ifconfig docker_network 192.168.1.1/24``
    
    ![](img/network_name_space/assign_ip_to_network.png)
    
 * Check IP asiigned it into docker container
    * ``docker exec vul_flask_one ip a``
    
     ![](img/network_name_space/assigned_network_with_ip.png)
     
 
 * Ping from the Host system
    * ``ping 192.168.1.1``
    
    ![](img/network_name_space/ping_ip.png)
 
 
     