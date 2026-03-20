#!/bin/bash
set -e

rm -rf ./rpmbuild/SRPMS/*.src.rpm
./build-srpm.sh

SRPM_PATH=$(ls ./rpmbuild/SRPMS/*.src.rpm | head -n1)
echo "Uploading $SRPM_PATH to Copr..."
copr-cli build "hello-golang" "$SRPM_PATH"
