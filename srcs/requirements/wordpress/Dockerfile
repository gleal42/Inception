FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install php7.3
RUN apt-get -y install php7.3-fpm
RUN apt-get -y install php7.3-mysqli
RUN apt-get -y install php7.3-json
RUN apt-get -y install php7.3-curl
RUN apt-get -y install php7.3-dom
RUN apt-get -y install php7.3-exif
RUN apt-get -y install php7.3-fileinfo
RUN apt-get -y install php7.3-mbstring
RUN apt-get -y install php7.3-xml
RUN apt-get -y install php7.3-zip

COPY conf/wp-config.php var/www/html/wordpress/wp-config.php
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/start_wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start_wordpress.sh

ENTRYPOINT [ "start_wordpress.sh" ]