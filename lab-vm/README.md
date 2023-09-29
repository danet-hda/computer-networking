# Lab-VM

Currently, the Lab-VM has two virtual machine providers Vagrant and Packer


The below text is still from the origins of the scripts, i.e., the gosdn project's lab images. 
---

## Vagrant

### What is Vagrant?

- Vagrant is a tool to build a virtual machine based on a single file called Vagrantfile (similar to a Dockerfile). You can manage the virtual machine over Vagrant itself or over VirtualBox.

### Why do we use Vagrant?

- We use Vagrant to simulate the **goSDN-Controller** and the **gNMI-Target** in an virtual environment for education purposes. In addition, it can also be used to quickly set up a virtual test environment. Vagrant will build a virtual machine on the target system. Every target system has to build the virtual machine for itself, but you can avoid transferring a whole virtual machine image over networks or storage systems.

### How do we use Vagrant?

1. Firstly, Vagrant and VirtualBox have to be installed. The installation steps can be found at the [wiki](https://code.fbi.h-da.de/danet/gosdn/-/wikis/Deployment/Virtual-Machine-with-Vagrant) page.
2. After that, you can simply modify the existing Vagrantfile in the directory or create a new one. You can find a detailed documentation for the Vagrantfile at the [Vagrant Documentation Website](https://developer.hashicorp.com/vagrant/docs/vagrantfile).
3. Build the Vagrantfile. With the commands that are listed one the [wiki](https://code.fbi.h-da.de/danet/gosdn/-/wikis/Deployment/Virtual-Machine-with-Vagrant) page you can build and manage the virtual machine. 
4. Connect to the virtual machine over VirtualBox or following command: 
   ```bash
   vagrant ssh
   ```

### How is the vm-with-vagrant folder structured?

```
vm-with-vagrant
└── Vagrantfile (file to build the virtual machine)
```

### How can I use Vagrant?

Take a look at the [wiki](https://code.fbi.h-da.de/danet/gosdn/-/wikis/Deployment/Virtual-Machine-with-Vagrant).

---

## Packer

### What is Packer?

- [Packer](https://developer.hashicorp.com/packer) is an automatic virtual machine image creator.

### Why do we use Packer?

- We use **Packer** to create a virtual machine for use with the **goSDN** controller in education. Using packer has the advantage of building a single virtual machine image once and deploying it for all other users that want to use this image. Therefore, no installation of another tool on the user's system is required, except the software to run a virtual machine.

### How do we use Packer?

- We use a shell script which consists of three steps.
  - The first step is to install the current **Ubuntu Server LTS** release and install the necessary software for building and running **goSDN** and the **gNMI-Target**.
  - After each of the first two steps a VirtualBox Image will be created.
  - In the second step **goSDN** and **gNMI-Target** will be cloned and built for use.
  - In the last step the image of the first step will be deleted, if the second step was successful, to save space and clean up.

### How is the vm-with-packer folder structured?

```
vm-with-packer
├── gosdn_vm.pkr.hcl (Packer builder file with the virtualbox plugin [1])
├── http
│   ├── meta-data (Ubuntu Server Autoinstall config file [2])
│   └── user-data (Ubuntu Server Autoinstall config file [2], currently empty)
├── pipeline.sh (Shell script which containes the commands for building the virtual machine image)
├── scripts
│   ├── gosdn_clone.sh (Shell script, which contains the commands for cloning and building goSDN and the gNMI-Target)
│   └── setup.sh (Shell script, which contains the commands for installing the necessary software for building and running like Docker [3] and containerlab [4])
└── VM
    └── goSDN VM.ova (Virtual machine image, if the script run successfully)
```

### How can I use Packer?

- Take a look at the [wiki](https://code.fbi.h-da.de/danet/gosdn/-/wikis/Deployment/Virtual-Machine-with-Packer).

### ⚠️ Note

If you want to change the password of the user **gosdn** for Ubuntu Server a new one has to be created with the command **mkpasswd -m sha512crypt newpassword** (**newpassword** is a placeholder for the password you want to use). **mkpasswd** is in the **whois** package for Debian/Ubuntu.
Alternatively you can use the command **openssl passwd -6 newpassword** if you can not use **mkpasswd**.

You **can not** set the password in **plaintext** in meta-data!

---

## References

[1] <https://developer.hashicorp.com/packer/plugins/builders/virtualbox/iso>  
[2] <https://ubuntu.com/server/docs/install/autoinstall-reference>  
[3] <https://www.docker.com/>  
[4] <https://containerlab.dev/>
