# 2nd Lab in Computer Networks: UDP Sockets

This lab has the goal to program an application that exchanges data over UDP datagrams. For this one end will take the role of the client and the other the role of the server. 

## Preparation before getting to your Lab Appointment

Please re-use the settings from the 1st lab (0-lab) for this lab setup, i.e., same containerlab file und also the same IP address configuration *host00* and *router00*. 

### The Programing Language and Environment
Pick one programming language of your choice, but check:
- if there is a socket application programming interface (API) available
- that this API offers the functions shown and discussed in the lecture, e.g., ````socket()````, ````read()````
- that you either compile this program outside the docker containers, e.g., on a linux system such as the virtual machine
- and that anything that is required to compile the program is actual setup correctly.

In case you need help or have questions, please feel free to ask. A tip: typically each programming language has installations procedures documented on their web page or in their documentation. For instance, for the *go* language you can find it [here](https://go.dev/doc/install).

Further, in order to improve this lab task for further students, you may propose good links to documentation for installing programing languages (or their tools)

For your development environment: Use the one you are used to or select one. 

You can use a relative simple environment and upload the compiled code via scp into the docker containers in the containerlab. 

### Programming

You will need to start the programming before getting to the lab appointment. In the best case, you are done with programming and you can present your running program. However, in case you are stuck or you find an error that you cannot fix on your own, i.e., including looking for solutions in books, search engines etc, you can ask for guidance in the lab exercise. 

### Tasks to be completed before the Lab Appointment

Answer these questions 
- Name at least one example of a client server application you are using in the Internet. Try to explain your answer.
- Can the server contact the client without a request from the client? Explain your answer.
- Imagine a web server that is serving clients, i.e., web browsers, on other computers, with information from a database. The database is located on a different server. What role takes the web server application when it is asking the database server for information?

## Client Server Principle

There are different communication patterns used in data networks. The most prevailing one is the so-called *client server principle*:

- one entity is the *server*: it offers some kind of service, e.g., computing the results of a mathematical function, that can be asked for.
- Asking a server is done by:
  -  sending a request to the server,
  -  the server processing the requests, e.g., computing the result of a mathematical function,
  -  and the server sending back the result in a response (sometimes also named reply).
- the entity sending requests is the *client*: it needs a service offered by the server and is asking the server by sending a request to the server and waiting for the response.

You will implement and run a client server application that exchanges the data over the network by means of the User Datagram Protocol (UDP). 

## Your UDP Client Server Application

You write an application where the server constantly computes the result of this function $f(t) = sin(2 \pi t)$, whereas $t$ is the time in seconds. The client can send a request and the server will receive this request at $t_0$. The server will return the result of $f(t_0)$ to the client and wait for further requests. The client will print the time and the received result as text output. 

The server must print always this information:
- the time and client socket for which a request has been received
- the time $t_0$ and $f(t_0)$ that will be sent back to the client
- the time when the response was sent back to the client

### Server Settings

Typically one has to specify these parameters when creating a socket and binding the socket to a specific IP address and port number:
- the address family to be used: use AF_INET (not AF_INET6!). This stands for Internet Protocol Version 4.
- transport protocol: UDP (sometimes this called differently, please read carefully)
- IPv4 address to bind to: 0.0.0.0 (that is the any IPv4 address (INADDR_ANY ), if you are good to take whatever address or addresses are available)
- UDP port number: use the port number 55055

**Placement of the server**: please "install" the server part on **router00**. 

### Client Settings

Use the same settings as for the server, except that you set the UDP port number to the value of 0 (zero). Selecting the port number of 0 instructs the operating system to use some available port number, i.e., a one that is not already used by another process. 

**Placement of the client**: please "install" the client part on **host00**. 

## Tasks for the Lab Appointment

Note: you can test these of course already before getting to the lab!

Questions to be answered before running the next steps:
- Can the client reach the server generally? This can be tested by sending a ping from **host00** to **router00**.
- Is the server started and is it running without any error message?
- What is the socket address of the server?
- How can the client know and use the socket address of the server?
- Can you start the client without any error message?

Further questions to be answered: 
- Try to start two instances of your server. Will the second instance start without an error? Document what you will find.
- How often has the client to request $f(t)$ form the server to get all values computed over the course of the time? Of course, only form the first time when the client starts requesting the results from the server. Justify your answer. 
- Can the client know to have received all computed results?
- What is missing in the task description, but is actually needed for the implementation and the exchange of data between client and server?
- Could two persons, with this information given here, that cannot talk to each other implement a working client server application with this information here? 

## Good to Know

Testing of software that requires a network connection can be a hassle, as you are not only testing the application's code but also the communication across a potentially unreliable network. In order to simplify the network part, you can test on a single host, i.e., both client and server are running as instance on the same computer. 

You can use the so-called node-local network interface, also called local loopback interface, e.g., sometimes the interfaces are called ````lo0```` or ````lo````, with the local IP address of 127.0.0.1. 


