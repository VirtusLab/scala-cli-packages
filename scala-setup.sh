#!/usr/bin/env bash
set -eu

SCALA_CLI_BASE_URL="https://github.com/VirtuslabRnD/scala-cli/releases/latest/download/"

architecture() {
    
    UNAME="$(uname)"
    
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
mv ${SCALA_CLI_BIN_FILE} /usr/local/bin/scala-cli