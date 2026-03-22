#!/bin/bash
set -e

TOPDIR="$(pwd)/rpmbuild"

mkdir -p "$TOPDIR"/{BUILD,RPMS,SRPMS,SOURCES,SPECS}

echo "Copying source to SOURCES..."
cp hello-bash hello-bash2 doc.txt "$TOPDIR/SOURCES/"

echo "Building RPM..."
rpmbuild --define "_topdir $TOPDIR" -ba rpm/hello-bash.spec

echo ""
echo "Build complete!"
echo "RPM: $TOPDIR/RPMS/noarch/"
