# Fedora rpm COPR playground

The purpose of this playground is to learn how to create a community (unofficial) [RPM](https://notes.sklein.xyz/rpm/) package on [Fedora COPR](https://notes.sklein.xyz/Fedora%20COPR/).

In this playground, I want to create a package for:

- A simple "Hello World" *Bash* script
- A simple "Hello World" *Golang* script
- A simple "Hello World" *Bash* script with 3 files

Todo list:

- [x] For the Bash project
  - [x] Document how to build an RPM package locally
  - [x] Document how to build an RPM package locally and push it to Fedora COPR
  - [x] Document how to automate package building by Fedora COPR directly from the source code of a GitHub repository
- [x] For the Golang project
  - [x] Document how to build an RPM package locally
  - [x] Document how to build an RPM package locally and push it to Fedora COPR
  - [x] Document how to automate package building by Fedora COPR directly from the source code of a GitHub repository
- [x] For the Bash project with 3 files
  - [x] Document how to build an RPM package locally
  - [x] Document how to build an RPM package locally and push it to Fedora COPR
  - [x] Document how to automate package building by Fedora COPR directly from the source code of a GitHub repository

## Working with Package Branches

This repository uses separate branches for each package:

- **[bash](https://github.com/stephane-klein/fedora-rpm-copr-playground/tree/bash)** - RPM package for a Bash script
- **[golang](https://github.com/stephane-klein/fedora-rpm-copr-playground/tree/golang)** - RPM package for a Golang application
- **[bash](https://github.com/stephane-klein/fedora-rpm-copr-playground/tree/bash-multifiles)** - RPM package for a Bash script with 3 files

To work on multiple branches simultaneously, use Git worktrees:

```bash
$ ./checkout-branches-in-worktree.sh
```

This creates:
- `.worktree/bash/` - working copy of the `bash` branch
- `.worktree/golang/` - working copy of the `golang` branch
- `.worktree/bash-multifiles/` - working copy of the `bash-multifiles` branch
