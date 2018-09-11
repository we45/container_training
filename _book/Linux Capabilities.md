## Linux Capabilities

Capabilities provide a control on superuser permissions, such that there is no use of running a process as root user.

A normal user can run as a root user, provided a set of capabilities

A fundamental security element in virtualisation systems such as Docker or Linux containers

First appeared in Linux kernel version 2.2

- There are 3 modes of Capabilities
	-  Effective (e)
		- Which means enabled
	- Permitted (p)
		- Which means allowed to use
	- Inherited (i)
		- Which means a child process can inherit the capabilities

- The prefix `+`  means add, `-` means remove

Example:	
	 
- sudo setcap `CAP_NET_RAW+ep` /bin/python
- sudo getcap /bin/python

Docker example

- docker run -it alpine ping -c 1 localhost
	
- docker run --cap-drop=net_raw -it alpine ping -c 1 localhost

- docker run --cap-drop=ALL --cap-add=net_raw -it alpine ping -c 1 localhost