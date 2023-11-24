# 3rd Lab in Computer Networks: Mapping IPv4 and IPv6 Addresses to Link Layer Addresses

This lab has the goal to learn about the mechanisms and protocols that are used to map Internet Protocol (IP) addresses to link Layer addresses. For IP there are two different version in use by today:
- Internet Protocol Version 4 (IPv4)
- Internet Protocol Version 6 (IPv6)

Both use a different protocol above the link layer address for
- IPv4 is the Adress Resolution Protocol (ARP)
- IPv6 is the Neighbor Discovery Protocol (NDP)

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




## Good to Know

