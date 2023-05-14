FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget

RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update

RUN apt-get -y install php7.4
RUN apt-get -y install php7.4-fpm
RUN apt-get -y install php7.4-mysqli
RUN apt-get -y install php7.4-json
RUN apt-get -y install php7.4-curl
RUN apt-get -y install php7.4-dom
RUN apt-get -y install php7.4-exif
RUN apt-get -y install php7.4-fileinfo
RUN apt-get -y install php7.4-mbstring
RUN apt-get -y install php7.4-xml
RUN apt-get -y install php7.4-zip

RUN apt-get install -y wget
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
	mv wordpress/* /var/www/html && \
	rm -rf latest.tar.gz

COPY conf/wp-config.php /var/www/html/wp-config.php
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/start_wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start_wordpress.sh

ENTRYPOINT [ "start_wordpress.sh" ]