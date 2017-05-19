## What is this?
- A basic LAMP+Redis stack composition to run a Magento2 site

## Assumptions
- Magento2 codebase is located in a subdirectory `./webroot` of the repositiory root
- You have no other web, Redis, or MySQL servers running (i.e. ports 80, 9000, 6379, and 3306 are open)

## How do I use it?
- Copy `./composition` (this directory) to your Magento repostiry root
- Customize `./composition/docker-compose.yml` and `./composition/magento/init.sh` as needed
  - Note specifically that `init.sh`'s `n98-magerun` commands may not be suitable for your site!
- Build and run the composition
- If no DB has been imported:
  - `n98-magerun2` commands will fail––this is expected  
  - Connect and import, as local port 3306 should be mapped to the composition's MySQL instance
  - Bring the composition down and back up again
- Navigate to http://magento.dev/ (or whatever the domain is configured to be in `docker-compose.yml`)
- For `n98-magerun2` and `bin/magento` support on your local machine:
  - Add an entry to your `/etc/hosts` file mapping `127.0.0.1` to `docker-host magento-host mysql-host redis-host`
  - Overwrite your `env.php` with the contents of `./composition/magento/env.php`
- Feel free to comment out any steps in `init.sh` that you want to skip!
  - `n98-magerun2` DB configuration only needs to run once per DB import
  - Permissions correction only needs to be run once per composition build
  - Build process can be skipped if developer mode is desired

## How does it work?
- Maps ports 80 (HTTP), 9000 (Xdebug), 6789 (Redis), and 3306 (MySQL) to matching host ports
- Relative to the repo root...
  - Mounts `/webroot` into Apache container's `/var/www/html` subdirectory
  - Mounts `/composition/db` (and creates, if it does not exist) into MySQL container's `/var/lib/mysql`
  - Mounts `/composition/magento/env.php` to `/var/www/html/app/etc/env.php`, preserving the `env.php` on your filesystem

## What doesn't this do?
- Doesn't account for sites with multiple subdomains
  - You'll need to update the `init.sh` file to do more than just the basic base URL
- Perform with the same speed as this would on bare metal, particularly on macOS
  - Magento2 has a lot of disk IO on files mounted into the container from the host, and this is SLOW AF on macOS
- Use Nginx
  - Apache + mod_php is more convenient for local development and requires fewer containers.
