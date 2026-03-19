#!/bin/bash
set -e

# first build SRPM package
./build.sh 

copr-cli build "hello-bash" ./rpmbuild/SRPMS/hello-bash-1.0.0-1.fc42.src.rpm
