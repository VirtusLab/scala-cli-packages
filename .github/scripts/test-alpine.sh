#!/usr/bin/env bash
set -euo pipefail

docker build -t scala-cli-alpine -f .github/scripts/docker/AlpineDockerFile .
docker run --rm scala-cli-alpine -e 'println("Hello World")'
