#!/bin/bash

# Update system
apt-get update -y
apt-get upgrade -y

# Install dependencies
apt-get install -y curl openssh-server ca-certificates tzdata perl

# Fix bad OS detection (your earlier issue)
echo "UBUNTU_CODENAME=jammy" >> /etc/os-release

# Install GitLab repo
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

# Install GitLab
EXTERNAL_URL="http://$(curl -s ifconfig.me)" apt-get install -y gitlab-ce