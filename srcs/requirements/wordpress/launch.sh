#!/bin/bash

set -e
apt install -y iproute2
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown root:root /usr/local/bin/wp
wp --info

cd /var/www/html

if [ ! -f "wp-config.php" ]; then
	echo 'Downloading WordPress'
	wp core download --allow-root
	echo 'Creating wp-config.php'
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$PASSWORD" --dbhost="$ADMIN_NAME" --allow-root
	echo "Waiting for MariaDB..."
	until nc -z mariadb 3306; do
	    sleep 2
	done

	wp --path=/var/www/html core install \
	--url=https://localhost \
	--title="Inception" \
	--admin_user="$ADMIN_NAME" \
	--admin_password="$HOST_PASSWORD" \
	--admin_email=test@test.com \
	--allow-root
	chown root:root /usr/local/bin/wp

	wp user create luffy luffy@gmail.com --role=editor --user_pass=luffy --allow-root
else
	echo "Wordpress already exists, skipping download"
fi
 

echo 'Executing php-fpm'
exec php-fpm8.2 -F
