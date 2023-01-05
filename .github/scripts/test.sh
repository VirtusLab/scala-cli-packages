#!/usr/bin/env bash
set -eu

docker build -t scala-cli-alpine -f .github/scripts/docker/AlpineDockerFile . 
docker run scala-cli-alpine -e 'println("Hello World")'

docker build -t scala-cli-ubuntu -f .github/scripts/docker/DebianDockerFile .
docker run scala-cli-ubuntu -e 'println("Hello World")'

docker build -t scala-cli-fedora -f .github/scripts/docker/CentOSDockerFile .
docker run scala-cli-fedora -e 'println("Hello World")'