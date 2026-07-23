#!/bin/bash

set -e

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown root:root /usr/local/bin/wp
wp --info

# Your database credentials
DBNAME=[dbname]
DBUSER=[dbuser]
DBPASS=[dbpass]
DBHOST=[dbhost]
 
# Your next wordpress site credentials
WPUSER=[wpuser]
WPPASS=[wppass]
WPEMAIL=[wpemail]
WPURL=[wpurl]
WPTITLE=[wptitle]
 
# 1) Download WordPress
echo 'Downloading WordPress'
wp core download --allow-root
 
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
