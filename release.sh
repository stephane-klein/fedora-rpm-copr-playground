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

SPEC_FILE="rpm/hello-bash.spec"
HELLO_SCRIPT="hello-bash"

sed -i "s/^Version:.*/Version:        $VERSION_NUM/" "$SPEC_FILE"
sed -i "s/^VERSION=\".*\"/VERSION=\"$VERSION_NUM\"/" "$HELLO_SCRIPT"

git add "$SPEC_FILE" "$HELLO_SCRIPT"
git commit -m "Release version $VERSION_NUM"
git tag -a "$VERSION" -m "Release version $VERSION_NUM"

echo ""
echo "Release $VERSION created successfully!"
echo ""
echo "To push to remote, run:"
echo "  git push origin bash-multifiles --tags"
