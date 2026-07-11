FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install php php-fpm php-mysql php-xml php-curl php-gd php-mbstring php-zip -y
RUN 	apt install wordpress -y && \
	mkdir -p /var/www/html/sample.com && \
	cd /tmp && \
	wget https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz && \
	mv /tmp/wordpress/* /var/www/html/sample.com/ && \
	chown -R www-data: /var/www/html/sample.com && \

COPY launch.sh launch.sh

EXPOSE 9000

ENTRYPOINT ["./launch.sh"]
