include srcs/.env

VARIABLE = $(shell cat /etc/hosts | grep -c '$(DOMAIN_NAME)')
VOLUME_DIR := $(shell pwd)/data

all: start

hostexists:
ifeq ($(VARIABLE), 1)
	@echo "DOMAIN_NAME already in hosts (good)";
else
	@echo "Adding new domain to hosts";
	sudo -- sh -c "echo 127.0.0.1       $(DOMAIN_NAME) >> /etc/hosts"
endif

start: hostexists
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
	sudo rm -rf $(VOLUME_DIR)/wordpress/*
	sudo rm -rf $(VOLUME_DIR)/mysql/*
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

.PHONY: all start stop clean fclean re hostexists