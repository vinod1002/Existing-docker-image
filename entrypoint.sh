#!/bin/bash

set -e

# Update package lists
apt-get update

# Install Python dependencies using apt
apt-get install -y python3 py3-pip # Install Python 3 and pip for Python 3

# Install Python dependencies using pip
if [ -n "$1" ]; then
  echo "Installing Python dependencies: $1"
  pip3 install "$1"  # Wrap package names in double quotes
  echo "::set-output name=python-dependencies-installed::true"
else
  echo "No Python dependencies specified."
  echo "::set-output name=python-dependencies-installed::false"
fi
