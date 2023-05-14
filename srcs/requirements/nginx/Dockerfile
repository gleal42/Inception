# Latest is 

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install openssl
RUN apt-get install vim -y
RUN apt-get -y install gettext-base

RUN rm -rf /etc/nginx/sites-enabled/default
RUN rm -f var/www/html/index.nginx-debian.html
RUN rm -f var/www/html/index.html

EXPOSE 443

COPY tools/start_nginx.sh /usr/local/bin
COPY conf/nginx.conf.template /tmp/nginx.conf.template

RUN chmod +x /usr/local/bin/start_nginx.sh
RUN chmod 777 /var/www/html/

ENTRYPOINT [ "start_nginx.sh" ]