FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install php php-fpm php-mysql php-curl php-imagick php-mbstring php-xml php-zip php-igbinary php-intl php-redis -y
RUN apt install zip -y
RUN apt install wget -y
RUN apt install curl -y

COPY launch.sh launch.sh

EXPOSE 9000

ENTRYPOINT ["./launch.sh"]
