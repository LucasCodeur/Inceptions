FOLDER := ./srcs
ALL_DOCKER_VOLUME = $(shell docker ps -aq)

start:
	docker compose -f $(FOLDER)/docker-compose.yml up -d

fclean: armageddon removefolder

removecontainers:
	docker stop $(ALL_DOCKER_VOLUME)
	docker rm $(ALL_DOCKER_VOLUME)

armageddon: removecontainers
	docker system prune --all --volumes

removefolder:
	sudo rm -fr /home/lud-adam/data
	sudo mkdir /home/lud-adam/data
	sudo mkdir /home/lud-adam/data/wordpress-volume
	sudo mkdir /home/lud-adam/data/mariadb-volume
