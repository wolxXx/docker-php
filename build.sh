#!/bin/bash

set -e
set -o errexit
set -o pipefail

HERE=$(dirname $(readlink -f $0));
cd "$HERE" || exit 1;

directories=("85" "84" "83" "82" "81" "80" "74" "73" "72" "71" "70" "56");

docker build --no-cache --compress -t "wolxxxy/phpbase:1.0" -t "wolxxxy/phpbase:latest" .

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

for dir in "${directories[@]}"; do
  build "$dir" &
done

exit 0;