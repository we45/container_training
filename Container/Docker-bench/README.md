## Dockerbench

###### Docker-bench checks for common best-practices inspired from Docker-CIS-Benchmark when deploying docker containers in production. (https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_Community_Edition_Benchmark_v1.1.0.pdf) 

* SSH into your Virtual Lab or open Terminal, if you're on the VM

* Navigate to Docker-bench Lab Folder

```commandline
cd /root/labs/container_training/Container/Docker-bench
```

* Run docker bench command

```commandline
docker run -it --net host --pid host --userns host --cap-add audit_control -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST -v /var/lib:/var/lib -v /var/run/docker.sock:/var/run/docker.sock -v /usr/lib/systemd:/usr/lib/systemd -v /etc:/etc --label docker_bench_security docker/docker-bench-security
```

![](img/cmd.png)

* Run `clean-docker` to stop all the containers