FROM mainimp:imports

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/start.sh /root/start.sh

WORKDIR /root/

# fun fact: it is possible to set up the database 
# for WP from this dockerfile, instead of WP to DB
# communication

RUN chmod 0777 start.sh
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENTRYPOINT ["./start.sh"]
EXPOSE 3306