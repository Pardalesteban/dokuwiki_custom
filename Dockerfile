FROM php:8.2-apache

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev && \
    docker-php-ext-install gd

# Descargar DokuWiki versión más reciente
WORKDIR /var/www/html
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz -O dokuwiki.tgz && \
    tar -xvzf dokuwiki.tgz --strip-components=1 && \
    rm dokuwiki.tgz

# Dar permisos correctos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
