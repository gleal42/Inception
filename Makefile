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

re:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

.PHONY: all start stop clean fclean re