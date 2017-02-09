FROM php:5.6-apache

RUN curl -o /usr/local/bin/n98-magerun https://files.magerun.net/n98-magerun.phar \
    && chmod +x /usr/local/bin/n98-magerun

RUN requirements="libpng12-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libpng12-dev libfreetype6-dev libjpeg62-turbo-dev mysql-client" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && requirementsToRemove="libpng12-dev libmcrypt-dev libcurl3-dev libpng12-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN usermod -u 1000 www-data
RUN a2enmod rewrite

WORKDIR /var/www/html

COPY ./bin/set-base-url /usr/local/bin/set-base-url

RUN chmod +x /usr/local/bin/set-base-url

EXPOSE 9000
EXPOSE 80