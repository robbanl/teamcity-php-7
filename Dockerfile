FROM php:7-cli

LABEL maintainer="robert@codepeak.se"

RUN apt update ; apt install -y libzip-dev libicu-dev
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install exif
RUN docker-php-ext-install zip
RUN docker-php-ext-install intl

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php", "-a"]
