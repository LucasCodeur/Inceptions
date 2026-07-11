FROM debian:bookworm-slim

RUN apt update -y

RUN apt upgrade -y
RUN apt install php php-fpm php-mysql php-xml php-curl php-gd php-mbstring php-zip -y
RUN apt install wordpress -y

COPY launch.sh launch.sh

EXPOSE 9000

ENTRYPOINT ["./launch.sh"]
