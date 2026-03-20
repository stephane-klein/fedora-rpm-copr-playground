#!/bin/bash
set -e

COPR_PROJECT="hello-bash"

copr-cli create "$COPR_PROJECT" \
    --description "A simple Hello World Bash script packaged as an RPM (auto-build on tags)" \
    --chroot fedora-42-x86_64 \
    --chroot fedora-43-x86_64 \
    --chroot fedora-44-x86_64

copr-cli add-package-scm "$COPR_PROJECT" \
    --name hello-bash \
    --clone-url https://github.com/stephane-klein/fedora-rpm-copr-playground.git \
    --commit bash \
    --subdir . \
    --spec rpm/hello-bash.spec \
    --type git \
    --method make_srpm

echo ""
echo "Project '$COPR_PROJECT' created with SCM package configured!"
echo ""
echo "Configuration:"
echo "  - Branch monitored: bash"
echo "  - Build trigger: new tags"
echo ""
echo "To trigger a build automatically:"
echo "  git tag -a v1.0.1 -m 'Release 1.0.1'"
echo "  git push origin bash --tags"
echo ""
echo "Project URL: https://copr.fedorainfracloud.org/coprs/stephaneklein/$COPR_PROJECT/"
