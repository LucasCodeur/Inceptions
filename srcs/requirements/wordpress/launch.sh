#!/bin/bash

set -e
apt install -y iproute2
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown root:root /usr/local/bin/wp
wp --info

DBNAME="$WORDPRESS_DB_NAME"
DBUSER="$WORDPRESS_DB_USER"
DBPASS="$WORDPRESS_DB_PASSWORD"
DBHOST="$WORDPRESS_DB_HOST"

cd /var/www/html

if [ ! -f "wp-config.php" ]; then
	echo 'Downloading WordPress'
	wp core download --allow-root
	echo 'Creating wp-config.php'
	wp config create --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=$DBHOST --allow-root
	 
else
	echo "Wordpress already exists, skipping download"
fi
 
echo "Waiting for MariaDB..."
until nc -z mariadb 3306; do
    sleep 2
done


chown root:root /usr/local/bin/wp

echo 'Executing php-fpm'
exec php-fpm8.2 -F
