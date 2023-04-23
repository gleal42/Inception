FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

EXPOSE 3306

# mysql -u root --skip-password << HERE
# CREATE DATABASE database_wp;
# GRANT ALL PRIVILEGES ON database_wp.* TO 'root'@'localhost';
# update mysql.user set plugin = 'mysql_native_password' where user='root';
# FLUSH PRIVILEGES;
# SHOW DATABASES;
# CREATE TABLE database_wp.todo_list (item_id INT AUTO_INCREMENT, content VARCHAR(255), PRIMARY KEY(item_id));
# INSERT INTO  database_wp.todo_list (content) VALUES ("My first important item");
# INSERT INTO  database_wp.todo_list (content) VALUES ("My second important item");
# INSERT INTO  database_wp.todo_list (content) VALUES ("My third important item");
# INSERT INTO  database_wp.todo_list (content) VALUES ("My fourth important item");
# SELECT * FROM database_wp.todo_list;
# HERE

ENTRYPOINT [ "mariadb" ]
