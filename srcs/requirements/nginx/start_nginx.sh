cp /tmp/server.conf /etc/nginx/sites-available/server.conf
ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/server.conf

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/nginx/ssl/localhost.crt \
			-keyout /etc/nginx/ssl/localhost.key \
			-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/OU=gleal/CN=www.localhost.com"

nginx -g 'daemon off;'