#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: ./release.sh <version>"
    echo "Example: ./release.sh v1.0.3"
    exit 1
fi

VERSION="$1"

if ! [[ "$VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version must be in format vX.Y.Z (e.g., v1.0.3)"
    exit 1
fi

VERSION_NUM="${VERSION#v}"

echo "Updating version to $VERSION_NUM in all files..."

sed -i "s/^VERSION=.*/VERSION=\"$VERSION_NUM\"/" build.sh
sed -i "s/^VERSION=.*/VERSION=\"$VERSION_NUM\"/" build-rpm-locally.sh
sed -i "s/^VERSION=.*/VERSION=\"$VERSION_NUM\"/" build-srpm.sh
sed -i "s/^version = .*/version = $VERSION_NUM/" .copr/Makefile
sed -i "s/^Version:.*/Version:        $VERSION_NUM/" rpm/hello-golang.spec

git add build.sh build-rpm-locally.sh build-srpm.sh .copr/Makefile rpm/hello-golang.spec
git commit -m "Release version $VERSION_NUM"
git tag -a "$VERSION" -m "Release version $VERSION_NUM"

echo ""
echo "Release $VERSION created successfully!"
echo ""
echo "To push to remote, run:"
echo "  git push origin golang --tags"
