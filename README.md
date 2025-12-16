# docker-php

thanks to ondrej (https://deb.sury.org/), there is a way to install 
nearly every php version on a debian-based operating system

as mostly all php projects need some extension, composer,  
node js, and some minor ini tweaks, i wanted to have an image
that brings those requirements

you can use
image: wolxxxy/php84:lastest
or
image: wolxxxy/php84:1.2

in your docker compose file or in your docker run script

for running cron jobs, there are cron containers.
just php cli and https://github.com/aptible/supercronic installed

for production environments, there are noxdebug variants available.
these variants do not include the xdebug extension, resulting in better performance.
use the tag schema: version-nodeversion-noxdebug (e.g., php85-node25-noxdebug) 


links to dockerhub: 
## PHP8X
- https://hub.docker.com/r/wolxxxy/php85 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php85-node25
  - https://hub.docker.com/r/wolxxxy/php85-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-node24
  - https://hub.docker.com/r/wolxxxy/php85-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-node23
  - https://hub.docker.com/r/wolxxxy/php85-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-node22
  - https://hub.docker.com/r/wolxxxy/php85-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-node21
  - https://hub.docker.com/r/wolxxxy/php85-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-node20
  - https://hub.docker.com/r/wolxxxy/php85-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-noxdebug
  - https://hub.docker.com/r/wolxxxy/php85-cron
- https://hub.docker.com/r/wolxxxy/php84 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php84-node25
  - https://hub.docker.com/r/wolxxxy/php84-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-node24
  - https://hub.docker.com/r/wolxxxy/php84-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-node23
  - https://hub.docker.com/r/wolxxxy/php84-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-node22
  - https://hub.docker.com/r/wolxxxy/php84-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-node21
  - https://hub.docker.com/r/wolxxxy/php84-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-node20
  - https://hub.docker.com/r/wolxxxy/php84-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-noxdebug
  - https://hub.docker.com/r/wolxxxy/php84-cron
- https://hub.docker.com/r/wolxxxy/php83 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php83-node25
  - https://hub.docker.com/r/wolxxxy/php83-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-node24
  - https://hub.docker.com/r/wolxxxy/php83-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-node23
  - https://hub.docker.com/r/wolxxxy/php83-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-node22
  - https://hub.docker.com/r/wolxxxy/php83-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-node21
  - https://hub.docker.com/r/wolxxxy/php83-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-node20
  - https://hub.docker.com/r/wolxxxy/php83-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-noxdebug
  - https://hub.docker.com/r/wolxxxy/php83-cron
- https://hub.docker.com/r/wolxxxy/php82 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php82-node25
  - https://hub.docker.com/r/wolxxxy/php82-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-node24
  - https://hub.docker.com/r/wolxxxy/php82-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-node23
  - https://hub.docker.com/r/wolxxxy/php82-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-node22
  - https://hub.docker.com/r/wolxxxy/php82-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-node21
  - https://hub.docker.com/r/wolxxxy/php82-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-node20
  - https://hub.docker.com/r/wolxxxy/php82-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-noxdebug
  - https://hub.docker.com/r/wolxxxy/php82-cron
- https://hub.docker.com/r/wolxxxy/php81 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php81-node25
  - https://hub.docker.com/r/wolxxxy/php81-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-node24
  - https://hub.docker.com/r/wolxxxy/php81-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-node23
  - https://hub.docker.com/r/wolxxxy/php81-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-node22
  - https://hub.docker.com/r/wolxxxy/php81-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-node21
  - https://hub.docker.com/r/wolxxxy/php81-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-node20
  - https://hub.docker.com/r/wolxxxy/php81-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-noxdebug
  - https://hub.docker.com/r/wolxxxy/php81-cron
- https://hub.docker.com/r/wolxxxy/php80 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php80-node25
  - https://hub.docker.com/r/wolxxxy/php80-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-node24
  - https://hub.docker.com/r/wolxxxy/php80-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-node23
  - https://hub.docker.com/r/wolxxxy/php80-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-node22
  - https://hub.docker.com/r/wolxxxy/php80-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-node21
  - https://hub.docker.com/r/wolxxxy/php80-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-node20
  - https://hub.docker.com/r/wolxxxy/php80-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-noxdebug
  - https://hub.docker.com/r/wolxxxy/php80-cron

## PHP7X
- https://hub.docker.com/r/wolxxxy/php74 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php74-node25
  - https://hub.docker.com/r/wolxxxy/php74-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-node24
  - https://hub.docker.com/r/wolxxxy/php74-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-node23
  - https://hub.docker.com/r/wolxxxy/php74-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-node22
  - https://hub.docker.com/r/wolxxxy/php74-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-node21
  - https://hub.docker.com/r/wolxxxy/php74-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-node20
  - https://hub.docker.com/r/wolxxxy/php74-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php74-noxdebug
- https://hub.docker.com/r/wolxxxy/php73 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php73-node25
  - https://hub.docker.com/r/wolxxxy/php73-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-node24
  - https://hub.docker.com/r/wolxxxy/php73-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-node23
  - https://hub.docker.com/r/wolxxxy/php73-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-node22
  - https://hub.docker.com/r/wolxxxy/php73-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-node21
  - https://hub.docker.com/r/wolxxxy/php73-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-node20
  - https://hub.docker.com/r/wolxxxy/php73-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php73-noxdebug
- https://hub.docker.com/r/wolxxxy/php72 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php72-node25
  - https://hub.docker.com/r/wolxxxy/php72-node25-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-node24
  - https://hub.docker.com/r/wolxxxy/php72-node24-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-node23
  - https://hub.docker.com/r/wolxxxy/php72-node23-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-node22
  - https://hub.docker.com/r/wolxxxy/php72-node22-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-node21
  - https://hub.docker.com/r/wolxxxy/php72-node21-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-node20
  - https://hub.docker.com/r/wolxxxy/php72-node20-noxdebug
  - https://hub.docker.com/r/wolxxxy/php72-noxdebug
- https://hub.docker.com/r/wolxxxy/php71 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php71-noxdebug
- https://hub.docker.com/r/wolxxxy/php70 (with latest node version installed)
  - https://hub.docker.com/r/wolxxxy/php70-noxdebug

## PHP6X
- https://www.wiley.com/en-us/Professional+PHP6-p-9780470395097

## PHP5X
- https://hub.docker.com/r/wolxxxy/php56
  - https://hub.docker.com/r/wolxxxy/php56-noxdebug
