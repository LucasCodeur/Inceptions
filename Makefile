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

export_k:
	export SSLKEYLOGFILE="/home/lud-adam/sslkeylog.log"

decrypt:
	editcap --inject-secrets tls,/home/lud-adam/sslkeylog.log /home/lud-adam/Downloads/prout.pcapng /home/lud-adam/Downloads/tls-encrypt-w-keys.pcapng
