#!/bin/bash

set -e
apt install -y iproute2
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp --info

cd /var/www/html

DBPASS=$(head -n 1 "$WORDPRESS_DB_PASSWORD")

echo "dbpass: $DBPASS"

if [ ! -f "wp-config.php" ]; then
	echo 'Downloading WordPress'
	wp core download --allow-root
	echo 'Creating wp-config.php'
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DBPASS" --dbhost="$MARIADB_HOST" --allow-root

ADMINPASS=$(head -n 1 "$ADMIN_PASSWORD")
echo "adminpass: $ADMINPASS"

	wp --path=/var/www/html core install \
	--url=https://localhost \
	--title="Inception" \
	--admin_user="$ADMIN_NAME" \
	--admin_password="$ADMINPASS"\
	--admin_email=test@test.com \
	--allow-root

	wp user create luffy luffy@gmail.com --role=editor --user_pass=luffy --allow-root
else
	echo "Wordpress already exists, skipping download"
fi

echo 'Executing php-fpm'
exec php-fpm8.2 -F
