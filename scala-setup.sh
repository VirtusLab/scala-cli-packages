#!/usr/bin/env bash
set -eu

SCALA_CLI_BASE_URL="https://github.com/Virtuslab/scala-cli/releases/latest/download/"

UNAME="$(uname)"

architecture() {

    case "$UNAME" in
        Linux)
            OS_NAME=pc-linux
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

URL="${SCALA_CLI_BASE_URL}/scala-cli-x86_64-${OS_NAME}.gz"
TMP_DIR="$(mktemp -d)"

SCALA_CLI_ARCHIVE="${TMP_DIR}/scala-cli.gz"
SCALA_CLI_BIN_FILE="${TMP_DIR}/scala-cli"

curl -fLo ${SCALA_CLI_ARCHIVE} $URL
gzip -d ${SCALA_CLI_ARCHIVE}
chmod +x ${SCALA_CLI_BIN_FILE}
"${SCALA_CLI_BIN_FILE}" install-home --scala-cli-binary-path ${SCALA_CLI_BIN_FILE}
rm ${SCALA_CLI_BIN_FILE}

case "$UNAME" in
    Linux)
        echo "'~/.profile' has been updated"
        echo "To make scala-cli visible, you have to start a new login shell"
        ;;
    Darwin)
        echo "If scala-cli is not visible, just open new terminal"
        ;;
esac