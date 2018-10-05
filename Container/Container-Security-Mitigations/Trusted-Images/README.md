## Trusted Images

##### Step 1:

* Create a new Docker Hub repository  `https://hub.docker.com/`

    ![Dockerhub](img/docker-hub.png)
    

##### Step 2:

* Open Terminal

    ![Terminal](img/Open-Terminal.png)
    
   
##### Step 3:

* Run `docker login`

    ```commandline
    docker login
    Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
    Username: <username>
    Password: <password>
    Login Succeeded
    ```
    
##### Step 4:

* Create a tag for alpine image using your Docker Hub username(namespace)

    ````commandline
    docker tag alpine <username>/distrust:latest
    ````

##### Step 5:

* Push the image to Docker Hub

    ````commandline
    docker push <username>/distrust:latest
    ````
    
##### Step 6:

* Open Docker Hub `https://hub.docker.com/` in your browser

##### Step 7:

* Enable Content Trust

* Run `export DOCKER_CONTENT_TRUST=1` in terminal

    ```commandline
    export DOCKER_CONTENT_TRUST=1
    ```

##### Step 8:

* Run `docker pull <username>/distrust:latest` to pull the docker iage from the Docker Hub Repository.

    ```commandline
    docker pull <username>/distrust:latest
    Using default tag: latest
    No valid trust data for latest
    ```
    
    
##### Step 9:

* Create a tag for alpine image using your Docker Hub username(namespace)

    ````commandline
    docker tag alpine <username>/trust:latest
    ````

##### Step 10:

* Push the image to Docker Hub

    ````commandline
    docker push <username>/trust:latest
    ````
    
##### Step 11:

* Open Docker Hub `https://hub.docker.com/` in your browser


##### Step 12:

* Run `docker pull <username>/trust:latest` to pull the docker iage from the Docker Hub Repository.

    ```commandline
    docker pull <username>/trust:latest
    Using default tag: latest
    latest: Pulling from tilakt/dctrust
    Digest: sha256:5e8e0509e829bb8f990249135a36e81a3ecbe94294e7a185cc14616e5fad96bd
    Status: Image is up to date for <username>/trust:latest
    ```
    
 
 ##### Step 13:
 
 * Run `clean-docker` to stop all containers.  

    ```commandline
    (venv)root@we45: clean-docker
    92200af86b18
    ca94dab2d52e
    92200af86b18
    34c4adcf326d
    86cd73d03ef1
    ca94dab2d52e
    "docker rmi" requires at least 1 argument.
    See 'docker rmi --help'.
    
    Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]
    
    Remove one or more images
    
    ```
