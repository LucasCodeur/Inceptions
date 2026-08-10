# Set up the environment from scratch (prerequisites, configuration files, secrets)

Before launching the project, you have to fill the `.env` file with the following information:

```bash
DOMAIN_NAME=lud-adam.42.fr
DB_NAME=wordpress
DB_USER=lud-adam
MARIADB_HOST=mariadb:3306
PORT_WORDPRESS_TO_NGINX=9000
ADMIN_NAME=host
```

Put the required secrets inside the `./secrets` directory, such as the user, administrator passwords and **TLS certificate**.
For exemple:
```text
secret/
├── password_admin.txt  
└── password_user.txt
└── tls/ server.crt  server.key
```

Create a `data` folder containing `mariadb-volume` and `wordpress-volume`:

```bash
data/
├── mariadb-volume/
└── wordpress-volume/
```

The `wordpress-volume` is shared between WordPress and Nginx because both services need access to the WordPress files.

The `mariadb-volume` is used by MariaDB to store the database files.

# Build and launch the project using the Makefile and Docker Compose

To start the project:

```bash
make start
```

Equivalent to:

```bash
docker compose up -d
```

To stop the project:
# Set up the environment from scratch (prerequisites, configuration files, secrets)

Before launching the project, you have to fill the `.env` file with the following information:

```bash
DOMAIN_NAME=lud-adam.42.fr
DB_NAME=wordpress
DB_USER=lud-adam
MARIADB_HOST=mariadb:3306
PORT_WORDPRESS_TO_NGINX=9000
ADMIN_NAME=host
```

Put the required secrets inside the `./secrets` directory, such as the user, administrator passwords and **TLS certificate**.
For exemple:
```text
secret/
├── password_admin.txt  
└── password_user.txt
└── tls/ server.crt  server.key
```

Create a `data` folder containing `mariadb-volume` and `wordpress-volume`:

```bash
data/
├── mariadb-volume/
└── wordpress-volume/
```

The `wordpress-volume` is shared between WordPress and Nginx because both services need access to the WordPress files.

The `mariadb-volume` is used by MariaDB to store the database files.

# Build and launch the project using the Makefile and Docker Compose

To start the project:

```bash
make start
```

Equivalent to:

```bash
docker compose up -d
```

To stop the project:

```bash
make stop
```

Equivalent to:

```bash
docker stop $(docker ps -q)
```

To restart the project:

```bash
make restart
```

Equivalent to:

```bash
docker compose restart
```

# Use relevant commands to manage the containers and volumes

To remove the containers:

```bash
make removecontainers
```

Equivalent to:

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

To completely clean the project:

```bash
make armageddon
```

Equivalent to:

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker system prune --all --volumes
```

To check if the containers are running:

```bash
make check_service
```

Equivalent to:

```bash
docker ps
```

To check the networks:

```bash
docker network ls
```

# Identify where the project data is stored and how it persists

MariaDB stores its data inside its volume.

WordPress stores its data inside its volume.

These volumes are mounted on the following host directory:

```text
/home/lud-adam/data/
```

The data persists even if the containers are stopped, restarted, or removed because it is stored in volumes outside the containers.
```bash
make stop
```

Equivalent to:

```bash
docker stop $(docker ps -q)
```

To restart the project:

```bash
make restart
```

Equivalent to:

```bash
docker compose restart
```

# Use relevant commands to manage the containers and volumes

To remove the containers:

```bash
make removecontainers
```

Equivalent to:

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

To completely clean the project:

```bash
make armageddon
```

Equivalent to:

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker system prune --all --volumes
```

To check if the containers are running:

```bash
make check_service
```

Equivalent to:

```bash
docker ps
```

To check the networks:

```bash
docker network ls
```

# Identify where the project data is stored and how it persists

MariaDB stores its data inside its volume.

WordPress stores its data inside its volume.

These volumes are mounted on the following host directory:

```text
/home/lud-adam/data/
```

The data persists even if the containers are stopped, restarted, or removed because it is stored in volumes outside the containers.
