#!/usr/bin/env bash
set -e
shopt -s expand_aliases

alias n98="n98-magerun2 --skip-root-check --root-dir=/var/www/html"

echo "Updating xdebug configuration..."
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_host=$DOCKER_HOST_IP" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

n98 script -d domain=$DOMAIN /var/n98-config

echo "Correcting permissions..."
cd /var/www/html
find var vendor pub/static pub/media app/etc -type f -exec chmod g+w {} \;
find var vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} \;
chown -R root:www-data .
chmod u+x bin/magento

## DEPLOY PROCESS
### NOTE! This is VERY slow if mounting webroot at runtime!
#n98 maintenance:enable
#n98 setup:upgrade
#n98 deploy:mode:set production
#n98 cache:clean

exec apache2-foreground
