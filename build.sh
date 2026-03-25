#!/bin/bash
set -e

TOPDIR="$(pwd)/rpmbuild"
VERSION=$(grep "^Version:" rpm/hello-bash.spec | awk '{print $2}')

mkdir -p "$TOPDIR"/{BUILD,RPMS,SRPMS,SOURCES,SPECS}

echo "Creating archive..."
tar -czf "$TOPDIR/SOURCES/hello-bash-$VERSION.tar.gz" \
    --transform "s|^|hello-bash-$VERSION/|" \
    hello-bash hello-bash2 doc.txt

echo "Building RPM..."
rpmbuild --define "_topdir $TOPDIR" -ba rpm/hello-bash.spec

echo ""
echo "Build complete!"
echo "RPM: $TOPDIR/RPMS/noarch/"
