FROM debian:bookworm-slim

RUN	apt update && \
	apt upgrade -y && \
	apt install -y mariadb-server && \
	rm -fr /var/lib/apt/lists/*

COPY launch_mariadb.sh launch_mariadb.sh
RUN chmod +x launch_mariadb.sh

EXPOSE 3306
CMD ["mysqld"]
ENTRYPOINT ["./launch_mariadb.sh"]
