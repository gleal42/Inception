#!/bin/sh
set -eux

envsubst "$(printf '${%s} ' $(env | grep -v "^_" | cut -d'=' -f1))" < /tmp/wp-config.php.template > /var/www/html/wp-config.php

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F -R