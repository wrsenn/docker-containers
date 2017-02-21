#!/usr/bin/env bash
set -e
shopt -s expand_aliases

alias n98="n98-magerun --root-dir=/var/www/html"

echo "Updating xdebug configuration..."
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_host=$DOCKER_HOST_IP" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

n98 config:set web/unsecure/base_url "http://$BASE_URL/"
n98 config:set web/secure/base_url "http://$BASE_URL/"
n98 config:delete web/cookie/cookie_domain

n98 cache:flush

apache2-foreground
