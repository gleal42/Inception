FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN apt-get -y install gettext-base

EXPOSE 3306

COPY tools/start_mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_mariadb.sh

COPY conf/50-server.cnf.template /tmp/50-server.cnf.template
COPY conf/instalation.sql.template /tmp/instalation.sql.template

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

ENTRYPOINT [ "/usr/local/bin/start_mariadb.sh" ]
