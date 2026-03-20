#!/bin/bash
set -e

VERSION="1.0.8"

echo "Building Go binary..."
go build -ldflags "-X main.version=${VERSION}" -o hello-golang

echo "Build complete: ./hello-golang"
