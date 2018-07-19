##rkt Containers

- Can run easily on Linux
- Can run easlily on Mac/Windows with the help of VM's
	- Usually built and run on vagrant boxes

- sudo apt-get install rkt -y
- Images can be created using `acbuild` command
- Reference link to build acbuild command
	- https://github.com/containers/build
		- Clone the git repo 
			- git clone https://github.com/containers/build acbuild
		- build it locally
		- set acbuild var    	
- Containers can be created using `.acifile`
	- Ex:

> 		acbuild begin
> 		acbuild set-name testcontainer
> 		acbuild set-exec echo 'Hello Rocket!!!'
> 		acbuild write testcontainer.aci
> 		acbuild end

- rkt --insecure-options=image run testcontainer.aci
