# Network Namespace

---

Step 1: Run `ifconfig -a` to get the list of network interfaces on the machine.

        ScreenShot Here

Step 2: To add a Networking Namespace, run `ip netns add NetNameSpace`

        ScreenShot Here
        
Step 3: Run `ip netns list` to get the list of Network Namespaces

        ScreenShot Here
        
Step 4: Run `sudo ip netns exec NetNameSpace bash` to exec into the Network Namespace.

        ScreenShot Here
        
Step 5: Run `ifconfig -a` to get the list of network interfaces on the 'NetNameSpace' Network Namespace.
        
                ScreenShot Here
                
Step 6: Run `route -n` and `iptables -L` to verify that there is no routing or iptables available, since this is a new networking stack.

        Screenshot Here
        
Step 7: Run `exit` to exit from the Network Namespace and `ip netns list` to verify.

        ScreenShot here
        
Step 8: To delete the Network Namespce, run `sudo ip netns del NetNameSpace`

        Screenshot here
