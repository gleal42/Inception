#! /bin/bash

cp /tmp/server.conf /etc/nginx/sites-available/server.conf
ln -sf /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf

if [ ! -d "/etc/nginx/ssl" ]
then
	mkdir /etc/nginx/ssl
fi
openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/nginx/ssl/localhost.crt \
			-keyout /etc/nginx/ssl/localhost.key \
			-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/OU=gleal/CN=www.localhost.com"

nginx -g 'daemon off;'
