# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctw02485 <ctw02485@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/05 23:24:47 by gleal             #+#    #+#              #
#    Updated: 2023/04/22 18:56:44 by ctw02485         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

CMD bash start_nginx.sh
