# 2nd Lab in Computer Networks: UDP Sockets

This lab has the goal to program an application that exchanges data over UDP datagrams. For this one end will take the role of the client and the other the role of the server. 

## Preparation before getting to your Lab Appointment

Please re-use the settings from the 1st lab (0-lab) for this lab setup, i.e., same containerlab file und also the same IP adress configuration *host00* and *router00*. 

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

You write an application where the server constantly computes the result of this function $f(t) = sin(2 \pi t)$

## Further Tasks to be completed before the Lab Appointment

Answer these questions
- Name at least one example of a client server application you are using in the Internet. Try to explain your answer.
- Can the server contact the client without a request from the client? Explain your answer.
- Imagine a web server that is service clients, i.e., web browsers on other computers, with information from a database. The database is located on a different server. What role takes the web server application when it is asking the database server for information? 


