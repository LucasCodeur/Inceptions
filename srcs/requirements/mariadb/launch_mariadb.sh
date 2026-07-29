#!/bin/sh

service mariadb start

sleep 5
echo "DB_NAME=$DB_NAME"
echo "DB_USER=$DB_USER"
echo "PASSWORD=$PASSWORD"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe
