# 4th Lab in Computer Networks: IP Subnetworks and basic Routing 

This lab has the goal to learn about:
- calculating IP subnetworks
- assigning IP addresses to interfaces
- configuring the routing
- testing of the routing configuration


## Preparation before getting to your Lab Appointment

Please re-use the settings from the 1st lab (0-lab) for this lab setup, i.e., same containerlab file. 

Use one of the private IP addresses ranges for the tasks here:
- Calculate two IP subnetworks that can hold only 2 IP addresses but no further IP addresses to be assigned to interfaces

## Tasks for the Lab Appointment

### "Preflight" preparations 
Configure the interface e1-1 on **host00** and **router00**:
- **host00**: the IP address to ```10.1.1.1``` and the netmask to ```255.255.255.0```
- **router00**: the IP address to ```10.1.1.254``` and the netmask to ```255.255.255.0```

Please check that these interfaces do have an IPv6 address automatically configured, i.e., an IP address is labelled as ```inet6```:
- **host01**/e1-1
- **router00**/e1-2


### The Tasks for the on-site Lab

Record the network traffic with the ```tcpdump``` program between:
- for **host00** and **router00**: please record on **router00** interface e1-1 
- for **host01** and **router00**: please record on **router00** interface e1-2

Please do the recording not from within the containers, but from within the virtual machine!

#### IPv4 / ARP

For ARP please do the following steps, while capturing the network traffic:
- ensure that the ARP cache is empty **host00**
- On **host00** run ```ping 10.1.1.1```
- On **host00** run ```ping 10.1.1.254```
- Note now the content of the ARP cache
- Stop capturing
- Safe the file with the recording of the network traffic, so that you can use it later on for the lab report
- You can see, if you can open the file in wireshark, just to be sure that you have a captured.

### IPv6 / NDP

For IP6 you do not need to manually configure IPv6 addresses, if you want to communicate with a node on the same link. IPv6 introduced the so-called link local IPv6 addresses. These addresses are automatically created when an interface is IPv6-enabled. 

Please find out these IPv6 addresses for **router00's** e1-2 and **host01's** e1-1. 

Follow these steps, while ensuring that you are capturing the network traffic between **router00** and **host01**:
- ensure that the NDP cache is empty at **host01**
- On **host01** run ```ping6 <link-local-inet6-address-of-host01-e1-1>%e1-1```
- On **host01** run ```ping6 <link-local-inet6-address-of-router00-e1-2>%e1-1```
- Note now the content of the NDP cache
- Stop capturing
- Safe the file with the recording of the network traffic, so that you can use it later on for the lab report
- You can see, if you can open the file in wireshark, just to be sure that you have a working capture file.

## Lab Report to be written

Before writing the report read the [notes](NotesLabReport.md) carefully and take them into considerations for your own report!

**The submission date for the report will be given in the moodle course!**

The report must be written as a simplified scientific report and addressing these points:
- Describe the setting of the system you are measuring, i.e., with text and a graphic showing the components involved in the measurement.
- Describe what is needed to be abe to understand your lab experiment, e.g., which tools are being used, what measurements are being done and how.
- Show you meausrement results as network flow diagram (as explained in the lecture) for each, ARP and NDP.
- Discuss one major difference between ARP and NDP on the **link-layer**!
- Document any of your questions or open issues.


## Good to Know

### ```tcpdump```

Please read the containerlab [article](https://containerlab.dev/manual/wireshark/) for how to use tcpdump with containerlab.
In order to write the recorded network traffic to a file, use ```tcpdump``` with the option ```-w <file-name> ```, e.g., ```tcpdump <otheroptions> -w <file-name>```. 

### ```arp``` command

One can use the ```arp``` command to see the ARP-cache of a specific host. Please use ```arp -na``` for this lab exercise. You can also use the ``` ip -4 neighbor show``` command.

To clear the ARP cache use this: ```ip -4 -s -s neigh flush all```

### ```ndp``` command

One can use the ```ip``` command to see the NDP-cache of a specific host. 
Please use:
- ```ip -6 neighbor show``` to display the current NDP cache
- ```ip -6 -s -s neigh flush all``` to clear the NDP cache
