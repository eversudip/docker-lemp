FROM php:8.0.12-fpm-alpine3.13

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions pdo_mysql bcmath opcache redis zip pcntl gd exif mbstring

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf

RUN sed -i "s/user = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/backend/public

CMD [ "php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R" ]