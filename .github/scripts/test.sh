#!/usr/bin/env bash
set -eu

docker build -t scala-cli-alpine -f .github/scripts/docker/AlpineDockerFile . 
docker run scala-cli-alpine about

docker build -t scala-cli-ubuntu -f .github/scripts/docker/UbuntuDockerFile . 
docker run scala-cli-ubuntu about

docker build -t scala-cli-fedora -f .github/scripts/docker/FedoraDockerFile . 
docker run scala-cli-fedora about