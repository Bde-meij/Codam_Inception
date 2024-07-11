# FROM debian:bullseye

# RUN apt-get update
# RUN apt-get upgrade -y

FROM mainimp:imports

RUN apt-get install mariadb-server -y

#kan geen terminal besturen zonder deze client
# RUN apt-get install mariadb-client -y

# COPY conf/maria.cnf /etc/my.cnf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/start.sh /root/start.sh

WORKDIR /root/

# is mogelijk om hier de database te bouwen in plaats 
# van dat het aangestuurd wordt door WP

RUN chmod 0777 start.sh
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENTRYPOINT ["./start.sh"]
EXPOSE 3306