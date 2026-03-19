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

1. Log in to [Copr](https://copr.fp.o) with your Fedora Account System (FAS) credentials.
2. Generate an API token:
   - Go to your [Account Settings](https://copr.fp.o/api)
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
```

This will create a public project named `hello-bash` with the Fedora 42 chroot enabled.

Your project will be available at: `https://copr.fp.o/@stephaneklein/hello-bash`

### Building in Copr

```bash
$ ./build-copr.sh
Building in Copr...
Created builds: https://copr.fp.o/@stephane-klein/hello-bash
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
