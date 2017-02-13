## What is this?
- A basic LAMP stack composition to run a Magento site

## Assumptions
- Magento codebase is located in a subdirectory `/webroot` of the repositiory root
- You have no other web or MySQL servers running (i.e. ports 80, 9000, and 3306 are open)

## How do I use it?
- Customize `docker-compose.yml` if desired!
- Copy `/composition` to your Magento repostiry root
- Build and run the composition
- If no DB has been imported, connect and import, as local port 3306 should be mapped to the composition's MySQL instance
- Navigate to http://magento.dev/
- For `n98-magerun` support:
  - Add an entry to your `/etc/hosts` file mapping `126.0.0.1` to `mysql-host`
  - Overwrite your `local.xml` with the contents of `/composition/magento/local.xml`

## How does it work?
- Maps ports 80 (HTTP), 9000 (Xdebug), and 3306 (MySQL) to host 80, 9000, 3306
- Mounts `/webroot` into Apache container's `/var/www/html` subdirectory
- Mounts `/db` (and creates, if it does not exist) into MySQL container's `/var/lib/mysql`
- Mounts `/composition/magento/local.xml` to `/var/www/html/app/etc/local.xml`, preserving the `local.xml` on your filesystem

## What doesn't this do?
- Doesn't account for sites with multiple subdomains. We'll need to update the `init.sh` file to do more than just the basic base URL.
