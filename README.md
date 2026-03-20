# Hello Golang

A simple "Hello World" Golang application packaged as an RPM for Fedora COPR.

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
RPM: ./rpmbuild/RPMS/x86_64/
```

The resulting RPM will be available in `./rpmbuild/RPMS/x86_64/`.

Next, you can install the package with:

```bash
$ sudo rpm -ivh ./rpmbuild/RPMS/

...

$ rehash
$ hello-golang  # Test the installed script
Hello world! Version: 1.0.0

$ sudo rpm --erase hello-golang # Uninstall the package
```
