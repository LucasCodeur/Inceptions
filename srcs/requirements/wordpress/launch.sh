#!/bin/bash

set -e

cd /var/www/html

if [ ! f wp-config.php]; then
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST \
		--allow-root
fi

if ! wp core is-installed --allow-root; then
	wp core install \
		--url="WP_URL" \
		--title="WP_TITLE" \
		--admin_user="WP_ADMIN_USER" \
		--admin_password="WP_ADMIN_PASSWORD" \
		--admin_email="WP_ADMIN_EMAIL" \
		--allow-root
fi

exec php-fpm8.2 -F
