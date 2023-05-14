# Main Concepts

## PID 1

Docker container spawns processes with PID 1

PID 1 processes in Linux do not have any default signal handlers and as a result will not receive and propogate signals.

This is dangerous because we might receive a SIGTERM and our program will try to continue, causing a dangerous crash.

https://petermalmgren.com/signal-handling-docker/

## Daemons and Docker

A Docker container is not like Virtual machines. They are meant to execute one process. Once that process finishes, the container exists.

Why is this important? Because it explains why mariadb, nginx and wordpress containers will stop imediately if we don't add an extra command.

In our project we are forbidden to use:
`tail -f, bash, sleep infinity, while true.`

These are hacks to keep the container running forever by creating never ending processes that do nothing while the services/daemons are running in the background.

Now, we have 3 dockerfiles 3 different processes that will communicate.

 - Once we setup MariaDB we just need to run it.
 - Once we setup nginx we just need to run it.
 - Once we setup wordpress we just need to run it.
 


https://www.tutorialworks.com/why-containers-stop/
https://stackoverflow.com/questions/25970711/what-is-the-difference-between-nginx-daemon-on-off-option


Php-fpm (Fast process manager) package is needed by NGINX to process PHP pages of your WordPress installation.

https://www.digitalocean.com/community/tutorials/install-wordpress-nginx-ubuntu
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-22-04


# Network

Docker containers are isolated from the system and from each other.

https://docs.docker.com/network/

https://docs.docker.com/compose/networking/


# NGINX

To run a Wordpress website we need to host it on a webserver.

Which basically is in charge of responding to requests based on different paths/rules.

For example, we have a server block that listens to port 443 (usually associated with secure connections https vs http (port 80 by default))

The index directive, for example, will be used to decide which files (if they exist), will be shown in each path.

```bash
	location / {
		index index.html 
	}
# In the root of our project, if there is an index.html it will be shown even if we don't write index.html in the address
```

https://wpengine.com/resources/nginx-vs-apache-wordpress/

https://ubuntu.com/tutorials/install-and-configure-wordpress#4-configure-apache-for-wordpress

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose


# Debugging

Main way to debug was:

add set -eux to all te scripts to make errors verbose

docker exec -it container ID bash
cat /var/log/nginx/error.log
click on page

# MariaDB

configuration is by default /etc/mysql/mariadb.conf.d/50-server.cnf

docker cp <mariadb-container>:/etc/mysql/mariadb.conf.d/50-server.cnf srcs/requirements/mariadb/conf

Only replaced bind-address by 0.0.0.0

`mysql_secure_installation`
```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] Y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] Y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] n
 ... skipping.

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

https://stackoverflow.com/a/11990813


USE information_schema
SHOW FULL TABLES;
select * from USER_PRIVILEGES;

To setup instalation:
Do it the first time.
Then manually delete every post and plugin.
Then run:
mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --all-databases > /tmp/instalation.sql

Finaly delete all the posts from wp_options

On envsubst, if you don't specify the variables you want to replace all dollar signs in the document will be a problem and try to replace

envsubst "$(printf '${%s} ' $(cat srcs/.env | grep -v "^#" | grep -v "^$" | cut -d'=' -f1))" --variables | xargs -L4 | column -t

System networks such as bridge, host, and none will never be removed.

try first
mysql -u root

then when it fails do:
mysql -u root -proot

mysql -u databasemaster -pgreatpassword wordpress

Don't forget to change /etc/hosts

127.0.0.1 ${DOMAIN_NAME}

https://docs.docker.com/engine/reference/commandline/network_prune/

https://codex.wordpress.org/Database_Description#Table:_wp_options

https://code.tutsplus.com/tutorials/understanding-and-working-with-the-wordpress-options-table--cms-21119

https://codex.wordpress.org/Option_Reference

https://wordpress.org/documentation/article/roles-and-capabilities/

https://www.hostpapa.com/knowledgebase/create-admin-account-wordpress-via-mysql/