#! /bin/bash

set -eux

service mysql start;

mysql -u${MYSQL_ROOT_USER} << HERE
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;
HERE

mysql << HERE
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
HERE

service mysql stop;

mysqld --bind-address=0.0.0.0;
