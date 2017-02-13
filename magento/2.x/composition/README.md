## What is this?
- A basic LAMP stack composition to run a Magento2 site

## Assumptions
- Magento2 codebase is located in a subdirectory `./webroot` of the repositiory root
- You have no other web or MySQL servers running (i.e. ports 80 and 3306 are open)

## How do I use it?
- Customize `docker-compose.yml` if desired!
- Copy `./composition` (this directory) to your Magento repostiry root, and build
- For Xdebug support, set the DOCKER_HOST_IP environment variable to your machine's IP
  - `export DOCKER_HOST_IP=$(ipconfig getifaddr en0)`
- Run the composition
- If no DB has been imported, connect and import, as local port 3306 should be mapped to the composition's MySQL instance
  - You'll probably need to clear cache after this
- Navigate to http://magento.dev/
- For `n98-magerun2` and `bin/magento` support:
  - Add an entry to your `/etc/hosts` file mapping `127.0.0.1` to `mysql-host`
  - Overwrite your `env.php` with the contents of `./composition/magento/env.php`

## How does it work?
- Maps ports 80 (HTTP) and 3306 (MySQL) to host 80, 3306
- Relative to the repo root...
  - Mounts `/webroot` into Apache container's `/var/www/html` subdirectory
  - Mounts `/db` (and creates, if it does not exist) into MySQL container's `/var/lib/mysql`
  - Mounts `/composition/magento/env.php` to `/var/www/html/app/etc/env.php`, preserving the `env.php` on your filesystem

## What doesn't this do?
- Doesn't account for sites with multiple subdomains
  - We'll need to update the `init.sh` file to do more than just the basic base URL
- Doesn't handle most other DB sanitization issues
