## What is this?
- A basic PHP+Apache container to run a Magento 2 site. Use `--add-host` at runtime to define a hostname for MySQL connection.
- Shamelessly ripped off of https://hub.docker.com/r/occitech/magento/

## Assumptions
- You have a locally running MySQL server
- Your MySQL user can connect from any host (i.e. 'root'@'%')

## How do I use it?
- Build the container
  - In this directory, run the following: `docker build -t magento2-php79-apache:latest .`
- Run the container
  - This takes over your local port 80, so make sure it's open.
  - Run this here command to spin it up, in your repo root, assuming the Magento files are in a subdirectory `webroot/`. Specify a base URL where noted:
    - `docker run --name magento2 --add-host=docker-host:$(ipconfig getifaddr en0) -v $PWD/webroot:/var/www/html -p 80:80 -p 9000:9000 magento2-php70-apache set-base-url -c <MY BASE URL>`
  - Edit your `app/etc/env.php`'s MySQL host, and change it to `docker-host` (see above).
  - Hit the base URL (assuming you have *.dev mapped to localhost), and observe a running site.

## What doesn't this do?
- Doesn't account for sites with multiple subdomains. We'll need to update the `init.sh` file to do more than just the basic base URL.
- Doesn't automagically wire up your MySQL connections. Edit your `env.php` and clear cache.
