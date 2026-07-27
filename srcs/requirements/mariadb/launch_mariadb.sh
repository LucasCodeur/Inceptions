#!/bin/sh

set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql
apt update -y && apt upgrade -y

exec mariadbd --user=mysql --console
# echo -e "[mysqld] \nbind-address = 0.0.0.0\nport = 3306" > /etc/mysql/mariadb.cnf
