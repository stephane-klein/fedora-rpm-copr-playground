# hello-bash

A simple "Hello World" Bash script packaged as an RPM, automatically built with Packit and distributed via Fedora COPR.

Unlike the [`bash`](https://github.com/stephane-klein/fedora-rpm-copr-playground/tree/bash) branch which contains only one file, this variant groups 3 files together.

You are on the `bash-packit` Git branch. See the [main branch](https://github.com/stephane-klein/fedora-rpm-copr-playground) for a complete project overview.

## Prerequisites

This project has been tested on **Fedora 42**.

### Required tools

```bash
# Install Mise (version manager)
$ curl https://mise.run | sh

# Install project dependencies
$ mise install
```

- `mise` - Version manager for development tools
- `gh` - GitHub CLI (installed automatically via Mise)
- `copr-cli` - Command-line client for Copr (required for initial setup)

## Building locally

Optional tools for local builds only:

```bash
$ sudo dnf install rpm-build rpmdevtools rpmlint
```

- `rpm-build` - Tools for building RPM packages
- `rpmdevtools` - Development utilities for RPM packaging
- `rpmlint` - Linter for checking RPM spec files

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

## Automatic Builds with Packit

Before using Packit, you need to initialize the Copr project once:

1. Configure `copr-cli` with your credentials:
   ```bash
   $ copr-cli login
   ```

2. Create the Copr project with Packit permissions:
   ```bash
   $ ./init-copr-project.sh
   ```

3. Enable Packit on your repository:
   - Go to [Packit Service](https://github.com/apps/packit-as-a-service)
   - Install the app on this repository

Once these steps are complete, Packit will automatically build new releases.

To create a release, execute:

```bash
$ ./release.sh v1.0.3
```

This script will:

1. Update the version in `rpm/hello-bash.spec`
2. Update the version in `hello-bash` script
3. Create a git commit and tag
4. Push changes to GitHub
5. Create a GitHub Release (which triggers the Copr build)

Next, Packit detects the release and builds the RPM in Copr.

Once the build completes, install the built package from COPR with:

```bash
$ sudo dnf copr enable stephaneklein/hello-bash-packit
$ sudo dnf install -y hello-bash
$ hello-bash
Hello World

$ sudo dnf remove -y hello-bash # Uninstall the package
```

Monitor builds at:
- [Packit Dashboard](https://dashboard.packit.dev/)
- [Copr project](https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-bash-packit/)
