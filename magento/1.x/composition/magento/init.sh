#!/usr/bin/env bash
set -e

n98="n98-magerun --root-dir=/var/www/html"

## REQUIRED
echo "ServerName $DOMAIN" >> /etc/apache2/apache2.conf

echo "Updating xdebug configuration..."
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_host=$DOCKER_HOST_IP" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
## END REQUIRED

## OPTIONAL - Only needs to be run once per DB import
$n98 config:set web/unsecure/base_url "http://$BASE_URL/"
$n98 config:set web/secure/base_url "http://$BASE_URL/"
$n98 config:delete web/cookie/cookie_domain

$n98 cache:flush
## END OPTIONAL

## START
exec apache2-foreground