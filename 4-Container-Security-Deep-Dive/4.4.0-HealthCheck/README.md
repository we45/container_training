#HealthCheck

--- 

* Open Atom Editor
    
    ![](img/Open-Atom.png)

* Go to 4.0.0-Container-Security-Deep-Dive --> 4.4.0  --> Vulnerable-Flask-App
    -- > Open Dockerfile --> Insert the command before CMD ---> Save
    * `HEALTHCHECK CMD curl --fail http://localhost:5050 || exit 1`
    
    ![](img/add-health-check-dockerfile.png)
    
* Open terminal

![](img/Open-Terminal.png)

* cd  into the Lab Excise directory
    * `Labs/4.0.0-Container-Security-Deep-Dive/4.4.0/Vulnerable-Flask-App`
    
    ![](img/cd.png)
    
  
* Build docker using updated Dockerfile
    * `docker build -t abhaybhargav/vul_flask:healthcheck .`
    
    ![](img/build-healthcheck.png)
    
* Run a docker container
    * `docker run -d --name healthcheck -p 5050:5050 abhaybhargav/vul_flask:healthcheck`
    
    ![](img/run-container.png)
    
 * Inspect a running container
    * `docker inspect --format='{{json . State.Health}}' healthcheck`
    ![](img/run-containers.png)
