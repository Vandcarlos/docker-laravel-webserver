FROM php:7.2-fpm

RUN apt update

# mysql pdo suport
RUN docker-php-ext-install pdo pdo_mysql

# nginx
RUN apt install nginx -y
RUN service nginx start

# sudo
RUN apt install sudo -y

# git
RUN apt install -y git

# zip and unzip
RUN apt install -y zip unzip

# composer
# COPY --from=composer:1.5 /usr/bin/composer /usr/bin/composer
RUN curl https://getcomposer.org/download/1.7.3/composer.phar -o /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# james :D
RUN useradd -m -d /home/james james
RUN grep -q -F 'james ALL=(ALL) NOPASSWD: ALL' /etc/sudoers \
|| echo 'james ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER james

WORKDIR /code
EXPOSE 80
