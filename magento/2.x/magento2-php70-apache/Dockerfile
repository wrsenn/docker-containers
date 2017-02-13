FROM php:7.0-apache

RUN apt-get update \
    && apt-get install -y libpng12-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libpng12-dev libfreetype6-dev libjpeg62-turbo-dev libxml2-dev mysql-client \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl \
    && docker-php-ext-install json \
    && docker-php-ext-install iconv \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get purge --auto-remove -y libpng12-dev libmcrypt-dev libcurl3-dev libpng12-dev libfreetype6-dev libjpeg62-turbo-dev libxml2-dev

RUN usermod -u 1000 www-data
RUN a2enmod rewrite

RUN curl -o /usr/local/bin/n98-magerun2 https://files.magerun.net/n98-magerun2-latest.phar \
    && chmod +x /usr/local/bin/n98-magerun2

COPY ./init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

WORKDIR /var/www/html

EXPOSE 9000
EXPOSE 80