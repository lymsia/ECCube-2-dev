FROM php:7.4-apache

# install library
RUN apt-get update && apt-get install -y vim git zip unzip

# mysql
RUN docker-php-ext-install mysqli pdo_mysql

# composer用
RUN apt-get install -y libpng-dev zlib1g-dev
RUN docker-php-ext-install gd

# composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www

CMD ["apache2-foreground"]
