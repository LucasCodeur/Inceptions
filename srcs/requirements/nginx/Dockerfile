FROM debian:bookworm-slim

RUN apt update -y

RUN apt upgrade -y

RUN apt install nginx -y

RUN mkdir -p /var/log/nginx
RUN touch /var/log/nginx/access.log /var/log/nginx/error.log
RUN mkdir -p /etc/nginx/tls /var/www/html

COPY tls/server.crt /etc/nginx/tls/server.crt
COPY tls/server.key /etc/nginx/tls/server.key
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY launch.sh launch.sh 

RUN chmod 777 launch.sh

EXPOSE 80 443

ENTRYPOINT ["./launch.sh"]

