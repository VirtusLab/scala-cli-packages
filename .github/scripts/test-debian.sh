#!/usr/bin/env bash
set -euo pipefail

docker build -t scala-cli-debian -f .github/scripts/docker/DebianDockerFile .
docker run --rm scala-cli-debian -e 'println("Hello World")'
