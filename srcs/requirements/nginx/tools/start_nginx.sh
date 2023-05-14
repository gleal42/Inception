#! /bin/bash

set -eux

envsubst "$(printf '${%s} ' $(env | grep -v "^_" | cut -d'=' -f1))" < /tmp/nginx.conf.template > /etc/nginx/conf.d/nginx.conf

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
			-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/OU=gleal/CN=$DOMAIN_NAME"

nginx -g 'daemon off;'
