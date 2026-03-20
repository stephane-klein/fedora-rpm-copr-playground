#!/bin/bash
set -e

VERSION="1.0.0"
TOPDIR="$(pwd)/rpmbuild"

rm -rf "$TOPDIR"
mkdir -p "$TOPDIR"/{BUILD,RPMS,SRPMS,SOURCES,SPECS}

echo "Creating source archive..."
mkdir -p "$TOPDIR/SOURCES/hello-golang-$VERSION"
cp main.go go.mod "$TOPDIR/SOURCES/hello-golang-$VERSION/"
tar -czf "$TOPDIR/SOURCES/hello-golang-$VERSION.tar.gz" -C "$TOPDIR/SOURCES" "hello-golang-$VERSION"

echo "Building SRPM..."
rpmbuild --define "_topdir $TOPDIR" -bs rpm/hello-golang.spec

echo ""
echo "SRPM built successfully!"
echo "SRPM: $TOPDIR/SRPMS/"
ls -la "$TOPDIR/SRPMS/"*.src.rpm
