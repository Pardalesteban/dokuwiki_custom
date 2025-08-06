FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev && \
    docker-php-ext-install gd

WORKDIR /var/www/html
COPY dokuwiki_data/dokuwiki/ ./data
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
