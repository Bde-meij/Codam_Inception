#!/bin/sh
sleep 15
cd /var/www/wordpress
mv wp-cli.phar /usr/bin/wpcli
mv wp-config.php.temp wp-config.php
sed -i "23i define( 'DB_NAME', '${WORDPRESSDATABASE}' );" wp-config.php
sed -i "26i define( 'DB_USER', '${WORDPRESSDATABASEUSER}' );" wp-config.php
sed -i "29i define( 'DB_PASSWORD', '${WORDPRESSDATABASEPASSWD}' );" wp-config.php
wpcli core download
wpcli core install --url=https://bde-meij.42.fr --title=Wordpress --admin_user=${WPADMINUSER} --admin_password=${WPADMINPASSWD} --admin_email=${WPADMINEMAIL}
wpcli user create ${WPUSERUSER} ${WPUSEREMAIL} --user_pass=${WPUSERPASSWD} --role=subscriber
wpcli plugin install redis-cache --activate
chown -R 1000:1000 /var/www/wordpress
wpcli redis enable
php-fpm81 -F -R
