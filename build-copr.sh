#!/bin/bash
set -e

# first build SRPM package
rm -rf ./rpmbuild/SRPMS/*.src.rpm
./build.sh 

SRPM_PATH=$(ls ./rpmbuild/SRPMS/*.src.rpm | head -n1)
copr-cli build "hello-bash" "$SRPM_PATH"
