## Docker Hands-On Part-1

##### Step 1:

* Open Terminal

	![](img/Open-Terminal.png)

##### Step 2:

*  **cd** into  `/home/we45/container_training/Container/Container-Tech-Deep-Dive/Docker-Hands-On`

    ```commandline
    cd /home/we45/container_training/Container/Container-Tech-Deep-Dive/Docker-Hands-On
    ```

##### Step 3:
* Run `docker build -t helloworld:latest .`

```commandline
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Docker-Hands-On# docker build -t helloworld:latest .
Sending build context to Docker daemon  634.4kB
Step 1/11 : FROM ubuntu:latest
 ---> cd6d8154f1e1
Step 2/11 : RUN apt-get update && apt-get install wget -y && wget -qO- https://get.docker.com | sh
 ---> Using cache
 ---> 14b8c8ba9cc8
Step 3/11 : RUN apt install -y ufw python-pip python-dev
 ---> Using cache
 ---> 3bba87b45f98
Step 4/11 : RUN mkdir app
 ---> Using cache
 ---> 2858f8e2d61d
Step 5/11 : COPY helloworld /app/helloworld
 ---> Using cache
 ---> 0683cc00229e
Step 6/11 : ENV TESTENV="test"
 ---> Using cache
 ---> 608c5af4529b
Step 7/11 : WORKDIR /app/helloworld/
 ---> Using cache
 ---> 227050f58568
Step 8/11 : RUN pip install -r requirements.txt
 ---> Using cache
 ---> e5cec67a7664
Step 9/11 : EXPOSE 5000
 ---> Using cache
 ---> 9af9a70ec38a
Step 10/11 : ENTRYPOINT ["python"]
 ---> Using cache
 ---> a641e19825dc
Step 11/11 : CMD ["app.py"]
 ---> Using cache
 ---> f793b943da94
Successfully built f793b943da94
Successfully tagged helloworld:latest
```

##### Step 4:
* Run `docker run -d -p 5000:5000 helloworld:latest` to run the docker container

```commandline
root@we45:~/container_training/Container/Container-Tech-Deep-Dive/Docker-Hands-On# docker run -d -p 5000:5000 helloworld:latest
6bf0b5d8d63117e74225c1fea4163f48029f73adbb247e55ca79419696a1e620
```

##### Step5:
* Open Browser with url `http://localhost:5000/` to check the application running status

![](img/open-app.png)

