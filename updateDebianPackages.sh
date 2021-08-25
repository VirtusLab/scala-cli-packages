#!/usr/bin/env bash
set -euo pipefail

cd ./debian/

dpkg-scanpackages --multiversion . > Packages
  gzip -k -f Packages

apt-ftparchive release . > Release
echo ${PGP_PASSPHRASE} | gpg --batch --yes --passphrase-fd 0 --default-key "${KEYNAME}" -abs -o - Release > Release.gpg
echo ${PGP_PASSPHRASE} | gpg --batch --yes --passphrase-fd 0 --default-key "${KEYNAME}" --clearsign -o - Release > InRelease