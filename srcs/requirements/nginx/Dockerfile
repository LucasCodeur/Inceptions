FROM debian:bookworm-slim

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

RUN apt update -y

RUN apt upgrade -y

RUN apt install nginx -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
