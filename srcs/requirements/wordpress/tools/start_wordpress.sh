#!/bin/sh
set -eux

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F -R