#VERSION=1.3
FROM wolxxxy/phpbase-node26:latest
ARG phpVersion="8.0"

RUN apt install -y \
    apache2 \
    apache2-dev \
    apache2-utils \
    apachetop \
    libapache2-mod-php$phpVersion \
    mycli \
    mysql-client \
    php$phpVersion \
    php$phpVersion-bcmath \
    php$phpVersion-cli \
    php$phpVersion-common \
    php$phpVersion-curl \
    php$phpVersion-dev \
    php$phpVersion-gd \
    php$phpVersion-gmp \
    php$phpVersion-imagick \
    php$phpVersion-imap \
    php$phpVersion-intl \
    php$phpVersion-ldap \
    php$phpVersion-mbstring \
    php$phpVersion-mysql \
    php$phpVersion-opcache \
    php$phpVersion-readline \
    php$phpVersion-soap \
    php$phpVersion-tidy \
    php$phpVersion-xml \
    php$phpVersion-xmlrpc \
    php$phpVersion-xsl \
    php$phpVersion-zip

RUN a2enmod headers rewrite

COPY assets/fixPHP.sh /usr/local/bin/fixPHP.sh
RUN chmod +x /usr/local/bin/fixPHP.sh && /usr/local/bin/fixPHP.sh

RUN sed -i '/opcache.enable=/c\opcache.enable = 1' "/etc/php/$phpVersion/apache2/php.ini"

COPY assets/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN mkdir -p "/var/log/apache2"
RUN touch /var/log/apache2/error.log && touch /var/log/apache2/access.log && chmod -R 777 /var/log/apache2

WORKDIR /var/www

CMD ["apachectl", "-D", "FOREGROUND"]