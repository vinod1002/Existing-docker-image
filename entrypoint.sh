#!/bin/sh

set -e

# Install Python dependencies using apk
apk update
apk add python3 py3-pip # Install Python 3 and pip for Python 3

# Install Python dependencies using pip
if [ -n "$1" ]; then
  echo "Installing Python dependencies: $1"
  pip3 install "$1"
  echo "::set-output name=python-dependencies-installed::true"
else
  echo "No Python dependencies specified."
  echo "::set-output name=python-dependencies-installed::false"
fi
