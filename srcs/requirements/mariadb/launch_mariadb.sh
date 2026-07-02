#!/bin/sh

set -e

echo "just before mkdir"
mkdir -p /run/mysqld
echo "just chown"
chown -R mysql:mysql /run/mysqld /var/lib/mysql

echo "before if"
# if [ ! -d /var/lib/mysql/mysql ]; then
#     mariadb-install-db \
#         --user=mysql \
#         --basedir=/usr \
#         --datadir=/var/lib/mysql
# fi

echo "before exec"
exec mariadbd --user=mysql --console

