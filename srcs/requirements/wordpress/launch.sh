#!/bin/bash

set -e

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown root:root /usr/local/bin/wp
wp --info

DBNAME="$WORDPRESS_DB_NAME"
DBUSER="$WORDPRESS_DB_USER"
DBPASS="$WORDPRESS_DB_PASSWORD"
DBHOST="$WORDPRESS_DB_HOST"
 
# 1) Download WordPress
echo 'Downloading WordPress'
wp core download --allow-root
 
echo "Waiting for MariaDB..."
until nc -z "$DBHOST" 3306; do
    sleep 2
done

# 2) Generate wp-config.php / Setting DB
echo 'Creating wp-config.php'
wp config create --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=$DBHOST --allow-root
 
echo 'Creating database...'
# 3) Creating database
wp db create --allow-root
 
# 4) All good
echo 'Dream as if you will live forever. Live as if you will die today.'

chown root:root /usr/local/bin/wp

exec php-fpm8.2 -F
