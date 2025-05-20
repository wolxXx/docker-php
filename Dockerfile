#VERSION=1.2
ARG ubuntuVersion="24.04"

FROM ubuntu:$ubuntuVersion

ARG nodeVersion="22"
ARG phpVersion="8.4"

RUN apt update && apt install -y  \
    bash-completion  \
    btop  \
    cron  \
    curl  \
    git  \
    htop  \
    inetutils-ping  \
    net-tools  \
    rsync  \
    software-properties-common  \
    tzdata  \
    unzip \
    vim  \
    wget  \
    wget
ENV TZ="Europe/Berlin"


RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir './fnm' \
&& cp ./fnm/fnm /usr/bin && fnm install $nodeVersion

RUN ln -s /root/.local/share/fnm/node-versions/*/installation/bin/* /usr/local/bin/.

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/apache2

RUN apt update
RUN apt dist-upgrade -y

# https://getcomposer.org/doc/03-cli.md#bash-completions: RUN php composer.phar completion bash > /etc/bash_completion.d/composer // get via wget!
RUN wget https://raw.githubusercontent.com/wolxXx/toolz/main/composer_auto_complete.sh && mv composer_auto_complete.sh /etc/bash_completion.d/composer
RUN echo ". /etc/bash_completion" >> /root/.bashrc