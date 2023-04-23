FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

COPY start_mariadb.sh .

CMD bash start_mariadb.sh

EXPOSE 3306