#!/bin/sh

# this is wordpress to mariadb communication
# mariadb gets properly set up to function for wordpress

sleep 5
if [ ! -f "/var/www/wordpress/" ]; then
	cd '/var/www/wordpress'

	echo "create config"
	wp config create --allow-root \
					--dbname=$DBNAME \
					--dbuser=$DBUSER \
					--dbpass=$DBPASS \
					--dbhost=mariadb:3306

	echo "core install"
	wp core install --allow-root \
					--skip-email \
					--title="inception" \
					--admin_name=$WPADUSER \
					--admin_password=$WPADPASS \
					--admin_email=$WPADMAIL \
					--url=$DOMAIN_NAME

	echo "create user"
	wp user create \
					$WPUSER \
					$WPMAIL \
					--allow-root \
					--user_pass=$WPPASS \
					--role='author'

fi

echo "running fpm"
/usr/sbin/php-fpm7.4 -F