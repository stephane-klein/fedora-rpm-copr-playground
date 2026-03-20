#!/bin/bash
set -e

COPR_PROJECT="hello-golang"

copr-cli create "$COPR_PROJECT" \
    --description "A simple Hello World Go application packaged as an RPM" \
    --chroot fedora-42-x86_64 \
    --chroot fedora-43-x86_64 \
    --chroot fedora-44-x86_64

copr-cli add-package-scm "$COPR_PROJECT" \
    --name hello-golang \
    --clone-url https://github.com/stephane-klein/fedora-rpm-copr-playground.git \
    --commit golang \
    --subdir . \
    --spec rpm/hello-golang.spec \
    --type git \
    --method make_srpm \
    --webhook-rebuild on

echo ""
echo "Project '${COPR_PROJECT}' created with SCM package configured!"
echo ""
echo "To trigger automatic builds with GitHub Actions:"
echo ""
echo "1. Go to your COPR project integrations page:"
echo "   https://copr.fedorainfracloud.org/coprs/stephaneklein/${COPR_PROJECT}/integrations/"
echo ""
echo "2. Click on 'Custom webhook' and copy the webhook URL"
echo ""
echo "3. Update the URL in .github/workflows/trigger-copr-build.yml"
echo ""
echo "4. Push a tag to the 'golang' branch:"
echo ""
echo "   git tag -a v1.0.0 -m 'Release version 1.0.0'"
echo "   git push origin golang --tags"
echo ""
echo "Project URL: https://copr.fedorainfracloud.org/coprs/stephaneklein/${COPR_PROJECT}/"
