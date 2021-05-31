FROM php:7-cli

LABEL maintainer="robert@codepeak.se"

RUN apt update ; apt install -y libzip-dev libicu-dev libxml2-dev libpng-dev libxslt-dev
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install exif
RUN docker-php-ext-install zip
RUN docker-php-ext-install intl
RUN docker-php-ext-install soap
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd
RUN docker-php-ext-install xsl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install sockets

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php", "-a"]
