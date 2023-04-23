# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_nginx.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctw02485 <ctw02485@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 00:26:43 by gleal             #+#    #+#              #
#    Updated: 2023/04/22 18:57:39 by ctw02485         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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