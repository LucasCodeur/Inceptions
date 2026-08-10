*This project has been created as part of the 42 curriculum by lud-adam.*
# Description

This **project** consists of having you set up a s**mall infrastructure** composed of different **services**:
* Wordpress/PHP (CMS)
* MariaDB (Database)
* Nginx (Web server)

The whole **project** has to be done in a **virtual machine** and use **docker-compose**.
The purpose of this project is to become familiar with **Docker** and enhance our skills in **system administration**.

##  1. Virtual Machines vs Docker

### What is Docker?
**Docker** provides the **ability** to **package** and run an **application** in a loosely isolated environment called a **container**. The isolation and security let you run many containers simultaneously on a given host.
**Containers** are **lightweight** and **contain** everything **needed** to **run** the **application**, so you don't need to rely on what's installed on the host.

### What is a Virtual Machine?
A **virtual machine** allows the **emulation** of a **computer system**. **Virtual machines** are based on computer architectures and **provide** the **functionality** of a **physical computer**.
A **hypervisor** is software that **isolates** computing **resources** and **enables** the **creation** and **management** of **virtual machines** (VMs)
. The **hypervisor** treats compute resources such as **CPUs**, **memory**, and **storage** as a **pool of resources** that can easily be **relocated** between existing **guest** or to new **VMs**. 
Consequently, you have on a virtual environment an OS like you would have on a physical machine.
One of the biggest advantages it is the interoperability between different machine, once defined you can use your OS on different computers.
**VMs** provide some **security** advantages because the **environment** is **isolated** from the **rest of a system**.

### What's the difference between Docker and VMs?

| Docker | Virtual Machine |
|---|---|
| Shares the host OS kernel | Runs its own guest OS |
| Starts in seconds | Starts in tens of seconds or minutes |
| Lower resource usage | Higher resource usage |
| Best for applications | Best for complete operating systems |

## 2. Secrets vs Environment Variables

### What are secrets?
Docker **secrets** are **sensitive data**, such as passwords or API keys, that Docker **securely** **provides** to **containers** at **runtime**. They are **not stored** in **image** layers and are only **available** to the **containers** that need them.

### What are Environment Variables?
E**nvironment variables** are **key-value** pairs provided to processes at **runtime**. They allow applications to **adapt** their beh**a**vior depending on the **environment** they are **running** in, such as configuring paths, language settings, or application options.
In order to see your environments variables on debian/ubuntu you can do :
```
export
```
or
```
env
```
### When use secrets and Environment Variables ?
For **confidential** **information** such as API keys or passwords, it is better to use secrets. For **non-sensitive** configuration values, environment variables are usually **sufficient**.


## 3. Docker Network vs Host Network

### What's Docker Network?
**Docker networking** allows **containers** to **communicate** with each other through **virtual networks**. For example, containers running different services can **exchange date without exposing their ports to the host**. Docker also **provides** internal **DNS resolution**, allowing **containers** to **reach** each other using their **container names**.

### What's Host Network?
The **host network** is the ne**t**work of the **physical machine running Docker.** **Containers** using the **host network** **share** the same network **interfaces** and **configuration** as the **host**.

## 4. Docker Volumes vs Bind Mount

### What is a Docker volume ?
A **Docker volume** is a **persistent storage** location **managed** by **Docker**. It allows containers to **store** **data** **independently** of their **lifecycle** and **enables** **multiple** **containers** to sha**r**e the **same** **data** if needed.

### What is a Bind Mount ?
A **bind mount** **maps** a **directory** or **file** from the **host machin**e into a **container**. **Unlike** a **Docker volume**, the **data** is **stored** and managed directly on the **host's filesystem**.

---
# Instructions
To launch the project, you have to launch the **VM**, go inside, and :
```
make start
```

It will launch `docker compose up -d`, which is the command to **execute** a Docker Compose YAML file, and the option `-d` is to launch it in daemon mode.

If you want to check if containers are running:
```
Docker ps
```

Test if it is working 
```
curl -k https://lud-adam.42.fr
```
or test with firefox:
```
firefox &
```
and put the following url ` https://lud-adam.42.fr` and or even go to connect at `https://lud-adam.42.fr/wp-admin`

---
# Resources
1. Debian
	https://www.debian.org/releases/bookworm/
	https://goopensource.fr/debian-installation-sans-interface-graphique/
2. Learn Docker
	https://www.youtube.com/watch?v=eGz9DS-aIeY&list=PLIhvC56v63IJlnU4k60d0oFIrsbXEivQo&index=2
3. Documentation Docker
	https://docs.docker.com/
	https://docs.docker.com/reference/cli/docker/volume/create/
	https://docs.docker.com/engine/install/debian/
4. Wordpress with Docker
	https://www.deployhq.com/blog/wordpress-with-docker
5. Documentation TLS
	https://docs.openssl.org/3.5/man1/openssl-req/#options
6. About port in linux
	https://www.webhosting.uk.com/kb/how-to-check-open-ports-in-linux-ubuntu-centos-debian/
7. Nginx
	https://blog.stephane-robert.info/docs/services/web/nginx/#activer-https-avec-lets-encrypt
	https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/
