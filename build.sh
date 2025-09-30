#!/bin/bash

set -e
set -o errexit
set -o pipefail

HERE=$(dirname $(readlink -f $0));
cd "$HERE" || exit 1;

docker build --no-cache --compress -t "wolxxxy/base:1.0" -t "wolxxxy/base:latest" -f Dockerfile-Base .
docker build --no-cache --compress -t "wolxxxy/phpbase-node20:1.0" -t "wolxxxy/phpbase-node20:latest" -f Dockerfile-Node20 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node21:1.0" -t "wolxxxy/phpbase-node21:latest" -f Dockerfile-Node21 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node22:1.0" -t "wolxxxy/phpbase-node22:latest" -f Dockerfile-Node22 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node23:1.0" -t "wolxxxy/phpbase-node23:latest" -f Dockerfile-Node23 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node24:1.0" -t "wolxxxy/phpbase-node24:latest" -t "wolxxxy/phpbase:latest" -f Dockerfile-Node24 .
wait

build(){
   cd "$HERE" || exit 1;
   cd "$1" || exit 1;

   echo "Processing $1..."

   VERSION=$(head -n 1 "Dockerfile" | cut -d '=' -f2)
   echo "Version found in $VERSION"

   docker build --no-cache --compress -t "wolxxxy/php$1:$VERSION" -t "wolxxxy/php$1:latest"  .
   docker push "wolxxxy/php$1:$VERSION"
   docker push "wolxxxy/php$1:latest"

   echo "$1 completed.";
}

directories=($(find . -maxdepth 1 -type d -not -name ".*" -printf "%f\n"))

for dir in "${directories[@]}"; do
  build "$dir" &
done

exit 0;