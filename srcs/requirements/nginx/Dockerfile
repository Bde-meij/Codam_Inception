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













# FROM alpine:3.18

# RUN apk update
# RUN apk upgrade
# RUN apk add nginx

# RUN apk add openssl
# WORKDIR /root/
# RUN openssl genrsa -out nginx.key
# RUN openssl req -new -key nginx.key -out nginx.csr -subj "/DN=./"
# RUN openssl x509 -req -days 365 -in nginx.csr -signkey nginx.key -out nginx.crt
# RUN mv nginx.crt /etc/ssl/certs/nginx.crt
# RUN mv nginx.key /etc/ssl/private/nginx.key

# COPY /conf/nginx.conf /etc/nginx/nginx.conf
# COPY /conf/index.html /var/www/html/index.html

# RUN chmod 600 /etc/ssl/certs/nginx.crt /etc/ssl/private/nginx.key
# EXPOSE 443/tcp
# CMD nginx -g "daemon off;"

