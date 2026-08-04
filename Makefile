FOLDER := ./srcs
ALL_DOCKER_VOLUME = $(shell docker ps -aq)

start:
	docker compose -f $(FOLDER)/docker-compose.yml up -d
	firefox &

fclean: armageddon
	rm -fr /home/lud-adam/data
	mkdir /home/lud-adam/data
	mkdir /home/lud-adam/data/wordpress-volume
	mkdir /home/lud-adam/data/mariadb-volume

removecontainers:
	docker stop $(ALL_DOCKER_VOLUME)
	docker rm $(ALL_DOCKER_VOLUME)

armageddon:  removecontainers
	docker system prune --all --volumes
