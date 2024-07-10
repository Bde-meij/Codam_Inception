#!/bin/sh
if [ -f /var/lib/mysql/initialized ]
then
	touch /var/lib/mysql/initialized
else
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mysqld & sleep 5
	mysql -e "CREATE DATABASE IF NOT EXISTS $WORDPRESSDATABASE;"
	mysql -e "CREATE USER IF NOT EXISTS '$admin'@'%' IDENTIFIED BY '$adminpass';"
	mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESSDATABASE.* TO $admin@localhost IDENTIFIED BY '$WORDPRESSDATABASEPASSWD'"
	mysql -e "FLUSH PRIVILEGES;"
	killall mysqld
	touch /var/lib/mysql/initialized
fi
mysqld

# If the database doesn't already exist initialize the database and users
# if [ ! -d "/var/lib/mysql/$WORDPRESSDATABASE" ]; then
	# mysql_install_db --user=mysql --datadir=/var/lib/mysql
	# mysqld & sleep 5
	# mysql -e "CREATE DATABASE IF NOT EXISTS \`$WORDPRESSDATABASE\`;"
	# mysql -e "CREATE USER IF NOT EXISTS '$WORDPRESSDATABASEUSER'@'%' IDENTIFIED BY '$WORDPRESSDATABASEPASSWD';"
	# mysql -e "GRANT ALL PRIVILEGES ON \`$WORDPRESSDATABASE\`.* TO '$WORDPRESSDATABASEUSER'@'%' IDENTIFIED BY '$WORDPRESSDATABASEPASSWD';"
	# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1';"
	# mysql -e "FLUSH PRIVILEGES;"

	# cat init.sql

	# run mysqld while giving init.sql as input to initialize the database
	# killall mysqld
	# mysqld --bootstrap < init.sql
# fi

# Run mysqld
# mysqld