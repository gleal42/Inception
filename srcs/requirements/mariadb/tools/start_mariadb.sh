#! /bin/bash

set -eux

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
    mysql_install_db --datadir=/var/lib/mysql
	echo "Database already exists"
else

service mysql start;

# first line break is important (root password before configuration)
/usr/bin/mysql_secure_installation << HERE

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
HERE

mysql -uroot -p${MYSQL_ROOT_PASSWORD} << HERE
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
HERE

# service mysql status
mysqladmin -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} status;
service mysql stop

fi

mysqld --help --verbose | grep bootstrap

mysqld