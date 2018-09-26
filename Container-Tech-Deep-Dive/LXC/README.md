## LXC


Step 1: To create your first LXC container, run `lxc-create -t download -n my-container`

![](img/lxc-1.png)

    
Step 2: The download template (`-t` flag in the command above) will give you options to select distribution, version, architecture. Select ubuntu, xenial and amd64 respectively.

![](img/lxc-2.png)

    
Step 3: Once the download is complete, you can start the container by running `lxc-start -n my-container -d`. To confirm status of the container, run `lxc-info -n my-container`

![](img/lxc-3.png)


Step 4: To get shell access to the container, run `lxc-attach -n my-container`.

![](img/lxc-4.png)

    
Step 5: Commands like `ifconfig -a`, `lsb_release -a`, etc.. can be run inside the container.

![](img/lxc-5.png)

    
Step 6: To exit from the container, run `exit`. Stop the container by running `lxc-stop -n my-container` 

![](img/lxc-6.png)

    
Step 7: To remove and destroy the container, run `lxc-destroy -n my-container`

![](img/lxc-7.png)
