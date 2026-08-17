#!/bin/bash

set -e
set -o errexit
set -o pipefail

HERE=$(dirname $(readlink -f $0));
cd "$HERE" || exit 1;

usage() {
    cat <<'EOF'
Usage: ./build.sh [OPTIONS]

Builds all Docker images defined in this repository and (by default) pushes
them to Docker Hub under the "wolxxxy/" namespace.

The script performs three stages:
  1. Builds the shared base image from Dockerfile-Base
     (tagged wolxxxy/base:1.0 and wolxxxy/base:latest).
  2. Builds all Node.js base images (Dockerfile-Node20..Node27) in parallel
     (tagged wolxxxy/phpbase-nodeNN:1.0 / :latest; Node26 is additionally
     tagged as wolxxxy/phpbase:latest, which is the default PHP base).
  3. Iterates over every top-level PHP variant directory (e.g. 85, 85-noxdebug,
     85-cron, 85-node24, ...) and builds wolxxxy/php<dir>:<VERSION> and
     wolxxxy/php<dir>:latest, running builds in parallel (see --parallel).
     The <VERSION> tag is read from the first line of each Dockerfile
     (format: "#VERSION=x.y.z").

Options:
  --no-push         Build all images locally but do NOT run "docker push".
                    Useful for local testing before publishing to Docker Hub.
                    Note: the base and node-base images (stages 1 and 2) are
                    never pushed by this script regardless of this flag.
  --parallel <N>    Number of PHP variant builds to run in parallel in stage 3.
                    Must be a positive integer. Default: 30.
  -h, --help        Show this help message and exit.

Examples:
  ./build.sh                        Build everything and push to Docker Hub.
  ./build.sh --no-push              Build everything locally without pushing.
  ./build.sh --parallel 8           Limit stage-3 concurrency to 8 builds.
  ./build.sh --no-push --parallel 4 Local test build with 4 parallel jobs.

Requirements:
  - A working Docker daemon.
  - For pushes: prior "docker login" against Docker Hub with write access
    to the wolxxxy/* repositories.
EOF
}

PUSH=1
PARALLEL=20
while [ $# -gt 0 ]; do
    case "$1" in
        --no-push) PUSH=0; shift ;;
        --parallel)
            if [ -z "${2:-}" ] || ! echo "$2" | grep -Eq '^[1-9][0-9]*$'; then
                echo "Option --parallel requires a positive integer argument." >&2
                exit 1
            fi
            PARALLEL="$2"; shift 2 ;;
        --parallel=*)
            val="${1#*=}"
            if ! echo "$val" | grep -Eq '^[1-9][0-9]*$'; then
                echo "Option --parallel requires a positive integer argument." >&2
                exit 1
            fi
            PARALLEL="$val"; shift ;;
        -h|--help) usage; exit 0 ;;
        *)
            echo "Unknown option: $1" >&2
            echo "Run './build.sh --help' for usage." >&2
            exit 1
            ;;
    esac
done
export PUSH

#build base
docker build --no-cache --compress -t "wolxxxy/base:1.0" -t "wolxxxy/base:latest" -f Dockerfile-Base .

#build node versions in parallel mode
docker build --no-cache --compress -t "wolxxxy/phpbase-node20:1.0" -t "wolxxxy/phpbase-node20:latest" -f Dockerfile-Node20 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node21:1.0" -t "wolxxxy/phpbase-node21:latest" -f Dockerfile-Node21 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node22:1.0" -t "wolxxxy/phpbase-node22:latest" -f Dockerfile-Node22 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node23:1.0" -t "wolxxxy/phpbase-node23:latest" -f Dockerfile-Node23 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node24:1.0" -t "wolxxxy/phpbase-node24:latest" -f Dockerfile-Node24 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node25:1.0" -t "wolxxxy/phpbase-node25:latest" -f Dockerfile-Node25 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node26:1.0" -t "wolxxxy/phpbase-node26:latest" -t "wolxxxy/phpbase:latest" -f Dockerfile-Node26 . &
docker build --no-cache --compress -t "wolxxxy/phpbase-node27:1.0" -t "wolxxxy/phpbase-node27:latest" -f Dockerfile-Node27 . &

#wait for node versions ready
wait

build(){
   cd "$HERE" || exit 1;
   cd "$1" || exit 1;

   echo "Processing $1..."

   VERSION=$(head -n 1 "Dockerfile" | cut -d '=' -f2)
   echo "Version found in $VERSION"

   docker build --no-cache --compress -t "wolxxxy/php$1:$VERSION" -t "wolxxxy/php$1:latest"  .
   if [ "$PUSH" = "1" ]; then
       docker push "wolxxxy/php$1:$VERSION"
       docker push "wolxxxy/php$1:latest"
   else
       echo "Skipping docker push for $1 (--no-push)"
   fi

   echo "$1 completed.";
}
export -f build

find . -maxdepth 1 -type d -not -name ".*" -printf "%f\n" | xargs -P "$PARALLEL" -I {} bash -c 'build "{}"'

exit 0;