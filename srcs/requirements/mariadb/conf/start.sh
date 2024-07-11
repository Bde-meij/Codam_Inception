#!/bin/sh

# required initializations for database

if [ ! -d "/var/lib/mysql/$DBNAME" ]; then
	echo "FLUSH PRIVILEGES;" > init.sql
	echo "CREATE DATABASE IF NOT EXISTS \`$DBNAME\`;" >> init.sql
	echo "CREATE USER IF NOT EXISTS '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON \`$DBNAME\`.* TO '$DBUSER'@'%' IDENTIFIED BY '$DBPASS';" >> init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBROOTPASS';" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql

	mariadbd --bootstrap < init.sql
fi

mariadbd
