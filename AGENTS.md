# Project Structure

This repository uses a branch-based organization for pedagogical purposes:

- `main` - Documentation and entry point
- `bash` - Minimalist RPM package for a Bash script
- `golang` - Minimalist RPM package for a Golang application

## Workflow

Each package branch (`bash`, `golang`) is self-contained with:
- Source code
- `.spec` file for RPM build
- Minimal documentation

## Worktrees

The `.worktree/` folder contains the source code of the branches:
- `.worktree/bash/` - Content of the `bash` branch
- `.worktree/golang/` - Content of the `golang` branch

This allows easy access to the code of other branches without switching Git branches.

## Development Notes

When working on the `golang` branch, it is possible to draw inspiration from the work done in the `bash` branch (RPM spec structure, build scripts, etc.).

All file contents must be in English.

## Build Preferences

Prefer simple bash scripts over Makefiles for build automation. The only exception is the `.copr/` directory, where a Makefile is required.

