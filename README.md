# docker-php

thanks to ondrej (https://deb.sury.org/), there is a way to install 
nearly every php version on a debian based operating system

as mostly all php projects need some extension, composer,  
node js, and some minor ini tweaks, i wanted to have an image
that brings those requirements

you can use
image: wolxxxy/php84:lastest
or
image: wolxxxy/php84:1.2

in your docker compose file or in your docker run script