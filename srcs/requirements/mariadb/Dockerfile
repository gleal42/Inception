FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

EXPOSE 3306

COPY tools/start_mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start_mariadb.sh
RUN chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT [ "/usr/local/bin/start_mariadb.sh" ]
