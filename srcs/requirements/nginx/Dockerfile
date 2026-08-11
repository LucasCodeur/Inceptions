FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y

RUN mkdir -p /var/log/nginx
RUN mkdir -p /etc/nginx/tls /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY launch.sh launch.sh 

RUN chmod +x launch.sh

EXPOSE 443

ENTRYPOINT ["./launch.sh"]
