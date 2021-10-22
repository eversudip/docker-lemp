FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/backend/public

ADD nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${NGINXUER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}