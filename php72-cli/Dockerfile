FROM php:7.2-cli
LABEL Author="Albert Montolio <albertmonro@gmail.com>" Description="Basic php 7.2 client image for console projects"

RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip

#Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

WORKDIR /usr/src/app

RUN PATH=$PATH:/usr/src/app/vendor/bin:bin

RUN echo "error_log /var/log/php_errors.log" >> "/usr/local/etc/php/conf.d/php.ini-production" \\
    && touch /var/log/php_errors.log

CMD ["tail", "-f", "/var/log/php_errors.log"]