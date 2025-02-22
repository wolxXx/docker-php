#!/bin/bash

set -e
set -o errexit
set -o pipefail

HERE=$(dirname $(readlink -f $0));
cd "$HERE" || exit 1;

directories=("84" "83" "82" "81" "80" "74");

for dir in "${directories[@]}"; do
  cd "$HERE" || exit 1;
  cd "$dir" || exit 1;

  echo "Processing $dir..."

  VERSION=$(head -n 1 "Dockerfile" | cut -d '=' -f2)
  echo "Version found in $VERSION"
  
  docker build --no-cache --compress -t "wolxxxy/php$dir:$VERSION" .
  docker build --no-cache --compress -t "wolxxxy/php$dir:latest" .
  docker push "wolxxxy/php$dir:$VERSION"
  docker push "wolxxxy/php$dir:latest"

  echo "$dir completed.";
done

echo "all done";