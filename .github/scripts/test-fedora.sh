#!/usr/bin/env bash
set -euo pipefail

docker build -t scala-cli-fedora -f .github/scripts/docker/FedoraDockerFile .
docker run --rm scala-cli-fedora -e 'println("Hello World")'
