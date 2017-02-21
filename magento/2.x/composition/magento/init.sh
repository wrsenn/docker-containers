#!/usr/bin/env bash
set -e
shopt -s expand_aliases

alias n98="n98-magerun2 --skip-root-check --root-dir=/var/www/html"

## REQUIRED
echo "ServerName $DOMAIN" >> /etc/apache2/apache2.conf

echo "Updating xdebug configuration..."
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_host=$DOCKER_HOST_IP" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
## END REQUIRED

## OPTIONAL
## NOTE! This is VERY slow within Docker for some reason. Once the container
## is started, these shoudl be run from the host system if possible.

# rm -rf vendor/
# rm composer.lock
# composer install
# php ./bin/magento module:enable --all
# php ./bin/magento setup:upgrade --keep-generated
# rm -rf var/generation/*
# rm -rf var/di/*
# php ./bin/magento setup:di:compile
# php ./bin/magento setup:static-content:deploy

n98 config:set web/unsecure/base_url "http://$DOMAIN/"
n98 config:set web/secure/base_url "http://$DOMAIN/"
n98 config:set web/unsecure/base_media_url "http://$DOMAIN/"
n98 config:set web/secure/base_media_url "http://$DOMAIN/"
n98 config:delete web/cookie/cookie_domain
n98 config:set dev/css/merge_css_files 0
n98 config:set dev/css/minify_files 0
n98 config:set dev/js/merge_files 0
n98 config:set dev/js/minify_files 0
n98 config:delete dev/static/sign
n98 config:delete catalog/search/engine
n98 config:delete web/unsecure/base_static_url
n98 config:delete web/secure/base_static_url
n98 config:set web/secure/use_in_frontend 0
n98 config:set web/secure/use_in_adminhtml 0
## END OPTIONAL

## START
exec apache2-foreground
