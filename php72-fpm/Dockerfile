FROM php:7.2.18-fpm
LABEL Author="Albert Montolio <albertmonro@gmail.com>" Description="Basic php 7.2 fpm image for web apps"

##User creation
#ENV USER_PASSWORD test123
#RUN useradd -ms /bin/bash docker \
#    && usermod -u 1001 docker

#PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip-dev \
    zip \
    zlib1g-dev \
    libicu-dev \
    g++ \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable gd \
    && docker-php-ext-install pdo_mysql \
    && pecl install apcu-5.1.8 \
    && docker-php-ext-enable apcu

#Node & npm
ENV NODE_VERSION 8
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash \
    && apt-get install -y \
    git \
    nodejs \
    && apt-get clean

#Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

WORKDIR /usr/src/app


RUN PATH=$PATH:/usr/src/app/vendor/bin:bin