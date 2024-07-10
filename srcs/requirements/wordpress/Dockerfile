FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install php-fpm -y
RUN apt-get install php-mysqli -y
# RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install mariadb-client -y

# set conf to listen to 9000
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz
RUN chown -R root:root /var/www/wordpress

# command line interface so wp can
# send instructions to mariadb
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
COPY tools/script.sh /root/script.sh
WORKDIR /root/
RUN chmod 0777 script.sh

# at start of runtime wordpress will communicate with
# mariadb through this script
ENTRYPOINT ["./script.sh"]
EXPOSE 9000
