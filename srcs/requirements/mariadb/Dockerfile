FROM debian:bookworm-slim

RUN	apt update && \
	apt upgrade -y && \
	apt install -y mariadb-server

COPY conf/custom.cnf /etc/mysql/mariadb.conf.d/custom.cnf
COPY launch_mariadb.sh launch_mariadb.sh

RUN chmod +x launch_mariadb.sh

ENTRYPOINT ["./launch_mariadb.sh"]
