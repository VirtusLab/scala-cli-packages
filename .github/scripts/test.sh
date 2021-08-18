#!/usr/bin/env bash
set -eu

docker build -t scala-cli-alpine -f docker/AlpineDockerFile . 
docker run scala-cli-alpine about

docker build -t scala-cli-ubuntu -f docker/UbuntuDockerFile . 
docker run scala-cli-ubuntu about

docker build -t scala-cli-fedora -f docker/FedoraDockerFile . 
docker run scala-cli-fedora about