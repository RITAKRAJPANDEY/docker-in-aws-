#!/bin/bash

set -e #Exit immediately if any command fails

echo "Updating apt package index"

apt-get update -y

echo "setting up Docker keyring..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSl https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/doecker.asc

echo "adding docker repository ..."

UBUNTU_CODENAME=$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
ARCH=$(dpkg --print-architecture)

tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${UBUNTU_CODENAME}
Components: stable
Architectures: ${ARCH}
Signed-By: /etc/apt/keyrings/docker.asc
EOF

echo "Installing Docker packages..."
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Checking Docker status..."
systemctl is-active --quiet docker && echo "Docker is running successfully!"