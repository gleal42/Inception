FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

EXPOSE 3306

COPY tools/start_mariadb.sh /usr/local/bin/
COPY conf/my.cnf /etc/mysql/conf.d/my.cnf
COPY conf/wordpress.sql /tmp/wordpress.sql

RUN chmod +x /usr/local/bin/start_mariadb.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

ENTRYPOINT [ "/usr/local/bin/start_mariadb.sh" ]
