#!/bin/bash
set -e
VERSION=$(grep "^Version:" rpm/hello-bash.spec | awk '{print $2}')
tar -czf rpm/hello-bash-$VERSION.tar.gz \
    --transform "s|^|hello-bash-$VERSION/|" \
    hello-bash hello-bash2 doc.txt
echo rpm/hello-bash-$VERSION.tar.gz
