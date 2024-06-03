#!/bin/bash

set -e

# Install Python dependencies using apt
apt-get update && apt-get install -y python3 py3-pip # Install Python 3 and pip for Python 3

# Install Python dependencies using pip
if [ -n "$1" ]; then
  echo "Installing Python dependencies: $1"
  pip3 install "$1"
  echo "::set-output name=python_dependencies_installed::true"
else
  echo "No Python dependencies specified."
  echo "::set-output name=python_dependencies_installed::false"
fi
