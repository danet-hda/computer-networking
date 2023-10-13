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
- [ ] Ask the lab lecturer to check with you if everything is ready to go for the next exercises
- [ ] execute the shell script ````./attach-clab.sh ````
  - [ ] This command starts virtual terminals with the tmux tool allowing you to access the hosts and the router in the lab setup
  - [ ] Checkout the description for tmux [here](tmux-info.md) 
- [ ] If everything is ok you can run ````sudo containerlab destroy  -t clab-rn-0-lab.yml````
  - [ ] This command tears the virtual network down

## Exercise 2: Using the virtualized Lab Environment

Configure IP and Netmask on Host00 and corresponding interface of router00. Find out what the corresponding interface in router00 is and note it down. Run a ping command between the two IPs. Capture the traffic between both entities, i.e., host00 and router00 What are the MAC-Adresses of the used interfaces? 

  


