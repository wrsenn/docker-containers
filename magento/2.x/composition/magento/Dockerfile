FROM wrsenn/magento2-php70-apache:latest AS base

# Warm the Composer cache by performing an install. This only gets busted if composer.json or auth.json is altered.
FROM base AS composer_cache
WORKDIR /var/www/html
COPY ./webroot/auth.json /var/www/html/
COPY ./webroot/composer.json /var/www/html/
RUN composer install --no-scripts --no-autoloader

# Copy in webroot's contents, including existing vendor. Install using Composer cache and lockfile.
FROM composer_cache AS vendor
WORKDIR /var/www/html
COPY ./webroot /var/www/html
RUN rm -rf vendor && composer install --optimize-autoloader

# Copy files necessary for running the app. Best not to mount env.php, as setting production mode alters this file.
FROM vendor AS runtime
COPY ./composition/magento/wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY ./composition/magento/php.ini /usr/local/etc/php/php.ini
COPY ./composition/magento/env.php /var/www/html/app/etc/env.php