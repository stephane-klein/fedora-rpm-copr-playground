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
    --method make_srpm \
    --webhook-rebuild on

echo ""
echo "Project '${COPR_PROJECT}' created with SCM package configured!"
echo ""
echo "Webhook is enabled. To complete the setup:"
echo ""
echo "1. Go to your COPR project settings:"
echo "   https://copr.fedorainfracloud.org/coprs/stephaneklein/${COPR_PROJECT}/integrations/"
echo ""
echo "2. Copy the webhook URL (format:"
echo "   https://copr.fedorainfracloud.org/webhooks/github/<ID>/<UUID>/)"
echo ""
echo "3. Configure GitHub webhook:"
echo "   - Go to: Settings > Webhooks > Add webhook"
echo "   - Payload URL: <your_copr_webhook_url>"
echo "   - Content type: application/json"
echo "   - Events: select 'Branch or tag creation'"
echo ""
echo "Note: GitHub sends webhook for all branches. COPR filters to 'bash' branch only."
echo ""
echo "Project URL: https://copr.fedorainfracloud.org/coprs/stephaneklein/${COPR_PROJECT}/"
