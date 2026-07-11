#!/bin/sh

set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

# if [ ! -d /var/lib/mysql/mysql ]; then
#     mariadb-install-db \
#         --user=mysql \
#         --basedir=/usr \
#         --datadir=/var/lib/mysql
# fi

exec mariadbd --user=mysql --console

