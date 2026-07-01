FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server mariadb-client galera-4
RUN apt-get install -y systemd systemd-sysv 

COPY launch_maria_db.sh launch_maria_db.sh

RUN chmod u+x launch_maria_db.sh

ENTRYPOINT ["./launch_maria_db.sh"]
