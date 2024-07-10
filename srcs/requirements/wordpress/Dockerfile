FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install php-fpm -y
RUN apt-get install php-mysqli -y
RUN apt-get install curl -y

# set conf to listen to 9000
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# command line interface so wp can
# send instructions to mariadb
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
COPY tools/script.sh /root/script.sh

# at start of runtime wordpress will communicate with
# mariadb through this script
ENTRYPOINT ["./script.sh"]
EXPOSE 9000
