#!/bin/bash
set -e

VERSION="1.0.10"
TOPDIR="$(pwd)/rpmbuild"

rm -rf "$TOPDIR"
mkdir -p "$TOPDIR"/{BUILD,RPMS,SRPMS,SOURCES,SPECS}

echo "Creating source archive..."
mkdir -p "$TOPDIR/SOURCES/hello-golang-$VERSION"
cp main.go go.mod "$TOPDIR/SOURCES/hello-golang-$VERSION/"
tar -czf "$TOPDIR/SOURCES/hello-golang-$VERSION.tar.gz" -C "$TOPDIR/SOURCES" "hello-golang-$VERSION"

echo "Building RPM..."
rpmbuild --define "_topdir $TOPDIR" -ba rpm/hello-golang.spec

echo ""
echo "Build complete!"
echo "RPM: $TOPDIR/RPMS/x86_64/"
