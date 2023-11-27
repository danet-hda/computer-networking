# 3rd Lab in Computer Networks: Mapping IPv4 and IPv6 Addresses to Link Layer Addresses

This lab has the goal to learn about the mechanisms and protocols that are used to map Internet Protocol (IP) addresses to link Layer addresses. For IP there are two different version in use by today:
- Internet Protocol Version 4 (IPv4)
- Internet Protocol Version 6 (IPv6)

Both use a different protocol above the link layer address for
- IPv4 is the Adress Resolution Protocol (ARP)
- IPv6 is the Neighbor Discovery Protocol (NDP)

You will need to read before the lab, but no other preparation is required. 

The lab itself consists out of:
- the measurement part on-site
- and a written report -- details below.

## Preparation before getting to your Lab Appointment

Please re-use the settings from the 1st lab (0-lab) for this lab setup, i.e., same containerlab file. 

One task will be the recording of the network traffic between two nodes. This is typically done, either with the tcpdump oder the wireshark tools. tcpdump is available by default on most Unix systems (e.g., Linux or FreeBSD), while wireshark is a graphical tool that has to be installed. 

Read as preparation:
- about how to capture the network traffic in a containerlab setting this article: https://containerlab.dev/manual/wireshark/
- how the IPv6 Neighbor Discovery Protocol (NDP) works  

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
- **host00** und **router00** auf: bitte an **router00** Schnittstelle e1-1 
- **host01** und **router00** auf: bitte an **router00** Schnittstelle e1-2

Please do the recording not from within the containers, but from the within the virtual machine!

#### IPv4 / ARP

For ARP please do the following steps, while capturing the network traffic:
- ensure that the ARP cache is empty **host00**
- On **host00** run ```ping 10.1.1.1```
- On **host00** run ```ping 10.1.1.254```
- Note now he content of the ARP cache
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
- Note now he content of the NDP cache
- Stop capturing
- Safe the file with the recording of the network traffic, so that you can use it later on for the lab report
- You can see, if you can open the file in wireshark, just to be sure that you have a captured.

## Good to Know

### tcpdump

Please read the containerlab [article](https://containerlab.dev/manual/wireshark/) for how to use tcpdump with containerlab.
In order to write the recorded network traffic to a file, use ```tcpdump``` with the option ```-w <file-name> ```, e.g., ```tcpdump <otheroptions> -w <file-name>```. 

### arp command

One can use the ```arp``` command to see the ARP-cache of a specific host. Please use ```arp -na``` for this lab exercise. You can also use the ``` ip -4 neighbor show```command.

To clear the ARP cache use this: ```ip -4 -s -s neigh flush all```

### ndp command

One can use the ```ip``` command to see the NDP-cache of a specific host. 
Please use:
- ```ip -6 neighbor show`` to display the current NDP cache
- ```ip -6 -s -s neigh flush all`` to clear the NDP cache
