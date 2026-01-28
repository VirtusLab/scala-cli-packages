#!/usr/bin/env bash
set -eu

SCALA_CLI_VERSION="1.12.1"

if [ $# -ge 1 ] && [ "$1" = "--version" ] ; then
  shift
  if [ $# -ge 1 ] ; then 
    SCALA_CLI_VERSION="$1"
    shift
  fi
fi

SCALA_CLI_BASE_URL="https://github.com/VirtusLab/scala-cli/releases/download/v$SCALA_CLI_VERSION"

UNAME="$(uname)"
OS_ARCH="x86_64"

architecture() {

    case "$UNAME" in
        Linux)
            OS_NAME=pc-linux
            if [ "$(uname -m)" = "aarch64" ]; then
              OS_ARCH="aarch64"
            fi
            ;;
        Darwin)
            OS_NAME=apple-darwin
            ;;
        *)
            printf "unrecognized OS type: $UNAME\n"
            exit 1
            ;;
    esac
}

architecture

URL="${SCALA_CLI_BASE_URL}/scala-cli-${OS_ARCH}-${OS_NAME}.gz"
TMP_DIR="$(mktemp -d)"

SCALA_CLI_ARCHIVE="${TMP_DIR}/scala-cli.gz"
SCALA_CLI_BIN_FILE="${TMP_DIR}/scala-cli"

curl -fLo ${SCALA_CLI_ARCHIVE} $URL
gzip -d ${SCALA_CLI_ARCHIVE}
chmod +x ${SCALA_CLI_BIN_FILE}

if [ -t 1 ]; then
    # stdout is a tty
    "${SCALA_CLI_BIN_FILE}" install-home --scala-cli-binary-path ${SCALA_CLI_BIN_FILE} "$@" < /dev/tty
else 
    "${SCALA_CLI_BIN_FILE}" install-home --scala-cli-binary-path ${SCALA_CLI_BIN_FILE} "$@"
fi

rm ${SCALA_CLI_BIN_FILE}
