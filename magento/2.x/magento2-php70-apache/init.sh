#!/usr/bin/env bash

if test -z "$1"; then
  echo "You must provide a port"
  exit 1
fi

BASE_URL="http://127.0.0.1:$1/"
while getopts "c" option; do
  case $option in
    c)
      shift
      BASE_URL="$1"
      ;;
  esac
done

n98-magerun2 --root-dir=/var/www/html config:set web/unsecure/base_url $BASE_URL
n98-magerun2 --root-dir=/var/www/html config:set web/secure/base_url $BASE_URL

apache2-foreground
