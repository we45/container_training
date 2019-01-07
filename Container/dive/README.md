## Exploring docker image and layer contents with dive


##### Step 1:

* Open Terminal

![](img/Open-Terminal.png)


##### Step 2:

* Pull the `dive` docker image by running `docker pull wagoodman/dive`


##### Step 3:

* Select a docker image to explore and run `docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest dive abhaybhargav/vul_flask:latest`

