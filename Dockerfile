FROM php:7.4-apache

# install library
RUN apt-get update && apt-get install -y vim git zip unzip

# mysql
RUN docker-php-ext-install mysqli pdo_mysql

# composer用
RUN apt-get install -y libpng-dev zlib1g-dev
RUN docker-php-ext-install gd

RUN apt-get install -y wget libjpeg-dev libfreetype6-dev
RUN apt-get install -y libmagick++-dev \
	libmagickwand-dev \
	libpq-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libwebp-dev \
	libxpm-dev

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www

CMD ["apache2-foreground"]
