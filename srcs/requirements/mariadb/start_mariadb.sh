# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mariadb.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctw02485 <ctw02485@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/07 00:26:43 by gleal             #+#    #+#              #
#    Updated: 2023/04/22 19:44:32 by ctw02485         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service mysql start

mysql -u root --skip-password << HERE
CREATE DATABASE database_wp;
GRANT ALL PRIVILEGES ON database_wp.* TO 'root'@'localhost';
update mysql.user set plugin = 'mysql_native_password' where user='root';
FLUSH PRIVILEGES;
SHOW DATABASES;
CREATE TABLE database_wp.todo_list (item_id INT AUTO_INCREMENT, content VARCHAR(255), PRIMARY KEY(item_id));
INSERT INTO  database_wp.todo_list (content) VALUES ("My first important item");
INSERT INTO  database_wp.todo_list (content) VALUES ("My second important item");
INSERT INTO  database_wp.todo_list (content) VALUES ("My third important item");
INSERT INTO  database_wp.todo_list (content) VALUES ("My fourth important item");
SELECT * FROM database_wp.todo_list;
HERE

service mysql status