#!/bin/bash
set -e

COPR_PROJECT="hello-bash-packit"

echo "Creating Copr project: $COPR_PROJECT"

copr-cli create "$COPR_PROJECT" \
    --description "A simple Hello World Bash script packaged as an RPM (auto-build with Packit)" \
    --instructions "Built automatically with Packit on GitHub releases" \
    --chroot fedora-42-x86_64 \
    --chroot fedora-43-x86_64 \
    --chroot fedora-44-x86_64

echo "Project created successfully!"

echo "Adding Packit permissions..."
copr-cli edit-permissions --builder packit --admin packit "$COPR_PROJECT"

echo ""
echo "✓ Project '$COPR_PROJECT' created with Packit permissions configured!"
echo ""
echo "Project URL: https://copr.fedorainfracloud.org/coprs/stephaneklein/$COPR_PROJECT/"
