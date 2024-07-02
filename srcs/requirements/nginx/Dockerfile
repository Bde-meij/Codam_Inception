FROM alpine:3.18

RUN apk update
RUN apk upgrade
RUN apk add nginx

RUN apk add openssl
WORKDIR /root/
RUN openssl genrsa -out nginx.key
RUN openssl req -new -key nginx.key -out nginx.csr -subj "/DN=./"
RUN openssl x509 -req -days 365 -in nginx.csr -signkey nginx.key -out nginx.crt
RUN mv nginx.crt /etc/ssl/certs/nginx.crt
RUN mv nginx.key /etc/ssl/private/nginx.key

COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /conf/index.html /var/www/html/index.html

RUN chmod 600 /etc/ssl/certs/nginx.crt /etc/ssl/private/nginx.key
CMD nginx -g "daemon off;"

EXPOSE 443/tcp
