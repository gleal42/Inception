all: start

start:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up

stop:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env down

clean:
	docker rm $(docker container ls -qa)
	docker rmi $(docker images -q -a )
	docker volume rm $(docker volume ls -q)

fclean: stop
	docker system prune --force --volumes
	docker network prune --force
	docker volume prune --force

re: fclean
	docker volume rm srcs_wordpress_data
	docker volume rm srcs_mariadb_data
	sudo rm -rf data/wordpress/*
	sudo rm -rf data/mysql/*
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build


.PHONY: all start stop clean fclean re