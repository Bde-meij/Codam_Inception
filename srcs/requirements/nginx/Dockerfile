FROM mainimp:imports

RUN apt-get install nginx -y

# for security set up SSL (secure socket layers)
RUN apt-get install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req\
    -x509 \
    -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=bde-meij.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# kept having permission issues,
# probably don't need both
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
