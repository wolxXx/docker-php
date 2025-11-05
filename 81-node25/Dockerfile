#VERSION=1.3
FROM wolxxxy/phpbase-node25:latest
ARG phpVersion="8.1"

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
    php$phpVersion-xdebug \
    php$phpVersion-xml \
    php$phpVersion-xmlrpc \
    php$phpVersion-xsl \
    php$phpVersion-zip

RUN a2enmod headers rewrite

RUN wget https://raw.githubusercontent.com/wolxXx/toolz/main/fixPHP.sh && chmod +x fixPHP.sh && ./fixPHP.sh

RUN sed -i '/opcache.enable=/c\opcache.enable = 1' "/etc/php/$phpVersion/apache2/php.ini"

RUN wget https://getcomposer.org/download/latest-stable/composer.phar && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www

CMD ["apachectl", "-D", "FOREGROUND"]