#!/bin/bash

set -e

VERSION="1.0.0"

go build -ldflags "-X main.version=${VERSION}" -o hello-golang
