#!/bin/bash
set -e

# Install Python and pip
apk add --no-cache python3 py3-pip

# Install Python dependencies using pip
if [ -n "$1" ]; then
  echo "Installing Python dependencies: $1"
  pip3 install $1
  echo "::set-output name=python_dependencies_installed::true"
else
  echo "No Python dependencies specified."
  echo "::set-output name=python_dependencies_installed::false"
fi
