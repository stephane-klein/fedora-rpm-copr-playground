# hello-bash

A simple "Hello World" Bash script packaged as an RPM for Fedora COPR.

You are on the `bash` Git branch. See the [main branch](https://github.com/stephane-klein/fedora-rpm-copr-playground) for a complete project overview.

## Prerequisites

This project has been tested on **Fedora 42**.

To build the RPM package locally, you need to install the following dependencies:

```bash
$ sudo dnf install rpm-build rpmdevtools rpmlint
```

- `rpm-build` - Tools for building RPM packages
- `rpmdevtools` - Development utilities for RPM packaging
- `rpmlint` - Linter for checking RPM spec files (optional but recommended)

## Building locally

```bash
$ ./build.sh
...

Build complete!
RPM: ./rpmbuild/RPMS/noarch/
```

The resulting RPM will be available in `./rpmbuild/RPMS/noarch/`.

Next, you can install the package with:

```bash
$ sudo rpm -ivh ./rpmbuild/RPMS/noarch/hello-bash-1.0.0-1.fc42.noarch.rpm

...

$ rehash
$ hello-bash  # Test the installed script
Hello World

$ sudo rpm --erase hello-bash # Uninstall the package
```


## Build RPM package in COPR

To build the RPM package in **Copr**, you also need:

```bash
$ sudo dnf install copr-cli
```

- `copr-cli` - Command-line client for Copr build system

### Authenticate to COPR

1. Log in to [Copr](https://copr.fedorainfracloud.org) with your Fedora Account System (FAS) credentials.
2. Generate an API token:
   - Go to your [Account Settings](https://copr.fedorainfracloud.org/api)
   - Click on "Generate Token" under "API token"
   - Copy the generated token
3. Configure `copr-cli` with your credentials:

   ```bash
   $ copr-cli login
   Username: stephaneklein
   Password: your_api_token
   ```

   Your credentials will be saved to `~/.config/copr` for future use.

### Initialize the Copr Project

Run the initialization script to create the `hello-bash` project in Copr:

```bash
$ ./init-copr-project.sh
New project was successfully created: https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/
Create or edit operation was successful.

Project 'hello-bash' created with SCM package configured!

Webhook is enabled. To complete the setup:

1. Go to your COPR project settings:
   https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/integrations/

2. Copy the webhook URL (format:
   https://copr.fedorainfracloud.org/webhooks/github/<ID>/<UUID>/)

3. Configure GitHub webhook:
   - Go to: Settings > Webhooks > Add webhook
   - Payload URL: <your_copr_webhook_url>
   - Content type: application/json
   - Events: select 'Branch or tag creation'

Project URL: https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/
```

This will create a public project named `hello-bash` with the Fedora 42 chroot enabled.

Your project will be available at: `https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash`

### Building in Copr (manual)

```bash
$ ./build-copr.sh
Building in Copr...
Created builds: https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash
```

The resulting RPM will be available at <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/>.

Install COPR package:

```bash
$ sudo dnf copr enable -y stephaneklein/hello-bash
$ sudo dnf install -y hello-bash
$ hello-bash
Hello World

$ sudo dnf remove -y hello-bash
```

### Automatic Builds with Webhooks

This project uses GitHub webhooks to trigger automatic COPR builds when new tags are pushed.

**Setup Steps:**

1. **Get your COPR webhook URL:**
   - Go to: <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/integrations/>
   - Copy the webhook URL (format: `https://copr.fedorainfracloud.org/webhooks/github/<ID>/<UUID>/`)

2. **Configure GitHub webhook:**
   - Go to your GitHub repo: **Settings** > **Webhooks** > **Add webhook**
   - **Payload URL**: Paste the COPR webhook URL
   - **Content type**: `application/json`
   - **Events**: Select **Branch or tag creation** (for tags)

3. **Trigger a build:**

   ```bash
   git tag -a v1.0.1 -m "Release version 1.0.1"
   git push origin bash --tags
   ```

The build starts immediately (typically within 30 seconds) when the tag is pushed.

**Important Notes:**
- GitHub webhook sends notifications for all events (all branches)
- COPR filters events: only pushes to the `bash` branch trigger builds
- Tags must follow semver format (e.g., `v1.0.0`, `v2.1.3`)
- The tag prefix `v` is automatically stripped for the RPM version
- Monitor build status at: <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash>
