FROM alpine:3.18
RUN sleep 10
RUN apk update
RUN apk upgrade
RUN apk add openssl
RUN apk add php
RUN apk add php-fpm
RUN apk add php-mysqli
RUN apk add php-gd
RUN apk add php-mbstring
RUN apk add curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN apk add php-json
RUN apk add php-xml
RUN apk add php-zip
RUN apk add php-phar
COPY conf/script.sh /root/script.sh
#COPY conf/start.sh /root/start.sh
#COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
#COPY conf/wordpress.conf /var/www/wordpress/wp-config.php
WORKDIR /root/
#CMD sh start.sh
CMD sh script.sh
EXPOSE 9000/tcp
