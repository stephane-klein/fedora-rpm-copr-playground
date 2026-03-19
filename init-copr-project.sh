#!/bin/bash
set -e

COPR_PROJECT="hello-bash"

copr-cli create hello-bash\
    --description "A simple Hello World Bash script packaged as an RPM" \
    --chroot fedora-42-x86_64 \
    --chroot fedora-43-x86_64 \
    --chroot fedora-44-x86_64
