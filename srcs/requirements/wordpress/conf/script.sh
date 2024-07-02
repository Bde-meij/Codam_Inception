#!/bin/bash

# Wait for database to finish configuration
sleep 20


if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	cd '/var/www/wordpress'

	echo "create config"
	wp config create --allow-root \
					--dbname=$WORDPRESSDATABASE \
					--dbuser=$WORDPRESSDATABASEUSER \
					--dbpass=$WORDPRESSDATABASEPASSWD \
					--dbhost=mariadb:3306

	echo "core install"
	wp core install --allow-root \
					--skip-email \
					--title=$TITLE \
					--admin_name=$WPADMINUSER \
					--admin_password=$WPADMINPASSWD \
					--admin_email=$WPADMINEMAIL \
					--url=$DOMAIN_NAME

	echo "create user"
	wp user create \
					$WPUSERUSER \
					$WPUSEREMAIL \
					--allow-root \
					--user_pass=$WPUSERPASSWD \
					--role='author'

fi

echo "running fpm"
/usr/sbin/php-fpm81 -F -R
