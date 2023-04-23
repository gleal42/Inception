# Latest is 

FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install openssl

COPY server.conf /tmp/server.conf

RUN rm -rf /etc/nginx/sites-enabled/default
RUN rm -f var/www/html/index.nginx-debian.html
RUN rm -f var/www/html/index.html

EXPOSE 443

COPY homepage /var/www/html/homepage
COPY start_nginx.sh .

ENTRYPOINT [ "start_nginx.sh" ]