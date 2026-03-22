# hello-bash

A simple "Hello World" Bash script packaged as an RPM for Fedora COPR.

Unlike the [`bash`](https://github.com/stephane-klein/fedora-rpm-copr-playground/tree/bash) branch which contains only one file, this variant groups 3 files together.

You are on the `bash-multifiles` Git branch. See the [main branch](https://github.com/stephane-klein/fedora-rpm-copr-playground) for a complete project overview.

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
Hello World 1.0.6

$ hello-bash2 # Test second script
Hello World 2

$ cat /usr/share/doc/hello-bash/doc.txt
Fake documentation.

$ sudo rpm --erase hello-bash # Uninstall the package
```


## Build SRPM package locally and upload it to COPR to build the RPM package

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

...
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

### Install the Copr package

Install COPR package:

```bash
$ sudo dnf copr enable -y stephaneklein/hello-bash
$ sudo dnf install -y hello-bash
$ hello-bash
Hello World

$ sudo dnf remove -y hello-bash # Uninstall the package
```

### Automatic Builds with GitHub Actions

This project uses a GitHub Actions workflow to trigger automatic COPR builds when new tags are pushed to the `bash-multifiles` branch.

The workflow `.github/workflows/trigger-copr-build.yml` calls the COPR custom webhook on every tag push.

**Setup:**

1. Go to your COPR project integrations page: <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash/integrations/>
2. Click on "Custom webhook" and copy the webhook URL
3. Update the URL in `.github/workflows/trigger-copr-build.yml`

**Trigger a build:**

Run the release script:

```bash
./release.sh v1.0.3
```

This command will:

1. Update the version in `rpm/hello-bash.spec`
2. Update the version in `hello-bash` script
3. Create a git commit
4. Create a git tag

After running the command, push the changes to trigger the build:

```bash
git push origin bash --tags
```

The build starts immediately (typically within 30 seconds) when the tag is pushed.

**Important Notes:**
- The workflow only runs for tags pushed to the `bash` branch
- Tags must follow semver format (e.g., `v1.0.0`, `v2.1.3`)
- The tag prefix `v` is automatically stripped for the RPM version
- Monitor build status at: <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash>
