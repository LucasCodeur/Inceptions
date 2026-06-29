FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server
RUN chmod ugo+x launch.sh

COPY launch.sh launch.sh

EXPOSE 3306

ENTRYPOINT ["./launch.sh"]
