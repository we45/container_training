## OSQuery for Docker Security Monitoring

#### Install OSQuery on your VM
* `wget https://pkg.osquery.io/deb/osquery_3.3.2_1.linux.amd64.deb`
* `dpkg -i osquery_3.3.2_1.linux.amd64.deb`

#### Examples of what we'll look for
* Containers running with `--privileged` flag
* Containers running dangerous volume mounts
* Containers with dangerous environment variables
* Containers consuming excessive resources
* Containers running without security_opts

### Setup
* Run `tmux`
* Run `ctrl + b + "` to split horizontally
* goto top pane with `ctrl + b + (upper arrow key)`, opposite to access lower pane

### Privileged Containers
* In the upper pane, type
* Run Container in privileged mode: `docker run -d --privileged nginx:latest`
* goto lower pane
* Start OSquery Interactive Interface: `osqueryi`
* In the osqueryi interface, enter: 

```sql
SELECT name, image, status from docker_containers where privileged=1;
```

### Containers with Sensitive Env-Vars
* In the upper pane, type: `docker run -it -e MYSQL_PASSWORD=helloworld -v /etc:/hostFS alpine sh`
* In the lower pane with the `osqueryi` still running, type: 
```sql
select name,env_variables FROM docker_containers where env_variables LIKE "%PASSWORD%";
```

### Containers with Dangerous Volume Mounts
* In the lower pane, run:

```sql
select id, source, destination from docker_container_mounts where source LIKE "%etc%";
```

### Containers running without `security_opts`
* In the lower pane, run: 

```sql
SELECT name, image, state 
FROM docker_containers 
WHERE security_options NOT LIKE "%apparmor%";
```

### Examine users with access to Docker Daemon
```sql
SELECT u.username 
FROM user_groups ug 
LEFT JOIN users u ON u.uid=ug.uid  
WHERE ug.gid IN (SELECT gid FROM groups WHERE groupname="docker");
```

### Get Memory limits and usage per container
```sql
select ds.name, ds.memory_usage, ds.memory_limit from docker_container_stats ds, docker_containers dc where dc.id=ds.id;
```