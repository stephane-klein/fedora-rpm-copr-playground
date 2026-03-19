# hello-bash

A simple "Hello World" Bash script packaged as an RPM for Fedora COPR.

You are on the `bash` Git branch. See the [main branch](https://github.com/stephane-klein/fedora-rpm-copr-playground) for a complete project overview.

## Prerequisites

This project has been tested on **Fedora 42**.

To build the RPM package, you need to install the following dependencies:

```bash
$ sudo dnf install rpm-build rpmdevtools rpmlint
```

- `rpm-build` - Tools for building RPM packages
- `rpmdevtools` - Development utilities for RPM packaging
- `rpmlint` - Linter for checking RPM spec files (optional but recommended)

## Building

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
