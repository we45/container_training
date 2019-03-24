## Trusted Images


##### Step 1:

* Register/Login on [DockerHub](https://hub.docker.com/)

```bash
https://hub.docker.com/
```

![Dockerhub](img/docker-hub.png)


* On the server provisioned, login with DockerHub credentials

```bash
docker login
```


##### Step 2:

* Tag an `alpine` image using DockerHub username

````bash
docker tag alpine <username>/untrusted:latest
````

* Push the `<username>/untrusted:latest` image to DockerHub

```bash
docker push <username>/untrusted:latest
```


##### Step 3:

* Enable [Content Trust](https://docs.docker.com/engine/security/trust/content_trust/) on the server provisioned

```bash
export DOCKER_CONTENT_TRUST=1
```

* Try to pull the `<username>/untrusted:latest` image from DockerHub and observe the results

```bash
docker pull <username>/untrusted:latest
```


##### Step 4:

* With `Content Trust` enabled, tag an `alpine` image using DockerHub username

````bash
docker tag alpine <username>/trusted:latest
````

* Push the `<username>/trusted:latest` image to DockerHub

```bash
docker push <username>/trusted:latest
```

###### * Note: You will be prompted to create a new root signing key passphrase. 


##### Step 5:

* Pull the `<username>/trusted:latest` image from DockerHub Repository.

```bash
docker pull <username>/trusted:latest
```

* It can be observed that only signed images can be pulled.

###### * Note: Check `~/.docker/trust/private` for private keys


##### Step 6:

* Inspect the `untrusted` and `trusted` docker images

```bash
docker trust inspect <username>/untrusted:latest

docker trust inspect <username>/trusted:latest
```


##### Step 7:

* Disable `Content Trust` to pull images for other exercises

```bash
export DOCKER_CONTENT_TRUST=0
```

* Run `clean-docker` to stop all containers.  
