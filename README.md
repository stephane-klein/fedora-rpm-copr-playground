# Hello Golang

A simple "Hello World" Golang application packaged as an RPM for Fedora COPR.

You are on the `golang` Git branch. See the [main branch](https://github.com/stephane-klein/fedora-rpm-copr-playground) for a complete project overview.

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
RPM: ./rpmbuild/RPMS/x86_64/
```

The resulting RPM will be available in `./rpmbuild/RPMS/x86_64/`.

Next, you can install the package with:

```bash
$ sudo rpm -ivh ./rpmbuild/RPMS/x86_64/hello-golang-1.0.0-1.fc42.x86_64.rpm

...

$ rehash
$ hello-golang  # Test the installed binary
Hello world! Version: 1.0.0

$ sudo rpm --erase hello-golang # Uninstall the package
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

Run the initialization script to create the `hello-golang` project in Copr:

```bash
$ ./init-copr-project.sh
New project was successfully created: https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-golang/
Create or edit operation was successful.

Project 'hello-golang' created with SCM package configured!

...
```

This will create a public project named `hello-golang` with the Fedora 42 chroot enabled.

Your project will be available at: `https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-golang`

### Building in Copr (manual)

```bash
$ ./build-copr.sh
Building in Copr...
Created builds: https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-golang
```

The resulting RPM will be available at <https://copr.fedorainfracloud.org/coprs/stephaneklein/hello-golang/>.

### Install the Copr package

Install COPR package:

```bash
$ sudo dnf copr enable -y stephaneklein/hello-golang
$ sudo dnf install -y hello-golang
$ hello-golang
Hello world! Version: 1.0.0

$ sudo dnf remove -y hello-golang # Uninstall the package
```

