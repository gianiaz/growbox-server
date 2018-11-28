FROM php:7.2.11-fpm-alpine3.8

MAINTAINER Giovanni Battista Lenoci <gianiaz@gmail.com>

RUN apk --no-cache add \
        bash \
        git \
        openssh-client \
        openssl-dev \
        nano \
        sudo \
        vim \
        wget \
        zsh \
 ## PHP-EXT
    && docker-php-ext-install -j5 \
        bcmath \
        mbstring \
        opcache \
        pcntl \
        zip \
    && docker-php-source delete

WORKDIR /var/www/growbox

RUN apk add --no-cache --virtual .xdebug-build-deps $PHPIZE_DEPS \
    && pecl install -o xdebug \
    && docker-php-ext-enable xdebug \
    && apk del .xdebug-build-deps \
    && pecl clear-cache \
    && docker-php-source delete

COPY conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

 ## Utente non-root (no sudo)
RUN adduser -D -u 1000 glenoci -G www-data -h /home/growbox \
    && chown -R glenoci /var/www/growbox \
 ## Composer
    && curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --filename=composer \
        --version 1.7.2

USER glenoci
RUN composer global require hirak/prestissimo --no-progress \
    && composer clear-cache

 ## configs
COPY etc /usr/local/etc/php/

 ## ZSH / OhMyZsh
COPY --chown=glenoci:www-data zsh/install-zsh.sh /home/growbox/install-zsh.sh
RUN chmod +x /home/growbox/install-zsh.sh \
    && /home/growbox/install-zsh.sh
COPY zsh/zsh-config.sh /home/growbox/.zshrc
ENV TERM xterm-256color
EXPOSE 9000


