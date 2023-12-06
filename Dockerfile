FROM php:7.4-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions  \
    pdo_mysql \
    mysqli \
    pgsql \
    pdo_pgsql \
    zip \

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN set -xe \
    && php --version \
    && php -m

ENTRYPOINT []
CMD ["php-fpm"]