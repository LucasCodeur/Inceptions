FROM debian:bookworm-slim

RUN apt update -y
RUN apt upgrade -y
RUN apt install php php-fpm php-mysql php-curl php-imagick php-mbstring php-xml php-zip php-igbinary php-intl php-redis -y
RUN apt install zip -y
RUN apt install wget -y
RUN apt install curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown root:root /usr/local/bin/wp
RUN wp --info
# RUN wp core download --path=wpclidemo.dev
# RUN cd wpclidemo.dev
# RUN wp config create --dbname=wpclidemo --dbuser=root --prompt=dbpass
# RUN wp db create
# RUN wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org
# RUN wp plugin update --all

COPY launch.sh launch.sh

EXPOSE 9000

ENTRYPOINT ["./launch.sh"]
