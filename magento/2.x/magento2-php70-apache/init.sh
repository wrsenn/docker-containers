#!/usr/bin/env bash

echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_host=$DOCKER_HOST_IP" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

n98-magerun --root-dir=/var/www/html config:set web/unsecure/base_url $BASE_URL
n98-magerun --root-dir=/var/www/html config:set web/secure/base_url $BASE_URL

exec apache2-foreground
