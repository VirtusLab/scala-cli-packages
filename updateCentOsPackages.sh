#!/usr/bin/env bash
set -euo pipefail

# from https://github.com/Virtuslab/scala-cli/blob/master/.github/scripts/gpg-setup.sh

echo "$PGP_SECRET" | base64 --decode | gpg --import --no-tty --batch --yes

echo "allow-loopback-pinentry
allow-preset-passphrase" >>~/.gnupg/gpg-agent.conf
echo "pinentry-mode loopback" >>~/.gnupg/gpg.conf

gpg-connect-agent reloadagent /bye

yum install rpm-sign  createrepo -y

# https://unix.stackexchange.com/questions/328601/rpmsign-with-cli-password-prompt
# Derive keygrip(s) from the imported secret key so we don't need a $KEYGRIP secret.
KEYGRIPS=$(gpg --batch --with-colons --with-keygrip --list-secret-keys "$GPG_EMAIL" \
  | awk -F: '/^grp:/ {print $10}')

for kg in $KEYGRIPS; do
  /usr/libexec/gpg-preset-passphrase --passphrase "${PGP_PASSPHRASE}" --preset "$kg"
done

GPG_NAME="_gpg_name $GPG_EMAIL"
rpmsign --define "$GPG_NAME" --addsign ./CentOS/Packages/*.rpm

createrepo ./CentOS/Packages
