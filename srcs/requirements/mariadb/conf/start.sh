#!/bin/sh
if [ -d /var/lib/mysql/initialized ]
then
	touch /var/lib/mysql/initialized
else
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mysqld & sleep 5
	mysql -e "CREATE DATABASE $WORDPRESSDATABASE"
	mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESSDATABASE.* TO $WORDPRESSDATABASEUSER@172.20.30.30 IDENTIFIED BY '$WORDPRESSDATABASEPASSWD'"
	mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESSDATABASE.* TO $WORDPRESSDATABASEUSER@172.20.30.40 IDENTIFIED BY '$WORDPRESSDATABASEPASSWD'"
	killall mysqld
	touch /var/lib/mysql/initialized
fi
mysqld
