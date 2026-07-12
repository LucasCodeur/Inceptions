FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install php php-fpm php-mysql php-xml php-curl php-gd php-mbstring php-zip -y
RUN apt install zip -y
RUN apt install wget -y
RUN apt install curl -y
RUN wget https://fr.wordpress.org/wordpress-latest-fr_FR.zip
RUN unzip wordpress-latest-fr_FR.zip -d /var/www 

COPY launch.sh launch.sh

EXPOSE 9000

ENTRYPOINT ["./launch.sh"]
