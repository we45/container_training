# LXC Containers
- Can run easily on Linux
- Can run on Mac or Windows with the help of VM's
	- Mac and Windows doesn't support Namespaces or Containerization


## Installation
- sudo apt-get install -y lxc

## Cheatsheet
- Create a container
	- lxc-create -t download -n `container_name`

- Start a container
	- lxc-start -n `container_name` -d

- Stop a container
	- lxc-stop -n `container_name`

- List containers
	- lxc-ls -f

- Get container info
	- lxc-info -n `container_name`

- Destroy container
	- lxc-destroy -n `container_name`

- Create a new user on machine and set password
	- lxc-attach -n `container_name`
		- Now you are inside the container
			- adduser `username`
				- Now you are prompted for password setup


## Setup
Change password path

- /var/lib/lxc/<container-name>/rootfs/etc/passwd

## Painpoints
- Mount is not easy

## Docker comparison
- Doesn't have a docker file like build util
	- Have to depend on 3rd party libs like
		- nut
		- lxdfile

		
## Container Expectations
- Mount volume
- Port Forwarding
- Environment variable setup
- Build from file
- Specify start point
- Run as user
- Create a network
- Assign a network
- Specify memory limits
- Export to formats
- Copy file from/to container
 

