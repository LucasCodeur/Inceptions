#!/bin/sh

# set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld /var/lib/mysql

# if [ ! -d /var/lib/mysql/mysql ]; then
#     mariadb-install-db \
#         --user=mysql \
#         --basedir=/usr \
#         --datadir=/var/lib/mysql
# fi
#
# CREATE DATABASE wordpress_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# CREATE USER 'lud-adam'@'localhost' IDENTIFIED BY 'lud-adam';
# GRANT ALL PRIVILEGES ON wordpress_db.* TO 'lud-adam'@'localhost';
# FLUSH PRIVILEGES;
# EXIT;

exec mariadbd --user=mysql --console
