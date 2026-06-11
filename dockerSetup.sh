#!/usr/bin/env bash

set -euo pipefail

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  echo "Run this helper with sudo: sudo ./dockerSetup.sh" >&2
  exit 1
fi

echo "Starting Docker setup for this Ubuntu instance..."
./install_docker.sh

echo "Docker setup completed."
echo "Verify with: docker --version && docker run --rm hello-world"