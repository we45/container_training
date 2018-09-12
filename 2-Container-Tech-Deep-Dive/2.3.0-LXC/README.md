# LXC

---

Step 1: To create your first LXC container, run `lxc-create -t download -n my-container`

    Screenshot here
    
Step 2: The download template (`-t` flag in the command above) will give you options to select distribution, version, architecture. Select ubuntu, xenial and amd64 respectively.

    Screenshot here
    
Step 3: Once the download is complete, you can start the container by running `lxc-start -n my-container -d`.

    Screenshot here
    
Step 4: To confirm status of the container, run `lxc-info -n my-container`

    Screenshot here

Step 5: To get shell access to the container, run `lxc-attach -n my-container`.

    Screenshot here
    
Step 6: Commands like `ifconfig -a`, `lsb_release -a`, etc.. can be run inside the container.

    Screenshot here
    
Step 7: To exit from the container, run `exit`

    Screenshot here
    
Step 8: `lxc-stop -n my-container` can be run to stop the container. 

    Screenshot here
    
Step 9: To remove and destroy the container, run `lxc-destroy -n my-container`

    Screenshot here
