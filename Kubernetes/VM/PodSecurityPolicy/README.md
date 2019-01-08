# Pod Security Policy

###### There are multiple options that one can use to protect the runtime deployment of a Pod. One of them is the `PodSecurityPolicy`.

###### `PodSecurityPolicy` can be deployed, cluster-wide, namespace-wide or inline as part of the Pod's declaration.

###### We are going to use a combination of `AppArmor` profiles, `Seccomp` and some good container security practices to protect our deployment

###### First let's read the `secure-ngflask-deploy.yml` file, you will see some changes from before:

```
annotations:
    seccomp.security.alpha.kubernetes.io/defaultProfileName:  'docker/default'
    container.apparmor.security.beta.kubernetes.io/secure-vul-flask: 'localhost/k8s-vul-flask-redis-armor'

```

###### These annotations essentially ensure two things.

###### 1. The default docker `seccomp` profile is added to the the Pod.

###### 2. A custom AppArmor Profile that we have prepped for this class, will be applied against a specific container in this case, the flask application.

###### This is our AppArmor Profile:

```
#include <tunables/global>
profile k8s-vul-flask-redis-armor flags=(attach_disconnected,mediate_deleted) {
  #include <abstractions/base>
  file,
  network,
  capability,
  deny /app/** w, #deny file write to /app directory
  deny /tmp/** w, #deny file write to /tmp directory
  deny /etc/passwd rwklx, #deny all access to /etc/passwd
  deny /etc/shadow rwklx, #deny all access to /etc/shadow

  #restrict access to HOME

  audit deny @{HOME}/.* mrwkl,
  audit deny @{HOME}/.*/ rw,
  audit deny @{HOME}/.*/** mrwkl,
  audit deny @{HOME}/bin/ rw,
  audit deny @{HOME}/bin/** mrwkl,
  # @{HOME}/ r,
  # @{HOME}/** rw,
}
```

###### The objective of this profile is not necessarily to block all possible attacks (which is highly difficult/impossible to achieve).

###### The focus is to block off some possible attacks and reduce the damage caused by a compromise of the app or container in any way.

### Let's apply this apparmor profile.


##### Step 1:

* Navigate to the `PodSecurityPolicy` directory.

```bash
cd /home/we45/container_training/Kubernetes/VM/PodSecurityPolicy
```


##### Step 2:

* Run `apparmor_parser k8s-vul-flask-redis-armor` to apply the profile on the local AppArmor instance


##### Step 4:

* Deploy the pod with `kubectl create -f secure-ngflask-deploy.yml`

* Run `kubectl get pods` and make wait till you get the status of `Running` for the Pod


##### Step 5:

* Now run `kubectl exec -it secure-ngflask-redis --container secure-vul-flask -- sh` get a shell environment on the Container running flask

* Try to create a file with `touch shell.py`. Observe the results

* Try to create a file in the `/tmp` directory with `touch /tmp/shell.py`. Observe the results.

* Try and access `/etc/passwd` or `/etc/shadow` with `cat /etc/passwd` or `cat /etc/shadow`

##### Step 6:

* Exit the pod

```bash
exit
```

* Delete the `Pod`

```bash
kubectl delete -f secure-ngflask-deploy.yml
```
