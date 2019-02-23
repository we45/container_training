# Network Namespace


##### Step 1:

*  Get the list of network interfaces on the machine.

```bash
ifconfig -a
```


##### Step 2:

* Get the iptables info.

```bash
iptables -L
```


##### Step 3:

* Get the default network gateways.

```bash
route -n
```


##### Step 4:

* Add a Networking Namespace.

```
ip netns add NetNameSpace
```


##### Step 5:

* Get the list of Network Namespaces

```bash
ip netns list
```


##### Step 6:

* Exec into the Network Namespace and get the list of network interfaces on the 'NetNameSpace' Network Namespace.

```bash
sudo ip netns exec NetNameSpace bash

ifconfig -a
```


##### Step 7:

* Verify that there is no iptables available, since this is a new networking stack.

```bash
iptables -L
```

* Verify that there is no default gateway, inside a new container.

```bash
route -n
```


##### Step 8:

* Exit from the Network Namespace.

```bash
exit 
```


##### Step 9:

* Run  `ip netns list` to verify the Network Namespace and delete it

```bash
ip netns list

sudo ip netns del NetNameSpace
```
