# 1st Lab in Computer Networks

This lab has the goal to install the work environment and to get a first hands-on experience for the lab. 

## Prerequisites

Please check if your personal computer:
- [ ] is an Intel or AMD 64-bit computer
- [ ] has at least 2 cores
- [ ] has at least 8 GB of RAM
- [ ] has space for 15 GB virutal disk on your disk

*In case this is not the case, please contact your lecturer well before your lab appointment!*

# Preparation Tasks to Do before getting to the Lab

- [ ] Please [download](https://cloud.h-da.de/s/7RxyR9jWDxJD7xS) the virtual machine ````ws234-rechnernetze-v01.ova```` for the lab before coming to your particular lab appointment!
- [ ] Install the [latest version](https://www.virtualbox.org/) (by now 7.0.10) form virtualbox.org and follow the installation instructions to install virtualbox on your computer.
- [ ] Import the ````ws234-rechnernetze-v01.ova```` virtual machine to virtualbox
- [ ] Start the virtual machine
- [ ] Check if it is successfully started by trying to login into the **lab-vm** (username is ````networks```` and password is ````rn2023````) from your preferred command line with this command ````ssh networks@127.0.0.1 -p 2222````
- [ ] stay logged into the **lab-vm** and
  - [ ] clone the git repository for this lab with this command ````git clone https://github.com/danet-hda/computer-networking.git ````
  - [ ] switch to the branch for this semester **23-24-wintersemester** with this command ````git checkout 23-24-wintersemester````
- [ ] check if you have these files in the directory **computer-networking/0-lab** just cloned
  - [ ] 0-LabTasks.md (this is the text you are currently using)
  - [ ] attach-clab.sh
  - [ ] clab-rn-0-lab.yml
     
# Tasks for the Lab Appointment

First of all, please bring your latop to the lab. If your laptop is not suitable or you do not have a laptop, please bring your access information for your virtual machine along with you. 

## Excercise 1: Getting Started

- [ ] Boot the virtual machine, login to it, and change to the **0-lab** directory
- [ ] start the containerlab environment with this command ````sudo containerlab deploy -t clab-rn-0-lab.yml```` and see if it as started without any error
  - [ ] This command deploys the virtual network with containerlab
  - [ ] The *lab-name* paramter of ```-t <lab-name>``` denotes which containerlab topology should be loaded and deployed. 
- [ ] Ask the lab lecturer to check with you if everything is ready to go for the next exercises
- [ ] execute the shell script ````./attach-clab.sh ````
  - [ ] This command starts virtual terminals with the tmux tool allowing you to access the hosts and the router in the lab setup
  - [ ] Checkout the description for tmux [here](tmux-info.md) 
- [ ] the ````./attach-clab.sh ```` script start 4 virtual terminals, so called panes, in your shell.
  - [ ] upper left: the pane for *host00*
  - [ ] lower left: the pane for *host01*
  - [ ] upper right: the pane for *router00*
  - [ ] lower right: this pane is ready to be used but not attached to any container, but your plain command line
- [ ] If everything is ok you can run ````sudo containerlab destroy  -t clab-rn-0-lab.yml````
  - [ ] This command tears the virtual network down
     
***Good to know***:
All data, including any configuration, you have made in the containerlab containers, e.g., host00, host01, router00, will be deleted once you run ````sudo containerlab destroy```. 

## Exercise 2: Using the virtualized Lab Environment

In this exercise you will configure your first IP addresses to your setup and run a simple test to see if everything is configured correctly. Please check that your containerlab setting from exercise 1 is up and running. Use the ````./attach-clab.sh ```` to get to the shell prompts of the containerlab setting. 

You will use the ```ifconfig``` command to configure the IP address:  ```ifconfig <interfacename> <ip-address> netmask <netmask>```. 

First of all, determine the interfaces available in *host00* and *router00* by listing all interfaces with this command ```ifconfig```. You will see at least these interfaces:
- e1-1
- eth0
- l0

For each of the interfaces not the following information:
- *Link encap*
- *HWaddr*
- *inet addr*

Configure the interface e1-1 on:
- host00: the IP address to ```10.1.1.1``` and the netmask to ```255.255.255.0```
- router00: the IP address to ```10.1.1.254``` and the netmask to ```255.255.255.0```
- host01: do not configure anything here.

Check if you did the configuration correctly by using the ```ping <ip-address>``` command on *host00*:
- ```ping 10.1.1.1```
- ```ping 10.1.1.254```

  


