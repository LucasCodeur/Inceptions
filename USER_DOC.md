# Services

The stack provides three main services:

1. **Nginx**: Web server.
2. **MariaDB**: Database server used by WordPress.
3. **WordPress + PHP-FPM**: Content Management System (CMS). PHP-FPM processes PHP requests and communicates with Nginx through FastCGI.

# Start and stop the project

To start the project:

```bash
make start
```

To stop the project:

```bash
make stop
```

To restart the project:

```bash
make restart
```

# Access the website and the administration panel

To access the website:

```bash
make website
```

To access the administration panel:

```bash
make administration
```

# Locate and manage credentials

## Credentials

The project uses two main sensitive credentials:

1. `user_password`
2. `admin_password`

Credentials are not stored directly in Dockerfiles or in the source code.

Sensitive values such as passwords are stored separately and provided to the containers through Docker secrets. Each service only receives the credentials it needs.

The credential files can be found in the `secrets` directory at the root of the project:

```text
./secrets/
```

To change a credential, modify the corresponding file inside the `secrets` directory.

These files contain sensitive information and should never be committed to Git.

Other configuration values are stored in the `.env` file, for example:

```env
DOMAIN_NAME=lud-adam.42.fr
DB_NAME=wordpress
DB_USER=lud-adam
MARIADB_HOST=mariadb:3306
PORT_WORDPRESS_TO_NGINX=9000
ADMIN_NAME=host
```

These values are configuration variables and should not be confused with sensitive credentials.

# Check that the services are running correctly

To check whether the services are running correctly:

```bash
make check_service
```
