#! /bin/bash

set -eux

# grep -v "^_" just to prevent a random $_ somewhere in the file (encrypted password)

envsubst "$(printf '${%s} ' $(env | grep -v "^_" | cut -d'=' -f1))" < /tmp/50-server.cnf.template > /etc/mysql/mariadb.conf.d/50-server.cnf
envsubst "$(printf '${%s} ' $(env | grep -v "^_" | cut -d'=' -f1))" < /tmp/instalation.sql.template > /tmp/instalation.sql


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

mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} < /tmp/instalation.sql

# Making password required
mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysqladmin -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} shutdown;

rm -rf /tmp/instalation.sql

fi


# service mysql status
# mysqld --help --verbose | grep bootstrap
service mysql stop

mysqld