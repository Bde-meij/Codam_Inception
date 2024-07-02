FROM alpine:3.18

RUN sleep 10
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add mariadb
RUN apk add mariadb-client

COPY conf/maria.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/start.sh /root/start.sh

WORKDIR /root/

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql
CMD sh start.sh
EXPOSE 3306/tcp
